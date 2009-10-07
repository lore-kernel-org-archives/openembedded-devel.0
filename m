Received: from [216.168.135.169] (helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1MvYPZ-0007ww-O2
	for openembedded-devel@openembedded.org; Wed, 07 Oct 2009 17:26:45 +0200
Received: (qmail 12042 invoked by uid 1003); 7 Oct 2009 15:25:51 -0000
Received: from localhost (HELO ?192.168.0.174?) (philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 7 Oct 2009 15:25:50 -0000
Message-ID: <4ACCB2FD.30801@balister.org>
Date: Wed, 07 Oct 2009 08:25:49 -0700
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.1) Gecko/20090814 Fedora/3.0-2.6.b3.fc11 Thunderbird/3.0b3
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1254925696-8813-1-git-send-email-marcin@juszkiewicz.com.pl>
In-Reply-To: <1254925696-8813-1-git-send-email-marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [STABLE][PATCH] xserver-common: added 1.30 + patches
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
X-List-Received-Date: Wed, 07 Oct 2009 15:26:45 -0000
X-Groupsio-MsgNum: 13353
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
	micalg=sha1; boundary="------------ms020307080008080007000902"

--------------ms020307080008080007000902
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

Acked-by: Philip Balister <philip@balister.org>

On 10/07/2009 07:28 AM, Marcin Juszkiewicz wrote:
> xserver-common 1.30 is experimental, do not use by default
> xserver-common 1.30: -screen option is only for Kdrive
> xserver-common 1.30: another set of updates
>
> 0024 moves functionality of /etc/X11/Xserver to separate file (except
>       running X11 server) - this allows to use xserver-common package i=
n
>       systems where xinit is used to run X11 session as root (look at
>       xserver-nodm-init package)
>
> 0025 moves xmodmap files to /etc/X11/xmodmap/ and installs
>       xserver-common file created in previous patch.
>
> 0026 fixes path to default.xmodmap file
>
> xserver-common: recommend xtscal (works without it but needs for calibr=
ation)
> ---
>   .../0018-zaurus-fixed-machine-names.patch          |   35 ++
>   .../0019-keymap-fixed-machine-names.patch          |   59 +++
>   .../0020-keymap-fixed-machine-names-again.patch    |   50 +++
>   ...roduced-MOUSE-variable-for-mouse-argument.patch |   63 +++
>   .../0022-xserver-fix-syntax-error.patch            |   27 ++
>   ...vide-screen-argument-only-for-non-X.org-s.patch |   27 ++
>   ...e-nearly-whole-functionality-to-xserver-c.patch |  415 +++++++++++=
+++++++++
>   ...efile-move-modmaps-install-xserver-common.patch |   32 ++
>   ...98keymap-fixup-fixed-path-to-xmodmap-file.patch |   25 ++
>   recipes/xserver-common/xserver-common_1.30.bb      |   31 ++
>   10 files changed, 764 insertions(+), 0 deletions(-)
>   create mode 100644 recipes/xserver-common/xserver-common-1.30/0018-za=
urus-fixed-machine-names.patch
>   create mode 100644 recipes/xserver-common/xserver-common-1.30/0019-ke=
ymap-fixed-machine-names.patch
>   create mode 100644 recipes/xserver-common/xserver-common-1.30/0020-ke=
ymap-fixed-machine-names-again.patch
>   create mode 100644 recipes/xserver-common/xserver-common-1.30/0021-xs=
erver-introduced-MOUSE-variable-for-mouse-argument.patch
>   create mode 100644 recipes/xserver-common/xserver-common-1.30/0022-xs=
erver-fix-syntax-error.patch
>   create mode 100644 recipes/xserver-common/xserver-common-1.30/0023-Xs=
erver-provide-screen-argument-only-for-non-X.org-s.patch
>   create mode 100644 recipes/xserver-common/xserver-common-1.30/0024-Xs=
erver-move-nearly-whole-functionality-to-xserver-c.patch
>   create mode 100644 recipes/xserver-common/xserver-common-1.30/0025-Ma=
kefile-move-modmaps-install-xserver-common.patch
>   create mode 100644 recipes/xserver-common/xserver-common-1.30/0026-98=
keymap-fixup-fixed-path-to-xmodmap-file.patch
>   create mode 100644 recipes/xserver-common/xserver-common_1.30.bb
>
> diff --git a/recipes/xserver-common/xserver-common-1.30/0018-zaurus-fix=
ed-machine-names.patch b/recipes/xserver-common/xserver-common-1.30/0018-=
zaurus-fixed-machine-names.patch
> new file mode 100644
> index 0000000..d6d6aa8
> --- /dev/null
> +++ b/recipes/xserver-common/xserver-common-1.30/0018-zaurus-fixed-mach=
ine-names.patch
> @@ -0,0 +1,35 @@
> +From a287e6414a765926fc7b169617bc1174370bc183 Mon Sep 17 00:00:00 2001=

> +From: Marcin Juszkiewicz<marcin@juszkiewicz.com.pl>
> +Date: Mon, 20 Jul 2009 18:57:56 +0200
> +Subject: [PATCH 18/22] zaurus: fixed machine names
> +
> +
> +Signed-off-by: Marcin Juszkiewicz<marcin@juszkiewicz.com.pl>
> +---
> + X11/Xinit.d/11zaurus |    4 ++--
> + 1 files changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/X11/Xinit.d/11zaurus b/X11/Xinit.d/11zaurus
> +index 02090be..54ea6f5 100644
> +--- a/X11/Xinit.d/11zaurus
> ++++ b/X11/Xinit.d/11zaurus
> +@@ -13,14 +13,14 @@ fi
> + $CHCK -e
> + if [ $? =3D 12 ]; then
> +    case `machine_id` in
> +-   	*Spitz | *Akita | *Borzoi)
> ++   	*spitz | *akita | *borzoi)
> +    		DIRECTION=3D"normal" ;;
> +         *)
> +                 DIRECTION=3D"right" ;;
> +    esac
> + else
> +    case `machine_id` in
> +-   	*Spitz | *Akita | *Borzoi)
> ++   	*spitz | *akita | *borzoi)
> + 		# Xfbdev needs to settle
> + 		sleep 2
> +    		DIRECTION=3D"right" ;;
> +--
> +1.6.3.3
> +
> diff --git a/recipes/xserver-common/xserver-common-1.30/0019-keymap-fix=
ed-machine-names.patch b/recipes/xserver-common/xserver-common-1.30/0019-=
keymap-fixed-machine-names.patch
> new file mode 100644
> index 0000000..9a4e561
> --- /dev/null
> +++ b/recipes/xserver-common/xserver-common-1.30/0019-keymap-fixed-mach=
ine-names.patch
> @@ -0,0 +1,59 @@
> +From e564699c60d69148e19150dc9d2105734b1df7e1 Mon Sep 17 00:00:00 2001=

