Return-Path: <enguerrand.de-ribaucourt@savoirfairelinux.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F2D2C433F5
	for <webhook@archiver.kernel.org>; Wed,  2 Feb 2022 09:59:29 +0000 (UTC)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
 [208.88.110.44])
 by mx.groups.io with SMTP id smtpd.web09.62224.1643795968246035469
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Feb 2022 01:59:28 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: savoirfairelinux.com, ip: 208.88.110.44,
 mailfrom: enguerrand.de-ribaucourt@savoirfairelinux.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 5CBA29C02CB;
	Wed,  2 Feb 2022 04:59:26 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
 port 10032)
	with ESMTP id QITXkmMZmLDL; Wed,  2 Feb 2022 04:59:25 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 9DB829C02D2;
	Wed,  2 Feb 2022 04:59:25 -0500 (EST)
X-Virus-Scanned: amavisd-new at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
 port 10026)
	with ESMTP id Fd7lT8fAT88F; Wed,  2 Feb 2022 04:59:25 -0500 (EST)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
 [192.168.48.237])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 7CE779C02CB;
	Wed,  2 Feb 2022 04:59:25 -0500 (EST)
Date: Wed, 2 Feb 2022 04:59:25 -0500 (EST)
From: Enguerrand de Ribaucourt
  <enguerrand.de-ribaucourt@savoirfairelinux.com>
To: raj khem <raj.khem@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	joe <joe@deserted.net>
Message-ID: 
 <444367780.402959.1643795965441.JavaMail.zimbra@savoirfairelinux.com>
In-Reply-To: 
 <CAMKF1soFz0OT+mHJ6kk-cLUX97qP3Q1cFEMEjVDU8NfwVGUpeA@mail.gmail.com>
References: 
 <20220201142608.186135-1-enguerrand.de-ribaucourt@savoirfairelinux.com>
 <856308942.287191.1643726738861.JavaMail.zimbra@savoirfairelinux.com>
 <CAMKF1soFz0OT+mHJ6kk-cLUX97qP3Q1cFEMEjVDU8NfwVGUpeA@mail.gmail.com>
Subject: Re: [meta-networking][PATCH V2] mdio-tools: add recipes
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailer: Zimbra 8.8.15_GA_4180 (ZimbraWebClient - FF96
 (Linux)/8.8.15_GA_4177)
Thread-Topic: mdio-tools: add recipes
Thread-Index: vtCAzB1M60QFvB+/6L2UsB5Z+0jAdQ==
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Feb 2022 09:59:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95212

Thank you for your feedback. The build fails on those MACHINEs because the =
kernel
configuration does not enables the MDIO bus support.
I could successfully build the recipes on both MACHINEs by adding the follo=
wing
kernel configuration fragment:

---
CONFIG_MDIO_DEVICE=3Dy
CONFIG_MDIO_BUS=3Dy
# CONFIG_MDIO_BITBANG is not set
# CONFIG_MDIO_BCM_UNIMAC is not set
# CONFIG_MDIO_MVUSB is not set
# CONFIG_MDIO_MSCC_MIIM is not set
# CONFIG_MDIO_THUNDER is not set

#
# MDIO Multiplexers
#
# CONFIG_PCS_XPCS is not set
---

What would be the best way to approach this?

----- Original Message -----
> From: "raj khem" <raj.khem@gmail.com>
> To: "Enguerrand de Ribaucourt" <enguerrand.de-ribaucourt@savoirfairelinux=
.com>
> Cc: "openembedded-devel" <openembedded-devel@lists.openembedded.org>, "jo=
e" <joe@deserted.net>
> Sent: Wednesday, February 2, 2022 6:35:22 AM
> Subject: Re: [meta-networking][PATCH V2] mdio-tools: add recipes

> this fails on mips
> https://errors.yoctoproject.org/Errors/Details/623861/

> aarch64
> https://errors.yoctoproject.org/Errors/Details/623865/

> On Tue, Feb 1, 2022 at 6:45 AM Enguerrand de Ribaucourt
> <enguerrand.de-ribaucourt@savoirfairelinux.com> wrote:

> > ----- Mail original -----
> > > De: "Enguerrand de Ribaucourt" <enguerrand.de-ribaucourt@savoirfairel=
inux.com>
> > > =C3=80: openembedded-devel@lists.openembedded.org
>> > Cc: "raj khem" <raj.khem@gmail.com>, joe@deserted.net, "Enguerrand de
> > > Ribaucourt"
> > > <enguerrand.de-ribaucourt@savoirfairelinux.com>
> > > Envoy=C3=A9: Mardi 1 F=C3=A9vrier 2022 15:26:10
> > > Objet: [meta-networking][PATCH V2] mdio-tools: add recipes

