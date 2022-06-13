Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8516C3F2D4
	for <webhook@archiver.kernel.org>; Mon, 13 Jun 2022 08:52:35 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web08.3657.1655110351292744139
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Jun 2022 01:52:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=gdnJ9pUs;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1655110349; i=@fujitsu.com;
	bh=h3/JRpOP+NjaBMmg//BR0/qFdGwH2flOdTcYmQEykEY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=gdnJ9pUsUoZC08lRGhHIToCcJ7n246i5zoZqyWC0SXZUnXwg/Fgjr6sa8ZesAFQVi
	 Hwm6kEgnixwG8riJp5VXha4g04zJnLIQZ27/XGOLhXOgSkA58HgyCsJxJycYsu+oUn
	 lDsIuq/a3QQI0p9qSsK1ildqeu9NQwVDN02T/bi0A38qE0ETZULS0/cjioFP4cl5U6
	 4wwQYAHFKEtnrk4PBOOVC8RoovkVteN7IXmsIUMAN0ct20RpGnZn3PMaGshYNx3i9I
	 BHtX3CyygJAk5fkfYwPBIi2ttfiPKhAsWGk6Tf809nTk/4LJW1PgWPRON/8cVKTREk
	 KpzZ01ZvpifLw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrHIsWRWlGSWpSXmKPExsViZ8ORqHv217I
  kg+WVFhcPL2V2YPQ4t3EFYwBjFGtmXlJ+RQJrxpG3N1gLFklW3J62k7GBcZ1YFyMXh5DAE0aJ
  9d8OMkI4F5gkLj29zQbh7GGUeHn2JpDDycEmoCYx/dYNVhBbREBfYunsPcwgNrOAisSL3z3sI
  LawgIfEuxUHmUBsFgFViZ+9D8B6eQWcJO4/PQ8WlxBQkJjy8D0zRFxQ4uTMJywQcyQkDr54wQ
  xRoygx+3IzC4RdITFjxjY2CFtN4uq5TcwTGPlnIWmfhaR9ASPTKkarpKLM9IyS3MTMHF1DAwN
  dQ0NTXWNdQ0tLvcQq3US91FLd8tTiEl1DvcTyYr3U4mK94src5JwUvbzUkk2MwKBMKWY+voNx
  St9PvUOMkhxMSqK8e78sSxLiS8pPqcxILM6ILyrNSS0+xCjDwaEkwfvoK1BOsCg1PbUiLTMHG
  CEwaQkOHiURXr/vQGne4oLE3OLMdIjUKUZdjplf2w4wC7Hk5eelSonz2vwEKhIAKcoozYMbAY
  vWS4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJWEeT+CTOHJzCuB2/QK6AgmoCM2nlwCckRJIkJ
  KqoFJ+N3xheXfW8PlFzLt/OfTE/FB+bHI3OB74V8XntUMbRItcb+8f+vrg5tb97v0Cvxre7bx
  VPrK4NwDnSdKixPvBs8W/F7a+3BlfmZBeYOIkEtLcGDcrn8rz101e3Hp58/7W8JaamIMlHKKN
  Dm4L95b8sPoiNBkRzUx26VBbsk9U6df3jpVgG3N5RsGQRXuryd/ey477ciiv3fYbCfNTN9v//
  e88HWWULO7a9XjtZqnPOP6VtnN4vn7Ru3Hz0ofXkmzb70cxM3AZ7blW3OyM9/ugFZm5yOtBx/
  zMZ/KF33eKsvevmKrCRu7cszKWatKHhSaT7q78abV41tzj603/TurgLdxn4T/noM1U6xL9dyE
  lFiKMxINtZiLihMB9YFrRVEDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-587.messagelabs.com!1655110348!279408!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19867 invoked from network); 13 Jun 2022 08:52:28 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-9.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 13 Jun 2022 08:52:28 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 7A05110019C
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Jun 2022 09:52:28 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 6C1A110004E
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Jun 2022 09:52:28 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 13 Jun 2022 09:52:10 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-webserver] [PATCH] apache2: upgrade 2.4.53 -> 2.4.54
Date: Mon, 13 Jun 2022 16:51:51 +0800
Message-ID: <1655110315-25174-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Jun 2022 08:52:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97480

