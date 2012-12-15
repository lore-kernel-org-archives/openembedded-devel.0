Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1TjwAJ-0001AE-OD
	for openembedded-devel@lists.openembedded.org;
	Sat, 15 Dec 2012 19:08:47 +0100
Received: by mail-bk0-f47.google.com with SMTP id j4so2053296bkw.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Dec 2012 09:54:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=2k5qbO4Se5vKARqQuQWBqsusSQTEd0Ybw/uzDmp+Elc=;
	b=sXVP+zF9ucC4GoPrBoeurHQSctuEr1E7lv3d/DkWXmOvGKrfitH9OF3Il2xMj6y3lD
	g8VFRWZds3EJDbu5g3aNfsxpRjG1PtDBWsA1+IwhX0ekWAIy1pQV8lp/6sQGc57x9GRL
	+y7CxttZ28TMqObap0qznt2F9amO0qesCV5H/YhUzJitB0OgtB7fY6a9PtnmeYbr3YlF
	oRlEA4l0PjSih2qo6TrtU1tmGMI6eJ1TCH1K2wDfB53mXRLpLCRiLna14uN3Sx7v6LhM
	t9lIS8w7ZVzcmMvYDVf8UqtyNWuvpH+BnoIiYvtcnlO9bxKyRDWM5qqUDTRcnpHeb+HF
	DC3w==
Received: by 10.204.147.216 with SMTP id m24mr4242294bkv.63.1355594049873;
	Sat, 15 Dec 2012 09:54:09 -0800 (PST)
Received: from prime (a91-153-8-136.elisa-laajakaista.fi. [91.153.8.136])
	by mx.google.com with ESMTPS id hm8sm6579759bkc.10.2012.12.15.09.54.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 15 Dec 2012 09:54:09 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1Tjvw7-0002zq-4t; Sat, 15 Dec 2012 19:54:07 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 15 Dec 2012 19:54:06 +0200
Message-Id: <1355594046-11305-1-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [meta-oe][PATCH] libsdl-mixer: update to upstream version 1.2.12
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
X-List-Received-Date: Sat, 15 Dec 2012 18:08:47 -0000

Now uses zlib license.
Dropped fix-flac-madness patch as upsream configure check in question
now uses AC_TRY_COMPILE instead of AC_TRY_RUN.

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 .../libsdl-mixer/libsdl-mixer/configure.patch      |    9 +++----
 .../libsdl-mixer/fix-flac-madness.diff             |   28 --------------------
 ...bsdl-mixer_1.2.11.bb => libsdl-mixer_1.2.12.bb} |   10 +++----
 3 files changed, 9 insertions(+), 38 deletions(-)
 delete mode 100644 meta-oe/recipes-multimedia/libsdl-mixer/libsdl-mixer/fix-flac-madness.diff
 rename meta-oe/recipes-multimedia/libsdl-mixer/{libsdl-mixer_1.2.11.bb => libsdl-mixer_1.2.12.bb} (78%)

diff --git a/meta-oe/recipes-multimedia/libsdl-mixer/libsdl-mixer/configure.patch b/meta-oe/recipes-multimedia/libsdl-mixer/libsdl-mixer/configure.patch
index 7cc69e0..4c9e8d0 100644
--- a/meta-oe/recipes-multimedia/libsdl-mixer/libsdl-mixer/configure.patch
+++ b/meta-oe/recipes-multimedia/libsdl-mixer/libsdl-mixer/configure.patch
@@ -1,11 +1,10 @@
-Index: SDL_mixer-1.2.11/configure.in
-===================================================================
---- SDL_mixer-1.2.11.orig/configure.in	2011-02-15 11:54:23.929086120 +0100
-+++ SDL_mixer-1.2.11/configure.in	2011-02-15 11:56:53.745736645 +0100
+diff -Nurd SDL_mixer-1.2.12/configure.in SDL_mixer-1.2.12/configure.in
+--- SDL_mixer-1.2.12/configure.in	2012-01-16 00:01:05.000000000 +0200
++++ SDL_mixer-1.2.12/configure.in	2012-12-15 04:08:04.627871456 +0200
 @@ -1,6 +1,5 @@
  dnl Process this file with autoconf to produce a configure script.
  AC_INIT(README)
