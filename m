Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TjAOa-0001uW-TO
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Dec 2012 16:08:46 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 13 Dec 2012 06:53:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,274,1355126400"; d="scan'208";a="180451167"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.123.1])
	by AZSMGA002.ch.intel.com with ESMTP; 13 Dec 2012 06:53:42 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Dec 2012 14:53:35 +0000
Message-Id: <fc6c3295e97303135ca8dd159853fa408ee145e4.1355410208.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1355410208.git.paul.eggleton@linux.intel.com>
References: <cover.1355410208.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1355410208.git.paul.eggleton@linux.intel.com>
References: <cover.1355410208.git.paul.eggleton@linux.intel.com>
Subject: [meta-oe][PATCH 1/3] Fix erroneous use of "startline" in LIC_FILES_CHKSUM
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
X-List-Received-Date: Thu, 13 Dec 2012 15:08:51 -0000

"beginline" is the correct parameter name. Checksums have been updated
where necessary (i.e. if the beginning line was something other than the
default of 1).

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta-oe/recipes-extended/ddrescue/ddrescue_1.16.bb       |    2 +-
 meta-oe/recipes-extended/lcdproc/lcdproc5.inc            |    2 +-
 meta-oe/recipes-extended/socketcan/libsocketcan_0.0.8.bb |    2 +-
 meta-oe/recipes-extended/tmux/tmux_1.6.bb                |    2 +-
 meta-oe/recipes-support/mini-iconv/mini-iconv.bb         |    2 +-
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
1.7.10.4



