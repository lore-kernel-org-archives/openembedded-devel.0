Received: from mail-bw0-f226.google.com ([209.85.218.226])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1NfKOI-0001so-Hk
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Feb 2010 22:46:37 +0100
Received: by bwz26 with SMTP id 26so535154bwz.27
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Feb 2010 13:44:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:from:to:cc:subject
	:date:message-id:x-mailer;
	bh=9vz0dQvwFco7jmVaX7oIUpL0boDC1zod6yRt+uSXdNI=;
	b=bfaoTYFhM7cbhmnCNEPnUu1yYMPArlqaULYkZ945qcEiQrG0NDuOLNktq4nB51P6q2
	wgvo4ecj1bp0Ir2eijfMfZfWQRN0rdYOyWZOH3fdr9oj0o1R2WzhLPOYio2ks7FXm8yH
	W/LczaKdZmh0eFBeA9JR82N1gbIiuhxA+FS60=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=ngTqZ0yWzkq7E1FprqCp4/Yo6lTYQKI3rfJiXQDAqVzCqS3K+PhMQ18IP6nUvBdihm
	uiPFFSssyGw/7OxDgsHPvr43WS70G0buzlEnOaL05i/zw9w6iXzE4UUZYB3MHdZCCbM5
	qFO5hjtxfF+b9JUFpK3pYxH0xSK2i3/Mii0do=
Received: by 10.204.16.194 with SMTP id p2mr582987bka.32.1265838240393;
	Wed, 10 Feb 2010 13:44:00 -0800 (PST)
