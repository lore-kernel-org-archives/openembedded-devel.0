Return-Path: <Zibo.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B25A671510
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Sep 2014 23:37:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s8NNbrmF002244
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Sep 2014 16:37:54 -0700 (PDT)
Received: from chinabull.wrs.com (128.224.56.210) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 23 Sep 2014 16:37:53 -0700
From: Zibo Zhao <zibo.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 23 Sep 2014 19:37:46 -0400
Message-ID: <1411515467-16344-1-git-send-email-zibo.zhao@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-java][PATCH 1/2] Security Advisory - openjdk - CVE-2014-1876
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
X-List-Received-Date: Tue, 23 Sep 2014 23:37:53 -0000
Content-Type: text/plain

From: Amy Fong <Amy.Fong@windriver.com>

Rather than creating /tmp/unpack.log and insecure permissions,
if unpack cannot create teh specified log file, it defaults to writing
to /dev/null, failing that, stderr. (These are the default options if
it cannot write to /tmp/unpack.log)

Signed-off-by: Amy Fong <Amy.Fong@windriver.com>
Signed-off-by: Zibo Zhao <zibo.zhao@windriver.com>
---
 .../icedtea-CVE-2014-1876-unpack.patch             | 42 ++++++++++++++++++++++
 recipes-core/icedtea/openjdk-7-release-03b147.inc  |  2 ++
 .../icedtea-CVE-2014-1876-unpack.patch             | 42 ++++++++++++++++++++++
 recipes-core/openjdk/openjdk-7-release-03b21.inc   |  2 ++
 4 files changed, 88 insertions(+)
 create mode 100644 recipes-core/icedtea/openjdk-7-03b147/icedtea-CVE-2014-1876-unpack.patch
 create mode 100644 recipes-core/openjdk/openjdk-7-03b21/icedtea-CVE-2014-1876-unpack.patch

diff --git a/recipes-core/icedtea/openjdk-7-03b147/icedtea-CVE-2014-1876-unpack.patch b/recipes-core/icedtea/openjdk-7-03b147/icedtea-CVE-2014-1876-unpack.patch
new file mode 100644
index 0000000..22f051d
--- /dev/null
+++ b/recipes-core/icedtea/openjdk-7-03b147/icedtea-CVE-2014-1876-unpack.patch
@@ -0,0 +1,42 @@
+This provides a fix for the security vulnerability reported in
+http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-1876
+
+    The unpacker::redirect_stdio function in unpack.cpp in unpack200 in OpenJDK 6,
+    7, and 8, and Oracle Java JDK, does not securely create temporary files when a
+    log file cannot be opened, which allows local users to overwrite arbitrary
+    files via a symlink attack on /tmp/unpack.log.
+
+Rather than trying to open a /tmp/unpack.log file, this fix comments
+out that segment and goes to the fallback options which include
+redirecting error to /dev/null, or failing that, redirecting to stderr.
+
+Signed-off-by: Amy Fong <amy.fong@windriver.com>
+
+Index: openjdk/jdk/src/share/native/com/sun/java/util/jar/pack/unpack.cpp
+===================================================================
+--- openjdk/jdk/src/share/native/com/sun/java/util/jar/pack/unpack.cpp
++++ openjdk/jdk/src/share/native/com/sun/java/util/jar/pack/unpack.cpp
+@@ -4757,6 +4757,15 @@
+     return;
+   } else {
+     char log_file_name[PATH_MAX+100];
++#if 0
++/*
++The unpacker::redirect_stdio function in unpack.cpp in unpack200 in OpenJDK 6,
++7, and 8, and Oracle Java JDK, does not securely create temporary files when a
++log file cannot be opened, which allows local users to overwrite arbitrary
++files via a symlink attack on /tmp/unpack.log.
++
++http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-1876
++*/
+     char tmpdir[PATH_MAX];
+ #ifdef WIN32
+     int n = GetTempPath(PATH_MAX,tmpdir); //API returns with trailing '\'
+@@ -4781,6 +4790,7 @@
+       log_file = errstrm_name = saveStr(log_file_name);
+       return ;
+     }
++#endif
+ #ifndef WIN32
+     sprintf(log_file_name, "/dev/null");
+     // On windows most likely it will fail.
diff --git a/recipes-core/icedtea/openjdk-7-release-03b147.inc b/recipes-core/icedtea/openjdk-7-release-03b147.inc
index f561e42..a4dbe67 100644
--- a/recipes-core/icedtea/openjdk-7-release-03b147.inc
+++ b/recipes-core/icedtea/openjdk-7-release-03b147.inc
@@ -80,6 +80,7 @@ OPENJDK_PATCHES = " \
         file://icedtea-hotspot-make-arch-sane-for-x86.patch;apply=no \
         file://icedtea-jdk-sane-x86-arch.patch;apply=no \
 	file://icedtea-flags.patch;apply=no \
+	file://icedtea-CVE-2014-1876-unpack.patch;apply=no \
         "
 
 export DISTRIBUTION_PATCHES = " \
@@ -89,4 +90,5 @@ export DISTRIBUTION_PATCHES = " \
         patches/icedtea-hotspot-make-arch-sane-for-x86.patch \
         patches/icedtea-jdk-sane-x86-arch.patch \
 	patches/icedtea-flags.patch \
