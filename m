Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E056C433EF
	for <webhook@archiver.kernel.org>; Tue, 17 May 2022 05:37:00 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com
 [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web11.3810.1652765819480810632
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 May 2022 22:36:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CmVFmv64;
 spf=pass (domain: gmail.com, ip: 209.85.219.42, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id eq14so13709478qvb.4
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 May 2022 22:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=IJoslTWuuz4B7/ANVzv97jo1nK1IuaJKiBADAXGMbUI=;
        b=CmVFmv64txafuCPLvN6ewBUflOK1A97kNNSFGqnw/awhvzJRYUnUfa813QeZ4Kb0ta
         C9du4yToG6MZB5JnGSf23atiCTO/t3vlgLtxub/wNkNYfD/LXGVRTCpjKL4IIMRNnFuC
         IEqS/8CB89ptoHC6Fu7ivxitohTEN5H7QZKN0n6VjlmyuStoNyHiFhnBu0Lf4IyQaHq6
         t3QkSSzK2K1fGCJafTzSPoZlwFAK+7VcLfX0REJZ6K2j3YkaUYBTbXkb9shiDARjK/RU
         lMj7Hak8mB5lq/wxpFnYNRvZsqc6tgQVyh2C1bYS81L+ip0L75X+WOmomze8mldcAhSw
         lH9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=IJoslTWuuz4B7/ANVzv97jo1nK1IuaJKiBADAXGMbUI=;
        b=50XLkUqKyNr5VH/a7COPvoMDM/8Rps+KlI0r8gAQTgOEc/pBlq8010VPdYbM+bS0Sy
         pf6BdpD+LEAqCFCTrP7Fl0OL57ho+ptt3QcfRKW3lpaZHOPG86nZPi+Lg698mJwiyr6G
         idAE5wxcjU4V0yW2homHiwD2/fpNKs3JabwWlXFNv5Z2ptcWSHemunhETdoyVFyQXEQQ
         R2sPE0LCY1pw8j78DU2Tti6XtxMB9xSlbCUYcfhF7pKQV6TC1YYhnxyY38DZUOfOE172
         dCOVO2NGl5wXvtvjALWpbZ8Vvw71q1/FM00aHJq1no1MTptp8B5NsjmfElGsP16x9tSN
         TG5Q==
X-Gm-Message-State: AOAM533XPuFeEZeQc2+QkVTd9p/QveQi21RPfm3UprhwvIS0fkRnAdoY
	KTwVCEQT1FbYtIMlKp0okBZdTBQDeQQnK92pC8o=
X-Google-Smtp-Source: 
 ABdhPJy/t4oG03NB0nY1lpVwzWeWY1RmI3nu98Zgg5yQI2qyeSakqFKEhJ4o6h2+YrBYF0IRq23+ZZeCKp2nF8FUxQI=
X-Received: by 2002:a05:6214:e6b:b0:45b:1ee:86ec with SMTP id
 jz11-20020a0562140e6b00b0045b01ee86ecmr18408242qvb.36.1652765818518; Mon, 16
 May 2022 22:36:58 -0700 (PDT)
MIME-Version: 1.0
References: 
 <20220201142608.186135-1-enguerrand.de-ribaucourt@savoirfairelinux.com>
 <856308942.287191.1643726738861.JavaMail.zimbra@savoirfairelinux.com>
 <CAMKF1soFz0OT+mHJ6kk-cLUX97qP3Q1cFEMEjVDU8NfwVGUpeA@mail.gmail.com>
 <444367780.402959.1643795965441.JavaMail.zimbra@savoirfairelinux.com>
 <08c924ec-b924-03fd-9138-cd04083a0c6a@gmail.com>
In-Reply-To: <08c924ec-b924-03fd-9138-cd04083a0c6a@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 16 May 2022 22:36:30 -0700
Message-ID: 
 <CAMKF1soaoAh9Dm_QD_a80YXHEyb=h=Zr9Jid7Ks9pEtbEbcqAg@mail.gmail.com>
Subject: Re: [meta-networking][PATCH V2] mdio-tools: add recipes
To: Potin Lai <potin.lai.pt@gmail.com>
Cc: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>,
 joe <joe@deserted.net>,
	Patrick Williams <patrick@stwcx.xyz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 May 2022 05:37:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97150

perhaps get this enabled by default in linux-yocto kernel defconfigs

On Mon, May 16, 2022 at 9:44 PM Potin Lai <potin.lai.pt@gmail.com> wrote:
>
>
> Enguerrand de Ribaucourt =E6=96=BC 2022/2/2 =E4=B8=8B=E5=8D=88 05:59 =E5=
=AF=AB=E9=81=93:
> > Thank you for your feedback. The build fails on those MACHINEs because =
the kernel
> > configuration does not enables the MDIO bus support.
> > I could successfully build the recipes on both MACHINEs by adding the f=
ollowing
> > kernel configuration fragment:
> >
> > ---
> > CONFIG_MDIO_DEVICE=3Dy
> > CONFIG_MDIO_BUS=3Dy
> > # CONFIG_MDIO_BITBANG is not set
> > # CONFIG_MDIO_BCM_UNIMAC is not set
> > # CONFIG_MDIO_MVUSB is not set
> > # CONFIG_MDIO_MSCC_MIIM is not set
> > # CONFIG_MDIO_THUNDER is not set
> >
> > #
> > # MDIO Multiplexers
> > #
> > # CONFIG_PCS_XPCS is not set
> > ---
> >
> > What would be the best way to approach this?
> >
> > ----- Original Message -----
> >> From: "raj khem" <raj.khem@gmail.com>
> >> To: "Enguerrand de Ribaucourt" <enguerrand.de-ribaucourt@savoirfaireli=
nux.com>
> >> Cc: "openembedded-devel" <openembedded-devel@lists.openembedded.org>, =
"joe" <joe@deserted.net>
> >> Sent: Wednesday, February 2, 2022 6:35:22 AM
> >> Subject: Re: [meta-networking][PATCH V2] mdio-tools: add recipes
> >> this fails on mips
> >> https://errors.yoctoproject.org/Errors/Details/623861/
> >> aarch64
> >> https://errors.yoctoproject.org/Errors/Details/623865/
> >> On Tue, Feb 1, 2022 at 6:45 AM Enguerrand de Ribaucourt
> >> <enguerrand.de-ribaucourt@savoirfairelinux.com> wrote:
> >>> ----- Mail original -----
> >>>> De: "Enguerrand de Ribaucourt" <enguerrand.de-ribaucourt@savoirfaire=
linux.com>
> >>>> =C3=80: openembedded-devel@lists.openembedded.org
> >>>> Cc: "raj khem" <raj.khem@gmail.com>, joe@deserted.net, "Enguerrand d=
e
> >>>> Ribaucourt"
> >>>> <enguerrand.de-ribaucourt@savoirfairelinux.com>
> >>>> Envoy=C3=A9: Mardi 1 F=C3=A9vrier 2022 15:26:10
> >>>> Objet: [meta-networking][PATCH V2] mdio-tools: add recipes
> >>> Hi,
> >>> mdio-tools is a similar tool to phytool, by the same author, which is=
 already
> >>> present in meta-networking. This one allows a more low-level access t=
o the MDIO
> >>> bus as well as writing with the use of a kernel module.
> >>> I re-submitted the patch with some small corrections to respect codin=
g style
> >>> conventions:
> >>> 1. Moved in recipes-support
> >>> 2. Removed version in mdio-tools_1.0.1.inc filename
> >>> Please let me know if these recipes are relevant to meta-networking o=
r if you
> >>> have any comments about them.
> >>> Thank you for your time.
> >>>> Self-description from the README: mdio-tools is a low-level debug to=
ol
> >>>> for communicating with devices attached to an MDIO bus.
> >>>> Signed-off-by: Enguerrand de Ribaucourt
> >>>> <enguerrand.de-ribaucourt@savoirfairelinux.com>
> >>>> ---
> >>>> .../mdio-tools/mdio-netlink_1.0.1.bb | 13 +++++++++++++
> >>>> .../recipes-support/mdio-tools/mdio-tools.inc | 8 ++++++++
> >>>> .../recipes-support/mdio-tools/mdio-tools_1.0.1.bb | 9 +++++++++
> >>>> 3 files changed, 30 insertions(+)
> >>>> create mode 100644
> >>>> meta-networking/recipes-support/mdio-tools/mdio-netlink_1.0.1.bb
> >>>> create mode 100644 meta-networking/recipes-support/mdio-tools/mdio-t=
ools.inc
> >>>> create mode 100644
> >>>> meta-networking/recipes-support/mdio-tools/mdio-tools_1.0.1.bb
> >>>> diff --git a/meta-networking/recipes-support/mdio-tools/mdio-netlink=
_1.0.1.bb
> >>>> b/meta-networking/recipes-support/mdio-tools/mdio-netlink_1.0.1.bb
> >>>> new file mode 100644
> >>>> index 000000000..b50d33f90
> >>>> --- /dev/null
> >>>> +++ b/meta-networking/recipes-support/mdio-tools/mdio-netlink_1.0.1.=
bb
> >>>> @@ -0,0 +1,13 @@
> >>>> +require mdio-tools.inc
> >>>> +
> >>>> +DEPENDS +=3D "virtual/kernel libmnl"
> >>>> +# This module requires Linux 5.6 higher
> >>>> +
> >>>> +S =3D "${WORKDIR}/git/kernel"
> >>>> +
> >>>> +inherit module
> >>>> +
> >>>> +EXTRA_OEMAKE =3D "KDIR=3D${STAGING_KERNEL_DIR}"
> >>>> +MODULES_INSTALL_TARGET =3D "install"
> >>>> +
> >>>> +RPROVIDES:${PN} +=3D "kernel-module-mdio-netlink"
> >>>> diff --git a/meta-networking/recipes-support/mdio-tools/mdio-tools.i=
nc
> >>>> b/meta-networking/recipes-support/mdio-tools/mdio-tools.inc
> >>>> new file mode 100644
> >>>> index 000000000..bba8960d8
> >>>> --- /dev/null
> >>>> +++ b/meta-networking/recipes-support/mdio-tools/mdio-tools.inc
> >>>> @@ -0,0 +1,8 @@
> >>>> +DESCRIPTION =3D "A low-level debug tool for communicating with devi=
ces attached
> >>>> to an MDIO bus"
> >>>> +SECTION =3D "networking"
> >>>> +HOMEPAGE =3D "https://github.com/wkz/mdio-tools"
> >>>> +LICENSE =3D "GPLv2"
> >>>> +LIC_FILES_CHKSUM =3D
> >>>> "file://${WORKDIR}/git/COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a426=
3"
> >>>> +
> >>>> +SRC_URI =3D "git://github.com/wkz/mdio-tools.git;protocol=3Dhttps;b=
ranch=3Dmaster"
> >>>> +SRCREV =3D "b40809dd59aa199d8afc307e228b55eeae06b17e"
> >>>> diff --git a/meta-networking/recipes-support/mdio-tools/mdio-tools_1=
.0.1.bb
> >>>> b/meta-networking/recipes-support/mdio-tools/mdio-tools_1.0.1.bb
> >>>> new file mode 100644
> >>>> index 000000000..cd4df3da0
> >>>> --- /dev/null
> >>>> +++ b/meta-networking/recipes-support/mdio-tools/mdio-tools_1.0.1.bb
> >>>> @@ -0,0 +1,9 @@
> >>>> +require mdio-tools.inc
> >>>> +
> >>>> +DEPENDS +=3D "libmnl"
> >>>> +
> >>>> +S =3D "${WORKDIR}/git"
> >>>> +
> >>>> +inherit pkgconfig autotools
> >>>> +
> >>>> +RDEPENDS:${PN} =3D "kernel-module-mdio-netlink"
> >>>> --
> >>>> 2.25.1
> >
> Hi Maintainer,
>
> I am looking forward to add mdio-tools package support into openembedded.=
 I find this post, but it looks not been updated for few month.
> Just wondering that would you give some advice for adding extra kernel co=
nfigurations? or it is possible adding configs into defconfig for `mips` an=
d `aarch64`?
>
> BR,
>
> Potin
>
>

