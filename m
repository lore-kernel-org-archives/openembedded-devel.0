Return-Path: <ml@communistcode.co.uk>
Received: from owm.eumx.net (eumx.net [91.82.101.43])
	by mail.openembedded.org (Postfix) with ESMTP id C335065DDF
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Apr 2014 16:15:54 +0000 (UTC)
From: Jack Mitchell <ml@communistcode.co.uk>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 25 Apr 2014 17:15:51 +0100
Message-Id: <1398442553-18995-2-git-send-email-ml@communistcode.co.uk>
X-Mailer: git-send-email 1.9.2
In-Reply-To: <1398442553-18995-1-git-send-email-ml@communistcode.co.uk>
References: <1398442553-18995-1-git-send-email-ml@communistcode.co.uk>
Cc: Jack Mitchell <jmitchell@cbnl.com>
Subject: [meta-oe][PATCH 2/4] xterm: upgrade to 303, set B=S, licence tweak
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 25 Apr 2014 16:15:57 -0000

From: Jack Mitchell <jmitchell@cbnl.com>

- upgrade to version 303
- set B=S due to broken build/source seperation
- tweak licence file md5 to account for date change

Signed-off-by: Jack Mitchell <jmitchell@cbnl.com>
---
 meta-oe/recipes-graphics/xorg-app/{xterm_293.bb => xterm_303.bb} | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-graphics/xorg-app/{xterm_293.bb => xterm_303.bb} (72%)

diff --git a/meta-oe/recipes-graphics/xorg-app/xterm_293.bb b/meta-oe/recipes-graphics/xorg-app/xterm_303.bb
similarity index 72%
rename from meta-oe/recipes-graphics/xorg-app/xterm_293.bb
rename to meta-oe/recipes-graphics/xorg-app/xterm_303.bb
index 67853b9..47dfbe5 100644
--- a/meta-oe/recipes-graphics/xorg-app/xterm_293.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xterm_303.bb
@@ -2,11 +2,12 @@ require recipes-graphics/xorg-app/xorg-app-common.inc
 SUMMARY = "xterm is the standard terminal emulator for the X Window System"
 DEPENDS = "libxaw xproto xextproto libxext libxau libxpm ncurses"
 
-LIC_FILES_CHKSUM = "file://xterm.h;beginline=3;endline=33;md5=3aaef904421576f75ce2ee32af88c375"
+LIC_FILES_CHKSUM = "file://xterm.h;beginline=3;endline=31;md5=540cf18ccc16bc3c5fea40d2ab5d8d51"
 
 SRC_URI = "ftp://invisible-island.net/xterm/${PN}-${PV}.tgz"
-SRC_URI[md5sum] = "f9dc37486d5f1e550b6dc2e26a8a0439"
-SRC_URI[sha256sum] = "64e9c41137eac4277d0cfe04312b12dc5d11224f49fc999ff7f6b9597bf55b7b"
+
+SRC_URI[md5sum] = "48f6d49b2b6b6933d501d767cbed9254"
+SRC_URI[sha256sum] = "8af29987bda9b77205ebf6233aaa5c347e5f2407310b62ac9ba92a658257f058"
 
 EXTRA_OECONF = " --x-includes=${STAGING_INCDIR} \
                  --x-libraries=${STAGING_LIBDIR} \
@@ -14,6 +15,8 @@ EXTRA_OECONF = " --x-includes=${STAGING_INCDIR} \
                  --disable-imake \
                  --disable-setuid"
 
+B = "${S}"
+
 do_configure() {
     gnu-configize --force
     sed -e "s%/usr/contrib/X11R6%${STAGING_LIBDIR}%g" -i configure
-- 
1.9.2


