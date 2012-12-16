Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TkIhv-0005n9-M9
	for openembedded-devel@lists.openembedded.org;
	Sun, 16 Dec 2012 19:13:10 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so1964799eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Dec 2012 09:58:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=qOVnhkuwXGnsXndDN7EdprzntdYb34uC9yYu6+tskzI=;
	b=SVbjC2AMcHijo3O1IIaenH5yVSAqhh6gQkX18CG45jaW/xLnUjiUxJrjY0VO1oPN15
	EPPR5JsVdPn9Mv6hffhGARC9FJ3tN4Rp8UnL++nkDoHak8J2xER+edMfYnCGseGuIDN4
	vd1ao80GSRVKZOA4fHmKaR+RfPP7sVDCh66xfijVl5XJK7JP3KYNWe2llJX68q2WGC1t
	wZUZRRLP7hqRBbrhGKPirCEsxh6tPo1KshTCW0BdLVyVNlCVTuJKA3TpM/sJutuOASIj
	gbyu2tDl5fxgLW+lQJNECHIy5W20iEKVy/6ymevFdzwaJAF3z/DDeH0DuBIGaBJ7ml59
	j34Q==
Received: by 10.14.194.4 with SMTP id l4mr33363104een.42.1355680700540;
	Sun, 16 Dec 2012 09:58:20 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id e2sm23867963eeo.8.2012.12.16.09.58.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 16 Dec 2012 09:58:19 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 16 Dec 2012 18:57:50 +0100
Message-Id: <8e6de6006b1938ae7c28390f4f999a1b7a154b54.1355680285.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1355680285.git.Martin.Jansa@gmail.com>
References: <cover.1355680285.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1355680285.git.Martin.Jansa@gmail.com>
References: <cover.1355680285.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 07/26] meta-oe: Fix erroneous use of "startline" in LIC_FILES_CHKSUM
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
X-List-Received-Date: Sun, 16 Dec 2012 18:13:11 -0000

From: Paul Eggleton <paul.eggleton@linux.intel.com>

"beginline" is the correct parameter name. Checksums have been updated
where necessary (i.e. if the beginning line was something other than the
default of 1).

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-extended/ddrescue/ddrescue_1.16.bb       | 2 +-
 meta-oe/recipes-extended/lcdproc/lcdproc5.inc            | 2 +-
 meta-oe/recipes-extended/socketcan/libsocketcan_0.0.8.bb | 2 +-
 meta-oe/recipes-extended/tmux/tmux_1.6.bb                | 2 +-
 meta-oe/recipes-support/mini-iconv/mini-iconv.bb         | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-extended/ddrescue/ddrescue_1.16.bb b/meta-oe/recipes-extended/ddrescue/ddrescue_1.16.bb
index 3000dbb..7e0a4fb 100644
--- a/meta-oe/recipes-extended/ddrescue/ddrescue_1.16.bb
+++ b/meta-oe/recipes-extended/ddrescue/ddrescue_1.16.bb
@@ -7,7 +7,7 @@ SECTION = "console"
 LICENSE = "GPLv3+"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949 \
-                    file://main_common.cc;startline=5;endline=16;md5=0ef2c1bede11c6c9c6c12330d60bc7a7"
+                    file://main_common.cc;beginline=5;endline=16;md5=b5a59150a33658cc1ffc31b1a4ffb9f2"
 
 SRC_URI = "${GNU_MIRROR}/${PN}/${P}.tar.gz"
 SRC_URI[md5sum] = "57b67407e882c6418531d48a2f20d16b"
diff --git a/meta-oe/recipes-extended/lcdproc/lcdproc5.inc b/meta-oe/recipes-extended/lcdproc/lcdproc5.inc
index 76669be..4040870 100644
--- a/meta-oe/recipes-extended/lcdproc/lcdproc5.inc
+++ b/meta-oe/recipes-extended/lcdproc/lcdproc5.inc
@@ -7,7 +7,7 @@ LICENSE = "GPLv2+"
 DEPENDS = "virtual/libusb0 ncurses"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=18810669f13b87348459e611d31ab760 \
-                    file://README;startline=60;md5=8237b4d4d80a525b15f8162192e07bee"
+                    file://README;beginline=60;md5=637e042cdd3671ba00e78b58ede45d3b"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/lcdproc/${P}.tar.gz"
 
diff --git a/meta-oe/recipes-extended/socketcan/libsocketcan_0.0.8.bb b/meta-oe/recipes-extended/socketcan/libsocketcan_0.0.8.bb
index cf6c212..89b4f06 100644
--- a/meta-oe/recipes-extended/socketcan/libsocketcan_0.0.8.bb
+++ b/meta-oe/recipes-extended/socketcan/libsocketcan_0.0.8.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.pengutronix.de"
 SECTION = "libs/network"
 
 LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://src/libsocketcan.c;startline=3;endline=17;md5=2c5c54d58b42d2216f34759062be3ddb"
+LIC_FILES_CHKSUM = "file://src/libsocketcan.c;beginline=3;endline=17;md5=97e38adced4385d8fba1ae2437cedee1"
 
 SRCREV = "3a2cec63a4e6212cc63d21008453bd799cfe8774"
 
diff --git a/meta-oe/recipes-extended/tmux/tmux_1.6.bb b/meta-oe/recipes-extended/tmux/tmux_1.6.bb
index fa58065..6be2355 100644
--- a/meta-oe/recipes-extended/tmux/tmux_1.6.bb
+++ b/meta-oe/recipes-extended/tmux/tmux_1.6.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://tmux.sourceforge.net"
 SECTION = "console/utils"
 
 LICENSE = "ISC"
-LIC_FILES_CHKSUM = "file://tmux.c;startline=3;endline=17;md5=f36d9c9e6c1c24996a88891fdf783d04"
+LIC_FILES_CHKSUM = "file://tmux.c;beginline=3;endline=17;md5=8685b4455330a940fab1ff451aa941a0"
 
 DEPENDS = "ncurses libevent sed-native"
 
diff --git a/meta-oe/recipes-support/mini-iconv/mini-iconv.bb b/meta-oe/recipes-support/mini-iconv/mini-iconv.bb
index 7d5bc68..3150013 100644
--- a/meta-oe/recipes-support/mini-iconv/mini-iconv.bb
+++ b/meta-oe/recipes-support/mini-iconv/mini-iconv.bb
@@ -8,7 +8,7 @@ SECTION = "libs"
 DEPENDS = ""
 PROVIDES = "virtual/libiconv"
 PR = "r0"
-LIC_FILES_CHKSUM = "file://iconv.c;startline=1;endline=6;md5=35af9d9924327fe8a0a1fe3a2cb454c8"
+LIC_FILES_CHKSUM = "file://iconv.c;beginline=1;endline=6;md5=35af9d9924327fe8a0a1fe3a2cb454c8"
 SRC_URI = "http://mirror.meleeweb.net/pub/linux/gentoo/distfiles/mini-iconv.tar.bz2"
 SRC_URI[md5sum] = "84412221e26505a2b3855d4a1cdcd0e0"
 SRC_URI[sha256sum] = "3552262bf1bcf8e859a2a3a7adfb0367af8593383e730c492e981477aac0a0d4"
-- 
1.8.0.2



