Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Pcgak-0000ZV-VC
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Jan 2011 16:57:03 +0100
Received: by fxm17 with SMTP id 17so19263452fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jan 2011 07:56:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=oGmIwNpB2l6cve7H0Gyxy9EstlxAV0RqWxy6wtl5EN4=;
	b=xR9KeXXl4FxS1/6rHmeKefo0UfH508hfBUwScY10lfzw/c7oLpx/kVjLbG4FSZT26u
	nN4Vc7WlNfNB5YeKqDqYJjB9BVkEGes0o6ql3nUp//NPaTfWtmDP8VrpjmFnJ4rO9Wu1
	QSq+m1gW5mnkiUGYJzZIDO+L6GQECh00MnNnI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=HxyCNRH4yyPyWCAMBDI0SKltsgvBBHk9IatffJ/wy/bv5czB0wuoZMGpOif6BwNjw4
	8IMJiNz1AmGcTcPi0xRVGYiIXZppHQ2BC1G9BOCk7Of9Mc7zDwnylr3s4fjlnmn9T/Uo
	gJVApne8/3Ns6KrXK0LdkSiwa+XCyyKkMHfLw=
Received: by 10.223.103.197 with SMTP id l5mr2417164fao.7.1294761386509;
	Tue, 11 Jan 2011 07:56:26 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id y1sm7445329fak.15.2011.01.11.07.56.25
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 11 Jan 2011 07:56:25 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Jan 2011 16:56:19 +0100
Message-Id: <1294761389-13634-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.rc1
In-Reply-To: <1294761389-13634-1-git-send-email-Martin.Jansa@gmail.com>
References: <1294761389-13634-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH 02/12] xorg-font: obsolete old versions
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
X-List-Received-Date: Tue, 11 Jan 2011 15:57:03 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes/obsolete/xorg-font/encodings_1.0.3.bb      |    8 ++++++++
 .../obsolete/xorg-font/font-adobe-100dpi_1.0.1.bb  |    6 ++++++
 .../obsolete/xorg-font/font-adobe-75dpi_1.0.1.bb   |    6 ++++++
 .../xorg-font/font-adobe-utopia-100dpi_1.0.2.bb    |    9 +++++++++
 .../xorg-font/font-adobe-utopia-75dpi_1.0.2.bb     |    9 +++++++++
 .../xorg-font/font-adobe-utopia-type1_1.0.2.bb     |    9 +++++++++
 recipes/obsolete/xorg-font/font-alias_1.0.2.bb     |   12 ++++++++++++
 .../obsolete/xorg-font/font-arabic-misc_1.0.1.bb   |   10 ++++++++++
 recipes/obsolete/xorg-font/font-bh-100dpi_1.0.1.bb |    7 +++++++
 recipes/obsolete/xorg-font/font-bh-75dpi_1.0.1.bb  |    7 +++++++
 .../font-bh-lucidatypewriter-100dpi_1.0.1.bb       |    7 +++++++
 .../font-bh-lucidatypewriter-75dpi_1.0.1.bb        |    7 +++++++
 recipes/obsolete/xorg-font/font-bh-ttf_1.0.1.bb    |    7 +++++++
 recipes/obsolete/xorg-font/font-bh-type1_1.0.1.bb  |    7 +++++++
 .../xorg-font/font-bitstream-100dpi_1.0.1.bb       |    7 +++++++
 .../xorg-font/font-bitstream-75dpi_1.0.1.bb        |    7 +++++++
 .../xorg-font/font-bitstream-speedo_1.0.1.bb       |    7 +++++++
 .../xorg-font/font-bitstream-type1_1.0.1.bb        |    7 +++++++
 .../xorg-font/font-cronyx-cyrillic_1.0.1.bb        |    7 +++++++
 .../obsolete/xorg-font/font-cursor-misc_1.0.1.bb   |    7 +++++++
 .../obsolete/xorg-font/font-daewoo-misc_1.0.1.bb   |    7 +++++++
 recipes/obsolete/xorg-font/font-dec-misc_1.0.1.bb  |    7 +++++++
 recipes/obsolete/xorg-font/font-ibm-type1_1.0.1.bb |    7 +++++++
 recipes/obsolete/xorg-font/font-isas-misc_1.0.1.bb |    7 +++++++
 recipes/obsolete/xorg-font/font-jis-misc_1.0.1.bb  |    7 +++++++
 .../obsolete/xorg-font/font-micro-misc_1.0.1.bb    |    9 +++++++++
 .../obsolete/xorg-font/font-misc-cyrillic_1.0.1.bb |    7 +++++++
 .../obsolete/xorg-font/font-misc-ethiopic_1.0.1.bb |    6 ++++++
 .../obsolete/xorg-font/font-misc-meltho_1.0.1.bb   |    8 ++++++++
 recipes/obsolete/xorg-font/font-misc-misc_1.1.0.bb |    6 ++++++
 recipes/obsolete/xorg-font/font-mutt-misc_1.0.1.bb |   10 ++++++++++
 recipes/obsolete/xorg-font/font-mutt-misc_1.0.2.bb |   10 ++++++++++
 .../xorg-font/font-schumacher-misc_1.1.0.bb        |    6 ++++++
 .../xorg-font/font-screen-cyrillic_1.0.2.bb        |    6 ++++++
 recipes/obsolete/xorg-font/font-sony-misc_1.0.1.bb |    6 ++++++
 recipes/obsolete/xorg-font/font-sun-misc_1.0.1.bb  |    6 ++++++
 recipes/obsolete/xorg-font/font-util_1.1.1.bb      |   19 +++++++++++++++++++
 .../xorg-font/font-winitzki-cyrillic_1.0.1.bb      |    7 +++++++
 .../obsolete/xorg-font/font-xfree86-type1_1.0.2.bb |    7 +++++++
 recipes/xorg-font/encodings_1.0.3.bb               |    8 --------
 recipes/xorg-font/font-adobe-100dpi_1.0.1.bb       |    6 ------
 recipes/xorg-font/font-adobe-75dpi_1.0.1.bb        |    6 ------
 .../xorg-font/font-adobe-utopia-100dpi_1.0.2.bb    |    9 ---------
 recipes/xorg-font/font-adobe-utopia-75dpi_1.0.2.bb |    9 ---------
 recipes/xorg-font/font-adobe-utopia-type1_1.0.2.bb |    9 ---------
 recipes/xorg-font/font-alias_1.0.2.bb              |   12 ------------
 recipes/xorg-font/font-arabic-misc_1.0.1.bb        |   10 ----------
 recipes/xorg-font/font-bh-100dpi_1.0.1.bb          |    7 -------
 recipes/xorg-font/font-bh-75dpi_1.0.1.bb           |    7 -------
 .../font-bh-lucidatypewriter-100dpi_1.0.1.bb       |    7 -------
 .../font-bh-lucidatypewriter-75dpi_1.0.1.bb        |    7 -------
 recipes/xorg-font/font-bh-ttf_1.0.1.bb             |    7 -------
 recipes/xorg-font/font-bh-type1_1.0.1.bb           |    7 -------
 recipes/xorg-font/font-bitstream-100dpi_1.0.1.bb   |    7 -------
 recipes/xorg-font/font-bitstream-75dpi_1.0.1.bb    |    7 -------
 recipes/xorg-font/font-bitstream-speedo_1.0.1.bb   |    7 -------
 recipes/xorg-font/font-bitstream-type1_1.0.1.bb    |    7 -------
 recipes/xorg-font/font-cronyx-cyrillic_1.0.1.bb    |    7 -------
 recipes/xorg-font/font-cursor-misc_1.0.1.bb        |    7 -------
 recipes/xorg-font/font-daewoo-misc_1.0.1.bb        |    7 -------
 recipes/xorg-font/font-dec-misc_1.0.1.bb           |    7 -------
 recipes/xorg-font/font-ibm-type1_1.0.1.bb          |    7 -------
 recipes/xorg-font/font-isas-misc_1.0.1.bb          |    7 -------
 recipes/xorg-font/font-jis-misc_1.0.1.bb           |    7 -------
 recipes/xorg-font/font-micro-misc_1.0.1.bb         |    9 ---------
 recipes/xorg-font/font-misc-cyrillic_1.0.1.bb      |    7 -------
 recipes/xorg-font/font-misc-ethiopic_1.0.1.bb      |    6 ------
 recipes/xorg-font/font-misc-meltho_1.0.1.bb        |    8 --------
 recipes/xorg-font/font-misc-misc_1.1.0.bb          |    6 ------
 recipes/xorg-font/font-mutt-misc_1.0.1.bb          |   10 ----------
 recipes/xorg-font/font-mutt-misc_1.0.2.bb          |   10 ----------
 recipes/xorg-font/font-schumacher-misc_1.1.0.bb    |    6 ------
 recipes/xorg-font/font-screen-cyrillic_1.0.2.bb    |    6 ------
 recipes/xorg-font/font-sony-misc_1.0.1.bb          |    6 ------
 recipes/xorg-font/font-sun-misc_1.0.1.bb           |    6 ------
 recipes/xorg-font/font-util_1.1.1.bb               |   19 -------------------
 recipes/xorg-font/font-winitzki-cyrillic_1.0.1.bb  |    7 -------
 recipes/xorg-font/font-xfree86-type1_1.0.2.bb      |    7 -------
 78 files changed, 301 insertions(+), 301 deletions(-)
 create mode 100644 recipes/obsolete/xorg-font/encodings_1.0.3.bb
 create mode 100644 recipes/obsolete/xorg-font/font-adobe-100dpi_1.0.1.bb
 create mode 100644 recipes/obsolete/xorg-font/font-adobe-75dpi_1.0.1.bb
 create mode 100644 recipes/obsolete/xorg-font/font-adobe-utopia-100dpi_1.0.2.bb
 create mode 100644 recipes/obsolete/xorg-font/font-adobe-utopia-75dpi_1.0.2.bb
 create mode 100644 recipes/obsolete/xorg-font/font-adobe-utopia-type1_1.0.2.bb
 create mode 100644 recipes/obsolete/xorg-font/font-alias_1.0.2.bb
 create mode 100644 recipes/obsolete/xorg-font/font-arabic-misc_1.0.1.bb
 create mode 100644 recipes/obsolete/xorg-font/font-bh-100dpi_1.0.1.bb
 create mode 100644 recipes/obsolete/xorg-font/font-bh-75dpi_1.0.1.bb
 create mode 100644 recipes/obsolete/xorg-font/font-bh-lucidatypewriter-100dpi_1.0.1.bb
 create mode 100644 recipes/obsolete/xorg-font/font-bh-lucidatypewriter-75dpi_1.0.1.bb
 create mode 100644 recipes/obsolete/xorg-font/font-bh-ttf_1.0.1.bb
 create mode 100644 recipes/obsolete/xorg-font/font-bh-type1_1.0.1.bb
 create mode 100644 recipes/obsolete/xorg-font/font-bitstream-100dpi_1.0.1.bb
 create mode 100644 recipes/obsolete/xorg-font/font-bitstream-75dpi_1.0.1.bb
 create mode 100644 recipes/obsolete/xorg-font/font-bitstream-speedo_1.0.1.bb
 create mode 100644 recipes/obsolete/xorg-font/font-bitstream-type1_1.0.1.bb
 create mode 100644 recipes/obsolete/xorg-font/font-cronyx-cyrillic_1.0.1.bb
 create mode 100644 recipes/obsolete/xorg-font/font-cursor-misc_1.0.1.bb
 create mode 100644 recipes/obsolete/xorg-font/font-daewoo-misc_1.0.1.bb
 create mode 100644 recipes/obsolete/xorg-font/font-dec-misc_1.0.1.bb
 create mode 100644 recipes/obsolete/xorg-font/font-ibm-type1_1.0.1.bb
 create mode 100644 recipes/obsolete/xorg-font/font-isas-misc_1.0.1.bb
 create mode 100644 recipes/obsolete/xorg-font/font-jis-misc_1.0.1.bb
 create mode 100644 recipes/obsolete/xorg-font/font-micro-misc_1.0.1.bb
 create mode 100644 recipes/obsolete/xorg-font/font-misc-cyrillic_1.0.1.bb
 create mode 100644 recipes/obsolete/xorg-font/font-misc-ethiopic_1.0.1.bb
 create mode 100644 recipes/obsolete/xorg-font/font-misc-meltho_1.0.1.bb
 create mode 100644 recipes/obsolete/xorg-font/font-misc-misc_1.1.0.bb
 create mode 100644 recipes/obsolete/xorg-font/font-mutt-misc_1.0.1.bb
 create mode 100644 recipes/obsolete/xorg-font/font-mutt-misc_1.0.2.bb
 create mode 100644 recipes/obsolete/xorg-font/font-schumacher-misc_1.1.0.bb
 create mode 100644 recipes/obsolete/xorg-font/font-screen-cyrillic_1.0.2.bb
 create mode 100644 recipes/obsolete/xorg-font/font-sony-misc_1.0.1.bb
 create mode 100644 recipes/obsolete/xorg-font/font-sun-misc_1.0.1.bb
 create mode 100644 recipes/obsolete/xorg-font/font-util_1.1.1.bb
 create mode 100644 recipes/obsolete/xorg-font/font-winitzki-cyrillic_1.0.1.bb
 create mode 100644 recipes/obsolete/xorg-font/font-xfree86-type1_1.0.2.bb
 delete mode 100644 recipes/xorg-font/encodings_1.0.3.bb
 delete mode 100644 recipes/xorg-font/font-adobe-100dpi_1.0.1.bb
 delete mode 100644 recipes/xorg-font/font-adobe-75dpi_1.0.1.bb
 delete mode 100644 recipes/xorg-font/font-adobe-utopia-100dpi_1.0.2.bb
 delete mode 100644 recipes/xorg-font/font-adobe-utopia-75dpi_1.0.2.bb
 delete mode 100644 recipes/xorg-font/font-adobe-utopia-type1_1.0.2.bb
 delete mode 100644 recipes/xorg-font/font-alias_1.0.2.bb
 delete mode 100644 recipes/xorg-font/font-arabic-misc_1.0.1.bb
 delete mode 100644 recipes/xorg-font/font-bh-100dpi_1.0.1.bb
 delete mode 100644 recipes/xorg-font/font-bh-75dpi_1.0.1.bb
 delete mode 100644 recipes/xorg-font/font-bh-lucidatypewriter-100dpi_1.0.1.bb
 delete mode 100644 recipes/xorg-font/font-bh-lucidatypewriter-75dpi_1.0.1.bb
 delete mode 100644 recipes/xorg-font/font-bh-ttf_1.0.1.bb
 delete mode 100644 recipes/xorg-font/font-bh-type1_1.0.1.bb
 delete mode 100644 recipes/xorg-font/font-bitstream-100dpi_1.0.1.bb
 delete mode 100644 recipes/xorg-font/font-bitstream-75dpi_1.0.1.bb
 delete mode 100644 recipes/xorg-font/font-bitstream-speedo_1.0.1.bb
 delete mode 100644 recipes/xorg-font/font-bitstream-type1_1.0.1.bb
 delete mode 100644 recipes/xorg-font/font-cronyx-cyrillic_1.0.1.bb
 delete mode 100644 recipes/xorg-font/font-cursor-misc_1.0.1.bb
 delete mode 100644 recipes/xorg-font/font-daewoo-misc_1.0.1.bb
 delete mode 100644 recipes/xorg-font/font-dec-misc_1.0.1.bb
 delete mode 100644 recipes/xorg-font/font-ibm-type1_1.0.1.bb
 delete mode 100644 recipes/xorg-font/font-isas-misc_1.0.1.bb
 delete mode 100644 recipes/xorg-font/font-jis-misc_1.0.1.bb
 delete mode 100644 recipes/xorg-font/font-micro-misc_1.0.1.bb
 delete mode 100644 recipes/xorg-font/font-misc-cyrillic_1.0.1.bb
 delete mode 100644 recipes/xorg-font/font-misc-ethiopic_1.0.1.bb
 delete mode 100644 recipes/xorg-font/font-misc-meltho_1.0.1.bb
 delete mode 100644 recipes/xorg-font/font-misc-misc_1.1.0.bb
 delete mode 100644 recipes/xorg-font/font-mutt-misc_1.0.1.bb
 delete mode 100644 recipes/xorg-font/font-mutt-misc_1.0.2.bb
 delete mode 100644 recipes/xorg-font/font-schumacher-misc_1.1.0.bb
 delete mode 100644 recipes/xorg-font/font-screen-cyrillic_1.0.2.bb
 delete mode 100644 recipes/xorg-font/font-sony-misc_1.0.1.bb
 delete mode 100644 recipes/xorg-font/font-sun-misc_1.0.1.bb
 delete mode 100644 recipes/xorg-font/font-util_1.1.1.bb
 delete mode 100644 recipes/xorg-font/font-winitzki-cyrillic_1.0.1.bb
 delete mode 100644 recipes/xorg-font/font-xfree86-type1_1.0.2.bb

