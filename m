Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4438173182
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Dec 2015 07:56:38 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tBP7udfR005313
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Dec 2015 23:56:39 -0800 (PST)
Received: from pek-kkang-d2.wrs.com (128.224.162.180) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Thu, 24 Dec 2015 23:56:39 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 25 Dec 2015 15:56:31 +0800
Message-ID: <bd9ed60d94e95be98f2b7172fdc60d672319cf69.1451029460.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1451029460.git.jackie.huang@windriver.com>
References: <cover.1451029460.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-java][PATCH 11/15] openjdk: fix CVE-2014-1876
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
X-List-Received-Date: Fri, 25 Dec 2015 07:56:38 -0000
Content-Type: text/plain

From: Amy Fong <amy.fong@windriver.com>

Rather than creating /tmp/unpack.log and insecure permissions,
if unpack cannot create teh specified log file, it defaults to writing
to /dev/null, failing that, stderr. (These are the default options if
it cannot write to /tmp/unpack.log)

Signed-off-by: Amy Fong <amy.fong@windriver.com>
Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../icedtea-CVE-2014-1876-unpack.patch             | 44 ++++++++++++++++++++++
 recipes-core/icedtea/openjdk-7-release-03b147.inc  |  2 +
 2 files changed, 46 insertions(+)
 create mode 100644 recipes-core/icedtea/openjdk-7-03b147/icedtea-CVE-2014-1876-unpack.patch

diff --git a/recipes-core/icedtea/openjdk-7-03b147/icedtea-CVE-2014-1876-unpack.patch b/recipes-core/icedtea/openjdk-7-03b147/icedtea-CVE-2014-1876-unpack.patch
new file mode 100644
index 0000000..d0717c4
--- /dev/null
+++ b/recipes-core/icedtea/openjdk-7-03b147/icedtea-CVE-2014-1876-unpack.patch
@@ -0,0 +1,44 @@
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
+Upstream-Status: Pending
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
index dbdc045..83b087c 100644
--- a/recipes-core/icedtea/openjdk-7-release-03b147.inc
+++ b/recipes-core/icedtea/openjdk-7-release-03b147.inc
@@ -86,6 +86,7 @@ OPENJDK_PATCHES = " \
 	file://icedtea-disable-sun.applet-for-tools-in-headless.patch;apply=no \
 	file://icedtea-hotspot-fix-undefined-behaviour.patch;apply=no \
 	file://icedtea-x11_extension_cleanup.patch;apply=no \
+	file://icedtea-CVE-2014-1876-unpack.patch;apply=no \
         "
 
 OPENJDK_HEADLESS_PATCHES = " \
@@ -106,5 +107,6 @@ export DISTRIBUTION_PATCHES = " \
 	patches/icedtea-change-to-gdb-debug-format.patch \
 	patches/icedtea-hotspot-fix-undefined-behaviour.patch \
 	patches/icedtea-x11_extension_cleanup.patch \
+	patches/icedtea-CVE-2014-1876-unpack.patch \
 	${CLEAN_X11_DISTRIBUTION_PATCH} \
         "
-- 
1.9.1


