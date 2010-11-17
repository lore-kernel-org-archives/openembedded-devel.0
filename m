Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1PIixf-0007Cm-Lg
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Nov 2010 15:26:14 +0100
Received: by fxm11 with SMTP id 11so578900fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Nov 2010 06:25:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=gu/msRG7RYP5GBm7Bj8QwTMzR+VRVlJDo/yhWM5Sss8=;
	b=tBc3Lv+e/23dQodz3vdeugh8l9b5cg0u6EztcWukPftbxZ0Dc0p5qvWD7ynUBFyjmA
	FtUzOUJ2xyR3AZuDPxMS1CmjgeseSHcRHfrJYzLxcXKSJ9Tp7UI6Off5MMd9j8LvAKSB
	7JKfBa07oXcAwlpiKh3m+BqFvGWzmmiRneD0s=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=CfEsLWq8FIb/Xis5nzFCJbNf/BK/ZcKsCjMlDTwhG0yhL+yjcSxXv8Aa/gRPIjBEQy
	BK8CIAnIEkxHQx72aYY4ehbF8n/Eh3RHhrRiEa39g+ieA+P2S7g6hpxhl0X9ym9S2bKb
	cMoi3u9xd3cwfM5dfw6U2s3W7bueLeXg2Mi2w=
Received: by 10.223.79.7 with SMTP id n7mr3150754fak.33.1290003905614;
	Wed, 17 Nov 2010 06:25:05 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id y13sm1638823fah.2.2010.11.17.06.25.04
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 17 Nov 2010 06:25:04 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 17 Nov 2010 15:24:58 +0100
Message-Id: <1290003899-13958-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.3.2
In-Reply-To: <1290003899-13958-1-git-send-email-Martin.Jansa@gmail.com>
References: <1290003899-13958-1-git-send-email-Martin.Jansa@gmail.com>
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 2/3] xorg: new versions for 2010-11-17
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
X-List-Received-Date: Wed, 17 Nov 2010 14:26:15 -0000

---
 .../include/preferred-xorg-versions-live.inc       |   84 ++++++++--------
 recipes/xorg-doc/xorg-docs_1.5.99.901.bb           |   13 +++
 recipes/xorg-doc/xorg-sgml-doctools_1.5.99.901.bb  |    8 ++
 recipes/xorg-driver/xf86-video-geode_2.11.10.bb    |    9 ++
 recipes/xorg-driver/xf86-video-vmware_11.0.3.bb    |    7 ++
 recipes/xorg-font/font-adobe-100dpi_1.0.3.bb       |    6 +
 recipes/xorg-font/font-adobe-75dpi_1.0.3.bb        |    6 +
 .../xorg-font/font-adobe-utopia-100dpi_1.0.4.bb    |    9 ++
 recipes/xorg-font/font-adobe-utopia-75dpi_1.0.4.bb |    9 ++
 recipes/xorg-font/font-adobe-utopia-type1_1.0.4.bb |    9 ++
 recipes/xorg-font/font-arabic-misc_1.0.3.bb        |   10 ++
 recipes/xorg-font/font-bh-100dpi_1.0.3.bb          |    7 ++
 recipes/xorg-font/font-bh-75dpi_1.0.3.bb           |    7 ++
 .../font-bh-lucidatypewriter-100dpi_1.0.3.bb       |    7 ++
 .../font-bh-lucidatypewriter-75dpi_1.0.3.bb        |    7 ++
 recipes/xorg-font/font-bh-type1_1.0.3.bb           |    7 ++
 recipes/xorg-font/font-bitstream-100dpi_1.0.3.bb   |    7 ++
 recipes/xorg-font/font-bitstream-75dpi_1.0.3.bb    |    7 ++
 recipes/xorg-font/font-bitstream-speedo_1.0.2.bb   |    7 ++
 recipes/xorg-font/font-bitstream-type1_1.0.3.bb    |    7 ++
 recipes/xorg-font/font-cronyx-cyrillic_1.0.3.bb    |    7 ++
 recipes/xorg-font/font-cursor-misc_1.0.3.bb        |    7 ++
 recipes/xorg-font/font-daewoo-misc_1.0.3.bb        |    7 ++
 recipes/xorg-font/font-dec-misc_1.0.3.bb           |    7 ++
 recipes/xorg-font/font-ibm-type1_1.0.3.bb          |    7 ++
 recipes/xorg-font/font-isas-misc_1.0.3.bb          |    7 ++
 recipes/xorg-font/font-jis-misc_1.0.3.bb           |    7 ++
 recipes/xorg-font/font-micro-misc_1.0.3.bb         |    9 ++
 recipes/xorg-font/font-misc-cyrillic_1.0.3.bb      |    7 ++
 recipes/xorg-font/font-misc-ethiopic_1.0.3.bb      |    6 +
 recipes/xorg-font/font-misc-meltho_1.0.3.bb        |    8 ++
 recipes/xorg-font/font-misc-misc_1.1.0.bb          |    2 +
 recipes/xorg-font/font-misc-misc_1.1.1.bb          |    2 +
 recipes/xorg-font/font-misc-misc_1.1.2.bb          |    6 +
 recipes/xorg-font/font-mutt-misc_1.0.3.bb          |   10 ++
 recipes/xorg-font/font-schumacher-misc_1.1.2.bb    |    6 +
 recipes/xorg-font/font-screen-cyrillic_1.0.4.bb    |    6 +
 recipes/xorg-font/font-sony-misc_1.0.3.bb          |    6 +
 recipes/xorg-font/font-sun-misc_1.0.3.bb           |    6 +
 recipes/xorg-font/font-winitzki-cyrillic_1.0.3.bb  |    7 ++
 recipes/xorg-font/font-xfree86-type1_1.0.4.bb      |    7 ++
 recipes/xorg-font/xorg-font-common.inc             |    2 +-
 .../xserver-xorg-1.9.2.901/dolt-fix.patch          |   22 ++++
 ...ack-assume-pixman-supports-overlapped-blt.patch |   14 +++
 .../hack-fbdev-ignore-return-mode.patch            |   39 ++++++++
 .../xserver-xorg-1.9.2.901/randr-support.patch     |  102 ++++++++++++++++++++
 recipes/xorg-xserver/xserver-xorg_1.9.2.901.bb     |   33 +++++++
 47 files changed, 539 insertions(+), 43 deletions(-)
 create mode 100644 recipes/xorg-doc/xorg-docs_1.5.99.901.bb
 create mode 100644 recipes/xorg-doc/xorg-sgml-doctools_1.5.99.901.bb
 create mode 100644 recipes/xorg-driver/xf86-video-geode_2.11.10.bb
 create mode 100644 recipes/xorg-driver/xf86-video-vmware_11.0.3.bb
 create mode 100644 recipes/xorg-font/font-adobe-100dpi_1.0.3.bb
 create mode 100644 recipes/xorg-font/font-adobe-75dpi_1.0.3.bb
 create mode 100644 recipes/xorg-font/font-adobe-utopia-100dpi_1.0.4.bb
 create mode 100644 recipes/xorg-font/font-adobe-utopia-75dpi_1.0.4.bb
 create mode 100644 recipes/xorg-font/font-adobe-utopia-type1_1.0.4.bb
 create mode 100644 recipes/xorg-font/font-arabic-misc_1.0.3.bb
 create mode 100644 recipes/xorg-font/font-bh-100dpi_1.0.3.bb
 create mode 100644 recipes/xorg-font/font-bh-75dpi_1.0.3.bb
 create mode 100644 recipes/xorg-font/font-bh-lucidatypewriter-100dpi_1.0.3.bb
 create mode 100644 recipes/xorg-font/font-bh-lucidatypewriter-75dpi_1.0.3.bb
 create mode 100644 recipes/xorg-font/font-bh-type1_1.0.3.bb
 create mode 100644 recipes/xorg-font/font-bitstream-100dpi_1.0.3.bb
 create mode 100644 recipes/xorg-font/font-bitstream-75dpi_1.0.3.bb
 create mode 100644 recipes/xorg-font/font-bitstream-speedo_1.0.2.bb
 create mode 100644 recipes/xorg-font/font-bitstream-type1_1.0.3.bb
 create mode 100644 recipes/xorg-font/font-cronyx-cyrillic_1.0.3.bb
 create mode 100644 recipes/xorg-font/font-cursor-misc_1.0.3.bb
 create mode 100644 recipes/xorg-font/font-daewoo-misc_1.0.3.bb
 create mode 100644 recipes/xorg-font/font-dec-misc_1.0.3.bb
 create mode 100644 recipes/xorg-font/font-ibm-type1_1.0.3.bb
 create mode 100644 recipes/xorg-font/font-isas-misc_1.0.3.bb
 create mode 100644 recipes/xorg-font/font-jis-misc_1.0.3.bb
 create mode 100644 recipes/xorg-font/font-micro-misc_1.0.3.bb
 create mode 100644 recipes/xorg-font/font-misc-cyrillic_1.0.3.bb
 create mode 100644 recipes/xorg-font/font-misc-ethiopic_1.0.3.bb
 create mode 100644 recipes/xorg-font/font-misc-meltho_1.0.3.bb
 create mode 100644 recipes/xorg-font/font-misc-misc_1.1.2.bb
 create mode 100644 recipes/xorg-font/font-mutt-misc_1.0.3.bb
 create mode 100644 recipes/xorg-font/font-schumacher-misc_1.1.2.bb
 create mode 100644 recipes/xorg-font/font-screen-cyrillic_1.0.4.bb
 create mode 100644 recipes/xorg-font/font-sony-misc_1.0.3.bb
 create mode 100644 recipes/xorg-font/font-sun-misc_1.0.3.bb
 create mode 100644 recipes/xorg-font/font-winitzki-cyrillic_1.0.3.bb
 create mode 100644 recipes/xorg-font/font-xfree86-type1_1.0.4.bb
 create mode 100644 recipes/xorg-xserver/xserver-xorg-1.9.2.901/dolt-fix.patch
 create mode 100644 recipes/xorg-xserver/xserver-xorg-1.9.2.901/hack-assume-pixman-supports-overlapped-blt.patch
 create mode 100644 recipes/xorg-xserver/xserver-xorg-1.9.2.901/hack-fbdev-ignore-return-mode.patch
 create mode 100644 recipes/xorg-xserver/xserver-xorg-1.9.2.901/randr-support.patch
 create mode 100644 recipes/xorg-xserver/xserver-xorg_1.9.2.901.bb