> > Hi,

>> mdio-tools is a similar tool to phytool, by the same author, which is al=
ready
>> present in meta-networking. This one allows a more low-level access to t=
he MDIO
> > bus as well as writing with the use of a kernel module.
>> I re-submitted the patch with some small corrections to respect coding s=
tyle
> > conventions:
> > 1. Moved in recipes-support
> > 2. Removed version in mdio-tools_1.0.1.inc filename

>> Please let me know if these recipes are relevant to meta-networking or i=
f you
> > have any comments about them.
> > Thank you for your time.

> > > Self-description from the README: mdio-tools is a low-level debug too=
l
> > > for communicating with devices attached to an MDIO bus.

> > > Signed-off-by: Enguerrand de Ribaucourt
> > > <enguerrand.de-ribaucourt@savoirfairelinux.com>
> > > ---
> > > .../mdio-tools/mdio-netlink_1.0.1.bb | 13 +++++++++++++
> > > .../recipes-support/mdio-tools/mdio-tools.inc | 8 ++++++++
> > > .../recipes-support/mdio-tools/mdio-tools_1.0.1.bb | 9 +++++++++
> > > 3 files changed, 30 insertions(+)
> > > create mode 100644
> > > meta-networking/recipes-support/mdio-tools/mdio-netlink_1.0.1.bb
> > > create mode 100644 meta-networking/recipes-support/mdio-tools/mdio-to=
ols.inc
> > > create mode 100644
> > > meta-networking/recipes-support/mdio-tools/mdio-tools_1.0.1.bb

> > > diff --git a/meta-networking/recipes-support/mdio-tools/mdio-netlink_=
1.0.1.bb
> > > b/meta-networking/recipes-support/mdio-tools/mdio-netlink_1.0.1.bb
> > > new file mode 100644
> > > index 000000000..b50d33f90
> > > --- /dev/null
> > > +++ b/meta-networking/recipes-support/mdio-tools/mdio-netlink_1.0.1.b=
b
> > > @@ -0,0 +1,13 @@
> > > +require mdio-tools.inc
> > > +
> > > +DEPENDS +=3D "virtual/kernel libmnl"
> > > +# This module requires Linux 5.6 higher
> > > +
> > > +S =3D "${WORKDIR}/git/kernel"
> > > +
> > > +inherit module
> > > +
> > > +EXTRA_OEMAKE =3D "KDIR=3D${STAGING_KERNEL_DIR}"
> > > +MODULES_INSTALL_TARGET =3D "install"
> > > +
> > > +RPROVIDES:${PN} +=3D "kernel-module-mdio-netlink"
> > > diff --git a/meta-networking/recipes-support/mdio-tools/mdio-tools.in=
c
> > > b/meta-networking/recipes-support/mdio-tools/mdio-tools.inc
> > > new file mode 100644
> > > index 000000000..bba8960d8
> > > --- /dev/null
> > > +++ b/meta-networking/recipes-support/mdio-tools/mdio-tools.inc
> > > @@ -0,0 +1,8 @@
> > > +DESCRIPTION =3D "A low-level debug tool for communicating with devic=
es attached
> > > to an MDIO bus"
> > > +SECTION =3D "networking"
> > > +HOMEPAGE =3D "https://github.com/wkz/mdio-tools"
> > > +LICENSE =3D "GPLv2"
> > > +LIC_FILES_CHKSUM =3D
> > > "file://${WORKDIR}/git/COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263=
"
> > > +
> > > +SRC_URI =3D "git://github.com/wkz/mdio-tools.git;protocol=3Dhttps;br=
anch=3Dmaster"
> > > +SRCREV =3D "b40809dd59aa199d8afc307e228b55eeae06b17e"
> > > diff --git a/meta-networking/recipes-support/mdio-tools/mdio-tools_1.=
0.1.bb
> > > b/meta-networking/recipes-support/mdio-tools/mdio-tools_1.0.1.bb
> > > new file mode 100644
> > > index 000000000..cd4df3da0
> > > --- /dev/null
> > > +++ b/meta-networking/recipes-support/mdio-tools/mdio-tools_1.0.1.bb
> > > @@ -0,0 +1,9 @@
> > > +require mdio-tools.inc
> > > +
> > > +DEPENDS +=3D "libmnl"
> > > +
> > > +S =3D "${WORKDIR}/git"
> > > +
> > > +inherit pkgconfig autotools
> > > +
> > > +RDEPENDS:${PN} =3D "kernel-module-mdio-netlink"
> > > --
> > > 2.25.1

