Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 89A51770D8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Oct 2015 14:24:23 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	t9GEONeq026130; Fri, 16 Oct 2015 09:24:23 -0500
Received: from adi-pc-linux.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2015101609242270-2125873 ;
	Fri, 16 Oct 2015 09:24:22 -0500 
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 16 Oct 2015 17:24:19 +0300
Message-Id: <1ae727fbcb8056a41ed59f91abf806eda1298972.1445005215.git.adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <7c7ebb1005d3ef6935ce80c02f7059ed7a021d10.1445005215.git.adrian.ratiu@ni.com>
References: <7c7ebb1005d3ef6935ce80c02f7059ed7a021d10.1445005215.git.adrian.ratiu@ni.com>
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 10/16/2015 09:24:22 AM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 10/16/2015 09:24:22 AM,
	Serialize complete at 10/16/2015 09:24:22 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2015-10-16_10:, , signatures=0
Subject: [meta-oe][PATCH 2/3] x11vnc: move recipe from oe-core
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
X-List-Received-Date: Fri, 16 Oct 2015 14:24:25 -0000

x11vnc will be configured to use the external libvncserver which is
added to meta-oe. Since oe-core recipes should not depend on meta-oe
recipes, we move x11vnc to meta-oe.

Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
---
 .../recipes-graphics/x11vnc/files/endian-fix.patch | 24 +++++++++++++++++++++
 .../x11vnc/files/starting-fix.patch                | 25 ++++++++++++++++++++++
 meta-oe/recipes-graphics/x11vnc/x11vnc_0.9.13.bb   | 25 ++++++++++++++++++++++
 3 files changed, 74 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/x11vnc/files/endian-fix.patch
 create mode 100644 meta-oe/recipes-graphics/x11vnc/files/starting-fix.patch
 create mode 100644 meta-oe/recipes-graphics/x11vnc/x11vnc_0.9.13.bb

diff --git a/meta-oe/recipes-graphics/x11vnc/files/endian-fix.patch b/meta-oe/recipes-graphics/x11vnc/files/endian-fix.patch
new file mode 100644
index 0000000..f2a538b
--- /dev/null
+++ b/meta-oe/recipes-graphics/x11vnc/files/endian-fix.patch
@@ -0,0 +1,24 @@
+libvncserver: replace LIBVNCSERVER_WORDS_BIGENDIAN with WORDS_BIGENDIAN
+
+since macro AC_C_BIGENDIAN is used in autoconf and WORDS_BIGENDIAN is
+automatically set for different arch, it is better to use WORDS_BIGENDIAN
+instead of LIBVNCSERVER_WORDS_BIGENDIAN, which cuase issue in mips.
+
+Signed-off-by: Yu Ke <ke.yu@intel.com>
+
+Upstream-Status: Pending
+
+diff --git a/libvncserver/main.c b/libvncserver/main.c
+index b6bd930..8bbb7bf 100644
+--- a/libvncserver/main.c
++++ b/libvncserver/main.c
+@@ -47,7 +47,7 @@ static MUTEX(extMutex);
+ 
+ static int rfbEnableLogging=1;
+ 
+-#ifdef LIBVNCSERVER_WORDS_BIGENDIAN
++#ifdef WORDS_BIGENDIAN
+ char rfbEndianTest = (1==0);
+ #else
+ char rfbEndianTest = (1==1);
+
diff --git a/meta-oe/recipes-graphics/x11vnc/files/starting-fix.patch b/meta-oe/recipes-graphics/x11vnc/files/starting-fix.patch
new file mode 100644
index 0000000..f62e405
--- /dev/null
+++ b/meta-oe/recipes-graphics/x11vnc/files/starting-fix.patch
@@ -0,0 +1,25 @@
+"-gui" & "-rfbport" require "wish" installed, or else x11vnc fails to start.
+Removing these 2 parameters makes x11vnc works well on poky sato image.
+
+Add also -skip_lockkeys option to ignore all Caps_Lock, Shift_Lock, Num_Lock,
+Scroll_Lock keysyms received from viewers, in order to leave the lock state on
+the server side unchanged. Yet, the keys will appear correctly.
+
+Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
+Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
+
+Upstream-Status: Inappropriate [configuration]
+
+Index: x11vnc-0.9.12/x11vnc/x11vnc.desktop
+===================================================================
+--- x11vnc-0.9.12.orig/x11vnc/x11vnc.desktop	2011-03-03 10:33:18.000000000 +0800
++++ x11vnc-0.9.12/x11vnc/x11vnc.desktop	2011-03-03 10:35:20.000000000 +0800
+@@ -1,7 +1,7 @@
+ [Desktop Entry]
+ Name=X11VNC Server
+ Comment=Share this desktop by VNC
+-Exec=x11vnc -gui tray=setpass -rfbport PROMPT -bg -o %%HOME/.x11vnc.log.%%VNCDISPLAY
++Exec=x11vnc -bg -rfbport 5900 -skip_lockkeys -o %%HOME/.x11vnc.log.%%VNCDISPLAY
+ Icon=computer
+ Terminal=false
+ Type=Application
diff --git a/meta-oe/recipes-graphics/x11vnc/x11vnc_0.9.13.bb b/meta-oe/recipes-graphics/x11vnc/x11vnc_0.9.13.bb
new file mode 100644
index 0000000..ec0241f
--- /dev/null
+++ b/meta-oe/recipes-graphics/x11vnc/x11vnc_0.9.13.bb
@@ -0,0 +1,25 @@
+SUMMARY = "Exports your X session on-the-fly via VNC"
+HOMEPAGE = "http://www.karlrunge.com/x11vnc/"
+
+SECTION = "x11/utils"
+AUTHOR = "Karl Runge"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=361b6b837cad26c6900a926b62aada5f \
+                    file://x11vnc/x11vnc.h;endline=33;md5=6f95dc6535467d7ee1563fd434fb372e"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/libvncserver/x11vnc/${PV}/x11vnc-${PV}.tar.gz\
+           file://starting-fix.patch \
+           file://endian-fix.patch "
+
+SRC_URI[md5sum] = "a372ec4fe8211221547b1c108cf56e4c"
+SRC_URI[sha256sum] = "f6829f2e629667a5284de62b080b13126a0736499fe47cdb447aedb07a59f13b"
+
+DEPENDS = "openssl virtual/libx11 libxext jpeg zlib libxfixes libxrandr libxdamage libxtst"
+
+inherit autotools-brokensep distro_features_check
+# depends on virtual/libx11
+REQUIRED_DISTRO_FEATURES = "x11"
+
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'zeroconf', 'avahi', '', d)}"
+PACKAGECONFIG[avahi] = "--with-avahi,--without-avahi,avahi"
+PACKAGECONFIG[xinerama] = "--with-xinerama,--without-xinerama,libxinerama"
-- 
2.1.4