diff --git a/conf/distro/include/preferred-xorg-versions-live.inc b/conf/distro/include/preferred-xorg-versions-live.inc
index 9947318..bc4b3ea 100644
--- a/conf/distro/include/preferred-xorg-versions-live.inc
+++ b/conf/distro/include/preferred-xorg-versions-live.inc
@@ -1,4 +1,4 @@
-#Fri Nov 12 14:07:33 CET 2010
+#Wed Nov 17 13:36:22 CET 2010
 #app
 PREFERRED_VERSION_appres ?= "1.0.3"
 PREFERRED_VERSION_bdftopcf ?= "1.0.3"
@@ -108,8 +108,8 @@ PREFERRED_VERSION_xbitmaps ?= "1.1.0"
 PREFERRED_VERSION_xcursor-themes ?= "1.0.3"
 PREFERRED_VERSION_xkbdata ?= "1.0.1"
 #doc
-PREFERRED_VERSION_xorg-docs ?= "1.5"
-PREFERRED_VERSION_xorg-sgml-doctools ?= "1.5"
+PREFERRED_VERSION_xorg-docs ?= "1.5.99.901"
+PREFERRED_VERSION_xorg-sgml-doctools ?= "1.5.99.901"
 #driver
 PREFERRED_VERSION_xf86-input-acecad ?= "1.4.0"
 PREFERRED_VERSION_xf86-input-aiptek ?= "1.3.1"
@@ -149,7 +149,7 @@ PREFERRED_VERSION_xf86-video-cirrus ?= "1.3.2"
 PREFERRED_VERSION_xf86-video-cyrix ?= "1.1.0"
 PREFERRED_VERSION_xf86-video-dummy ?= "0.3.4"
 PREFERRED_VERSION_xf86-video-fbdev ?= "0.4.2"
-PREFERRED_VERSION_xf86-video-geode ?= "2.11.9"
+PREFERRED_VERSION_xf86-video-geode ?= "2.11.10"
 PREFERRED_VERSION_xf86-video-glint ?= "1.2.5"
 PREFERRED_VERSION_xf86-video-i128 ?= "1.3.4"
 PREFERRED_VERSION_xf86-video-i740 ?= "1.3.2"
