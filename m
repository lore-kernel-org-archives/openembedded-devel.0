Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83A41C00528
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 04:26:16 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.681.1689654362314687023
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Jul 2023 21:26:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="113108740"
X-IronPort-AV: E=Sophos;i="6.01,213,1684767600"; 
   d="scan'208";a="113108740"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2023 13:26:10 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id C1399D29EA
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 13:26:08 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id F3ED1D5C25
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 13:26:07 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 83D57200854E2;
	Tue, 18 Jul 2023 13:26:07 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-webserver] [PATCH] nginx: upgrade 1.24.0 -> 1.25.1
Date: Tue, 18 Jul 2023 12:25:21 +0800
Message-Id: <1689654348-30702-19-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1689654348-30702-1-git-send-email-wangmy@fujitsu.com>
References: <1689654348-30702-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27758.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27758.004
X-TMASE-Result: 10--7.448500-10.000000
X-TMASE-MatchedRID: u4ys6248rQyjz0nOeth/yUIIxwDaU5mr0bdjqKOoG3dezg+6N0+qc+3n
	m6pwleuhGpsWkMnyLUpNZAP7qzzSA0OlCbDfmPVyEhGH3CRdKUUnhzAhgvoq5xcL2nROEpDh6fv
	Jr/5Xm+PCI5ZCQy3Br8Yoh/qEF/tVWuiZFrpf1Hy/mux8PsfamT/FEHo4advawLkNMQzGl5B+Kr
	WCPbERPznpYPqS6jzxL/8yUNGojyYzWRkhrzmyQQrcxrzwsv5urixttRG+E/OBbptjxI6rdaPFj
	JEFr+olwXCBO/GKkVqOhzOa6g8KraigdYlXvaLpP7bl/Ag7sWKefCBRp2swxxdKltvDxTGaO7Nq
	rkI2RSc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 04:26:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103909

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
*) Feature: the "http2" directive, which enables HTTP/2 on a per-server
   basis; the "http2" parameter of the "listen" directive is now
   deprecated.
*) Change: HTTP/2 server push support has been removed.
*) Change: the deprecated "ssl" directive is not supported anymore.
*) Bugfix: in HTTP/3 when using OpenSSL.
*) Feature: experimental HTTP/3 support.

License-Update: Copyright year updated to 2023.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb | 6 ------
 meta-webserver/recipes-httpd/nginx/nginx_1.25.1.bb | 6 ++++++
 2 files changed, 6 insertions(+), 6 deletions(-)
 delete mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.25.1.bb

diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb
deleted file mode 100644
index 2e865e400e..0000000000
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require nginx.inc
-
-LIC_FILES_CHKSUM = "file://LICENSE;md5=175abb631c799f54573dc481454c8632"
-
-SRC_URI[sha256sum] = "77a2541637b92a621e3ee76776c8b7b40cf6d707e69ba53a940283e30ff2f55d"
-
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.25.1.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.25.1.bb
new file mode 100644
index 0000000000..702eac39e2
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.25.1.bb
@@ -0,0 +1,6 @@
+require nginx.inc
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=79ad2eb837299421c4435dedc8897b3d"
+
+SRC_URI[sha256sum] = "f09071ac46e0ea3adc0008ef0baca229fc6b4be4533baef9bbbfba7de29a8602"
+
-- 
2.34.1


