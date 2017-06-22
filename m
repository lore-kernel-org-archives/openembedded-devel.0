Return-Path: <fan.xin@jp.fujitsu.com>
Received: from mgwym02.jp.fujitsu.com (mgwym02.jp.fujitsu.com [211.128.242.41])
	by mail.openembedded.org (Postfix) with ESMTP id A3D7E71AB3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Jun 2017 06:36:26 +0000 (UTC)
Received: from yt-mxauth.gw.nic.fujitsu.com (unknown [192.168.229.68]) by
	mgwym02.jp.fujitsu.com with smtp
	id 5796_4ddb_9b5ad15b_6fd8_47d1_9bda_463421a6393e;
	Thu, 22 Jun 2017 15:36:23 +0900
Received: from g01jpfmpwyt02.exch.g01.fujitsu.local
	(g01jpfmpwyt02.exch.g01.fujitsu.local [10.128.193.56])
	by yt-mxauth.gw.nic.fujitsu.com (Postfix) with ESMTP id CF7D5AC011C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Jun 2017 15:36:22 +0900 (JST)
Received: from G01JPEXCHYT13.g01.fujitsu.local
	(G01JPEXCHYT13.g01.fujitsu.local [10.128.194.52])
	by g01jpfmpwyt02.exch.g01.fujitsu.local (Postfix) with ESMTP id
	BCE5958422E for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Jun 2017 15:36:21 +0900 (JST)
Received: from localhost.localdomain (10.24.19.99) by
	G01JPEXCHYT13.g01.fujitsu.local (10.128.194.52) with Microsoft SMTP
	Server id 14.3.266.1; Thu, 22 Jun 2017 15:36:21 +0900
From: Fan Xin <fan.xin@jp.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 22 Jun 2017 15:37:48 +0900
Message-ID: <1498113468-8716-1-git-send-email-fan.xin@jp.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-SecurityPolicyCheck-GC: OK by FENCE-Mail
X-Encrypted: FENCE-Mail/3.1.1
X-TM-AS-MML: disable
Subject: [PATCH] xterm: Upgrade 327 -> 330
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
X-List-Received-Date: Thu, 22 Jun 2017 06:36:28 -0000
Content-Type: text/plain

1. Upgrade xterm from 327 to 330

2. Update the checksum of LIC_FILES_CHKSUM
   The copyright time has been extended to 2017, the Licence content has no chagne.

Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
---
 meta-oe/recipes-graphics/xorg-app/{xterm_327.bb => xterm_330.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-graphics/xorg-app/{xterm_327.bb => xterm_330.bb} (78%)

diff --git a/meta-oe/recipes-graphics/xorg-app/xterm_327.bb b/meta-oe/recipes-graphics/xorg-app/xterm_330.bb
similarity index 78%
rename from meta-oe/recipes-graphics/xorg-app/xterm_327.bb
rename to meta-oe/recipes-graphics/xorg-app/xterm_330.bb
index 0e11662..e3bb0fb 100644
--- a/meta-oe/recipes-graphics/xorg-app/xterm_327.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xterm_330.bb
@@ -2,12 +2,12 @@ require recipes-graphics/xorg-app/xorg-app-common.inc
 SUMMARY = "xterm is the standard terminal emulator for the X Window System"
 DEPENDS = "libxaw xproto xextproto libxext libxau libxinerama libxpm ncurses"
 
-LIC_FILES_CHKSUM = "file://xterm.h;beginline=3;endline=31;md5=842e945c46c43e05c44d95003aa878e1"
+LIC_FILES_CHKSUM = "file://xterm.h;beginline=3;endline=31;md5=f02ab9ebda87b770ecf711dbb3784a33"
 
 SRC_URI = "http://invisible-mirror.net/archives/${BPN}/${BP}.tgz"
 
-SRC_URI[md5sum] = "3c32e931adcad44e64e57892e75d9e02"
-SRC_URI[sha256sum] = "66fb2f6c35b342148f549c276b12a3aa3fb408e27ab6360ddec513e14376150b"
+SRC_URI[md5sum] = "9a6db7974aa4ccbb50eabebf72618467"
+SRC_URI[sha256sum] = "7aeef9f29f6b95e09f481173c8c3053357bf5ffe162585647f690fd1707556df"
 PACKAGECONFIG ?= ""
 PACKAGECONFIG[xft] = "--enable-freetype,--disable-freetype,libxft fontconfig freetype-native"
 
-- 
2.7.4


