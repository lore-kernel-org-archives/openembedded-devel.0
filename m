Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web09.24722.1628524130609280761
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Aug 2021 08:48:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id C8B241C0005;
	Mon,  9 Aug 2021 15:48:48 +0000 (UTC)
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: openembedded-devel@lists.openembedded.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [meta-multimedia][PATCH] vorbis-tools: update to 1.4.2 (latest in 1.4.x series)
Date: Mon,  9 Aug 2021 17:48:44 +0200
Message-Id: <20210809154844.124173-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This allows to get rid of 2 patches,
included in this release

Update the gettext patch, still not applied in this version

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 ...c-Fix-large-alloca-on-bad-AIFF-input.patch | 49 -------------------
 ...-blocking-compilation-with-hardening.patch | 26 ----------
 .../vorbis-tools/vorbis-tools/gettext.patch   | 32 ++++++------
 ...s-tools_1.4.0.bb => vorbis-tools_1.4.2.bb} |  6 +--
 4 files changed, 18 insertions(+), 95 deletions(-)
 delete mode 100644 meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools/0001-oggenc-Fix-large-alloca-on-bad-AIFF-input.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools/0004-Fix-format-error-blocking-compilation-with-hardening.patch
 rename meta-multimedia/recipes-multimedia/vorbis-tools/{vorbis-tools_1.4.0.bb => vorbis-tools_1.4.2.bb} (72%)