> +From: Marcin Juszkiewicz<marcin@juszkiewicz.com.pl>
> +Date: Mon, 20 Jul 2009 18:58:54 +0200
> +Subject: [PATCH 19/22] keymap: fixed machine names
> +
> +
> +Signed-off-by: Marcin Juszkiewicz<marcin@juszkiewicz.com.pl>
> +---
> + X11/Xinit.d/12keymap |   18 +++++++++---------
> + 1 files changed, 9 insertions(+), 9 deletions(-)
> +
> +diff --git a/X11/Xinit.d/12keymap b/X11/Xinit.d/12keymap
> +index 0a909d0..cfa9750 100644
> +--- a/X11/Xinit.d/12keymap
> ++++ b/X11/Xinit.d/12keymap
> +@@ -1,31 +1,31 @@
> + #!/bin/sh
> +
> +-MACHINE=3D`awk 'BEGIN { FS=3D": " } /Hardware/ { print $2 } '</proc/c=
puinfo`
> ++. /etc/init.d/functions
> +
> + # since kdrive 1.4 there is no default keymap in server
> + xmodmap -</etc/X11/xmodmap/default.xmodmap
> +
> +-case $MACHINE in
> +-	"SHARP Shepherd" | "SHARP Husky" | "SHARP Corgi")
> ++case `machine_id` in
> ++	"sharp shepherd" | "sharp husky" | "sharp corgi")
> + 		xmodmap -<  /etc/X11/xmodmap/shepherd.xmodmap
> + 		;;
> +-	"SHARP Akita" | "SHARP Borzoi" | "SHARP Spitz")
> ++	"sharp akita" | "sharp borzoi" | "sharp spitz")
> + 		xmodmap -<  /etc/X11/xmodmap/slcXXXX.xmodmap
> + 		;;			=09
> +-	"SHARP Poodle")
> ++	"sharp poodle")
> + 		xmodmap -<  /etc/X11/xmodmap/poodle.xmodmap
> + 		;;
> +-        "Sharp-Collie")
> ++        "sharp-collie")
> +                 xmodmap -<  /etc/X11/xmodmap/collie.xmodmap
> +                 ;;
> +-	"HP iPAQ h6300")
> ++	"hp ipaq h6300")
> + 		xmodmap -<  /etc/X11/xmodmap/h6300.xmodmap
> + 		;;
> +-	"TI-OSK")
> ++	"ti-osk")
> + 		xmodmap -<  /etc/X11/xmodmap/omap5912osk.xmodmap
> + 		;;
> + 	# All the rest of keyboardless PDA machines use common buttonmap
> +-	"Simpad" | "HP iPAQ"* | "Asus MyPal"*)
> ++	"simpad" | "hp ipaq"* | "asus mypal"*)
> + 		xmodmap -<  /etc/X11/xmodmap/keyboardless.xmodmap
> + 		;;
> + esac
> +--
> +1.6.3.3
> +
> diff --git a/recipes/xserver-common/xserver-common-1.30/0020-keymap-fix=
ed-machine-names-again.patch b/recipes/xserver-common/xserver-common-1.30=
/0020-keymap-fixed-machine-names-again.patch
> new file mode 100644
> index 0000000..f14f5ae
> --- /dev/null
> +++ b/recipes/xserver-common/xserver-common-1.30/0020-keymap-fixed-mach=
ine-names-again.patch
> @@ -0,0 +1,50 @@
> +From f216da13941685575786e617c2cc072edd5b210c Mon Sep 17 00:00:00 2001=

> +From: Marcin Juszkiewicz<marcin@juszkiewicz.com.pl>
> +Date: Mon, 20 Jul 2009 19:01:08 +0200
> +Subject: [PATCH 20/22] keymap: fixed machine names again
> +
> +
> +Signed-off-by: Marcin Juszkiewicz<marcin@juszkiewicz.com.pl>
> +---
> + X11/Xinit.d/12keymap |   10 +++++-----
> + 1 files changed, 5 insertions(+), 5 deletions(-)
> +
> +diff --git a/X11/Xinit.d/12keymap b/X11/Xinit.d/12keymap
> +index cfa9750..7eac296 100644
> +--- a/X11/Xinit.d/12keymap
> ++++ b/X11/Xinit.d/12keymap
> +@@ -6,26 +6,26 @@
> + xmodmap -</etc/X11/xmodmap/default.xmodmap
> +
> + case `machine_id` in
> +-	"sharp shepherd" | "sharp husky" | "sharp corgi")
> ++	"sharp_shepherd" | "sharp_husky" | "sharp_corgi")
> + 		xmodmap -<  /etc/X11/xmodmap/shepherd.xmodmap
> + 		;;
> +-	"sharp akita" | "sharp borzoi" | "sharp spitz")
> ++	"sharp_akita" | "sharp_borzoi" | "sharp_spitz")
> + 		xmodmap -<  /etc/X11/xmodmap/slcXXXX.xmodmap
> + 		;;			=09
> +-	"sharp poodle")
> ++	"sharp_poodle")
> + 		xmodmap -<  /etc/X11/xmodmap/poodle.xmodmap
> + 		;;
> +         "sharp-collie")
> +                 xmodmap -<  /etc/X11/xmodmap/collie.xmodmap
> +                 ;;
> +-	"hp ipaq h6300")
> ++	"hp_ipaq_h6300")
> + 		xmodmap -<  /etc/X11/xmodmap/h6300.xmodmap
> + 		;;
> + 	"ti-osk")
> + 		xmodmap -<  /etc/X11/xmodmap/omap5912osk.xmodmap
> + 		;;
> + 	# All the rest of keyboardless PDA machines use common buttonmap
> +-	"simpad" | "hp ipaq"* | "asus mypal"*)
> ++	"simpad" | "hp_ipaq"* | "asus_mypal"*)
> + 		xmodmap -<  /etc/X11/xmodmap/keyboardless.xmodmap
> + 		;;
> + esac
> +--
> +1.6.3.3
> +
> diff --git a/recipes/xserver-common/xserver-common-1.30/0021-xserver-in=
troduced-MOUSE-variable-for-mouse-argument.patch b/recipes/xserver-common=
/xserver-common-1.30/0021-xserver-introduced-MOUSE-variable-for-mouse-arg=
ument.patch
> new file mode 100644
> index 0000000..4d9bfa2
> --- /dev/null
> +++ b/recipes/xserver-common/xserver-common-1.30/0021-xserver-introduce=
d-MOUSE-variable-for-mouse-argument.patch
> @@ -0,0 +1,63 @@
> +From 3ada7e341334766f6be27164dbb43a3715faf580 Mon Sep 17 00:00:00 2001=