--AC_CONFIG_AUX_DIRS($srcdir/build-scripts)
+-AC_CONFIG_AUX_DIR(build-scripts)
  
  dnl Set various version strings - taken gratefully from the GTk sources
  
diff --git a/meta-oe/recipes-multimedia/libsdl-mixer/libsdl-mixer/fix-flac-madness.diff b/meta-oe/recipes-multimedia/libsdl-mixer/libsdl-mixer/fix-flac-madness.diff
deleted file mode 100644
index 48fe88e..0000000
--- a/meta-oe/recipes-multimedia/libsdl-mixer/libsdl-mixer/fix-flac-madness.diff
+++ /dev/null
@@ -1,28 +0,0 @@
---- /tmp/configure.in	2009-12-02 16:18:33.000000000 +0100
-+++ SDL_mixer-1.2.11/configure.in	2009-12-02 16:20:02.000000000 +0100
-@@ -413,24 +413,7 @@
-               [], [enable_music_flac_shared=yes])
- if test x$enable_music_flac = xyes; then
-     AC_CHECK_HEADER([FLAC/export.h], [have_flac_export=yes])
--    if test x$have_flac_export = xyes; then
--        LIBS_SAVED="$LIBS"
--        LIBS="-lFLAC"
--        AC_MSG_CHECKING([for libflac so-name version >= $libflac_ver])
--        AC_TRY_RUN([
--#include "FLAC/export.h"
--#include "stdio.h"
--int main( int argc, char *argv[] ) {
--#if defined(FLAC_API_VERSION_CURRENT) && (FLAC_API_VERSION_CURRENT >= $libflac_ver)
--    return 0;
--#else
--    return 1;
--#endif
--}
--], have_flac_ver=yes, have_flac_ver=no)
--        LIBS="$LIBS_SAVED"
--        AC_MSG_RESULT($have_flac_ver)
--    fi
-+	have_flac_ver=yes
- 
-     if test x$have_flac_ver = xyes; then
-         AC_CHECK_HEADER([FLAC/stream_decoder.h], [have_flac_hdr=yes])
diff --git a/meta-oe/recipes-multimedia/libsdl-mixer/libsdl-mixer_1.2.11.bb b/meta-oe/recipes-multimedia/libsdl-mixer/libsdl-mixer_1.2.12.bb
similarity index 78%
rename from meta-oe/recipes-multimedia/libsdl-mixer/libsdl-mixer_1.2.11.bb
rename to meta-oe/recipes-multimedia/libsdl-mixer/libsdl-mixer_1.2.12.bb
index bccbc50..c8fa6ca 100644
--- a/meta-oe/recipes-multimedia/libsdl-mixer/libsdl-mixer_1.2.11.bb
+++ b/meta-oe/recipes-multimedia/libsdl-mixer/libsdl-mixer_1.2.12.bb
@@ -1,15 +1,15 @@
 DESCRIPTION = "Simple DirectMedia Layer mixer library."
 SECTION = "libs"
 DEPENDS = "virtual/libsdl flac libmikmod libvorbis  ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'libmad', d)}"
-LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=27818cd7fd83877a8e3ef82b82798ef4"
+LICENSE = "zlib"
+LIC_FILES_CHKSUM = "file://COPYING;md5=a37a47a0e579e461474cd03b9e05199d"
 
 SRC_URI = "http://www.libsdl.org/projects/SDL_mixer/release/SDL_mixer-${PV}.tar.gz \
-           file://fix-flac-madness.diff \
            file://configure.patch \
           "
-SRC_URI[md5sum] = "65ada3d997fe85109191a5fb083f248c"
-SRC_URI[sha256sum] = "86145ac39cac6d2c6169c226f937648dca5e89dcd828751763dd174fa9af9cf9"
+
+SRC_URI[md5sum] = "e03ff73d77a55e3572ad0217131dc4a1"
+SRC_URI[sha256sum] = "1644308279a975799049e4826af2cfc787cad2abb11aa14562e402521f86992a"
 
 S = "${WORKDIR}/SDL_mixer-${PV}"
 
-- 
1.7.10.4



