Return-Path: <wangxin2015.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 4AC7E7002B
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Sep 2016 11:32:05 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="10844996"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 11 Sep 2016 19:32:01 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id D6AA7404240C
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Sep 2016 19:32:02 +0800 (CST)
Received: from ubuntu.g08.fujitsu.local (10.167.226.120) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Sun, 11 Sep 2016 19:32:03 +0800
From: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sun, 11 Sep 2016 07:31:55 -0400
Message-ID: <1473593516-1335-1-git-send-email-wangxin2015.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.120]
X-yoursite-MailScanner-ID: D6AA7404240C.A644B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangxin2015.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] xterm: 320 -> 325
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
X-List-Received-Date: Sun, 11 Sep 2016 11:32:07 -0000
Content-Type: text/plain

Upgrade xterm from 320 to 325.

Signed-off-by: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-graphics/xorg-app/{xterm_320.bb => xterm_325.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-graphics/xorg-app/{xterm_320.bb => xterm_325.bb} (78%)

diff --git a/meta-oe/recipes-graphics/xorg-app/xterm_320.bb b/meta-oe/recipes-graphics/xorg-app/xterm_325.bb
similarity index 78%
rename from meta-oe/recipes-graphics/xorg-app/xterm_320.bb
rename to meta-oe/recipes-graphics/xorg-app/xterm_325.bb
index f2abc3c..e0baf3c 100644
--- a/meta-oe/recipes-graphics/xorg-app/xterm_320.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xterm_325.bb
@@ -2,12 +2,12 @@ require recipes-graphics/xorg-app/xorg-app-common.inc
 SUMMARY = "xterm is the standard terminal emulator for the X Window System"
 DEPENDS = "libxaw xproto xextproto libxext libxau libxinerama libxpm ncurses"
 
-LIC_FILES_CHKSUM = "file://xterm.h;beginline=3;endline=31;md5=ee6435019d00b884cde8d7ba2b318ff0"
+LIC_FILES_CHKSUM = "file://xterm.h;beginline=3;endline=31;md5=842e945c46c43e05c44d95003aa878e1"
 
 SRC_URI = "http://invisible-mirror.net/archives/${BPN}/${BP}.tgz"
 
-SRC_URI[md5sum] = "0d7f0e6390d132ae59876b3870e5783d"
-SRC_URI[sha256sum] = "a60dbb574334c081425fa30f011cd9f571e3be7a91e2a84e252461798bce24a7"
+SRC_URI[md5sum] = "e78a0bbc4d5fa3780917e447ae8ebc6b"
+SRC_URI[sha256sum] = "3b31b07a0c40427e9330ec3be9d1a748c72808f945953cea9e526e48be315f1b"
 
 PACKAGECONFIG ?= ""
 PACKAGECONFIG[xft] = "--enable-freetype,--disable-freetype,libxft fontconfig freetype-native"
-- 
2.7.4




