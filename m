Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C7C0C369C2
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 05:30:42 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web11.33339.1745299836980029767
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Apr 2025 22:30:37 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd88.aul.t-online.de (fwd88.aul.t-online.de [10.223.144.114])
	by mailout04.t-online.de (Postfix) with SMTP id C6F407F6;
	Tue, 22 Apr 2025 07:30:34 +0200 (CEST)
Received: from [192.168.178.20] ([84.163.42.91]) by fwd88.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1u76DF-1W5kZM0; Tue, 22 Apr 2025 07:30:29 +0200
Date: Tue, 22 Apr 2025 07:30:23 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe][PATCHv2] libsdl2-mixer: update and build with
 cmake
To: openembedded-devel@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
Message-Id: <NYT3VS.0QWRDWHGHFW32@t-online.de>
In-Reply-To: <18388CC518336062.2510@lists.openembedded.org>
References: <18388CC518336062.2510@lists.openembedded.org>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-PE/cxDK32wRFl7upKVrQ"
X-TOI-EXPURGATEID: 150726::1745299829-1B7FD92D-B4887799/0/0 CLEAN NORMAL
X-TOI-MSGID: 8eb4dc47-be7a-46c3-b423-0a1648790293
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 05:30:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117018

--=-PE/cxDK32wRFl7upKVrQ
Content-Type: text/plain; charset=us-ascii; format=flowed

v2: Add PACKAGECONFIGS for the options, make sure that libsdl2-mixer 
can be compiled without these options and add 'flac wave vorbis' as 
default

