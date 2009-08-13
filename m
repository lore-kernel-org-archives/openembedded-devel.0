Received: from [209.85.200.173] (helo=wf-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1MbewY-0001x2-TS
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Aug 2009 20:22:31 +0200
Received: by wf-out-1314.google.com with SMTP id 25so337187wfa.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Aug 2009 11:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=dxizgYSDfB/PL6XRdnE1PEzhTK/dg4H7SaAhnjvDzRg=;
	b=ct168ypKiAp9SD5oIAlRfPIQOKUXnwW82GZhjnQArlXOgvsWk0txao5CXM2WmvVhhT
	15zOiCccGtcvUUi3BpSFU961ShqbTnS+57D3+ZM/yfD9qym0hEvEuq1B+5+7UTfGhn9C
	XzTJkOl3BKbnTkZLLZevFY3iDE2o0prmAjpdY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=sPR2tODGNEf+HZz0OO+RRNlyAsWcDXlpJG52QcHYDCtiwAwHkrScELvrpVWgCE2glM
	rWEgg2YdGi0+vrv1jo5YSOJElZlrRGNY2fdB7IDsFqQftRQv01qBeF2bEWlKIJBeSy5o
	bBcUlABpK1MIdE1WmLzkww+DFGvI3RhqFmfnI=
Received: by 10.143.21.29 with SMTP id y29mr205997wfi.175.1250186758023;
	Thu, 13 Aug 2009 11:05:58 -0700 (PDT)
Received: from localhost (adsl-71-146-8-242.dsl.pltn13.sbcglobal.net
	[71.146.8.242])
	by mx.google.com with ESMTPS id 30sm1982594wfa.35.2009.08.13.11.05.56
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 13 Aug 2009 11:05:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Aug 2009 11:05:55 -0700
Message-Id: <1250186755-16090-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.5.4.3
In-Reply-To: <>
References: <>
Subject: [PATCH] libtool: Remove FILESDIR, use INC_PR and FILESPATHPKG
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
X-List-Received-Date: Thu, 13 Aug 2009 18:22:31 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/libtool/libtool-cross_1.5.10.bb  |    3 +--
 recipes/libtool/libtool-cross_1.5.22.bb  |    3 +--
 recipes/libtool/libtool-cross_1.5.24.bb  |    3 +--
 recipes/libtool/libtool-cross_2.2.4.bb   |    2 +-
 recipes/libtool/libtool-cross_2.2.6a.bb  |    2 +-
 recipes/libtool/libtool-native_1.5.10.bb |    3 +--
 recipes/libtool/libtool-native_1.5.22.bb |    3 +--
 recipes/libtool/libtool-native_1.5.24.bb |    3 +--
 recipes/libtool/libtool-native_2.2.4.bb  |    2 +-
 recipes/libtool/libtool-native_2.2.6a.bb |    2 +-
 recipes/libtool/libtool-sdk_1.5.10.bb    |    3 +--
 recipes/libtool/libtool-sdk_2.2.4.bb     |    4 ++--
 recipes/libtool/libtool-sdk_2.2.6a.bb    |    2 +-
 recipes/libtool/libtool.inc              |    4 +++-
 recipes/libtool/libtool_1.5.10.bb        |    2 +-
 recipes/libtool/libtool_1.5.22.bb        |    2 +-
 recipes/libtool/libtool_1.5.24.bb        |    2 +-
 recipes/libtool/libtool_1.5.6.bb         |    2 +-
 recipes/libtool/libtool_2.2.4.bb         |    2 +-
 recipes/libtool/libtool_2.2.6a.bb        |    2 +-
 20 files changed, 23 insertions(+), 28 deletions(-)

diff --git a/recipes/libtool/libtool-cross_1.5.10.bb b/recipes/libtool/libtool-cross_1.5.10.bb
index 7374f10..256e71c 100644
--- a/recipes/libtool/libtool-cross_1.5.10.bb
+++ b/recipes/libtool/libtool-cross_1.5.10.bb
@@ -1,9 +1,8 @@
 require libtool.inc
 require libtool_${PV}.bb
 
-PR = "r10"
+PR = "${INC_PR}.0"
 PACKAGES = ""
-FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/libtool-${PV}"
 SRC_URI_append = " file://rpath-control.patch;patch=1 \
                    file://libdir-la.patch;patch=1 \
                    file://libdir-la2.patch;patch=1 \
diff --git a/recipes/libtool/libtool-cross_1.5.22.bb b/recipes/libtool/libtool-cross_1.5.22.bb
index c44b051..9490311 100644
--- a/recipes/libtool/libtool-cross_1.5.22.bb
+++ b/recipes/libtool/libtool-cross_1.5.22.bb
@@ -3,9 +3,8 @@ DEFAULT_PREFERENCE = "-1"
 require libtool.inc
 require libtool_${PV}.bb
 
-PR = "r0"
+PR = "${INC_PR}.0"
 PACKAGES = ""
-FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/libtool-${PV}"
 SRC_URI_append = " file://libdir-la.patch;patch=1 \
                    file://prefix.patch;patch=1 \
                    file://tag.patch;patch=1 \
diff --git a/recipes/libtool/libtool-cross_1.5.24.bb b/recipes/libtool/libtool-cross_1.5.24.bb
index cf6cc18..2a7e4d7 100644
--- a/recipes/libtool/libtool-cross_1.5.24.bb
+++ b/recipes/libtool/libtool-cross_1.5.24.bb
@@ -1,9 +1,8 @@
 require libtool.inc
 require libtool_${PV}.bb
 
-PR = "r0"
+PR = "${INC_PR}.0"
 PACKAGES = ""
-FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/libtool-${PV}"
 SRC_URI_append = " file://libdir-la.patch;patch=1 \
                    file://prefix.patch;patch=1 \
                    file://tag.patch;patch=1 \
diff --git a/recipes/libtool/libtool-cross_2.2.4.bb b/recipes/libtool/libtool-cross_2.2.4.bb
index dd8b598..e2c6bbe 100644
--- a/recipes/libtool/libtool-cross_2.2.4.bb
+++ b/recipes/libtool/libtool-cross_2.2.4.bb
@@ -1,6 +1,6 @@
 require libtool.inc
 require libtool_${PV}.bb
-PR = "r24"
+PR = "${INC_PR}.0"
 
 SRC_URI += "\
   file://cross_compile.patch;patch=1 \
diff --git a/recipes/libtool/libtool-cross_2.2.6a.bb b/recipes/libtool/libtool-cross_2.2.6a.bb
index 1b2defb..b26e7cc 100644
--- a/recipes/libtool/libtool-cross_2.2.6a.bb
+++ b/recipes/libtool/libtool-cross_2.2.6a.bb
@@ -1,6 +1,6 @@
 require libtool.inc
 require libtool_${PV}.bb
-PR = "r1"
+PR = "${INC_PR}.0"
 
 SRC_URI += "\
   file://cross_compile.patch;patch=1 \
diff --git a/recipes/libtool/libtool-native_1.5.10.bb b/recipes/libtool/libtool-native_1.5.10.bb
index 59b323d..362aea2 100644
--- a/recipes/libtool/libtool-native_1.5.10.bb
+++ b/recipes/libtool/libtool-native_1.5.10.bb
@@ -1,8 +1,7 @@
 require libtool.inc
 require libtool_${PV}.bb
 
-PR = "r10"
-FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/libtool-${PV}"
+PR = "${INC_PR}.0"
 SRC_URI_append = " file://libdir-la.patch;patch=1 \
                    file://libdir-la2.patch;patch=1 \
                    file://prefix.patch;patch=1 \
diff --git a/recipes/libtool/libtool-native_1.5.22.bb b/recipes/libtool/libtool-native_1.5.22.bb
index 16db0bb..4d660f4 100644
--- a/recipes/libtool/libtool-native_1.5.22.bb
+++ b/recipes/libtool/libtool-native_1.5.22.bb
@@ -3,8 +3,7 @@ DEFAULT_PREFERENCE = "-1"
 require libtool.inc
 require libtool_${PV}.bb
 
-PR = "r0"
-FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/libtool-${PV}"
+PR = "${INC_PR}.0"
 SRC_URI_append = " file://libdir-la.patch;patch=1 \
                    file://prefix.patch;patch=1 \
                    file://tag.patch;patch=1 \
diff --git a/recipes/libtool/libtool-native_1.5.24.bb b/recipes/libtool/libtool-native_1.5.24.bb
index 1b0cb90..9536881 100644
--- a/recipes/libtool/libtool-native_1.5.24.bb
+++ b/recipes/libtool/libtool-native_1.5.24.bb
@@ -3,8 +3,7 @@ SECTION = "devel"
 require libtool.inc
 require libtool_${PV}.bb
 
-PR = "r0"
-FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/libtool-${PV}"
+PR = "${INC_PR}.0"
 SRC_URI_append = " file://libdir-la.patch;patch=1 \
                    file://prefix.patch;patch=1 \
                    file://tag.patch;patch=1 \
diff --git a/recipes/libtool/libtool-native_2.2.4.bb b/recipes/libtool/libtool-native_2.2.4.bb
index bfef6a6..06564c7 100644
--- a/recipes/libtool/libtool-native_2.2.4.bb
+++ b/recipes/libtool/libtool-native_2.2.4.bb
@@ -1,6 +1,6 @@
 require libtool.inc
 require libtool_${PV}.bb
-PR = "r20"
+PR = "${INC_PR}.0"
 
 SRC_URI += "\
   file://cross_compile.patch;patch=1 \
diff --git a/recipes/libtool/libtool-native_2.2.6a.bb b/recipes/libtool/libtool-native_2.2.6a.bb
index c5a4a99..e699a2f 100644
--- a/recipes/libtool/libtool-native_2.2.6a.bb
+++ b/recipes/libtool/libtool-native_2.2.6a.bb
@@ -1,6 +1,6 @@
 require libtool.inc
 require libtool_${PV}.bb
-PR = "r0"
+PR = "${INC_PR}.0"
 
 SRC_URI += "\
   file://cross_compile.patch;patch=1 \
diff --git a/recipes/libtool/libtool-sdk_1.5.10.bb b/recipes/libtool/libtool-sdk_1.5.10.bb
index e068b53..21e408d 100644
--- a/recipes/libtool/libtool-sdk_1.5.10.bb
+++ b/recipes/libtool/libtool-sdk_1.5.10.bb
@@ -1,8 +1,7 @@
 require libtool.inc
 require libtool_${PV}.bb
 
-PR = "r0"
-FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/libtool-${PV}"
+PR = "${INC_PR}.0"
 SRC_URI_append = " file://rpath-control.patch;patch=1 \
                    file://libdir-la.patch;patch=1 \
                    file://libdir-la2.patch;patch=1 \
diff --git a/recipes/libtool/libtool-sdk_2.2.4.bb b/recipes/libtool/libtool-sdk_2.2.4.bb
index f2c3c62..0e9ae9b 100644
--- a/recipes/libtool/libtool-sdk_2.2.4.bb
+++ b/recipes/libtool/libtool-sdk_2.2.4.bb
@@ -1,8 +1,8 @@
 require libtool.inc
 require libtool_${PV}.bb
 
-PR = "r2"
-FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/libtool-${PV}"
+PR = "${INC_PR}.0"
+
 SRC_URI_append = " file://cross_compile.patch;patch=1"
 
 S = "${WORKDIR}/libtool-${PV}"
diff --git a/recipes/libtool/libtool-sdk_2.2.6a.bb b/recipes/libtool/libtool-sdk_2.2.6a.bb
index 88ec4df..263879b 100644
--- a/recipes/libtool/libtool-sdk_2.2.6a.bb
+++ b/recipes/libtool/libtool-sdk_2.2.6a.bb
@@ -1,7 +1,7 @@
 require libtool.inc
 require libtool_${PV}.bb
 
-PR = "r1"
+PR = "${INC_PR}.0"
 SRC_URI_append = " file://cross_compile.patch;patch=1"
 
 inherit sdk
diff --git a/recipes/libtool/libtool.inc b/recipes/libtool/libtool.inc
index 1976129..9cc7401 100644
--- a/recipes/libtool/libtool.inc
+++ b/recipes/libtool/libtool.inc
@@ -6,4 +6,6 @@ HOMEPAGE = "http://www.gnu.org/software/libtool/libtool.html"
 LICENSE = "GPL"
 SECTION = "devel"
 
-FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/libtool-${PV}"
+INC_PR = "r24"
+
+FILESPATHPKG=. "libtool-${PV}:"
diff --git a/recipes/libtool/libtool_1.5.10.bb b/recipes/libtool/libtool_1.5.10.bb
index 428a06a..8fd2cdf 100644
--- a/recipes/libtool/libtool_1.5.10.bb
+++ b/recipes/libtool/libtool_1.5.10.bb
@@ -1,5 +1,5 @@
 require libtool.inc
-PR = "r5"
+PR = "${INC_PR}.0"
 
 SRC_URI = "${GNU_MIRROR}/libtool/libtool-${PV}.tar.gz \
            file://autotools.patch;patch=1 \
diff --git a/recipes/libtool/libtool_1.5.22.bb b/recipes/libtool/libtool_1.5.22.bb
index 4bed784..88116f0 100644
--- a/recipes/libtool/libtool_1.5.22.bb
+++ b/recipes/libtool/libtool_1.5.22.bb
@@ -1,7 +1,7 @@
 DEFAULT_PREFERENCE = "-1"
 
 require libtool.inc
-PR = "r1"
+PR = "${INC_PR}.0"
 
 SRC_URI = "${GNU_MIRROR}/libtool/libtool-${PV}.tar.gz \
            file://autotools.patch;patch=1 \
diff --git a/recipes/libtool/libtool_1.5.24.bb b/recipes/libtool/libtool_1.5.24.bb
index 7bdad1b..2ab7358 100644
--- a/recipes/libtool/libtool_1.5.24.bb
+++ b/recipes/libtool/libtool_1.5.24.bb
@@ -1,7 +1,7 @@
 DEFAULT_PREFERENCE = "-1"
 
 require libtool.inc
-PR = "r1"
+PR = "${INC_PR}.0"
 
 SRC_URI = "${GNU_MIRROR}/libtool/libtool-${PV}.tar.gz \
            file://autotools.patch;patch=1 \
diff --git a/recipes/libtool/libtool_1.5.6.bb b/recipes/libtool/libtool_1.5.6.bb
index 7fd9b81..6827ea9 100644
--- a/recipes/libtool/libtool_1.5.6.bb
+++ b/recipes/libtool/libtool_1.5.6.bb
@@ -1,7 +1,7 @@
 # Exists for compatibility with certain distributions (e.g. Maemo).
 
 require libtool.inc
-PR = "r2"
+PR = "${INC_PR}.0"
 
 DEFAULT_PREFERENCE = "-1"
 
diff --git a/recipes/libtool/libtool_2.2.4.bb b/recipes/libtool/libtool_2.2.4.bb
index 8e6682f..6de7336 100644
--- a/recipes/libtool/libtool_2.2.4.bb
+++ b/recipes/libtool/libtool_2.2.4.bb
@@ -1,5 +1,5 @@
 require libtool.inc
-PR = "r17"
+PR = "${INC_PR}.0"
 
 SRC_URI = "${GNU_MIRROR}/libtool/libtool-${PV}.tar.gz"
 S = "${WORKDIR}/libtool-${PV}"
diff --git a/recipes/libtool/libtool_2.2.6a.bb b/recipes/libtool/libtool_2.2.6a.bb
index e2996c7..c69a937 100644
--- a/recipes/libtool/libtool_2.2.6a.bb
+++ b/recipes/libtool/libtool_2.2.6a.bb
@@ -1,5 +1,5 @@
 require libtool.inc
-PR = "r2"
+PR = "${INC_PR}.0"
 
 DEFAULT_PREFERENCE = "-1"
 
-- 
1.5.4.3