> +From: Marcin Juszkiewicz<marcin@juszkiewicz.com.pl>
> +Date: Tue, 21 Jul 2009 13:36:17 +0200
> +Subject: [PATCH 21/22] xserver: introduced MOUSE variable for "-mouse"=
 argument
> +
> +MOUSE is not passed in ARGS if Xorg server is used as it is KDrive onl=
y.
> +
> +Signed-off-by: Marcin Juszkiewicz<marcin@juszkiewicz.com.pl>
> +---
> + X11/Xserver |   13 +++++++++----
> + 1 files changed, 9 insertions(+), 4 deletions(-)
> +
> +diff --git a/X11/Xserver b/X11/Xserver
> +index 25ce816..e7e88d9 100755
> +--- a/X11/Xserver
> ++++ b/X11/Xserver
> +@@ -46,19 +46,20 @@ export XSERVER_DEFAULT_ORIENTATION=3Dnormal
> +
> + ARGS=3D"-br -pn $INPUT_EXTRA_ARGS"
> + DPI=3D"100"
> ++MOUSE=3D""
> +
> + # use ucb 1x00 touchscreen if present
> + if [ -z "$TSLIB_TSDEVICE" ]&&  [ -e /dev/touchscreen/ucb1x00 ]; then
> +-  ARGS=3D"$ARGS -mouse /dev/touchscreen/ucb1x00"
> ++  MOUSE=3D"-mouse /dev/touchscreen/ucb1x00"
> + fi
> +
> + # kdrive 1.4 onwards needs -mouse args
> + # Xorg doesn't support "-mouse" option, and uses /dev/input/mice auto=
matically
> + if [ -e "$TSLIB_TSDEVICE" ] ; then
> +-  ARGS=3D"$ARGS -mouse tslib"
> ++  MOUSE=3D"-mouse tslib"
> + else
> +   if  [ -e /dev/input/mice ]&&  [ "$XSERVER" !=3D "Xorg" ] ; then
> +-    ARGS=3D"$ARGS -mouse mouse"
> ++    MOUSE=3D"-mouse mouse"
> +   fi
> + fi
> +
> +@@ -103,7 +104,7 @@ else
> + 		    ARGS=3D"$ARGS -rgba rgb"
> + 		    DPI=3D"100" ;;
> + 	    "generic_omap1510/1610/1710")
> +-		    ARGS=3D"$ARGS -mouse /dev/input/event0"
> ++		    MOUSE=3D"-mouse /dev/input/event0"
> + 		    DPI=3D"220" ;;
> + 	    "ti-osk")
> + 		    DPI=3D"100" ;;
> +@@ -183,6 +184,10 @@ else
> +     esac
> + fi
> +
> ++if [ "$XSERVER" !=3D "Xorg" ] ; then
> ++    ARGS=3D"$ARGS $MOUSE"
> ++fi
> ++
> + echo "tslib: $TSLIB_TSDEVICE"
> + echo "exec $XSERVER $ARGS -dpi $DPI $*"
> + exec $XSERVER $ARGS -dpi $DPI $*
> +--
> +1.6.3.3
> +
> diff --git a/recipes/xserver-common/xserver-common-1.30/0022-xserver-fi=
x-syntax-error.patch b/recipes/xserver-common/xserver-common-1.30/0022-xs=
erver-fix-syntax-error.patch
> new file mode 100644
> index 0000000..e96fabf
> --- /dev/null
> +++ b/recipes/xserver-common/xserver-common-1.30/0022-xserver-fix-synta=
x-error.patch
> @@ -0,0 +1,27 @@
> +From 00cbc2b27c7df84d7837760e05ac13b686e6bfa9 Mon Sep 17 00:00:00 2001=

> +From: Marcin Juszkiewicz<marcin@juszkiewicz.com.pl>
> +Date: Thu, 23 Jul 2009 12:04:12 +0200
> +Subject: [PATCH 22/22] xserver: fix syntax error
> +
> +
> +Signed-off-by: Marcin Juszkiewicz<marcin@juszkiewicz.com.pl>
> +---
> + X11/Xserver |    2 +-
> + 1 files changed, 1 insertions(+), 1 deletions(-)
> +
> +diff --git a/X11/Xserver b/X11/Xserver
> +index e7e88d9..3d93a0a 100755
> +--- a/X11/Xserver
> ++++ b/X11/Xserver
> +@@ -63,7 +63,7 @@ else
> +   fi
> + fi
> +
> +-if [ -e /etc/default/xserver ]
> ++if [ -e /etc/default/xserver ] ; then
> +     . /etc/default/xserver
> + else
> +     # start off server in conventional location.
> +--
> +1.6.3.3
> +
> diff --git a/recipes/xserver-common/xserver-common-1.30/0023-Xserver-pr=
ovide-screen-argument-only-for-non-X.org-s.patch b/recipes/xserver-common=
/xserver-common-1.30/0023-Xserver-provide-screen-argument-only-for-non-X.=
org-s.patch
> new file mode 100644
> index 0000000..e80cbac
> --- /dev/null
> +++ b/recipes/xserver-common/xserver-common-1.30/0023-Xserver-provide-s=
creen-argument-only-for-non-X.org-s.patch
> @@ -0,0 +1,27 @@
> +From 0ea66d0827131952dc1069f1ea3cb317b831df55 Mon Sep 17 00:00:00 2001=

> +From: Marcin Juszkiewicz<hrw@koansoftware.com>
> +Date: Fri, 28 Aug 2009 18:47:55 +0200
> +Subject: [PATCH 1/1] Xserver: provide -screen argument only for non-X.=
org servers
> +
> +---
> + X11/Xserver |    4 +++-
> + 1 files changed, 3 insertions(+), 1 deletions(-)
> +
> +diff --git a/X11/Xserver b/X11/Xserver
> +index 3d93a0a..583cd0d 100755
> +--- a/X11/Xserver
> ++++ b/X11/Xserver
> +@@ -179,7 +179,9 @@ else
> + 			# It is a device we do not know about, in which case we force
> + 			# kdrive to use the current framebuffer geometry -- otherwise
> + 			# it will default to trying to achieve 1024x768
> +-			ARGS=3D"$ARGS -screen ${SCREEN_SIZE}"
> ++			if [ "$XSERVER" !=3D "Xorg" ] ; then
> ++			    ARGS=3D"$ARGS -screen ${SCREEN_SIZE}"
> ++			fi
> + 		    fi
> +     esac
> + fi
> +--
> +1.6.3.3
> +
> diff --git a/recipes/xserver-common/xserver-common-1.30/0024-Xserver-mo=
ve-nearly-whole-functionality-to-xserver-c.patch b/recipes/xserver-common=
/xserver-common-1.30/0024-Xserver-move-nearly-whole-functionality-to-xser=
ver-c.patch
> new file mode 100644
> index 0000000..d00e1a7
> --- /dev/null
> +++ b/recipes/xserver-common/xserver-common-1.30/0024-Xserver-move-near=
ly-whole-functionality-to-xserver-c.patch
> @@ -0,0 +1,415 @@
> +From dc0efcbc35a7e0c5b5f908fb4d27a76c4ee304ac Mon Sep 17 00:00:00 2001=

