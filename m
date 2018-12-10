Return-Path: <andrej.valek@siemens.com>
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
	by mail.openembedded.org (Postfix) with ESMTP id 981586D193
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Dec 2018 08:29:11 +0000 (UTC)
Received: from mail2.siemens.de (mail2.siemens.de [139.25.208.11])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id wBA8TBP4016203
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Dec 2018 09:29:11 +0100
Received: from dev.vm6.ccp.siemens.com ([163.242.53.42])
	by mail2.siemens.de (8.15.2/8.15.2) with ESMTP id wBA8TBSY019024;
	Mon, 10 Dec 2018 09:29:11 +0100
Received: from dev.localdomain (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id 69EF895179E;
	Mon, 10 Dec 2018 09:29:07 +0100 (CET)
From: Andrej Valek <andrej.valek@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 10 Dec 2018 09:29:03 +0100
Message-Id: <20181210082903.10565-1-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.11.0
Subject: [meta-oe][PATCH] nginx: update to version 1.15.7
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 10 Dec 2018 08:29:12 -0000

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
---
 meta-webserver/recipes-httpd/nginx/nginx_1.15.2.bb | 6 ------
 meta-webserver/recipes-httpd/nginx/nginx_1.15.7.bb | 6 ++++++
 2 files changed, 6 insertions(+), 6 deletions(-)
 delete mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.15.2.bb
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.15.7.bb

diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.15.2.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.15.2.bb
deleted file mode 100644
index 3694f5b58..000000000
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.15.2.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require nginx.inc
-
-LIC_FILES_CHKSUM = "file://LICENSE;md5=3691402cc54ce09f800ca348634a2dfe"
-
-SRC_URI[md5sum] = "d063f746d3dc4298aed9c518f1684166"
-SRC_URI[sha256sum] = "eeba09aecfbe8277ac33a5a2486ec2d6731739f3c1c701b42a0c3784af67ad90"
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.15.7.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.15.7.bb
new file mode 100644
index 000000000..5e6dc33e9
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.15.7.bb
@@ -0,0 +1,6 @@
+require nginx.inc
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3691402cc54ce09f800ca348634a2dfe"
+
+SRC_URI[md5sum] = "719b2e3d416f111fecc9db6625553658"
+SRC_URI[sha256sum] = "8f22ea2f6c0e0a221b6ddc02b6428a3ff708e2ad55f9361102b1c9f4142bdf93"
-- 
2.11.0