@@ -189,51 +189,51 @@ PREFERRED_VERSION_xf86-video-vermilion ?= "1.0.1"
 PREFERRED_VERSION_xf86-video-vesa ?= "2.3.0"
 PREFERRED_VERSION_xf86-video-vga ?= "4.1.0"
 PREFERRED_VERSION_xf86-video-via ?= "0.2.2"
-PREFERRED_VERSION_xf86-video-vmware ?= "11.0.2"
+PREFERRED_VERSION_xf86-video-vmware ?= "11.0.3"
 PREFERRED_VERSION_xf86-video-voodoo ?= "1.2.4"
 PREFERRED_VERSION_xf86-video-wsfb ?= "0.3.0"
 PREFERRED_VERSION_xf86-video-xgi ?= "1.6.0"
 PREFERRED_VERSION_xf86-video-xgixp ?= "1.8.0"
 #font
 PREFERRED_VERSION_encodings ?= "1.0.4"
-PREFERRED_VERSION_font-adobe-100dpi ?= "1.0.2"
-PREFERRED_VERSION_font-adobe-75dpi ?= "1.0.2"
-PREFERRED_VERSION_font-adobe-utopia-100dpi ?= "1.0.3"
-PREFERRED_VERSION_font-adobe-utopia-75dpi ?= "1.0.3"
-PREFERRED_VERSION_font-adobe-utopia-type1 ?= "1.0.3"
+PREFERRED_VERSION_font-adobe-100dpi ?= "1.0.3"
+PREFERRED_VERSION_font-adobe-75dpi ?= "1.0.3"
+PREFERRED_VERSION_font-adobe-utopia-100dpi ?= "1.0.4"
+PREFERRED_VERSION_font-adobe-utopia-75dpi ?= "1.0.4"
+PREFERRED_VERSION_font-adobe-utopia-type1 ?= "1.0.4"
 PREFERRED_VERSION_font-alias ?= "1.0.3"
-PREFERRED_VERSION_font-arabic-misc ?= "1.0.2"
-PREFERRED_VERSION_font-bh-100dpi ?= "1.0.2"
-PREFERRED_VERSION_font-bh-75dpi ?= "1.0.2"
-PREFERRED_VERSION_font-bh-lucidatypewriter-100dpi ?= "1.0.2"
-PREFERRED_VERSION_font-bh-lucidatypewriter-75dpi ?= "1.0.2"
+PREFERRED_VERSION_font-arabic-misc ?= "1.0.3"
+PREFERRED_VERSION_font-bh-100dpi ?= "1.0.3"
+PREFERRED_VERSION_font-bh-75dpi ?= "1.0.3"
+PREFERRED_VERSION_font-bh-lucidatypewriter-100dpi ?= "1.0.3"
+PREFERRED_VERSION_font-bh-lucidatypewriter-75dpi ?= "1.0.3"
 PREFERRED_VERSION_font-bh-ttf ?= "1.0.3"
-PREFERRED_VERSION_font-bh-type1 ?= "1.0.2"
-PREFERRED_VERSION_font-bitstream-100dpi ?= "1.0.2"
-PREFERRED_VERSION_font-bitstream-75dpi ?= "1.0.2"
-PREFERRED_VERSION_font-bitstream-speedo ?= "1.0.1"
-PREFERRED_VERSION_font-bitstream-type1 ?= "1.0.2"
-PREFERRED_VERSION_font-cronyx-cyrillic ?= "1.0.2"
-PREFERRED_VERSION_font-cursor-misc ?= "1.0.2"
-PREFERRED_VERSION_font-daewoo-misc ?= "1.0.2"
-PREFERRED_VERSION_font-dec-misc ?= "1.0.2"
-PREFERRED_VERSION_font-ibm-type1 ?= "1.0.2"
-PREFERRED_VERSION_font-isas-misc ?= "1.0.2"
-PREFERRED_VERSION_font-jis-misc ?= "1.0.2"
-PREFERRED_VERSION_font-micro-misc ?= "1.0.2"
-PREFERRED_VERSION_font-misc-cyrillic ?= "1.0.2"
-PREFERRED_VERSION_font-misc-ethiopic ?= "1.0.2"
-PREFERRED_VERSION_font-misc-meltho ?= "1.0.2"
-PREFERRED_VERSION_font-misc-misc ?= "1.1.1"
-PREFERRED_VERSION_font-mutt-misc ?= "1.0.2"
-PREFERRED_VERSION_font-schumacher-misc ?= "1.1.1"
-PREFERRED_VERSION_font-screen-cyrillic ?= "1.0.3"
-PREFERRED_VERSION_font-sony-misc ?= "1.0.2"
-PREFERRED_VERSION_font-sun-misc ?= "1.0.2"
+PREFERRED_VERSION_font-bh-type1 ?= "1.0.3"
+PREFERRED_VERSION_font-bitstream-100dpi ?= "1.0.3"
+PREFERRED_VERSION_font-bitstream-75dpi ?= "1.0.3"
+PREFERRED_VERSION_font-bitstream-speedo ?= "1.0.2"
+PREFERRED_VERSION_font-bitstream-type1 ?= "1.0.3"
+PREFERRED_VERSION_font-cronyx-cyrillic ?= "1.0.3"
+PREFERRED_VERSION_font-cursor-misc ?= "1.0.3"
+PREFERRED_VERSION_font-daewoo-misc ?= "1.0.3"
+PREFERRED_VERSION_font-dec-misc ?= "1.0.3"
+PREFERRED_VERSION_font-ibm-type1 ?= "1.0.3"
+PREFERRED_VERSION_font-isas-misc ?= "1.0.3"
+PREFERRED_VERSION_font-jis-misc ?= "1.0.3"
+PREFERRED_VERSION_font-micro-misc ?= "1.0.3"
+PREFERRED_VERSION_font-misc-cyrillic ?= "1.0.3"
+PREFERRED_VERSION_font-misc-ethiopic ?= "1.0.3"
+PREFERRED_VERSION_font-misc-meltho ?= "1.0.3"
+PREFERRED_VERSION_font-misc-misc ?= "1.1.2"
+PREFERRED_VERSION_font-mutt-misc ?= "1.0.3"
+PREFERRED_VERSION_font-schumacher-misc ?= "1.1.2"
+PREFERRED_VERSION_font-screen-cyrillic ?= "1.0.4"
+PREFERRED_VERSION_font-sony-misc ?= "1.0.3"
+PREFERRED_VERSION_font-sun-misc ?= "1.0.3"
 PREFERRED_VERSION_font-util ?= "1.2.0"
 PREFERRED_VERSION_font-util-native ?= "1.2.0"