> +From: Marcin Juszkiewicz<marcin@juszkiewicz.com.pl>
> +Date: Mon, 31 Aug 2009 12:05:17 +0200
> +Subject: [PATCH 1/1] Xserver: move nearly whole functionality to xserv=
er-common
> +
> +/etc/X11/Xserver script now use /etc/X11/xserver-common one to get
> +values for XSERVER, ARGS, DPI variables.
> +
> +This split allows to use xserver-common for other X11 startup systems.=

> +---
> + X11/Xserver        |  188 +------------------------------------------=
--------
> + X11/xserver-common |  191 +++++++++++++++++++++++++++++++++++++++++++=
+++++++++
> + 2 files changed, 192 insertions(+), 187 deletions(-)
> + create mode 100644 X11/xserver-common
> +
> +diff --git a/X11/Xserver b/X11/Xserver
> +index 583cd0d..d53e1c9 100755
> +--- a/X11/Xserver
> ++++ b/X11/Xserver
> +@@ -1,194 +1,8 @@
> + #!/bin/sh
> + #
> +
> +-XSERVER=3DXfbdev
> +-BINDIR=3D/usr/bin
> ++. /etc/X11/xserver-common
> +
> +-if [ -f $BINDIR/Xepson ]; then
> +-  XSERVER=3DXepson
> +-fi
> +-if [ -f $BINDIR/Xorg ]; then
> +-  XSERVER=3DXorg
> +-fi
> +-if [ -f $BINDIR/Xomap ]; then
> +-  XSERVER=3DXomap
> +-fi
> +-if [ -f $BINDIR/Xw100 ]; then
> +-  XSERVER=3DXw100
> +-fi
> +-if [ -f $BINDIR/Xvesa ]; then
> +-  XSERVER=3DXvesa
> +-fi
> +-if [ -f $BINDIR/Ximageon ]; then
> +-  XSERVER=3DXimageon
> +-fi
> +-if [ -f $BINDIR/Xglamo ]; then
> +-  XSERVER=3DXglamo
> +-fi
> +-
> +-if [ -f /etc/profile ]; then
> +-  . /etc/profile
> +-fi
> +-
> +-. /etc/init.d/functions
> +-
> +-fallback_screen_arg() {
> +-    geom=3D`fbset | grep geometry`
> +-    w=3D`echo $geom | awk '{ print $2 }'`
> +-    h=3D`echo $geom | awk '{ print $3 }'`
> +-    b=3D`echo $geom | awk '{ print $6 }'`
> +-    echo -n "${w}x${h}x${b}"
> +-}
> +-
> +-SCREEN_SIZE=3D`fallback_screen_arg`
> +-export USER=3Droot
> +-export XSERVER_DEFAULT_ORIENTATION=3Dnormal
> +-
> +-ARGS=3D"-br -pn $INPUT_EXTRA_ARGS"
> +-DPI=3D"100"
> +-MOUSE=3D""
> +-
> +-# use ucb 1x00 touchscreen if present
> +-if [ -z "$TSLIB_TSDEVICE" ]&&  [ -e /dev/touchscreen/ucb1x00 ]; then
> +-  MOUSE=3D"-mouse /dev/touchscreen/ucb1x00"
> +-fi
> +-
> +-# kdrive 1.4 onwards needs -mouse args
> +-# Xorg doesn't support "-mouse" option, and uses /dev/input/mice auto=
matically
> +-if [ -e "$TSLIB_TSDEVICE" ] ; then
> +-  MOUSE=3D"-mouse tslib"
> +-else
> +-  if  [ -e /dev/input/mice ]&&  [ "$XSERVER" !=3D "Xorg" ] ; then
> +-    MOUSE=3D"-mouse mouse"
> +-  fi
> +-fi
> +-
> +-if [ -e /etc/default/xserver ] ; then
> +-    . /etc/default/xserver
> +-else
> +-    # start off server in conventional location.
> +-    case `machine_id` in
> +-	    "aml_m8050")
> +-		    ARGS=3D"$ARGS  -screen 320x240@270"
> +-		    DPI=3D"100" ;;
> +-	    "hp_ipaq_h3100" | "hp_ipaq_h3800")
> +-		    ARGS=3D"$ARGS -rgba vrgb -screen 320x240@90"
> +-		    DPI=3D"100" ;;
> +-	    "hp_ipaq_h3600" | "hp_ipaq_h3700" | "hp_ipaq_h3900")
> +-		    ARGS=3D"$ARGS -rgba vbgr -screen 320x240@270"
> +-		    DPI=3D"100" ;;
> +-	    "hp_ipaq_h5400" | "hp_ipaq_h2200")
> +-		    ARGS=3D"$ARGS -rgba rgb"
> +-		    DPI=3D"100" ;;
> +-	    "hp_ipaq_hx4700")
> +-		    DPI=3D"200" ;;
> +-	    "ramses")
> +-		    # What is this "vt2" in aid of?
> +-		    ARGS=3D"$ARGS -rgba vrgb -screen 320x240@90 vt2"
> +-		    DPI=3D"100" ;;
> +-	    *poodle)
> +-		    ARGS=3D"$ARGS -rgba vrgb -screen 320x240@270"
> +-		    DPI=3D"100" ;;
> +-	    # both 'Sharp-Collie' and just 'Collie' have been reported
> +-	    *collie)
> +-		    ARGS=3D"$ARGS -rgba vrgb -screen 320x240@270"
> +-		    DPI=3D"100" ;;
> +-	    "sharp_shepherd" | "sharp_husky" | "sharp_corgi")
> +-		    ARGS=3D"$ARGS -rgba rgb"
> +-		    DPI=3D"200" ;;
> +-	    "sharp_spitz" | "sharp_akita" | "sharp_borzoi")
> +-		    export XSERVER_DEFAULT_ORIENTATION=3D"normal"
> +-		    ARGS=3D"$ARGS -rgba rgb -screen 480x640"
> +-		    DPI=3D"200" ;;
> +-	    "simpad")
> +-		    ARGS=3D"$ARGS -rgba rgb"
> +-		    DPI=3D"100" ;;
> +-	    "generic_omap1510/1610/1710")
> +-		    MOUSE=3D"-mouse /dev/input/event0"
> +-		    DPI=3D"220" ;;
> +-	    "ti-osk")
> +-		    DPI=3D"100" ;;
> +-	    "cellon_c8000_board")
> +-		    ARGS=3D"$ARGS -screen ${SCREEN_SIZE},10,1"
> +-		    DPI=3D"100" ;;
> +-	    "htc_magician")
> +-		    DPI=3D"142" ;;
> +-	    "htc_universal")
> +-		    ARGS=3D"$ARGS -screen 480x640@270"
> +-		    DPI=3D"100" ;;
> +-	    "htc_tornado")
> +-		    ARGS=3D"$ARGS -hide-cursor"
> +-		    DPI=3D"100" ;;
> +-	    "generic_omap1510/1610/1710")
> +-		    ARGS=3D"$ARGS -screen ${SCREEN_SIZE}"
> +-		    DPI=3D"225" ;;
> +-	    "nokia_n800" | "nokia_rx-44" | "nokia_n770")
> +-		    ARGS=3D"$ARGS -screen ${SCREEN_SIZE}"
> +-		    DPI=3D"225" ;;
> +-	    "gta01" )
> +-		    DPI=3D"285"
> +-		    if [ "$XSERVER" !=3D "Xorg" ] ; then
> +-			    ARGS=3D"$ARGS -screen 480x640"
> +-		    fi
> +-		    ;;
> +-	    "gta02")
> +-		    DPI=3D"285"
> +-		    if [ "$XSERVER" !=3D "Xorg" ] ; then
> +-			    ARGS=3D"$ARGS -screen ${SCREEN_SIZE}"
> +-		    fi
> +-		    ;;
> +-	    "motorola_ezx_platform")
> +-		    ARGS=3D"$ARGS -screen 240x320"
> +-		    DPI=3D"170" ;;
> +-	    "arm-integratorcp" | "arm-versatile_pb")
> +-		    ARGS=3D"$ARGS -rgba vrgb" ;;
> +-	    "compulab_cm-x270")
> +-		    modprobe mbxfb
> +-		    ARGS=3D"$ARGS -fb /dev/fb1" ;;
> +-	    "boundary_devices_neon_board")
> +-		    ARGS=3D"$ARGS -screen ${SCREEN_SIZE}"
> +-		    DPI=3D"100" ;;
> +-	    "hoeft&wessel_hw90350")
> +-		    ARGS=3D"$ARGS -screen ${SCREEN_SIZE}"
> +-		    DPI=3D"100" ;;
> +-	    "hoeft&wessel_hw90250")
> +-		    ARGS=3D"$ARGS -screen 240x320@90"
> +-		    DPI=3D"100" ;;
> +-	    "mini2440")
> +-		    ARGS=3D"$ARGS -screen ${SCREEN_SIZE}"
> +-		    DPI=3D"100" ;;
> +-	    "palm_treo_650")
> +-	            DPI=3D"181"
> +-		    ARGS=3D"$ARGS -screen 320x320 -hide-cursor" ;;
> +-	    "glofiish_m800")
> +-	            DPI=3D"285"
> +-		    ARGS=3D"$ARGS -screen ${SCREEN_SIZE} -hide-cursor vt1" ;;
> +-	    "freescale_mx21ads")
> +-	    # That's what /proc/cpuinfo shows as hardware on the chumby
> +-	            DPI=3D"121"
> +-		    ARGS=3D"$ARGS -screen 320x240 -hide-cursor" ;;
> +-
> +-            # this is to rotate X display properly, tested with displ=
ay TX09D71VM1CCA
> +-            ronetix*pm9261*  | ronetix*pm9263*)
> +-         	    ARGS=3D"$ARGS -screen 240/54x320/81@90x16" ;;
> +-	    # This is a fallback for PCs
> +-	    "")
> +-		    if [ -f $BINDIR/Xvesa ]; then
> +-			    ARGS=3D"$ARGS -mode 0x0114"
> +-		    else
> +-			# It is a device we do not know about, in which case we force
> +-			# kdrive to use the current framebuffer geometry -- otherwise
> +-			# it will default to trying to achieve 1024x768
> +-			if [ "$XSERVER" !=3D "Xorg" ] ; then
> +-			    ARGS=3D"$ARGS -screen ${SCREEN_SIZE}"
> +-			fi
> +-		    fi
> +-    esac
> +-fi
> +-
> +-if [ "$XSERVER" !=3D "Xorg" ] ; then
> +-    ARGS=3D"$ARGS $MOUSE"
> +-fi
> +
> + echo "tslib: $TSLIB_TSDEVICE"
> + echo "exec $XSERVER $ARGS -dpi $DPI $*"
> +diff --git a/X11/xserver-common b/X11/xserver-common
> +new file mode 100644
> +index 0000000..29d152f
> +--- /dev/null
> ++++ b/X11/xserver-common
> +@@ -0,0 +1,191 @@
> ++#!/bin/sh
> ++#
> ++
> ++XSERVER=3DXfbdev
> ++BINDIR=3D/usr/bin
> ++
> ++if [ -f $BINDIR/Xepson ]; then
> ++  XSERVER=3DXepson
> ++fi
> ++if [ -f $BINDIR/Xorg ]; then
> ++  XSERVER=3DXorg
> ++fi
> ++if [ -f $BINDIR/Xomap ]; then
> ++  XSERVER=3DXomap
> ++fi
> ++if [ -f $BINDIR/Xw100 ]; then
> ++  XSERVER=3DXw100
> ++fi
> ++if [ -f $BINDIR/Xvesa ]; then
> ++  XSERVER=3DXvesa
> ++fi
> ++if [ -f $BINDIR/Ximageon ]; then
> ++  XSERVER=3DXimageon
> ++fi
> ++if [ -f $BINDIR/Xglamo ]; then
> ++  XSERVER=3DXglamo
> ++fi
> ++
> ++if [ -f /etc/profile ]; then
> ++  . /etc/profile
> ++fi
> ++
> ++. /etc/init.d/functions
> ++
> ++fallback_screen_arg() {
> ++    geom=3D`fbset | grep geometry`
> ++    w=3D`echo $geom | awk '{ print $2 }'`
> ++    h=3D`echo $geom | awk '{ print $3 }'`
> ++    b=3D`echo $geom | awk '{ print $6 }'`
> ++    echo -n "${w}x${h}x${b}"
> ++}
> ++
> ++SCREEN_SIZE=3D`fallback_screen_arg`
> ++export USER=3Droot
> ++export XSERVER_DEFAULT_ORIENTATION=3Dnormal
> ++
> ++ARGS=3D"-br -pn $INPUT_EXTRA_ARGS"
> ++DPI=3D"100"
> ++MOUSE=3D""
> ++
> ++# use ucb 1x00 touchscreen if present
> ++if [ -z "$TSLIB_TSDEVICE" ]&&  [ -e /dev/touchscreen/ucb1x00 ]; then
> ++  MOUSE=3D"-mouse /dev/touchscreen/ucb1x00"
> ++fi
> ++
> ++# kdrive 1.4 onwards needs -mouse args
> ++# Xorg doesn't support "-mouse" option, and uses /dev/input/mice auto=
matically
> ++if [ -e "$TSLIB_TSDEVICE" ] ; then
> ++  MOUSE=3D"-mouse tslib"
> ++else
> ++  if  [ -e /dev/input/mice ]&&  [ "$XSERVER" !=3D "Xorg" ] ; then
> ++    MOUSE=3D"-mouse mouse"
> ++  fi
> ++fi
> ++
> ++if [ -e /etc/default/xserver ] ; then
> ++    . /etc/default/xserver
> ++else
> ++    # start off server in conventional location.
> ++    case `machine_id` in
> ++	    "aml_m8050")
> ++		    ARGS=3D"$ARGS  -screen 320x240@270"
> ++		    DPI=3D"100" ;;
> ++	    "hp_ipaq_h3100" | "hp_ipaq_h3800")
> ++		    ARGS=3D"$ARGS -rgba vrgb -screen 320x240@90"
> ++		    DPI=3D"100" ;;
> ++	    "hp_ipaq_h3600" | "hp_ipaq_h3700" | "hp_ipaq_h3900")
> ++		    ARGS=3D"$ARGS -rgba vbgr -screen 320x240@270"
> ++		    DPI=3D"100" ;;
> ++	    "hp_ipaq_h5400" | "hp_ipaq_h2200")
> ++		    ARGS=3D"$ARGS -rgba rgb"
> ++		    DPI=3D"100" ;;
> ++	    "hp_ipaq_hx4700")
> ++		    DPI=3D"200" ;;
> ++	    "ramses")
> ++		    # What is this "vt2" in aid of?
> ++		    ARGS=3D"$ARGS -rgba vrgb -screen 320x240@90 vt2"
> ++		    DPI=3D"100" ;;
> ++	    *poodle)
> ++		    ARGS=3D"$ARGS -rgba vrgb -screen 320x240@270"
> ++		    DPI=3D"100" ;;
> ++	    # both 'Sharp-Collie' and just 'Collie' have been reported
> ++	    *collie)
> ++		    ARGS=3D"$ARGS -rgba vrgb -screen 320x240@270"
> ++		    DPI=3D"100" ;;
> ++	    "sharp_shepherd" | "sharp_husky" | "sharp_corgi")
> ++		    ARGS=3D"$ARGS -rgba rgb"
> ++		    DPI=3D"200" ;;
> ++	    "sharp_spitz" | "sharp_akita" | "sharp_borzoi")
> ++		    export XSERVER_DEFAULT_ORIENTATION=3D"normal"
> ++		    ARGS=3D"$ARGS -rgba rgb -screen 480x640"
> ++		    DPI=3D"200" ;;
> ++	    "simpad")
> ++		    ARGS=3D"$ARGS -rgba rgb"
> ++		    DPI=3D"100" ;;
> ++	    "generic_omap1510/1610/1710")
> ++		    MOUSE=3D"-mouse /dev/input/event0"
> ++		    DPI=3D"220" ;;
> ++	    "ti-osk")
> ++		    DPI=3D"100" ;;
> ++	    "cellon_c8000_board")
> ++		    ARGS=3D"$ARGS -screen ${SCREEN_SIZE},10,1"
> ++		    DPI=3D"100" ;;
> ++	    "htc_magician")
> ++		    DPI=3D"142" ;;
> ++	    "htc_universal")
> ++		    ARGS=3D"$ARGS -screen 480x640@270"
> ++		    DPI=3D"100" ;;
> ++	    "htc_tornado")
> ++		    ARGS=3D"$ARGS -hide-cursor"
> ++		    DPI=3D"100" ;;
> ++	    "generic_omap1510/1610/1710")
> ++		    ARGS=3D"$ARGS -screen ${SCREEN_SIZE}"
> ++		    DPI=3D"225" ;;
> ++	    "nokia_n800" | "nokia_rx-44" | "nokia_n770")
> ++		    ARGS=3D"$ARGS -screen ${SCREEN_SIZE}"
> ++		    DPI=3D"225" ;;
> ++	    "gta01" )
> ++		    DPI=3D"285"
> ++		    if [ "$XSERVER" !=3D "Xorg" ] ; then
> ++			    ARGS=3D"$ARGS -screen 480x640"
> ++		    fi
> ++		    ;;
> ++	    "gta02")
> ++		    DPI=3D"285"
> ++		    if [ "$XSERVER" !=3D "Xorg" ] ; then
> ++			    ARGS=3D"$ARGS -screen ${SCREEN_SIZE}"
> ++		    fi
> ++		    ;;
> ++	    "motorola_ezx_platform")
> ++		    ARGS=3D"$ARGS -screen 240x320"
> ++		    DPI=3D"170" ;;
> ++	    "arm-integratorcp" | "arm-versatile_pb")
> ++		    ARGS=3D"$ARGS -rgba vrgb" ;;
> ++	    "compulab_cm-x270")
> ++		    modprobe mbxfb
> ++		    ARGS=3D"$ARGS -fb /dev/fb1" ;;
> ++	    "boundary_devices_neon_board")
> ++		    ARGS=3D"$ARGS -screen ${SCREEN_SIZE}"
> ++		    DPI=3D"100" ;;
> ++	    "hoeft&wessel_hw90350")
> ++		    ARGS=3D"$ARGS -screen ${SCREEN_SIZE}"
> ++		    DPI=3D"100" ;;
> ++	    "hoeft&wessel_hw90250")
> ++		    ARGS=3D"$ARGS -screen 240x320@90"
> ++		    DPI=3D"100" ;;
> ++	    "mini2440")
> ++		    ARGS=3D"$ARGS -screen ${SCREEN_SIZE}"
> ++		    DPI=3D"100" ;;
> ++	    "palm_treo_650")
> ++	            DPI=3D"181"
> ++		    ARGS=3D"$ARGS -screen 320x320 -hide-cursor" ;;
> ++	    "glofiish_m800")
> ++	            DPI=3D"285"
> ++		    ARGS=3D"$ARGS -screen ${SCREEN_SIZE} -hide-cursor vt1" ;;
> ++	    "freescale_mx21ads")
> ++	    # That's what /proc/cpuinfo shows as hardware on the chumby
> ++	            DPI=3D"121"
> ++		    ARGS=3D"$ARGS -screen 320x240 -hide-cursor" ;;
> ++
> ++            # this is to rotate X display properly, tested with displ=
ay TX09D71VM1CCA
> ++            ronetix*pm9261*  | ronetix*pm9263*)
> ++         	    ARGS=3D"$ARGS -screen 240/54x320/81@90x16" ;;
> ++	    # This is a fallback for PCs
> ++	    "")
> ++		    if [ -f $BINDIR/Xvesa ]; then
> ++			    ARGS=3D"$ARGS -mode 0x0114"
> ++		    else
> ++			# It is a device we do not know about, in which case we force
> ++			# kdrive to use the current framebuffer geometry -- otherwise
> ++			# it will default to trying to achieve 1024x768
> ++			if [ "$XSERVER" !=3D "Xorg" ] ; then
> ++			    ARGS=3D"$ARGS -screen ${SCREEN_SIZE}"
> ++			fi
> ++		    fi
> ++    esac
> ++fi
> ++
> ++if [ "$XSERVER" !=3D "Xorg" ] ; then
> ++    ARGS=3D"$ARGS $MOUSE"
> ++fi
> +--
> +1.6.3.3
> +
> diff --git a/recipes/xserver-common/xserver-common-1.30/0025-Makefile-m=
ove-modmaps-install-xserver-common.patch b/recipes/xserver-common/xserver=
-common-1.30/0025-Makefile-move-modmaps-install-xserver-common.patch
> new file mode 100644
> index 0000000..1389867
> --- /dev/null
> +++ b/recipes/xserver-common/xserver-common-1.30/0025-Makefile-move-mod=
maps-install-xserver-common.patch
> @@ -0,0 +1,32 @@
> +From 309ba3de37f0374c72c4569186e381a3272c24bc Mon Sep 17 00:00:00 2001=

