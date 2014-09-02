Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8EBE06AC85
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Sep 2014 07:49:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s827nwIv006556
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 2 Sep 2014 00:49:58 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 2 Sep 2014 00:49:57 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 2 Sep 2014 00:49:57 -0700
Message-ID: <1409644197-4457-1-git-send-email-liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [meta-webserver] [PATCH] webmin: fix hardcode of python2.3
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 02 Sep 2014 07:50:02 -0000
Content-Type: text/plain

Use "/usr/bin/env python" to fix it.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../webmin/files/remove-python2.3.patch            |   25 ++++++++++++++++++++
 .../recipes-webadmin/webmin/webmin_1.700.bb        |    4 +++-
 2 files changed, 28 insertions(+), 1 deletion(-)
 create mode 100644 meta-webserver/recipes-webadmin/webmin/files/remove-python2.3.patch

diff --git a/meta-webserver/recipes-webadmin/webmin/files/remove-python2.3.patch b/meta-webserver/recipes-webadmin/webmin/files/remove-python2.3.patch
new file mode 100644
index 0000000..b93ac52
--- /dev/null
+++ b/meta-webserver/recipes-webadmin/webmin/files/remove-python2.3.patch
@@ -0,0 +1,25 @@
+From 6f04699d5d417122b67e8118fd1955c769f17e76 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Tue, 2 Sep 2014 00:11:05 -0700
+Subject: [PATCH] ajaxterm/ajaxterm/qweb.py: fix hardcode of python2.3
+
+Upstream-Status: Pending
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ ajaxterm/ajaxterm/qweb.py |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/meta-webserver/ajaxterm/ajaxterm/qweb.py b/meta-webserver/ajaxterm/ajaxterm/qweb.py
+index 20c5092..c658a6b 100644
+--- a/meta-webserver/ajaxterm/ajaxterm/qweb.py
++++ b/meta-webserver/ajaxterm/ajaxterm/qweb.py
+@@ -1,4 +1,4 @@
+-#!/usr/bin/python2.3
++#!/usr/bin/env python
+ #
+ # vim:set et ts=4 fdc=0 fdn=2 fdl=0:
+ #
+-- 
+1.7.9.5
+
diff --git a/meta-webserver/recipes-webadmin/webmin/webmin_1.700.bb b/meta-webserver/recipes-webadmin/webmin/webmin_1.700.bb
index 45d635e..2a363cb 100644
--- a/meta-webserver/recipes-webadmin/webmin/webmin_1.700.bb
+++ b/meta-webserver/recipes-webadmin/webmin/webmin_1.700.bb
@@ -15,7 +15,9 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/webadmin/webmin-${PV}.tar.gz \
            file://samba-config-fix.patch \
            file://proftpd-config-fix.patch \
            file://net-lib.pl.patch \
-           file://media-tomb.patch"
+           file://media-tomb.patch \
+           file://remove-python2.3.patch \
+            "
 
 SRC_URI[md5sum] = "e5261114a6a6ed10caf570d3239ed5b7"
 SRC_URI[sha256sum] = "1a6a8aa62c32c04932b902d17fc1864ee8f3fba03012bd25f709aa65e7e9b0f2"
-- 
1.7.9.5