diff --git a/meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools/0001-oggenc-Fix-large-alloca-on-bad-AIFF-input.patch b/meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools/0001-oggenc-Fix-large-alloca-on-bad-AIFF-input.patch
deleted file mode 100644
index b623dbf37..000000000
--- a/meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools/0001-oggenc-Fix-large-alloca-on-bad-AIFF-input.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-Upstream-Status: Backport
-
-Backport patch to fix CVE-2015-6749 from:
-
-https://trac.xiph.org/ticket/2212
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
----
-From 04815d3e1bfae3a6cdfb2c25358a5a72b61299f7 Mon Sep 17 00:00:00 2001
-From: Mark Harris <mark.hsj@gmail.com>
-Date: Sun, 30 Aug 2015 05:54:46 -0700
-Subject: [PATCH] oggenc: Fix large alloca on bad AIFF input
-
-Fixes #2212
----
- oggenc/audio.c | 10 +++++-----
- 1 file changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/oggenc/audio.c b/oggenc/audio.c
-index 477da8c..4921fb9 100644
---- a/oggenc/audio.c
-+++ b/oggenc/audio.c
-@@ -245,8 +245,8 @@ static int aiff_permute_matrix[6][6] =
- int aiff_open(FILE *in, oe_enc_opt *opt, unsigned char *buf, int buflen)
- {
-     int aifc; /* AIFC or AIFF? */
--    unsigned int len;
--    unsigned char *buffer;
-+    unsigned int len, readlen;
-+    unsigned char buffer[22];
-     unsigned char buf2[8];
-     aiff_fmt format;
-     aifffile *aiff = malloc(sizeof(aifffile));
-@@ -269,9 +269,9 @@ int aiff_open(FILE *in, oe_enc_opt *opt, unsigned char *buf, int buflen)
-         return 0; /* Weird common chunk */
-     }
- 
--    buffer = alloca(len);
--
--    if(fread(buffer,1,len,in) < len)
-+    readlen = len < sizeof(buffer) ? len : sizeof(buffer);
-+    if(fread(buffer,1,readlen,in) < readlen ||
-+       (len > readlen && !seek_forward(in, len-readlen)))
-     {
-         fprintf(stderr, _("Warning: Unexpected EOF in reading AIFF header\n"));
-         return 0;
--- 
-2.5.0
-
diff --git a/meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools/0004-Fix-format-error-blocking-compilation-with-hardening.patch b/meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools/0004-Fix-format-error-blocking-compilation-with-hardening.patch
deleted file mode 100644
index 111e98ac1..000000000
--- a/meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools/0004-Fix-format-error-blocking-compilation-with-hardening.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From: Petter Reinholdtsen <pere@hungry.com>
-Date: Wed, 22 Oct 2014 13:25:21 +0200
-Subject: Fix format error blocking compilation with hardening
-
-Last-Update: 2014-10-22
-Forwarded: no
-
-Enabling hardening refuses to compile code with sprintf() calls
-with no formatting string. Adjust the code to work with hardening.
----
- ogg123/status.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/ogg123/status.c b/ogg123/status.c
-index 92b8ff1..ccec389 100644
---- a/ogg123/status.c
-+++ b/ogg123/status.c
-@@ -148,7 +148,7 @@ int print_statistics_line (stat_format_t stats[])
- 
-     switch (stats->type) {
-     case stat_noarg:
--      len += sprintf(str+len, stats->formatstr);
-+      len += sprintf(str+len, "%s", stats->formatstr);
-       break;
-     case stat_intarg:
-       len += sprintf(str+len, stats->formatstr, stats->arg.intarg);
diff --git a/meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools/gettext.patch b/meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools/gettext.patch
index b61ce7c18..dd03fa952 100644
--- a/meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools/gettext.patch
+++ b/meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools/gettext.patch
@@ -2,23 +2,10 @@ Fix build with gettext 0.20.x
 
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -2,8 +2,8 @@
- 
- AUTOMAKE_OPTIONS = foreign dist-zip
- 
--SUBDIRS = po intl include share debian win32 @OPT_SUBDIRS@
--DIST_SUBDIRS = po intl include share debian win32 ogg123 oggenc oggdec ogginfo \
-+SUBDIRS = po include share debian win32 @OPT_SUBDIRS@
-+DIST_SUBDIRS = po include share debian win32 ogg123 oggenc oggdec ogginfo \
- 	vcut vorbiscomment m4
- 
- EXTRA_DIST = config.rpath README AUTHORS COPYING CHANGES vorbis-tools.spec config.h mkinstalldirs
+Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
 --- a/configure.ac
 +++ b/configure.ac
-@@ -31,7 +31,7 @@ CFLAGS="$cflags_save"
+@@ -34,7 +34,7 @@
  AC_PROG_LIBTOOL
  
  ALL_LINGUAS="be cs da en_GB eo es fr hr hu nl pl ro ru sk sv uk vi"
@@ -27,7 +14,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
  dnl --------------------------------------------------
  dnl System checks
-@@ -383,7 +383,6 @@ AC_OUTPUT([
+@@ -397,7 +397,6 @@
  Makefile
  m4/Makefile
  po/Makefile.in
@@ -35,3 +22,16 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  include/Makefile
  share/Makefile
  win32/Makefile
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -2,8 +2,8 @@
+ 
+ AUTOMAKE_OPTIONS = foreign dist-zip
+ 
+-SUBDIRS = po intl include share win32 @OPT_SUBDIRS@
+-DIST_SUBDIRS = po intl include share win32 ogg123 oggenc oggdec ogginfo \
++SUBDIRS = po include share win32 @OPT_SUBDIRS@
++DIST_SUBDIRS = po include share win32 ogg123 oggenc oggdec ogginfo \
+ 	vcut vorbiscomment m4
+ 
+ EXTRA_DIST = config.rpath README AUTHORS COPYING CHANGES
diff --git a/meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools_1.4.0.bb b/meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools_1.4.2.bb
similarity index 72%
rename from meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools_1.4.0.bb
rename to meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools_1.4.2.bb
index 89e66528a..f399bfaa2 100644
--- a/meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools_1.4.0.bb
+++ b/meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools_1.4.2.bb
@@ -11,13 +11,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 DEPENDS = "libogg libvorbis"
 
 SRC_URI = "http://downloads.xiph.org/releases/vorbis/${BP}.tar.gz \
-           file://0001-oggenc-Fix-large-alloca-on-bad-AIFF-input.patch \
-           file://0004-Fix-format-error-blocking-compilation-with-hardening.patch \
            file://gettext.patch \
           "
 
-SRC_URI[md5sum] = "567e0fb8d321b2cd7124f8208b8b90e6"
-SRC_URI[sha256sum] = "a389395baa43f8e5a796c99daf62397e435a7e73531c9f44d9084055a05d22bc"
+SRC_URI[md5sum] = "998fca293bd4e4bdc2b96fb70f952f4e"
+SRC_URI[sha256sum] = "db7774ec2bf2c939b139452183669be84fda5774d6400fc57fde37f77624f0b0"
 
 inherit autotools pkgconfig gettext
 
-- 
2.25.1