-PREFERRED_VERSION_font-winitzki-cyrillic ?= "1.0.2"
-PREFERRED_VERSION_font-xfree86-type1 ?= "1.0.3"
+PREFERRED_VERSION_font-winitzki-cyrillic ?= "1.0.3"
+PREFERRED_VERSION_font-xfree86-type1 ?= "1.0.4"
 #lib
 PREFERRED_VERSION_libapplewm ?= "1.4.0"
 PREFERRED_VERSION_libfs ?= "1.0.3"
@@ -293,8 +293,8 @@ PREFERRED_VERSION_libpciaccess ?= "0.12.0"
 PREFERRED_VERSION_libxkbfile ?= "1.0.7"
 PREFERRED_VERSION_libxkbfile-native ?= "1.0.7"
 PREFERRED_VERSION_libxkbui ?= "1.0.2"
-PREFERRED_VERSION_pixman ?= "0.20.0"
-PREFERRED_VERSION_pixman-native ?= "0.20.0"
+PREFERRED_VERSION_pixman ?= "0.21.2"
+PREFERRED_VERSION_pixman-native ?= "0.21.2"
 PREFERRED_VERSION_xtrans ?= "1.2.6"
 PREFERRED_VERSION_xtrans-native ?= "1.2.6"
 #proto
@@ -353,4 +353,4 @@ PREFERRED_VERSION_util-macros ?= "1.11.0"
 PREFERRED_VERSION_util-macros-native ?= "1.11.0"
 PREFERRED_VERSION_xorg-cf-files ?= "1.0.3"
 #xserver
