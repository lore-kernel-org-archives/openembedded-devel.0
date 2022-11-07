Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E480C433FE
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 08:36:50 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web09.1271.1667810208834755541
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Nov 2022 00:36:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=EeT2dN3y;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1667810207; i=@fujitsu.com;
	bh=icIts8oYtqNRP3p7G0wOzfgfrw2D1bMEHf1UUkkQysk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=EeT2dN3yHM3Xc9wOpVsBg2YH+F/nsSWjYSnBKZ7wVa8uyqU5MDBhf0SV+8h5mPCl3
	 y3KI0+HpHlIO8FlKIb/+nxkrIols2kBxPz0ypfNACYYQKAPxhSQQwT9tpkvOXTWSkO
	 Qd+erq3qbhAk20NL7Fxondgz4QU5u2CRuj1UqAK4fkz5n4X2wueYINgMKNjVpLkSZC
	 H3DoBUu6dY0LK21zzzux6HB0udl6OcCYhsADMUUNuXamLLu1sGdAnCtiA6b8c+aZbS
	 9zUFySijygvATC4XRpz9Lfvsknt9ZtvWiQ17uBpM/bCWf3xVh4Umw7I37G7qi0erAg
	 6aEm8V/zRTGRQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrMIsWRWlGSWpSXmKPExsViZ8ORqDvvcEa
  yQfsMZYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePx3fVsBZe5KjbMecHUwPiEs4uRi0NI4Amj
  RH/LWWYI5zqTxKn+2+wQzm5GicU7drF0MXJysAlISdy4/58NxBYR0JdYOnsPM4jNLKAi8eJ3D
  zuILSzgJ7GyfRlYnAUo3vW3gRHE5hVwkji68BZYjYSAgsSUh+/BajgFnCXObd0DNlMIqObm8+
  nsEPWCEidnPmGBmC8hcfDFC2aIXkWJ2ZebWSDsColZs9qYIGw1iavnNjFPYBSchaR9FpL2BYx
  MqxjNilOLylKLdA0t9JKKMtMzSnITM3P0Eqt0E/VSS3XLU4tLdA31EsuL9VKLi/WKK3OTc1L0
  8lJLNjECwzelmOXBDsYdy/7oHWKU5GBSEuX9vTwjWYgvKT+lMiOxOCO+qDQntfgQowwHh5IE7
  42NQDnBotT01Iq0zBxgLMGkJTh4lER42YHxJMRbXJCYW5yZDpE6xajLMfNr2wFmIZa8/LxUKX
  Hea7uBigRAijJK8+BGwOL6EqOslDAvIwMDgxBPQWpRbmYJqvwrRnEORiVh3shDQFN4MvNK4Da
  9AjqCCeiI6oI0kCNKEhFSUg1M7C4658o3ftr1fml1cG99yX7jO+WLn04/f4lVb4WTgs4mr/pj
  L5sXfotf+bVLu8L2gnz6kQeKWgv0az4GXuM9f7Y0d7+JfbvmDN5XK1oONB0LvDstSXnr8X+fJ
  TetenS6dFqWqeXs/t/Fq91y117YuyT30v9NJxfLlh13XOOwuetEWP+sd4eUzU+X5NWeM1pWN/
  /ZxavfDW17ZK/mftW+vmFeUcAtGcHNNZeXvFecVTkhktVexLH+t0nF0tfTEnI/NWxMe9QUpVO
  a9mLOtg98Uyw0TRf+2PvapH/jOZnE5bxcoluuT456Ojvlr3On7svc5q0+PgbmaQ3rDln+WHVy
  yeomoRlJVesUY0SsryacW6jEUpyRaKjFXFScCAA/AMIiZgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-591.messagelabs.com!1667810206!249617!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23848 invoked from network); 7 Nov 2022 08:36:46 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-8.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 7 Nov 2022 08:36:46 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 33B7C10019A
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Nov 2022 08:36:46 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 27CD7100182
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Nov 2022 08:36:46 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 7 Nov 2022 08:36:44 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-httplib2: upgrade 0.20.4 -> 0.21.0
Date: Mon, 7 Nov 2022 16:36:18 +0800
Message-ID: <1667810179-31041-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1667810179-31041-1-git-send-email-wangmy@fujitsu.com>
References: <1667810179-31041-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Nov 2022 08:36:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99465

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
 http: `Content-Encoding: deflate` must accept zlib encapsulation
 https://github.com/httplib2/httplib2/pull/230
 Begin support and CI against CPython 3.10 and 3.11.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-httplib2_0.20.4.bb => python3-httplib2_0.21.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-httplib2_0.20.4.bb => python3-httplib2_0.21.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-httplib2_0.20.4.bb b/meta-python/recipes-devtools/python/python3-httplib2_0.21.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-httplib2_0.20.4.bb
rename to meta-python/recipes-devtools/python/python3-httplib2_0.21.0.bb
index 52fd88ddf..3e285d9ae 100644
--- a/meta-python/recipes-devtools/python/python3-httplib2_0.20.4.bb
+++ b/meta-python/recipes-devtools/python/python3-httplib2_0.21.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=56e5e931172b6164b62dc7c4aba6c8cf"
 
-SRC_URI[sha256sum] = "58a98e45b4b1a48273073f905d2961666ecf0fbac4250ea5b47aef259eb5c585"
+SRC_URI[sha256sum] = "fc144f091c7286b82bec71bdbd9b27323ba709cc612568d3000893bfd9cb4b34"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.25.1


