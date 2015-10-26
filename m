Return-Path: <mbc@koumoul.net>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id A997B6013D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Oct 2015 02:25:37 +0000 (UTC)
Received: by wicll6 with SMTP id ll6so94878870wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Oct 2015 19:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=koumoul.net; s=dkim;
	h=sender:from:to:cc:subject:date:message-id;
	bh=dTG4huItto/85h1d74Ytg7M6euSIJtUsRy/g2K7maJU=;
	b=JeuwuTu0oFNkb5mcjih50DqC+bvRUPwPoYaM5I2IVbGLOe2hbg+G2vjKoE5zAeaL9v
	P22tSWjrgV8V5nJI0lRTlhHdMbpEmMzzV1tSYqjnb9llyEzClfwhKz6vj74dbIdE5kcy
	jkNDyKziigXGF/X7txHu6juk0mDxDPjc38P/c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=dTG4huItto/85h1d74Ytg7M6euSIJtUsRy/g2K7maJU=;
	b=Uqph3VAO4qJI+eJ0ByPgONRtIbGsvt8MUDYNO5ovStSP1GRB6SfrgzLpoy+NacvC4G
	SpocjipGC+5BAC4CNy8HcblXhh92GdQhJTV9PnyWQfFJ47pBjf6QQGoXMAdLqGsm0n39
	YMiFoiH0QvZ4PJzYSOKLwL6+uKDBKhBRfhzJ/Meoe1VRFYoFtTqAKI6jFCubgATDpAIW
	s/GEosJUc5QK2vRLmMkxuz4Xz22hf7ktJJImWLwkUB0Hu1ujoHOwzpuAYay54rp2B0ay
	n2itQNa6UFdvcC3lRBo3iaV6VUuZqwuTGYriAR6wjvxyJFS4sj5vJcH+a26MzGcTEXLO
	8nDg==
X-Gm-Message-State: ALoCoQl2hsto3wRgesZqCndC2Pu3YboQKu3HFOv+ttpzuMzq78QvXRswReXE/AntAlA9oj+WkDP4
X-Received: by 10.194.222.5 with SMTP id qi5mr17599670wjc.106.1445826337544;
	Sun, 25 Oct 2015 19:25:37 -0700 (PDT)
Received: from localhost.localdomain
	(ARennes-655-1-12-240.w109-218.abo.wanadoo.fr. [109.218.219.240])
	by smtp.gmail.com with ESMTPSA id
	lg1sm12036920wic.17.2015.10.25.19.25.36
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 25 Oct 2015 19:25:37 -0700 (PDT)
Sender: "Manuel Bachmann [ IoT.bzh ]" <mbc@koumoul.net>
From: Manuel Bachmann <manuel.bachmann@iot.bzh>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 26 Oct 2015 03:28:28 +0100
Message-Id: <1445826508-3159-1-git-send-email-manuel.bachmann@iot.bzh>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH][meta-efl] lightmediascanner: Update to 0.5.1, improve
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
X-List-Received-Date: Mon, 26 Oct 2015 02:25:40 -0000

We update "lightmediascanner" to its latest version,
which also allows us to :
- remove mentions of former company (now dissolved)
and website (now migrated to GitHub) ;
- properly split all plugins into subpackages ;
- have a new plugin based on libav, "generic", which
we do not automatically enable because of the well-known
licensing restrictions of its parent package.

MP4 plugin is disabled, because it depends on the MP4v2
library, which we do not have.

ID3 plugin requires a patch, already sent to upstream :
https://github.com/profusion/lightmediascanner/pull/19

meta-openembedded's only dependent recipe, "enjoy", has
been verified with this change.

Signed-off-by: Manuel Bachmann <manuel.bachmann@iot.bzh>
---
 .../id3-plugin-support-out-of-tree-build.patch     | 11 ++++
 .../lightmediascanner/lightmediascanner_0.4.4.bb   | 39 --------------
 .../lightmediascanner/lightmediascanner_0.5.1.bb   | 62 ++++++++++++++++++++++
 3 files changed, 73 insertions(+), 39 deletions(-)
 create mode 100644 meta-efl/recipes-multimedia/lightmediascanner/files/id3-plugin-support-out-of-tree-build.patch
 delete mode 100644 meta-efl/recipes-multimedia/lightmediascanner/lightmediascanner_0.4.4.bb
 create mode 100644 meta-efl/recipes-multimedia/lightmediascanner/lightmediascanner_0.5.1.bb

