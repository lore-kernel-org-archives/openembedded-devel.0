Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id C4AF77C434
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Jul 2019 20:56:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45zQh83HfFz56
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Jul 2019 22:56:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1564606584;
	bh=llYDeOhE1jPp6+M7Q8Yb8gTOnCEve8zfzy/MVsvjmWw=;
	h=From:To:Subject:Date:From;
	b=WeVznwuQ942NtS5doqa7CNbwTqjd5I3l5+Lz8itFSDuMIEoyTZS4mpko+7ciUjiOW
	VeDEQytq62otS0JMYC1yzfcIwcvjk5Fs2wFw7HCSywtpuviFX6BdzBjHygNOU8ozCk
	LaA2zPKxQudISO47zualFf9dQQPLpYm9oWhPGfwfM8OchyaOrjP+grbRUDFW24K+KQ
	KDKfW0lDzcmbRZDM69DDHx67eRZjTYoYUUVl/qyZpwIU3rAQdigACE3Go9vv71+0p/
	EffA9Gq1aHbkRUqFZVpwIfINCVb3u5xpYuoIWUEzQZ0LjS+FRUJcZFNp83GmLEjrIM
	deHiRgBGDBDrsFIXciKq8bF3K1xjjD9IT5iOvDf2mImRsa79PZLzRiv4EQmiYcT8Y+
	hbs0r9Hgwr23EcXYMLDpmT0a4aN9yV0vGX0hYmIoHlM7U9Bx6LWef/RiZZ8ESRAbjK
	Hj8TwK/jGc23VhNY/FGKjbsH3NhgrH0qzZlLtSV1KkGytRcbfceBZPXUxqSQVjzX3P
	L2gWRtxtlFm2V99NmvqFu6nt+fobsRIPjVPjd+XlP5RZONaRTOlK8isnn0lDRHLc3B
	rz7RPAYbUsUXGbK+A5eHoVD2kbgEDQwcvFPVT3ckkO5UHeKUGNQG4PQ+qBWmydRwA4
	GQdZXOKA1eZUudILAUQaVrhs=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 31 Jul 2019 23:56:23 +0300
Message-Id: <20190731205623.3227-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] meta-oe: Change some ftp:// URIs to http(s)://
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 31 Jul 2019 20:56:25 -0000

For glibmm this is done with the gnomebase class.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta-oe/recipes-core/glib-2.0/glibmm_2.58.1.bb        | 9 ++++-----
 meta-oe/recipes-multimedia/alsa/alsa-oss_1.1.8.bb     | 2 +-
 meta-oe/recipes-support/lvm2/lvm2.inc                 | 2 +-
 meta-oe/recipes-support/sharutils/sharutils_4.15.2.bb | 2 +-
 meta-oe/recipes-support/tree/tree_1.7.0.bb            | 2 +-
 5 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/meta-oe/recipes-core/glib-2.0/glibmm_2.58.1.bb b/meta-oe/recipes-core/glib-2.0/glibmm_2.58.1.bb
index 87ab0cbc5..1e5094bd1 100644
--- a/meta-oe/recipes-core/glib-2.0/glibmm_2.58.1.bb
+++ b/meta-oe/recipes-core/glib-2.0/glibmm_2.58.1.bb
@@ -6,16 +6,15 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=42dfffebc56fec7527aac53b7a89d1d8 \
                     file://COPYING.tools;md5=751419260aa954499f7abaabaa882bbe"
 
 DEPENDS = "mm-common glib-2.0 libsigc++-2.0 glib-2.0-native"
-inherit autotools pkgconfig
+inherit gnomebase
 
 SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 
-SRC_URI = " \
-    ftp://ftp.gnome.org/pub/GNOME/sources/glibmm/${SHRT_VER}/glibmm-${PV}.tar.xz \
+SRC_URI += " \
     file://remove-examples.patch \
 "