> +From: Marcin Juszkiewicz<marcin@juszkiewicz.com.pl>
> +Date: Mon, 31 Aug 2009 12:47:05 +0200
> +Subject: [PATCH 1/1] Makefile: move modmaps, install xserver-common
> +
> +---
> + Makefile |    6 ++++--
> + 1 file changed, 4 insertions(+), 2 deletions(-)
> +
> +--- xserver-common-1.30.orig/Makefile
> ++++ xserver-common-1.30/Makefile
> +@@ -15,16 +15,18 @@ endif
> + all:
> +
> + install-program:
> + 	for i in X11/Xsession.d X11/Xinit.d; do install -d $(DESTDIR)/etc/$$=
i; FILES=3D`echo $$i/* | sed "s:$$i/CVS::"`; install -m 755 $$FILES $(DES=
TDIR)/etc/$$i/; done
> + 	install -d $(DESTDIR)$(PREFIX)/bin
> ++	install -d $(DESTDIR)/etc/X11/xmodmap
> + 	install -m 755 run-calibrate.sh $(DESTDIR)$(PREFIX)/bin/run-calibrat=
e.sh
> + 	install -m 644 X11/Xdefaults $(DESTDIR)/etc/X11/Xdefaults
> + 	install -m 755 X11/Xinit $(DESTDIR)/etc/X11/Xinit
> + 	install -m 755 X11/Xserver $(DESTDIR)/etc/X11/Xserver
> ++	install -m 644 X11/xserver-common $(DESTDIR)/etc/X11/xserver-common
> + 	install -m 755 X11/Xsession $(DESTDIR)/etc/X11/Xsession
> +-	install -m 644 X11/xmodmap/*.xmodmap $(DESTDIR)/etc/X11/
> +-	install -m 644 X11/xmodmap-* $(DESTDIR)/etc/X11/
> ++	install -m 644 X11/xmodmap/* $(DESTDIR)/etc/X11/xmodmap/
> ++	install -m 644 X11/xmodmap-* $(DESTDIR)/etc/X11/xmodmap/
> +
> + clean:
> +
> + include $(BUILD)/Makefile.dpkg_ipkg
> diff --git a/recipes/xserver-common/xserver-common-1.30/0026-98keymap-f=
ixup-fixed-path-to-xmodmap-file.patch b/recipes/xserver-common/xserver-co=
mmon-1.30/0026-98keymap-fixup-fixed-path-to-xmodmap-file.patch
> new file mode 100644
> index 0000000..a667c5f
> --- /dev/null
> +++ b/recipes/xserver-common/xserver-common-1.30/0026-98keymap-fixup-fi=
xed-path-to-xmodmap-file.patch
> @@ -0,0 +1,25 @@
> +From 884521a985831e9f6eb231bc8dd96613ca90c636 Mon Sep 17 00:00:00 2001=

> +From: Marcin Juszkiewicz<marcin@juszkiewicz.com.pl>
> +Date: Mon, 31 Aug 2009 12:53:29 +0200
> +Subject: [PATCH 1/1] 98keymap-fixup: fixed path to xmodmap file
> +
> +---
> + X11/Xinit.d/98keymap-fixup |    2 +-
> + 1 files changed, 1 insertions(+), 1 deletions(-)
> +
> +diff --git a/X11/Xinit.d/98keymap-fixup b/X11/Xinit.d/98keymap-fixup
> +index fcc84d9..6895e24 100755
> +--- a/X11/Xinit.d/98keymap-fixup
> ++++ b/X11/Xinit.d/98keymap-fixup
> +@@ -3,7 +3,7 @@
> + # kdrive 1.4 and up have a heisenbug where it may take multiple tries=
 to apply a modmap
> + iter=3D0
> + while [ $(xmodmap -pke | awk '{if ($2 =3D=3D 36) { if ($4 =3D=3D "Ret=
urn") { print "good" } else {print "bad" }}}') =3D "bad" ] ; do
> +-	xmodmap -</etc/X11/default.xmodmap
> ++	xmodmap -</etc/X11/xmodmap/default.xmodmap
> + 	let iter=3Diter+1
> + done
> +
> +--
> +1.6.3.3
> +
> diff --git a/recipes/xserver-common/xserver-common_1.30.bb b/recipes/xs=
erver-common/xserver-common_1.30.bb
> new file mode 100644
> index 0000000..797b831
> --- /dev/null
> +++ b/recipes/xserver-common/xserver-common_1.30.bb
> @@ -0,0 +1,31 @@
> +DESCRIPTION =3D "Common X11 scripts and support files"
> +LICENSE =3D "GPL"
> +SECTION =3D "x11"
> +RDEPENDS_${PN} =3D "xmodmap xrandr xdpyinfo"
> +RRECOMMENDS_${PN} =3D "xtscal"
> +PR =3D "r5"
> +
> +PACKAGE_ARCH =3D "all"
> +DEFAULT_PREFERENCE =3D "-1"
> +
> +# we are using a gpe-style Makefile
> +inherit gpe
> +
> +SRC_URI_append =3D " file://setDPI.sh \
> +                   file://89xdgautostart.sh \
> +file://0018-zaurus-fixed-machine-names.patch;patch=3D1 \
> +file://0019-keymap-fixed-machine-names.patch;patch=3D1 \
> +file://0020-keymap-fixed-machine-names-again.patch;patch=3D1 \
> +file://0021-xserver-introduced-MOUSE-variable-for-mouse-argument.patch=
;patch=3D1 \
> +file://0022-xserver-fix-syntax-error.patch;patch=3D1 \
> +file://0023-Xserver-provide-screen-argument-only-for-non-X.org-s.patch=
;patch=3D1 \
> +file://0024-Xserver-move-nearly-whole-functionality-to-xserver-c.patch=
;patch=3D1 \
> +file://0025-Makefile-move-modmaps-install-xserver-common.patch;patch=3D=
1 \
> +file://0026-98keymap-fixup-fixed-path-to-xmodmap-file.patch;patch=3D1 =
\
> +"
> +
> +do_install_append() {
> +	install -m 0755 "${WORKDIR}/setDPI.sh" "${D}/etc/X11/Xinit.d/50setdpi=
"
> +	install -m 0755 "${WORKDIR}/89xdgautostart.sh" "${D}/etc/X11/Xsession=
=2Ed/89xdgautostart"
> +	sed -i 's:^BINDIR=3D.*$:BINDIR=3D${bindir}:' ${D}/etc/X11/Xserver
> +}


--------------ms020307080008080007000902
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIJRTCCAv0w
ggJmoAMCAQICECwlen/oUcoDd1VrNqKp/fwwDQYJKoZIhvcNAQEFBQAwYjELMAkGA1UEBhMCWkEx
JTAjBgNVBAoTHFRoYXd0ZSBDb25zdWx0aW5nIChQdHkpIEx0ZC4xLDAqBgNVBAMTI1RoYXd0ZSBQ
ZXJzb25hbCBGcmVlbWFpbCBJc3N1aW5nIENBMB4XDTA5MDQxNTAwNDQ1OFoXDTEwMDQxNTAwNDQ1
OFowYjERMA8GA1UEBBMIQmFsaXN0ZXIxDzANBgNVBCoTBlBoaWxpcDEYMBYGA1UEAxMPUGhpbGlw
IEJhbGlzdGVyMSIwIAYJKoZIhvcNAQkBFhNwaGlsaXBAYmFsaXN0ZXIub3JnMIIBIjANBgkqhkiG
9w0BAQEFAAOCAQ8AMIIBCgKCAQEAx5Xoie8CV9dJeiaiKRdylvicHE9Aha6f9/CLlVs+Ezob7fIu
Ra4P9ugzZZ2VCtPMQU3Qsjw35mVmYaKXB1U+fZeffbyad6OJEIK1jhqBIz5jtJMc/YWXn/bRmqCl
MfTCgilUMOcsfiHAbmLVhYiNbEhOuy6vWdxSSolHqVa/IHE72qqjhoYWHd+5XVfx1c4jW+CePNMQ
EHxjCzuD+wq6Mzle72dXw+bnyIpG99hB26uNmV//h5iz1VmJU63FZWynSjG79NcY9+mTWXeX213V
V6kJ2wce2rETbYvKQ7err6NnZnG/tiwGI1M7fQqQAti+CkDciLJ129LO+APVYZQgEwIDAQABozAw
LjAeBgNVHREEFzAVgRNwaGlsaXBAYmFsaXN0ZXIub3JnMAwGA1UdEwEB/wQCMAAwDQYJKoZIhvcN
AQEFBQADgYEAIUyDAPIEniN6SUdbDiBqi2dtITdnkoUItm/tX9TRn66P0VtWug7k7xjo6piWRE7B
ZwhihotNY0ZnjlK+h0VorxfY63B5tarRB6qJ7f26ukmpltwWWLDB2hWFoKUCn6PE2NTdj+1xNinh
ZNQHy4GyygXjlVfVSn/ZnaGJ31z4PK0wggL9MIICZqADAgECAhAsJXp/6FHKA3dVazaiqf38MA0G
CSqGSIb3DQEBBQUAMGIxCzAJBgNVBAYTAlpBMSUwIwYDVQQKExxUaGF3dGUgQ29uc3VsdGluZyAo
UHR5KSBMdGQuMSwwKgYDVQQDEyNUaGF3dGUgUGVyc29uYWwgRnJlZW1haWwgSXNzdWluZyBDQTAe
Fw0wOTA0MTUwMDQ0NThaFw0xMDA0MTUwMDQ0NThaMGIxETAPBgNVBAQTCEJhbGlzdGVyMQ8wDQYD
VQQqEwZQaGlsaXAxGDAWBgNVBAMTD1BoaWxpcCBCYWxpc3RlcjEiMCAGCSqGSIb3DQEJARYTcGhp
bGlwQGJhbGlzdGVyLm9yZzCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAMeV6InvAlfX
SXomoikXcpb4nBxPQIWun/fwi5VbPhM6G+3yLkWuD/boM2WdlQrTzEFN0LI8N+ZlZmGilwdVPn2X
n328mnejiRCCtY4agSM+Y7STHP2Fl5/20ZqgpTH0woIpVDDnLH4hwG5i1YWIjWxITrsur1ncUkqJ
R6lWvyBxO9qqo4aGFh3fuV1X8dXOI1vgnjzTEBB8Yws7g/sKujM5Xu9nV8Pm58iKRvfYQdurjZlf
/4eYs9VZiVOtxWVsp0oxu/TXGPfpk1l3l9td1VepCdsHHtqxE22LykO3q6+jZ2Zxv7YsBiNTO30K
kALYvgpA3IiyddvSzvgD1WGUIBMCAwEAAaMwMC4wHgYDVR0RBBcwFYETcGhpbGlwQGJhbGlzdGVy
Lm9yZzAMBgNVHRMBAf8EAjAAMA0GCSqGSIb3DQEBBQUAA4GBACFMgwDyBJ4jeklHWw4gaotnbSE3
Z5KFCLZv7V/U0Z+uj9FbVroO5O8Y6OqYlkROwWcIYoaLTWNGZ45SvodFaK8X2OtwebWq0Qeqie39
urpJqZbcFliwwdoVhaClAp+jxNjU3Y/tcTYp4WTUB8uBssoF45VX1Up/2Z2hid9c+DytMIIDPzCC
AqigAwIBAgIBDTANBgkqhkiG9w0BAQUFADCB0TELMAkGA1UEBhMCWkExFTATBgNVBAgTDFdlc3Rl
cm4gQ2FwZTESMBAGA1UEBxMJQ2FwZSBUb3duMRowGAYDVQQKExFUaGF3dGUgQ29uc3VsdGluZzEo
MCYGA1UECxMfQ2VydGlmaWNhdGlvbiBTZXJ2aWNlcyBEaXZpc2lvbjEkMCIGA1UEAxMbVGhhd3Rl
IFBlcnNvbmFsIEZyZWVtYWlsIENBMSswKQYJKoZIhvcNAQkBFhxwZXJzb25hbC1mcmVlbWFpbEB0
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
etMq/gAAAAAAAA==

--------------ms020307080008080007000902--
