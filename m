Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1MvXVp-0006jX-MD
	for openembedded-devel@openembedded.org; Wed, 07 Oct 2009 16:29:08 +0200
Received: (qmail 22314 invoked by uid 813007); 7 Oct 2009 14:28:17 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 7 Oct 2009 14:28:17 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  7 Oct 2009 16:28:16 +0200
Message-Id: <1254925696-8813-1-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.6.4.3
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [STABLE][PATCH] xserver-common: added 1.30 + patches
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
X-List-Received-Date: Wed, 07 Oct 2009 14:29:09 -0000

xserver-common 1.30 is experimental, do not use by default
xserver-common 1.30: -screen option is only for Kdrive
xserver-common 1.30: another set of updates

0024 moves functionality of /etc/X11/Xserver to separate file (except
     running X11 server) - this allows to use xserver-common package in
     systems where xinit is used to run X11 session as root (look at
     xserver-nodm-init package)

0025 moves xmodmap files to /etc/X11/xmodmap/ and installs
     xserver-common file created in previous patch.

0026 fixes path to default.xmodmap file

xserver-common: recommend xtscal (works without it but needs for calibration)
---
 .../0018-zaurus-fixed-machine-names.patch          |   35 ++
 .../0019-keymap-fixed-machine-names.patch          |   59 +++
 .../0020-keymap-fixed-machine-names-again.patch    |   50 +++
 ...roduced-MOUSE-variable-for-mouse-argument.patch |   63 +++
 .../0022-xserver-fix-syntax-error.patch            |   27 ++
 ...vide-screen-argument-only-for-non-X.org-s.patch |   27 ++
 ...e-nearly-whole-functionality-to-xserver-c.patch |  415 ++++++++++++++++++++
 ...efile-move-modmaps-install-xserver-common.patch |   32 ++
 ...98keymap-fixup-fixed-path-to-xmodmap-file.patch |   25 ++
 recipes/xserver-common/xserver-common_1.30.bb      |   31 ++
 10 files changed, 764 insertions(+), 0 deletions(-)
 create mode 100644 recipes/xserver-common/xserver-common-1.30/0018-zaurus-fixed-machine-names.patch
 create mode 100644 recipes/xserver-common/xserver-common-1.30/0019-keymap-fixed-machine-names.patch
 create mode 100644 recipes/xserver-common/xserver-common-1.30/0020-keymap-fixed-machine-names-again.patch
 create mode 100644 recipes/xserver-common/xserver-common-1.30/0021-xserver-introduced-MOUSE-variable-for-mouse-argument.patch
 create mode 100644 recipes/xserver-common/xserver-common-1.30/0022-xserver-fix-syntax-error.patch
 create mode 100644 recipes/xserver-common/xserver-common-1.30/0023-Xserver-provide-screen-argument-only-for-non-X.org-s.patch
 create mode 100644 recipes/xserver-common/xserver-common-1.30/0024-Xserver-move-nearly-whole-functionality-to-xserver-c.patch
 create mode 100644 recipes/xserver-common/xserver-common-1.30/0025-Makefile-move-modmaps-install-xserver-common.patch
 create mode 100644 recipes/xserver-common/xserver-common-1.30/0026-98keymap-fixup-fixed-path-to-xmodmap-file.patch
 create mode 100644 recipes/xserver-common/xserver-common_1.30.bb

