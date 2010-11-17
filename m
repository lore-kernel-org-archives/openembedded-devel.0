Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1PIixh-0007Cu-7S
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Nov 2010 15:26:17 +0100
Received: by fxm11 with SMTP id 11so578932fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Nov 2010 06:25:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=3ncac5b83+9ar+F/DrmgEX95MQuk6HupoUvogl3s8Zg=;
	b=Jf01YMFu+KXmL9jm5Jc+pAaFSfFVH2Jp5+051zrDiOO7KKLsky5QF6WFS0NxyPdp5A
	wYO8DVp7hiFEPaWJseTw3sIqGmctGKzgE4lh6vUGpCRTSxZT8PggxxSg0AoGDujnGhaq
	aq5t5L4amHhl94Ci1jF78HZbfUCxIQrfewlcc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=jDbkZB4ULIaiBOejGV2n5/PS2B9G2ewvtHf5rPLdt0B/ecE07QSO4jqnzZiIqbsJ9H
	elaBsaUiYOL94kNt1M9igCC0nBJ+g06Z6U8b9bR5fLRdV+9ROdfE5DIzgX934BCoLGlc
	RVeK9UxPp7s6YlGVVXy8zKE7Ox1kiIjhd0bwo=
Received: by 10.223.86.203 with SMTP id t11mr6949000fal.97.1290003907320;
	Wed, 17 Nov 2010 06:25:07 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id y1sm1142657fak.15.2010.11.17.06.25.06
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 17 Nov 2010 06:25:06 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 17 Nov 2010 15:24:59 +0100
Message-Id: <1290003899-13958-3-git-send-email-Martin.Jansa@gmail.com>
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
Subject: [PATCH 3/3] xorg: remove recipes for versions not pinned in any distro config
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
X-List-Received-Date: Wed, 17 Nov 2010 14:26:17 -0000

