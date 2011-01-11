Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Pcgb3-0000ZU-1T
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Jan 2011 16:57:21 +0100
Received: by mail-fx0-f47.google.com with SMTP id 17so19263450fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jan 2011 07:56:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=F7GcaR56YmxkGOdlHDHALSflvH1HgFhqv0eZP4A49Ck=;
	b=ghx+ve1DgeBWOnniinv5+elRhfHeh7nl9nAG43CiFkngxKXHss5bYFg7h0svRI8rJA
	hzyT+6yj08d4tqD2adFykrf+qSmEIwmyiGw/JuCFF9zYeGqwmfOSRXlGyzGC7d+UhO6w
	La2CAi3ZhH6Vb39jFKYL+ggodzYwZpTrzuZdI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=KfYRtnnuG/0NLiNcExRGIGqQmkL52tSAtpRmwPGsRmAMH9VpZ6eybeOJUXwlsLqcMF
	bg7qaU1RXcLRkF/6LONXbXlAhwLJGFh6Z4uMoO4kpj4orlrR0Zn8Sv7o8fii5CiGKAB/
	Ia+CAKcJ5slI3cYAdTP9NCsm1wq7FHAuTWv9s=
Received: by 10.223.103.6 with SMTP id i6mr3307910fao.84.1294761404715;
	Tue, 11 Jan 2011 07:56:44 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id b7sm4550591faa.42.2011.01.11.07.56.43
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 11 Jan 2011 07:56:44 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Jan 2011 16:56:28 +0100
Message-Id: <1294761389-13634-11-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.rc1
In-Reply-To: <1294761389-13634-1-git-send-email-Martin.Jansa@gmail.com>
References: <1294761389-13634-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH 11/12] xorg: new versions 2011-01-11
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
X-List-Received-Date: Tue, 11 Jan 2011 15:57:21 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...-config-replace-AC_CHECK_FILE-with-test-f.patch |   32 ------
 recipes/xorg-app/twm_1.0.5.bb                      |   15 ---
 recipes/xorg-app/twm_1.0.6.bb                      |   14 +++
 recipes/xorg-app/x11perf_1.5.2.bb                  |   10 --
 recipes/xorg-app/x11perf_1.5.3.bb                  |   10 ++
 recipes/xorg-app/xfindproxy_1.0.1.bb               |    7 --
 recipes/xorg-app/xfindproxy_1.0.2.bb               |    7 ++
 recipes/xorg-app/xfwp_1.0.1.bb                     |    7 --
 recipes/xorg-app/xfwp_1.0.2.bb                     |    7 ++
 recipes/xorg-app/xkbprint_1.0.2.bb                 |    7 --
 recipes/xorg-app/xkbprint_1.0.3.bb                 |    7 ++
 recipes/xorg-driver/xf86-input-evdev_2.5.0.bb      |    7 --
 recipes/xorg-driver/xf86-input-evdev_2.6.0.bb      |    7 ++
 recipes/xorg-proto/dmxproto_2.3.1.bb               |    6 +
 recipes/xorg-proto/dmxproto_2.3.bb                 |    6 -
 recipes/xorg-proto/evieext_1.1.0.bb                |    6 -
 recipes/xorg-proto/evieext_1.1.1.bb                |    6 +
 recipes/xorg-proto/printproto_1.0.4.bb             |    6 -
 recipes/xorg-proto/printproto_1.0.5.bb             |    6 +
 recipes/xorg-proto/xf86driproto_2.1.0.bb           |    6 -
 recipes/xorg-proto/xf86driproto_2.1.1.bb           |    6 +
 recipes/xorg-proto/xf86vidmodeproto_2.3.1.bb       |    8 ++
 recipes/xorg-proto/xf86vidmodeproto_2.3.bb         |    8 --
 recipes/xorg-proto/xineramaproto_1.2.1.bb          |    6 +
 recipes/xorg-proto/xineramaproto_1.2.bb            |    6 -
 recipes/xorg-util/xorg-cf-files_1.0.3.bb           |   10 --
 recipes/xorg-util/xorg-cf-files_1.0.4.bb           |   10 ++
 .../xserver-xorg-1.9.3.901/dolt-fix.patch          |   22 ++++
 ...ack-assume-pixman-supports-overlapped-blt.patch |   14 +++
 .../hack-fbdev-ignore-return-mode.patch            |   39 ++++++++
 .../xserver-xorg-1.9.3.901/randr-support.patch     |  102 ++++++++++++++++++++
 .../xorg-xserver/xserver-xorg-1.9.3/dolt-fix.patch |   22 ----
 ...ack-assume-pixman-supports-overlapped-blt.patch |   14 ---
 .../hack-fbdev-ignore-return-mode.patch            |   39 --------
 .../xserver-xorg-1.9.3/randr-support.patch         |  102 --------------------
 recipes/xorg-xserver/xserver-xorg_1.9.3.901.bb     |   33 +++++++
 recipes/xorg-xserver/xserver-xorg_1.9.3.bb         |   33 -------
 37 files changed, 310 insertions(+), 343 deletions(-)
 delete mode 100644 recipes/xorg-app/twm-1.0.5/0001-config-replace-AC_CHECK_FILE-with-test-f.patch
 delete mode 100644 recipes/xorg-app/twm_1.0.5.bb
 create mode 100644 recipes/xorg-app/twm_1.0.6.bb
 delete mode 100644 recipes/xorg-app/x11perf_1.5.2.bb
 create mode 100644 recipes/xorg-app/x11perf_1.5.3.bb
 delete mode 100644 recipes/xorg-app/xfindproxy_1.0.1.bb
 create mode 100644 recipes/xorg-app/xfindproxy_1.0.2.bb
 delete mode 100644 recipes/xorg-app/xfwp_1.0.1.bb
 create mode 100644 recipes/xorg-app/xfwp_1.0.2.bb
 delete mode 100644 recipes/xorg-app/xkbprint_1.0.2.bb
 create mode 100644 recipes/xorg-app/xkbprint_1.0.3.bb
 delete mode 100644 recipes/xorg-driver/xf86-input-evdev_2.5.0.bb
 create mode 100644 recipes/xorg-driver/xf86-input-evdev_2.6.0.bb
 create mode 100644 recipes/xorg-proto/dmxproto_2.3.1.bb
 delete mode 100644 recipes/xorg-proto/dmxproto_2.3.bb
 delete mode 100644 recipes/xorg-proto/evieext_1.1.0.bb
 create mode 100644 recipes/xorg-proto/evieext_1.1.1.bb
 delete mode 100644 recipes/xorg-proto/printproto_1.0.4.bb
 create mode 100644 recipes/xorg-proto/printproto_1.0.5.bb
 delete mode 100644 recipes/xorg-proto/xf86driproto_2.1.0.bb
 create mode 100644 recipes/xorg-proto/xf86driproto_2.1.1.bb
 create mode 100644 recipes/xorg-proto/xf86vidmodeproto_2.3.1.bb
 delete mode 100644 recipes/xorg-proto/xf86vidmodeproto_2.3.bb
 create mode 100644 recipes/xorg-proto/xineramaproto_1.2.1.bb
 delete mode 100644 recipes/xorg-proto/xineramaproto_1.2.bb
 delete mode 100644 recipes/xorg-util/xorg-cf-files_1.0.3.bb
 create mode 100644 recipes/xorg-util/xorg-cf-files_1.0.4.bb
 create mode 100644 recipes/xorg-xserver/xserver-xorg-1.9.3.901/dolt-fix.patch
 create mode 100644 recipes/xorg-xserver/xserver-xorg-1.9.3.901/hack-assume-pixman-supports-overlapped-blt.patch
 create mode 100644 recipes/xorg-xserver/xserver-xorg-1.9.3.901/hack-fbdev-ignore-return-mode.patch
 create mode 100644 recipes/xorg-xserver/xserver-xorg-1.9.3.901/randr-support.patch
 delete mode 100644 recipes/xorg-xserver/xserver-xorg-1.9.3/dolt-fix.patch
 delete mode 100644 recipes/xorg-xserver/xserver-xorg-1.9.3/hack-assume-pixman-supports-overlapped-blt.patch
 delete mode 100644 recipes/xorg-xserver/xserver-xorg-1.9.3/hack-fbdev-ignore-return-mode.patch
 delete mode 100644 recipes/xorg-xserver/xserver-xorg-1.9.3/randr-support.patch
 create mode 100644 recipes/xorg-xserver/xserver-xorg_1.9.3.901.bb
 delete mode 100644 recipes/xorg-xserver/xserver-xorg_1.9.3.bb

