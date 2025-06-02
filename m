Return-Path: <ejo@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 741FDC54FB3
	for <webhook@archiver.kernel.org>; Mon,  2 Jun 2025 09:55:25 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web10.46024.1748858120680372457
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Jun 2025 02:55:20 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: ejo@pengutronix.de)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[IPv6:::1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1uM1t1-00039D-78; Mon, 02 Jun 2025 11:55:19 +0200
Message-ID: <9d73f186246db36363f095aada9289215561d43c.camel@pengutronix.de>
Subject: Re: [oe] [meta-oe][PATCH v1 0/3] add support for building "system
 extension images"
From: Enrico =?ISO-8859-1?Q?J=F6rns?= <ejo@pengutronix.de>
To: johannes.schneider@leica-geosystems.com, 
	openembedded-devel@lists.openembedded.org, raj.khem@gmail.com, 
	mikko.rapeli@linaro.org, erik@riscstar.com
Cc: bsp-development.geo@leica-geosystems.com, ejo <ejo@pengutronix.de>
Date: Mon, 02 Jun 2025 11:55:18 +0200
In-Reply-To: <20250531110022.3843938-1-johannes.schneider@leica-geosystems.com>
References: 
	<20250531110022.3843938-1-johannes.schneider@leica-geosystems.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: ejo@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-devel@lists.openembedded.org
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Jun 2025 09:55:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117702

Hi Johannes,

thank you for sharing you approach!

I few quick notes that came to my mind when scrolling through the patches/c=
over letter.

Am Samstag, dem 31.05.2025 um 13:00 +0200 schrieb Johannes Schneider via li=
sts.openembedded.org:
> This patch-stack adds support for building "system extension images" to m=
eta-oe - to quote the
> man-page [1]:
> "The primary use case for system images are immutable environments where =
debugging and development
> tools shall optionally be made available, but not included in the immutab=
le base OS image itself
> (e.g. strace(1) and gdb(1) shall be an optionally installable addition in=
 order to make
> debugging/development easier). System extension images should not be misu=
nderstood as a generic
> software packaging framework, as no dependency scheme is available: syste=
m extensions should carry
> all files they need themselves, except for those already shipped in the u=
nderlying host system
> image. Typically, system extension images are built at the same time as t=
he base OS image =E2=80=94 within
> the same build system."
>=20
> Link: https://www.freedesktop.org/software/systemd/man/latest/systemd-sys=
ext.html

The interesting part

  system extensions should carry all files they need themselves, except for=
 those
  already shipped in the underlying host system image.

is not really addressed yet by the class, since it takes a conventional roo=
tfs image recipe, adds a
version file and ensures that the removal of 'os-release' works around the =
sanity check.

To better solve this, I guess we would need a way to either split the sysex=
t content from the rootfs
before generating both, or, a proper way to create a 'non-rootfs', i.e. a f=
ile system that does not
contain the default rootfs files, etc.

I'd assume these base questions are relevant for a number of similar proble=
ms, too. Like for
creating layered containers.

For now, to not give the impression of being a generic solution for creatin=
g systext's, maybe one
should rename the class to reflect its for a rootfs or covers only the vers=
ion file generation so
far? E.g.: systemd-sysext-rootfs.bbclass.

> These patches are added to meta-oe - instead of oe-core - because systemd=
-repart-native requires
> 'cryptsetup' to build discoverable-disk-images with verity and optional s=
ignature partitions - and
> cryptsetup is currently only/still in meta-oe.

This could also be a point where one might consider moving it to oe-core, s=
ince it provides 'core'
functionality for creating encrypted system setups, which becomes more and =
more relevant, e.g. for
properly protecting sensitive personal data.

> Note that erofs-utils and systemd-repart-native have to be of a recent ve=
rsion, to support
> features like compression and signing through PKCS#11 (e.g. as provided b=
y the
> classes/signing.bbclass)
>=20
> As an example consider this simple image recipe:
> SUMMARY =3D "An example image to showcase a system extension image."
> LICENSE =3D "MIT"
> inherit discoverable-disk-image sysext-image
> IMAGE_FEATURES =3D ""
> IMAGE_LINGUAS =3D ""
> IMAGE_INSTALL =3D "gdb"

This example might be quite helpful to see how the class intents to be used=
.
As it will get lost when patches are merged, maybe move it to the class inl=
ine documentation or at
least into the corresponding commit message?


Regards, Enrico

> After building, the resulting 'extension-image-example-*sysext.rootfs.ddi=
' can be deployed to an
> embedded system (running from a RO rootfs) and 'merged' into the OS by fo=
llowing steps:
> place a symlink into the systemd-sysext image search path:
> $> mkdir /run/extensions
> $> ln -s /tmp/extension-example.sysext.ddi /run/extensions/example.raw
> list all available extensions:
> $> systemd-sysext list
> and enable the found extensions:
> $> SYSTEMD_LOG_LEVEL=3Ddebug systemd-sysext merge
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#117678): https://lists.openembedded.org/g/openembedde=
d-devel/message/117678
> Mute This Topic: https://lists.openembedded.org/mt/113393897/3616721
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub=C2=
=A0[ejo@pengutronix.de]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

--=20
Pengutronix e.K.=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| Enrico J=C3=B6rns=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|
Embedded Linux Consulting & Support=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0| https://www.pengutronix.de/ |
Steuerwalder Str. 21=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0| Phone: +49-5121-206917-180=C2=A0=C2=A0|
31137 Hildesheim, Germany=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| Fax:=C2=A0=C2=
=A0=C2=A0+49-5121-206917-9=C2=A0=C2=A0=C2=A0=C2=A0|