---
 recipes/xorg-doc/xorg-sgml-doctools_1.5.bb         |    8 --------
 recipes/xorg-driver/xf86-video-geode_2.11.9.bb     |    9 ---------
 recipes/xorg-driver/xf86-video-vmware_11.0.2.bb    |    7 -------
 recipes/xorg-font/font-adobe-100dpi_1.0.2.bb       |    6 ------
 recipes/xorg-font/font-adobe-75dpi_1.0.2.bb        |    6 ------
 .../xorg-font/font-adobe-utopia-100dpi_1.0.3.bb    |    9 ---------
 recipes/xorg-font/font-adobe-utopia-75dpi_1.0.3.bb |    9 ---------
 recipes/xorg-font/font-adobe-utopia-type1_1.0.3.bb |    9 ---------
 recipes/xorg-font/font-arabic-misc_1.0.2.bb        |   10 ----------
 recipes/xorg-font/font-bh-100dpi_1.0.2.bb          |    7 -------
 recipes/xorg-font/font-bh-75dpi_1.0.2.bb           |    7 -------
 .../font-bh-lucidatypewriter-100dpi_1.0.2.bb       |    7 -------
 .../font-bh-lucidatypewriter-75dpi_1.0.2.bb        |    7 -------
 recipes/xorg-font/font-bh-type1_1.0.2.bb           |    7 -------
 recipes/xorg-font/font-bitstream-100dpi_1.0.2.bb   |    7 -------
 recipes/xorg-font/font-bitstream-75dpi_1.0.2.bb    |    7 -------
 recipes/xorg-font/font-bitstream-type1_1.0.2.bb    |    7 -------
 recipes/xorg-font/font-cronyx-cyrillic_1.0.2.bb    |    7 -------
 recipes/xorg-font/font-cursor-misc_1.0.2.bb        |    7 -------
 recipes/xorg-font/font-daewoo-misc_1.0.2.bb        |    7 -------
 recipes/xorg-font/font-dec-misc_1.0.2.bb           |    7 -------
 recipes/xorg-font/font-ibm-type1_1.0.2.bb          |    7 -------
 recipes/xorg-font/font-isas-misc_1.0.2.bb          |    7 -------
 recipes/xorg-font/font-jis-misc_1.0.2.bb           |    7 -------
 recipes/xorg-font/font-micro-misc_1.0.2.bb         |    9 ---------
 recipes/xorg-font/font-misc-cyrillic_1.0.2.bb      |    7 -------
 recipes/xorg-font/font-misc-ethiopic_1.0.2.bb      |    6 ------
 recipes/xorg-font/font-misc-meltho_1.0.2.bb        |    8 --------
 recipes/xorg-font/font-misc-misc_1.1.1.bb          |    6 ------
 recipes/xorg-font/font-schumacher-misc_1.1.1.bb    |    6 ------
 recipes/xorg-font/font-screen-cyrillic_1.0.3.bb    |    6 ------
 recipes/xorg-font/font-sony-misc_1.0.2.bb          |    6 ------
 recipes/xorg-font/font-sun-misc_1.0.2.bb           |    6 ------
 recipes/xorg-font/font-winitzki-cyrillic_1.0.2.bb  |    7 -------
 recipes/xorg-font/font-xfree86-type1_1.0.3.bb      |    7 -------
 35 files changed, 0 insertions(+), 252 deletions(-)
 delete mode 100644 recipes/xorg-doc/xorg-sgml-doctools_1.5.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-geode_2.11.9.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-vmware_11.0.2.bb
 delete mode 100644 recipes/xorg-font/font-adobe-100dpi_1.0.2.bb
 delete mode 100644 recipes/xorg-font/font-adobe-75dpi_1.0.2.bb
 delete mode 100644 recipes/xorg-font/font-adobe-utopia-100dpi_1.0.3.bb
 delete mode 100644 recipes/xorg-font/font-adobe-utopia-75dpi_1.0.3.bb
 delete mode 100644 recipes/xorg-font/font-adobe-utopia-type1_1.0.3.bb
 delete mode 100644 recipes/xorg-font/font-arabic-misc_1.0.2.bb
 delete mode 100644 recipes/xorg-font/font-bh-100dpi_1.0.2.bb
 delete mode 100644 recipes/xorg-font/font-bh-75dpi_1.0.2.bb
 delete mode 100644 recipes/xorg-font/font-bh-lucidatypewriter-100dpi_1.0.2.bb
 delete mode 100644 recipes/xorg-font/font-bh-lucidatypewriter-75dpi_1.0.2.bb
 delete mode 100644 recipes/xorg-font/font-bh-type1_1.0.2.bb
 delete mode 100644 recipes/xorg-font/font-bitstream-100dpi_1.0.2.bb
 delete mode 100644 recipes/xorg-font/font-bitstream-75dpi_1.0.2.bb
 delete mode 100644 recipes/xorg-font/font-bitstream-type1_1.0.2.bb
 delete mode 100644 recipes/xorg-font/font-cronyx-cyrillic_1.0.2.bb
 delete mode 100644 recipes/xorg-font/font-cursor-misc_1.0.2.bb
 delete mode 100644 recipes/xorg-font/font-daewoo-misc_1.0.2.bb
 delete mode 100644 recipes/xorg-font/font-dec-misc_1.0.2.bb
 delete mode 100644 recipes/xorg-font/font-ibm-type1_1.0.2.bb
 delete mode 100644 recipes/xorg-font/font-isas-misc_1.0.2.bb
 delete mode 100644 recipes/xorg-font/font-jis-misc_1.0.2.bb
 delete mode 100644 recipes/xorg-font/font-micro-misc_1.0.2.bb
 delete mode 100644 recipes/xorg-font/font-misc-cyrillic_1.0.2.bb
 delete mode 100644 recipes/xorg-font/font-misc-ethiopic_1.0.2.bb
 delete mode 100644 recipes/xorg-font/font-misc-meltho_1.0.2.bb
 delete mode 100644 recipes/xorg-font/font-misc-misc_1.1.1.bb
 delete mode 100644 recipes/xorg-font/font-schumacher-misc_1.1.1.bb
 delete mode 100644 recipes/xorg-font/font-screen-cyrillic_1.0.3.bb
 delete mode 100644 recipes/xorg-font/font-sony-misc_1.0.2.bb
 delete mode 100644 recipes/xorg-font/font-sun-misc_1.0.2.bb
 delete mode 100644 recipes/xorg-font/font-winitzki-cyrillic_1.0.2.bb
 delete mode 100644 recipes/xorg-font/font-xfree86-type1_1.0.3.bb

