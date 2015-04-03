Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f54.google.com (mail-wg0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 5E42673CB9
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Apr 2015 17:45:02 +0000 (UTC)
Received: by wgdm6 with SMTP id m6so116169720wgd.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Apr 2015 10:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=n81iKvOP43aFrIHGK47gOq51bkCEjM2cJRbknVkToEM=;
	b=UiEjkX+aL7kaGf4tyrAcKMYALay1WYjFOLiOFQVSnwFeEq/UT2MqmzO2/nkiFFxDCC
	ZB3Q83IXAJneP7wZMIYqCHLUUjo3hWwq3DYhwux7FDAvdPdnXDCU39/Zu/CG7v76sxrh
	KNMuv8oprf2dvitHc5dhOExMJkz0HP4DMxBajleI+VeQ9xpgaFSL9ueh1OmWSUB+GgJB
	imD9wb3rDhxcH38rjHj0rYz5KRJgN9GvUva6uOwix/yXRqxH78nzJ774C5SSttgT+WnS
	pr8kf9BPED1LcHZklSPJALVx1bONAQM0OeS698HxeQO7OZJzRPMCbxgXr1I4tAMbAaTD
	TxxA==
X-Received: by 10.180.7.169 with SMTP id k9mr35029045wia.48.1428083103242;
	Fri, 03 Apr 2015 10:45:03 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	hn8sm3570787wib.18.2015.04.03.10.45.01
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 03 Apr 2015 10:45:01 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 3 Apr 2015 19:45:28 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150403174528.GO14928@jama>
References: <1428070608-23355-1-git-send-email-cristian.iorga@intel.com>
MIME-Version: 1.0
In-Reply-To: <1428070608-23355-1-git-send-email-cristian.iorga@intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH] bluez collection: add (moved from oe-core)
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
X-List-Received-Date: Fri, 03 Apr 2015 17:45:05 -0000
X-Groupsio-MsgNum: 54971
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="f0PSjARDFl/vfYT5"
Content-Disposition: inline

--f0PSjARDFl/vfYT5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 03, 2015 at 05:16:48PM +0300, Cristian Iorga wrote:
> BlueZ 4.x Bluetooth stack has been removed from oe-core.
> However, it is still supported, so add it to
> meta-oe networking layer.

"meta-oe netwrorking layer" is very confusing, did you plan to put it in me=
ta-networking?