On Tue, Apr 22 2025 at 07:26:59 +02:00:00, Markus Volk 
<f_l_k@t-online.de> wrote:
> ---
>  ...figure.in-Undefine-AC_CONFIG_AUX_DIR.patch | 34 ------------------
>  .../libsdl/libsdl2-mixer_2.0.4.bb             | 27 --------------
>  .../libsdl/libsdl2-mixer_2.8.1.bb             | 36 
> +++++++++++++++++++
>  3 files changed, 36 insertions(+), 61 deletions(-)
>  delete mode 100644 
> meta-oe/recipes-graphics/libsdl/libsdl2-mixer/0001-configure.in-Undefine-AC_CONFIG_AUX_DIR.patch
>  delete mode 100644 
> meta-oe/recipes-graphics/libsdl/libsdl2-mixer_2.0.4.bb
>  create mode 100644 
> meta-oe/recipes-graphics/libsdl/libsdl2-mixer_2.8.1.bb
> 
> diff --git 
> a/meta-oe/recipes-graphics/libsdl/libsdl2-mixer/0001-configure.in-Undefine-AC_CONFIG_AUX_DIR.patch 
> b/meta-oe/recipes-graphics/libsdl/libsdl2-mixer/0001-configure.in-Undefine-AC_CONFIG_AUX_DIR.patch
> deleted file mode 100644
> index 0605b32e30..0000000000
> --- 
> a/meta-oe/recipes-graphics/libsdl/libsdl2-mixer/0001-configure.in-Undefine-AC_CONFIG_AUX_DIR.patch
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -From 9363c98528ef850235852e44f678df6b5c011ee1 Mon Sep 17 00:00:00 
> 2001
> -From: Khem Raj <raj.khem@gmail.com <mailto:raj.khem@gmail.com>>
> -Date: Sun, 7 Feb 2021 18:08:36 -0800
> -Subject: [PATCH] configure.in: Undefine AC_CONFIG_AUX_DIR
> -
> -This helps reconfiguring with autotools 2.70+
> -
> -Upstream-Status: Pending
> -Signed-off-by: Khem Raj <raj.khem@gmail.com 
> <mailto:raj.khem@gmail.com>>
> ----
> - configure.in | 5 -----
> - 1 file changed, 5 deletions(-)
> -
> ---- a/configure.in
> -+++ b/configure.in
> -@@ -1,7 +1,6 @@
> - dnl Process this file with autoconf to produce a configure script.
> - AC_INIT(README.txt)
> - AC_CONFIG_AUX_DIR(build-scripts)
> --
> - dnl Set various version strings - taken gratefully from the GTk 
> sources
> -
> - # Making releases:
> -@@ -40,10 +39,6 @@ AC_SUBST(LT_CURRENT)
> - AC_SUBST(LT_REVISION)
> - AC_SUBST(LT_AGE)
> -
> --dnl Detect the canonical build and host environments
> --AC_CONFIG_AUX_DIRS($srcdir/build-scripts)
> --dnl AC_CANONICAL_HOST
> --
> - dnl Check for tools
> - AC_PROG_LIBTOOL
> - AC_PROG_CC
> diff --git a/meta-oe/recipes-graphics/libsdl/libsdl2-mixer_2.0.4.bb 
> b/meta-oe/recipes-graphics/libsdl/libsdl2-mixer_2.0.4.bb
> deleted file mode 100644
> index dbcb2a193b..0000000000
> --- a/meta-oe/recipes-graphics/libsdl/libsdl2-mixer_2.0.4.bb
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -SUMMARY = "Simple DirectMedia Layer mixer library V2"
> -SECTION = "libs"
> -DEPENDS = "libsdl2 flac libmikmod libvorbis"
> -LICENSE = "Zlib"
> -LIC_FILES_CHKSUM = 
> "file://COPYING.txt;md5=516daf7a177ad4c8874bb9efa1a69c1f" 
> <file://copying.txt;md5=516daf7a177ad4c8874bb9efa1a69c1f/>
> -
> -SRC_URI = 
> "http://www.libsdl.org/projects/SDL_mixer/release/SDL2_mixer-${PV}.tar.gz 
> <http://www.libsdl.org/projects/SDL_mixer/release/SDL2_mixer-$%7BPV%7D.tar.gz> 
> \
> -           file://0001-configure.in-Undefine-AC_CONFIG_AUX_DIR.patch 
> <file://0001-configure.in-undefine-ac_config_aux_dir.patch/> \
> -          "
> -SRC_URI[sha256sum] = 
> "b4cf5a382c061cd75081cf246c2aa2f9df8db04bdda8dcdc6b6cca55bede2419"
> -
> -S = "${WORKDIR}/SDL2_mixer-${PV}"
> -
> -inherit autotools-brokensep pkgconfig
> -
> -EXTRA_OECONF = "--disable-music-mp3 --enable-music-ogg 
> --disable-music-ogg-shared LIBS=-L${STAGING_LIBDIR}"
> -
> -PACKAGECONFIG ??= ""
> -PACKAGECONFIG[mad] = 
> "--enable-music-mp3-mad-gpl,--disable-music-mp3-mad-gpl,libmad"
> -
> -do_configure:prepend () {
> -    # Remove old libtool macros.
> -    MACROS="libtool.m4 lt~obsolete.m4 ltoptions.m4 ltsugar.m4 
> ltversion.m4"
> -    for i in ${MACROS}; do
> -        rm -f acinclude/$i
> -    done
> -}
> diff --git a/meta-oe/recipes-graphics/libsdl/libsdl2-mixer_2.8.1.bb 
> b/meta-oe/recipes-graphics/libsdl/libsdl2-mixer_2.8.1.bb
> new file mode 100644
> index 0000000000..3eff30f825
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/libsdl/libsdl2-mixer_2.8.1.bb
> @@ -0,0 +1,36 @@
> +SUMMARY = "Simple DirectMedia Layer mixer library V2"
> +SECTION = "libs"
> +DEPENDS = "libsdl2"
> +LICENSE = "Zlib"
> +LIC_FILES_CHKSUM = 
> "file://LICENSE.txt;md5=fbb0010b2f7cf6e8a13bcac1ef4d2455" 
> <file://license.txt;md5=fbb0010b2f7cf6e8a13bcac1ef4d2455/>
> +
> +SRC_URI = 
> "http://www.libsdl.org/projects/SDL_mixer/release/SDL2_mixer-${PV}.tar.gz 
> <http://www.libsdl.org/projects/SDL_mixer/release/SDL2_mixer-$%7BPV%7D.tar.gz>"
> +SRC_URI[sha256sum] = 
> "cb760211b056bfe44f4a1e180cc7cb201137e4d1572f2002cc1be728efd22660"
> +
> +S = "${WORKDIR}/SDL2_mixer-${PV}"
> +
> +inherit cmake pkgconfig
> +
> +do_configure:prepend() {
> +	# cmake checks for these binaries. Touch them to pass the tests and 
> add RDEPENDS
> +	touch ${STAGING_BINDIR}/fluidsynth
> +	touch ${STAGING_BINDIR}/wavpack
> +	touch ${STAGING_BINDIR}/wvunpack
> +	touch ${STAGING_BINDIR}/wvgain
> +	touch ${STAGING_BINDIR}/wvtag
> +}
> +
> +EXTRA_OECMAKE += "${@bb.utils.contains 
> <mailto:${@bb.utils.contains>_any('PACKAGECONFIG', 'xmp modplug', 
> '-DSDL2MIXER_MOD=ON', '-DSDL2MIXER_MOD=OFF', d)}"
> +
> +PACKAGECONFIG ?= "flac wave vorbis"
> +PACKAGECONFIG[opusfile] = "-DSDL2MIXER_OPUS=ON 
> -DSDL2MIXER_OPUS_ENABLED=ON, -DSDL2MIXER_OPUS=OFF,opusfile"
> +PACKAGECONFIG[vorbis] = "-DSDL2MIXER_VORBIS=VORBISFILE 
> -DSDL2MIXER_VORBIS_VORBISFILE=ON, -DSDL2MIXER_VORBIS=OFF,libvorbis"
> +PACKAGECONFIG[flac] = "-DSDL2MIXER_FLAC=ON, 
> -DSDL2MIXER_FLAC=OFF,flac"
> +PACKAGECONFIG[xmp] = "-DSDL2MIXER_MOD_XMP=ON, 
> -DSDL2MIXER_MOD_XMP=OFF,libxmp,libxmp"
> +PACKAGECONFIG[modplug] = "-DSDL2MIXER_MOD_MODPLUG=ON, 
> -DSDL2MIXER_MOD_MODPLUG=OFF,libmodplug"
> +PACKAGECONFIG[fluidsynth] = "-DSDL2MIXER_MIDI=ON 
> -DSDL2MIXER_MIDI_FLUIDSYNTH_ENABLED=ON, 
> -DSDL2MIXER_MIDI=OFF,fluidsynth,fluidsynth-bin"
> +PACKAGECONFIG[wave] = "-DSDL2MIXER_WAVE=ON -DSDL2MIXER_WAVPACK=ON, 
> -DSDL2MIXER_WAVE=OFF,wavpack,wavpack wavpack-bin"
> +PACKAGECONFIG[mpg123] = "-DSDL2MIXER_MP3=ON 
> -DSDL2MIXER_MP3_MPG123=ON, -DSDL2MIXER_MP3=OFF,mpg123"
> +
> +FILES:${PN} += "${datadir}/licenses"
> +
> --
> 2.49.0
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#117017): 
> <https://lists.openembedded.org/g/openembedded-devel/message/117017>
> Mute This Topic: <https://lists.openembedded.org/mt/112390055/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org 
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-devel/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-PE/cxDK32wRFl7upKVrQ
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>v2: Add PACKAGECONFIGS for the options, make sure that libsdl2-mixer can be compiled without these options and add 'flac wave vorbis' as default</div></div><div id="geary-quote" dir="auto"><br>On Tue, Apr 22 2025 at 07:26:59 +02:00:00, Markus Volk &lt;f_l_k@t-online.de&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">---
 ...figure.in-Undefine-AC_CONFIG_AUX_DIR.patch | 34 ------------------
 .../libsdl/libsdl2-mixer_2.0.4.bb             | 27 --------------
 .../libsdl/libsdl2-mixer_2.8.1.bb             | 36 +++++++++++++++++++
 3 files changed, 36 insertions(+), 61 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/libsdl/libsdl2-mixer/0001-configure.in-Undefine-AC_CONFIG_AUX_DIR.patch
 delete mode 100644 meta-oe/recipes-graphics/libsdl/libsdl2-mixer_2.0.4.bb
 create mode 100644 meta-oe/recipes-graphics/libsdl/libsdl2-mixer_2.8.1.bb