+	patches/icedtea-CVE-2014-1876-unpack.patch \
         "
diff --git a/recipes-core/openjdk/openjdk-7-03b21/icedtea-CVE-2014-1876-unpack.patch b/recipes-core/openjdk/openjdk-7-03b21/icedtea-CVE-2014-1876-unpack.patch
new file mode 100644
index 0000000..22f051d
--- /dev/null
+++ b/recipes-core/openjdk/openjdk-7-03b21/icedtea-CVE-2014-1876-unpack.patch
@@ -0,0 +1,42 @@
+This provides a fix for the security vulnerability reported in
+http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-1876
+
+    The unpacker::redirect_stdio function in unpack.cpp in unpack200 in OpenJDK 6,
+    7, and 8, and Oracle Java JDK, does not securely create temporary files when a
+    log file cannot be opened, which allows local users to overwrite arbitrary
+    files via a symlink attack on /tmp/unpack.log.
+
+Rather than trying to open a /tmp/unpack.log file, this fix comments
+out that segment and goes to the fallback options which include
+redirecting error to /dev/null, or failing that, redirecting to stderr.
+
+Signed-off-by: Amy Fong <amy.fong@windriver.com>
+
+Index: openjdk/jdk/src/share/native/com/sun/java/util/jar/pack/unpack.cpp
+===================================================================
+--- openjdk/jdk/src/share/native/com/sun/java/util/jar/pack/unpack.cpp
++++ openjdk/jdk/src/share/native/com/sun/java/util/jar/pack/unpack.cpp
+@@ -4757,6 +4757,15 @@
+     return;
+   } else {
+     char log_file_name[PATH_MAX+100];
++#if 0
++/*
++The unpacker::redirect_stdio function in unpack.cpp in unpack200 in OpenJDK 6,
++7, and 8, and Oracle Java JDK, does not securely create temporary files when a
++log file cannot be opened, which allows local users to overwrite arbitrary
++files via a symlink attack on /tmp/unpack.log.
++
++http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-1876
++*/
+     char tmpdir[PATH_MAX];
+ #ifdef WIN32
+     int n = GetTempPath(PATH_MAX,tmpdir); //API returns with trailing '\'
+@@ -4781,6 +4790,7 @@
+       log_file = errstrm_name = saveStr(log_file_name);
+       return ;
+     }
++#endif
+ #ifndef WIN32
+     sprintf(log_file_name, "/dev/null");
+     // On windows most likely it will fail.
diff --git a/recipes-core/openjdk/openjdk-7-release-03b21.inc b/recipes-core/openjdk/openjdk-7-release-03b21.inc
index 07b1f7a..6f78d10 100644
--- a/recipes-core/openjdk/openjdk-7-release-03b21.inc
+++ b/recipes-core/openjdk/openjdk-7-release-03b21.inc
@@ -93,6 +93,7 @@ ICEDTEAPATCHES = "\
 	file://icedtea-shark-arm-linux-cpu-detection.patch;apply=no \
 	file://icedtea-corba-parallel-make.patch;apply=no \
         file://icedtea-zero-hotspotfix.patch;apply=no \
+        file://icedtea-CVE-2014-1876-unpack.patch;apply=no \
 	"
 ICEDTEAPATCHES_append_powerpc = " \
 	file://icedtea-jdk-nio-use-host-cc.patch;apply=no \
@@ -125,6 +126,7 @@ DISTRIBUTION_PATCHES = "\
 	patches/icedtea-shark-arm-linux-cpu-detection.patch \
 	patches/icedtea-corba-parallel-make.patch \
         patches/icedtea-zero-hotspotfix.patch \
+        patches/icedtea-CVE-2014-1876-unpack.patch \
 	"
 
 DISTRIBUTION_PATCHES_append_libc-uclibc = "\
-- 
1.9.1