diff --git a/recipes/xorg-app/twm-1.0.5/0001-config-replace-AC_CHECK_FILE-with-test-f.patch b/recipes/xorg-app/twm-1.0.5/0001-config-replace-AC_CHECK_FILE-with-test-f.patch
deleted file mode 100644
index e1ba057..0000000
--- a/recipes/xorg-app/twm-1.0.5/0001-config-replace-AC_CHECK_FILE-with-test-f.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 8f787eb1c7bc26808b46b7b2bb9cf958e636a5e0 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Mon, 1 Nov 2010 09:54:44 +0100
-Subject: [PATCH] config: replace AC_CHECK_FILE with test -f
-
-* AC_CHECK_FILE doesn't work for cross compilation
-* https://bugs.freedesktop.org/show_bug.cgi?id=31287
----
- configure.ac |    7 +++++--
- 1 files changed, 5 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index ef9c4b4..b590e57 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -36,8 +36,11 @@ XORG_DEFAULT_OPTIONS
- 
- AC_PROG_YACC
- AC_PATH_PROG([YACC_INST], $YACC)
--AC_CHECK_FILE([$srcdir/gram.c], [],
--              [test -z "$YACC_INST" && AC_MSG_ERROR([yacc not found - unable to compile gram.y])])
-+if test ! -f "$srcdir/gram.c"; then
-+   if test -z "$YACC_INST"; then
-+      AC_MSG_ERROR([yacc not found - unable to compile gram.y])
-+   fi
-+fi
- AC_PROG_LEX
- 
- AC_CHECK_FUNCS([mkstemp])
--- 
-1.7.3.2
-
diff --git a/recipes/xorg-app/twm_1.0.5.bb b/recipes/xorg-app/twm_1.0.5.bb
deleted file mode 100644
index 54c51c9..0000000
--- a/recipes/xorg-app/twm_1.0.5.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-require xorg-app-common.inc
-DESCRIPTION = "tiny window manager"
-DEPENDS += " libxext libxt libxmu"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI += "file://0001-config-replace-AC_CHECK_FILE-with-test-f.patch"
-SRC_URI[archive.md5sum] = "e265b44d02872eb2c7b1338ccc82a157"
-SRC_URI[archive.sha256sum] = "717bab9122d91f307ff6f4a43c5368f88e7f85d5525b99607b1508c62fbc327c"
-
-FILES_${PN} += "${datadir}/X11/twm/system.twmrc"
-ALTERNATIVE_NAME = "x-window-manager"
-ALTERNATIVE_PATH = "${bindir}/twm"
-ALTERNATIVE_LINK = "${bindir}/x-window-manager"
-ALTERNATIVE_PRIORITY = "1"
diff --git a/recipes/xorg-app/twm_1.0.6.bb b/recipes/xorg-app/twm_1.0.6.bb
new file mode 100644
index 0000000..fd01d27
--- /dev/null
+++ b/recipes/xorg-app/twm_1.0.6.bb
@@ -0,0 +1,14 @@
+require xorg-app-common.inc
+DESCRIPTION = "tiny window manager"
+DEPENDS += " libxext libxt libxmu"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "952d06a0c2ec34687b536c7b619fc671"
+SRC_URI[archive.sha256sum] = "e7dccad7879a7570442f0cd9df0b9064e926466b5a52b710fca8cfb167f294e9"
+
+FILES_${PN} += "${datadir}/X11/twm/system.twmrc"
+ALTERNATIVE_NAME = "x-window-manager"
+ALTERNATIVE_PATH = "${bindir}/twm"
+ALTERNATIVE_LINK = "${bindir}/x-window-manager"
+ALTERNATIVE_PRIORITY = "1"
diff --git a/recipes/xorg-app/x11perf_1.5.2.bb b/recipes/xorg-app/x11perf_1.5.2.bb
deleted file mode 100644
index 849179a..0000000
--- a/recipes/xorg-app/x11perf_1.5.2.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require xorg-app-common.inc
-DESCRIPTION = "X11 server performance test program"
-DEPENDS += "libxmu libxrender libxft libxext fontconfig"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "3459958a7fdccf02fa43b70fda9cd87f"
-SRC_URI[archive.sha256sum] = "a1fd752abd3496568614c2f2209d21452bdd5b8c9a5c14a5705725bd8c298e12"
-
-FILES_${PN} += "/usr/lib/X11/x11perfcomp/*"
diff --git a/recipes/xorg-app/x11perf_1.5.3.bb b/recipes/xorg-app/x11perf_1.5.3.bb
new file mode 100644
index 0000000..b2879b9
--- /dev/null
+++ b/recipes/xorg-app/x11perf_1.5.3.bb
@@ -0,0 +1,10 @@
+require xorg-app-common.inc
+DESCRIPTION = "X11 server performance test program"
+DEPENDS += "libxmu libxrender libxft libxext fontconfig"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "c3ac3667a6f5c3cead9847fbf4b5f36e"
+SRC_URI[archive.sha256sum] = "394d7355afe7f3b054ce6f30db78794c6305c6593d48b7fb86a9c89d9d9e21bd"
+
+FILES_${PN} += "/usr/lib/X11/x11perfcomp/*"
diff --git a/recipes/xorg-app/xfindproxy_1.0.1.bb b/recipes/xorg-app/xfindproxy_1.0.1.bb
deleted file mode 100644
index a80e979..0000000
--- a/recipes/xorg-app/xfindproxy_1.0.1.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-app-common.inc
-DEPENDS += " libxaw libxt"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "5df3a162429bdd6ce5aea3ca5f6365b8"
-SRC_URI[archive.sha256sum] = "6b585ceadd3e17b433e177d80837e485869d6704f1181b6f3457ae56ba1988ea"
diff --git a/recipes/xorg-app/xfindproxy_1.0.2.bb b/recipes/xorg-app/xfindproxy_1.0.2.bb
new file mode 100644
index 0000000..7a95577
--- /dev/null
+++ b/recipes/xorg-app/xfindproxy_1.0.2.bb
@@ -0,0 +1,7 @@
+require xorg-app-common.inc
+DEPENDS += " libxaw libxt xproxymanagementprotocol"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "2fa74c68511ae845f52c2f33e641d0fd"
+SRC_URI[archive.sha256sum] = "a83b5c197ce13a52f021f0d00470e70a1c32d8e93244156c677729a7a5e15bb2"
diff --git a/recipes/xorg-app/xfwp_1.0.1.bb b/recipes/xorg-app/xfwp_1.0.1.bb
deleted file mode 100644
index 8ccb458..0000000
--- a/recipes/xorg-app/xfwp_1.0.1.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-app-common.inc
-DEPENDS += " libice xproxymngproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "0dbde8b3867032b9e4a383d46dfd7e48"
-SRC_URI[archive.sha256sum] = "cdd6ecb453c62086dd01808a26787641add419dd42469349f79d0adeb89a6d93"
diff --git a/recipes/xorg-app/xfwp_1.0.2.bb b/recipes/xorg-app/xfwp_1.0.2.bb
new file mode 100644
index 0000000..4415f96
--- /dev/null
+++ b/recipes/xorg-app/xfwp_1.0.2.bb
@@ -0,0 +1,7 @@
+require xorg-app-common.inc
+DEPENDS += " libice xproxymanagementprotocol"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "eeb558aad30a8b2bc1f1f0e919ea6f38"
+SRC_URI[archive.sha256sum] = "8b3df86d875d5a00743fe74f181eb4827e26a849073b5acd163677dca53de2e1"
diff --git a/recipes/xorg-app/xkbprint_1.0.2.bb b/recipes/xorg-app/xkbprint_1.0.2.bb
deleted file mode 100644
index ea003a7..0000000
--- a/recipes/xorg-app/xkbprint_1.0.2.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-app-common.inc
-DEPENDS += " libxkbfile "
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "3d3eb10466442354d6b73b503b9829db"
-SRC_URI[archive.sha256sum] = "2e51b3c2d33da885be6d955007ae7e025b8f8b21f7fe6d21387690d9f5cadb92"
diff --git a/recipes/xorg-app/xkbprint_1.0.3.bb b/recipes/xorg-app/xkbprint_1.0.3.bb
new file mode 100644
index 0000000..cf46765
--- /dev/null
+++ b/recipes/xorg-app/xkbprint_1.0.3.bb
@@ -0,0 +1,7 @@
+require xorg-app-common.inc
+DEPENDS += " libxkbfile "
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "526b5ba87cccd05aa700fa628bcfda3e"
+SRC_URI[archive.sha256sum] = "fa846db8e588018134bd550f80eb129e4ddfdb96f3b157603a57ae2cdf5892c0"
diff --git a/recipes/xorg-driver/xf86-input-evdev_2.5.0.bb b/recipes/xorg-driver/xf86-input-evdev_2.5.0.bb
deleted file mode 100644
index a76e7ba..0000000
--- a/recipes/xorg-driver/xf86-input-evdev_2.5.0.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-driver-input.inc
-DESCRIPTION = "X.Org X server -- evdev input driver"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "eceb6dc517c0649b772f18708a1aade8"
-SRC_URI[archive.sha256sum] = "9dec173ac9d8d09ef5cb2f79e74471f5f3ddd108827f3e95958b623766260333"
diff --git a/recipes/xorg-driver/xf86-input-evdev_2.6.0.bb b/recipes/xorg-driver/xf86-input-evdev_2.6.0.bb
new file mode 100644
index 0000000..474bee8
--- /dev/null
+++ b/recipes/xorg-driver/xf86-input-evdev_2.6.0.bb
@@ -0,0 +1,7 @@
+require xorg-driver-input.inc
+DESCRIPTION = "X.Org X server -- evdev input driver"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "f33fe9413bde68936d8909206a13e8a1"
+SRC_URI[archive.sha256sum] = "b0e7f3991a8183a4743196c3e16d7184d439b80bf43653aa2f45b0756a6753ac"
diff --git a/recipes/xorg-proto/dmxproto_2.3.1.bb b/recipes/xorg-proto/dmxproto_2.3.1.bb
new file mode 100644
index 0000000..603a746
--- /dev/null
+++ b/recipes/xorg-proto/dmxproto_2.3.1.bb
@@ -0,0 +1,6 @@
+require xorg-proto-common.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "4ee175bbd44d05c34d43bb129be5098a"
+SRC_URI[archive.sha256sum] = "e72051e6a3e06b236d19eed56368117b745ca1e1a27bdc50fd51aa375bea6509"
diff --git a/recipes/xorg-proto/dmxproto_2.3.bb b/recipes/xorg-proto/dmxproto_2.3.bb
deleted file mode 100644
index 0e40a55..0000000
--- a/recipes/xorg-proto/dmxproto_2.3.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require xorg-proto-common.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "880a41720b2937e2660dcdc0d34a8791"
-SRC_URI[archive.sha256sum] = "3a882ca43a1f359e3489468e6c407fd7d56d559f8895cf096a2ec877d6c403b0"
diff --git a/recipes/xorg-proto/evieext_1.1.0.bb b/recipes/xorg-proto/evieext_1.1.0.bb
deleted file mode 100644
index a363049..0000000
--- a/recipes/xorg-proto/evieext_1.1.0.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require xorg-proto-common.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "5c74f61d6f77b2e6a083b2b31000be42"
-SRC_URI[archive.sha256sum] = "47881a52a8d9da1e41e4f028ed32a8b44f738afbead819c0a07253fdc1641885"
diff --git a/recipes/xorg-proto/evieext_1.1.1.bb b/recipes/xorg-proto/evieext_1.1.1.bb
new file mode 100644
index 0000000..adaac93
--- /dev/null
+++ b/recipes/xorg-proto/evieext_1.1.1.bb
@@ -0,0 +1,6 @@
+require xorg-proto-common.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "98bd86a13686f65f0873070fdee6efc7"
+SRC_URI[archive.sha256sum] = "1cf74114436d99f56577a90b6438a32ba31b8128c9e63842bb179aba592733fe"
diff --git a/recipes/xorg-proto/printproto_1.0.4.bb b/recipes/xorg-proto/printproto_1.0.4.bb
deleted file mode 100644
index e853e81..0000000
--- a/recipes/xorg-proto/printproto_1.0.4.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require xorg-proto-common.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "7321847a60748b4d2f1fa16db4b6ede8"
-SRC_URI[archive.sha256sum] = "f059a93188e7143dbb6cc55e31ccf81b976776aa3023bfa57f47501fd1bfd3be"
diff --git a/recipes/xorg-proto/printproto_1.0.5.bb b/recipes/xorg-proto/printproto_1.0.5.bb
new file mode 100644
index 0000000..edece26
--- /dev/null
+++ b/recipes/xorg-proto/printproto_1.0.5.bb
@@ -0,0 +1,6 @@
+require xorg-proto-common.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "99d0e25feea2fead7d8325b7000b41c3"
+SRC_URI[archive.sha256sum] = "1298316cf43b987365ab7764d61b022a3d7f180b67b423eed3456862d155911a"
diff --git a/recipes/xorg-proto/xf86driproto_2.1.0.bb b/recipes/xorg-proto/xf86driproto_2.1.0.bb
deleted file mode 100644
index 0f4f639..0000000
--- a/recipes/xorg-proto/xf86driproto_2.1.0.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require xorg-proto-common.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "309d552732666c3333d7dc63e80d042f"
-SRC_URI[archive.sha256sum] = "d23f12deffd03e582e897ed6a7df3ea7f66ee8577f0f61374dcdf2ebffdce1be"
diff --git a/recipes/xorg-proto/xf86driproto_2.1.1.bb b/recipes/xorg-proto/xf86driproto_2.1.1.bb
new file mode 100644
index 0000000..ce61df6
--- /dev/null
+++ b/recipes/xorg-proto/xf86driproto_2.1.1.bb
@@ -0,0 +1,6 @@
+require xorg-proto-common.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "1d716d0dac3b664e5ee20c69d34bc10e"
+SRC_URI[archive.sha256sum] = "9c4b8d7221cb6dc4309269ccc008a22753698ae9245a398a59df35f1404d661f"
diff --git a/recipes/xorg-proto/xf86vidmodeproto_2.3.1.bb b/recipes/xorg-proto/xf86vidmodeproto_2.3.1.bb
new file mode 100644
index 0000000..0ce6f46
--- /dev/null
+++ b/recipes/xorg-proto/xf86vidmodeproto_2.3.1.bb
@@ -0,0 +1,8 @@
+require xorg-proto-common.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "e793ecefeaecfeabd1aed6a01095174e"
+SRC_URI[archive.sha256sum] = "45d9499aa7b73203fd6b3505b0259624afed5c16b941bd04fcf123e5de698770"
+
+CONFLICTS = "xxf86vmext"
diff --git a/recipes/xorg-proto/xf86vidmodeproto_2.3.bb b/recipes/xorg-proto/xf86vidmodeproto_2.3.bb
deleted file mode 100644
index 801526a..0000000
--- a/recipes/xorg-proto/xf86vidmodeproto_2.3.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-proto-common.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "4434894fc7d4eeb4a22e6b876d56fdaa"
-SRC_URI[archive.sha256sum] = "8f704613a5407b31c594d05cf8e053f2b05777172a44e7cd2abd8090bd2ac247"
-
-CONFLICTS = "xxf86vmext"
diff --git a/recipes/xorg-proto/xineramaproto_1.2.1.bb b/recipes/xorg-proto/xineramaproto_1.2.1.bb
new file mode 100644
index 0000000..94f856c
--- /dev/null
+++ b/recipes/xorg-proto/xineramaproto_1.2.1.bb
@@ -0,0 +1,6 @@
+require xorg-proto-common.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "9959fe0bfb22a0e7260433b8d199590a"
+SRC_URI[archive.sha256sum] = "977574bb3dc192ecd9c55f59f991ec1dff340be3e31392c95deff423da52485b"
diff --git a/recipes/xorg-proto/xineramaproto_1.2.bb b/recipes/xorg-proto/xineramaproto_1.2.bb
deleted file mode 100644
index e0c6919..0000000
--- a/recipes/xorg-proto/xineramaproto_1.2.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require xorg-proto-common.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "a8aadcb281b9c11a91303e24cdea45f5"
-SRC_URI[archive.sha256sum] = "58e88087ceec7201d918f94d6b1247325adca2a9903fed11291b412427a7ba64"
diff --git a/recipes/xorg-util/xorg-cf-files_1.0.3.bb b/recipes/xorg-util/xorg-cf-files_1.0.3.bb
deleted file mode 100644
index 222b239..0000000
--- a/recipes/xorg-util/xorg-cf-files_1.0.3.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require xorg-util-common.inc
-
-DESCRIPTION = "X Window System CF files"
-
-PR = "r2"
-PE = "1"
-
-FILES_${PN} += " /usr/lib/X11/config"
-SRC_URI[archive.md5sum] = "bca2403beb209952d66dc57be5a2f789"
-SRC_URI[archive.sha256sum] = "9a5e3533a4156a0e308ced437bde722cb291becc2276bdd0952e30b3b5060e92"
diff --git a/recipes/xorg-util/xorg-cf-files_1.0.4.bb b/recipes/xorg-util/xorg-cf-files_1.0.4.bb
new file mode 100644
index 0000000..1b710c7
--- /dev/null
+++ b/recipes/xorg-util/xorg-cf-files_1.0.4.bb
@@ -0,0 +1,10 @@
+require xorg-util-common.inc
+
+DESCRIPTION = "X Window System CF files"
+
+PR = "r0"
+PE = "1"
+
+FILES_${PN} += " /usr/lib/X11/config"
+SRC_URI[archive.md5sum] = "ff4502b6e31aac90e24ce134090d0e46"
+SRC_URI[archive.sha256sum] = "8fc8a1224d2a716b1f3f1ca85dfda02387ab215251b8eddd03551eac998c9cb8"
diff --git a/recipes/xorg-xserver/xserver-xorg-1.9.3.901/dolt-fix.patch b/recipes/xorg-xserver/xserver-xorg-1.9.3.901/dolt-fix.patch
new file mode 100644
index 0000000..e332ce0
--- /dev/null
+++ b/recipes/xorg-xserver/xserver-xorg-1.9.3.901/dolt-fix.patch
@@ -0,0 +1,22 @@
+Index: xorg-server/m4/dolt.m4
+===================================================================
+--- xorg-server.orig/m4/dolt.m4	2009-04-14 21:14:56.000000000 +0400
++++ xorg-server/m4/dolt.m4	2009-07-15 12:38:33.796848843 +0400
+@@ -147,7 +147,7 @@
+     cat <<__DOLTLIBTOOL__EOF__ > doltlibtool
+ #!$DOLT_BASH
+ __DOLTLIBTOOL__EOF__
+-    cat <<'__DOLTLIBTOOL__EOF__' >>doltlibtool
++    cat <<'__DOLTLIBTOOL__EOF__' | sed -e "s/@host_alias@/$host_alias/g" >>doltlibtool
+ top_builddir_slash="${0%%doltlibtool}"
+ : ${top_builddir_slash:=./}
+ args=()
+@@ -163,7 +163,7 @@
+ if $modeok && $tagok ; then
+     . ${top_builddir_slash}doltcompile "${args@<:@@@:>@}"
+ else
+-    exec ${top_builddir_slash}libtool "$[]@"
++    exec ${top_builddir_slash}@host_alias@-libtool "$[]@"
+ fi
+ __DOLTLIBTOOL__EOF__
+ 
diff --git a/recipes/xorg-xserver/xserver-xorg-1.9.3.901/hack-assume-pixman-supports-overlapped-blt.patch b/recipes/xorg-xserver/xserver-xorg-1.9.3.901/hack-assume-pixman-supports-overlapped-blt.patch
new file mode 100644
index 0000000..a947582
--- /dev/null
+++ b/recipes/xorg-xserver/xserver-xorg-1.9.3.901/hack-assume-pixman-supports-overlapped-blt.patch
@@ -0,0 +1,14 @@
+diff --git a/fb/fbcopy.c b/fb/fbcopy.c
+index 07eb663..ba394b7 100644
+--- a/fb/fbcopy.c
++++ b/fb/fbcopy.c
+@@ -91,8 +91,7 @@ fbCopyNtoN (DrawablePtr	pSrcDrawable,
+     while (nbox--)
+     {
+ #ifndef FB_ACCESS_WRAPPER /* pixman_blt() doesn't support accessors yet */
+-	if (pm == FB_ALLONES && alu == GXcopy && !reverse &&
+-	    !upsidedown)
++	if (pm == FB_ALLONES && alu == GXcopy)
+ 	{
+ 	    if (!pixman_blt ((uint32_t *)src, (uint32_t *)dst, srcStride, dstStride, srcBpp, dstBpp,
+ 			     (pbox->x1 + dx + srcXoff),
diff --git a/recipes/xorg-xserver/xserver-xorg-1.9.3.901/hack-fbdev-ignore-return-mode.patch b/recipes/xorg-xserver/xserver-xorg-1.9.3.901/hack-fbdev-ignore-return-mode.patch
new file mode 100644
index 0000000..d3661cb
--- /dev/null
+++ b/recipes/xorg-xserver/xserver-xorg-1.9.3.901/hack-fbdev-ignore-return-mode.patch
@@ -0,0 +1,39 @@
+Ugly hack that prevents server termination with xf86-video-fbdev-0.4.1
+(and probably other) while returning from chvt or resume on some
+hardware (e. g. zaurus).
+
+Correct fix would require debugging of fbdev mode during LeaveVT and
+EnterVT.
+
+This patch may cause staying in incorrect or corrupted display mode
+after EnterVT, but on man affected devices it does not cause any visible
+problems.
+
+Hacked code is never called on properly written drivers.
+
+Devices affected and testers involved for future patch removal:
+Sharp Zaurus (spitz/akita): Stanislav Brabec <utx@penguin.cz>
+
+See also:
+https://bugzilla.redhat.com/show_bug.cgi?id=238451
+
+The bug (first line indicates that your device is affected):
+
+(EE) FBDEV(0): FBIOPUT_VSCREENINFO succeeded but modified mode
+
+Fatal server error:
+EnterVT failed for screen 0
+
+Index: xorg-server-1.7.3/hw/xfree86/fbdevhw/fbdevhw.c
+===================================================================
+--- xorg-server-1.7.3.orig/hw/xfree86/fbdevhw/fbdevhw.c
++++ xorg-server-1.7.3/hw/xfree86/fbdevhw/fbdevhw.c
+@@ -571,7 +571,7 @@ fbdevHWSetMode(ScrnInfoPtr pScrn, Displa
+ #if DEBUG
+ 		print_fbdev_mode("returned", &set_var);
+ #endif
+-		return FALSE;
++		/* return FALSE; UGLY HACK to allow return from chvt */
+ 	}
+ 
+ 	if (!check)
diff --git a/recipes/xorg-xserver/xserver-xorg-1.9.3.901/randr-support.patch b/recipes/xorg-xserver/xserver-xorg-1.9.3.901/randr-support.patch
new file mode 100644
index 0000000..abc7db4
--- /dev/null
+++ b/recipes/xorg-xserver/xserver-xorg-1.9.3.901/randr-support.patch
@@ -0,0 +1,102 @@
+diff -uNr xorg-server-1.9.0.orig//hw/xfree86/common/xf86Xinput.c xorg-server-1.9.0/hw/xfree86/common/xf86Xinput.c
+--- xorg-server-1.9.0.orig//hw/xfree86/common/xf86Xinput.c	2010-08-13 07:53:48.000000000 +0200
++++ xorg-server-1.9.0/hw/xfree86/common/xf86Xinput.c	2010-08-28 21:31:10.000000000 +0200
+@@ -106,6 +106,8 @@
+ 
+ #include "os.h"
+ 
++#define RR_Rotate_All    (RR_Rotate_0|RR_Rotate_90|RR_Rotate_180|RR_Rotate_270)
++
+ EventListPtr xf86Events = NULL;
+ 
+ /**
+@@ -1359,4 +1361,73 @@
+     EnableDevice(dev, TRUE);
+ }
+ 
++/* Taken from evdev-properties.h. */
++#define EVDEV_PROP_SWAP_AXES "Evdev Axes Swap"
++#define EVDEV_PROP_INVERT_AXES "Evdev Axis Inversion"
++
++/* This is a hack until we get device -> CRTC association. */
++void
++xf86InputRotationNotify(Rotation rotation)
++{
++    DeviceIntPtr dev;
++    LocalDevicePtr local;
++    int ret;
++    int swap_axes = 0;
++    CARD8 invert[2] = { 0, 0 };
++    static Atom prop_swap = 0, prop_invert = 0;
++    static int atom_generation = -1;
++    
++    if (atom_generation != serverGeneration) {
++        prop_swap = 0;
++        prop_invert = 0;
++    }
++
++    switch (rotation & RR_Rotate_All) {
++    case RR_Rotate_0:
++        swap_axes = 1;
++        invert[0] = 0;
++ 	 invert[1] = 0;
++        break;
++    case RR_Rotate_90:
++        swap_axes = 0;
++        invert[0] = 0;
++ 	 invert[1] = 1;
++        break;
++    case RR_Rotate_180:
++        swap_axes = 1;
++        invert[0] = 0;
++        invert[1] = 0;
++        break;
++    case RR_Rotate_270:
++        swap_axes = 0;
++        invert[0] = 0;
++ 	 invert[1] = 1;
++        break;
++    }
++
++    if (!prop_swap)
++        prop_swap = MakeAtom(EVDEV_PROP_SWAP_AXES,
++                             strlen(EVDEV_PROP_SWAP_AXES), TRUE);
++    if (!prop_invert)
++        prop_invert = MakeAtom(EVDEV_PROP_INVERT_AXES,
++                               strlen(EVDEV_PROP_INVERT_AXES), TRUE);
++
++    for (dev = inputInfo.devices; dev; dev = dev->next) {
++        local = dev->public.devicePrivate;
++        ret = XIChangeDeviceProperty(dev, prop_swap, XA_INTEGER, 8,
++                                     PropModeReplace, 1, &swap_axes, FALSE);
++        if (ret != Success) {
++            xf86Msg(X_ERROR, "Changing swap_xy property failed!\n");
++            continue;
++        }
++        ret = XIChangeDeviceProperty(dev, prop_invert, XA_INTEGER, 8,
++                                     PropModeReplace, 2, invert, FALSE);
++        if (ret != Success) {
++            xf86Msg(X_ERROR, "Changing invert property failed!\n");
++            continue;
++        }
++    }
++}
++
++
+ /* end of xf86Xinput.c */
+diff -uNr xorg-server-1.9.0.orig//hw/xfree86/modes/xf86Crtc.c xorg-server-1.9.0/hw/xfree86/modes/xf86Crtc.c
+--- xorg-server-1.9.0.orig//hw/xfree86/modes/xf86Crtc.c	2010-07-20 05:24:12.000000000 +0200
++++ xorg-server-1.9.0/hw/xfree86/modes/xf86Crtc.c	2010-08-28 21:28:48.000000000 +0200
+@@ -387,6 +387,12 @@
+     if (didLock)
+ 	crtc->funcs->unlock (crtc);
+ 
++    /*
++     * Rotate Touchscreen
++     */
++    xf86InputRotationNotify(crtc->rotation);
++
++    
+     return ret;
+ }
+ 
diff --git a/recipes/xorg-xserver/xserver-xorg-1.9.3/dolt-fix.patch b/recipes/xorg-xserver/xserver-xorg-1.9.3/dolt-fix.patch
deleted file mode 100644
index e332ce0..0000000
--- a/recipes/xorg-xserver/xserver-xorg-1.9.3/dolt-fix.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-Index: xorg-server/m4/dolt.m4
-===================================================================
---- xorg-server.orig/m4/dolt.m4	2009-04-14 21:14:56.000000000 +0400
-+++ xorg-server/m4/dolt.m4	2009-07-15 12:38:33.796848843 +0400
-@@ -147,7 +147,7 @@
-     cat <<__DOLTLIBTOOL__EOF__ > doltlibtool
- #!$DOLT_BASH
- __DOLTLIBTOOL__EOF__
--    cat <<'__DOLTLIBTOOL__EOF__' >>doltlibtool
-+    cat <<'__DOLTLIBTOOL__EOF__' | sed -e "s/@host_alias@/$host_alias/g" >>doltlibtool
- top_builddir_slash="${0%%doltlibtool}"
- : ${top_builddir_slash:=./}
- args=()
-@@ -163,7 +163,7 @@
- if $modeok && $tagok ; then
-     . ${top_builddir_slash}doltcompile "${args@<:@@@:>@}"
- else
--    exec ${top_builddir_slash}libtool "$[]@"
-+    exec ${top_builddir_slash}@host_alias@-libtool "$[]@"
- fi
- __DOLTLIBTOOL__EOF__
- 
diff --git a/recipes/xorg-xserver/xserver-xorg-1.9.3/hack-assume-pixman-supports-overlapped-blt.patch b/recipes/xorg-xserver/xserver-xorg-1.9.3/hack-assume-pixman-supports-overlapped-blt.patch
deleted file mode 100644
index a947582..0000000
--- a/recipes/xorg-xserver/xserver-xorg-1.9.3/hack-assume-pixman-supports-overlapped-blt.patch
+++ /dev/null
@@ -1,14 +0,0 @@
-diff --git a/fb/fbcopy.c b/fb/fbcopy.c
-index 07eb663..ba394b7 100644
---- a/fb/fbcopy.c
-+++ b/fb/fbcopy.c
-@@ -91,8 +91,7 @@ fbCopyNtoN (DrawablePtr	pSrcDrawable,
-     while (nbox--)
-     {
- #ifndef FB_ACCESS_WRAPPER /* pixman_blt() doesn't support accessors yet */
--	if (pm == FB_ALLONES && alu == GXcopy && !reverse &&
--	    !upsidedown)
-+	if (pm == FB_ALLONES && alu == GXcopy)
- 	{
- 	    if (!pixman_blt ((uint32_t *)src, (uint32_t *)dst, srcStride, dstStride, srcBpp, dstBpp,
- 			     (pbox->x1 + dx + srcXoff),
diff --git a/recipes/xorg-xserver/xserver-xorg-1.9.3/hack-fbdev-ignore-return-mode.patch b/recipes/xorg-xserver/xserver-xorg-1.9.3/hack-fbdev-ignore-return-mode.patch
deleted file mode 100644
index d3661cb..0000000
--- a/recipes/xorg-xserver/xserver-xorg-1.9.3/hack-fbdev-ignore-return-mode.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-Ugly hack that prevents server termination with xf86-video-fbdev-0.4.1
-(and probably other) while returning from chvt or resume on some
-hardware (e. g. zaurus).
-
-Correct fix would require debugging of fbdev mode during LeaveVT and
-EnterVT.
-
-This patch may cause staying in incorrect or corrupted display mode
-after EnterVT, but on man affected devices it does not cause any visible
-problems.
-
-Hacked code is never called on properly written drivers.
-
-Devices affected and testers involved for future patch removal:
-Sharp Zaurus (spitz/akita): Stanislav Brabec <utx@penguin.cz>
-
-See also:
-https://bugzilla.redhat.com/show_bug.cgi?id=238451
-
-The bug (first line indicates that your device is affected):
-
-(EE) FBDEV(0): FBIOPUT_VSCREENINFO succeeded but modified mode
-
-Fatal server error:
-EnterVT failed for screen 0
-
-Index: xorg-server-1.7.3/hw/xfree86/fbdevhw/fbdevhw.c
-===================================================================
---- xorg-server-1.7.3.orig/hw/xfree86/fbdevhw/fbdevhw.c
-+++ xorg-server-1.7.3/hw/xfree86/fbdevhw/fbdevhw.c
-@@ -571,7 +571,7 @@ fbdevHWSetMode(ScrnInfoPtr pScrn, Displa
- #if DEBUG
- 		print_fbdev_mode("returned", &set_var);
- #endif
--		return FALSE;
-+		/* return FALSE; UGLY HACK to allow return from chvt */
- 	}
- 
- 	if (!check)
diff --git a/recipes/xorg-xserver/xserver-xorg-1.9.3/randr-support.patch b/recipes/xorg-xserver/xserver-xorg-1.9.3/randr-support.patch
deleted file mode 100644
index abc7db4..0000000
--- a/recipes/xorg-xserver/xserver-xorg-1.9.3/randr-support.patch
+++ /dev/null
@@ -1,102 +0,0 @@
-diff -uNr xorg-server-1.9.0.orig//hw/xfree86/common/xf86Xinput.c xorg-server-1.9.0/hw/xfree86/common/xf86Xinput.c
---- xorg-server-1.9.0.orig//hw/xfree86/common/xf86Xinput.c	2010-08-13 07:53:48.000000000 +0200
-+++ xorg-server-1.9.0/hw/xfree86/common/xf86Xinput.c	2010-08-28 21:31:10.000000000 +0200
-@@ -106,6 +106,8 @@
- 
- #include "os.h"
- 
-+#define RR_Rotate_All    (RR_Rotate_0|RR_Rotate_90|RR_Rotate_180|RR_Rotate_270)
-+
- EventListPtr xf86Events = NULL;
- 
- /**
-@@ -1359,4 +1361,73 @@
-     EnableDevice(dev, TRUE);
- }
- 
-+/* Taken from evdev-properties.h. */
-+#define EVDEV_PROP_SWAP_AXES "Evdev Axes Swap"
-+#define EVDEV_PROP_INVERT_AXES "Evdev Axis Inversion"
-+
-+/* This is a hack until we get device -> CRTC association. */
-+void
-+xf86InputRotationNotify(Rotation rotation)
-+{
-+    DeviceIntPtr dev;
-+    LocalDevicePtr local;
-+    int ret;
-+    int swap_axes = 0;
-+    CARD8 invert[2] = { 0, 0 };
-+    static Atom prop_swap = 0, prop_invert = 0;
-+    static int atom_generation = -1;
-+    
-+    if (atom_generation != serverGeneration) {
-+        prop_swap = 0;
-+        prop_invert = 0;
-+    }
-+
-+    switch (rotation & RR_Rotate_All) {
-+    case RR_Rotate_0:
-+        swap_axes = 1;
-+        invert[0] = 0;
-+ 	 invert[1] = 0;
-+        break;
-+    case RR_Rotate_90:
-+        swap_axes = 0;
-+        invert[0] = 0;
-+ 	 invert[1] = 1;
-+        break;
-+    case RR_Rotate_180:
-+        swap_axes = 1;
-+        invert[0] = 0;
-+        invert[1] = 0;
-+        break;
-+    case RR_Rotate_270:
-+        swap_axes = 0;
-+        invert[0] = 0;
-+ 	 invert[1] = 1;
-+        break;
-+    }
-+
-+    if (!prop_swap)
-+        prop_swap = MakeAtom(EVDEV_PROP_SWAP_AXES,
-+                             strlen(EVDEV_PROP_SWAP_AXES), TRUE);
-+    if (!prop_invert)
-+        prop_invert = MakeAtom(EVDEV_PROP_INVERT_AXES,
-+                               strlen(EVDEV_PROP_INVERT_AXES), TRUE);
-+
-+    for (dev = inputInfo.devices; dev; dev = dev->next) {
-+        local = dev->public.devicePrivate;
-+        ret = XIChangeDeviceProperty(dev, prop_swap, XA_INTEGER, 8,
-+                                     PropModeReplace, 1, &swap_axes, FALSE);
-+        if (ret != Success) {
-+            xf86Msg(X_ERROR, "Changing swap_xy property failed!\n");
-+            continue;
-+        }
-+        ret = XIChangeDeviceProperty(dev, prop_invert, XA_INTEGER, 8,
-+                                     PropModeReplace, 2, invert, FALSE);
-+        if (ret != Success) {
-+            xf86Msg(X_ERROR, "Changing invert property failed!\n");
-+            continue;
-+        }
-+    }
-+}
-+
-+
- /* end of xf86Xinput.c */
-diff -uNr xorg-server-1.9.0.orig//hw/xfree86/modes/xf86Crtc.c xorg-server-1.9.0/hw/xfree86/modes/xf86Crtc.c
---- xorg-server-1.9.0.orig//hw/xfree86/modes/xf86Crtc.c	2010-07-20 05:24:12.000000000 +0200
-+++ xorg-server-1.9.0/hw/xfree86/modes/xf86Crtc.c	2010-08-28 21:28:48.000000000 +0200
-@@ -387,6 +387,12 @@
-     if (didLock)
- 	crtc->funcs->unlock (crtc);
- 
-+    /*
-+     * Rotate Touchscreen
-+     */
-+    xf86InputRotationNotify(crtc->rotation);
-+
-+    
-     return ret;
- }
- 
diff --git a/recipes/xorg-xserver/xserver-xorg_1.9.3.901.bb b/recipes/xorg-xserver/xserver-xorg_1.9.3.901.bb
new file mode 100644
index 0000000..d58f13c
--- /dev/null
+++ b/recipes/xorg-xserver/xserver-xorg_1.9.3.901.bb
@@ -0,0 +1,33 @@
+# Assign it here, since the hal->udev transition happens post 1.7 in angstrom
+DISTRO_XORG_CONFIG_MANAGER_angstrom = "udev"
+
+require xorg-xserver-common.inc
+
+DESCRIPTION = "the X.Org X server"
+DEPENDS += "pixman libpciaccess openssl dri2proto glproto xorg-minimal-fonts font-util-native"
+PE = "2"
+PR = "${INC_PR}.0"
+
+SRC_URI += " \
+            file://dolt-fix.patch \
+            file://randr-support.patch \
+            file://hack-fbdev-ignore-return-mode.patch \
+           "
+SRC_URI[archive.md5sum] = "f22831fdddecbe4eecf006380d659ac8"
+SRC_URI[archive.sha256sum] = "1a77c1cf699e0430c9ab2b9c830861c998ef390517700d4c3a4b7265693c2747"
+
+SRC_URI_append_angstrom = " file://hack-assume-pixman-supports-overlapped-blt.patch"
+SRC_URI_append_shr = " file://hack-assume-pixman-supports-overlapped-blt.patch"
+
+do_install_prepend() {
+        mkdir -p ${D}/${libdir}/X11/fonts
+}
+
+# The NVidia driver requires Xinerama support in the X server. Ion uses it.
+PACKAGE_ARCH_ion = "${MACHINE_ARCH}"
+XINERAMA = "${@['--disable-xinerama','--enable-xinerama'][bb.data.getVar('MACHINE',d) in ['ion']]}"
+
+EXTRA_OECONF += " ${CONFIG_MANAGER_OPTION} ${XINERAMA} --disable-kdrive --disable-xephyr --disable-xsdl --disable-xfake --disable-xfbdev --disable-dmx"
+EXTRA_OECONF += " --enable-dri2 --disable-unit-tests --disable-docs --disable-devel-docs"
+
+export LDFLAGS += " -ldl "
diff --git a/recipes/xorg-xserver/xserver-xorg_1.9.3.bb b/recipes/xorg-xserver/xserver-xorg_1.9.3.bb
deleted file mode 100644
index 973ed2e..0000000
--- a/recipes/xorg-xserver/xserver-xorg_1.9.3.bb
+++ /dev/null
@@ -1,33 +0,0 @@
-# Assign it here, since the hal->udev transition happens post 1.7 in angstrom
-DISTRO_XORG_CONFIG_MANAGER_angstrom = "udev"
-
-require xorg-xserver-common.inc
-
-DESCRIPTION = "the X.Org X server"
-DEPENDS += "pixman libpciaccess openssl dri2proto glproto xorg-minimal-fonts font-util-native"
-PE = "2"
-PR = "${INC_PR}.0"
-
-SRC_URI += " \
-            file://dolt-fix.patch \
-            file://randr-support.patch \
-            file://hack-fbdev-ignore-return-mode.patch \
-           "
-SRC_URI[archive.md5sum] = "5bef6839a76d029204ab31aa2fcb5201"
-SRC_URI[archive.sha256sum] = "864831f51e841ff37f2445d1c85b86b559c8860a435fb496aead4f256a2b141d"
-
-SRC_URI_append_angstrom = " file://hack-assume-pixman-supports-overlapped-blt.patch"
-SRC_URI_append_shr = " file://hack-assume-pixman-supports-overlapped-blt.patch"
-
-do_install_prepend() {
-        mkdir -p ${D}/${libdir}/X11/fonts
-}
-
-# The NVidia driver requires Xinerama support in the X server. Ion uses it.
-PACKAGE_ARCH_ion = "${MACHINE_ARCH}"
-XINERAMA = "${@['--disable-xinerama','--enable-xinerama'][bb.data.getVar('MACHINE',d) in ['ion']]}"
-
-EXTRA_OECONF += " ${CONFIG_MANAGER_OPTION} ${XINERAMA} --disable-kdrive --disable-xephyr --disable-xsdl --disable-xfake --disable-xfbdev --disable-dmx"
-EXTRA_OECONF += " --enable-dri2 --disable-unit-tests --disable-docs --disable-devel-docs"
-
-export LDFLAGS += " -ldl "
-- 
1.7.4.rc1



