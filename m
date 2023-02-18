Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEFEAC64ED6
	for <webhook@archiver.kernel.org>; Sat, 18 Feb 2023 06:38:19 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web10.7864.1676702297856486101
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Feb 2023 22:38:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=mUZRu0sJ;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1676702295; i=@fujitsu.com;
	bh=VXE/VQSOLkWeGOlISWZVZzX0IeIEZbfv8ozWAqEBsHw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=mUZRu0sJK4RWFJUQGk2d6flyQzDMrgYfhxX7PZrJ1tJat58TywMKl/gMZzYfigG/w
	 ZnFOKrEW5qw8N96GRwz/zjgUb8D/DZsoXhVh9Yva37xQDE91FSrGzYS3JG5I3Yxfm5
	 N4/PCTjSs4nxVf38aE1EEMlS3FsZsDFaRkvAtIh1Aekw2i5oGdX4ehB2QqyjAHLF9K
	 9Roe/ChgAnSJjIthch8sLS4wsKsqtodD2L0EaETk3/Izh9RFumYkFmL2cTTQFzhUdq
	 L2Vr6BwIaI/1FdDxFb527x8lfaKrbgX3Rab5TvxfUAL8Q9OsRhSl7geow3z1Mxf7AE
	 1j0BaDF8eIEew==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRWlGSWpSXmKPExsViZ8ORqBtW9CH
  Z4PJ9HYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPbzqvsBXs4Kza//8LcwHiYo4uRi0NI4Amj
  xIqXTxghnBtMEpd/z2aCcPYySjxcfJy5i5GTg01ASuLG/f9sILaIgL7E0tl7wOLMAioSL373s
  IPYwgJuEs1XpgHZHBwsAqoSTyblgYR5BZwkbl17DdYqIaAgMeXhe7BWTgFniSm/njCB2EJANQ
  fntjND1AtKnJz5hAVivITEwRcvmCF6FSVmX25mgbArJVo//IKy1SSuntvEPIFRcBaS9llI2hc
  wMq1iNC1OLSpLLdI11ksqykzPKMlNzMzRS6zSTdRLLdUtTy0u0TXUSywv1kstLtYrrsxNzknR
  y0st2cQIDN2UYua+HYxfe//qHWKU5GBSEuX9vO19shBfUn5KZUZicUZ8UWlOavEhRhkODiUJ3
  p8FH5KFBItS01Mr0jJzgHEEk5bg4FES4T2dDpTmLS5IzC3OTIdInWJUlBLnZUgFSgiAJDJK8+
  DaYLF7iVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5Iw71KQ7TyZeSVw018BLWYCWryA+S3I4pJ
  EhJRUA1P0dK0S00rxjI5dwu9N79tKLlo062iX8s+SdTtuPT1qLnpxe6RBQ9lODsuHQtvF+qP/
  Vl+rKcj9k9DUYhm3zdFYiXlJVmDLQvOoe3n/j237tf6Qnt3fj992Hyk/23XVWyirie/L/UZHn
  vO7fSr/SVSkHdg6be2KQ0wVt5Jy5E4sPLfPN33bqs9nbnp+NLe/ud3TbN+vycFLP2zJSORL26
  jkXvfyeiDv0osq/9xZpuWeT3tYOOvZYrXS+X8+O8zY5l37b+umzWE7r8s+D/0q2c9W62ab2ba
  IPef6cR+v9gcRJs//CqfJHN45UWZfsLjAzq61Xy2nLIl74n3LNcuMzVTl1N/SLimWefVaz2fE
  dGsqsRRnJBpqMRcVJwIAu4CL21gDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-10.tower-591.messagelabs.com!1676702294!307551!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15039 invoked from network); 18 Feb 2023 06:38:14 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-10.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 18 Feb 2023 06:38:14 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 597FC100182
	for <openembedded-devel@lists.openembedded.org>; Sat, 18 Feb 2023 06:38:14 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 4BE16100191
	for <openembedded-devel@lists.openembedded.org>; Sat, 18 Feb 2023 06:38:14 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Sat, 18 Feb 2023 06:38:12 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] libtdb: upgrade 1.4.7 -> 1.4.8
Date: Sat, 18 Feb 2023 14:37:52 +0800
Message-ID: <1676702273-30706-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1676702273-30706-1-git-send-email-wangmy@fujitsu.com>
References: <1676702273-30706-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 18 Feb 2023 06:38:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101132

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libtdb/{libtdb_1.4.7.bb => libtdb_1.4.8.bb}                | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-networking/recipes-support/libtdb/{libtdb_1.4.7.bb => libtdb_1.4.8.bb} (92%)

diff --git a/meta-networking/recipes-support/libtdb/libtdb_1.4.7.bb b/meta-networking/recipes-support/libtdb/libtdb_1.4.8.bb
similarity index 92%
rename from meta-networking/recipes-support/libtdb/libtdb_1.4.7.bb
rename to meta-networking/recipes-support/libtdb/libtdb_1.4.8.bb
index d4c4f1c37..5dc87bd91 100644
--- a/meta-networking/recipes-support/libtdb/libtdb_1.4.7.bb
+++ b/meta-networking/recipes-support/libtdb/libtdb_1.4.8.bb
@@ -13,8 +13,7 @@ SRC_URI = "https://samba.org/ftp/tdb/tdb-${PV}.tar.gz \
            file://0002-Fix-pyext_PATTERN-for-cross-compilation.patch \
 "
 
-SRC_URI[md5sum] = "bc27d5b20c7f013305c40b3bced43b3a"
-SRC_URI[sha256sum] = "a4fb168def533f31ff2c07f7d9844bb3131e6799f094ebe77d0380adc987c20e"
+SRC_URI[sha256sum] = "8434c9c857d13ce3fa8466f75601f25c3693676b36919f159e0ad6121baf5ce8"
 
 PACKAGECONFIG ??= "\
     ${@bb.utils.filter('DISTRO_FEATURES', 'acl', d)} \
-- 
2.34.1


