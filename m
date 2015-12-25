Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B4E067001D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Dec 2015 07:56:25 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tBP7uPtv005301
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Dec 2015 23:56:26 -0800 (PST)
Received: from pek-kkang-d2.wrs.com (128.224.162.180) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Thu, 24 Dec 2015 23:56:26 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 25 Dec 2015 15:56:22 +0800
Message-ID: <3b2b23d4d1d865f0f9cb5a8726b68f5f47d662d1.1451029460.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1451029460.git.jackie.huang@windriver.com>
References: <cover.1451029460.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-java][PATCH 02/15] inetlib: fix inetlib dependency during compilation
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
X-List-Received-Date: Fri, 25 Dec 2015 07:56:27 -0000
Content-Type: text/plain

From: Amy Fong <amy.fong@windriver.com>

Fix a dependency issue when building many parallel threads for
inetlib.  The build failure looks like:
1. ERROR in source/gnu/inet/util/SaslCallbackHandler.java (at line 43)
        import javax.security.auth.callback.Callback;
               ^^^^^^^^^^^^^^
The issue is due to the jar linking before all the objects are
complete.

Signed-off-by: Paul Barrette <paul.barrette@windriver.com>
Signed-off-by: Amy Fong <amy.fong@windriver.com>
Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 ...etlib-missing-dependency-for-util_classes.patch | 31 ++++++++++++++++++++++
 recipes-core/classpathx/inetlib_1.1.1.bb           |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 recipes-core/classpathx/inetlib-1.1.1/inetlib-missing-dependency-for-util_classes.patch

diff --git a/recipes-core/classpathx/inetlib-1.1.1/inetlib-missing-dependency-for-util_classes.patch b/recipes-core/classpathx/inetlib-1.1.1/inetlib-missing-dependency-for-util_classes.patch
new file mode 100644
index 0000000..6691228
--- /dev/null
+++ b/recipes-core/classpathx/inetlib-1.1.1/inetlib-missing-dependency-for-util_classes.patch
@@ -0,0 +1,31 @@
+From 9779e734630e65ac7f9b27531c521e6555e2b12b Mon Sep 17 00:00:00 2001
+From: Paul Barrette <paul.barrette@windriver.com>
+Date: Wed, 14 May 2014 10:55:31 -0400
+Subject: [PATCH] inetlib: missing dependency for util_classes
+
+Fix a dependency for intermittent build failures, e.g.:
+1. ERROR in source/gnu/inet/util/SaslCallbackHandler.java (at line 43)
+        import javax.security.auth.callback.Callback;
+               ^^^^^^^^^^^^^^
+
+Signed-off-by: Paul Barrette <paul.barrette@windriver.com>
+---
+ Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 5694974..ca93170 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -205,7 +205,7 @@ comsat_classes = $(patsubst $(src)/%.java, $(dst)/%.class, $(comsat_sources))
+ 
+ # Jar
+ 
+-$(inetlib_jar): $(dst) $(META_INF_FILES) $(smtp_classes) $(imap_classes) $(pop3_classes) $(nntp_classes) $(ftp_classes) $(gopher_classes) $(finger_classes) $(http_classes) $(ldap_classes) $(comsat_classes)
++$(inetlib_jar): $(dst) $(META_INF_FILES) $(util_classes) $(smtp_classes) $(imap_classes) $(pop3_classes) $(nntp_classes) $(ftp_classes) $(gopher_classes) $(finger_classes) $(http_classes) $(ldap_classes) $(comsat_classes)
+ 	$(JAR) cf $(inetlib_jar) -C $(dst) META-INF -C $(dst) gnu
+ 
+ $(dst):
+-- 
+1.8.3.2
+
diff --git a/recipes-core/classpathx/inetlib_1.1.1.bb b/recipes-core/classpathx/inetlib_1.1.1.bb
index f078e33..e42a650 100644
--- a/recipes-core/classpathx/inetlib_1.1.1.bb
+++ b/recipes-core/classpathx/inetlib_1.1.1.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 SRC_URI = "http://ftp.gnu.org/gnu/classpath/${BP}.tar.gz \
            file://datadir_java.patch \
+           file://inetlib-missing-dependency-for-util_classes.patch \
           "
 
 inherit java-library autotools
-- 
1.9.1