diff --git a/recipes/obsolete/xorg-font/encodings_1.0.3.bb b/recipes/obsolete/xorg-font/encodings_1.0.3.bb
new file mode 100644
index 0000000..bc95836
--- /dev/null
+++ b/recipes/obsolete/xorg-font/encodings_1.0.3.bb
@@ -0,0 +1,8 @@
+require xorg-font-common.inc
+PE = "1"
+PR = "${INC_PR}.1"
+
+DEPENDS = "mkfontscale-native font-util-native font-util"
+
+SRC_URI[archive.md5sum] = "29637480e7ce12546668631067c19ced"
+SRC_URI[archive.sha256sum] = "07d9766d4aebe05ac572599f8f903a4fe06ab667a8182f2b6cc03e5fb3b80f53"
diff --git a/recipes/obsolete/xorg-font/font-adobe-100dpi_1.0.1.bb b/recipes/obsolete/xorg-font/font-adobe-100dpi_1.0.1.bb
new file mode 100644
index 0000000..901ebcf
--- /dev/null
+++ b/recipes/obsolete/xorg-font/font-adobe-100dpi_1.0.1.bb
@@ -0,0 +1,6 @@
+require xorg-font-common.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "c754c3f4a5e08442bf6972b9466625ed"
+SRC_URI[archive.sha256sum] = "a742bca8d6f8fb76b511f11c2ad2a1d326687fe9f0490a9cf64524c3782cb52c"
diff --git a/recipes/obsolete/xorg-font/font-adobe-75dpi_1.0.1.bb b/recipes/obsolete/xorg-font/font-adobe-75dpi_1.0.1.bb
new file mode 100644
index 0000000..e347e3f
--- /dev/null
+++ b/recipes/obsolete/xorg-font/font-adobe-75dpi_1.0.1.bb
@@ -0,0 +1,6 @@
+require xorg-font-common.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "a47681c97bd012196691c95e34d400f1"
+SRC_URI[archive.sha256sum] = "4de51765d26b70728a8b6573be89d731be0384466290dbbb216cb05becdf9f71"
diff --git a/recipes/obsolete/xorg-font/font-adobe-utopia-100dpi_1.0.2.bb b/recipes/obsolete/xorg-font/font-adobe-utopia-100dpi_1.0.2.bb
new file mode 100644
index 0000000..2a6ee0a
--- /dev/null
+++ b/recipes/obsolete/xorg-font/font-adobe-utopia-100dpi_1.0.2.bb
@@ -0,0 +1,9 @@
+require xorg-font-common.inc
+
+DESCRIPTION = "Adobe typeface software"
+
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "1c3a2c26bd3f6e406fbadc7380efa369"
+SRC_URI[archive.sha256sum] = "dd8c3f5509589f9232b26273fecde2694bd2bb069c6aaa8f504ad3d24775955e"
diff --git a/recipes/obsolete/xorg-font/font-adobe-utopia-75dpi_1.0.2.bb b/recipes/obsolete/xorg-font/font-adobe-utopia-75dpi_1.0.2.bb
new file mode 100644
index 0000000..19a6aac
--- /dev/null
+++ b/recipes/obsolete/xorg-font/font-adobe-utopia-75dpi_1.0.2.bb
@@ -0,0 +1,9 @@
+require xorg-font-common.inc
+
+DESCRIPTION = "Adobe typeface software"
+
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "71dffebeeb702d10876555c361fb69cf"
+SRC_URI[archive.sha256sum] = "3b3ca4ba5b5b73e13b3662b5be16ea92a244adb3303a3625437ff7d385ba6557"
diff --git a/recipes/obsolete/xorg-font/font-adobe-utopia-type1_1.0.2.bb b/recipes/obsolete/xorg-font/font-adobe-utopia-type1_1.0.2.bb
new file mode 100644
index 0000000..6d544a6
--- /dev/null
+++ b/recipes/obsolete/xorg-font/font-adobe-utopia-type1_1.0.2.bb
@@ -0,0 +1,9 @@
+require xorg-font-common.inc
+
+DESCRIPTION = "Adobe typeface software"
+
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "ad945b19b2db64dec3a19507848ff63b"
+SRC_URI[archive.sha256sum] = "8c5f2752e44af6219c1b4cfc178f9721f6dd573039e973f61029136c2756e233"
diff --git a/recipes/obsolete/xorg-font/font-alias_1.0.2.bb b/recipes/obsolete/xorg-font/font-alias_1.0.2.bb
new file mode 100644
index 0000000..1576ad7
--- /dev/null
+++ b/recipes/obsolete/xorg-font/font-alias_1.0.2.bb
@@ -0,0 +1,12 @@
+require xorg-font-common.inc
+
+DESCRIPTION = "X font aliases."
+
+DEPENDS = "virtual/xserver font-util"
+RDEPENDS_${PN} = "encodings font-util"
+
+PE = "1"
+PR = "${INC_PR}.1"
+
+SRC_URI[archive.md5sum] = "9d40dba6fb8cb58dacb433fc7bcaafca"
+SRC_URI[archive.sha256sum] = "438bd6f3f9305edb6ea9905dc92c135d6067bbd7e01df913cb3ef27162b38270"
diff --git a/recipes/obsolete/xorg-font/font-arabic-misc_1.0.1.bb b/recipes/obsolete/xorg-font/font-arabic-misc_1.0.1.bb
new file mode 100644
index 0000000..65578ea
--- /dev/null
+++ b/recipes/obsolete/xorg-font/font-arabic-misc_1.0.1.bb
@@ -0,0 +1,10 @@
+require xorg-font-common.inc
+
+DESCRIPTION = "100dpi, 24 point (approximately) font to minimally support (almost) all \
+of the Arabic characters available in Unicode."
+
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "817ceb99636c873ad7679fe2a468678d"
+SRC_URI[archive.sha256sum] = "f4b0305afd47844d337a87d03aab4359b576dc36464317f86541324ee6ea6f60"
diff --git a/recipes/obsolete/xorg-font/font-bh-100dpi_1.0.1.bb b/recipes/obsolete/xorg-font/font-bh-100dpi_1.0.1.bb
new file mode 100644
index 0000000..d1a27df
--- /dev/null
+++ b/recipes/obsolete/xorg-font/font-bh-100dpi_1.0.1.bb
@@ -0,0 +1,7 @@
+require xorg-font-common.inc
+
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "8af580b87e17ddacdf0ce3d775248387"
+SRC_URI[archive.sha256sum] = "c46d68487b09993266f34ac87a47e035af8a3f42c38f33d26ff18ac0c31c3397"
diff --git a/recipes/obsolete/xorg-font/font-bh-75dpi_1.0.1.bb b/recipes/obsolete/xorg-font/font-bh-75dpi_1.0.1.bb
new file mode 100644
index 0000000..a03f449
--- /dev/null
+++ b/recipes/obsolete/xorg-font/font-bh-75dpi_1.0.1.bb
@@ -0,0 +1,7 @@
+require xorg-font-common.inc
+
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "53785d2688392aec5cba79fc0ddb23a2"
+SRC_URI[archive.sha256sum] = "8a3175a977f169f0882054ac5bf86c97bfee1dc031415092f75b2cfb57b69d40"
diff --git a/recipes/obsolete/xorg-font/font-bh-lucidatypewriter-100dpi_1.0.1.bb b/recipes/obsolete/xorg-font/font-bh-lucidatypewriter-100dpi_1.0.1.bb
new file mode 100644
index 0000000..5dc7774
--- /dev/null
+++ b/recipes/obsolete/xorg-font/font-bh-lucidatypewriter-100dpi_1.0.1.bb
@@ -0,0 +1,7 @@
+require xorg-font-common.inc
+
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "a2b3951dbc6ddb2e4c7e09519dd13333"
+SRC_URI[archive.sha256sum] = "8156f7c4e5a3fbd478c287154c7e3c55c6631c148a7b185f604753d118018da9"
diff --git a/recipes/obsolete/xorg-font/font-bh-lucidatypewriter-75dpi_1.0.1.bb b/recipes/obsolete/xorg-font/font-bh-lucidatypewriter-75dpi_1.0.1.bb
new file mode 100644
index 0000000..02352aa
--- /dev/null
+++ b/recipes/obsolete/xorg-font/font-bh-lucidatypewriter-75dpi_1.0.1.bb
@@ -0,0 +1,7 @@
+require xorg-font-common.inc
+
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "6397062f2b346ce5bbe5472f3353a9a9"
+SRC_URI[archive.sha256sum] = "20ff9c5914c6916c96647eeb3ba700468952fdf01925e62516219a7dd6eb3841"
diff --git a/recipes/obsolete/xorg-font/font-bh-ttf_1.0.1.bb b/recipes/obsolete/xorg-font/font-bh-ttf_1.0.1.bb
new file mode 100644
index 0000000..18e03b2
--- /dev/null
+++ b/recipes/obsolete/xorg-font/font-bh-ttf_1.0.1.bb
@@ -0,0 +1,7 @@
+require xorg-font-common.inc
+
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "664df71cb510b744b4a10e778445c37b"
+SRC_URI[archive.sha256sum] = "1ce72f84a6c4df7f0e949f915346026ebfeaa5b2e47f7bbc29117ebbf3a7a7c8"
diff --git a/recipes/obsolete/xorg-font/font-bh-type1_1.0.1.bb b/recipes/obsolete/xorg-font/font-bh-type1_1.0.1.bb
new file mode 100644
index 0000000..117a7e5
--- /dev/null
+++ b/recipes/obsolete/xorg-font/font-bh-type1_1.0.1.bb
@@ -0,0 +1,7 @@
+require xorg-font-common.inc
+
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "374d954c61363206c93d1ce7e9445c31"
+SRC_URI[archive.sha256sum] = "da3b5f26c6cde0baf3831f50c79a7a107806f885e0205073855bfbc5a357bb45"
diff --git a/recipes/obsolete/xorg-font/font-bitstream-100dpi_1.0.1.bb b/recipes/obsolete/xorg-font/font-bitstream-100dpi_1.0.1.bb
new file mode 100644
index 0000000..f14c12f
--- /dev/null
+++ b/recipes/obsolete/xorg-font/font-bitstream-100dpi_1.0.1.bb
@@ -0,0 +1,7 @@
+require xorg-font-common.inc
+
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "3b8748f8029c53595e4a4a1b23fa790a"
+SRC_URI[archive.sha256sum] = "3e05c9b74d0dc00e6e46ec758888e66514ab24fc75930877d4ba6db7d49f0347"
diff --git a/recipes/obsolete/xorg-font/font-bitstream-75dpi_1.0.1.bb b/recipes/obsolete/xorg-font/font-bitstream-75dpi_1.0.1.bb
new file mode 100644
index 0000000..337b186
--- /dev/null
+++ b/recipes/obsolete/xorg-font/font-bitstream-75dpi_1.0.1.bb
@@ -0,0 +1,7 @@
+require xorg-font-common.inc
+
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "aed54fb53d2d24aff10c92985286d1e5"
+SRC_URI[archive.sha256sum] = "cf9e1cb1c21517a566e5678791778d40c7c915d792bd29d319928f4e4234662b"
diff --git a/recipes/obsolete/xorg-font/font-bitstream-speedo_1.0.1.bb b/recipes/obsolete/xorg-font/font-bitstream-speedo_1.0.1.bb
new file mode 100644
index 0000000..263779e
--- /dev/null
+++ b/recipes/obsolete/xorg-font/font-bitstream-speedo_1.0.1.bb
@@ -0,0 +1,7 @@
+require xorg-font-common.inc
+
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "5b1856a24b1b46414950febc63880307"
+SRC_URI[archive.sha256sum] = "3d231566856c754f48f568f41c15376730d45d9c3ffd37e1d2476097519f22b8"
diff --git a/recipes/obsolete/xorg-font/font-bitstream-type1_1.0.1.bb b/recipes/obsolete/xorg-font/font-bitstream-type1_1.0.1.bb
new file mode 100644
index 0000000..f58b0ae
--- /dev/null
+++ b/recipes/obsolete/xorg-font/font-bitstream-type1_1.0.1.bb
@@ -0,0 +1,7 @@
+require xorg-font-common.inc
+
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "a4e8e229a051c0ede9eb525e4006d93a"
+SRC_URI[archive.sha256sum] = "51027cc1d49140153620c1a2b653f1773fe92cb694b221396d68265343e113ab"
diff --git a/recipes/obsolete/xorg-font/font-cronyx-cyrillic_1.0.1.bb b/recipes/obsolete/xorg-font/font-cronyx-cyrillic_1.0.1.bb
new file mode 100644
index 0000000..7467d8a
--- /dev/null
+++ b/recipes/obsolete/xorg-font/font-cronyx-cyrillic_1.0.1.bb
@@ -0,0 +1,7 @@
+require xorg-font-common.inc
+
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "15f86f5e572df21218617982eb4b3bfc"
+SRC_URI[archive.sha256sum] = "f7b43a428afe3111513e8ff0ebccc00fbddf2b57cec261ad9017d582fc9a3422"
diff --git a/recipes/obsolete/xorg-font/font-cursor-misc_1.0.1.bb b/recipes/obsolete/xorg-font/font-cursor-misc_1.0.1.bb
new file mode 100644
index 0000000..e60a76e
--- /dev/null
+++ b/recipes/obsolete/xorg-font/font-cursor-misc_1.0.1.bb
@@ -0,0 +1,7 @@
+require xorg-font-common.inc
+
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "13c21c4d74155c662152a1a74f249d96"
+SRC_URI[archive.sha256sum] = "deee02861beaa335448e9aba4320c88c30a174bc3dcfb05a434b4ddb137dc1b3"
diff --git a/recipes/obsolete/xorg-font/font-daewoo-misc_1.0.1.bb b/recipes/obsolete/xorg-font/font-daewoo-misc_1.0.1.bb
new file mode 100644
index 0000000..3f77bd1
--- /dev/null
+++ b/recipes/obsolete/xorg-font/font-daewoo-misc_1.0.1.bb
@@ -0,0 +1,7 @@
+require xorg-font-common.inc
+
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "05597e2b193a7b7de2ca525468276b1d"
+SRC_URI[archive.sha256sum] = "e2283e4280c66fec7c986f0b4a476811f3419b9517280cd8b59a01563de6e491"
diff --git a/recipes/obsolete/xorg-font/font-dec-misc_1.0.1.bb b/recipes/obsolete/xorg-font/font-dec-misc_1.0.1.bb
new file mode 100644
index 0000000..29abff6
--- /dev/null
+++ b/recipes/obsolete/xorg-font/font-dec-misc_1.0.1.bb
@@ -0,0 +1,7 @@
+require xorg-font-common.inc
+
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "05714516824c680ce747c6ef9d2fbbdd"
+SRC_URI[archive.sha256sum] = "fb20da4afddc07e236e830939de0fdfc9a93c5c1c7048fafe669fac19b496552"
diff --git a/recipes/obsolete/xorg-font/font-ibm-type1_1.0.1.bb b/recipes/obsolete/xorg-font/font-ibm-type1_1.0.1.bb
new file mode 100644
index 0000000..ab7113a
--- /dev/null
+++ b/recipes/obsolete/xorg-font/font-ibm-type1_1.0.1.bb
@@ -0,0 +1,7 @@
+require xorg-font-common.inc
+
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "1646179ff224b3e2c9b1e7f59042897f"
+SRC_URI[archive.sha256sum] = "887ea895cc0fdd5c50d4960aee7cb6ed813cf90f53b53ce0e0e068dd606cc919"
diff --git a/recipes/obsolete/xorg-font/font-isas-misc_1.0.1.bb b/recipes/obsolete/xorg-font/font-isas-misc_1.0.1.bb
new file mode 100644
index 0000000..e65e169
--- /dev/null
+++ b/recipes/obsolete/xorg-font/font-isas-misc_1.0.1.bb
@@ -0,0 +1,7 @@
+require xorg-font-common.inc
+
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "88b5b32c5a27576e9d00675bcc966806"
+SRC_URI[archive.sha256sum] = "52fe0469eb91e94dc7a0e8164e947fee439f398b0eb63c210f682524f12cea7b"
diff --git a/recipes/obsolete/xorg-font/font-jis-misc_1.0.1.bb b/recipes/obsolete/xorg-font/font-jis-misc_1.0.1.bb
new file mode 100644
index 0000000..f521e78
--- /dev/null
+++ b/recipes/obsolete/xorg-font/font-jis-misc_1.0.1.bb
@@ -0,0 +1,7 @@
+require xorg-font-common.inc
+
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "5835c99d056f4a29d7d6a5ae873cf00e"
+SRC_URI[archive.sha256sum] = "a63b98c204395b61949214db199c38094489336731d4a4179eb053a5bb54e8cf"
diff --git a/recipes/obsolete/xorg-font/font-micro-misc_1.0.1.bb b/recipes/obsolete/xorg-font/font-micro-misc_1.0.1.bb
new file mode 100644
index 0000000..21fe0c7
--- /dev/null
+++ b/recipes/obsolete/xorg-font/font-micro-misc_1.0.1.bb
@@ -0,0 +1,9 @@
+require xorg-font-common.inc
+
+PE = "1"
+PR = "${INC_PR}.0"
+
+EXTRA_OECONF = "--disable-iso8859-2 --disable-iso8859-3 --disable-iso8859-4 --disable-iso8859-5 --disable-iso8859-6 --disable-iso8859-7 --disable-iso8859-8 --disable-iso8859-9 --disable-iso8859-10 --disable-iso8859-11 --disable-iso8859-12 --disable-iso8859-13 --disable-iso8859-14 --disable-iso8859-15 --disable-iso8859-16 --disable-jisx0201 --disable-koi8-r"
+
+SRC_URI[archive.md5sum] = "6350117efebe340f33e818f4a33e4e4b"
+SRC_URI[archive.sha256sum] = "a5b987ea38bf53f63968a6cad1c052ca6d0fc678d9409c1953701f0159e4972b"
diff --git a/recipes/obsolete/xorg-font/font-misc-cyrillic_1.0.1.bb b/recipes/obsolete/xorg-font/font-misc-cyrillic_1.0.1.bb
new file mode 100644
index 0000000..1a749b1
--- /dev/null
+++ b/recipes/obsolete/xorg-font/font-misc-cyrillic_1.0.1.bb
@@ -0,0 +1,7 @@
+require xorg-font-common.inc
+
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "c79d7921d95b2c4f10fad464bb121090"
+SRC_URI[archive.sha256sum] = "dafafbfd93d95820449972fd86ec312266eb73e5297966ee6e0163d294d8af75"
diff --git a/recipes/obsolete/xorg-font/font-misc-ethiopic_1.0.1.bb b/recipes/obsolete/xorg-font/font-misc-ethiopic_1.0.1.bb
new file mode 100644
index 0000000..5b37d40
--- /dev/null
+++ b/recipes/obsolete/xorg-font/font-misc-ethiopic_1.0.1.bb
@@ -0,0 +1,6 @@
+require xorg-font-common.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "4c88c79b8e5d47af90b21e948d42755f"
+SRC_URI[archive.sha256sum] = "bf3b3a994b6c4047b2d79f590e7113ed429b8b7a83992cb753a83e6e8bd3d948"
diff --git a/recipes/obsolete/xorg-font/font-misc-meltho_1.0.1.bb b/recipes/obsolete/xorg-font/font-misc-meltho_1.0.1.bb
new file mode 100644
index 0000000..eb1fdc8
--- /dev/null
+++ b/recipes/obsolete/xorg-font/font-misc-meltho_1.0.1.bb
@@ -0,0 +1,8 @@
+require xorg-font-common.inc
+
+DESCRIPTION = "These fonts are designed for the display of Syriac text."
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "345f1a78312e30cd2c41d24ea3f3276f"
+SRC_URI[archive.sha256sum] = "5366d7a0f38a189e504676a9cddd8430113f9957919f0a3dc181bcaaaed92618"
diff --git a/recipes/obsolete/xorg-font/font-misc-misc_1.1.0.bb b/recipes/obsolete/xorg-font/font-misc-misc_1.1.0.bb
new file mode 100644
index 0000000..0b58192
--- /dev/null
+++ b/recipes/obsolete/xorg-font/font-misc-misc_1.1.0.bb
@@ -0,0 +1,6 @@
+require xorg-font-common.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "878bfd4e9f14c1279cea3a8392e0dbdd"
+SRC_URI[archive.sha256sum] = "50f7528ab94f319a11efcd555dd5a7120191a42cf892c87cd6bdea8b908d497b"
diff --git a/recipes/obsolete/xorg-font/font-mutt-misc_1.0.1.bb b/recipes/obsolete/xorg-font/font-mutt-misc_1.0.1.bb
new file mode 100644
index 0000000..9f65df8
--- /dev/null
+++ b/recipes/obsolete/xorg-font/font-mutt-misc_1.0.1.bb
@@ -0,0 +1,10 @@
+require xorg-font-common.inc
+
+DESCRIPTION = "Provides a 12pt, 100dpi proportional font with many of \
+the glyphs needed for Unicode text."
+
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "aab7ac62b960e77aa11d032bafe1d460"
+SRC_URI[archive.sha256sum] = "77bf33cbf5d1849bef4e516698eb45b7d16263a84dcc2299fd61383501906e25"
diff --git a/recipes/obsolete/xorg-font/font-mutt-misc_1.0.2.bb b/recipes/obsolete/xorg-font/font-mutt-misc_1.0.2.bb
new file mode 100644
index 0000000..0b7e4a8
--- /dev/null
+++ b/recipes/obsolete/xorg-font/font-mutt-misc_1.0.2.bb
@@ -0,0 +1,10 @@
+require xorg-font-common.inc
+
+DESCRIPTION = "Provides a 12pt, 100dpi proportional font with many of \
+the glyphs needed for Unicode text."
+
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "8296972a99f96600d435d157fccc1501"
+SRC_URI[archive.sha256sum] = "6fc514969b44dc23392d2d1deb6de92c10357ef8d0498a182576467cf5032dc4"
diff --git a/recipes/obsolete/xorg-font/font-schumacher-misc_1.1.0.bb b/recipes/obsolete/xorg-font/font-schumacher-misc_1.1.0.bb
new file mode 100644
index 0000000..1a06bae
--- /dev/null
+++ b/recipes/obsolete/xorg-font/font-schumacher-misc_1.1.0.bb
@@ -0,0 +1,6 @@
+require xorg-font-common.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "86f4b7d8b11a2e6da70884c59b5866a3"
+SRC_URI[archive.sha256sum] = "3003915fb53930fee5e6086ee7546ea0857ef0fc2311aaf84ed937b1b4de1b4d"
diff --git a/recipes/obsolete/xorg-font/font-screen-cyrillic_1.0.2.bb b/recipes/obsolete/xorg-font/font-screen-cyrillic_1.0.2.bb
new file mode 100644
index 0000000..6e0adf7
--- /dev/null
+++ b/recipes/obsolete/xorg-font/font-screen-cyrillic_1.0.2.bb
@@ -0,0 +1,6 @@
+require xorg-font-common.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "c912a976b66073acd80c9d5c624f3aae"
+SRC_URI[archive.sha256sum] = "c5dd881fb13ff16d358acb27f99f6c281415d3824beb342f3a02603f0efebe11"
diff --git a/recipes/obsolete/xorg-font/font-sony-misc_1.0.1.bb b/recipes/obsolete/xorg-font/font-sony-misc_1.0.1.bb
new file mode 100644
index 0000000..9b418fe
--- /dev/null
+++ b/recipes/obsolete/xorg-font/font-sony-misc_1.0.1.bb
@@ -0,0 +1,6 @@
+require xorg-font-common.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "7b6f5117814599b86ed3470de6c62aa3"
+SRC_URI[archive.sha256sum] = "da9526844c74ce395d3912d3d8f538cd57102d6bcd9f73fd0a5dccf53bfc56ca"
diff --git a/recipes/obsolete/xorg-font/font-sun-misc_1.0.1.bb b/recipes/obsolete/xorg-font/font-sun-misc_1.0.1.bb
new file mode 100644
index 0000000..9a607d9
--- /dev/null
+++ b/recipes/obsolete/xorg-font/font-sun-misc_1.0.1.bb
@@ -0,0 +1,6 @@
+require xorg-font-common.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "5a185c5549a650bf062d343e128682ca"
+SRC_URI[archive.sha256sum] = "411522f5ea8f951a7432ab946a92f524493e3a1a6e1ca3c48f09c46cb5ae9d09"
diff --git a/recipes/obsolete/xorg-font/font-util_1.1.1.bb b/recipes/obsolete/xorg-font/font-util_1.1.1.bb
new file mode 100644
index 0000000..01fa5a9
--- /dev/null
+++ b/recipes/obsolete/xorg-font/font-util_1.1.1.bb
@@ -0,0 +1,19 @@
+require xorg-font-common.inc
+
+PACKAGE_ARCH = "${BASE_PACKAGE_ARCH}"
+
+DESCRIPTION = "X font utils."
+
+DEPENDS = "util-macros"
+RDEPENDS_${PN} = "mkfontdir mkfontscale encodings"
+BBCLASSEXTEND = "native"
+
+PE = "1"
+PR = "${INC_PR}.3"
+
+do_configure_prepend() {
+        sed -i "s#MAPFILES_PATH=\`pkg-config#MAPFILES_PATH=\`PKG_CONFIG_PATH=\"${STAGING_LIBDIR_NATIVE}/pkg-config\" pkg-config#g" fontutil.m4.in
+}
+
+SRC_URI[archive.md5sum] = "5c735ae6916b65186f3c876d76c27ce3"
+SRC_URI[archive.sha256sum] = "a33f1e3b0d7c3fd7c3505ce68888fec3cf897353084187d96e1e821fe3c02f88"
diff --git a/recipes/obsolete/xorg-font/font-winitzki-cyrillic_1.0.1.bb b/recipes/obsolete/xorg-font/font-winitzki-cyrillic_1.0.1.bb
new file mode 100644
index 0000000..4f9ff49
--- /dev/null
+++ b/recipes/obsolete/xorg-font/font-winitzki-cyrillic_1.0.1.bb
@@ -0,0 +1,7 @@
+require xorg-font-common.inc
+
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "92bf4ecb373faac545cef2dcbe40be35"
+SRC_URI[archive.sha256sum] = "7c57c29f70db18e543a3eb8f785b6b5d1372b78eee27707dbb10359d8ddb1446"
diff --git a/recipes/obsolete/xorg-font/font-xfree86-type1_1.0.2.bb b/recipes/obsolete/xorg-font/font-xfree86-type1_1.0.2.bb
new file mode 100644
index 0000000..8b9aa0d
--- /dev/null
+++ b/recipes/obsolete/xorg-font/font-xfree86-type1_1.0.2.bb
@@ -0,0 +1,7 @@
+require xorg-font-common.inc
+
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "a966f5a8aade9e63af86d8a6bf3e8586"
+SRC_URI[archive.sha256sum] = "7a026aeaafe5a619b2c1b35cd361125b169b2212eaf0f2f5ce796038b1cf06cd"
diff --git a/recipes/xorg-font/encodings_1.0.3.bb b/recipes/xorg-font/encodings_1.0.3.bb
deleted file mode 100644
index bc95836..0000000
--- a/recipes/xorg-font/encodings_1.0.3.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-font-common.inc
-PE = "1"
-PR = "${INC_PR}.1"
-
-DEPENDS = "mkfontscale-native font-util-native font-util"
-
-SRC_URI[archive.md5sum] = "29637480e7ce12546668631067c19ced"
-SRC_URI[archive.sha256sum] = "07d9766d4aebe05ac572599f8f903a4fe06ab667a8182f2b6cc03e5fb3b80f53"
diff --git a/recipes/xorg-font/font-adobe-100dpi_1.0.1.bb b/recipes/xorg-font/font-adobe-100dpi_1.0.1.bb
deleted file mode 100644
index 901ebcf..0000000
--- a/recipes/xorg-font/font-adobe-100dpi_1.0.1.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require xorg-font-common.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "c754c3f4a5e08442bf6972b9466625ed"
-SRC_URI[archive.sha256sum] = "a742bca8d6f8fb76b511f11c2ad2a1d326687fe9f0490a9cf64524c3782cb52c"
diff --git a/recipes/xorg-font/font-adobe-75dpi_1.0.1.bb b/recipes/xorg-font/font-adobe-75dpi_1.0.1.bb
deleted file mode 100644
index e347e3f..0000000
--- a/recipes/xorg-font/font-adobe-75dpi_1.0.1.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require xorg-font-common.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "a47681c97bd012196691c95e34d400f1"
-SRC_URI[archive.sha256sum] = "4de51765d26b70728a8b6573be89d731be0384466290dbbb216cb05becdf9f71"
diff --git a/recipes/xorg-font/font-adobe-utopia-100dpi_1.0.2.bb b/recipes/xorg-font/font-adobe-utopia-100dpi_1.0.2.bb
deleted file mode 100644
index 2a6ee0a..0000000
--- a/recipes/xorg-font/font-adobe-utopia-100dpi_1.0.2.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require xorg-font-common.inc
-
-DESCRIPTION = "Adobe typeface software"
-
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "1c3a2c26bd3f6e406fbadc7380efa369"
-SRC_URI[archive.sha256sum] = "dd8c3f5509589f9232b26273fecde2694bd2bb069c6aaa8f504ad3d24775955e"
diff --git a/recipes/xorg-font/font-adobe-utopia-75dpi_1.0.2.bb b/recipes/xorg-font/font-adobe-utopia-75dpi_1.0.2.bb
deleted file mode 100644
index 19a6aac..0000000
--- a/recipes/xorg-font/font-adobe-utopia-75dpi_1.0.2.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require xorg-font-common.inc
-
-DESCRIPTION = "Adobe typeface software"
-
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "71dffebeeb702d10876555c361fb69cf"
-SRC_URI[archive.sha256sum] = "3b3ca4ba5b5b73e13b3662b5be16ea92a244adb3303a3625437ff7d385ba6557"
diff --git a/recipes/xorg-font/font-adobe-utopia-type1_1.0.2.bb b/recipes/xorg-font/font-adobe-utopia-type1_1.0.2.bb
deleted file mode 100644
index 6d544a6..0000000
--- a/recipes/xorg-font/font-adobe-utopia-type1_1.0.2.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require xorg-font-common.inc
-
-DESCRIPTION = "Adobe typeface software"
-
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "ad945b19b2db64dec3a19507848ff63b"
-SRC_URI[archive.sha256sum] = "8c5f2752e44af6219c1b4cfc178f9721f6dd573039e973f61029136c2756e233"
diff --git a/recipes/xorg-font/font-alias_1.0.2.bb b/recipes/xorg-font/font-alias_1.0.2.bb
deleted file mode 100644
index 1576ad7..0000000
--- a/recipes/xorg-font/font-alias_1.0.2.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-require xorg-font-common.inc
-
-DESCRIPTION = "X font aliases."
-
-DEPENDS = "virtual/xserver font-util"
-RDEPENDS_${PN} = "encodings font-util"
-
-PE = "1"
-PR = "${INC_PR}.1"
-
-SRC_URI[archive.md5sum] = "9d40dba6fb8cb58dacb433fc7bcaafca"
-SRC_URI[archive.sha256sum] = "438bd6f3f9305edb6ea9905dc92c135d6067bbd7e01df913cb3ef27162b38270"
diff --git a/recipes/xorg-font/font-arabic-misc_1.0.1.bb b/recipes/xorg-font/font-arabic-misc_1.0.1.bb
deleted file mode 100644
index 65578ea..0000000
--- a/recipes/xorg-font/font-arabic-misc_1.0.1.bb
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
-SRC_URI[archive.md5sum] = "817ceb99636c873ad7679fe2a468678d"
-SRC_URI[archive.sha256sum] = "f4b0305afd47844d337a87d03aab4359b576dc36464317f86541324ee6ea6f60"
diff --git a/recipes/xorg-font/font-bh-100dpi_1.0.1.bb b/recipes/xorg-font/font-bh-100dpi_1.0.1.bb
deleted file mode 100644
index d1a27df..0000000
--- a/recipes/xorg-font/font-bh-100dpi_1.0.1.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-font-common.inc
-
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "8af580b87e17ddacdf0ce3d775248387"
-SRC_URI[archive.sha256sum] = "c46d68487b09993266f34ac87a47e035af8a3f42c38f33d26ff18ac0c31c3397"
diff --git a/recipes/xorg-font/font-bh-75dpi_1.0.1.bb b/recipes/xorg-font/font-bh-75dpi_1.0.1.bb
deleted file mode 100644
index a03f449..0000000
--- a/recipes/xorg-font/font-bh-75dpi_1.0.1.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-font-common.inc
-
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "53785d2688392aec5cba79fc0ddb23a2"
-SRC_URI[archive.sha256sum] = "8a3175a977f169f0882054ac5bf86c97bfee1dc031415092f75b2cfb57b69d40"
diff --git a/recipes/xorg-font/font-bh-lucidatypewriter-100dpi_1.0.1.bb b/recipes/xorg-font/font-bh-lucidatypewriter-100dpi_1.0.1.bb
deleted file mode 100644
index 5dc7774..0000000
--- a/recipes/xorg-font/font-bh-lucidatypewriter-100dpi_1.0.1.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-font-common.inc
-
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "a2b3951dbc6ddb2e4c7e09519dd13333"
-SRC_URI[archive.sha256sum] = "8156f7c4e5a3fbd478c287154c7e3c55c6631c148a7b185f604753d118018da9"
diff --git a/recipes/xorg-font/font-bh-lucidatypewriter-75dpi_1.0.1.bb b/recipes/xorg-font/font-bh-lucidatypewriter-75dpi_1.0.1.bb
deleted file mode 100644
index 02352aa..0000000
--- a/recipes/xorg-font/font-bh-lucidatypewriter-75dpi_1.0.1.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-font-common.inc
-
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "6397062f2b346ce5bbe5472f3353a9a9"
-SRC_URI[archive.sha256sum] = "20ff9c5914c6916c96647eeb3ba700468952fdf01925e62516219a7dd6eb3841"
diff --git a/recipes/xorg-font/font-bh-ttf_1.0.1.bb b/recipes/xorg-font/font-bh-ttf_1.0.1.bb
deleted file mode 100644
index 18e03b2..0000000
--- a/recipes/xorg-font/font-bh-ttf_1.0.1.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-font-common.inc
-
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "664df71cb510b744b4a10e778445c37b"
-SRC_URI[archive.sha256sum] = "1ce72f84a6c4df7f0e949f915346026ebfeaa5b2e47f7bbc29117ebbf3a7a7c8"
diff --git a/recipes/xorg-font/font-bh-type1_1.0.1.bb b/recipes/xorg-font/font-bh-type1_1.0.1.bb
deleted file mode 100644
index 117a7e5..0000000
--- a/recipes/xorg-font/font-bh-type1_1.0.1.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-font-common.inc
-
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "374d954c61363206c93d1ce7e9445c31"
-SRC_URI[archive.sha256sum] = "da3b5f26c6cde0baf3831f50c79a7a107806f885e0205073855bfbc5a357bb45"
diff --git a/recipes/xorg-font/font-bitstream-100dpi_1.0.1.bb b/recipes/xorg-font/font-bitstream-100dpi_1.0.1.bb
deleted file mode 100644
index f14c12f..0000000
--- a/recipes/xorg-font/font-bitstream-100dpi_1.0.1.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-font-common.inc
-
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "3b8748f8029c53595e4a4a1b23fa790a"
-SRC_URI[archive.sha256sum] = "3e05c9b74d0dc00e6e46ec758888e66514ab24fc75930877d4ba6db7d49f0347"
diff --git a/recipes/xorg-font/font-bitstream-75dpi_1.0.1.bb b/recipes/xorg-font/font-bitstream-75dpi_1.0.1.bb
deleted file mode 100644
index 337b186..0000000
--- a/recipes/xorg-font/font-bitstream-75dpi_1.0.1.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-font-common.inc
-
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "aed54fb53d2d24aff10c92985286d1e5"
-SRC_URI[archive.sha256sum] = "cf9e1cb1c21517a566e5678791778d40c7c915d792bd29d319928f4e4234662b"
diff --git a/recipes/xorg-font/font-bitstream-speedo_1.0.1.bb b/recipes/xorg-font/font-bitstream-speedo_1.0.1.bb
deleted file mode 100644
index 263779e..0000000
--- a/recipes/xorg-font/font-bitstream-speedo_1.0.1.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-font-common.inc
-
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "5b1856a24b1b46414950febc63880307"
-SRC_URI[archive.sha256sum] = "3d231566856c754f48f568f41c15376730d45d9c3ffd37e1d2476097519f22b8"
diff --git a/recipes/xorg-font/font-bitstream-type1_1.0.1.bb b/recipes/xorg-font/font-bitstream-type1_1.0.1.bb
deleted file mode 100644
index f58b0ae..0000000
--- a/recipes/xorg-font/font-bitstream-type1_1.0.1.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-font-common.inc
-
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "a4e8e229a051c0ede9eb525e4006d93a"
-SRC_URI[archive.sha256sum] = "51027cc1d49140153620c1a2b653f1773fe92cb694b221396d68265343e113ab"
diff --git a/recipes/xorg-font/font-cronyx-cyrillic_1.0.1.bb b/recipes/xorg-font/font-cronyx-cyrillic_1.0.1.bb
deleted file mode 100644
index 7467d8a..0000000
--- a/recipes/xorg-font/font-cronyx-cyrillic_1.0.1.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-font-common.inc
-
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "15f86f5e572df21218617982eb4b3bfc"
-SRC_URI[archive.sha256sum] = "f7b43a428afe3111513e8ff0ebccc00fbddf2b57cec261ad9017d582fc9a3422"
diff --git a/recipes/xorg-font/font-cursor-misc_1.0.1.bb b/recipes/xorg-font/font-cursor-misc_1.0.1.bb
deleted file mode 100644
index e60a76e..0000000
--- a/recipes/xorg-font/font-cursor-misc_1.0.1.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-font-common.inc
-
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "13c21c4d74155c662152a1a74f249d96"
-SRC_URI[archive.sha256sum] = "deee02861beaa335448e9aba4320c88c30a174bc3dcfb05a434b4ddb137dc1b3"
diff --git a/recipes/xorg-font/font-daewoo-misc_1.0.1.bb b/recipes/xorg-font/font-daewoo-misc_1.0.1.bb
deleted file mode 100644
index 3f77bd1..0000000
--- a/recipes/xorg-font/font-daewoo-misc_1.0.1.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-font-common.inc
-
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "05597e2b193a7b7de2ca525468276b1d"
-SRC_URI[archive.sha256sum] = "e2283e4280c66fec7c986f0b4a476811f3419b9517280cd8b59a01563de6e491"
diff --git a/recipes/xorg-font/font-dec-misc_1.0.1.bb b/recipes/xorg-font/font-dec-misc_1.0.1.bb
deleted file mode 100644
index 29abff6..0000000
--- a/recipes/xorg-font/font-dec-misc_1.0.1.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-font-common.inc
-
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "05714516824c680ce747c6ef9d2fbbdd"
-SRC_URI[archive.sha256sum] = "fb20da4afddc07e236e830939de0fdfc9a93c5c1c7048fafe669fac19b496552"
diff --git a/recipes/xorg-font/font-ibm-type1_1.0.1.bb b/recipes/xorg-font/font-ibm-type1_1.0.1.bb
deleted file mode 100644
index ab7113a..0000000
--- a/recipes/xorg-font/font-ibm-type1_1.0.1.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-font-common.inc
-
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "1646179ff224b3e2c9b1e7f59042897f"
-SRC_URI[archive.sha256sum] = "887ea895cc0fdd5c50d4960aee7cb6ed813cf90f53b53ce0e0e068dd606cc919"
diff --git a/recipes/xorg-font/font-isas-misc_1.0.1.bb b/recipes/xorg-font/font-isas-misc_1.0.1.bb
deleted file mode 100644
index e65e169..0000000
--- a/recipes/xorg-font/font-isas-misc_1.0.1.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-font-common.inc
-
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "88b5b32c5a27576e9d00675bcc966806"
-SRC_URI[archive.sha256sum] = "52fe0469eb91e94dc7a0e8164e947fee439f398b0eb63c210f682524f12cea7b"
diff --git a/recipes/xorg-font/font-jis-misc_1.0.1.bb b/recipes/xorg-font/font-jis-misc_1.0.1.bb
deleted file mode 100644
index f521e78..0000000
--- a/recipes/xorg-font/font-jis-misc_1.0.1.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-font-common.inc
-
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "5835c99d056f4a29d7d6a5ae873cf00e"
-SRC_URI[archive.sha256sum] = "a63b98c204395b61949214db199c38094489336731d4a4179eb053a5bb54e8cf"
diff --git a/recipes/xorg-font/font-micro-misc_1.0.1.bb b/recipes/xorg-font/font-micro-misc_1.0.1.bb
deleted file mode 100644
index 21fe0c7..0000000
--- a/recipes/xorg-font/font-micro-misc_1.0.1.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require xorg-font-common.inc
-
-PE = "1"
-PR = "${INC_PR}.0"
-
-EXTRA_OECONF = "--disable-iso8859-2 --disable-iso8859-3 --disable-iso8859-4 --disable-iso8859-5 --disable-iso8859-6 --disable-iso8859-7 --disable-iso8859-8 --disable-iso8859-9 --disable-iso8859-10 --disable-iso8859-11 --disable-iso8859-12 --disable-iso8859-13 --disable-iso8859-14 --disable-iso8859-15 --disable-iso8859-16 --disable-jisx0201 --disable-koi8-r"
-
-SRC_URI[archive.md5sum] = "6350117efebe340f33e818f4a33e4e4b"
-SRC_URI[archive.sha256sum] = "a5b987ea38bf53f63968a6cad1c052ca6d0fc678d9409c1953701f0159e4972b"
diff --git a/recipes/xorg-font/font-misc-cyrillic_1.0.1.bb b/recipes/xorg-font/font-misc-cyrillic_1.0.1.bb
deleted file mode 100644
index 1a749b1..0000000
--- a/recipes/xorg-font/font-misc-cyrillic_1.0.1.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-font-common.inc
-
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "c79d7921d95b2c4f10fad464bb121090"
-SRC_URI[archive.sha256sum] = "dafafbfd93d95820449972fd86ec312266eb73e5297966ee6e0163d294d8af75"
diff --git a/recipes/xorg-font/font-misc-ethiopic_1.0.1.bb b/recipes/xorg-font/font-misc-ethiopic_1.0.1.bb
deleted file mode 100644
index 5b37d40..0000000
--- a/recipes/xorg-font/font-misc-ethiopic_1.0.1.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require xorg-font-common.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "4c88c79b8e5d47af90b21e948d42755f"
-SRC_URI[archive.sha256sum] = "bf3b3a994b6c4047b2d79f590e7113ed429b8b7a83992cb753a83e6e8bd3d948"
diff --git a/recipes/xorg-font/font-misc-meltho_1.0.1.bb b/recipes/xorg-font/font-misc-meltho_1.0.1.bb
deleted file mode 100644
index eb1fdc8..0000000
--- a/recipes/xorg-font/font-misc-meltho_1.0.1.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-font-common.inc
-
-DESCRIPTION = "These fonts are designed for the display of Syriac text."
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "345f1a78312e30cd2c41d24ea3f3276f"
-SRC_URI[archive.sha256sum] = "5366d7a0f38a189e504676a9cddd8430113f9957919f0a3dc181bcaaaed92618"
diff --git a/recipes/xorg-font/font-misc-misc_1.1.0.bb b/recipes/xorg-font/font-misc-misc_1.1.0.bb
deleted file mode 100644
index 0b58192..0000000
--- a/recipes/xorg-font/font-misc-misc_1.1.0.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require xorg-font-common.inc
-
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "878bfd4e9f14c1279cea3a8392e0dbdd"
-SRC_URI[archive.sha256sum] = "50f7528ab94f319a11efcd555dd5a7120191a42cf892c87cd6bdea8b908d497b"
diff --git a/recipes/xorg-font/font-mutt-misc_1.0.1.bb b/recipes/xorg-font/font-mutt-misc_1.0.1.bb
deleted file mode 100644
index 9f65df8..0000000
--- a/recipes/xorg-font/font-mutt-misc_1.0.1.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require xorg-font-common.inc
-
-DESCRIPTION = "Provides a 12pt, 100dpi proportional font with many of \
-the glyphs needed for Unicode text."
-
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "aab7ac62b960e77aa11d032bafe1d460"
-SRC_URI[archive.sha256sum] = "77bf33cbf5d1849bef4e516698eb45b7d16263a84dcc2299fd61383501906e25"
diff --git a/recipes/xorg-font/font-mutt-misc_1.0.2.bb b/recipes/xorg-font/font-mutt-misc_1.0.2.bb
deleted file mode 100644
index 0b7e4a8..0000000
--- a/recipes/xorg-font/font-mutt-misc_1.0.2.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require xorg-font-common.inc
-
-DESCRIPTION = "Provides a 12pt, 100dpi proportional font with many of \
-the glyphs needed for Unicode text."
-
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "8296972a99f96600d435d157fccc1501"
-SRC_URI[archive.sha256sum] = "6fc514969b44dc23392d2d1deb6de92c10357ef8d0498a182576467cf5032dc4"
diff --git a/recipes/xorg-font/font-schumacher-misc_1.1.0.bb b/recipes/xorg-font/font-schumacher-misc_1.1.0.bb
deleted file mode 100644
index 1a06bae..0000000
--- a/recipes/xorg-font/font-schumacher-misc_1.1.0.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require xorg-font-common.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "86f4b7d8b11a2e6da70884c59b5866a3"
-SRC_URI[archive.sha256sum] = "3003915fb53930fee5e6086ee7546ea0857ef0fc2311aaf84ed937b1b4de1b4d"
diff --git a/recipes/xorg-font/font-screen-cyrillic_1.0.2.bb b/recipes/xorg-font/font-screen-cyrillic_1.0.2.bb
deleted file mode 100644
index 6e0adf7..0000000
--- a/recipes/xorg-font/font-screen-cyrillic_1.0.2.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require xorg-font-common.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "c912a976b66073acd80c9d5c624f3aae"
-SRC_URI[archive.sha256sum] = "c5dd881fb13ff16d358acb27f99f6c281415d3824beb342f3a02603f0efebe11"
diff --git a/recipes/xorg-font/font-sony-misc_1.0.1.bb b/recipes/xorg-font/font-sony-misc_1.0.1.bb
deleted file mode 100644
index 9b418fe..0000000
--- a/recipes/xorg-font/font-sony-misc_1.0.1.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require xorg-font-common.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "7b6f5117814599b86ed3470de6c62aa3"
-SRC_URI[archive.sha256sum] = "da9526844c74ce395d3912d3d8f538cd57102d6bcd9f73fd0a5dccf53bfc56ca"
diff --git a/recipes/xorg-font/font-sun-misc_1.0.1.bb b/recipes/xorg-font/font-sun-misc_1.0.1.bb
deleted file mode 100644
index 9a607d9..0000000
--- a/recipes/xorg-font/font-sun-misc_1.0.1.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require xorg-font-common.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "5a185c5549a650bf062d343e128682ca"
-SRC_URI[archive.sha256sum] = "411522f5ea8f951a7432ab946a92f524493e3a1a6e1ca3c48f09c46cb5ae9d09"
diff --git a/recipes/xorg-font/font-util_1.1.1.bb b/recipes/xorg-font/font-util_1.1.1.bb
deleted file mode 100644
index 01fa5a9..0000000
--- a/recipes/xorg-font/font-util_1.1.1.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-require xorg-font-common.inc
-
-PACKAGE_ARCH = "${BASE_PACKAGE_ARCH}"
-
-DESCRIPTION = "X font utils."
-
-DEPENDS = "util-macros"
-RDEPENDS_${PN} = "mkfontdir mkfontscale encodings"
-BBCLASSEXTEND = "native"
-
-PE = "1"
-PR = "${INC_PR}.3"
-
-do_configure_prepend() {
-        sed -i "s#MAPFILES_PATH=\`pkg-config#MAPFILES_PATH=\`PKG_CONFIG_PATH=\"${STAGING_LIBDIR_NATIVE}/pkg-config\" pkg-config#g" fontutil.m4.in
-}
-
-SRC_URI[archive.md5sum] = "5c735ae6916b65186f3c876d76c27ce3"
-SRC_URI[archive.sha256sum] = "a33f1e3b0d7c3fd7c3505ce68888fec3cf897353084187d96e1e821fe3c02f88"
diff --git a/recipes/xorg-font/font-winitzki-cyrillic_1.0.1.bb b/recipes/xorg-font/font-winitzki-cyrillic_1.0.1.bb
deleted file mode 100644
index 4f9ff49..0000000
--- a/recipes/xorg-font/font-winitzki-cyrillic_1.0.1.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-font-common.inc
-
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "92bf4ecb373faac545cef2dcbe40be35"
-SRC_URI[archive.sha256sum] = "7c57c29f70db18e543a3eb8f785b6b5d1372b78eee27707dbb10359d8ddb1446"
diff --git a/recipes/xorg-font/font-xfree86-type1_1.0.2.bb b/recipes/xorg-font/font-xfree86-type1_1.0.2.bb
deleted file mode 100644
index 8b9aa0d..0000000
--- a/recipes/xorg-font/font-xfree86-type1_1.0.2.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-font-common.inc
-
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "a966f5a8aade9e63af86d8a6bf3e8586"
-SRC_URI[archive.sha256sum] = "7a026aeaafe5a619b2c1b35cd361125b169b2212eaf0f2f5ce796038b1cf06cd"
-- 
1.7.4.rc1



