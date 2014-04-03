Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id DD3B46E9D8
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Apr 2014 14:01:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s33E1fud004244
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 3 Apr 2014 07:01:41 -0700 (PDT)
Received: from pek-blade16.wrs.com (128.224.153.44) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.169.1;
	Thu, 3 Apr 2014 07:01:41 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 3 Apr 2014 22:08:22 +0800
Message-ID: <1396534102-18496-1-git-send-email-liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Subject: [meta-webserver] [PATCH] cherokee: only install configured.py once
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
X-List-Received-Date: Thu, 03 Apr 2014 14:01:44 -0000
Content-Type: text/plain

Both the two rules install-adminpyDATA and install-generatedDATA will
install the configured.py to the same location, they can run parallel,
and they use "install -m", which would might build failures:

/usr/bin/install: setting permissions for `/path/to/configured.py': No such file or directory

This is because the first install is setting the permission while the
second install is removing the file an re-install.

Only install the configured.py once will fix the problem, I think that
there is no side effect since it installed the same file to the same
location twice in the past.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../cherokee-install-configured.py-once.patch      | 40 ++++++++++++++++++++++
 .../recipes-httpd/cherokee/cherokee_1.2.98.bb      |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta-webserver/recipes-httpd/cherokee/cherokee/cherokee-install-configured.py-once.patch

diff --git a/meta-webserver/recipes-httpd/cherokee/cherokee/cherokee-install-configured.py-once.patch b/meta-webserver/recipes-httpd/cherokee/cherokee/cherokee-install-configured.py-once.patch
new file mode 100644
index 0000000..3336f7d
--- /dev/null
+++ b/meta-webserver/recipes-httpd/cherokee/cherokee/cherokee-install-configured.py-once.patch
@@ -0,0 +1,40 @@
+From 98a0f19df0a31d5649ad89d395fd1b8de5591827 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Thu, 3 Apr 2014 21:33:25 +0800
+Subject: [PATCH] admin/Makefile.am: only install configured.py once
+
+Both the two rules install-adminpyDATA and install-generatedDATA will
+install the configured.py to the same location, they can run parallel,
+and they use "install -m", which would might build failures:
+
+/usr/bin/install: setting permissions for `/path/to/configured.py': No such file or directory
+
+This is because the first install is setting the permission while the
+second install is removing the file an re-install.
+
+Only install the configured.py once will fix the problem, I think that
+there is no side effect since it installed the same file to the same
+location twice in the past.
+
+Upstream-Status: Pending
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ admin/Makefile.am | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/admin/Makefile.am b/admin/Makefile.am
+index ce5937b..6f96934 100644
+--- a/admin/Makefile.am
++++ b/admin/Makefile.am
+@@ -73,7 +73,6 @@ SystemStatsWidgets.py \
+ Wizard.py \
+ XMLServerDigest.py \
+ config_version.py \
+-configured.py \
+ consts.py \
+ util.py \
+ popen.py \
+-- 
+1.8.2.1
+
diff --git a/meta-webserver/recipes-httpd/cherokee/cherokee_1.2.98.bb b/meta-webserver/recipes-httpd/cherokee/cherokee_1.2.98.bb
index 1c87aed..054858e 100644
--- a/meta-webserver/recipes-httpd/cherokee/cherokee_1.2.98.bb
+++ b/meta-webserver/recipes-httpd/cherokee/cherokee_1.2.98.bb
@@ -12,6 +12,7 @@ DEPENDS = "libpcre openssl mysql5 ${@base_contains('DISTRO_FEATURES', 'pam', 'li
 SRC_URI = "http://www.cherokee-project.de/mirrors/cherokee/1.2/${PV}/cherokee-${PV}.tar.gz \
            file://cherokee.init \
            file://cherokee.service \
+           file://cherokee-install-configured.py-once.patch \
 "
 SRC_URI[md5sum] = "21b01e7d45c0e82ecc0c4257a9c27feb"
 SRC_URI[sha256sum] = "042b5687b1a3db3ca818167548ce5d32c35e227c6640732dcb622a6f4a078b7d"
-- 
1.8.3.1


