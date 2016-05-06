Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E71A165C8A
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 May 2016 09:10:09 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u469A9mS015548
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 6 May 2016 02:10:09 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Fri, 6 May 2016 02:10:08 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 6 May 2016 17:02:17 +0800
Message-ID: <1462525337-13509-1-git-send-email-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [meta-networking][PATCH] openconnect: add dependency to fix Makefile.am
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
X-List-Received-Date: Fri, 06 May 2016 09:10:10 -0000
Content-Type: text/plain

main.c needs version.c which is generated at build time.
Add this dependency to avoid the following error.

  ../git/main.c:78:21: fatal error: version.c: No such file or directory

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../0001-Makefile.am-add-missing-dependency.patch  | 28 ++++++++++++++++++++++
 .../openconnect/openconnect_git.bb                 |  3 ++-
 2 files changed, 30 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-connectivity/openconnect/files/0001-Makefile.am-add-missing-dependency.patch

diff --git a/meta-networking/recipes-connectivity/openconnect/files/0001-Makefile.am-add-missing-dependency.patch b/meta-networking/recipes-connectivity/openconnect/files/0001-Makefile.am-add-missing-dependency.patch
new file mode 100644
index 0000000..c465bf1
--- /dev/null
+++ b/meta-networking/recipes-connectivity/openconnect/files/0001-Makefile.am-add-missing-dependency.patch
@@ -0,0 +1,28 @@
+Upstream-Status: Pending
+
+Subject: Makefile.am: add missing dependency
+
+Add missing dependency to avoid the following error.
+
+  ../git/main.c:78:21: fatal error: version.c: No such file or directory
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ Makefile.am | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/Makefile.am b/Makefile.am
+index d823e01..ea48ec1 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -112,6 +112,7 @@ EXTRA_DIST += $(shell cd "$(top_srcdir)" && \
+ 
+ DISTCLEANFILES = $(pkgconfig_DATA)
+ 
++main.c: version.c
+ main.o: version.c
+ version.c: $(library_srcs) $(lib_openssl_srcs) $(lib_gnutls_srcs) \
+ 	   $(openconnect_SOURCES) Makefile.am configure.ac \
+-- 
+2.8.1
+
diff --git a/meta-networking/recipes-connectivity/openconnect/openconnect_git.bb b/meta-networking/recipes-connectivity/openconnect/openconnect_git.bb
index 6d3c252..d8fe439 100644
--- a/meta-networking/recipes-connectivity/openconnect/openconnect_git.bb
+++ b/meta-networking/recipes-connectivity/openconnect/openconnect_git.bb
@@ -8,7 +8,8 @@ RDEPENDS_${PN} = "vpnc"
 PV = "7.06"
 
 SRCREV = "35542d52202672b8c12ecc63867432128244013a"
-SRC_URI = "git://git.infradead.org/users/dwmw2/openconnect.git"
+SRC_URI = "git://git.infradead.org/users/dwmw2/openconnect.git \
+           file://0001-Makefile.am-add-missing-dependency.patch"
 
 S = "${WORKDIR}/git"
 
-- 
2.8.1