> In order to use it in oe-core/poky/YP 'bluez4' needs to
> be added to distro features. 'bluetooth' distro feature
> needs to be present also.
>=20
> Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
> ---
>  .../obsolete_automake_macros.patch                 | 14 +++++++
>  .../bluez/bluez-hcidump_2.5.bb                     | 22 +++++++++++
>  .../bluez/bluez4-4.101/bluetooth.conf              | 16 ++++++++
>  .../bluez/bluez4-4.101/fix-udev-paths.patch        | 37 +++++++++++++++++
>  .../bluez/bluez4-4.101/install-test-script.patch   | 26 ++++++++++++
>  ...ork-fix-network-Connect-method-parameters.patch | 30 ++++++++++++++
>  .../bluez4-4.101/obsolete_automake_macros.patch    | 14 +++++++
>  .../bluez/bluez4-4.101/sbc_mmx.patch               | 24 +++++++++++
>  ...pygobject-instead-ofgobject-introspection.patch | 27 +++++++++++++
>  meta-oe/recipes-connectivity/bluez/bluez4.inc      | 46 ++++++++++++++++=
++++++
>  meta-oe/recipes-connectivity/bluez/bluez4_4.101.bb | 46 ++++++++++++++++=
++++++
>  .../bluez/gst-plugin-bluetooth_4.101.bb            | 39 ++++++++++++++++=
++
>  12 files changed, 341 insertions(+)
>  create mode 100644 meta-oe/recipes-connectivity/bluez/bluez-hcidump-2.5/=
obsolete_automake_macros.patch
>  create mode 100644 meta-oe/recipes-connectivity/bluez/bluez-hcidump_2.5.=
bb
>  create mode 100644 meta-oe/recipes-connectivity/bluez/bluez4-4.101/bluet=
ooth.conf
>  create mode 100644 meta-oe/recipes-connectivity/bluez/bluez4-4.101/fix-u=
dev-paths.patch
>  create mode 100644 meta-oe/recipes-connectivity/bluez/bluez4-4.101/insta=
ll-test-script.patch
>  create mode 100644 meta-oe/recipes-connectivity/bluez/bluez4-4.101/netwo=
rk-fix-network-Connect-method-parameters.patch
>  create mode 100644 meta-oe/recipes-connectivity/bluez/bluez4-4.101/obsol=
ete_automake_macros.patch
>  create mode 100644 meta-oe/recipes-connectivity/bluez/bluez4-4.101/sbc_m=
mx.patch
>  create mode 100644 meta-oe/recipes-connectivity/bluez/bluez4-4.101/use-l=
egacy-pygobject-instead-ofgobject-introspection.patch
>  create mode 100644 meta-oe/recipes-connectivity/bluez/bluez4.inc
>  create mode 100644 meta-oe/recipes-connectivity/bluez/bluez4_4.101.bb
>  create mode 100644 meta-oe/recipes-connectivity/bluez/gst-plugin-bluetoo=
th_4.101.bb
>=20
> diff --git a/meta-oe/recipes-connectivity/bluez/bluez-hcidump-2.5/obsolet=
e_automake_macros.patch b/meta-oe/recipes-connectivity/bluez/bluez-hcidump-=
2.5/obsolete_automake_macros.patch
> new file mode 100644
> index 0000000..0c77f1a
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/bluez/bluez-hcidump-2.5/obsolete_autom=
ake_macros.patch
> @@ -0,0 +1,14 @@
> +Upstream-Status: Pending [package obsolete/not maintained by upstream]
> +
> +Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
> +diff -Nurd bluez-hcidump-2.5/configure.ac bluez-hcidump-2.5/configure.ac
> +--- bluez-hcidump-2.5/configure.ac	2012-11-30 10:29:41.000000000 +0200
> ++++ bluez-hcidump-2.5/configure.ac	2013-01-12 10:02:10.609511463 +0200
> +@@ -2,7 +2,7 @@
> + AC_INIT(bluez-hcidump, 2.5)
> +
> + AM_INIT_AUTOMAKE([foreign subdir-objects])
> +-AM_CONFIG_HEADER(config.h)
> ++AC_CONFIG_HEADERS(config.h)
> +
> + m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
> diff --git a/meta-oe/recipes-connectivity/bluez/bluez-hcidump_2.5.bb b/me=
ta-oe/recipes-connectivity/bluez/bluez-hcidump_2.5.bb
> new file mode 100644
> index 0000000..3950630
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/bluez/bluez-hcidump_2.5.bb
> @@ -0,0 +1,22 @@
> +SUMMARY =3D "Linux Bluetooth Stack HCI Debugger Tool"
> +DESCRIPTION =3D "The hcidump tool reads raw HCI data coming from and goi=
ng to a Bluetooth device \
> +and displays the commands, events and data in a human-readable form."
> +
> +SECTION =3D "console"
> +# hcidump was integrated into bluez5
> +DEPENDS =3D "bluez4"
> +RCONFLICTS_${PN} =3D "bluez5"
> +LICENSE =3D "GPLv2+"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Deb723b61539feef013de476e68b5c=
50a \
> +                    file://src/hcidump.c;beginline=3D1;endline=3D23;md5=
=3D3bee3a162dff43a5be7470710b99fbcf"
> +PR =3D "r1"
> +
> +SRC_URI =3D "http://www.kernel.org/pub/linux/bluetooth/bluez-hcidump-${P=
V}.tar.gz \
> +           file://obsolete_automake_macros.patch \
> +"
> +
> +SRC_URI[md5sum] =3D "2eab54bbd2b59a2ed4274ebb9390cf18"
> +SRC_URI[sha256sum] =3D "9b7c52b375081883738cf049ecabc103b97d094b19c6544f=
b241267905d88881"
> +S =3D "${WORKDIR}/bluez-hcidump-${PV}"
> +
> +inherit autotools
> diff --git a/meta-oe/recipes-connectivity/bluez/bluez4-4.101/bluetooth.co=
nf b/meta-oe/recipes-connectivity/bluez/bluez4-4.101/bluetooth.conf
> new file mode 100644
> index 0000000..ca5e9e4
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/bluez/bluez4-4.101/bluetooth.conf
> @@ -0,0 +1,16 @@
> +<!-- This configuration file specifies the required security policies
> +     for Bluetooth core daemon to work. -->
> +
> +<!DOCTYPE busconfig PUBLIC "-//freedesktop//DTD D-BUS Bus Configuration =
1.0//EN"
> + "http://www.freedesktop.org/standards/dbus/1.0/busconfig.dtd">
> +<busconfig>
> +
> +  <!-- ../system.conf have denied everything, so we just punch some hole=
s -->
> +
> +  <policy context=3D"default">
> +    <allow own=3D"org.bluez"/>
> +    <allow send_destination=3D"org.bluez"/>
> +    <allow send_interface=3D"org.bluez.Agent"/>
> +  </policy>
> +
> +</busconfig>
> diff --git a/meta-oe/recipes-connectivity/bluez/bluez4-4.101/fix-udev-pat=
hs.patch b/meta-oe/recipes-connectivity/bluez/bluez4-4.101/fix-udev-paths.p=
atch
> new file mode 100644
> index 0000000..8089914
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/bluez/bluez4-4.101/fix-udev-paths.patch
> @@ -0,0 +1,37 @@
> +Add udevdir/udevrulesdir options
> +
> +Upstream-Status: Inappropriate [configuration]
> +Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
> +
> +Index: bluez-4.101/Makefile.am
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- bluez-4.101.orig/Makefile.am
> ++++ bluez-4.101/Makefile.am
> +@@ -395,7 +395,7 @@ EXTRA_DIST +=3D audio/bluetooth.conf
> + include Makefile.tools
> +=20
> + if DATAFILES
> +-rulesdir =3D @UDEV_DIR@/rules.d
> ++rulesdir =3D @UDEV_RULES_DIR@
> +=20
> + udev_files =3D
> +=20
> +Index: bluez-4.101/configure.ac
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- bluez-4.101.orig/configure.ac
> ++++ bluez-4.101/configure.ac
> +@@ -61,4 +61,14 @@ if (test -n "${path_systemdunit}"); then
> + fi
> + AM_CONDITIONAL(SYSTEMD, test -n "${path_systemdunit}")
> +=20
> ++AC_ARG_WITH([udevdir],
> ++    AS_HELP_STRING([--with-udevdir=3DDIR], [udev directory]),
> ++    [], [with_udevdir=3D/lib/udev/])
> ++AC_SUBST([UDEV_DIR], [$with_udevdir])
> ++
> ++AC_ARG_WITH([udevrulesdir],
> ++    AS_HELP_STRING([--with-udevrulesdir=3DDIR], [udev rules directory]),
> ++    [], [with_udevrulesdir=3D/lib/udev/rules.d])
> ++AC_SUBST([UDEV_RULES_DIR], [$with_udevrulesdir])
> ++
> + AC_OUTPUT(Makefile doc/version.xml src/bluetoothd.8 src/bluetooth.servi=
ce bluez.pc)
> diff --git a/meta-oe/recipes-connectivity/bluez/bluez4-4.101/install-test=
-script.patch b/meta-oe/recipes-connectivity/bluez/bluez4-4.101/install-tes=
t-script.patch
> new file mode 100644
> index 0000000..23f7d99
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/bluez/bluez4-4.101/install-test-script=
=2Epatch
> @@ -0,0 +1,26 @@
> +Upstream-Status: Inappropriate
> +
> +Install the bluez's test scripts
> +
> +Signed-off-by: Zhong Hongbo <hongbo.zhong@windriver.com>
> +diff -Nurd bluez-4.101.orig/Makefile.tools bluez-4.101/Makefile.tools
> +--- bluez-4.101.orig/Makefile.tools	2013-11-19 15:49:07.688838000 +0800
> ++++ bluez-4.101/Makefile.tools	2013-11-19 15:50:09.256837848 +0800
> +@@ -227,6 +227,17 @@
> + 		test/service-spp.xml test/service-opp.xml test/service-ftp.xml \
> + 		test/simple-player test/test-nap
> +=20
> ++bluez4_testdir =3D $(libdir)/bluez4/test/
> ++dist_bluez4_test_SCRIPTS =3D test/sap-client test/hsplay test/hsmicro \
> ++		test/monitor-bluetooth test/list-devices \
> ++		test/test-discovery test/test-manager test/test-adapter \
> ++		test/test-device test/test-service test/test-serial \
> ++		test/test-telephony test/test-network test/simple-agent \
> ++		test/simple-service test/simple-endpoint test/test-audio \
> ++		test/test-input test/test-sap-server test/test-oob \
> ++		test/test-attrib test/test-proximity test/test-thermometer \
> ++		test/test-serial-proxy test/test-health test/test-health-sink \
> ++		test/simple-player test/test-nap
> + if HIDD
> + bin_PROGRAMS +=3D compat/hidd
> +=20
> diff --git a/meta-oe/recipes-connectivity/bluez/bluez4-4.101/network-fix-=
network-Connect-method-parameters.patch b/meta-oe/recipes-connectivity/blue=
z/bluez4-4.101/network-fix-network-Connect-method-parameters.patch
> new file mode 100644
> index 0000000..37f9199
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/bluez/bluez4-4.101/network-fix-network=
-Connect-method-parameters.patch
> @@ -0,0 +1,30 @@
> +Upstream-Status: Backport
> +Signed-off-by: Peter A. Bigot <pab@pabigot.com>
> +
> +From 57170b311f1468330f4a9961dc0b3ac45f97bc13 Mon Sep 17 00:00:00 2001
> +From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
> +Date: Sat, 30 Jun 2012 00:39:05 -0300
> +Subject: [PATCH] network: fix network Connect() method parameters
> +
> +---
> + network/connection.c |    4 +++-
> + 1 file changed, 3 insertions(+), 1 deletion(-)
> +
> +diff --git a/network/connection.c b/network/connection.c
> +index 544ec3a..59423a9 100644
> +--- a/network/connection.c
> ++++ b/network/connection.c
> +@@ -554,7 +554,9 @@ static void path_unregister(void *data)
> +=20
> + static const GDBusMethodTable connection_methods[] =3D {
> + 	{ GDBUS_ASYNC_METHOD("Connect",
> +-			NULL, NULL, connection_connect) },
> ++				GDBUS_ARGS({"uuid", "s"}),
> ++				GDBUS_ARGS({"interface", "s"}),
> ++				connection_connect) },
> + 	{ GDBUS_METHOD("Disconnect",
> + 			NULL, NULL, connection_disconnect) },
> + 	{ GDBUS_METHOD("GetProperties",
> +--=20
> +1.7.9.5
> +
> diff --git a/meta-oe/recipes-connectivity/bluez/bluez4-4.101/obsolete_aut=
omake_macros.patch b/meta-oe/recipes-connectivity/bluez/bluez4-4.101/obsole=
te_automake_macros.patch
> new file mode 100644
> index 0000000..1068f24
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/bluez/bluez4-4.101/obsolete_automake_m=
acros.patch
> @@ -0,0 +1,14 @@
> +Upstream-Status: Backport
> +
> +Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
> +diff -Nurd bluez-4.101/configure.ac bluez-4.101/configure.ac
> +--- bluez-4.101/configure.ac	2012-06-22 19:36:49.000000000 +0300
> ++++ bluez-4.101/configure.ac	2013-01-07 06:13:18.385888966 +0200
> +@@ -2,7 +2,7 @@
> + AC_INIT(bluez, 4.101)
> +
> + AM_INIT_AUTOMAKE([foreign subdir-objects color-tests])
> +-AM_CONFIG_HEADER(config.h)
> ++AC_CONFIG_HEADERS(config.h)
> +
> + m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
> diff --git a/meta-oe/recipes-connectivity/bluez/bluez4-4.101/sbc_mmx.patc=
h b/meta-oe/recipes-connectivity/bluez/bluez4-4.101/sbc_mmx.patch
> new file mode 100644
> index 0000000..98fab45
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/bluez/bluez4-4.101/sbc_mmx.patch
> @@ -0,0 +1,24 @@
> +on x86 and x86_64 gcc 4.7 complains
> +
> +sbc/sbc_primitives_mmx.c: In function 'sbc_calc_scalefactors_mmx':
> +sbc/sbc_primitives_mmx.c:294:4: warning: asm operand 2 probably doesn't =
match constraints [enabled by default]
> +sbc/sbc_primitives_mmx.c:294:4: error: impossible constraint in 'asm'
> +
> +This patch is taken from https://bugs.launchpad.net/ubuntu/+source/bluez=
/+bug/911871
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
> +Upstream-Status: Pending
> +Index: bluez-4.98/sbc/sbc_primitives_mmx.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- bluez-4.98.orig/sbc/sbc_primitives_mmx.c	2011-12-21 14:53:54.0000000=
00 -0800
> ++++ bluez-4.98/sbc/sbc_primitives_mmx.c	2012-02-24 10:07:03.422073800 -0=
800
> +@@ -318,7 +318,7 @@
> + 				"movl          %k0, 4(%3)\n"
> + 			: "+r" (blk)
> + 			: "r" (&sb_sample_f[0][ch][sb]),
> +-				"i" ((char *) &sb_sample_f[1][0][0] -
> ++				"r" ((char *) &sb_sample_f[1][0][0] -
> + 					(char *) &sb_sample_f[0][0][0]),
> + 				"r" (&scale_factor[ch][sb]),
> + 				"r" (&consts),
> diff --git a/meta-oe/recipes-connectivity/bluez/bluez4-4.101/use-legacy-p=
ygobject-instead-ofgobject-introspection.patch b/meta-oe/recipes-connectivi=
ty/bluez/bluez4-4.101/use-legacy-pygobject-instead-ofgobject-introspection.=
patch
> new file mode 100644
> index 0000000..37037f5
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/bluez/bluez4-4.101/use-legacy-pygobjec=
t-instead-ofgobject-introspection.patch
> @@ -0,0 +1,27 @@
> +Upstream-Status: Inappropriate
> +
> +use legacy pygobject instead of gobject-introspection
> +
> +Signed-off-by: Zhong Hongbo <hongbo.zhong@windriver.com>
> +---
> +diff -Nurd bluez-4.101.orig/test/simple-agent bluez-4.101/test/simple-ag=
ent
> +--- bluez-4.101.orig/test/simple-agent	2013-11-13 17:14:08.138118159 +08=
00
> ++++ bluez-4.101/test/simple-agent	2013-11-13 17:14:29.034118107 +0800
> +@@ -2,7 +2,7 @@
> +=20
> + from __future__ import absolute_import, print_function, unicode_literals
> +=20
> +-from gi.repository import GObject
> ++import gobject
> +=20
> + import sys
> + import dbus
> +@@ -122,7 +122,7 @@
> + 	path =3D "/test/agent"
> + 	agent =3D Agent(bus, path)
> +=20
> +-	mainloop =3D GObject.MainLoop()
> ++	mainloop =3D gobject.MainLoop()
> +=20
> + 	if len(args) > 1:
> + 		if len(args) > 2:
> diff --git a/meta-oe/recipes-connectivity/bluez/bluez4.inc b/meta-oe/reci=
pes-connectivity/bluez/bluez4.inc
> new file mode 100644
> index 0000000..11c9616
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/bluez/bluez4.inc
> @@ -0,0 +1,46 @@
> +SUMMARY =3D "Linux Bluetooth Stack Userland V4"
> +DESCRIPTION =3D "Linux Bluetooth stack V4 userland components.  These in=
clude a system configurations, daemons, tools and system libraries."
> +HOMEPAGE =3D "http://www.bluez.org"
> +SECTION =3D "libs"
> +LICENSE =3D "GPLv2+ & LGPLv2.1+"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D12f884d2ae1ff87c09e5b7ccc2c4c=
a7e \
> +                    file://COPYING.LIB;md5=3Dfb504b67c50331fc78734fed90f=
b0e09 \
> +                    file://src/main.c;beginline=3D1;endline=3D24;md5=3D9=
bc54b93cd7e17bf03f52513f39f926e \
> +                    file://sbc/sbc.c;beginline=3D1;endline=3D25;md5=3D1a=
40781ed30d50d8639323a184aeb191"
> +DEPENDS =3D "udev libusb dbus-glib glib-2.0 libcheck readline libsndfile=
1"
> +RDEPENDS_${PN}-dev =3D "bluez-hcidump"
> +
> +PACKAGECONFIG ??=3D "\
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)}\
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'pie', 'pie', '', d)}\
> +"
> +PACKAGECONFIG[alsa] =3D "--enable-alsa,--disable-alsa,alsa-lib"
> +PACKAGECONFIG[pie] =3D "--enable-pie,--disable-pie,"
> +
> +ASNEEDED =3D ""
> +
> +SRC_URI =3D "\
> +  ${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.gz \
> +"
> +S =3D "${WORKDIR}/bluez-${PV}"
> +
> +inherit autotools-brokensep pkgconfig
> +
> +EXTRA_OECONF =3D "\
> +  --disable-gstreamer \
> +  --enable-usb \
> +  --enable-tools \
> +  --enable-bccmd \
> +  --enable-hid2hci \
> +  --enable-dfutool \
> +  --disable-hidd \
> +  --disable-pand \
> +  --disable-dund \
> +  --disable-cups \
> +  --enable-test \
> +  --enable-datafiles \
> +  --with-udevdir=3D`pkg-config --variable=3Dudevdir udev` \
> +  --with-udevrulesdir=3D`pkg-config --variable=3Dudevdir udev`/rules.d \
> +"
> +
> +EXCLUDE_FROM_WORLD =3D "1"
> diff --git a/meta-oe/recipes-connectivity/bluez/bluez4_4.101.bb b/meta-oe=
/recipes-connectivity/bluez/bluez4_4.101.bb
> new file mode 100644
> index 0000000..28a94ed
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/bluez/bluez4_4.101.bb
> @@ -0,0 +1,46 @@
> +require bluez4.inc
> +
> +PR =3D "r11"
> +
> +SRC_URI +=3D "file://bluetooth.conf \
> +            file://sbc_mmx.patch \
> +            file://fix-udev-paths.patch \
> +            file://obsolete_automake_macros.patch \
> +            file://network-fix-network-Connect-method-parameters.patch \
> +            file://install-test-script.patch \
> +            file://use-legacy-pygobject-instead-ofgobject-introspection.=
patch \
> +"
> +
> +SRC_URI[md5sum] =3D "fb42cb7038c380eb0e2fa208987c96ad"
> +SRC_URI[sha256sum] =3D "59738410ade9f0e61a13c0f77d9aaffaafe49ba9418107e4=
ad75fe52846f7487"
> +
> +RCONFLICTS_${PN} =3D "bluez5"
> +
> +do_install_append() {
> +	install -m 0644 ${S}/audio/audio.conf ${D}/${sysconfdir}/bluetooth/
> +	install -m 0644 ${S}/network/network.conf ${D}/${sysconfdir}/bluetooth/
> +	install -m 0644 ${S}/input/input.conf ${D}/${sysconfdir}/bluetooth/
> +	# at_console doesn't really work with the current state of OE, so punch=
 some more holes so people can actually use BT
> +	install -m 0644 ${WORKDIR}/bluetooth.conf ${D}/${sysconfdir}/dbus-1/sys=
tem.d/
> +}
> +
> +RDEPENDS_${PN}-dev =3D "bluez-hcidump"
> +RDEPENDS_${PN}-testtools +=3D "python python-dbus python-pygobject"
> +
> +ALLOW_EMPTY_libasound-module-bluez =3D "1"
> +PACKAGES =3D+ "libasound-module-bluez ${PN}-testtools"
> +
> +FILES_libasound-module-bluez =3D "${libdir}/alsa-lib/lib*.so ${datadir}/=
alsa"
> +FILES_${PN} +=3D "${libdir}/bluetooth/plugins ${libdir}/bluetooth/plugin=
s/*.so ${base_libdir}/udev/ ${nonarch_base_libdir}/udev/ ${systemd_unitdir}=
/ ${datadir}/dbus-1"
> +FILES_${PN}-dev +=3D "\
> +  ${libdir}/bluetooth/plugins/*.la \
> +  ${libdir}/alsa-lib/*.la \
> +"
> +
> +FILES_${PN}-testtools =3D "${libdir}/bluez4/test/*"
> +
> +FILES_${PN}-dbg +=3D "\
> +  ${libdir}/bluetooth/plugins/.debug \
> +  ${libdir}/*/.debug \
> +  */udev/.debug \
> +  "
> diff --git a/meta-oe/recipes-connectivity/bluez/gst-plugin-bluetooth_4.10=
1.bb b/meta-oe/recipes-connectivity/bluez/gst-plugin-bluetooth_4.101.bb
> new file mode 100644
> index 0000000..c71d612
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/bluez/gst-plugin-bluetooth_4.101.bb
> @@ -0,0 +1,39 @@
> +require bluez4.inc
> +require recipes-multimedia/gstreamer/gst-plugins-package.inc
> +
> +PR =3D "r1"
> +
> +SRC_URI[md5sum] =3D "fb42cb7038c380eb0e2fa208987c96ad"
> +SRC_URI[sha256sum] =3D "59738410ade9f0e61a13c0f77d9aaffaafe49ba9418107e4=
ad75fe52846f7487"
> +
> +DEPENDS =3D "bluez4 gst-plugins-base"
> +
> +EXTRA_OECONF =3D "\
> +  --enable-gstreamer \
> +"
> +
> +# clean unwanted files
> +do_install_append() {
> +	rm -rf ${D}${bindir}
> +	rm -rf ${D}${sbindir}
> +	rm -f  ${D}${libdir}/lib*
> +	rm -rf ${D}${libdir}/pkgconfig
> +	rm -rf ${D}${sysconfdir}
> +	rm -rf ${D}${base_libdir}
> +	rm -rf ${D}${libdir}/bluetooth
> +	rm -rf ${D}${localstatedir}
> +  	rm -rf ${D}${libdir}/alsa-lib
> +  	rm -rf ${D}${datadir}
> +	rm -rf ${D}${includedir}
> +	rm -rf ${D}${nonarch_base_libdir}
> +}
> +
> +FILES_${PN} =3D "${libdir}/gstreamer-0.10/lib*.so"
> +FILES_${PN}-dev +=3D "\
> +  ${libdir}/gstreamer-0.10/*.la \
> +"
> +
> +FILES_${PN}-dbg +=3D "\
> +  ${libdir}/*/.debug \
> +"
> +
> --=20
> 2.1.0
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--f0PSjARDFl/vfYT5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlUe0bgACgkQN1Ujt2V2gBxJIACcDMRputu9ydYi900krCpmYbRu
zWMAoLYP0zELUeZD3Ny0qFxvZlttaWYu
=1Zuo
-----END PGP SIGNATURE-----

--f0PSjARDFl/vfYT5--