-PREFERRED_VERSION_xserver-xorg ?= "1.9.2"
+PREFERRED_VERSION_xserver-xorg ?= "1.9.2.901"
diff --git a/recipes/xorg-doc/xorg-docs_1.5.99.901.bb b/recipes/xorg-doc/xorg-docs_1.5.99.901.bb
new file mode 100644
index 0000000..35c176a
--- /dev/null
+++ b/recipes/xorg-doc/xorg-docs_1.5.99.901.bb
@@ -0,0 +1,13 @@
+require xorg-doc-common.inc
+DESCRIPTION = "The documentation in this package is from xc/doc in the monolithic \
+source tree."
+DEPENDS += " intltool"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "a6e37aeb9fa68aed4c514a946e058f18"
+SRC_URI[archive.sha256sum] = "5382270cc181e315b762706d031de9f6f382d7b96dfff1e3d05426a53411ca96"
+
+EXTRA_OECONF += " ac_cv_file__usr_share_sgml_X11_defs_ent=no "
+
+FILES_${PN} += " /usr/share/X11/doc"
diff --git a/recipes/xorg-doc/xorg-sgml-doctools_1.5.99.901.bb b/recipes/xorg-doc/xorg-sgml-doctools_1.5.99.901.bb
new file mode 100644
index 0000000..f585129
--- /dev/null
+++ b/recipes/xorg-doc/xorg-sgml-doctools_1.5.99.901.bb
@@ -0,0 +1,8 @@
+require xorg-doc-common.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "6c415566a88f787261bcde73440e5ef0"
+SRC_URI[archive.sha256sum] = "fbd657ecb27d4f74b997aa44e85c22727cd383497978cc683e5b4dadbb472056"
+
+FILES_${PN} += " /usr/share/sgml/X11"
diff --git a/recipes/xorg-driver/xf86-video-geode_2.11.10.bb b/recipes/xorg-driver/xf86-video-geode_2.11.10.bb
new file mode 100644
index 0000000..ea3c171
--- /dev/null
+++ b/recipes/xorg-driver/xf86-video-geode_2.11.10.bb
@@ -0,0 +1,9 @@
+require xorg-driver-video.inc
+DESCRIPTION = "X.org server -- Geode GX2/LX display driver"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "8161cd380673c44177245d1d84366219"
+SRC_URI[archive.sha256sum] = "8e45c4849a2405cecff7a24c990c2b0a88621aeb103d1937c5ac05d78a1fabfd"
+
+COMPATIBLE_HOST = "i.86.*-linux"
diff --git a/recipes/xorg-driver/xf86-video-vmware_11.0.3.bb b/recipes/xorg-driver/xf86-video-vmware_11.0.3.bb
new file mode 100644
index 0000000..431f871
--- /dev/null
+++ b/recipes/xorg-driver/xf86-video-vmware_11.0.3.bb
@@ -0,0 +1,7 @@
+require xorg-driver-video.inc
+DEPENDS += " xineramaproto xf86miscproto drm xf86driproto"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "579bee487309b1bdc8329bf627d43413"
+SRC_URI[archive.sha256sum] = "b24a7cb2d87e416561e25122eab2cd48fc64a2ba105238456eefef16f29f38a3"
diff --git a/recipes/xorg-font/font-adobe-100dpi_1.0.3.bb b/recipes/xorg-font/font-adobe-100dpi_1.0.3.bb
new file mode 100644
index 0000000..e3f3d65
--- /dev/null
+++ b/recipes/xorg-font/font-adobe-100dpi_1.0.3.bb
@@ -0,0 +1,6 @@
+require xorg-font-common.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "1347c3031b74c9e91dc4dfa53b12f143"
+SRC_URI[archive.sha256sum] = "b2c08433eab5cb202470aa9f779efefce8d9cab2534f34f3aa4a31d05671c054"
diff --git a/recipes/xorg-font/font-adobe-75dpi_1.0.3.bb b/recipes/xorg-font/font-adobe-75dpi_1.0.3.bb
new file mode 100644
index 0000000..57b7827
--- /dev/null
+++ b/recipes/xorg-font/font-adobe-75dpi_1.0.3.bb
@@ -0,0 +1,6 @@
+require xorg-font-common.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "6c9f26c92393c0756f3e8d614713495b"
+SRC_URI[archive.sha256sum] = "c6024a1e4a1e65f413f994dd08b734efd393ce0a502eb465deb77b9a36db4d09"
diff --git a/recipes/xorg-font/font-adobe-utopia-100dpi_1.0.4.bb b/recipes/xorg-font/font-adobe-utopia-100dpi_1.0.4.bb
new file mode 100644
index 0000000..70b2b25
--- /dev/null
+++ b/recipes/xorg-font/font-adobe-utopia-100dpi_1.0.4.bb
@@ -0,0 +1,9 @@
+require xorg-font-common.inc
+
+DESCRIPTION = "Adobe typeface software"
+
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "66fb6de561648a6dce2755621d6aea17"
+SRC_URI[archive.sha256sum] = "d16f5e3f227cc6dd07a160a71f443559682dbc35f1c056a5385085aaec4fada5"
diff --git a/recipes/xorg-font/font-adobe-utopia-75dpi_1.0.4.bb b/recipes/xorg-font/font-adobe-utopia-75dpi_1.0.4.bb
new file mode 100644
index 0000000..2526a3a
--- /dev/null
+++ b/recipes/xorg-font/font-adobe-utopia-75dpi_1.0.4.bb
@@ -0,0 +1,9 @@
+require xorg-font-common.inc
+
+DESCRIPTION = "Adobe typeface software"
+
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "e99276db3e7cef6dccc8a57bc68aeba7"
+SRC_URI[archive.sha256sum] = "8732719c61f3661c8bad63804ebfd54fc7de21ab848e9a26a19b1778ef8b5c94"
diff --git a/recipes/xorg-font/font-adobe-utopia-type1_1.0.4.bb b/recipes/xorg-font/font-adobe-utopia-type1_1.0.4.bb
new file mode 100644
index 0000000..4c677f7
--- /dev/null
+++ b/recipes/xorg-font/font-adobe-utopia-type1_1.0.4.bb
@@ -0,0 +1,9 @@
+require xorg-font-common.inc
+
+DESCRIPTION = "Adobe typeface software"
+
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "fcf24554c348df3c689b91596d7f9971"
+SRC_URI[archive.sha256sum] = "979435105f897a70f8993fa02c8362160b0513366c2ab896965416f96dbb8077"
diff --git a/recipes/xorg-font/font-arabic-misc_1.0.3.bb b/recipes/xorg-font/font-arabic-misc_1.0.3.bb
new file mode 100644
index 0000000..d6d74fe
--- /dev/null
+++ b/recipes/xorg-font/font-arabic-misc_1.0.3.bb
@@ -0,0 +1,10 @@
+require xorg-font-common.inc
+
+DESCRIPTION = "100dpi, 24 point (approximately) font to minimally support (almost) all \
+of the Arabic characters available in Unicode."
+
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "cc0726e4a277d6ed93b8e09c1f195470"
+SRC_URI[archive.sha256sum] = "505d9b12a7093389e67a925dfda6346bde26d114c67f0cdca7aeda6e5d3344f4"
diff --git a/recipes/xorg-font/font-bh-100dpi_1.0.3.bb b/recipes/xorg-font/font-bh-100dpi_1.0.3.bb
new file mode 100644
index 0000000..b9bfbc6
--- /dev/null
+++ b/recipes/xorg-font/font-bh-100dpi_1.0.3.bb
@@ -0,0 +1,7 @@
+require xorg-font-common.inc
+
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "9f11ade089d689b9d59e0f47d26f39cd"
+SRC_URI[archive.sha256sum] = "23c07162708e4b79eb33095c8bfa62c783717a9431254bbf44863734ea239481"
diff --git a/recipes/xorg-font/font-bh-75dpi_1.0.3.bb b/recipes/xorg-font/font-bh-75dpi_1.0.3.bb
new file mode 100644
index 0000000..115ba6b
--- /dev/null
+++ b/recipes/xorg-font/font-bh-75dpi_1.0.3.bb
@@ -0,0 +1,7 @@
+require xorg-font-common.inc
+
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "565494fc3b6ac08010201d79c677a7a7"
+SRC_URI[archive.sha256sum] = "3486aa51ac92c646a448fe899c5c3dae0024b1fef724d5100d52640d1cac721c"
diff --git a/recipes/xorg-font/font-bh-lucidatypewriter-100dpi_1.0.3.bb b/recipes/xorg-font/font-bh-lucidatypewriter-100dpi_1.0.3.bb
new file mode 100644
index 0000000..8cc18c6
--- /dev/null
+++ b/recipes/xorg-font/font-bh-lucidatypewriter-100dpi_1.0.3.bb
@@ -0,0 +1,7 @@
+require xorg-font-common.inc
+
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "c8b73a53dcefe3e8d3907d3500e484a9"
+SRC_URI[archive.sha256sum] = "62a83363c2536095fda49d260d21e0847675676e4e3415054064cbdffa641fbb"
diff --git a/recipes/xorg-font/font-bh-lucidatypewriter-75dpi_1.0.3.bb b/recipes/xorg-font/font-bh-lucidatypewriter-75dpi_1.0.3.bb
new file mode 100644
index 0000000..ea45932
--- /dev/null
+++ b/recipes/xorg-font/font-bh-lucidatypewriter-75dpi_1.0.3.bb
@@ -0,0 +1,7 @@
+require xorg-font-common.inc
+
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "f6d65758ac9eb576ae49ab24c5e9019a"
+SRC_URI[archive.sha256sum] = "4ac16afbe205480cc5572e2977ea63488c543d05be0ea8e5a94c845a6eebcb31"
diff --git a/recipes/xorg-font/font-bh-type1_1.0.3.bb b/recipes/xorg-font/font-bh-type1_1.0.3.bb
new file mode 100644
index 0000000..f9644f0
--- /dev/null
+++ b/recipes/xorg-font/font-bh-type1_1.0.3.bb
@@ -0,0 +1,7 @@
+require xorg-font-common.inc
+
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "53ed9a42388b7ebb689bdfc374f96a22"
+SRC_URI[archive.sha256sum] = "761455a297486f3927a85d919b5c948d1d324181d4bea6c95d542504b68a63c1"
diff --git a/recipes/xorg-font/font-bitstream-100dpi_1.0.3.bb b/recipes/xorg-font/font-bitstream-100dpi_1.0.3.bb
new file mode 100644
index 0000000..188e460
--- /dev/null
+++ b/recipes/xorg-font/font-bitstream-100dpi_1.0.3.bb
@@ -0,0 +1,7 @@
+require xorg-font-common.inc
+
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "6b223a54b15ecbd5a1bc52312ad790d8"
+SRC_URI[archive.sha256sum] = "ebe0d7444e3d7c8da7642055ac2206f0190ee060700d99cd876f8fc9964cb6ce"
diff --git a/recipes/xorg-font/font-bitstream-75dpi_1.0.3.bb b/recipes/xorg-font/font-bitstream-75dpi_1.0.3.bb
new file mode 100644
index 0000000..eb20169
--- /dev/null
+++ b/recipes/xorg-font/font-bitstream-75dpi_1.0.3.bb
@@ -0,0 +1,7 @@
+require xorg-font-common.inc
+
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "d7c0588c26fac055c0dd683fdd65ac34"
+SRC_URI[archive.sha256sum] = "ba3f5e4610c07bd5859881660753ec6d75d179f26fc967aa776dbb3d5d5cf48e"
diff --git a/recipes/xorg-font/font-bitstream-speedo_1.0.2.bb b/recipes/xorg-font/font-bitstream-speedo_1.0.2.bb
new file mode 100644
index 0000000..2e25c18
--- /dev/null
+++ b/recipes/xorg-font/font-bitstream-speedo_1.0.2.bb
@@ -0,0 +1,7 @@
+require xorg-font-common.inc
+
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "13f6f107be164cfbf6be40d35ecf0c0f"
+SRC_URI[archive.sha256sum] = "0708fe0046947b88c082b55844af8a861741dcdf087f0624bdf23fb773d76763"
diff --git a/recipes/xorg-font/font-bitstream-type1_1.0.3.bb b/recipes/xorg-font/font-bitstream-type1_1.0.3.bb
new file mode 100644
index 0000000..c8d95fa
--- /dev/null
+++ b/recipes/xorg-font/font-bitstream-type1_1.0.3.bb
@@ -0,0 +1,7 @@
+require xorg-font-common.inc
+
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "5e0c9895d69d2632e2170114f8283c11"
+SRC_URI[archive.sha256sum] = "c6ea0569adad2c577f140328dc3302e729cb1b1ea90cd0025caf380625f8a688"
diff --git a/recipes/xorg-font/font-cronyx-cyrillic_1.0.3.bb b/recipes/xorg-font/font-cronyx-cyrillic_1.0.3.bb
new file mode 100644
index 0000000..bd6f429
--- /dev/null
+++ b/recipes/xorg-font/font-cronyx-cyrillic_1.0.3.bb
@@ -0,0 +1,7 @@
+require xorg-font-common.inc
+
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "e452b94b59b9cfd49110bb49b6267fba"
+SRC_URI[archive.sha256sum] = "6e8631936157677c77ba032b5c7b1fb3cb2ee872dbcea0444f12cd602cd9212a"
diff --git a/recipes/xorg-font/font-cursor-misc_1.0.3.bb b/recipes/xorg-font/font-cursor-misc_1.0.3.bb
new file mode 100644
index 0000000..4015126
--- /dev/null
+++ b/recipes/xorg-font/font-cursor-misc_1.0.3.bb
@@ -0,0 +1,7 @@
+require xorg-font-common.inc
+
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "3e0069d4f178a399cffe56daa95c2b63"
+SRC_URI[archive.sha256sum] = "17363eb35eece2e08144da5f060c70103b59d0972b4f4d77fd84c9a7a2dba635"
diff --git a/recipes/xorg-font/font-daewoo-misc_1.0.3.bb b/recipes/xorg-font/font-daewoo-misc_1.0.3.bb
new file mode 100644
index 0000000..8fed5bc
--- /dev/null
+++ b/recipes/xorg-font/font-daewoo-misc_1.0.3.bb
@@ -0,0 +1,7 @@
+require xorg-font-common.inc
+
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "0571bf77f8fab465a5454569d9989506"
+SRC_URI[archive.sha256sum] = "bc65de70bee12698caa95b523d3b652c056347e17b68cc8b5d6bbdff235c4be8"
diff --git a/recipes/xorg-font/font-dec-misc_1.0.3.bb b/recipes/xorg-font/font-dec-misc_1.0.3.bb
new file mode 100644
index 0000000..205975b
--- /dev/null
+++ b/recipes/xorg-font/font-dec-misc_1.0.3.bb
@@ -0,0 +1,7 @@
+require xorg-font-common.inc
+
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "6e7c5108f1b16d7a1c7b2c9760edd6e5"
+SRC_URI[archive.sha256sum] = "e19ddf8b5f8de914d81675358fdfe37762e9ce524887cc983adef34f2850ff7b"
diff --git a/recipes/xorg-font/font-ibm-type1_1.0.3.bb b/recipes/xorg-font/font-ibm-type1_1.0.3.bb
new file mode 100644
index 0000000..67d1abb
--- /dev/null
+++ b/recipes/xorg-font/font-ibm-type1_1.0.3.bb
@@ -0,0 +1,7 @@
+require xorg-font-common.inc
+
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "bfb2593d2102585f45daa960f43cb3c4"
+SRC_URI[archive.sha256sum] = "fddb28d3db5a07f4b4ca15388488a9680a10e1367a18f358f903b2a608a5d2df"
diff --git a/recipes/xorg-font/font-isas-misc_1.0.3.bb b/recipes/xorg-font/font-isas-misc_1.0.3.bb
new file mode 100644
index 0000000..243c2c2
--- /dev/null
+++ b/recipes/xorg-font/font-isas-misc_1.0.3.bb
@@ -0,0 +1,7 @@
+require xorg-font-common.inc
+
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "a2401caccbdcf5698e001784dbd43f1a"
+SRC_URI[archive.sha256sum] = "5824ab4b485951107dd245b8f7717d2822f1a6dbf6cea98f1ac7f49905c0a867"
diff --git a/recipes/xorg-font/font-jis-misc_1.0.3.bb b/recipes/xorg-font/font-jis-misc_1.0.3.bb
new file mode 100644
index 0000000..3fa7255
--- /dev/null
+++ b/recipes/xorg-font/font-jis-misc_1.0.3.bb
@@ -0,0 +1,7 @@
+require xorg-font-common.inc
+
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "cb7b57d7800fd9e28ec35d85761ed278"
+SRC_URI[archive.sha256sum] = "2b18ce10b367ebafe95a17de799b6db9a24e2337188d124adaf68af05b1fac65"
diff --git a/recipes/xorg-font/font-micro-misc_1.0.3.bb b/recipes/xorg-font/font-micro-misc_1.0.3.bb
new file mode 100644
index 0000000..ed0be23
--- /dev/null
+++ b/recipes/xorg-font/font-micro-misc_1.0.3.bb
@@ -0,0 +1,9 @@
+require xorg-font-common.inc
+
+PE = "1"
+PR = "${INC_PR}.0"
+
+EXTRA_OECONF = "--disable-iso8859-2 --disable-iso8859-3 --disable-iso8859-4 --disable-iso8859-5 --disable-iso8859-6 --disable-iso8859-7 --disable-iso8859-8 --disable-iso8859-9 --disable-iso8859-10 --disable-iso8859-11 --disable-iso8859-12 --disable-iso8859-13 --disable-iso8859-14 --disable-iso8859-15 --disable-iso8859-16 --disable-jisx0201 --disable-koi8-r"
+
+SRC_URI[archive.md5sum] = "143c228286fe9c920ab60e47c1b60b67"
+SRC_URI[archive.sha256sum] = "9a3381c10f32d9511f0ad4179df395914c50779103c16cddf7017f5220ed8db6"
diff --git a/recipes/xorg-font/font-misc-cyrillic_1.0.3.bb b/recipes/xorg-font/font-misc-cyrillic_1.0.3.bb
new file mode 100644
index 0000000..c843a60
--- /dev/null
+++ b/recipes/xorg-font/font-misc-cyrillic_1.0.3.bb
@@ -0,0 +1,7 @@
+require xorg-font-common.inc
+
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "96109d0890ad2b6b0e948525ebb0aba8"
+SRC_URI[archive.sha256sum] = "e40fe3e3323c62b738550795457ad555c70c008aa91b5912dfd46f8e745f5e60"
diff --git a/recipes/xorg-font/font-misc-ethiopic_1.0.3.bb b/recipes/xorg-font/font-misc-ethiopic_1.0.3.bb
new file mode 100644
index 0000000..31ef9c7
--- /dev/null
+++ b/recipes/xorg-font/font-misc-ethiopic_1.0.3.bb
@@ -0,0 +1,6 @@
+require xorg-font-common.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "6306c808f7d7e7d660dfb3859f9091d2"
+SRC_URI[archive.sha256sum] = "53cb1fd83afdbe7939c0eac34003676ee0e6023216892d98054db90b703c98a5"
diff --git a/recipes/xorg-font/font-misc-meltho_1.0.3.bb b/recipes/xorg-font/font-misc-meltho_1.0.3.bb
new file mode 100644
index 0000000..375ad25
--- /dev/null
+++ b/recipes/xorg-font/font-misc-meltho_1.0.3.bb
@@ -0,0 +1,8 @@
+require xorg-font-common.inc
+
+DESCRIPTION = "These fonts are designed for the display of Syriac text."
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "e3e7b0fda650adc7eb6964ff3c486b1c"
+SRC_URI[archive.sha256sum] = "3721323f13855cf7ca609115a1f7b182491e9b2b9c6e01eb1a2c7f8edd480791"
diff --git a/recipes/xorg-font/font-misc-misc_1.1.0.bb b/recipes/xorg-font/font-misc-misc_1.1.0.bb
index de2a830..0b58192 100644
--- a/recipes/xorg-font/font-misc-misc_1.1.0.bb
+++ b/recipes/xorg-font/font-misc-misc_1.1.0.bb
@@ -1,4 +1,6 @@
 require xorg-font-common.inc
 