diff --git a/recipes/xserver-common/xserver-common-1.30/0018-zaurus-fixed-machine-names.patch b/recipes/xserver-common/xserver-common-1.30/0018-zaurus-fixed-machine-names.patch
new file mode 100644
index 0000000..d6d6aa8
--- /dev/null
+++ b/recipes/xserver-common/xserver-common-1.30/0018-zaurus-fixed-machine-names.patch
@@ -0,0 +1,35 @@
+From a287e6414a765926fc7b169617bc1174370bc183 Mon Sep 17 00:00:00 2001
+From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
+Date: Mon, 20 Jul 2009 18:57:56 +0200
+Subject: [PATCH 18/22] zaurus: fixed machine names
+
+
+Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
+---
+ X11/Xinit.d/11zaurus |    4 ++--
+ 1 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/X11/Xinit.d/11zaurus b/X11/Xinit.d/11zaurus
+index 02090be..54ea6f5 100644
+--- a/X11/Xinit.d/11zaurus
++++ b/X11/Xinit.d/11zaurus
+@@ -13,14 +13,14 @@ fi
+ $CHCK -e
+ if [ $? = 12 ]; then
+    case `machine_id` in
+-   	*Spitz | *Akita | *Borzoi)
++   	*spitz | *akita | *borzoi)
+    		DIRECTION="normal" ;;
+         *)
+                 DIRECTION="right" ;;
+    esac
+ else
+    case `machine_id` in
+-   	*Spitz | *Akita | *Borzoi)
++   	*spitz | *akita | *borzoi)
+ 		# Xfbdev needs to settle
+ 		sleep 2
+    		DIRECTION="right" ;;
+-- 
+1.6.3.3
+
diff --git a/recipes/xserver-common/xserver-common-1.30/0019-keymap-fixed-machine-names.patch b/recipes/xserver-common/xserver-common-1.30/0019-keymap-fixed-machine-names.patch
new file mode 100644
index 0000000..9a4e561
--- /dev/null
+++ b/recipes/xserver-common/xserver-common-1.30/0019-keymap-fixed-machine-names.patch
@@ -0,0 +1,59 @@
+From e564699c60d69148e19150dc9d2105734b1df7e1 Mon Sep 17 00:00:00 2001
+From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
+Date: Mon, 20 Jul 2009 18:58:54 +0200
+Subject: [PATCH 19/22] keymap: fixed machine names
+
+
+Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
+---
+ X11/Xinit.d/12keymap |   18 +++++++++---------
+ 1 files changed, 9 insertions(+), 9 deletions(-)
+
+diff --git a/X11/Xinit.d/12keymap b/X11/Xinit.d/12keymap
+index 0a909d0..cfa9750 100644
+--- a/X11/Xinit.d/12keymap
++++ b/X11/Xinit.d/12keymap
+@@ -1,31 +1,31 @@
+ #!/bin/sh
+ 
+-MACHINE=`awk 'BEGIN { FS=": " } /Hardware/ { print $2 } ' </proc/cpuinfo`
++. /etc/init.d/functions
+ 
+ # since kdrive 1.4 there is no default keymap in server
+ xmodmap - </etc/X11/xmodmap/default.xmodmap
+ 
+-case $MACHINE in
+-	"SHARP Shepherd" | "SHARP Husky" | "SHARP Corgi")
++case `machine_id` in
++	"sharp shepherd" | "sharp husky" | "sharp corgi")
+ 		xmodmap - < /etc/X11/xmodmap/shepherd.xmodmap
+ 		;;
+-	"SHARP Akita" | "SHARP Borzoi" | "SHARP Spitz")
++	"sharp akita" | "sharp borzoi" | "sharp spitz")
+ 		xmodmap - < /etc/X11/xmodmap/slcXXXX.xmodmap
+ 		;;				
+-	"SHARP Poodle")
++	"sharp poodle")
+ 		xmodmap - < /etc/X11/xmodmap/poodle.xmodmap
+ 		;;
+-        "Sharp-Collie")
++        "sharp-collie")
+                 xmodmap - < /etc/X11/xmodmap/collie.xmodmap
+                 ;;
+-	"HP iPAQ h6300")
++	"hp ipaq h6300")
+ 		xmodmap - < /etc/X11/xmodmap/h6300.xmodmap
+ 		;;
+-	"TI-OSK")
++	"ti-osk")
+ 		xmodmap - < /etc/X11/xmodmap/omap5912osk.xmodmap
+ 		;;
+ 	# All the rest of keyboardless PDA machines use common buttonmap
+-	"Simpad" | "HP iPAQ"* | "Asus MyPal"*)
++	"simpad" | "hp ipaq"* | "asus mypal"*)
+ 		xmodmap - < /etc/X11/xmodmap/keyboardless.xmodmap
+ 		;;
+ esac
+-- 
+1.6.3.3
+
diff --git a/recipes/xserver-common/xserver-common-1.30/0020-keymap-fixed-machine-names-again.patch b/recipes/xserver-common/xserver-common-1.30/0020-keymap-fixed-machine-names-again.patch
new file mode 100644
index 0000000..f14f5ae
--- /dev/null
+++ b/recipes/xserver-common/xserver-common-1.30/0020-keymap-fixed-machine-names-again.patch
@@ -0,0 +1,50 @@
+From f216da13941685575786e617c2cc072edd5b210c Mon Sep 17 00:00:00 2001
+From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
+Date: Mon, 20 Jul 2009 19:01:08 +0200
+Subject: [PATCH 20/22] keymap: fixed machine names again
+
+
+Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
+---
+ X11/Xinit.d/12keymap |   10 +++++-----
+ 1 files changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/X11/Xinit.d/12keymap b/X11/Xinit.d/12keymap
+index cfa9750..7eac296 100644
+--- a/X11/Xinit.d/12keymap
++++ b/X11/Xinit.d/12keymap
+@@ -6,26 +6,26 @@
+ xmodmap - </etc/X11/xmodmap/default.xmodmap
+ 
+ case `machine_id` in
+-	"sharp shepherd" | "sharp husky" | "sharp corgi")
++	"sharp_shepherd" | "sharp_husky" | "sharp_corgi")
+ 		xmodmap - < /etc/X11/xmodmap/shepherd.xmodmap
+ 		;;
+-	"sharp akita" | "sharp borzoi" | "sharp spitz")
++	"sharp_akita" | "sharp_borzoi" | "sharp_spitz")
+ 		xmodmap - < /etc/X11/xmodmap/slcXXXX.xmodmap
+ 		;;				
+-	"sharp poodle")
++	"sharp_poodle")
+ 		xmodmap - < /etc/X11/xmodmap/poodle.xmodmap
+ 		;;
+         "sharp-collie")
+                 xmodmap - < /etc/X11/xmodmap/collie.xmodmap
+                 ;;
+-	"hp ipaq h6300")
++	"hp_ipaq_h6300")
+ 		xmodmap - < /etc/X11/xmodmap/h6300.xmodmap
+ 		;;
+ 	"ti-osk")
+ 		xmodmap - < /etc/X11/xmodmap/omap5912osk.xmodmap
+ 		;;
+ 	# All the rest of keyboardless PDA machines use common buttonmap
+-	"simpad" | "hp ipaq"* | "asus mypal"*)
++	"simpad" | "hp_ipaq"* | "asus_mypal"*)
+ 		xmodmap - < /etc/X11/xmodmap/keyboardless.xmodmap
+ 		;;
+ esac
+-- 
+1.6.3.3
+
diff --git a/recipes/xserver-common/xserver-common-1.30/0021-xserver-introduced-MOUSE-variable-for-mouse-argument.patch b/recipes/xserver-common/xserver-common-1.30/0021-xserver-introduced-MOUSE-variable-for-mouse-argument.patch
new file mode 100644
index 0000000..4d9bfa2
--- /dev/null
+++ b/recipes/xserver-common/xserver-common-1.30/0021-xserver-introduced-MOUSE-variable-for-mouse-argument.patch
@@ -0,0 +1,63 @@
+From 3ada7e341334766f6be27164dbb43a3715faf580 Mon Sep 17 00:00:00 2001
+From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
+Date: Tue, 21 Jul 2009 13:36:17 +0200
+Subject: [PATCH 21/22] xserver: introduced MOUSE variable for "-mouse" argument
+
+MOUSE is not passed in ARGS if Xorg server is used as it is KDrive only.
+
+Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
+---
+ X11/Xserver |   13 +++++++++----
+ 1 files changed, 9 insertions(+), 4 deletions(-)
+
+diff --git a/X11/Xserver b/X11/Xserver
+index 25ce816..e7e88d9 100755
+--- a/X11/Xserver
++++ b/X11/Xserver
+@@ -46,19 +46,20 @@ export XSERVER_DEFAULT_ORIENTATION=normal
+ 
+ ARGS="-br -pn $INPUT_EXTRA_ARGS"
+ DPI="100"
++MOUSE=""
+ 
+ # use ucb 1x00 touchscreen if present
+ if [ -z "$TSLIB_TSDEVICE" ] && [ -e /dev/touchscreen/ucb1x00 ]; then
+-  ARGS="$ARGS -mouse /dev/touchscreen/ucb1x00"
++  MOUSE="-mouse /dev/touchscreen/ucb1x00"
+ fi
+ 
+ # kdrive 1.4 onwards needs -mouse args
+ # Xorg doesn't support "-mouse" option, and uses /dev/input/mice automatically
+ if [ -e "$TSLIB_TSDEVICE" ] ; then
+-  ARGS="$ARGS -mouse tslib"
++  MOUSE="-mouse tslib"
+ else
+   if  [ -e /dev/input/mice ] && [ "$XSERVER" != "Xorg" ] ; then
+-    ARGS="$ARGS -mouse mouse"
++    MOUSE="-mouse mouse"
+   fi
+ fi
+ 
+@@ -103,7 +104,7 @@ else
+ 		    ARGS="$ARGS -rgba rgb"
+ 		    DPI="100" ;;
+ 	    "generic_omap1510/1610/1710")
+-		    ARGS="$ARGS -mouse /dev/input/event0"
++		    MOUSE="-mouse /dev/input/event0"
+ 		    DPI="220" ;;
+ 	    "ti-osk")
+ 		    DPI="100" ;;
+@@ -183,6 +184,10 @@ else
+     esac
+ fi
+ 
++if [ "$XSERVER" != "Xorg" ] ; then
++    ARGS="$ARGS $MOUSE"
++fi
++
+ echo "tslib: $TSLIB_TSDEVICE"
+ echo "exec $XSERVER $ARGS -dpi $DPI $*"
+ exec $XSERVER $ARGS -dpi $DPI $*
+-- 
+1.6.3.3
+
diff --git a/recipes/xserver-common/xserver-common-1.30/0022-xserver-fix-syntax-error.patch b/recipes/xserver-common/xserver-common-1.30/0022-xserver-fix-syntax-error.patch
new file mode 100644
index 0000000..e96fabf
--- /dev/null
+++ b/recipes/xserver-common/xserver-common-1.30/0022-xserver-fix-syntax-error.patch
@@ -0,0 +1,27 @@
+From 00cbc2b27c7df84d7837760e05ac13b686e6bfa9 Mon Sep 17 00:00:00 2001
+From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
+Date: Thu, 23 Jul 2009 12:04:12 +0200
+Subject: [PATCH 22/22] xserver: fix syntax error
+
+
+Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
+---
+ X11/Xserver |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/X11/Xserver b/X11/Xserver
+index e7e88d9..3d93a0a 100755
+--- a/X11/Xserver
++++ b/X11/Xserver
+@@ -63,7 +63,7 @@ else
+   fi
+ fi
+ 
+-if [ -e /etc/default/xserver ]
++if [ -e /etc/default/xserver ] ; then
+     . /etc/default/xserver
+ else
+     # start off server in conventional location.
+-- 
+1.6.3.3
+
diff --git a/recipes/xserver-common/xserver-common-1.30/0023-Xserver-provide-screen-argument-only-for-non-X.org-s.patch b/recipes/xserver-common/xserver-common-1.30/0023-Xserver-provide-screen-argument-only-for-non-X.org-s.patch
new file mode 100644
index 0000000..e80cbac
--- /dev/null
+++ b/recipes/xserver-common/xserver-common-1.30/0023-Xserver-provide-screen-argument-only-for-non-X.org-s.patch
@@ -0,0 +1,27 @@
+From 0ea66d0827131952dc1069f1ea3cb317b831df55 Mon Sep 17 00:00:00 2001
+From: Marcin Juszkiewicz <hrw@koansoftware.com>
+Date: Fri, 28 Aug 2009 18:47:55 +0200
+Subject: [PATCH 1/1] Xserver: provide -screen argument only for non-X.org servers
+
+---
+ X11/Xserver |    4 +++-
+ 1 files changed, 3 insertions(+), 1 deletions(-)
+
+diff --git a/X11/Xserver b/X11/Xserver
+index 3d93a0a..583cd0d 100755
+--- a/X11/Xserver
++++ b/X11/Xserver
+@@ -179,7 +179,9 @@ else
+ 			# It is a device we do not know about, in which case we force
+ 			# kdrive to use the current framebuffer geometry -- otherwise
+ 			# it will default to trying to achieve 1024x768
+-			ARGS="$ARGS -screen ${SCREEN_SIZE}"
++			if [ "$XSERVER" != "Xorg" ] ; then
++			    ARGS="$ARGS -screen ${SCREEN_SIZE}"
++			fi
+ 		    fi
+     esac
+ fi
+-- 
+1.6.3.3
+
diff --git a/recipes/xserver-common/xserver-common-1.30/0024-Xserver-move-nearly-whole-functionality-to-xserver-c.patch b/recipes/xserver-common/xserver-common-1.30/0024-Xserver-move-nearly-whole-functionality-to-xserver-c.patch
new file mode 100644
index 0000000..d00e1a7
--- /dev/null
+++ b/recipes/xserver-common/xserver-common-1.30/0024-Xserver-move-nearly-whole-functionality-to-xserver-c.patch
@@ -0,0 +1,415 @@
+From dc0efcbc35a7e0c5b5f908fb4d27a76c4ee304ac Mon Sep 17 00:00:00 2001
+From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
+Date: Mon, 31 Aug 2009 12:05:17 +0200
+Subject: [PATCH 1/1] Xserver: move nearly whole functionality to xserver-common
+
+/etc/X11/Xserver script now use /etc/X11/xserver-common one to get
+values for XSERVER, ARGS, DPI variables.
+
+This split allows to use xserver-common for other X11 startup systems.
+---
+ X11/Xserver        |  188 +--------------------------------------------------
+ X11/xserver-common |  191 ++++++++++++++++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 192 insertions(+), 187 deletions(-)
+ create mode 100644 X11/xserver-common
+
+diff --git a/X11/Xserver b/X11/Xserver
+index 583cd0d..d53e1c9 100755
+--- a/X11/Xserver
++++ b/X11/Xserver
+@@ -1,194 +1,8 @@
+ #!/bin/sh
+ #
+ 
+-XSERVER=Xfbdev
+-BINDIR=/usr/bin
++. /etc/X11/xserver-common
+ 
+-if [ -f $BINDIR/Xepson ]; then
+-  XSERVER=Xepson
+-fi
+-if [ -f $BINDIR/Xorg ]; then
+-  XSERVER=Xorg
+-fi
+-if [ -f $BINDIR/Xomap ]; then
+-  XSERVER=Xomap
+-fi
+-if [ -f $BINDIR/Xw100 ]; then
+-  XSERVER=Xw100
+-fi
+-if [ -f $BINDIR/Xvesa ]; then
+-  XSERVER=Xvesa
+-fi
+-if [ -f $BINDIR/Ximageon ]; then
+-  XSERVER=Ximageon
+-fi
+-if [ -f $BINDIR/Xglamo ]; then
+-  XSERVER=Xglamo
+-fi
+-
+-if [ -f /etc/profile ]; then
+-  . /etc/profile
+-fi
+-
+-. /etc/init.d/functions
+-
+-fallback_screen_arg() {
+-    geom=`fbset | grep geometry`
+-    w=`echo $geom | awk '{ print $2 }'`
+-    h=`echo $geom | awk '{ print $3 }'`
+-    b=`echo $geom | awk '{ print $6 }'`
+-    echo -n "${w}x${h}x${b}"
+-}
+-
+-SCREEN_SIZE=`fallback_screen_arg`
+-export USER=root
+-export XSERVER_DEFAULT_ORIENTATION=normal
+-
+-ARGS="-br -pn $INPUT_EXTRA_ARGS"
+-DPI="100"
+-MOUSE=""
+-
+-# use ucb 1x00 touchscreen if present
+-if [ -z "$TSLIB_TSDEVICE" ] && [ -e /dev/touchscreen/ucb1x00 ]; then
+-  MOUSE="-mouse /dev/touchscreen/ucb1x00"
+-fi
+-
+-# kdrive 1.4 onwards needs -mouse args
+-# Xorg doesn't support "-mouse" option, and uses /dev/input/mice automatically
+-if [ -e "$TSLIB_TSDEVICE" ] ; then
+-  MOUSE="-mouse tslib"
+-else
+-  if  [ -e /dev/input/mice ] && [ "$XSERVER" != "Xorg" ] ; then
+-    MOUSE="-mouse mouse"
+-  fi
+-fi
+-
+-if [ -e /etc/default/xserver ] ; then
+-    . /etc/default/xserver
+-else
+-    # start off server in conventional location.
+-    case `machine_id` in
+-	    "aml_m8050")
+-		    ARGS="$ARGS  -screen 320x240@270"
+-		    DPI="100" ;;
+-	    "hp_ipaq_h3100" | "hp_ipaq_h3800")
+-		    ARGS="$ARGS -rgba vrgb -screen 320x240@90"
+-		    DPI="100" ;;
+-	    "hp_ipaq_h3600" | "hp_ipaq_h3700" | "hp_ipaq_h3900")
+-		    ARGS="$ARGS -rgba vbgr -screen 320x240@270"
+-		    DPI="100" ;;
+-	    "hp_ipaq_h5400" | "hp_ipaq_h2200")
+-		    ARGS="$ARGS -rgba rgb"
+-		    DPI="100" ;;
+-	    "hp_ipaq_hx4700")
+-		    DPI="200" ;;
+-	    "ramses")
+-		    # What is this "vt2" in aid of?
+-		    ARGS="$ARGS -rgba vrgb -screen 320x240@90 vt2"
+-		    DPI="100" ;;
+-	    *poodle)
+-		    ARGS="$ARGS -rgba vrgb -screen 320x240@270"
+-		    DPI="100" ;;
+-	    # both 'Sharp-Collie' and just 'Collie' have been reported
+-	    *collie)
+-		    ARGS="$ARGS -rgba vrgb -screen 320x240@270"
+-		    DPI="100" ;;
+-	    "sharp_shepherd" | "sharp_husky" | "sharp_corgi")
+-		    ARGS="$ARGS -rgba rgb"
+-		    DPI="200" ;;
+-	    "sharp_spitz" | "sharp_akita" | "sharp_borzoi")
+-		    export XSERVER_DEFAULT_ORIENTATION="normal"
+-		    ARGS="$ARGS -rgba rgb -screen 480x640"
+-		    DPI="200" ;;
+-	    "simpad")
+-		    ARGS="$ARGS -rgba rgb"
+-		    DPI="100" ;;
+-	    "generic_omap1510/1610/1710")
+-		    MOUSE="-mouse /dev/input/event0"
+-		    DPI="220" ;;
+-	    "ti-osk")
+-		    DPI="100" ;;
+-	    "cellon_c8000_board")
+-		    ARGS="$ARGS -screen ${SCREEN_SIZE},10,1"
+-		    DPI="100" ;;
+-	    "htc_magician")
+-		    DPI="142" ;;
+-	    "htc_universal")
+-		    ARGS="$ARGS -screen 480x640@270"
+-		    DPI="100" ;;
+-	    "htc_tornado")
+-		    ARGS="$ARGS -hide-cursor"
+-		    DPI="100" ;;
+-	    "generic_omap1510/1610/1710")
+-		    ARGS="$ARGS -screen ${SCREEN_SIZE}"
+-		    DPI="225" ;;
+-	    "nokia_n800" | "nokia_rx-44" | "nokia_n770")
+-		    ARGS="$ARGS -screen ${SCREEN_SIZE}"
+-		    DPI="225" ;;
+-	    "gta01" )
+-		    DPI="285"
+-		    if [ "$XSERVER" != "Xorg" ] ; then
+-			    ARGS="$ARGS -screen 480x640"
+-		    fi
+-		    ;;
+-	    "gta02")
+-		    DPI="285"
+-		    if [ "$XSERVER" != "Xorg" ] ; then
+-			    ARGS="$ARGS -screen ${SCREEN_SIZE}"
+-		    fi
+-		    ;;
+-	    "motorola_ezx_platform")
+-		    ARGS="$ARGS -screen 240x320"
+-		    DPI="170" ;;
+-	    "arm-integratorcp" | "arm-versatile_pb")
+-		    ARGS="$ARGS -rgba vrgb" ;;
+-	    "compulab_cm-x270")
+-		    modprobe mbxfb
+-		    ARGS="$ARGS -fb /dev/fb1" ;;
+-	    "boundary_devices_neon_board")
+-		    ARGS="$ARGS -screen ${SCREEN_SIZE}"
+-		    DPI="100" ;;
+-	    "hoeft&wessel_hw90350")
+-		    ARGS="$ARGS -screen ${SCREEN_SIZE}"
+-		    DPI="100" ;;
+-	    "hoeft&wessel_hw90250")
+-		    ARGS="$ARGS -screen 240x320@90"
+-		    DPI="100" ;;
+-	    "mini2440")
+-		    ARGS="$ARGS -screen ${SCREEN_SIZE}"
+-		    DPI="100" ;;
+-	    "palm_treo_650")
+-	            DPI="181"
+-		    ARGS="$ARGS -screen 320x320 -hide-cursor" ;;
+-	    "glofiish_m800")
+-	            DPI="285"
+-		    ARGS="$ARGS -screen ${SCREEN_SIZE} -hide-cursor vt1" ;;
+-	    "freescale_mx21ads")
+-	    # That's what /proc/cpuinfo shows as hardware on the chumby
+-	            DPI="121"
+-		    ARGS="$ARGS -screen 320x240 -hide-cursor" ;;
+-
+-            # this is to rotate X display properly, tested with display TX09D71VM1CCA
+-            ronetix*pm9261*  | ronetix*pm9263*)
+-         	    ARGS="$ARGS -screen 240/54x320/81@90x16" ;;
+-	    # This is a fallback for PCs
+-	    "")
+-		    if [ -f $BINDIR/Xvesa ]; then
+-			    ARGS="$ARGS -mode 0x0114"
+-		    else
+-			# It is a device we do not know about, in which case we force
+-			# kdrive to use the current framebuffer geometry -- otherwise
+-			# it will default to trying to achieve 1024x768
+-			if [ "$XSERVER" != "Xorg" ] ; then
+-			    ARGS="$ARGS -screen ${SCREEN_SIZE}"
+-			fi
+-		    fi
+-    esac
+-fi
+-
+-if [ "$XSERVER" != "Xorg" ] ; then
+-    ARGS="$ARGS $MOUSE"
+-fi
+ 
+ echo "tslib: $TSLIB_TSDEVICE"
+ echo "exec $XSERVER $ARGS -dpi $DPI $*"
+diff --git a/X11/xserver-common b/X11/xserver-common
+new file mode 100644
+index 0000000..29d152f
+--- /dev/null
++++ b/X11/xserver-common
+@@ -0,0 +1,191 @@
++#!/bin/sh
++#
++
++XSERVER=Xfbdev
++BINDIR=/usr/bin
++
++if [ -f $BINDIR/Xepson ]; then
++  XSERVER=Xepson
++fi
++if [ -f $BINDIR/Xorg ]; then
++  XSERVER=Xorg
++fi
++if [ -f $BINDIR/Xomap ]; then
++  XSERVER=Xomap
++fi
++if [ -f $BINDIR/Xw100 ]; then
++  XSERVER=Xw100
++fi
++if [ -f $BINDIR/Xvesa ]; then
++  XSERVER=Xvesa
++fi
++if [ -f $BINDIR/Ximageon ]; then
++  XSERVER=Ximageon
++fi
++if [ -f $BINDIR/Xglamo ]; then
++  XSERVER=Xglamo
++fi
++
++if [ -f /etc/profile ]; then
++  . /etc/profile
++fi
++
++. /etc/init.d/functions
++
++fallback_screen_arg() {
++    geom=`fbset | grep geometry`
++    w=`echo $geom | awk '{ print $2 }'`
++    h=`echo $geom | awk '{ print $3 }'`
++    b=`echo $geom | awk '{ print $6 }'`
++    echo -n "${w}x${h}x${b}"
++}
++
++SCREEN_SIZE=`fallback_screen_arg`
++export USER=root
++export XSERVER_DEFAULT_ORIENTATION=normal
++
++ARGS="-br -pn $INPUT_EXTRA_ARGS"
++DPI="100"
++MOUSE=""
++
++# use ucb 1x00 touchscreen if present
++if [ -z "$TSLIB_TSDEVICE" ] && [ -e /dev/touchscreen/ucb1x00 ]; then
++  MOUSE="-mouse /dev/touchscreen/ucb1x00"
++fi
++
++# kdrive 1.4 onwards needs -mouse args
++# Xorg doesn't support "-mouse" option, and uses /dev/input/mice automatically
++if [ -e "$TSLIB_TSDEVICE" ] ; then
++  MOUSE="-mouse tslib"
++else
++  if  [ -e /dev/input/mice ] && [ "$XSERVER" != "Xorg" ] ; then
++    MOUSE="-mouse mouse"
++  fi
++fi
++
++if [ -e /etc/default/xserver ] ; then
++    . /etc/default/xserver
++else
++    # start off server in conventional location.
++    case `machine_id` in
++	    "aml_m8050")
++		    ARGS="$ARGS  -screen 320x240@270"
++		    DPI="100" ;;
++	    "hp_ipaq_h3100" | "hp_ipaq_h3800")
++		    ARGS="$ARGS -rgba vrgb -screen 320x240@90"
++		    DPI="100" ;;
++	    "hp_ipaq_h3600" | "hp_ipaq_h3700" | "hp_ipaq_h3900")
++		    ARGS="$ARGS -rgba vbgr -screen 320x240@270"
++		    DPI="100" ;;
++	    "hp_ipaq_h5400" | "hp_ipaq_h2200")
++		    ARGS="$ARGS -rgba rgb"
++		    DPI="100" ;;
++	    "hp_ipaq_hx4700")
++		    DPI="200" ;;
++	    "ramses")
++		    # What is this "vt2" in aid of?
++		    ARGS="$ARGS -rgba vrgb -screen 320x240@90 vt2"
++		    DPI="100" ;;
++	    *poodle)
++		    ARGS="$ARGS -rgba vrgb -screen 320x240@270"
++		    DPI="100" ;;
++	    # both 'Sharp-Collie' and just 'Collie' have been reported
++	    *collie)
++		    ARGS="$ARGS -rgba vrgb -screen 320x240@270"
++		    DPI="100" ;;
++	    "sharp_shepherd" | "sharp_husky" | "sharp_corgi")
++		    ARGS="$ARGS -rgba rgb"
++		    DPI="200" ;;
++	    "sharp_spitz" | "sharp_akita" | "sharp_borzoi")
++		    export XSERVER_DEFAULT_ORIENTATION="normal"
++		    ARGS="$ARGS -rgba rgb -screen 480x640"
++		    DPI="200" ;;
++	    "simpad")
++		    ARGS="$ARGS -rgba rgb"
++		    DPI="100" ;;
++	    "generic_omap1510/1610/1710")
++		    MOUSE="-mouse /dev/input/event0"
++		    DPI="220" ;;
++	    "ti-osk")
++		    DPI="100" ;;
++	    "cellon_c8000_board")
++		    ARGS="$ARGS -screen ${SCREEN_SIZE},10,1"
++		    DPI="100" ;;
++	    "htc_magician")
++		    DPI="142" ;;
++	    "htc_universal")
++		    ARGS="$ARGS -screen 480x640@270"
++		    DPI="100" ;;
++	    "htc_tornado")
++		    ARGS="$ARGS -hide-cursor"
++		    DPI="100" ;;
++	    "generic_omap1510/1610/1710")
++		    ARGS="$ARGS -screen ${SCREEN_SIZE}"
++		    DPI="225" ;;
++	    "nokia_n800" | "nokia_rx-44" | "nokia_n770")
++		    ARGS="$ARGS -screen ${SCREEN_SIZE}"
++		    DPI="225" ;;
++	    "gta01" )
++		    DPI="285"
++		    if [ "$XSERVER" != "Xorg" ] ; then
++			    ARGS="$ARGS -screen 480x640"
++		    fi
++		    ;;
++	    "gta02")
++		    DPI="285"
++		    if [ "$XSERVER" != "Xorg" ] ; then
++			    ARGS="$ARGS -screen ${SCREEN_SIZE}"
++		    fi
++		    ;;
++	    "motorola_ezx_platform")
++		    ARGS="$ARGS -screen 240x320"
++		    DPI="170" ;;
++	    "arm-integratorcp" | "arm-versatile_pb")
++		    ARGS="$ARGS -rgba vrgb" ;;
++	    "compulab_cm-x270")
++		    modprobe mbxfb
++		    ARGS="$ARGS -fb /dev/fb1" ;;
++	    "boundary_devices_neon_board")
++		    ARGS="$ARGS -screen ${SCREEN_SIZE}"
++		    DPI="100" ;;
++	    "hoeft&wessel_hw90350")
++		    ARGS="$ARGS -screen ${SCREEN_SIZE}"
++		    DPI="100" ;;
++	    "hoeft&wessel_hw90250")
++		    ARGS="$ARGS -screen 240x320@90"
++		    DPI="100" ;;
++	    "mini2440")
++		    ARGS="$ARGS -screen ${SCREEN_SIZE}"
++		    DPI="100" ;;
++	    "palm_treo_650")
++	            DPI="181"
++		    ARGS="$ARGS -screen 320x320 -hide-cursor" ;;
++	    "glofiish_m800")
++	            DPI="285"
++		    ARGS="$ARGS -screen ${SCREEN_SIZE} -hide-cursor vt1" ;;
++	    "freescale_mx21ads")
++	    # That's what /proc/cpuinfo shows as hardware on the chumby
++	            DPI="121"
++		    ARGS="$ARGS -screen 320x240 -hide-cursor" ;;
++
++            # this is to rotate X display properly, tested with display TX09D71VM1CCA
++            ronetix*pm9261*  | ronetix*pm9263*)
++         	    ARGS="$ARGS -screen 240/54x320/81@90x16" ;;
++	    # This is a fallback for PCs
++	    "")
++		    if [ -f $BINDIR/Xvesa ]; then
++			    ARGS="$ARGS -mode 0x0114"
++		    else
++			# It is a device we do not know about, in which case we force
++			# kdrive to use the current framebuffer geometry -- otherwise
++			# it will default to trying to achieve 1024x768
++			if [ "$XSERVER" != "Xorg" ] ; then
++			    ARGS="$ARGS -screen ${SCREEN_SIZE}"
++			fi
++		    fi
++    esac
++fi
++
++if [ "$XSERVER" != "Xorg" ] ; then
++    ARGS="$ARGS $MOUSE"
++fi
+-- 
+1.6.3.3
+
diff --git a/recipes/xserver-common/xserver-common-1.30/0025-Makefile-move-modmaps-install-xserver-common.patch b/recipes/xserver-common/xserver-common-1.30/0025-Makefile-move-modmaps-install-xserver-common.patch
new file mode 100644
index 0000000..1389867
--- /dev/null
+++ b/recipes/xserver-common/xserver-common-1.30/0025-Makefile-move-modmaps-install-xserver-common.patch
@@ -0,0 +1,32 @@
+From 309ba3de37f0374c72c4569186e381a3272c24bc Mon Sep 17 00:00:00 2001
+From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
+Date: Mon, 31 Aug 2009 12:47:05 +0200
+Subject: [PATCH 1/1] Makefile: move modmaps, install xserver-common
+
+---
+ Makefile |    6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+--- xserver-common-1.30.orig/Makefile
++++ xserver-common-1.30/Makefile
+@@ -15,16 +15,18 @@ endif
+ all:
+ 
+ install-program: 
+ 	for i in X11/Xsession.d X11/Xinit.d; do install -d $(DESTDIR)/etc/$$i; FILES=`echo $$i/* | sed "s:$$i/CVS::"`; install -m 755 $$FILES $(DESTDIR)/etc/$$i/; done
+ 	install -d $(DESTDIR)$(PREFIX)/bin
++	install -d $(DESTDIR)/etc/X11/xmodmap
+ 	install -m 755 run-calibrate.sh $(DESTDIR)$(PREFIX)/bin/run-calibrate.sh
+ 	install -m 644 X11/Xdefaults $(DESTDIR)/etc/X11/Xdefaults
+ 	install -m 755 X11/Xinit $(DESTDIR)/etc/X11/Xinit
+ 	install -m 755 X11/Xserver $(DESTDIR)/etc/X11/Xserver
++	install -m 644 X11/xserver-common $(DESTDIR)/etc/X11/xserver-common
+ 	install -m 755 X11/Xsession $(DESTDIR)/etc/X11/Xsession
+-	install -m 644 X11/xmodmap/*.xmodmap $(DESTDIR)/etc/X11/
+-	install -m 644 X11/xmodmap-* $(DESTDIR)/etc/X11/
++	install -m 644 X11/xmodmap/* $(DESTDIR)/etc/X11/xmodmap/
++	install -m 644 X11/xmodmap-* $(DESTDIR)/etc/X11/xmodmap/
+ 
+ clean:
+ 
+ include $(BUILD)/Makefile.dpkg_ipkg
diff --git a/recipes/xserver-common/xserver-common-1.30/0026-98keymap-fixup-fixed-path-to-xmodmap-file.patch b/recipes/xserver-common/xserver-common-1.30/0026-98keymap-fixup-fixed-path-to-xmodmap-file.patch
new file mode 100644
index 0000000..a667c5f
--- /dev/null
+++ b/recipes/xserver-common/xserver-common-1.30/0026-98keymap-fixup-fixed-path-to-xmodmap-file.patch
@@ -0,0 +1,25 @@
+From 884521a985831e9f6eb231bc8dd96613ca90c636 Mon Sep 17 00:00:00 2001
+From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
+Date: Mon, 31 Aug 2009 12:53:29 +0200
+Subject: [PATCH 1/1] 98keymap-fixup: fixed path to xmodmap file
+
+---
+ X11/Xinit.d/98keymap-fixup |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/X11/Xinit.d/98keymap-fixup b/X11/Xinit.d/98keymap-fixup
+index fcc84d9..6895e24 100755
+--- a/X11/Xinit.d/98keymap-fixup
++++ b/X11/Xinit.d/98keymap-fixup
+@@ -3,7 +3,7 @@
+ # kdrive 1.4 and up have a heisenbug where it may take multiple tries to apply a modmap
+ iter=0
+ while [ $(xmodmap -pke | awk '{if ($2 == 36) { if ($4 == "Return") { print "good" } else {print "bad" }}}') = "bad" ] ; do
+-	xmodmap - </etc/X11/default.xmodmap
++	xmodmap - </etc/X11/xmodmap/default.xmodmap
+ 	let iter=iter+1
+ done
+ 
+-- 
+1.6.3.3
+
diff --git a/recipes/xserver-common/xserver-common_1.30.bb b/recipes/xserver-common/xserver-common_1.30.bb
new file mode 100644
index 0000000..797b831
--- /dev/null
+++ b/recipes/xserver-common/xserver-common_1.30.bb
@@ -0,0 +1,31 @@
+DESCRIPTION = "Common X11 scripts and support files"
+LICENSE = "GPL"
+SECTION = "x11"
+RDEPENDS_${PN} = "xmodmap xrandr xdpyinfo"
+RRECOMMENDS_${PN} = "xtscal"
+PR = "r5"
+
+PACKAGE_ARCH = "all"
+DEFAULT_PREFERENCE = "-1"
+
+# we are using a gpe-style Makefile
+inherit gpe
+
+SRC_URI_append = " file://setDPI.sh \
+                   file://89xdgautostart.sh \
+file://0018-zaurus-fixed-machine-names.patch;patch=1 \
+file://0019-keymap-fixed-machine-names.patch;patch=1 \
+file://0020-keymap-fixed-machine-names-again.patch;patch=1 \
+file://0021-xserver-introduced-MOUSE-variable-for-mouse-argument.patch;patch=1 \
+file://0022-xserver-fix-syntax-error.patch;patch=1 \
+file://0023-Xserver-provide-screen-argument-only-for-non-X.org-s.patch;patch=1 \
+file://0024-Xserver-move-nearly-whole-functionality-to-xserver-c.patch;patch=1 \
+file://0025-Makefile-move-modmaps-install-xserver-common.patch;patch=1 \
+file://0026-98keymap-fixup-fixed-path-to-xmodmap-file.patch;patch=1 \
+"
+
+do_install_append() {
+	install -m 0755 "${WORKDIR}/setDPI.sh" "${D}/etc/X11/Xinit.d/50setdpi"
+	install -m 0755 "${WORKDIR}/89xdgautostart.sh" "${D}/etc/X11/Xsession.d/89xdgautostart"
+	sed -i 's:^BINDIR=.*$:BINDIR=${bindir}:' ${D}/etc/X11/Xserver
+}
-- 
1.6.4.3