0004-apache2-log-the-SELinux-context-at-startup.patch
refresh for new version.

Changelog:
https://downloads.apache.org/httpd/CHANGES_2.4.54

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-apache2-log-the-SELinux-context-at-startup.patch | 12 +++++-------
 .../apache2/{apache2_2.4.53.bb => apache2_2.4.54.bb} |  2 +-
 2 files changed, 6 insertions(+), 8 deletions(-)
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.53.bb => apache2_2.4.54.bb} (99%)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2/0004-apache2-log-the-SELinux-context-at-startup.patch b/meta-webserver/recipes-httpd/apache2/apache2/0004-apache2-log-the-SELinux-context-at-startup.patch
index 5d8291968..3b080f54f 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2/0004-apache2-log-the-SELinux-context-at-startup.patch
+++ b/meta-webserver/recipes-httpd/apache2/apache2/0004-apache2-log-the-SELinux-context-at-startup.patch
@@ -1,4 +1,4 @@
-From 37699e9be04d83c5923644e298f400e077f76e85 Mon Sep 17 00:00:00 2001
+From e47cc405eadcbe37a579c375e824e20a5c53bfad Mon Sep 17 00:00:00 2001
 From: Paul Eggleton <paul.eggleton@linux.intel.com>
 Date: Tue, 17 Jul 2012 11:27:39 +0100
 Subject: [PATCH] Log the SELinux context at startup.
@@ -8,13 +8,14 @@ Log the SELinux context at startup.
 Upstream-Status: Inappropriate [other]
 
 Note: unlikely to be any interest in this upstream
+
 ---
  configure.in  |  5 +++++
  server/core.c | 26 ++++++++++++++++++++++++++
  2 files changed, 31 insertions(+)
 
 diff --git a/configure.in b/configure.in
-index c799aec..76811e7 100644
+index ea6cec3..92b74b7 100644
 --- a/configure.in
 +++ b/configure.in
 @@ -491,6 +491,11 @@ getloadavg
@@ -30,7 +31,7 @@ index c799aec..76811e7 100644
  [AC_TRY_RUN(#define _GNU_SOURCE
  #include <unistd.h>
 diff --git a/server/core.c b/server/core.c
-index 3020090..8fef5fd 100644
+index 4da7209..d3ca25b 100644
 --- a/server/core.c
 +++ b/server/core.c
 @@ -65,6 +65,10 @@
@@ -43,7 +44,7 @@ index 3020090..8fef5fd 100644
 +
  /* LimitRequestBody handling */
  #define AP_LIMIT_REQ_BODY_UNSET         ((apr_off_t) -1)
- #define AP_DEFAULT_LIMIT_REQ_BODY       ((apr_off_t) 0)
+ #define AP_DEFAULT_LIMIT_REQ_BODY       ((apr_off_t) 1<<30) /* 1GB */
 @@ -5126,6 +5130,28 @@ static int core_post_config(apr_pool_t *pconf, apr_pool_t *plog, apr_pool_t *pte
      }
  #endif
@@ -73,6 +74,3 @@ index 3020090..8fef5fd 100644
      return OK;
  }
  
--- 
-2.25.1
-
diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.53.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.54.bb
similarity index 99%
rename from meta-webserver/recipes-httpd/apache2/apache2_2.4.53.bb
rename to meta-webserver/recipes-httpd/apache2/apache2_2.4.54.bb
index 8413f5379..4b0ed2f62 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.53.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.54.bb
@@ -26,7 +26,7 @@ SRC_URI:append:class-target = " \
            "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bddeddfac80b2c9a882241d008bb41c3"
-SRC_URI[sha256sum] = "d0bbd1121a57b5f2a6ff92d7b96f8050c5a45d3f14db118f64979d525858db63"
+SRC_URI[sha256sum] = "eb397feeefccaf254f8d45de3768d9d68e8e73851c49afd5b7176d1ecf80c340"
 
 S = "${WORKDIR}/httpd-${PV}"
 
-- 
2.25.1


