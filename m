Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael@sles10-64.ott.cti.com>) id 1M8qNR-0001rW-My
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 May 2009 08:43:10 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 3F2654BFEED;
	Tue, 26 May 2009 02:35:05 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 08709-06; Tue, 26 May 2009 02:35:05 -0400 (EDT)
Received: by smtp.cbnco.com (Postfix, from userid 1003)
	id 17C754BF70E; Tue, 26 May 2009 02:35:04 -0400 (EDT)
X-Spam-Score: 
X-Spam-Checker-Version: SpamAssassin 3.1.8 (2007-02-13) on sid.cbnco.com
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=7.0 tests=ALL_TRUSTED,AWL,BAYES_00,
	UPPERCASE_25_50 autolearn=ham version=3.1.8
Received: from sles10-64.ott.cti.com (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTP id BA0474C011D;
	Tue, 26 May 2009 02:34:56 -0400 (EDT)
Received: by sles10-64.ott.cti.com (Postfix, from userid 1000)
	id C794D1AC4C0; Tue, 26 May 2009 02:34:56 -0400 (EDT)
From: Michael Smith <msmith@cbnco.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 26 May 2009 02:34:55 -0400
Message-Id: <1243319696-16223-3-git-send-email-msmith@cbnco.com>
X-Mailer: git-send-email 1.5.6.5
In-Reply-To: <1243319696-16223-2-git-send-email-msmith@cbnco.com>
References: <Pine.LNX.4.64.0905260228240.6446@juice.ott.cti.com>
	<1243319696-16223-1-git-send-email-msmith@cbnco.com>
	<1243319696-16223-2-git-send-email-msmith@cbnco.com>
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: [PATCH 3/4] glibc/eglibc: remove calls to obsolete base_set_filespath()
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 26 May 2009 06:43:10 -0000

Some recipes can use the default FILESPATHPKG, others need to override.

Signed-off-by: Michael Smith <msmith@cbnco.com>
---

Of these, the following were build tested:
 recipes/glibc/glibc-initial.inc                  |    2 +-
  (for glibc 2.6.1)

The rest were not.

I think something might be dicey here: glibc-2.4 was being prepended
to the FILESPATH in many recipes, including glibc-initial.inc (and still
is -- I just converted it to FILESPATHPKG). It's at the start of the
path, so for example glibc-2.4/blah.patch would override
glibc-2.999/blah.patch for glibc-initial_2.999.

So far there are no duplicate files between glibc-2.4 and the higher
versions, so it hasn't bitten anybody yet.

 recipes/glibc/glibc-initial_2.3.2.bb             |    1 -
 recipes/glibc/glibc-initial_2.3.6.bb             |    2 --
 recipes/glibc/glibc-initial_cvs.bb               |    3 ++-
 recipes/glibc/glibc_2.3.6.bb                     |    2 --
 recipes/glibc/glibc_2.7.bb                       |    2 +-
 recipes/glibc/glibc_2.9.bb                       |    2 +-
 10 files changed, 5 insertions(+), 12 deletions(-)

diff --git a/recipes/eglibc/eglibc-initial.inc b/recipes/eglibc/eglibc-initial.inc
index 5fbb5db..7a5a7b2 100644
--- a/recipes/eglibc/eglibc-initial.inc
+++ b/recipes/eglibc/eglibc-initial.inc
@@ -1,7 +1,6 @@
 SECTION = "libs"
 DEPENDS = "linux-libc-headers virtual/${TARGET_PREFIX}gcc-initial"
 PROVIDES = "virtual/${TARGET_PREFIX}libc-initial"
-FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/eglibc', '${FILE_DIRNAME}/files', '${FILE_DIRNAME}' ], d)}"
 
 PACKAGES = ""
 PACKAGES_DYNAMIC = ""
diff --git a/recipes/glibc/glibc-initial.inc b/recipes/glibc/glibc-initial.inc
index 5528cf8..cd65924 100644
--- a/recipes/glibc/glibc-initial.inc
+++ b/recipes/glibc/glibc-initial.inc
@@ -1,7 +1,7 @@
 SECTION = "libs"
 DEPENDS = "virtual/${TARGET_PREFIX}gcc-initial linux-libc-headers"
 PROVIDES = "virtual/${TARGET_PREFIX}libc-initial"
-FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/glibc-2.4', '${FILE_DIRNAME}/glibc-${PV}', '${FILE_DIRNAME}/glibc', '${FILE_DIRNAME}/files', '${FILE_DIRNAME}' ], d)}"
+FILESPATHPKG =. "glibc-2.4:"
 
 PACKAGES = ""
 PACKAGES_DYNAMIC = ""
diff --git a/recipes/glibc/glibc-initial_2.2.5.bb b/recipes/glibc/glibc-initial_2.2.5.bb
index 84412bd..c7dde23 100644
--- a/recipes/glibc/glibc-initial_2.2.5.bb
+++ b/recipes/glibc/glibc-initial_2.2.5.bb
@@ -2,4 +2,3 @@ require glibc_${PV}.bb
 require glibc-initial.inc
 
 DEFAULT_PREFERENCE_sh3 = "-99"
-FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/glibc-${PV}', '${FILE_DIRNAME}/glibc', '${FILE_DIRNAME}/files', '${FILE_DIRNAME}' ], d)}"
diff --git a/recipes/glibc/glibc-initial_2.3.2+cvs20040726.bb b/recipes/glibc/glibc-initial_2.3.2+cvs20040726.bb
index 4d7129b..c7dde23 100644
--- a/recipes/glibc/glibc-initial_2.3.2+cvs20040726.bb
+++ b/recipes/glibc/glibc-initial_2.3.2+cvs20040726.bb
@@ -2,4 +2,3 @@ require glibc_${PV}.bb
 require glibc-initial.inc
 
 DEFAULT_PREFERENCE_sh3 = "-99"
-FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/glibc-cvs', '${FILE_DIRNAME}/glibc', '${FILE_DIRNAME}/files', '${FILE_DIRNAME}' ], d)}"
diff --git a/recipes/glibc/glibc-initial_2.3.2.bb b/recipes/glibc/glibc-initial_2.3.2.bb
index 84412bd..c7dde23 100644
--- a/recipes/glibc/glibc-initial_2.3.2.bb
+++ b/recipes/glibc/glibc-initial_2.3.2.bb
@@ -2,4 +2,3 @@ require glibc_${PV}.bb
 require glibc-initial.inc
 
 DEFAULT_PREFERENCE_sh3 = "-99"
-FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/glibc-${PV}', '${FILE_DIRNAME}/glibc', '${FILE_DIRNAME}/files', '${FILE_DIRNAME}' ], d)}"
diff --git a/recipes/glibc/glibc-initial_2.3.6.bb b/recipes/glibc/glibc-initial_2.3.6.bb
index 8249cd6..fa7836a 100644
--- a/recipes/glibc/glibc-initial_2.3.6.bb
+++ b/recipes/glibc/glibc-initial_2.3.6.bb
@@ -1,4 +1,2 @@
 require glibc_${PV}.bb
 require glibc-initial.inc
-
-FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/glibc-${PV}', '${FILE_DIRNAME}/glibc', '${FILE_DIRNAME}/files', '${FILE_DIRNAME}' ], d)}"
diff --git a/recipes/glibc/glibc-initial_cvs.bb b/recipes/glibc/glibc-initial_cvs.bb
index 81be5fc..0bfd665 100644
--- a/recipes/glibc/glibc-initial_cvs.bb
+++ b/recipes/glibc/glibc-initial_cvs.bb
@@ -1,4 +1,5 @@
 require glibc_${PV}.bb
 require glibc-initial.inc
 
-FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/glibc-cvs', '${FILE_DIRNAME}/glibc', '${FILE_DIRNAME}/files', '${FILE_DIRNAME}' ], d)}"
+# glibc_cvs.bb overrides PV; glibc-cvs won't automatically be in FILESPATHPKG
+FILESPATHPKG =. "glibc-cvs:"
diff --git a/recipes/glibc/glibc_2.3.6.bb b/recipes/glibc/glibc_2.3.6.bb
index ab167da..8d64540 100644
--- a/recipes/glibc/glibc_2.3.6.bb
+++ b/recipes/glibc/glibc_2.3.6.bb
@@ -2,8 +2,6 @@ require glibc.inc
 
 PR = "r5"
 
-#FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/glibc-2.3.6', '${FILE_DIRNAME}/orig/glibc', '${FILE_DIRNAME}/orig/files', '${FILE_DIRNAME}/orig' ], d)}"
-
 GLIBC_ADDONS ?= "linuxthreads"
 
 #           ${CROSSTOOL_PATCH_URL}glibc-2.3.5-cygwin.patch;patch=1
diff --git a/recipes/glibc/glibc_2.7.bb b/recipes/glibc/glibc_2.7.bb
index 8ae84c1..1a2902d 100644
--- a/recipes/glibc/glibc_2.7.bb
+++ b/recipes/glibc/glibc_2.7.bb
@@ -12,7 +12,7 @@ BUILD_CPPFLAGS = "-I${STAGING_INCDIR_NATIVE}"
 TARGET_CPPFLAGS = "-I${STAGING_DIR_TARGET}${layout_includedir}"
 
 
-FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/glibc-2.4', '${FILE_DIRNAME}/glibc-${PV}', '${FILE_DIRNAME}/files', '${FILE_DIRNAME}' ], d)}"
+FILESPATHPKG =. "glibc-2.4:"
 
 GLIBC_ADDONS ?= "ports,nptl,libidn"
 
diff --git a/recipes/glibc/glibc_2.9.bb b/recipes/glibc/glibc_2.9.bb
index 7859876..7709d26 100644
--- a/recipes/glibc/glibc_2.9.bb
+++ b/recipes/glibc/glibc_2.9.bb
@@ -12,7 +12,7 @@ BUILD_CPPFLAGS = "-I${STAGING_INCDIR_NATIVE}"
 TARGET_CPPFLAGS = "-I${STAGING_DIR_TARGET}${layout_includedir}"
 
 
-FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/glibc-2.4', '${FILE_DIRNAME}/glibc-${PV}', '${FILE_DIRNAME}/files', '${FILE_DIRNAME}' ], d)}"
+FILESPATHPKG =. "glibc-2.4:"
 
 GLIBC_ADDONS ?= "ports,nptl,libidn"
 
-- 
1.5.6.5