diff --git a/meta-oe/recipes-graphics/libsdl/libsdl2-mixer/0001-configure.in-Undefine-AC_CONFIG_AUX_DIR.patch b/meta-oe/recipes-graphics/libsdl/libsdl2-mixer/0001-configure.in-Undefine-AC_CONFIG_AUX_DIR.patch
deleted file mode 100644
index 0605b32e30..0000000000
--- a/meta-oe/recipes-graphics/libsdl/libsdl2-mixer/0001-configure.in-Undefine-AC_CONFIG_AUX_DIR.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 9363c98528ef850235852e44f678df6b5c011ee1 Mon Sep 17 00:00:00 2001
-From: Khem Raj &lt;<a href="mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt;
-Date: Sun, 7 Feb 2021 18:08:36 -0800
-Subject: [PATCH] configure.in: Undefine AC_CONFIG_AUX_DIR
-
-This helps reconfiguring with autotools 2.70+
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj &lt;<a href="mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt;
----
- configure.in | 5 -----
- 1 file changed, 5 deletions(-)
-
---- a/configure.in
-+++ b/configure.in
-@@ -1,7 +1,6 @@
- dnl Process this file with autoconf to produce a configure script.
- AC_INIT(README.txt)
- AC_CONFIG_AUX_DIR(build-scripts)
--
- dnl Set various version strings - taken gratefully from the GTk sources
- 
- # Making releases:
-@@ -40,10 +39,6 @@ AC_SUBST(LT_CURRENT)
- AC_SUBST(LT_REVISION)
- AC_SUBST(LT_AGE)
- 
--dnl Detect the canonical build and host environments
--AC_CONFIG_AUX_DIRS($srcdir/build-scripts)
--dnl AC_CANONICAL_HOST
--
- dnl Check for tools
- AC_PROG_LIBTOOL
- AC_PROG_CC
diff --git a/meta-oe/recipes-graphics/libsdl/libsdl2-mixer_2.0.4.bb b/meta-oe/recipes-graphics/libsdl/libsdl2-mixer_2.0.4.bb
deleted file mode 100644
index dbcb2a193b..0000000000
--- a/meta-oe/recipes-graphics/libsdl/libsdl2-mixer_2.0.4.bb
+++ /dev/null
@@ -1,27 +0,0 @@
-SUMMARY = "Simple DirectMedia Layer mixer library V2"
-SECTION = "libs"
-DEPENDS = "libsdl2 flac libmikmod libvorbis"
-LICENSE = "Zlib"
-LIC_FILES_CHKSUM = "<a href="file://COPYING.txt;md5=516daf7a177ad4c8874bb9efa1a69c1f" "="">file://COPYING.txt;md5=516daf7a177ad4c8874bb9efa1a69c1f"</a>
-
-SRC_URI = "<a href="http://www.libsdl.org/projects/SDL_mixer/release/SDL2_mixer-${PV}.tar.gz">http://www.libsdl.org/projects/SDL_mixer/release/SDL2_mixer-${PV}.tar.gz</a> \
-           <a href="file://0001-configure.in-Undefine-AC_CONFIG_AUX_DIR.patch">file://0001-configure.in-Undefine-AC_CONFIG_AUX_DIR.patch</a> \
-          "
-SRC_URI[sha256sum] = "b4cf5a382c061cd75081cf246c2aa2f9df8db04bdda8dcdc6b6cca55bede2419"
-
-S = "${WORKDIR}/SDL2_mixer-${PV}"
-
-inherit autotools-brokensep pkgconfig
-
-EXTRA_OECONF = "--disable-music-mp3 --enable-music-ogg --disable-music-ogg-shared LIBS=-L${STAGING_LIBDIR}"
-
-PACKAGECONFIG ??= ""
-PACKAGECONFIG[mad] = "--enable-music-mp3-mad-gpl,--disable-music-mp3-mad-gpl,libmad"
-
-do_configure:prepend () {
-    # Remove old libtool macros.
-    MACROS="libtool.m4 lt~obsolete.m4 ltoptions.m4 ltsugar.m4 ltversion.m4"
-    for i in ${MACROS}; do
-        rm -f acinclude/$i
-    done
-}
diff --git a/meta-oe/recipes-graphics/libsdl/libsdl2-mixer_2.8.1.bb b/meta-oe/recipes-graphics/libsdl/libsdl2-mixer_2.8.1.bb
new file mode 100644
index 0000000000..3eff30f825
--- /dev/null
+++ b/meta-oe/recipes-graphics/libsdl/libsdl2-mixer_2.8.1.bb
@@ -0,0 +1,36 @@
+SUMMARY = "Simple DirectMedia Layer mixer library V2"
+SECTION = "libs"
+DEPENDS = "libsdl2"
+LICENSE = "Zlib"
+LIC_FILES_CHKSUM = "<a href="file://LICENSE.txt;md5=fbb0010b2f7cf6e8a13bcac1ef4d2455" "="">file://LICENSE.txt;md5=fbb0010b2f7cf6e8a13bcac1ef4d2455"</a>
+
+SRC_URI = "<a href="http://www.libsdl.org/projects/SDL_mixer/release/SDL2_mixer-${PV}.tar.gz">http://www.libsdl.org/projects/SDL_mixer/release/SDL2_mixer-${PV}.tar.gz</a>"
+SRC_URI[sha256sum] = "cb760211b056bfe44f4a1e180cc7cb201137e4d1572f2002cc1be728efd22660"
+
+S = "${WORKDIR}/SDL2_mixer-${PV}"
+
+inherit cmake pkgconfig
+
+do_configure:prepend() {
+	# cmake checks for these binaries. Touch them to pass the tests and add RDEPENDS
+	touch ${STAGING_BINDIR}/fluidsynth
+	touch ${STAGING_BINDIR}/wavpack
+	touch ${STAGING_BINDIR}/wvunpack
+	touch ${STAGING_BINDIR}/wvgain
+	touch ${STAGING_BINDIR}/wvtag
+}
+
+EXTRA_OECMAKE += "<a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>_any('PACKAGECONFIG', 'xmp modplug', '-DSDL2MIXER_MOD=ON', '-DSDL2MIXER_MOD=OFF', d)}"
+
+PACKAGECONFIG ?= "flac wave vorbis"
+PACKAGECONFIG[opusfile] = "-DSDL2MIXER_OPUS=ON -DSDL2MIXER_OPUS_ENABLED=ON, -DSDL2MIXER_OPUS=OFF,opusfile"
+PACKAGECONFIG[vorbis] = "-DSDL2MIXER_VORBIS=VORBISFILE -DSDL2MIXER_VORBIS_VORBISFILE=ON, -DSDL2MIXER_VORBIS=OFF,libvorbis"
+PACKAGECONFIG[flac] = "-DSDL2MIXER_FLAC=ON, -DSDL2MIXER_FLAC=OFF,flac"
+PACKAGECONFIG[xmp] = "-DSDL2MIXER_MOD_XMP=ON, -DSDL2MIXER_MOD_XMP=OFF,libxmp,libxmp"
+PACKAGECONFIG[modplug] = "-DSDL2MIXER_MOD_MODPLUG=ON, -DSDL2MIXER_MOD_MODPLUG=OFF,libmodplug"
+PACKAGECONFIG[fluidsynth] = "-DSDL2MIXER_MIDI=ON -DSDL2MIXER_MIDI_FLUIDSYNTH_ENABLED=ON, -DSDL2MIXER_MIDI=OFF,fluidsynth,fluidsynth-bin"
+PACKAGECONFIG[wave] = "-DSDL2MIXER_WAVE=ON -DSDL2MIXER_WAVPACK=ON, -DSDL2MIXER_WAVE=OFF,wavpack,wavpack wavpack-bin"
+PACKAGECONFIG[mpg123] = "-DSDL2MIXER_MP3=ON -DSDL2MIXER_MP3_MPG123=ON, -DSDL2MIXER_MP3=OFF,mpg123"
+
+FILES:${PN} += "${datadir}/licenses"
+
<div>-- 
</div>2.49.0

</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#117017): <a href="https://lists.openembedded.org/g/openembedded-devel/message/117017">https://lists.openembedded.org/g/openembedded-devel/message/117017</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/112390055/3618223">https://lists.openembedded.org/mt/112390055/3618223</a>
Group Owner: <a href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-PE/cxDK32wRFl7upKVrQ--