+PR = "${INC_PR}.0"
+
 SRC_URI[archive.md5sum] = "878bfd4e9f14c1279cea3a8392e0dbdd"
 SRC_URI[archive.sha256sum] = "50f7528ab94f319a11efcd555dd5a7120191a42cf892c87cd6bdea8b908d497b"
diff --git a/recipes/xorg-font/font-misc-misc_1.1.1.bb b/recipes/xorg-font/font-misc-misc_1.1.1.bb
index 31f2ba9..56859bf 100644
--- a/recipes/xorg-font/font-misc-misc_1.1.1.bb
+++ b/recipes/xorg-font/font-misc-misc_1.1.1.bb
@@ -1,4 +1,6 @@
 require xorg-font-common.inc
 
+PR = "${INC_PR}.0"
+
 SRC_URI[archive.md5sum] = "6e25a0ff5ce776a1b894a7ea117b2858"
 SRC_URI[archive.sha256sum] = "c4f09a5c76549b1794bdc7e6be28e5aeb1178681ea76bceccdb11e43494d89ce"
diff --git a/recipes/xorg-font/font-misc-misc_1.1.2.bb b/recipes/xorg-font/font-misc-misc_1.1.2.bb
new file mode 100644
index 0000000..7ca1340
--- /dev/null
+++ b/recipes/xorg-font/font-misc-misc_1.1.2.bb
@@ -0,0 +1,6 @@
+require xorg-font-common.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "c88eb44b3b903d79fb44b860a213e623"
+SRC_URI[archive.sha256sum] = "b8e77940e4e1769dc47ef1805918d8c9be37c708735832a07204258bacc11794"
diff --git a/recipes/xorg-font/font-mutt-misc_1.0.3.bb b/recipes/xorg-font/font-mutt-misc_1.0.3.bb
new file mode 100644
index 0000000..5765da4
--- /dev/null
+++ b/recipes/xorg-font/font-mutt-misc_1.0.3.bb
@@ -0,0 +1,10 @@
+require xorg-font-common.inc
+
+DESCRIPTION = "Provides a 12pt, 100dpi proportional font with many of \
+the glyphs needed for Unicode text."
+
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "56b0296e8862fc1df5cdbb4efe604e86"
+SRC_URI[archive.sha256sum] = "bd5f7adb34367c197773a9801df5bce7b019664941900b2a31fbfe1ff2830f8f"
diff --git a/recipes/xorg-font/font-schumacher-misc_1.1.2.bb b/recipes/xorg-font/font-schumacher-misc_1.1.2.bb
new file mode 100644
index 0000000..e6af48a
--- /dev/null
+++ b/recipes/xorg-font/font-schumacher-misc_1.1.2.bb
@@ -0,0 +1,6 @@
+require xorg-font-common.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "e805feb7c4f20e6bfb1118d19d972219"
+SRC_URI[archive.sha256sum] = "e444028656e0767e2eddc6d9aca462b16a2be75a47244dbc199b2c44eca87e5a"
diff --git a/recipes/xorg-font/font-screen-cyrillic_1.0.4.bb b/recipes/xorg-font/font-screen-cyrillic_1.0.4.bb
new file mode 100644
index 0000000..60c41f6
--- /dev/null
+++ b/recipes/xorg-font/font-screen-cyrillic_1.0.4.bb
@@ -0,0 +1,6 @@
+require xorg-font-common.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "6f3fdcf2454bf08128a651914b7948ca"
+SRC_URI[archive.sha256sum] = "824231e8dffe15299454e47259f29d98001c9cf8ad3d6b5171399e4d71705e79"
diff --git a/recipes/xorg-font/font-sony-misc_1.0.3.bb b/recipes/xorg-font/font-sony-misc_1.0.3.bb
new file mode 100644
index 0000000..3594b62
--- /dev/null
+++ b/recipes/xorg-font/font-sony-misc_1.0.3.bb
@@ -0,0 +1,6 @@
+require xorg-font-common.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "beef61a9b0762aba8af7b736bb961f86"
+SRC_URI[archive.sha256sum] = "2043a326ba347c9da5ca1e9bc363e2521c3ea40b43b1f9662d333efd4867cff5"
diff --git a/recipes/xorg-font/font-sun-misc_1.0.3.bb b/recipes/xorg-font/font-sun-misc_1.0.3.bb
new file mode 100644
index 0000000..82ec778
--- /dev/null
+++ b/recipes/xorg-font/font-sun-misc_1.0.3.bb
@@ -0,0 +1,6 @@
+require xorg-font-common.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "948f2e07810b4f31195185921470f68d"
+SRC_URI[archive.sha256sum] = "481f4fcbbf7005658b080b3cf342c8c76de752e77f47958b2b383de73266d2e0"
diff --git a/recipes/xorg-font/font-winitzki-cyrillic_1.0.3.bb b/recipes/xorg-font/font-winitzki-cyrillic_1.0.3.bb
new file mode 100644
index 0000000..12fd34b
--- /dev/null
+++ b/recipes/xorg-font/font-winitzki-cyrillic_1.0.3.bb
@@ -0,0 +1,7 @@
+require xorg-font-common.inc
+
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "829a3159389b7f96f629e5388bfee67b"
+SRC_URI[archive.sha256sum] = "abd13b63d02fcaec488686c23683e5cf640b43bd32f8ca22eeae6f84df0a36a0"
diff --git a/recipes/xorg-font/font-xfree86-type1_1.0.4.bb b/recipes/xorg-font/font-xfree86-type1_1.0.4.bb
new file mode 100644
index 0000000..694c1d3
--- /dev/null
+++ b/recipes/xorg-font/font-xfree86-type1_1.0.4.bb
@@ -0,0 +1,7 @@
+require xorg-font-common.inc
+
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "3eeb3fb44690b477d510bbd8f86cf5aa"
+SRC_URI[archive.sha256sum] = "caebf42aec7be7f3bd40e0f232d6f34881b853dc84acfcdf7458358701fbe34a"
diff --git a/recipes/xorg-font/xorg-font-common.inc b/recipes/xorg-font/xorg-font-common.inc
index 79d1da6..d593884 100644
--- a/recipes/xorg-font/xorg-font-common.inc
+++ b/recipes/xorg-font/xorg-font-common.inc
@@ -2,7 +2,7 @@ HOMEPAGE = "http://www.x.org"
 SECTION = "x11/fonts"
 LICENSE = "MIT-X"
 