diff --git a/recipes/xorg-doc/xorg-sgml-doctools_1.5.bb b/recipes/xorg-doc/xorg-sgml-doctools_1.5.bb
deleted file mode 100644
index ab58deb..0000000
--- a/recipes/xorg-doc/xorg-sgml-doctools_1.5.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-doc-common.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "1cd2d8213ee71ebdbefce45c9da54762"
-SRC_URI[archive.sha256sum] = "0e135d7c848d8b740df71895aa00ed8354406979e01f0df50a243fcd46452e20"
-
-FILES_${PN} += " /usr/share/sgml/X11"
diff --git a/recipes/xorg-driver/xf86-video-geode_2.11.9.bb b/recipes/xorg-driver/xf86-video-geode_2.11.9.bb
deleted file mode 100644
index 7b5c6b1..0000000
--- a/recipes/xorg-driver/xf86-video-geode_2.11.9.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require xorg-driver-video.inc
-DESCRIPTION = "X.org server -- Geode GX2/LX display driver"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "718afca8425aa62662c03a9083915be1"
-SRC_URI[archive.sha256sum] = "b30d14a8ad389be055f95133a14e2da8ad43892b3fb5225d99bfb571cfec7bb5"
-
-COMPATIBLE_HOST = "i.86.*-linux"
diff --git a/recipes/xorg-driver/xf86-video-vmware_11.0.2.bb b/recipes/xorg-driver/xf86-video-vmware_11.0.2.bb
deleted file mode 100644
index 3b1a186..0000000
--- a/recipes/xorg-driver/xf86-video-vmware_11.0.2.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-driver-video.inc
-DEPENDS += " xineramaproto xf86miscproto drm xf86driproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "00c3a70870abcda5f340497b0285dab1"
-SRC_URI[archive.sha256sum] = "eab19da564b9488423424722fc84309fba2c10f1b90c092bf993f80c59f475d2"
diff --git a/recipes/xorg-font/font-adobe-100dpi_1.0.2.bb b/recipes/xorg-font/font-adobe-100dpi_1.0.2.bb
deleted file mode 100644
index 381094a..0000000
--- a/recipes/xorg-font/font-adobe-100dpi_1.0.2.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require xorg-font-common.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "1518e417b18e22673a8f4e2e4adda47b"
-SRC_URI[archive.sha256sum] = "71016e092043bc124f196d5be3d1921ab9131f2597ec15736a289973ca316775"
diff --git a/recipes/xorg-font/font-adobe-75dpi_1.0.2.bb b/recipes/xorg-font/font-adobe-75dpi_1.0.2.bb
deleted file mode 100644
index d1308d9..0000000
--- a/recipes/xorg-font/font-adobe-75dpi_1.0.2.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require xorg-font-common.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "73e8e5f04943e54b69503dcd90821a5f"
-SRC_URI[archive.sha256sum] = "2d49cacf910409dfb0776e02e08acec8926794bf63c2eb82a3a3947cf01310fd"
diff --git a/recipes/xorg-font/font-adobe-utopia-100dpi_1.0.3.bb b/recipes/xorg-font/font-adobe-utopia-100dpi_1.0.3.bb
deleted file mode 100644
index 337d1fc..0000000
--- a/recipes/xorg-font/font-adobe-utopia-100dpi_1.0.3.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require xorg-font-common.inc
-
-DESCRIPTION = "Adobe typeface software"
-
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "de543b3cad2dc0c5a5ef16d88b01acae"
-SRC_URI[archive.sha256sum] = "e048d1d37210b85bd008004dc55596bb0abdf67d60a4e8b0d5347f6ebd6c8cac"
diff --git a/recipes/xorg-font/font-adobe-utopia-75dpi_1.0.3.bb b/recipes/xorg-font/font-adobe-utopia-75dpi_1.0.3.bb
deleted file mode 100644
index a9d0201..0000000
--- a/recipes/xorg-font/font-adobe-utopia-75dpi_1.0.3.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require xorg-font-common.inc
-
-DESCRIPTION = "Adobe typeface software"
-
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "0d694a5591e89d2315d841f414668344"
-SRC_URI[archive.sha256sum] = "274dbe4adbb57a35a57c0eb248e01dcdbcd4e4aa0a3834263e4026becd9542e3"
diff --git a/recipes/xorg-font/font-adobe-utopia-type1_1.0.3.bb b/recipes/xorg-font/font-adobe-utopia-type1_1.0.3.bb
deleted file mode 100644
index 95010cc..0000000
--- a/recipes/xorg-font/font-adobe-utopia-type1_1.0.3.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require xorg-font-common.inc
-
-DESCRIPTION = "Adobe typeface software"
-
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "d086727a7d07b5ed60ca98c6ed88ccd5"
-SRC_URI[archive.sha256sum] = "50fa467293cdf2fd909f4a6e32de9da7435dde22e1e6c1066a408e5ac20610f9"
diff --git a/recipes/xorg-font/font-arabic-misc_1.0.2.bb b/recipes/xorg-font/font-arabic-misc_1.0.2.bb
deleted file mode 100644
index 1c77161..0000000
--- a/recipes/xorg-font/font-arabic-misc_1.0.2.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require xorg-font-common.inc
-
-DESCRIPTION = "100dpi, 24 point (approximately) font to minimally support (almost) all \
-of the Arabic characters available in Unicode."
-
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "40f50d360831755002ed3b25cc11d62d"
-SRC_URI[archive.sha256sum] = "ed3bae41b435c151e75d385456239aaf4d2d26dd6ef52cdc8314de0336206522"
diff --git a/recipes/xorg-font/font-bh-100dpi_1.0.2.bb b/recipes/xorg-font/font-bh-100dpi_1.0.2.bb
deleted file mode 100644
index 9c992e1..0000000
--- a/recipes/xorg-font/font-bh-100dpi_1.0.2.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-font-common.inc
-
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "66dc4284674242913bd333dfe6c2d175"
-SRC_URI[archive.sha256sum] = "9e7908b7d7586fb61615c9a3fa1e29c70ef6f24a393abe89f29969d27af93a2e"
diff --git a/recipes/xorg-font/font-bh-75dpi_1.0.2.bb b/recipes/xorg-font/font-bh-75dpi_1.0.2.bb
deleted file mode 100644
index e4c4dc6..0000000
--- a/recipes/xorg-font/font-bh-75dpi_1.0.2.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-font-common.inc
-
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "a2c4bd73637330391fd3d16e58be5528"
-SRC_URI[archive.sha256sum] = "40fe8a5be3925d6fb2da29b7f0d33bd27858c79b94f3ee38ebc0d86a3d4fa80d"
diff --git a/recipes/xorg-font/font-bh-lucidatypewriter-100dpi_1.0.2.bb b/recipes/xorg-font/font-bh-lucidatypewriter-100dpi_1.0.2.bb
deleted file mode 100644
index 719614c..0000000
--- a/recipes/xorg-font/font-bh-lucidatypewriter-100dpi_1.0.2.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-font-common.inc
-
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "6bb4ce98da5aadae91101484b1de9ea8"
-SRC_URI[archive.sha256sum] = "730ca783fb487fbc31885023fb2641420367202215c43fa79739d1f25cc75392"
diff --git a/recipes/xorg-font/font-bh-lucidatypewriter-75dpi_1.0.2.bb b/recipes/xorg-font/font-bh-lucidatypewriter-75dpi_1.0.2.bb
deleted file mode 100644
index 7279f83..0000000
--- a/recipes/xorg-font/font-bh-lucidatypewriter-75dpi_1.0.2.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-font-common.inc
-
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "c500d809e60b0139bf6b4bce6550372a"
-SRC_URI[archive.sha256sum] = "3f5dd55cc266386d453827e358a7984b809513db58a8aabfa8d9b3fc85720edf"
diff --git a/recipes/xorg-font/font-bh-type1_1.0.2.bb b/recipes/xorg-font/font-bh-type1_1.0.2.bb
deleted file mode 100644
index d5fbafa..0000000
--- a/recipes/xorg-font/font-bh-type1_1.0.2.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-font-common.inc
-
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "da9932f1c325095b48d73f954bdbce62"
-SRC_URI[archive.sha256sum] = "ff33bf9d8d3943b45ca7405586350ef9496de4add736d3ee057aa645fad90fe6"
diff --git a/recipes/xorg-font/font-bitstream-100dpi_1.0.2.bb b/recipes/xorg-font/font-bitstream-100dpi_1.0.2.bb
deleted file mode 100644
index b614690..0000000
--- a/recipes/xorg-font/font-bitstream-100dpi_1.0.2.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-font-common.inc
-
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "af353d08fa119c3da3b5d01f19d91c59"
-SRC_URI[archive.sha256sum] = "416d1968e7eae0848c058afaff351ff66ab95632cabab4eeff0cd050c1955613"
diff --git a/recipes/xorg-font/font-bitstream-75dpi_1.0.2.bb b/recipes/xorg-font/font-bitstream-75dpi_1.0.2.bb
deleted file mode 100644
index e8e8b90..0000000
--- a/recipes/xorg-font/font-bitstream-75dpi_1.0.2.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-font-common.inc
-
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "e51e4ed02a7c09022134ce1f6714b277"
-SRC_URI[archive.sha256sum] = "3de2cbe0fdbfb1a752aef761f65ad9d64e6881b79822b7028cecbc5ea87c5ff3"
diff --git a/recipes/xorg-font/font-bitstream-type1_1.0.2.bb b/recipes/xorg-font/font-bitstream-type1_1.0.2.bb
deleted file mode 100644
index 2eec48d..0000000
--- a/recipes/xorg-font/font-bitstream-type1_1.0.2.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-font-common.inc
-
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "27c55f6a938e7153c59fb551b2f491f9"
-SRC_URI[archive.sha256sum] = "5deb7a36cd70f8048d0c20a743dd56de9d1ced2e9a3f556678def492b0a54cf1"
diff --git a/recipes/xorg-font/font-cronyx-cyrillic_1.0.2.bb b/recipes/xorg-font/font-cronyx-cyrillic_1.0.2.bb
deleted file mode 100644
index 5aca57a..0000000
--- a/recipes/xorg-font/font-cronyx-cyrillic_1.0.2.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-font-common.inc
-
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "98fa04be8f2ad27a0c4d73a06acbcfbc"
-SRC_URI[archive.sha256sum] = "f8c0ab277f4a6fd8a68f90bb702de1f2ba25333013c123b6f7dc3bcbc6471caa"
diff --git a/recipes/xorg-font/font-cursor-misc_1.0.2.bb b/recipes/xorg-font/font-cursor-misc_1.0.2.bb
deleted file mode 100644
index 3ffa63e..0000000
--- a/recipes/xorg-font/font-cursor-misc_1.0.2.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-font-common.inc
-
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "b0ff8cb54d245d328ba5b9ed38d734ed"
-SRC_URI[archive.sha256sum] = "117a000109d0d9b71f1efe5809dac2bc7c254ff9a7a8995f7a295842881e300f"
diff --git a/recipes/xorg-font/font-daewoo-misc_1.0.2.bb b/recipes/xorg-font/font-daewoo-misc_1.0.2.bb
deleted file mode 100644
index b054af1..0000000
--- a/recipes/xorg-font/font-daewoo-misc_1.0.2.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-font-common.inc
-
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "7db1b5b2304c49df5f44aeb815e265d6"
-SRC_URI[archive.sha256sum] = "9d3f13449afc51d21d3de4f049982a92056c71a98bdc43b6b9dbf615c297b9c9"
diff --git a/recipes/xorg-font/font-dec-misc_1.0.2.bb b/recipes/xorg-font/font-dec-misc_1.0.2.bb
deleted file mode 100644
index e66765f..0000000
--- a/recipes/xorg-font/font-dec-misc_1.0.2.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-font-common.inc
-
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "46e46e60e7dbf1fd6dc264392799d5d8"
-SRC_URI[archive.sha256sum] = "b726d0f7fc8e712480cab0db80d24f7c539342d3ed4f426aa0ec6f48a93e51ee"
diff --git a/recipes/xorg-font/font-ibm-type1_1.0.2.bb b/recipes/xorg-font/font-ibm-type1_1.0.2.bb
deleted file mode 100644
index aed277b..0000000
--- a/recipes/xorg-font/font-ibm-type1_1.0.2.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-font-common.inc
-
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "ad4a8b9443f32c29a4e7001a50af17c0"
-SRC_URI[archive.sha256sum] = "a8c95e7c34b8cc82ae97d7db9d482db4fc4ac4f3451ca8b04df1a1bd8efa2764"
diff --git a/recipes/xorg-font/font-isas-misc_1.0.2.bb b/recipes/xorg-font/font-isas-misc_1.0.2.bb
deleted file mode 100644
index 5c96898..0000000
--- a/recipes/xorg-font/font-isas-misc_1.0.2.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-font-common.inc
-
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "02eca731d77307c4cb37738a32f2db9f"
-SRC_URI[archive.sha256sum] = "f0dc69141e04573aaf27232e72cb312b3b6c7bbadbb562522dde67993ce76535"
diff --git a/recipes/xorg-font/font-jis-misc_1.0.2.bb b/recipes/xorg-font/font-jis-misc_1.0.2.bb
deleted file mode 100644
index 3977f65..0000000
--- a/recipes/xorg-font/font-jis-misc_1.0.2.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-font-common.inc
-
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "b08eb798739f85158fee74977cf335c2"
-SRC_URI[archive.sha256sum] = "f570a7245dad60a42f68aed5f7b94e9166ea9c7f4f3ce892c79b7a8b234a1d8f"
diff --git a/recipes/xorg-font/font-micro-misc_1.0.2.bb b/recipes/xorg-font/font-micro-misc_1.0.2.bb
deleted file mode 100644
index ce57cdb..0000000
--- a/recipes/xorg-font/font-micro-misc_1.0.2.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require xorg-font-common.inc
-
-PE = "1"
-PR = "${INC_PR}.0"
-
-EXTRA_OECONF = "--disable-iso8859-2 --disable-iso8859-3 --disable-iso8859-4 --disable-iso8859-5 --disable-iso8859-6 --disable-iso8859-7 --disable-iso8859-8 --disable-iso8859-9 --disable-iso8859-10 --disable-iso8859-11 --disable-iso8859-12 --disable-iso8859-13 --disable-iso8859-14 --disable-iso8859-15 --disable-iso8859-16 --disable-jisx0201 --disable-koi8-r"
-
-SRC_URI[archive.md5sum] = "2515f3fd42de917d088869a4e8d9813b"
-SRC_URI[archive.sha256sum] = "020678e9f67795c67c95331add02db5b4b8db090af3255938dd405cf855aa12f"
diff --git a/recipes/xorg-font/font-misc-cyrillic_1.0.2.bb b/recipes/xorg-font/font-misc-cyrillic_1.0.2.bb
deleted file mode 100644
index 0b85af8..0000000
--- a/recipes/xorg-font/font-misc-cyrillic_1.0.2.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-font-common.inc
-
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "d6eede978912b85ad96ca409f6a20690"
-SRC_URI[archive.sha256sum] = "7821db4a1c9f94540e31dd1003bcac3f694b0de917b2d68bd8140129e64c0498"
diff --git a/recipes/xorg-font/font-misc-ethiopic_1.0.2.bb b/recipes/xorg-font/font-misc-ethiopic_1.0.2.bb
deleted file mode 100644
index b1c4948..0000000
--- a/recipes/xorg-font/font-misc-ethiopic_1.0.2.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require xorg-font-common.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "bf9879739a9f06dc1980cf16defaa4d9"
-SRC_URI[archive.sha256sum] = "250424b04bba8c85bf5ee5af184b6c8c02227360828258acdb2de4f4d71322ce"
diff --git a/recipes/xorg-font/font-misc-meltho_1.0.2.bb b/recipes/xorg-font/font-misc-meltho_1.0.2.bb
deleted file mode 100644
index 5309b64..0000000
--- a/recipes/xorg-font/font-misc-meltho_1.0.2.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-font-common.inc
-
-DESCRIPTION = "These fonts are designed for the display of Syriac text."
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "b6d53e8bcc06e25f868130a0c4619ab2"
-SRC_URI[archive.sha256sum] = "ec8813f32d1bfceed96cc186c02be7156bf076954e2e30ac7d41e02ba070b91e"
diff --git a/recipes/xorg-font/font-misc-misc_1.1.1.bb b/recipes/xorg-font/font-misc-misc_1.1.1.bb
deleted file mode 100644
index 56859bf..0000000
--- a/recipes/xorg-font/font-misc-misc_1.1.1.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require xorg-font-common.inc
-
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "6e25a0ff5ce776a1b894a7ea117b2858"
-SRC_URI[archive.sha256sum] = "c4f09a5c76549b1794bdc7e6be28e5aeb1178681ea76bceccdb11e43494d89ce"
diff --git a/recipes/xorg-font/font-schumacher-misc_1.1.1.bb b/recipes/xorg-font/font-schumacher-misc_1.1.1.bb
deleted file mode 100644
index 11094ff..0000000
--- a/recipes/xorg-font/font-schumacher-misc_1.1.1.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require xorg-font-common.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "bd63a27f967f4d98a257f7d677f2cb5b"
-SRC_URI[archive.sha256sum] = "e6ce520ab2962eaa4d639538fc44b7f4b5a5abf4f273bd8643fcd05b14adfbe5"
diff --git a/recipes/xorg-font/font-screen-cyrillic_1.0.3.bb b/recipes/xorg-font/font-screen-cyrillic_1.0.3.bb
deleted file mode 100644
index 3e85276..0000000
--- a/recipes/xorg-font/font-screen-cyrillic_1.0.3.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require xorg-font-common.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "d50d209c9e7580aaba544d54b5e51e76"
-SRC_URI[archive.sha256sum] = "4e1a3892cb0059e24acf3156f59122e4fdf14164c3a7ed5d93e0788ef8b7ef0a"
diff --git a/recipes/xorg-font/font-sony-misc_1.0.2.bb b/recipes/xorg-font/font-sony-misc_1.0.2.bb
deleted file mode 100644
index 08079d8..0000000
--- a/recipes/xorg-font/font-sony-misc_1.0.2.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require xorg-font-common.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "5efb8d23f57124c0f65d7112e2fa6997"
-SRC_URI[archive.sha256sum] = "6ecb69b1b6ae716158e167217f6179d1b0c138c124e90dfaf2888e3b888fc754"
diff --git a/recipes/xorg-font/font-sun-misc_1.0.2.bb b/recipes/xorg-font/font-sun-misc_1.0.2.bb
deleted file mode 100644
index b5ed49a..0000000
--- a/recipes/xorg-font/font-sun-misc_1.0.2.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require xorg-font-common.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "a01cb1b68d01840ad3442bac7b5b2701"
-SRC_URI[archive.sha256sum] = "22a3d64ec5625e402de2a66f7888920cfaa175c8de1405db163f0b411b2be3f1"
diff --git a/recipes/xorg-font/font-winitzki-cyrillic_1.0.2.bb b/recipes/xorg-font/font-winitzki-cyrillic_1.0.2.bb
deleted file mode 100644
index fae519d..0000000
--- a/recipes/xorg-font/font-winitzki-cyrillic_1.0.2.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-font-common.inc
-
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "2d92227f14910732dc46303d6f8a9543"
-SRC_URI[archive.sha256sum] = "f4fbf0ae12b7a0e5dd440cb2d63eb24feada3d283b9e0d588295f799e772ffe0"
diff --git a/recipes/xorg-font/font-xfree86-type1_1.0.3.bb b/recipes/xorg-font/font-xfree86-type1_1.0.3.bb
deleted file mode 100644
index 48bca39..0000000
--- a/recipes/xorg-font/font-xfree86-type1_1.0.3.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-font-common.inc
-
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "df934bfc0339322cee73ee3c5460a648"
-SRC_URI[archive.sha256sum] = "2ac19a2bde71cfd614da4e3e90f9ad992a94a8ebd1ee4fee44f8aad6f01363ba"
-- 
1.7.3.2



