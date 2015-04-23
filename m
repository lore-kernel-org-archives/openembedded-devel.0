Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 1F80B6AC24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Apr 2015 15:48:45 +0000 (UTC)
Received: by wiax7 with SMTP id x7so15639644wia.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Apr 2015 08:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=vaQmUipCwvde1ptTw16aD9d4srUPovspLOetZCFGZdE=;
	b=P10mhGe/gJ1ua+nJqBoiFJDsPz0xD5jay5crcsYdpMUO8e5aFqixEsEks1j6hql5hb
	ifgSds6S19N3jZ48/TlY8fZccmdnJ9Ll58ejCBVwxFVIV3kKAIy5I825aGVQ8A9YDVOd
	It1UcwBfahGkE7hpvB3vFrsOeX6gzTIeW2kMHMG0IyVTrPlq0IiAkhlbV3MSTP1r07Iz
	cm9hgiHrpFInhB+hddnBR+xEylI4ZIi+IeiYKBKvCU3xJfs9Gqt6qNFZSTGIj10xJqCD
	KrfF36yzEteaTlt9zucWUwYwmHxnydZlA5FTFvDnkDTwyvVbHsMItLjNBHc7MAGjG6Jt
	abFA==
X-Received: by 10.194.238.161 with SMTP id vl1mr6593873wjc.144.1429804126562; 
	Thu, 23 Apr 2015 08:48:46 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id
	i10sm12704027wja.40.2015.04.23.08.48.45
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Apr 2015 08:48:45 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 23 Apr 2015 17:48:59 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150423154859.GD2336@jama>
References: <mailman.3164.1429799845.1448.openembedded-devel@lists.openembedded.org>
	<55390CB2.4070603@bertux.com>
MIME-Version: 1.0
In-Reply-To: <55390CB2.4070603@bertux.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH] dialog-static: blacklist
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
X-List-Received-Date: Thu, 23 Apr 2015 15:48:46 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 23, 2015 at 12:16:02PM -0300, Fabio Berton wrote:
> Hi!
> I fixed this adding the function below on dialog-static recipe, the=20
> function add --static flag to pkg-config.
>=20
> do_configure_prepend(){
>      sed -i 's,pkg-config,pkg-config --static,g' -i configure

add some anchors so that re-executing do_configure doesn't duplicate
--static parameter and please send a patch.

> }
>=20
>=20
> On 04/23/2015 11:37 AM,=20
> openembedded-devel-request@lists.openembedded.org wrote:
> > Send Openembedded-devel mailing list submissions to
> > 	openembedded-devel@lists.openembedded.org
> >
> > To subscribe or unsubscribe via the World Wide Web, visit
> > 	http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > or, via email, send a message with subject or body 'help' to
> > 	openembedded-devel-request@lists.openembedded.org
> >
> > You can reach the person managing the list at
> > 	openembedded-devel-owner@lists.openembedded.org
> >
> > When replying, please edit your Subject line so it is more specific
> > than "Re: Contents of Openembedded-devel digest..."
> >
> >
> > Today's Topics:
> >
> >     1. Re: [meta-oe][PATCH V5] bluez collection: add (moved from
> >        oe-core) (Iorga, Cristian)
> >     2. Re: [meta-qt5][PATCH]] qtwebchannel md5 error (Martin Jansa)
> >
> >
> > ----------------------------------------------------------------------
> >
> > Message: 1
> > Date: Thu, 23 Apr 2015 14:31:59 +0000
> > From: "Iorga, Cristian" <cristian.iorga@intel.com>
> > To: "openembedded-devel@lists.openembedded.org"
> > 	<openembedded-devel@lists.openembedded.org>
> > Subject: Re: [oe] [meta-oe][PATCH V5] bluez collection: add (moved
> > 	from	oe-core)
> > Message-ID:
> > 	<969F26A8BAB325438E7EB80D3C3134FB2F4B4E48@irsmsx105.ger.corp.intel.com>
> > =09
> > Content-Type: text/plain; charset=3D"us-ascii"
> >
> > In v5:
> >
> > 1. Updated support for systemd;
> > 2. Updated commit message.
> >
> > Regards,
> > Cristian
> >
> > -----Original Message-----
> > From: Iorga, Cristian
> > Sent: Thursday, April 23, 2015 5:30 PM
> > To: openembedded-devel@lists.openembedded.org
> > Cc: Iorga, Cristian
> > Subject: [meta-oe][PATCH V5] bluez collection: add (moved from oe-core)
> >
> > BlueZ 4.x Bluetooth stack has been removed from oe-core.
> > However, it is still supported, so add it to recipes-connectivity in me=
ta-oe.
> >
> > In order to use it in oe-core/poky/YP, 'bluez5' backfill distro feature=
 needs to be disabled via:
> > DISTRO_FEATURES_BACKFILL_CONSIDERED =3D "bluez5" .
> > 'bluetooth' distro feature needs to be present also.
> >
> > Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
> > ---
> >   .../obsolete_automake_macros.patch                 |  14 +++
> >   .../bluez/bluez-hcidump_2.5.bb                     |  22 +++++
> >   .../bluez/bluez4-4.101/bluetooth.conf              |  16 +++
> >   .../bluez/bluez4-4.101/fix-udev-paths.patch        |  37 +++++++
> >   .../bluez/bluez4-4.101/fix_encrypt_collision.patch | 110 ++++++++++++=
+++++++++
> >   .../bluez/bluez4-4.101/install-test-script.patch   |  26 +++++
> >   ...ork-fix-network-Connect-method-parameters.patch |  30 ++++++
> >   .../bluez4-4.101/obsolete_automake_macros.patch    |  14 +++
> >   .../bluez/bluez4-4.101/sbc_mmx.patch               |  24 +++++
> >   ...pygobject-instead-ofgobject-introspection.patch |  27 +++++
> >   meta-oe/recipes-connectivity/bluez/bluez4.inc      |  48 +++++++++
> >   meta-oe/recipes-connectivity/bluez/bluez4_4.101.bb |  47 +++++++++
> >   .../bluez/gst-plugin-bluetooth_4.101.bb            |  39 ++++++++
> >   13 files changed, 454 insertions(+)
> >   create mode 100644 meta-oe/recipes-connectivity/bluez/bluez-hcidump-2=
=2E5/obsolete_automake_macros.patch
> >   create mode 100644 meta-oe/recipes-connectivity/bluez/bluez-hcidump_2=
=2E5.bb
> >   create mode 100644 meta-oe/recipes-connectivity/bluez/bluez4-4.101/bl=
uetooth.conf
> >   create mode 100644 meta-oe/recipes-connectivity/bluez/bluez4-4.101/fi=
x-udev-paths.patch
> >   create mode 100644 meta-oe/recipes-connectivity/bluez/bluez4-4.101/fi=
x_encrypt_collision.patch
> >   create mode 100644 meta-oe/recipes-connectivity/bluez/bluez4-4.101/in=
stall-test-script.patch
> >   create mode 100644 meta-oe/recipes-connectivity/bluez/bluez4-4.101/ne=
twork-fix-network-Connect-method-parameters.patch
> >   create mode 100644 meta-oe/recipes-connectivity/bluez/bluez4-4.101/ob=
solete_automake_macros.patch
> >   create mode 100644 meta-oe/recipes-connectivity/bluez/bluez4-4.101/sb=
c_mmx.patch
> >   create mode 100644 meta-oe/recipes-connectivity/bluez/bluez4-4.101/us=
e-legacy-pygobject-instead-ofgobject-introspection.patch
> >   create mode 100644 meta-oe/recipes-connectivity/bluez/bluez4.inc
> >   create mode 100644 meta-oe/recipes-connectivity/bluez/bluez4_4.101.bb
> >   create mode 100644 meta-oe/recipes-connectivity/bluez/gst-plugin-blue=
tooth_4.101.bb
> >
> > diff --git a/meta-oe/recipes-connectivity/bluez/bluez-hcidump-2.5/obsol=
ete_automake_macros.patch b/meta-oe/recipes-connectivity/bluez/bluez-hcidum=
p-2.5/obsolete_automake_macros.patch
> > new file mode 100644
> > index 0000000..0c77f1a
> > --- /dev/null
> > +++ b/meta-oe/recipes-connectivity/bluez/bluez-hcidump-2.5/obsolete_auto
> > +++ make_macros.patch
> > @@ -0,0 +1,14 @@
> > +Upstream-Status: Pending [package obsolete/not maintained by upstream]
> > +
> > +Signed-off-by: Marko Lindqvist <cazfi74@gmail.com> diff -Nurd
> > +bluez-hcidump-2.5/configure.ac bluez-hcidump-2.5/configure.ac
> > +--- bluez-hcidump-2.5/configure.ac	2012-11-30 10:29:41.000000000 +0200
> > ++++ bluez-hcidump-2.5/configure.ac	2013-01-12 10:02:10.609511463 +0200
> > +@@ -2,7 +2,7 @@
> > + AC_INIT(bluez-hcidump, 2.5)
> > +
> > + AM_INIT_AUTOMAKE([foreign subdir-objects])
> > +-AM_CONFIG_HEADER(config.h)
> > ++AC_CONFIG_HEADERS(config.h)
> > +
> > + m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
> > diff --git a/meta-oe/recipes-connectivity/bluez/bluez-hcidump_2.5.bb b/=
meta-oe/recipes-connectivity/bluez/bluez-hcidump_2.5.bb
> > new file mode 100644
> > index 0000000..3950630
> > --- /dev/null
> > +++ b/meta-oe/recipes-connectivity/bluez/bluez-hcidump_2.5.bb
> > @@ -0,0 +1,22 @@
> > +SUMMARY =3D "Linux Bluetooth Stack HCI Debugger Tool"
> > +DESCRIPTION =3D "The hcidump tool reads raw HCI data coming from and
> > +going to a Bluetooth device \ and displays the commands, events and da=
ta in a human-readable form."
> > +
> > +SECTION =3D "console"
> > +# hcidump was integrated into bluez5
> > +DEPENDS =3D "bluez4"
> > +RCONFLICTS_${PN} =3D "bluez5"
> > +LICENSE =3D "GPLv2+"
> > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Deb723b61539feef013de476e68b=
5c50a \
> > +                    file://src/hcidump.c;beginline=3D1;endline=3D23;md=
5=3D3bee3a162dff43a5be7470710b99fbcf"
> > +PR =3D "r1"
> > +
> > +SRC_URI =3D "http://www.kernel.org/pub/linux/bluetooth/bluez-hcidump-$=
{PV}.tar.gz \
> > +           file://obsolete_automake_macros.patch \ "
> > +
> > +SRC_URI[md5sum] =3D "2eab54bbd2b59a2ed4274ebb9390cf18"
> > +SRC_URI[sha256sum] =3D "9b7c52b375081883738cf049ecabc103b97d094b19c654=
4fb241267905d88881"
> > +S =3D "${WORKDIR}/bluez-hcidump-${PV}"
> > +
> > +inherit autotools
> > diff --git a/meta-oe/recipes-connectivity/bluez/bluez4-4.101/bluetooth.=
conf b/meta-oe/recipes-connectivity/bluez/bluez4-4.101/bluetooth.conf
> > new file mode 100644
> > index 0000000..ca5e9e4
> > --- /dev/null
> > +++ b/meta-oe/recipes-connectivity/bluez/bluez4-4.101/bluetooth.conf
> > @@ -0,0 +1,16 @@
> > +<!-- This configuration file specifies the required security policies
> > +     for Bluetooth core daemon to work. -->
> > +
> > +<!DOCTYPE busconfig PUBLIC "-//freedesktop//DTD D-BUS Bus Configuratio=
n 1.0//EN"
> > + "http://www.freedesktop.org/standards/dbus/1.0/busconfig.dtd">
> > +<busconfig>
> > +
> > +  <!-- ../system.conf have denied everything, so we just punch some
> > + holes -->
> > +
> > +  <policy context=3D"default">
> > +    <allow own=3D"org.bluez"/>
> > +    <allow send_destination=3D"org.bluez"/>
> > +    <allow send_interface=3D"org.bluez.Agent"/>
> > +  </policy>
> > +
> > +</busconfig>
> > diff --git a/meta-oe/recipes-connectivity/bluez/bluez4-4.101/fix-udev-p=
aths.patch b/meta-oe/recipes-connectivity/bluez/bluez4-4.101/fix-udev-paths=
=2Epatch
> > new file mode 100644
> > index 0000000..8089914
> > --- /dev/null
> > +++ b/meta-oe/recipes-connectivity/bluez/bluez4-4.101/fix-udev-paths.pat
> > +++ ch
> > @@ -0,0 +1,37 @@
> > +Add udevdir/udevrulesdir options
> > +
> > +Upstream-Status: Inappropriate [configuration]
> > +Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
> > +
> > +Index: bluez-4.101/Makefile.am
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +--- bluez-4.101.orig/Makefile.am
> > ++++ bluez-4.101/Makefile.am
> > +@@ -395,7 +395,7 @@ EXTRA_DIST +=3D audio/bluetooth.conf  include
> > +Makefile.tools
> > +
> > + if DATAFILES
> > +-rulesdir =3D @UDEV_DIR@/rules.d
> > ++rulesdir =3D @UDEV_RULES_DIR@
> > +
> > + udev_files =3D
> > +
> > +Index: bluez-4.101/configure.ac
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +--- bluez-4.101.orig/configure.ac
> > ++++ bluez-4.101/configure.ac
> > +@@ -61,4 +61,14 @@ if (test -n "${path_systemdunit}"); then  fi
> > +AM_CONDITIONAL(SYSTEMD, test -n "${path_systemdunit}")
> > +
> > ++AC_ARG_WITH([udevdir],
> > ++    AS_HELP_STRING([--with-udevdir=3DDIR], [udev directory]),
> > ++    [], [with_udevdir=3D/lib/udev/])
> > ++AC_SUBST([UDEV_DIR], [$with_udevdir])
> > ++
> > ++AC_ARG_WITH([udevrulesdir],
> > ++    AS_HELP_STRING([--with-udevrulesdir=3DDIR], [udev rules directory=
]),
> > ++    [], [with_udevrulesdir=3D/lib/udev/rules.d])
> > ++AC_SUBST([UDEV_RULES_DIR], [$with_udevrulesdir])
> > ++
> > + AC_OUTPUT(Makefile doc/version.xml src/bluetoothd.8
> > + src/bluetooth.service bluez.pc)
> > diff --git a/meta-oe/recipes-connectivity/bluez/bluez4-4.101/fix_encryp=
t_collision.patch b/meta-oe/recipes-connectivity/bluez/bluez4-4.101/fix_enc=
rypt_collision.patch
> > new file mode 100644
> > index 0000000..1bc390f
> > --- /dev/null
> > +++ b/meta-oe/recipes-connectivity/bluez/bluez4-4.101/fix_encrypt_collis
> > +++ ion.patch
> > @@ -0,0 +1,110 @@
> > +Avoid namepspace collision with encrypt function from libc
> > +
> > +Upstream-Status: Pending
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +Index: bluez-4.101/test/l2test.c
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +--- bluez-4.101.orig/test/l2test.c
> > ++++ bluez-4.101/test/l2test.c
> > +@@ -107,7 +107,7 @@ static char *filename =3D NULL;  static int rfcmod=
e =3D
> > +0;  static int master =3D 0;  static int auth =3D 0; -static int encry=
pt =3D
> > +0;
> > ++static int encryption_request =3D 0;
> > + static int secure =3D 0;
> > + static int socktype =3D SOCK_SEQPACKET;
> > + static int linger =3D 0;
> > +@@ -340,7 +340,7 @@ static int do_connect(char *svr)
> > + 		opt |=3D L2CAP_LM_MASTER;
> > + 	if (auth)
> > + 		opt |=3D L2CAP_LM_AUTH;
> > +-	if (encrypt)
> > ++	if (encryption_request)
> > + 		opt |=3D L2CAP_LM_ENCRYPT;
> > + 	if (secure)
> > + 		opt |=3D L2CAP_LM_SECURE;
> > +@@ -475,7 +475,7 @@ static void do_listen(void (*handler)(in
> > + 		opt |=3D L2CAP_LM_MASTER;
> > + 	if (auth)
> > + 		opt |=3D L2CAP_LM_AUTH;
> > +-	if (encrypt)
> > ++	if (encryption_request)
> > + 		opt |=3D L2CAP_LM_ENCRYPT;
> > + 	if (secure)
> > + 		opt |=3D L2CAP_LM_SECURE;
> > +@@ -1407,7 +1407,7 @@ int main(int argc, char *argv[])
> > + 			break;
> > +
> > + 		case 'E':
> > +-			encrypt =3D 1;
> > ++			encryption_request =3D 1;
> > + 			break;
> > +
> > + 		case 'S':
> > +Index: bluez-4.101/test/rctest.c
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +--- bluez-4.101.orig/test/rctest.c
> > ++++ bluez-4.101/test/rctest.c
> > +@@ -79,7 +79,7 @@ static char *filename =3D NULL;
> > +
> > + static int master =3D 0;
> > + static int auth =3D 0;
> > +-static int encrypt =3D 0;
> > ++static int encryption_request =3D 0;
> > + static int secure =3D 0;
> > + static int socktype =3D SOCK_STREAM;
> > + static int linger =3D 0;
> > +@@ -200,7 +200,7 @@ static int do_connect(const char *svr)
> > + 		opt |=3D RFCOMM_LM_MASTER;
> > + 	if (auth)
> > + 		opt |=3D RFCOMM_LM_AUTH;
> > +-	if (encrypt)
> > ++	if (encryption_request)
> > + 		opt |=3D RFCOMM_LM_ENCRYPT;
> > + 	if (secure)
> > + 		opt |=3D RFCOMM_LM_SECURE;
> > +@@ -291,7 +291,7 @@ static void do_listen(void (*handler)(in
> > + 		opt |=3D RFCOMM_LM_MASTER;
> > + 	if (auth)
> > + 		opt |=3D RFCOMM_LM_AUTH;
> > +-	if (encrypt)
> > ++	if (encryption_request)
> > + 		opt |=3D RFCOMM_LM_ENCRYPT;
> > + 	if (secure)
> > + 		opt |=3D RFCOMM_LM_SECURE;
> > +@@ -701,7 +701,7 @@ int main(int argc, char *argv[])
> > + 			break;
> > +
> > + 		case 'E':
> > +-			encrypt =3D 1;
> > ++			encryption_request =3D 1;
> > + 			break;
> > +
> > + 		case 'S':
> > +Index: bluez-4.101/src/textfile.h
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +--- bluez-4.101.orig/src/textfile.h
> > ++++ bluez-4.101/src/textfile.h
> > +@@ -24,6 +24,8 @@
> > + #ifndef __TEXTFILE_H
> > + #define __TEXTFILE_H
> > +
> > ++#include <sys/types.h>
> > ++
> > + int create_dirs(const char *filename, const mode_t mode);  int
> > +create_file(const char *filename, const mode_t mode);  int
> > +create_name(char *buf, size_t size, const char *path,
> > +Index: bluez-4.101/test/attest.c
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +--- bluez-4.101.orig/test/attest.c
> > ++++ bluez-4.101/test/attest.c
> > +@@ -34,6 +34,7 @@
> > + #include <termios.h>
> > + #include <sys/ioctl.h>
> > + #include <sys/socket.h>
> > ++#include <sys/select.h>
> > +
> > + #include <bluetooth/bluetooth.h>
> > + #include <bluetooth/rfcomm.h>
> > diff --git a/meta-oe/recipes-connectivity/bluez/bluez4-4.101/install-te=
st-script.patch b/meta-oe/recipes-connectivity/bluez/bluez4-4.101/install-t=
est-script.patch
> > new file mode 100644
> > index 0000000..23f7d99
> > --- /dev/null
> > +++ b/meta-oe/recipes-connectivity/bluez/bluez4-4.101/install-test-scrip
> > +++ t.patch
> > @@ -0,0 +1,26 @@
> > +Upstream-Status: Inappropriate
> > +
> > +Install the bluez's test scripts
> > +
> > +Signed-off-by: Zhong Hongbo <hongbo.zhong@windriver.com> diff -Nurd
> > +bluez-4.101.orig/Makefile.tools bluez-4.101/Makefile.tools
> > +--- bluez-4.101.orig/Makefile.tools	2013-11-19 15:49:07.688838000 +0800
> > ++++ bluez-4.101/Makefile.tools	2013-11-19 15:50:09.256837848 +0800
> > +@@ -227,6 +227,17 @@
> > + 		test/service-spp.xml test/service-opp.xml test/service-ftp.xml \
> > + 		test/simple-player test/test-nap
> > +
> > ++bluez4_testdir =3D $(libdir)/bluez4/test/ dist_bluez4_test_SCRIPTS =3D
> > ++test/sap-client test/hsplay test/hsmicro \
> > ++		test/monitor-bluetooth test/list-devices \
> > ++		test/test-discovery test/test-manager test/test-adapter \
> > ++		test/test-device test/test-service test/test-serial \
> > ++		test/test-telephony test/test-network test/simple-agent \
> > ++		test/simple-service test/simple-endpoint test/test-audio \
> > ++		test/test-input test/test-sap-server test/test-oob \
> > ++		test/test-attrib test/test-proximity test/test-thermometer \
> > ++		test/test-serial-proxy test/test-health test/test-health-sink \
> > ++		test/simple-player test/test-nap
> > + if HIDD
> > + bin_PROGRAMS +=3D compat/hidd
> > +
> > diff --git a/meta-oe/recipes-connectivity/bluez/bluez4-4.101/network-fi=
x-network-Connect-method-parameters.patch b/meta-oe/recipes-connectivity/bl=
uez/bluez4-4.101/network-fix-network-Connect-method-parameters.patch
> > new file mode 100644
> > index 0000000..37f9199
> > --- /dev/null
> > +++ b/meta-oe/recipes-connectivity/bluez/bluez4-4.101/network-fix-networ
> > +++ k-Connect-method-parameters.patch
> > @@ -0,0 +1,30 @@
> > +Upstream-Status: Backport
> > +Signed-off-by: Peter A. Bigot <pab@pabigot.com>
> > +
> > +From 57170b311f1468330f4a9961dc0b3ac45f97bc13 Mon Sep 17 00:00:00 2001
> > +From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
> > +Date: Sat, 30 Jun 2012 00:39:05 -0300
> > +Subject: [PATCH] network: fix network Connect() method parameters
> > +
> > +---
> > + network/connection.c |    4 +++-
> > + 1 file changed, 3 insertions(+), 1 deletion(-)
> > +
> > +diff --git a/network/connection.c b/network/connection.c index
> > +544ec3a..59423a9 100644
> > +--- a/network/connection.c
> > ++++ b/network/connection.c
> > +@@ -554,7 +554,9 @@ static void path_unregister(void *data)
> > +
> > + static const GDBusMethodTable connection_methods[] =3D {
> > + 	{ GDBUS_ASYNC_METHOD("Connect",
> > +-			NULL, NULL, connection_connect) },
> > ++				GDBUS_ARGS({"uuid", "s"}),
> > ++				GDBUS_ARGS({"interface", "s"}),
> > ++				connection_connect) },
> > + 	{ GDBUS_METHOD("Disconnect",
> > + 			NULL, NULL, connection_disconnect) },
> > + 	{ GDBUS_METHOD("GetProperties",
> > +--
> > +1.7.9.5
> > +
> > diff --git a/meta-oe/recipes-connectivity/bluez/bluez4-4.101/obsolete_a=
utomake_macros.patch b/meta-oe/recipes-connectivity/bluez/bluez4-4.101/obso=
lete_automake_macros.patch
> > new file mode 100644
> > index 0000000..1068f24
> > --- /dev/null
> > +++ b/meta-oe/recipes-connectivity/bluez/bluez4-4.101/obsolete_automake_
> > +++ macros.patch
> > @@ -0,0 +1,14 @@
> > +Upstream-Status: Backport
> > +
> > +Signed-off-by: Marko Lindqvist <cazfi74@gmail.com> diff -Nurd
> > +bluez-4.101/configure.ac bluez-4.101/configure.ac
> > +--- bluez-4.101/configure.ac	2012-06-22 19:36:49.000000000 +0300
> > ++++ bluez-4.101/configure.ac	2013-01-07 06:13:18.385888966 +0200
> > +@@ -2,7 +2,7 @@
> > + AC_INIT(bluez, 4.101)
> > +
> > + AM_INIT_AUTOMAKE([foreign subdir-objects color-tests])
> > +-AM_CONFIG_HEADER(config.h)
> > ++AC_CONFIG_HEADERS(config.h)
> > +
> > + m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
> > diff --git a/meta-oe/recipes-connectivity/bluez/bluez4-4.101/sbc_mmx.pa=
tch b/meta-oe/recipes-connectivity/bluez/bluez4-4.101/sbc_mmx.patch
> > new file mode 100644
> > index 0000000..98fab45
> > --- /dev/null
> > +++ b/meta-oe/recipes-connectivity/bluez/bluez4-4.101/sbc_mmx.patch
> > @@ -0,0 +1,24 @@
> > +on x86 and x86_64 gcc 4.7 complains
> > +
> > +sbc/sbc_primitives_mmx.c: In function 'sbc_calc_scalefactors_mmx':
> > +sbc/sbc_primitives_mmx.c:294:4: warning: asm operand 2 probably doesn't
> > +match constraints [enabled by default]
> > +sbc/sbc_primitives_mmx.c:294:4: error: impossible constraint in 'asm'
> > +
> > +This patch is taken from
> > +https://bugs.launchpad.net/ubuntu/+source/bluez/+bug/911871
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +
> > +Upstream-Status: Pending
> > +Index: bluez-4.98/sbc/sbc_primitives_mmx.c
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +--- bluez-4.98.orig/sbc/sbc_primitives_mmx.c	2011-12-21 14:53:54.00000=
0000 -0800
> > ++++ bluez-4.98/sbc/sbc_primitives_mmx.c	2012-02-24 10:07:03.422073800 =
-0800
> > +@@ -318,7 +318,7 @@
> > + 				"movl          %k0, 4(%3)\n"
> > + 			: "+r" (blk)
> > + 			: "r" (&sb_sample_f[0][ch][sb]),
> > +-				"i" ((char *) &sb_sample_f[1][0][0] -
> > ++				"r" ((char *) &sb_sample_f[1][0][0] -
> > + 					(char *) &sb_sample_f[0][0][0]),
> > + 				"r" (&scale_factor[ch][sb]),
> > + 				"r" (&consts),
> > diff --git a/meta-oe/recipes-connectivity/bluez/bluez4-4.101/use-legacy=
-pygobject-instead-ofgobject-introspection.patch b/meta-oe/recipes-connecti=
vity/bluez/bluez4-4.101/use-legacy-pygobject-instead-ofgobject-introspectio=
n.patch
> > new file mode 100644
> > index 0000000..37037f5
> > --- /dev/null
> > +++ b/meta-oe/recipes-connectivity/bluez/bluez4-4.101/use-legacy-pygobje
> > +++ ct-instead-ofgobject-introspection.patch
> > @@ -0,0 +1,27 @@
> > +Upstream-Status: Inappropriate
> > +
> > +use legacy pygobject instead of gobject-introspection
> > +
> > +Signed-off-by: Zhong Hongbo <hongbo.zhong@windriver.com>
> > +---
> > +diff -Nurd bluez-4.101.orig/test/simple-agent bluez-4.101/test/simple-=
agent
> > +--- bluez-4.101.orig/test/simple-agent	2013-11-13 17:14:08.138118159 +=
0800
> > ++++ bluez-4.101/test/simple-agent	2013-11-13 17:14:29.034118107 +0800
> > +@@ -2,7 +2,7 @@
> > +
> > + from __future__ import absolute_import, print_function,
> > + unicode_literals
> > +
> > +-from gi.repository import GObject
> > ++import gobject
> > +
> > + import sys
> > + import dbus
> > +@@ -122,7 +122,7 @@
> > + 	path =3D "/test/agent"
> > + 	agent =3D Agent(bus, path)
> > +
> > +-	mainloop =3D GObject.MainLoop()
> > ++	mainloop =3D gobject.MainLoop()
> > +
> > + 	if len(args) > 1:
> > + 		if len(args) > 2:
> > diff --git a/meta-oe/recipes-connectivity/bluez/bluez4.inc b/meta-oe/re=
cipes-connectivity/bluez/bluez4.inc
> > new file mode 100644
> > index 0000000..80886c2
> > --- /dev/null
> > +++ b/meta-oe/recipes-connectivity/bluez/bluez4.inc
> > @@ -0,0 +1,48 @@
> > +SUMMARY =3D "Linux Bluetooth Stack Userland V4"
> > +DESCRIPTION =3D "Linux Bluetooth stack V4 userland components.  These =
include a system configurations, daemons, tools and system libraries."
> > +HOMEPAGE =3D "http://www.bluez.org"
> > +SECTION =3D "libs"
> > +LICENSE =3D "GPLv2+ & LGPLv2.1+"
> > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D12f884d2ae1ff87c09e5b7ccc2c=
4ca7e \
> > +                    file://COPYING.LIB;md5=3Dfb504b67c50331fc78734fed9=
0fb0e09 \
> > +                    file://src/main.c;beginline=3D1;endline=3D24;md5=
=3D9bc54b93cd7e17bf03f52513f39f926e \
> > +                    file://sbc/sbc.c;beginline=3D1;endline=3D25;md5=3D=
1a40781ed30d50d8639323a184aeb191"
> > +DEPENDS =3D "udev libusb dbus-glib glib-2.0 libcheck readline libsndfi=
le1"
> > +RDEPENDS_${PN}-dev =3D "bluez-hcidump"
> > +
> > +PACKAGECONFIG ??=3D "\
> > +    ${@bb.utils.contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)}\
> > +    ${@bb.utils.contains('DISTRO_FEATURES', 'pie', 'pie', '', d)}\
> > +    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd','systemd', '',
> > +d)} \ "
> > +PACKAGECONFIG[alsa] =3D "--enable-alsa,--disable-alsa,alsa-lib"
> > +PACKAGECONFIG[pie] =3D "--enable-pie,--disable-pie,"
> > +PACKAGECONFIG[systemd] =3D "--with-systemdunitdir=3D${systemd_unitdir}=
/system/,--with-systemdunitdir=3D"
> > +
> > +ASNEEDED =3D ""
> > +
> > +SRC_URI =3D "${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.gz"
> > +S =3D "${WORKDIR}/bluez-${PV}"
> > +
> > +inherit autotools-brokensep pkgconfig systemd
> > +
> > +EXTRA_OECONF =3D "\
> > +    --disable-gstreamer \
> > +    --enable-usb \
> > +    --enable-tools \
> > +    --enable-bccmd \
> > +    --enable-hid2hci \
> > +    --enable-dfutool \
> > +    --disable-hidd \
> > +    --disable-pand \
> > +    --disable-dund \
> > +    --disable-cups \
> > +    --enable-test \
> > +    --enable-datafiles \
> > +    --with-udevdir=3D`pkg-config --variable=3Dudevdir udev` \
> > +    --with-udevrulesdir=3D`pkg-config --variable=3Dudevdir udev`/rules=
=2Ed \
> > +"
> > +
> > +SYSTEMD_SERVICE_${PN} =3D "bluetooth.service"
> > +
> > +EXCLUDE_FROM_WORLD =3D "1"
> > diff --git a/meta-oe/recipes-connectivity/bluez/bluez4_4.101.bb b/meta-=
oe/recipes-connectivity/bluez/bluez4_4.101.bb
> > new file mode 100644
> > index 0000000..07740e1
> > --- /dev/null
> > +++ b/meta-oe/recipes-connectivity/bluez/bluez4_4.101.bb
> > @@ -0,0 +1,47 @@
> > +require bluez4.inc
> > +
> > +PR =3D "r11"
> > +
> > +SRC_URI +=3D "file://bluetooth.conf \
> > +            file://sbc_mmx.patch \
> > +            file://fix-udev-paths.patch \
> > +            file://obsolete_automake_macros.patch \
> > +            file://network-fix-network-Connect-method-parameters.patch=
 \
> > +            file://install-test-script.patch \
> > +            file://use-legacy-pygobject-instead-ofgobject-introspectio=
n.patch \
> > +            file://fix_encrypt_collision.patch \ "
> > +
> > +SRC_URI[md5sum] =3D "fb42cb7038c380eb0e2fa208987c96ad"
> > +SRC_URI[sha256sum] =3D "59738410ade9f0e61a13c0f77d9aaffaafe49ba9418107=
e4ad75fe52846f7487"
> > +
> > +RCONFLICTS_${PN} =3D "bluez5"
> > +
> > +do_install_append() {
> > +    install -m 0644 ${S}/audio/audio.conf ${D}/${sysconfdir}/bluetooth/
> > +    install -m 0644 ${S}/network/network.conf ${D}/${sysconfdir}/bluet=
ooth/
> > +    install -m 0644 ${S}/input/input.conf ${D}/${sysconfdir}/bluetooth/
> > +    # at_console doesn't really work with the current state of OE, so =
punch some more holes so people can actually use BT
> > +    install -m 0644 ${WORKDIR}/bluetooth.conf
> > +${D}/${sysconfdir}/dbus-1/system.d/
> > +}
> > +
> > +RDEPENDS_${PN}-dev =3D "bluez-hcidump"
> > +RDEPENDS_${PN}-testtools +=3D "python python-dbus python-pygobject"
> > +
> > +ALLOW_EMPTY_libasound-module-bluez =3D "1"
> > +PACKAGES =3D+ "libasound-module-bluez ${PN}-testtools"
> > +
> > +FILES_libasound-module-bluez =3D "${libdir}/alsa-lib/lib*.so ${datadir=
}/alsa"
> > +FILES_${PN} +=3D "${libdir}/bluetooth/plugins ${libdir}/bluetooth/plug=
ins/*.so ${base_libdir}/udev/ ${nonarch_base_libdir}/udev/ ${systemd_unitdi=
r}/ ${datadir}/dbus-1"
> > +FILES_${PN}-dev +=3D "\
> > +    ${libdir}/bluetooth/plugins/*.la \
> > +    ${libdir}/alsa-lib/*.la \
> > +"
> > +
> > +FILES_${PN}-testtools =3D "${libdir}/bluez4/test/*"
> > +
> > +FILES_${PN}-dbg +=3D "\
> > +    ${libdir}/bluetooth/plugins/.debug \
> > +    ${libdir}/*/.debug \
> > +    */udev/.debug \
> > +"
> > diff --git a/meta-oe/recipes-connectivity/bluez/gst-plugin-bluetooth_4.=
101.bb b/meta-oe/recipes-connectivity/bluez/gst-plugin-bluetooth_4.101.bb
> > new file mode 100644
> > index 0000000..6a16520
> > --- /dev/null
> > +++ b/meta-oe/recipes-connectivity/bluez/gst-plugin-bluetooth_4.101.bb
> > @@ -0,0 +1,39 @@
> > +require bluez4.inc
> > +require recipes-multimedia/gstreamer/gst-plugins-package.inc
> > +
> > +PR =3D "r1"
> > +
> > +SRC_URI[md5sum] =3D "fb42cb7038c380eb0e2fa208987c96ad"
> > +SRC_URI[sha256sum] =3D "59738410ade9f0e61a13c0f77d9aaffaafe49ba9418107=
e4ad75fe52846f7487"
> > +
> > +DEPENDS =3D "bluez4 gst-plugins-base"
> > +
> > +EXTRA_OECONF =3D "\
> > +    --enable-gstreamer \
> > +"
> > +
> > +# clean unwanted files
> > +do_install_append() {
> > +    rm -rf ${D}${bindir}
> > +    rm -rf ${D}${sbindir}
> > +    rm -f  ${D}${libdir}/lib*
> > +    rm -rf ${D}${libdir}/pkgconfig
> > +    rm -rf ${D}${sysconfdir}
> > +    rm -rf ${D}${base_libdir}
> > +    rm -rf ${D}${libdir}/bluetooth
> > +    rm -rf ${D}${localstatedir}
> > +    rm -rf ${D}${libdir}/alsa-lib
> > +    rm -rf ${D}${datadir}
> > +    rm -rf ${D}${includedir}
> > +    rm -rf ${D}${nonarch_base_libdir}
> > +}
> > +
> > +FILES_${PN} =3D "${libdir}/gstreamer-0.10/lib*.so"
> > +FILES_${PN}-dev +=3D "\
> > +    ${libdir}/gstreamer-0.10/*.la \
> > +"
> > +
> > +FILES_${PN}-dbg +=3D "\
> > +    ${libdir}/*/.debug \
> > +"
> > +
> > --
> > 2.1.0
> >
> >
> >
> > ------------------------------
> >
> > Message: 2
> > Date: Thu, 23 Apr 2015 16:37:37 +0200
> > From: Martin Jansa <martin.jansa@gmail.com>
> > To: openembedded-devel@lists.openembedded.org
> > Subject: Re: [oe] [meta-qt5][PATCH]] qtwebchannel md5 error
> > Message-ID: <20150423143737.GA2336@jama>
> > Content-Type: text/plain; charset=3Diso-8859-1
> >
> > On Thu, Apr 23, 2015 at 04:03:49PM +0200, Andreas M?ller wrote:
> >> On Thu, Apr 23, 2015 at 2:24 PM, Rui Sebastiao <ruisebastiao@gmail.com=
> wrote:
> >>> ---
> >>>   recipes-qt/qt5/qtwebchannel.inc | 5 ++++-
> >>>   1 file changed, 4 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/recipes-qt/qt5/qtwebchannel.inc b/recipes-qt/qt5/qtwebch=
annel.inc
> >>> index 3cd22cf..3ed5808 100644
> >>> --- a/recipes-qt/qt5/qtwebchannel.inc
> >>> +++ b/recipes-qt/qt5/qtwebchannel.inc
> >>> @@ -4,4 +4,7 @@ DEPENDS +=3D "qtdeclarative qtwebsockets"
> >>>
> >>>   # There are no LGPLv3-only licensed files in this component.
> >>>   # There are no GPLv2 licensed files in this component.
> >>> -LIC_FILES_CHKSUM +=3D "file://LICENSE.GPLv2;md5=3De782f55badfa137e5e=
59c330f12cc8ed"
> >>> +LIC_FILES_CHKSUM =3D "file://LICENSE.GPLv2;md5=3De782f55badfa137e5e5=
9c330f12cc8ed \
> >>> +                    file://LICENSE.LGPLv21;md5=3Dcff17b12416c896e10a=
e2c17a64252e7 \
> >>> +                    file://LICENSE.LGPLv3;md5=3Dc1939be5579666be9473=
71bc8120425f \
> >>> +                   "
> >>> --
> >>> 1.9.1
> >>>
> >>> --
> >> * Missing signed off
> >> * subject contains ']]'
> > Did you test this with 5.4.1 as well as git recipe? I wonder if it
> > should be only in 5.4.1.bb.
> >
> > Right now I'm testing it with newer git revision (for 5.4.2) and I'm
> > sorry for introducing this issue last week, thanks for the patch.
> >
> >> Andreas
> >> --=20
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