diff --git a/meta-efl/recipes-multimedia/lightmediascanner/files/id3-plugin-support-out-of-tree-build.patch b/meta-efl/recipes-multimedia/lightmediascanner/files/id3-plugin-support-out-of-tree-build.patch
new file mode 100644
index 0000000..9528bec
--- /dev/null
+++ b/meta-efl/recipes-multimedia/lightmediascanner/files/id3-plugin-support-out-of-tree-build.patch
@@ -0,0 +1,11 @@
+--- a/src/plugins/Makefile.am	2015-10-25 16:12:29.331415823 +0000
++++ b/src/plugins/Makefile.am	2015-10-25 16:14:37.593415808 +0000
+@@ -93,7 +93,7 @@
+ id3_id3_la_SOURCES = id3/id3.c id3/id3v1_genres.c
+ id3_id3_la_LIBADD = $(PLUGINS_LIBADD)
+ 
+-id3/id3v1_genres.c: $(srcdir)/id3/id3v1_genres.def $(srcdir)/id3/id3v1_genres_gen.awk
++$(srcdir)/id3/id3v1_genres.c: $(srcdir)/id3/id3v1_genres.def $(srcdir)/id3/id3v1_genres_gen.awk
+ 	$(AWK) -f $(srcdir)/id3/id3v1_genres_gen.awk $(srcdir)/id3/id3v1_genres.def > $@
+ 
+ EXTRA_DIST += id3/id3v1_genres.def id3/id3v1_genres_gen.awk
diff --git a/meta-efl/recipes-multimedia/lightmediascanner/lightmediascanner_0.4.4.bb b/meta-efl/recipes-multimedia/lightmediascanner/lightmediascanner_0.4.4.bb
deleted file mode 100644
index 4ed3664..0000000
--- a/meta-efl/recipes-multimedia/lightmediascanner/lightmediascanner_0.4.4.bb
+++ /dev/null
@@ -1,39 +0,0 @@
-SUMMARY = "Lightweight media scanner meant to be used in not-so-powerful devices"
-AUTHOR = "ProFUSION"
-HOMEPAGE = "http://lms.garage.maemo.org/"
-SECTION = "libs/multimedia"
-LICENSE = "LGPLv2.1+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
-DEPENDS = "sqlite3 flac virtual/libiconv"
-
-PR = "r2"
-
-SRC_URI = "https://github.com/profusion/lightmediascanner/archive/release_${PV}.tar.gz \
-"
-SRC_URI[md5sum] = "0c758d40eb70288a2c714dfb44c35171"
-SRC_URI[sha256sum] = "1bbc28fbe5efbc24aa4eac9e43bbb178a1669de1418afee47b0c6898aff53433"
-
-S = "${WORKDIR}/lightmediascanner-release_${PV}"
-
-PACKAGECONFIG ??= ""
-PACKAGECONFIG[ogg] = "--enable-ogg,--disable-ogg,libvorbis"
-
-inherit autotools pkgconfig
-
-do_install_append() {
-    install -d ${D}/${bindir}/
-    install -m 755 ${B}/src/bin/.libs/test  ${D}/${bindir}/test-lms
-}
-
-PACKAGES =+ "${PN}-test"
-
-FILES_${PN}-test = "${bindir}/test-lms"
-
-FILES_${PN}-dbg += "${libdir}/${PN}/plugins/.debug"
-FILES_${PN}-staticdev += "${libdir}/${PN}/plugins/*.a"
-
-# otherwise fails with ERROR: could not add conversion charset 'UTF-16BE': Invalid argument
-RDEPENDS_${PN}-test_append_libc-glibc = " glibc-gconv-utf-16"
-
-# png.so jpeg.so id3.so are provided also by imlib2-loaders
-PRIVATE_LIBS_${PN} = "video-dummy.so png.so jpeg.so id3.so pls.so audio-dummy.so rm.so ogg.so dummy.so m3u.so flac.so asf.so"
diff --git a/meta-efl/recipes-multimedia/lightmediascanner/lightmediascanner_0.5.1.bb b/meta-efl/recipes-multimedia/lightmediascanner/lightmediascanner_0.5.1.bb
new file mode 100644
index 0000000..9870fac
--- /dev/null
+++ b/meta-efl/recipes-multimedia/lightmediascanner/lightmediascanner_0.5.1.bb
@@ -0,0 +1,62 @@
+SUMMARY = "Lightweight media scanner"
+DESCRIPTION = "Lightweight media scanner meant to be used in not-so-powerful devices, like embedded systems or old machines."
+SECTION = "libs/multimedia"
+
+LICENSE = "LGPLv2.1+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
+                    file://src/lib/lightmediascanner.c;endline=21;md5=6d8889bccb4c6c27e8b786342a3eb267"
+
+DEPENDS = "file gawk glib-2.0 sqlite3"
+
+PV = "0.5.1+git${SRCPV}"
+SRCREV = "adfddb3486276a5ed2f5008c9e43a811e1271cc9"
+SRC_URI = "git://github.com/profusion/lightmediascanner.git \
+           file://id3-plugin-support-out-of-tree-build.patch \
+          "
+
+S = "${WORKDIR}/git"
+
+inherit autotools pkgconfig
+
+EXTRA_OECONF = "--enable-static --disable-mp4"
+
+PACKAGECONFIG ??= "ogg flac wave id3 m3u pls asf rm jpeg png"
+PACKAGECONFIG[generic] = "--enable-generic,--disable-generic,libav"
+PACKAGECONFIG[ogg] = "--enable-ogg,--disable-ogg,libogg libvorbis libtheora"
+PACKAGECONFIG[flac] = "--enable-flac,--disable-flac,flac"
+PACKAGECONFIG[wave] = "--enable-wave,--disable-wave"
+PACKAGECONFIG[id3] = "--enable-id3,--disable-id3"
+PACKAGECONFIG[m3u] = "--enable-m3u,--disable-m3u"
+PACKAGECONFIG[pls] = "--enable-pls,--disable-pls"
+PACKAGECONFIG[asf] = "--enable-asf,--disable-asf"
+PACKAGECONFIG[rm] = "--enable-rm,--disable-rm"
+PACKAGECONFIG[jpeg] = "--enable-jpeg,--disable-jpeg"
+PACKAGECONFIG[png] = "--enable-png,--disable-png"
+
+do_install_append() {
+       # Install "test" binary for corresponding package
+       install -d ${D}/${bindir}
+       install -m 755 ${B}/src/bin/.libs/test ${D}/${bindir}/test-lms
+       # Remove .la files for loadable modules
+       rm -f ${D}/${libdir}/${PN}/plugins/*.la
+}
+
+FILES_${PN} += "${datadir}/dbus-1"
+FILES_${PN}-dbg += "${libdir}/${PN}/plugins/.debug"
+
+PACKAGES_prepend = "${PN}-test "
+FILES_${PN}-test_prepend = "${bindir}/test-lms "
+
+PACKAGES += "${PN}-meta"
+ALLOW_EMPTY_${PN}-meta = "1"
+
+PACKAGES_DYNAMIC = "${PN}-plugin-*"
+
+python populate_packages_prepend () {
+    lms_libdir = d.expand('${libdir}/${PN}')
+    pkgs = []
+
+    pkgs += do_split_packages(d, oe.path.join(lms_libdir, "plugins"), '^(.*)\.so$', d.expand('${PN}-plugin-%s'), 'LightMediaScanner plugin for %s', prepend=True, extra_depends=d.expand('${PN}'))
+    metapkg = d.getVar('PN', True) + '-meta'
+    d.setVar('RDEPENDS_' + metapkg, ' '.join(pkgs))
+}
-- 
1.8.3.1