Received: from s42.loc ([84.119.103.202])
	by mx.google.com with ESMTPS id 13sm762765bwz.10.2010.02.10.13.43.58
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 10 Feb 2010 13:43:59 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.71)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1NfKNs-0006Ni-LX; Wed, 10 Feb 2010 22:46:08 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 10 Feb 2010 22:45:50 +0100
Message-Id: <1265838350-24498-1-git-send-email-rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.6.5
X-SA-Exim-Connect-IP: 209.85.218.226
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] recipes/*: use ${GNU_MIRROR}
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
X-List-Received-Date: Wed, 10 Feb 2010 21:46:37 -0000

sed -i -e 's|[hf]*[t]*p://ftp.gnu.org/gnu|${GNU_MIRROR}|g' $(git grep -l "ftp.gnu.org/gnu" recipes/)

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 recipes/adns/adns_1.0.bb                     |    2 +-
 recipes/aspell/aspell6-en_6.0-0.bb           |    2 +-
 recipes/aspell/aspell6-pl_6.0-20061121-0.bb  |    2 +-
 recipes/aspell/aspell_0.60.5.bb              |    2 +-
 recipes/aspell/aspell_0.60.6.bb              |    2 +-
 recipes/bash/bash_3.2.bb                     |   78 +++++++++++++-------------
 recipes/binutils/binutils_2.17.bb            |    2 +-
 recipes/ccrtp/ccrtp_1.7.0.bb                 |    2 +-
 recipes/classpath/inetlib_1.1.1.bb           |    2 +-
 recipes/classpathx/gnujaf_1.1.1.bb           |    2 +-
 recipes/classpathx/gnumail_1.1.2.bb          |    2 +-
 recipes/commoncpp/commoncpp2_1.7.1.bb        |    2 +-
 recipes/coreutils/coreutils-7.1.inc          |    2 +-
 recipes/coreutils/coreutils-7.2.inc          |    2 +-
 recipes/coreutils/coreutils_7.6.bb           |    2 +-
 recipes/dejagnu/dejagnu_1.4.4.bb             |    2 +-
 recipes/glibc/glibc_2.3.2.bb                 |    2 +-
 recipes/glibc/glibc_2.3.3.bb                 |    2 +-
 recipes/gnuradio/gnuradio_3.1.3.bb           |    2 +-
 recipes/gnuradio/gnuradio_3.2.0.bb           |    2 +-
 recipes/gnuradio/gnuradio_3.2.1.bb           |    2 +-
 recipes/groff/groff_1.19.1.bb                |    2 +-
 recipes/groff/groff_1.19.2.bb                |    2 +-
 recipes/libcgicc/libcgicc.inc                |    2 +-
 recipes/libmicrohttpd/libmicrohttpd_0.4.2.bb |    2 +-
 recipes/macchanger/macchanger_1.5.0.bb       |    2 +-
 recipes/mtools/mtools_4.0.10.bb              |    2 +-
 recipes/parted/files/parted-1.8.x.patch      |    2 +-
 recipes/readline/readline_5.2.bb             |    2 +-
 recipes/ttf-fonts/ttf-freefonts_20090104.bb  |    2 +-
 recipes/usrp/usrp_0.12.bb                    |    2 +-
 recipes/webkit/files/autogen.sh              |    4 +-
 recipes/webkit/webkit-gtk/autogen.sh         |    6 +-
 recipes/xbmc/libcdio_0.81.bb                 |    2 +-
 recipes/xboard/xboard_4.4.1.bb               |    2 +-
 35 files changed, 76 insertions(+), 76 deletions(-)

diff --git a/recipes/adns/adns_1.0.bb b/recipes/adns/adns_1.0.bb
index dd058ec..ad0c173 100644
--- a/recipes/adns/adns_1.0.bb
+++ b/recipes/adns/adns_1.0.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "An advanced alternative, asynchronous resolver."
 SECTION = "console/network"
 LICENSE="GPL"
 
-SRC_URI = "ftp://ftp.gnu.org/gnu/adns/adns-${PV}.tar.gz \
+SRC_URI = "${GNU_MIRROR}/adns/adns-${PV}.tar.gz \
 	   file://configure.patch;patch=1 \
 	   file://fixparsedomainflags.patch;patch=1"
 
diff --git a/recipes/aspell/aspell6-en_6.0-0.bb b/recipes/aspell/aspell6-en_6.0-0.bb
index a8bf72d..df893b4 100644
--- a/recipes/aspell/aspell6-en_6.0-0.bb
+++ b/recipes/aspell/aspell6-en_6.0-0.bb
@@ -1,5 +1,5 @@
 LICENSE = "Copyright file"
-SRC_URI = "ftp://ftp.gnu.org/gnu/aspell/dict/en/aspell6-en-${PV}.tar.bz2"
+SRC_URI = "${GNU_MIRROR}/aspell/dict/en/aspell6-en-${PV}.tar.bz2"
 PR ="r1"
 
 require aspell-lang.inc
diff --git a/recipes/aspell/aspell6-pl_6.0-20061121-0.bb b/recipes/aspell/aspell6-pl_6.0-20061121-0.bb
index 8b2fb57..b75a400 100644
--- a/recipes/aspell/aspell6-pl_6.0-20061121-0.bb
+++ b/recipes/aspell/aspell6-pl_6.0-20061121-0.bb
@@ -1,5 +1,5 @@
 LICENSE = "GPLv2"
-SRC_URI = "ftp://ftp.gnu.org/gnu/aspell/dict/pl/aspell6-pl-6.0_20061121-0.tar.bz2"
+SRC_URI = "${GNU_MIRROR}/aspell/dict/pl/aspell6-pl-6.0_20061121-0.tar.bz2"
 PR ="r1"
 
 require aspell-lang.inc
diff --git a/recipes/aspell/aspell_0.60.5.bb b/recipes/aspell/aspell_0.60.5.bb
index 66b21f9..369c608 100644
--- a/recipes/aspell/aspell_0.60.5.bb
+++ b/recipes/aspell/aspell_0.60.5.bb
@@ -1,4 +1,4 @@
-SRC_URI = "ftp://ftp.gnu.org/gnu/aspell/aspell-${PV}.tar.gz"
+SRC_URI = "${GNU_MIRROR}/aspell/aspell-${PV}.tar.gz"
 DESCRIPTION = "GNU Aspell spell-checker"
 SECTION = "console/utils"
 LICENSE="LGPL"
diff --git a/recipes/aspell/aspell_0.60.6.bb b/recipes/aspell/aspell_0.60.6.bb
index 66b21f9..369c608 100644
--- a/recipes/aspell/aspell_0.60.6.bb
+++ b/recipes/aspell/aspell_0.60.6.bb
@@ -1,4 +1,4 @@
-SRC_URI = "ftp://ftp.gnu.org/gnu/aspell/aspell-${PV}.tar.gz"
+SRC_URI = "${GNU_MIRROR}/aspell/aspell-${PV}.tar.gz"
 DESCRIPTION = "GNU Aspell spell-checker"
 SECTION = "console/utils"
 LICENSE="LGPL"
diff --git a/recipes/bash/bash_3.2.bb b/recipes/bash/bash_3.2.bb
index e175467..165db83 100644
--- a/recipes/bash/bash_3.2.bb
+++ b/recipes/bash/bash_3.2.bb
@@ -4,44 +4,44 @@ PR = "r8"
 
 SRC_URI += "\
            file://builtins.patch;patch=1 \
-           http://ftp.gnu.org/gnu/bash/bash-3.2-patches/bash32-001;patch=1;pnum=0 \
-           http://ftp.gnu.org/gnu/bash/bash-3.2-patches/bash32-002;patch=1;pnum=0 \
-           http://ftp.gnu.org/gnu/bash/bash-3.2-patches/bash32-003;patch=1;pnum=0 \
-           http://ftp.gnu.org/gnu/bash/bash-3.2-patches/bash32-004;patch=1;pnum=0 \
-           http://ftp.gnu.org/gnu/bash/bash-3.2-patches/bash32-005;patch=1;pnum=0 \
-           http://ftp.gnu.org/gnu/bash/bash-3.2-patches/bash32-006;patch=1;pnum=0 \
-           http://ftp.gnu.org/gnu/bash/bash-3.2-patches/bash32-007;patch=1;pnum=0 \
-           http://ftp.gnu.org/gnu/bash/bash-3.2-patches/bash32-008;patch=1;pnum=0 \
-           http://ftp.gnu.org/gnu/bash/bash-3.2-patches/bash32-009;patch=1;pnum=0 \
-           http://ftp.gnu.org/gnu/bash/bash-3.2-patches/bash32-010;patch=1;pnum=0 \
-           http://ftp.gnu.org/gnu/bash/bash-3.2-patches/bash32-011;patch=1;pnum=0 \
-           http://ftp.gnu.org/gnu/bash/bash-3.2-patches/bash32-012;patch=1;pnum=0 \
-           http://ftp.gnu.org/gnu/bash/bash-3.2-patches/bash32-013;patch=1;pnum=0 \
-           http://ftp.gnu.org/gnu/bash/bash-3.2-patches/bash32-014;patch=1;pnum=0 \
-           http://ftp.gnu.org/gnu/bash/bash-3.2-patches/bash32-015;patch=1;pnum=0 \
-           http://ftp.gnu.org/gnu/bash/bash-3.2-patches/bash32-016;patch=1;pnum=0 \
-           http://ftp.gnu.org/gnu/bash/bash-3.2-patches/bash32-017;patch=1;pnum=0 \
-           http://ftp.gnu.org/gnu/bash/bash-3.2-patches/bash32-018;patch=1;pnum=0 \
-           http://ftp.gnu.org/gnu/bash/bash-3.2-patches/bash32-019;patch=1;pnum=0 \
-           http://ftp.gnu.org/gnu/bash/bash-3.2-patches/bash32-020;patch=1;pnum=0 \
-           http://ftp.gnu.org/gnu/bash/bash-3.2-patches/bash32-021;patch=1;pnum=0 \
-           http://ftp.gnu.org/gnu/bash/bash-3.2-patches/bash32-022;patch=1;pnum=0 \
-           http://ftp.gnu.org/gnu/bash/bash-3.2-patches/bash32-023;patch=1;pnum=0 \
-           http://ftp.gnu.org/gnu/bash/bash-3.2-patches/bash32-024;patch=1;pnum=0 \
-           http://ftp.gnu.org/gnu/bash/bash-3.2-patches/bash32-025;patch=1;pnum=0 \
-           http://ftp.gnu.org/gnu/bash/bash-3.2-patches/bash32-026;patch=1;pnum=0 \
-           http://ftp.gnu.org/gnu/bash/bash-3.2-patches/bash32-027;patch=1;pnum=0 \
-           http://ftp.gnu.org/gnu/bash/bash-3.2-patches/bash32-028;patch=1;pnum=0 \
-           http://ftp.gnu.org/gnu/bash/bash-3.2-patches/bash32-029;patch=1;pnum=0 \
-           http://ftp.gnu.org/gnu/bash/bash-3.2-patches/bash32-030;patch=1;pnum=0 \
-           http://ftp.gnu.org/gnu/bash/bash-3.2-patches/bash32-031;patch=1;pnum=0 \
-           http://ftp.gnu.org/gnu/bash/bash-3.2-patches/bash32-032;patch=1;pnum=0 \
-           http://ftp.gnu.org/gnu/bash/bash-3.2-patches/bash32-033;patch=1;pnum=0 \
-           http://ftp.gnu.org/gnu/bash/bash-3.2-patches/bash32-034;patch=1;pnum=0 \
-           http://ftp.gnu.org/gnu/bash/bash-3.2-patches/bash32-035;patch=1;pnum=0 \
-           http://ftp.gnu.org/gnu/bash/bash-3.2-patches/bash32-036;patch=1;pnum=0 \
-           http://ftp.gnu.org/gnu/bash/bash-3.2-patches/bash32-037;patch=1;pnum=0 \
-           http://ftp.gnu.org/gnu/bash/bash-3.2-patches/bash32-038;patch=1;pnum=0 \
-           http://ftp.gnu.org/gnu/bash/bash-3.2-patches/bash32-039;patch=1;pnum=0 \
+           ${GNU_MIRROR}/bash/bash-3.2-patches/bash32-001;patch=1;pnum=0 \
+           ${GNU_MIRROR}/bash/bash-3.2-patches/bash32-002;patch=1;pnum=0 \
+           ${GNU_MIRROR}/bash/bash-3.2-patches/bash32-003;patch=1;pnum=0 \
+           ${GNU_MIRROR}/bash/bash-3.2-patches/bash32-004;patch=1;pnum=0 \
+           ${GNU_MIRROR}/bash/bash-3.2-patches/bash32-005;patch=1;pnum=0 \
+           ${GNU_MIRROR}/bash/bash-3.2-patches/bash32-006;patch=1;pnum=0 \
+           ${GNU_MIRROR}/bash/bash-3.2-patches/bash32-007;patch=1;pnum=0 \
+           ${GNU_MIRROR}/bash/bash-3.2-patches/bash32-008;patch=1;pnum=0 \
+           ${GNU_MIRROR}/bash/bash-3.2-patches/bash32-009;patch=1;pnum=0 \
+           ${GNU_MIRROR}/bash/bash-3.2-patches/bash32-010;patch=1;pnum=0 \
+           ${GNU_MIRROR}/bash/bash-3.2-patches/bash32-011;patch=1;pnum=0 \
+           ${GNU_MIRROR}/bash/bash-3.2-patches/bash32-012;patch=1;pnum=0 \
+           ${GNU_MIRROR}/bash/bash-3.2-patches/bash32-013;patch=1;pnum=0 \
+           ${GNU_MIRROR}/bash/bash-3.2-patches/bash32-014;patch=1;pnum=0 \
+           ${GNU_MIRROR}/bash/bash-3.2-patches/bash32-015;patch=1;pnum=0 \
+           ${GNU_MIRROR}/bash/bash-3.2-patches/bash32-016;patch=1;pnum=0 \
+           ${GNU_MIRROR}/bash/bash-3.2-patches/bash32-017;patch=1;pnum=0 \
+           ${GNU_MIRROR}/bash/bash-3.2-patches/bash32-018;patch=1;pnum=0 \
+           ${GNU_MIRROR}/bash/bash-3.2-patches/bash32-019;patch=1;pnum=0 \
+           ${GNU_MIRROR}/bash/bash-3.2-patches/bash32-020;patch=1;pnum=0 \
+           ${GNU_MIRROR}/bash/bash-3.2-patches/bash32-021;patch=1;pnum=0 \
+           ${GNU_MIRROR}/bash/bash-3.2-patches/bash32-022;patch=1;pnum=0 \
+           ${GNU_MIRROR}/bash/bash-3.2-patches/bash32-023;patch=1;pnum=0 \
+           ${GNU_MIRROR}/bash/bash-3.2-patches/bash32-024;patch=1;pnum=0 \
+           ${GNU_MIRROR}/bash/bash-3.2-patches/bash32-025;patch=1;pnum=0 \
+           ${GNU_MIRROR}/bash/bash-3.2-patches/bash32-026;patch=1;pnum=0 \
+           ${GNU_MIRROR}/bash/bash-3.2-patches/bash32-027;patch=1;pnum=0 \
+           ${GNU_MIRROR}/bash/bash-3.2-patches/bash32-028;patch=1;pnum=0 \
+           ${GNU_MIRROR}/bash/bash-3.2-patches/bash32-029;patch=1;pnum=0 \
+           ${GNU_MIRROR}/bash/bash-3.2-patches/bash32-030;patch=1;pnum=0 \
+           ${GNU_MIRROR}/bash/bash-3.2-patches/bash32-031;patch=1;pnum=0 \
+           ${GNU_MIRROR}/bash/bash-3.2-patches/bash32-032;patch=1;pnum=0 \
+           ${GNU_MIRROR}/bash/bash-3.2-patches/bash32-033;patch=1;pnum=0 \
+           ${GNU_MIRROR}/bash/bash-3.2-patches/bash32-034;patch=1;pnum=0 \
+           ${GNU_MIRROR}/bash/bash-3.2-patches/bash32-035;patch=1;pnum=0 \
+           ${GNU_MIRROR}/bash/bash-3.2-patches/bash32-036;patch=1;pnum=0 \
+           ${GNU_MIRROR}/bash/bash-3.2-patches/bash32-037;patch=1;pnum=0 \
+           ${GNU_MIRROR}/bash/bash-3.2-patches/bash32-038;patch=1;pnum=0 \
+           ${GNU_MIRROR}/bash/bash-3.2-patches/bash32-039;patch=1;pnum=0 \
            file://default_path.patch;patch=1 \
            "
diff --git a/recipes/binutils/binutils_2.17.bb b/recipes/binutils/binutils_2.17.bb
index ceea7c6..20ede8d 100644
--- a/recipes/binutils/binutils_2.17.bb
+++ b/recipes/binutils/binutils_2.17.bb
@@ -5,7 +5,7 @@ INC_PR = "r7"
 PR = "${INC_PR}.1"
 
 SRC_URI = \
-    "http://ftp.gnu.org/gnu/binutils/binutils-${PV}.tar.bz2 \
+    "${GNU_MIRROR}/binutils/binutils-${PV}.tar.bz2 \
      file://better_file_error.patch;patch=1 \
      file://signed_char_fix.patch;patch=1 \
 "
diff --git a/recipes/ccrtp/ccrtp_1.7.0.bb b/recipes/ccrtp/ccrtp_1.7.0.bb
index 5f0b1c1..13c2abb 100644
--- a/recipes/ccrtp/ccrtp_1.7.0.bb
+++ b/recipes/ccrtp/ccrtp_1.7.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://freshmeat.net/projects/ccrtp"
 LICENSE = "GPL"
 PR="r0"
 DEPENDS = "commoncpp2"
-SRC_URI = "ftp://ftp.gnu.org/gnu/ccrtp/ccrtp-${PV}.tar.gz \
+SRC_URI = "${GNU_MIRROR}/ccrtp/ccrtp-${PV}.tar.gz \
 	file://configure.ac.patch;patch=1"
 
 inherit autotools pkgconfig autotools_stage
diff --git a/recipes/classpath/inetlib_1.1.1.bb b/recipes/classpath/inetlib_1.1.1.bb
index 1fba4b4..0564cfe 100644
--- a/recipes/classpath/inetlib_1.1.1.bb
+++ b/recipes/classpath/inetlib_1.1.1.bb
@@ -4,7 +4,7 @@ AUTHOR = "GNU Classpath"
 HOMEPAGE = "http://gnu.org/software/classpath/inetlib.html"
 
 SRC_URI = "\
-  http://ftp.gnu.org/gnu/classpath/${BP}.tar.gz \
+  ${GNU_MIRROR}/classpath/${BP}.tar.gz \
   file://datadir_java.patch;patch=1 \
   "
 
diff --git a/recipes/classpathx/gnujaf_1.1.1.bb b/recipes/classpathx/gnujaf_1.1.1.bb
index 1ae4717..7409aa9 100644
--- a/recipes/classpathx/gnujaf_1.1.1.bb
+++ b/recipes/classpathx/gnujaf_1.1.1.bb
@@ -3,7 +3,7 @@ LICENSE = "GPL + library exception"
 AUTHOR = "GNU ClasspathX"
 
 SRC_URI = "\
-  http://ftp.gnu.org/gnu/classpathx/activation-${PV}.tar.gz \
+  ${GNU_MIRROR}/classpathx/activation-${PV}.tar.gz \
   file://datadir_java.patch;patch=1 \
   "
 
diff --git a/recipes/classpathx/gnumail_1.1.2.bb b/recipes/classpathx/gnumail_1.1.2.bb
index 4e67558..2737848 100644
--- a/recipes/classpathx/gnumail_1.1.2.bb
+++ b/recipes/classpathx/gnumail_1.1.2.bb
@@ -3,7 +3,7 @@ LICENSE = "GPL + library exception"
 AUTHOR = "GNU ClasspathX"
 
 SRC_URI = "\
-  http://ftp.gnu.org/gnu/classpathx/mail-${PV}.tar.gz \
+  ${GNU_MIRROR}/classpathx/mail-${PV}.tar.gz \
   file://datadir_java.patch;patch=1 \
   "
 
diff --git a/recipes/commoncpp/commoncpp2_1.7.1.bb b/recipes/commoncpp/commoncpp2_1.7.1.bb
index d89c34a..b698211 100644
--- a/recipes/commoncpp/commoncpp2_1.7.1.bb
+++ b/recipes/commoncpp/commoncpp2_1.7.1.bb
@@ -4,7 +4,7 @@ LICENSE = "GPL"
 PR="r2"
 PARALLEL_MAKE = ""
 
-SRC_URI = "ftp://ftp.gnu.org/gnu/commoncpp/commoncpp2-${PV}.tar.gz \
+SRC_URI = "${GNU_MIRROR}/commoncpp/commoncpp2-${PV}.tar.gz \
 	file://configure.ac.patch;patch=1"
 
 inherit autotools pkgconfig autotools_stage binconfig
diff --git a/recipes/coreutils/coreutils-7.1.inc b/recipes/coreutils/coreutils-7.1.inc
index 7f77b9b..aa2a107 100644
--- a/recipes/coreutils/coreutils-7.1.inc
+++ b/recipes/coreutils/coreutils-7.1.inc
@@ -1,6 +1,6 @@
 require coreutils.inc
 
-SRC_URI = "ftp://ftp.gnu.org/gnu/coreutils/coreutils-${PV}.tar.gz"
+SRC_URI = "${GNU_MIRROR}/coreutils/coreutils-${PV}.tar.gz"
 
 # not thoroughly tested yet
 DEFAULT_PREFERENCE = "-1"
diff --git a/recipes/coreutils/coreutils-7.2.inc b/recipes/coreutils/coreutils-7.2.inc
index 7ab4221..bbc99c2 100644
--- a/recipes/coreutils/coreutils-7.2.inc
+++ b/recipes/coreutils/coreutils-7.2.inc
@@ -1,4 +1,4 @@
 require coreutils.inc
 
-SRC_URI = "ftp://ftp.gnu.org/gnu/coreutils/coreutils-${PV}.tar.gz \
+SRC_URI = "${GNU_MIRROR}/coreutils/coreutils-${PV}.tar.gz \
            file://coreutils-7.2-fix-sort-segfault.patch;patch=1"
diff --git a/recipes/coreutils/coreutils_7.6.bb b/recipes/coreutils/coreutils_7.6.bb
index 5fec096..f8eafad 100644
--- a/recipes/coreutils/coreutils_7.6.bb
+++ b/recipes/coreutils/coreutils_7.6.bb
@@ -1,7 +1,7 @@
 require coreutils.inc
 
 SRC_URI = "\
-  ftp://ftp.gnu.org/gnu/coreutils/coreutils-${PV}.tar.gz \
+  ${GNU_MIRROR}/coreutils/coreutils-${PV}.tar.gz \
   file://onceonly.m4 \
 "
 
diff --git a/recipes/dejagnu/dejagnu_1.4.4.bb b/recipes/dejagnu/dejagnu_1.4.4.bb
index 9d5d7f7..3f0b89e 100644
--- a/recipes/dejagnu/dejagnu_1.4.4.bb
+++ b/recipes/dejagnu/dejagnu_1.4.4.bb
@@ -3,7 +3,7 @@ LICENSE = "GPL"
 SECTION = "devel"
 PR = "r1"
 
-SRC_URI = "ftp://ftp.gnu.org/gnu/dejagnu/dejagnu-${PV}.tar.gz"
+SRC_URI = "${GNU_MIRROR}/dejagnu/dejagnu-${PV}.tar.gz"
 
 inherit autotools
 
diff --git a/recipes/glibc/glibc_2.3.2.bb b/recipes/glibc/glibc_2.3.2.bb
index 152d261..d72d3fe 100644
--- a/recipes/glibc/glibc_2.3.2.bb
+++ b/recipes/glibc/glibc_2.3.2.bb
@@ -41,7 +41,7 @@ FILES_localedef = "${bindir}/localedef"
 RDEPENDS_${PN}-dev = "linux-libc-headers-dev"
 RPROVIDES_${PN}-dev += "libc-dev virtual-libc-dev"
 
-SRC_URI = "ftp://ftp.gnu.org/gnu/glibc/glibc-${PV}.tar.gz \
+SRC_URI = "${GNU_MIRROR}/glibc/glibc-${PV}.tar.gz \
 	   ftp://ftp.gnu.org/pub/gnu/glibc/glibc-linuxthreads-2.3.2.tar.gz \
 	   file://noinfo.patch;patch=1 \
 	   file://10_cvs.patch;patch=1 \
diff --git a/recipes/glibc/glibc_2.3.3.bb b/recipes/glibc/glibc_2.3.3.bb
index f832cb3..fd5ef46 100644
--- a/recipes/glibc/glibc_2.3.3.bb
+++ b/recipes/glibc/glibc_2.3.3.bb
@@ -44,7 +44,7 @@ FILES_localedef = "${bindir}/localedef"
 RDEPENDS_${PN}-dev = "linux-libc-headers-dev"
 RPROVIDES_${PN}-dev += "libc-dev virtual-libc-dev"
 
-SRC_URI = "ftp://ftp.gnu.org/gnu/glibc/glibc-${PV}.tar.gz \
+SRC_URI = "${GNU_MIRROR}/glibc/glibc-${PV}.tar.gz \
 	   ftp://ftp.gnu.org/pub/gnu/glibc/glibc-linuxthreads-${PV}.tar.gz \
 	   file://etc/ld.so.conf \
  	   file://generate-supported.mk"
diff --git a/recipes/gnuradio/gnuradio_3.1.3.bb b/recipes/gnuradio/gnuradio_3.1.3.bb
index 685b317..366a4be 100644
--- a/recipes/gnuradio/gnuradio_3.1.3.bb
+++ b/recipes/gnuradio/gnuradio_3.1.3.bb
@@ -2,7 +2,7 @@ require gnuradio-libusb-compat.inc
 
 PR = "${INC_PR}.1"
 
-SRC_URI = "ftp://ftp.gnu.org/gnu/gnuradio/gnuradio-${PV}.tar.gz \
+SRC_URI = "${GNU_MIRROR}/gnuradio/gnuradio-${PV}.tar.gz \
 	   file://acinclude.m4 \
       ${SOURCEFORGE_MIRROR}/libusb/libusb-0.1.12.tar.gz \
 "
diff --git a/recipes/gnuradio/gnuradio_3.2.0.bb b/recipes/gnuradio/gnuradio_3.2.0.bb
index cf2491b..b72b445 100644
--- a/recipes/gnuradio/gnuradio_3.2.0.bb
+++ b/recipes/gnuradio/gnuradio_3.2.0.bb
@@ -8,7 +8,7 @@ S = "${WORKDIR}/gnuradio-3.2"
 
 EXTRA_OECONF += "--with-boost=${STAGING_DIR_TARGET}/usr CXXFLAGS=-DBOOST_SP_USE_PTHREADS --disable--usrp2"
 
-SRC_URI = "ftp://ftp.gnu.org/gnu/gnuradio/gnuradio-3.2.tar.gz \
+SRC_URI = "${GNU_MIRROR}/gnuradio/gnuradio-3.2.tar.gz \
     file://no-usrp2.patch;patch=1 \
     file://gnuradio-neon.patch;patch=1;pnum=0 \
      ${SOURCEFORGE_MIRROR}/libusb/libusb-0.1.12.tar.gz \
diff --git a/recipes/gnuradio/gnuradio_3.2.1.bb b/recipes/gnuradio/gnuradio_3.2.1.bb
index f919492..01ec9e9 100644
--- a/recipes/gnuradio/gnuradio_3.2.1.bb
+++ b/recipes/gnuradio/gnuradio_3.2.1.bb
@@ -8,7 +8,7 @@ S = "${WORKDIR}/gnuradio-3.2.1"
 
 EXTRA_OECONF += "--with-boost=${STAGING_DIR_TARGET}/usr CXXFLAGS=-DBOOST_SP_USE_PTHREADS --disable--usrp2"
 
-SRC_URI = "ftp://ftp.gnu.org/gnu/gnuradio/gnuradio-3.2.1.tar.gz \
+SRC_URI = "${GNU_MIRROR}/gnuradio/gnuradio-3.2.1.tar.gz \
     file://no-usrp2.patch;patch=1 \
     file://gnuradio-neon.patch;patch=1;pnum=0 \
      ${SOURCEFORGE_MIRROR}/libusb/libusb-0.1.12.tar.gz \
diff --git a/recipes/groff/groff_1.19.1.bb b/recipes/groff/groff_1.19.1.bb
index dbf21e7..5727de5 100644
--- a/recipes/groff/groff_1.19.1.bb
+++ b/recipes/groff/groff_1.19.1.bb
@@ -3,7 +3,7 @@ SECTION = "base"
 LICENSE = "GPL"
 PR = "r3"
 
-SRC_URI = "http://ftp.gnu.org/gnu/groff/groff-${PV}.tar.gz \
+SRC_URI = "${GNU_MIRROR}/groff/groff-${PV}.tar.gz \
 	           file://groff.patch;patch=1"
 
 PARALLEL_MAKE = ""
diff --git a/recipes/groff/groff_1.19.2.bb b/recipes/groff/groff_1.19.2.bb
index 5598263..30cc477 100644
--- a/recipes/groff/groff_1.19.2.bb
+++ b/recipes/groff/groff_1.19.2.bb
@@ -3,7 +3,7 @@ SECTION = "base"
 LICENSE = "GPL"
 PR = "r5"
 
-SRC_URI = "http://ftp.gnu.org/gnu/groff/groff-${PV}.tar.gz \
+SRC_URI = "${GNU_MIRROR}/groff/groff-${PV}.tar.gz \
 	           file://Makefile.in.patch;patch=1 \
 	           file://Makefile.sub.patch;patch=1 \
 	           file://groff.patch;patch=1"
diff --git a/recipes/libcgicc/libcgicc.inc b/recipes/libcgicc/libcgicc.inc
index ee7a1f5..5a580bb 100644
--- a/recipes/libcgicc/libcgicc.inc
+++ b/recipes/libcgicc/libcgicc.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "a C++ class library for writing CGI applications"
 HOMEPAGE = "http://www.gnu.org/software/cgicc/"
 LICENSE = "http://www.gnu.org/software/cgicc/doc/cgicc_license.html"
 
-SRC_URI = "ftp://ftp.gnu.org/gnu/cgicc/cgicc-${PV}.tar.gz"
+SRC_URI = "${GNU_MIRROR}/cgicc/cgicc-${PV}.tar.gz"
 
 S = "${WORKDIR}/cgicc-${PV}"
 
diff --git a/recipes/libmicrohttpd/libmicrohttpd_0.4.2.bb b/recipes/libmicrohttpd/libmicrohttpd_0.4.2.bb
index cdf721c..4ff00a0 100644
--- a/recipes/libmicrohttpd/libmicrohttpd_0.4.2.bb
+++ b/recipes/libmicrohttpd/libmicrohttpd_0.4.2.bb
@@ -5,7 +5,7 @@ SECTION = "libs"
 LICENSE = "LGPL"
 PR = "r2"
 
-SRC_URI = "ftp://ftp.gnu.org/gnu/libmicrohttpd/libmicrohttpd-${PV}.tar.gz"
+SRC_URI = "${GNU_MIRROR}/libmicrohttpd/libmicrohttpd-${PV}.tar.gz"
 
 inherit autotools pkgconfig
 
diff --git a/recipes/macchanger/macchanger_1.5.0.bb b/recipes/macchanger/macchanger_1.5.0.bb
index e631299..9ba02b2 100644
--- a/recipes/macchanger/macchanger_1.5.0.bb
+++ b/recipes/macchanger/macchanger_1.5.0.bb
@@ -4,6 +4,6 @@ LICENSE = "GPL"
 SECTION = "net"
 PRIORITY = "optional"
 
-SRC_URI = "ftp://ftp.gnu.org/gnu/macchanger/macchanger-${PV}.tar.gz"
+SRC_URI = "${GNU_MIRROR}/macchanger/macchanger-${PV}.tar.gz"
 
 inherit autotools
diff --git a/recipes/mtools/mtools_4.0.10.bb b/recipes/mtools/mtools_4.0.10.bb
index 18fbb7d..a1f1a18 100644
--- a/recipes/mtools/mtools_4.0.10.bb
+++ b/recipes/mtools/mtools_4.0.10.bb
@@ -7,7 +7,7 @@ DESCRIPTION="Mtools is a collection of utilities for accessing MS-DOS disks from
 HOMEPAGE="http://mtools.linux.lu"
 LICENSE="GPL"
 
-SRC_URI="http://ftp.gnu.org/gnu/mtools/mtools-${PV}.tar.bz2 \
+SRC_URI="${GNU_MIRROR}/mtools/mtools-${PV}.tar.bz2 \
 	file://m486.patch;patch=1 \
 	file://mtools-makeinfo.patch;patch=1 \
 	file://plainio.patch;patch=1 \
diff --git a/recipes/parted/files/parted-1.8.x.patch b/recipes/parted/files/parted-1.8.x.patch
index 167a0fb..62b2ddf 100644
--- a/recipes/parted/files/parted-1.8.x.patch
+++ b/recipes/parted/files/parted-1.8.x.patch
@@ -121,7 +121,7 @@ index 139ea77..86ec076 100644
 -@item Boot your system 
 +@item Boot your system
  
- @item Download @file{parted-static-VERSION.tgz} from @uref{ftp://ftp.gnu.org/gnu/parted/static}
+ @item Download @file{parted-static-VERSION.tgz} from @uref{${GNU_MIRROR}/parted/static}
  @item Unpack the tarball, resulting in a file called ``parted.static".
 @@ -329,7 +329,7 @@ of the latest GNU Parted version is available, which you can use thus:
  
diff --git a/recipes/readline/readline_5.2.bb b/recipes/readline/readline_5.2.bb
index a7dc818..83f6dd4 100644
--- a/recipes/readline/readline_5.2.bb
+++ b/recipes/readline/readline_5.2.bb
@@ -10,7 +10,7 @@ RPROVIDES_${PN} += "readline"
 LEAD_SONAME = "libreadline.so"
 PR = "r4"
 
-SRC_URI = "ftp://ftp.gnu.org/gnu/readline/readline-${PV}.tar.gz \
+SRC_URI = "${GNU_MIRROR}/readline/readline-${PV}.tar.gz \
            file://configure_fix.patch;patch=1 \
            file://acinclude.m4"
 
diff --git a/recipes/ttf-fonts/ttf-freefonts_20090104.bb b/recipes/ttf-fonts/ttf-freefonts_20090104.bb
index 316873d..f5732ae 100644
--- a/recipes/ttf-fonts/ttf-freefonts_20090104.bb
+++ b/recipes/ttf-fonts/ttf-freefonts_20090104.bb
@@ -5,7 +5,7 @@ HOMEPAGE="http://savannah.nongnu.org/projects/freefont/"
 
 PR = "r1"
 
-SRC_URI = "http://ftp.gnu.org/gnu/freefont/freefont-ttf-${PV}.tar.gz"
+SRC_URI = "${GNU_MIRROR}/freefont/freefont-ttf-${PV}.tar.gz"
 
 S = "${WORKDIR}/freefont-${PV}"
 
diff --git a/recipes/usrp/usrp_0.12.bb b/recipes/usrp/usrp_0.12.bb
index 6302080..46038a3 100644
--- a/recipes/usrp/usrp_0.12.bb
+++ b/recipes/usrp/usrp_0.12.bb
@@ -6,7 +6,7 @@ DEPENDS = "swig-native sdcc-native virtual/libusb0 python boost"
 RDEPENDS = "python-core"
 PR = "r1"
 
-SRC_URI = "ftp://ftp.gnu.org/gnu/gnuradio/usrp-${PV}.tar.gz \
+SRC_URI = "${GNU_MIRROR}/gnuradio/usrp-${PV}.tar.gz \
            file://fix_compile_h.patch;patch=1;pnum=3 \
            file://install_test.patch;patch=1"
 
diff --git a/recipes/webkit/files/autogen.sh b/recipes/webkit/files/autogen.sh
index 1c0fc61..7b69a3a 100644
--- a/recipes/webkit/files/autogen.sh
+++ b/recipes/webkit/files/autogen.sh
@@ -14,7 +14,7 @@ DIE=0
 	echo
 	echo "You must have autoconf installed to compile $PROJECT."
 	echo "Install the appropriate package for your distribution,"
-	echo "or get the source tarball at http://ftp.gnu.org/gnu/autoconf/"
+	echo "or get the source tarball at ${GNU_MIRROR}/autoconf/"
 	DIE=1
 }
 
@@ -22,7 +22,7 @@ DIE=0
 	echo
 	echo "You must have automake installed to compile $PROJECT."
 	echo "Install the appropriate package for your distribution,"
-	echo "or get the source tarball at http://ftp.gnu.org/gnu/automake/"
+	echo "or get the source tarball at ${GNU_MIRROR}/automake/"
 	DIE=1
 }
 
diff --git a/recipes/webkit/webkit-gtk/autogen.sh b/recipes/webkit/webkit-gtk/autogen.sh
index 97beb20..144dc30 100644
--- a/recipes/webkit/webkit-gtk/autogen.sh
+++ b/recipes/webkit/webkit-gtk/autogen.sh
@@ -19,7 +19,7 @@ DIE=0
     echo
     echo "You must have autoconf installed to compile $PROJECT."
     echo "Install the appropriate package for your distribution,"
-    echo "or get the source tarball at http://ftp.gnu.org/gnu/autoconf/"
+    echo "or get the source tarball at ${GNU_MIRROR}/autoconf/"
     DIE=1
 }
 
@@ -27,7 +27,7 @@ DIE=0
     echo
     echo "You must have automake installed to compile $PROJECT."
     echo "Install the appropriate package for your distribution,"
-    echo "or get the source tarball at http://ftp.gnu.org/gnu/automake/"
+    echo "or get the source tarball at ${GNU_MIRROR}/automake/"
     DIE=1
 }
 
@@ -38,7 +38,7 @@ LIBTOOLIZE=libtoolize
         echo
         echo "You must have libtool installed to compile $PROJECT."
         echo "Install the appropriate package for your distribution,"
-        echo "or get the source tarball at http://ftp.gnu.org/gnu/libtool/"
+        echo "or get the source tarball at ${GNU_MIRROR}/libtool/"
         DIE=1
     }
 }
diff --git a/recipes/xbmc/libcdio_0.81.bb b/recipes/xbmc/libcdio_0.81.bb
index e900336..3e8f1b3 100644
--- a/recipes/xbmc/libcdio_0.81.bb
+++ b/recipes/xbmc/libcdio_0.81.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "The GNU Compact Disc Input and Control library (libcdio) contains a library for CD-ROM and CD image access."
 LICENSE = "GPL"
 
-SRC_URI = "http://ftp.gnu.org/gnu/libcdio/libcdio-${PV}.tar.gz"
+SRC_URI = "${GNU_MIRROR}/libcdio/libcdio-${PV}.tar.gz"
 
 inherit autotools
 
diff --git a/recipes/xboard/xboard_4.4.1.bb b/recipes/xboard/xboard_4.4.1.bb
index 0c31b9c..5887810 100644
--- a/recipes/xboard/xboard_4.4.1.bb
+++ b/recipes/xboard/xboard_4.4.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.tim-mann.org/xboard.html"
 SECTION = "games"
 LICENSE = "GPL"
 DEPENDS = "libxaw libsm libx11 libxt libxmu libxext libice"
-SRC_URI = "http://ftp.gnu.org/gnu/xboard/xboard-${PV}.tar.gz \
+SRC_URI = "${GNU_MIRROR}/xboard/xboard-${PV}.tar.gz \
 	   file://no-strip.patch;patch=1;pnum=2"
 
 inherit autotools
-- 
1.6.5