-DEPENDS = " encodings font-alias font-util-native mkfontdir-native mkfontscale-native"
+DEPENDS = " encodings font-alias font-util-native mkfontdir-native mkfontscale-native bdftopcf-native"
 RDEPENDS_${PN} = "encodings font-util font-alias"
 
 INC_PR = "r2"
diff --git a/recipes/xorg-xserver/xserver-xorg-1.9.2.901/dolt-fix.patch b/recipes/xorg-xserver/xserver-xorg-1.9.2.901/dolt-fix.patch
new file mode 100644
index 0000000..e332ce0
--- /dev/null
+++ b/recipes/xorg-xserver/xserver-xorg-1.9.2.901/dolt-fix.patch
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
diff --git a/recipes/xorg-xserver/xserver-xorg-1.9.2.901/hack-assume-pixman-supports-overlapped-blt.patch b/recipes/xorg-xserver/xserver-xorg-1.9.2.901/hack-assume-pixman-supports-overlapped-blt.patch
new file mode 100644
index 0000000..a947582
--- /dev/null
+++ b/recipes/xorg-xserver/xserver-xorg-1.9.2.901/hack-assume-pixman-supports-overlapped-blt.patch
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
diff --git a/recipes/xorg-xserver/xserver-xorg-1.9.2.901/hack-fbdev-ignore-return-mode.patch b/recipes/xorg-xserver/xserver-xorg-1.9.2.901/hack-fbdev-ignore-return-mode.patch
new file mode 100644
index 0000000..d3661cb
--- /dev/null
+++ b/recipes/xorg-xserver/xserver-xorg-1.9.2.901/hack-fbdev-ignore-return-mode.patch
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
diff --git a/recipes/xorg-xserver/xserver-xorg-1.9.2.901/randr-support.patch b/recipes/xorg-xserver/xserver-xorg-1.9.2.901/randr-support.patch
new file mode 100644
index 0000000..abc7db4
--- /dev/null
+++ b/recipes/xorg-xserver/xserver-xorg-1.9.2.901/randr-support.patch
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
diff --git a/recipes/xorg-xserver/xserver-xorg_1.9.2.901.bb b/recipes/xorg-xserver/xserver-xorg_1.9.2.901.bb
new file mode 100644
index 0000000..851c0e0
--- /dev/null
+++ b/recipes/xorg-xserver/xserver-xorg_1.9.2.901.bb
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
+SRC_URI[archive.md5sum] = "aa2b294277d1733d33d30609321c1b15"
+SRC_URI[archive.sha256sum] = "3be7ce1be0df04a73ee01c98ad54e1eec0694836371d4aef34098b514a51872b"
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
-- 
1.7.3.2



