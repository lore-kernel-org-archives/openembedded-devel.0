Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id BE6486B076
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Jul 2019 06:24:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45drfV0VPJz4Y
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Jul 2019 08:24:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1562135042;
	bh=q3p4U9somIVzsLO/6P4l4l2l1x0pwYRuYiw2Pk+Jz8k=;
	h=From:To:Subject:Date:From;
	b=G4/oLVojq9nKOvQ95MDAiAxlpUJDcKwQXtdjNbeZwzhXUDpX57507PSgOu+tYll0/
	6XxbI2GLRjyD2JU3XgMR3EbD8awVaCP2urnoqmeDL5+12CTEjEBl2gqu5z0FDoCukz
	p/Al7Cw0G8I5Uq5eC8BmKKplvChS4JI20/kfYIiybiRRmdFUfCOJ10y28BUWoZYEZe
	sgsNaugb0W8RqqD1PeHp7JCvNEcEd1Lu4zdLSTGqvM0t8cE6dH93OXlaGz599t1We6
	fpNL0dgU+V3hWAR9dDt/HTM9+Uk+2XWd0Qk2p0fytnZG7TT1F+EI5VF0LKy1iIhxh3
	JNPHK2UTpidzgwvN8BR/mGwQTgDaRk7qkk0xxUmwYznHrANftAkHTxSq+8Sabr/lN8
	PzIE8xMvTCrllEulaIKpEIv0AaFu2RgWIzsH9jBPKBWzDiXiuU5MCbo/fKPpm44Got
	/D3P2eQbb4RE7IBxpyOj4WHoitItHLxIGLKHokK59xvDR4syltk8Ty2dhh2bBsP3Zz
	MFrbaN4AfAemkxrmCN8kMbRJNOyubnhAkrsbDxvTzFL9ikrNZygTIMsvRA4JzuoB3u
	s5kyeTKjttBmVhYA3XzktaXXe1oND3UasCDJ/pSUAtAiCNT7K45OAGD7mVM7cJJo6O
	ZdplC6hzWlFRfANIHvgV/uoY=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  3 Jul 2019 09:23:59 +0300
Message-Id: <20190703062359.12400-2-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] packagegroup-meta-oe: Remove bogus bluez4 DISTRO_FEATURES checks
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
X-List-Received-Date: Wed, 03 Jul 2019 06:24:02 -0000

These might be remnants from a time when some recipes did
not yet support bluez5.

pulseaudio support is optional in libmikmod.

mongodb does currently fail to build for unrelated reasons.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../packagegroups/packagegroup-meta-oe.bb             | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 619c217b7..d7e1b6e87 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -68,8 +68,8 @@ RDEPENDS_packagegroup-meta-oe-connectivity ="\
     ser2net smstools3 telepathy-glib telepathy-idle thrift \
     usbmuxd wvstreams zabbix zeromq \
     ${@bb.utils.contains("DISTRO_FEATURES", "x11", "obex-data-server", "", d)} \
-    ${@bb.utils.contains("DISTRO_FEATURES", "pulseadio bluez4", "libmikmod", "", d)} \
-    ${@bb.utils.contains("DISTRO_FEATURES", "bluez4", "obexftp openobex libnet wvdial", "", d)} \
+    libmikmod \
+    obexftp openobex libnet wvdial \
     "
 
 # dracut needs dracut
@@ -99,7 +99,6 @@ RDEPENDS_packagegroup-meta-oe-dbs ="\
     leveldb libdbi mariadb mariadb-native \
     mysql-python postgresql psqlodbc rocksdb soci \
     sqlite \
-    ${@bb.utils.contains("DISTRO_FEATURES", "bluez4", "mongodb", "", d)} \
     "
 
 RDEPENDS_packagegroup-meta-oe-devtools ="\
@@ -197,7 +196,7 @@ RDEPENDS_packagegroup-meta-oe-multimedia ="\
     mplayer-common opus-tools \
     sound-theme-freedesktop v4l-utils yavta wavpack libvpx \
     ${@bb.utils.contains("DISTRO_FEATURES", "x11", "xpext pavucontrol xsp", "", d)} \
-    ${@bb.utils.contains("DISTRO_FEATURES", "pulseadio bluez4", "libmikmod", "", d)} \
+    libmikmod \
     ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "libmad faad2 mpv", "", d)} \
     "
 RDEPENDS_packagegroup-meta-oe-multimedia_remove_libc-musl = "alsa-oss"
@@ -249,9 +248,9 @@ RDEPENDS_packagegroup-meta-oe-support ="\
     vim vim-tiny websocketpp wmiconfig xdelta3 xdg-user-dirs xmlstarlet \
     zbar zile \
     ${@bb.utils.contains("DISTRO_FEATURES", "x11", "geis toscoterm uim synergy utouch-mtview links-x11 fltk pidgin-otr", "", d)} \
-    ${@bb.utils.contains("DISTRO_FEATURES", "pulseadio bluez4", "libcanberra", "", d)} \
+    libcanberra \
     ${@bb.utils.contains("DISTRO_FEATURES", "x11 pam", "xorgxrdp xrdp", "", d)} \
-    ${@bb.utils.contains("DISTRO_FEATURES", "bluez4", "procmail", "", d)} \
+    procmail \
     ${@bb.utils.contains("DISTRO_FEATURES", "polkit", "udisks udisks2 upower", "", d)} \
     ${NE10} \
     "
-- 
2.17.1


