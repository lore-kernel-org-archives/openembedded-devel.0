Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD188C761A6
	for <webhook@archiver.kernel.org>; Mon,  3 Apr 2023 08:59:43 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web11.65475.1680512375378939835
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Apr 2023 01:59:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=R7xs/+R+;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1680512373; i=@fujitsu.com;
	bh=s/0xmQ8++p3kKRY2L36nj6PxXfXj6XZB26NbIl1DEMc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=R7xs/+R+32Rbo0qK1w0CkVil5kYGBLEPRITGPUfW5jM8Rda20uZYECJ2xmWgKOpep
	 gQiEyKubb5a7epSm8h3aPjqFbcCVyhQ2zte1dg86O+yShcRkMUYIKLEUii29m0LVu5
	 AmTcW45MWHceRM4PGK3zOGBAEnZyo7AHtLqIOPziJxZJn39ZmeGmpPxebK4gqW73pO
	 aD82YZ8OuBNwK5ZKkeqVu32WOOXVK4raL3WqMM1Q1q/a+4wIBRw0sC33P8Cdz/BNPv
	 WK3kKR9DxgqenRfaAXWqJWVt8+nWu7Cm604FqeaQ5Nz74RSAsZi1u6QlTgklFlIacz
	 iVrgziFDnop2g==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrMIsWRWlGSWpSXmKPExsViZ8OxWbdkqla
  KQfMsdYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNeP2qVlsBau5K26dns7UwPids4uRi0NI4CGj
  xN/vv9ggnCtMElPeNbFCOLsZJdbvuwCU4eRgE5CSuHH/P5gtIqAvsXT2HmYQm1lAReLF7x52E
  FtYwEHi7sVZrCA2C1B82okJYDavgJPEqlWtTCC2hICCxJSH78F6OQWcJSb3PAezhYBq+r4+Z4
  eoF5Q4OfMJC8R8CYmDL14wQ/QqSsy+3MwCYVdINE4/BDVTTeLquU3MExgFZyFpn4WkfQEj0yp
  Gs+LUorLUIl1jvaSizPSMktzEzBy9xCrdRL3UUt28/KKSDF1DvcTyYr3U4mK94src5JwUvbzU
  kk2MwPBNKU4U2sH4rfev3iFGSQ4mJVFewXqtFCG+pPyUyozE4oz4otKc1OJDjDIcHEoSvAcnA
  OUEi1LTUyvSMnOAsQSTluDgURLhDe4FSvMWFyTmFmemQ6ROMepyXL1yZS+zEEtefl6qlDiv3x
  SgIgGQoozSPLgRsLi+xCgrJczLyMDAIMRTkFqUm1mCKv+KUZyDUUmY99VEoCk8mXklcJteAR3
  BBHREa5QGyBEliQgpqQamMgezmulnwk7MXCieL5Qp5OWTm6LkwHb5m4Kr44YfVxZe29/8SfkW
  25dbVzhzrvyQPfDjUoT2dvl5D8s+9R9drSy0p+CN69MVQsUvTDc/O2Bjsp5F5PPvr09nJHqYv
  7/U08CoKcV7dF25cmn7GQfhVa8Z08uVf/PGcG/TtvKpSL+w2OZqz7fJR80D1mfz3GK8wJ0ade
  D3q31S1bfW8NVINl+dWzAx6/brUydNTiyYtPSzNFOvLGsZE9MZzwjVr6w5oXHJ607f1l7htoy
  3r3+exL9eDqnPE9cxqU0sa48VDzz5IWi69rX7HNEdt+wc7zi/yyif+2n9u301H1uD/fMe7zy5
  KCZo55Wgev6b7au7lFiKMxINtZiLihMBaOQo5mYDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-732.messagelabs.com!1680512372!450570!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 4491 invoked from network); 3 Apr 2023 08:59:32 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-4.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 3 Apr 2023 08:59:32 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 1119616E
	for <openembedded-devel@lists.openembedded.org>; Mon,  3 Apr 2023 09:59:32 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id F2AE4162
	for <openembedded-devel@lists.openembedded.org>; Mon,  3 Apr 2023 09:59:31 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 3 Apr 2023 09:59:30 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] libdeflate: upgrade 1.17 -> 1.18
Date: Mon, 3 Apr 2023 16:58:43 +0800
Message-ID: <1680512323-30344-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1680512323-30344-1-git-send-email-wangmy@fujitsu.com>
References: <1680512323-30344-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Apr 2023 08:59:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101896

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* Fixed a bug where the build type didn't default to "Release" when using
  CMake 3.10 or earlier.

* Fixed a bug where some optimized code wasn't used when building with
  Clang 15 or later (x86), or with Clang 16 or later (aarch64).

* Fixed build errors with some architecture and compiler combos:
  * aarch64 with Clang 16
  * armv6kz or armv7e-m with gcc
  * armhf with gcc (on Debian only)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libdeflate/{libdeflate_1.17.bb => libdeflate_1.18.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/libdeflate/{libdeflate_1.17.bb => libdeflate_1.18.bb} (88%)

diff --git a/meta-oe/recipes-extended/libdeflate/libdeflate_1.17.bb b/meta-oe/recipes-extended/libdeflate/libdeflate_1.18.bb
similarity index 88%
rename from meta-oe/recipes-extended/libdeflate/libdeflate_1.17.bb
rename to meta-oe/recipes-extended/libdeflate/libdeflate_1.18.bb
index 9cd6baa5b..b1c337115 100644
--- a/meta-oe/recipes-extended/libdeflate/libdeflate_1.17.bb
+++ b/meta-oe/recipes-extended/libdeflate/libdeflate_1.18.bb
@@ -9,7 +9,7 @@ DEPENDS += "gzip zlib"
 SRC_URI = "git://github.com/ebiggers/libdeflate.git;protocol=https;branch=master"
 
 S = "${WORKDIR}/git"
-SRCREV = "bd925ae68e99f65d69f20181cb845aaba5c8f098"
+SRCREV = "495fee110ebb48a5eb63b75fd67e42b2955871e2"
 
 inherit cmake pkgconfig
 
-- 
2.34.1