-SRC_URI[md5sum] = "77f1016cbb27e15d4e04a2b7bfdb4cae"
-SRC_URI[sha256sum] = "6e5fe03bdf1e220eeffd543e017fd2fb15bcec9235f0ffd50674aff9362a85f0"
+SRC_URI[archive.md5sum] = "77f1016cbb27e15d4e04a2b7bfdb4cae"
+SRC_URI[archive.sha256sum] = "6e5fe03bdf1e220eeffd543e017fd2fb15bcec9235f0ffd50674aff9362a85f0"
 
 do_install_append() {
     install -d ${D}${datadir}/glibmm-2.4
diff --git a/meta-oe/recipes-multimedia/alsa/alsa-oss_1.1.8.bb b/meta-oe/recipes-multimedia/alsa/alsa-oss_1.1.8.bb
index 67a24cf9d..e6b9d6b5b 100644
--- a/meta-oe/recipes-multimedia/alsa/alsa-oss_1.1.8.bb
+++ b/meta-oe/recipes-multimedia/alsa/alsa-oss_1.1.8.bb
@@ -4,7 +4,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ed055b4eff93da784176a01582e6ec1a"
 DEPENDS = "alsa-lib"
 
-SRC_URI = "ftp://ftp.alsa-project.org/pub/oss-lib/alsa-oss-${PV}.tar.bz2 \
+SRC_URI = "https://www.alsa-project.org/files/pub/oss-lib/alsa-oss-${PV}.tar.bz2 \
 "
 SRC_URI[md5sum] = "9ec4bb783fdce19032aace086d65d874"
 SRC_URI[sha256sum] = "64adcef5927e848d2e024e64c4bf85b6f395964d9974ec61905ae4cb8d35d68e"
diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
index 8617f25cb..ca409a6f1 100644
--- a/meta-oe/recipes-support/lvm2/lvm2.inc
+++ b/meta-oe/recipes-support/lvm2/lvm2.inc
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=12713b4d9386533feeb07d6e4831765a \
 
 DEPENDS += "util-linux libaio"
 
-SRC_URI = "ftp://sources.redhat.com/pub/lvm2/releases/LVM2.${PV}.tgz \
+SRC_URI = "https://sourceware.org/pub/lvm2/LVM2.${PV}.tgz \
            file://lvm.conf \
            file://0001-implement-libc-specific-reopen_stream.patch \
            file://0002-Guard-use-of-mallinfo-with-__GLIBC__.patch \
diff --git a/meta-oe/recipes-support/sharutils/sharutils_4.15.2.bb b/meta-oe/recipes-support/sharutils/sharutils_4.15.2.bb
index dca42676d..8f39fde82 100644
--- a/meta-oe/recipes-support/sharutils/sharutils_4.15.2.bb
+++ b/meta-oe/recipes-support/sharutils/sharutils_4.15.2.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 inherit gettext autotools
 
-SRC_URI = "ftp://ftp.gnu.org/gnu/${BPN}/${BP}.tar.gz \
+SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.gz \
            file://0001-Fix-build-with-clang.patch \
            file://CVE-2018-1000097.patch \
 "
diff --git a/meta-oe/recipes-support/tree/tree_1.7.0.bb b/meta-oe/recipes-support/tree/tree_1.7.0.bb
index 2e8ebdb4d..5eff55263 100644
--- a/meta-oe/recipes-support/tree/tree_1.7.0.bb
+++ b/meta-oe/recipes-support/tree/tree_1.7.0.bb
@@ -4,7 +4,7 @@ SECTION = "console/utils"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=393a5ca445f6965873eca0259a17f833"
 
-SRC_URI = "ftp://mama.indstate.edu/linux/${BPN}/${BP}.tgz"
+SRC_URI = "http://mama.indstate.edu/users/ice/tree/src/${BP}.tgz"
 SRC_URI[md5sum] = "abe3e03e469c542d8e157cdd93f4d8a6"
 SRC_URI[sha256sum] = "6957c20e82561ac4231638996e74f4cfa4e6faabc5a2f511f0b4e3940e8f7b12"
 
-- 
2.17.1


