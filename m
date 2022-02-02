Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 076BFC433F5
	for <webhook@archiver.kernel.org>; Wed,  2 Feb 2022 05:35:50 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com
 [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web09.60365.1643780149420109622
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Feb 2022 21:35:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=D3L/YiPg;
 spf=pass (domain: gmail.com, ip: 209.85.219.42, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id g11so18091362qvu.3
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Feb 2022 21:35:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=WlISv+Y8IzaD4EjCcDCKIQSKz8jaics8dt6M3LiM+mY=;
        b=D3L/YiPgjd0/swtRd0SAe64iZmVD8jWoDGbZZV4Tt32UIlo+NvHj9NmgSLzet0LJyB
         Q8k9zMASsPgaB2jCE35A4L3QVgTrrqVQXM9+eSJevJtx06SR8LfV0QGZIgtfsSe4+sB8
         9hHJG2EdyeU2M/G3Sebewz0rVWJj2vceZ6/1evDvm7+1tkDwzPBLCaDgWMs8ErrRjfh0
         8j+W/KROD7/vIzAuM+hm/X/wBFxB7FqGW0zgKdhLKoVSzYy5vtFzrVmVpEJY0zxNVnxc
         hXsnZRw/5EQBZ7lBrA4GYJsrsDGMlD9ktTfaqmPu37vUKnsd37CQ8CrOfJBE/dZkqDEE
         1+DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=WlISv+Y8IzaD4EjCcDCKIQSKz8jaics8dt6M3LiM+mY=;
        b=pEKMRLF1RWqLphffMAbrhMS4DQB1j8FJrRNol5fUa9YZIOupk2LHKorwJJstMf2nBn
         U9/eTYJMl48WPZYSS5dsYAksN2tj2S1TFkYFAHIpqg/5anqlUtxcJsa8L9OyfhqNIJtH
         tu7av2znfOvah6TMsKrC/dOngXi4SRtMVRMLCLAmmxGm6AGIOsVcDaO3sdmVmVMrOpZZ
         5qn60eBHpVblmnShvkWohEyUoSrLL9DEYn7bYUuq+NVjXdT7Y5dyQHnhEA9k8hw4nYKl
         g8AiVmP+eV6W+4wjlWTwSF1cSPQPzDg0nIp7U/9xtUe6ltyRvSQldhsjJ3Rs+xh7wv4I
         WoBw==
X-Gm-Message-State: AOAM531W0yrgqiF775W5O1vPJK10tVnV9xcE+OYVyNp5BWs0r0hAq1rR
	T4naH3Jcam9vZvR6wdpgR6y+8Jb5XhJFcXBKico=
X-Google-Smtp-Source: 
 ABdhPJy/2cpDeWFTz5fxBms3ptNtjE/8L0/iYhqrJphhgKXhL4yNVbtH5uIO/x25Z4RrC8eVVV05eoqGrXkpAG+SzQI=
X-Received: by 2002:ad4:5def:: with SMTP id
 jn15mr19829492qvb.16.1643780148376;
 Tue, 01 Feb 2022 21:35:48 -0800 (PST)
MIME-Version: 1.0
References: 
 <20220201142608.186135-1-enguerrand.de-ribaucourt@savoirfairelinux.com>
 <856308942.287191.1643726738861.JavaMail.zimbra@savoirfairelinux.com>
In-Reply-To: 
 <856308942.287191.1643726738861.JavaMail.zimbra@savoirfairelinux.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 1 Feb 2022 21:35:22 -0800
Message-ID: 
 <CAMKF1soFz0OT+mHJ6kk-cLUX97qP3Q1cFEMEjVDU8NfwVGUpeA@mail.gmail.com>
Subject: Re: [meta-networking][PATCH V2] mdio-tools: add recipes
To: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Joe MacDonald <joe@deserted.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Feb 2022 05:35:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95211

this fails on mips
https://errors.yoctoproject.org/Errors/Details/623861/

aarch64
https://errors.yoctoproject.org/Errors/Details/623865/

On Tue, Feb 1, 2022 at 6:45 AM Enguerrand de Ribaucourt
<enguerrand.de-ribaucourt@savoirfairelinux.com> wrote:
>
> ----- Mail original -----
> > De: "Enguerrand de Ribaucourt" <enguerrand.de-ribaucourt@savoirfairelin=
ux.com>
> > =C3=80: openembedded-devel@lists.openembedded.org
> > Cc: "raj khem" <raj.khem@gmail.com>, joe@deserted.net, "Enguerrand de R=
ibaucourt"
> > <enguerrand.de-ribaucourt@savoirfairelinux.com>
> > Envoy=C3=A9: Mardi 1 F=C3=A9vrier 2022 15:26:10
> > Objet: [meta-networking][PATCH V2] mdio-tools: add recipes
>
> Hi,
>
> mdio-tools is a similar tool to phytool, by the same author, which is alr=
eady present in meta-networking. This one allows a more low-level access to=
 the MDIO bus as well as writing with the use of a kernel module.
> I re-submitted the patch with some small corrections to respect coding st=
yle conventions:
> 1. Moved in recipes-support
> 2. Removed version in mdio-tools_1.0.1.inc filename
>
> Please let me know if these recipes are relevant to meta-networking or if=
 you have any comments about them.
> Thank you for your time.
>
> > Self-description from the README: mdio-tools is a low-level debug tool
> > for communicating with devices attached to an MDIO bus.
>
> > Signed-off-by: Enguerrand de Ribaucourt
> > <enguerrand.de-ribaucourt@savoirfairelinux.com>
> > ---
> > .../mdio-tools/mdio-netlink_1.0.1.bb | 13 +++++++++++++
> > .../recipes-support/mdio-tools/mdio-tools.inc | 8 ++++++++
> > .../recipes-support/mdio-tools/mdio-tools_1.0.1.bb | 9 +++++++++
> > 3 files changed, 30 insertions(+)
> > create mode 100644
> > meta-networking/recipes-support/mdio-tools/mdio-netlink_1.0.1.bb
> > create mode 100644 meta-networking/recipes-support/mdio-tools/mdio-tool=
s.inc
> > create mode 100644
> > meta-networking/recipes-support/mdio-tools/mdio-tools_1.0.1.bb
>
> > diff --git a/meta-networking/recipes-support/mdio-tools/mdio-netlink_1.=
0.1.bb
> > b/meta-networking/recipes-support/mdio-tools/mdio-netlink_1.0.1.bb
> > new file mode 100644
> > index 000000000..b50d33f90
> > --- /dev/null
> > +++ b/meta-networking/recipes-support/mdio-tools/mdio-netlink_1.0.1.bb
> > @@ -0,0 +1,13 @@
> > +require mdio-tools.inc
> > +
> > +DEPENDS +=3D "virtual/kernel libmnl"
> > +# This module requires Linux 5.6 higher
> > +
> > +S =3D "${WORKDIR}/git/kernel"
> > +
> > +inherit module
> > +
> > +EXTRA_OEMAKE =3D "KDIR=3D${STAGING_KERNEL_DIR}"
> > +MODULES_INSTALL_TARGET =3D "install"
> > +
> > +RPROVIDES:${PN} +=3D "kernel-module-mdio-netlink"
> > diff --git a/meta-networking/recipes-support/mdio-tools/mdio-tools.inc
> > b/meta-networking/recipes-support/mdio-tools/mdio-tools.inc
> > new file mode 100644
> > index 000000000..bba8960d8
> > --- /dev/null
> > +++ b/meta-networking/recipes-support/mdio-tools/mdio-tools.inc
> > @@ -0,0 +1,8 @@
> > +DESCRIPTION =3D "A low-level debug tool for communicating with devices=
 attached
> > to an MDIO bus"
> > +SECTION =3D "networking"
> > +HOMEPAGE =3D "https://github.com/wkz/mdio-tools"
> > +LICENSE =3D "GPLv2"
> > +LIC_FILES_CHKSUM =3D
> > "file://${WORKDIR}/git/COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263"
> > +
> > +SRC_URI =3D "git://github.com/wkz/mdio-tools.git;protocol=3Dhttps;bran=
ch=3Dmaster"
> > +SRCREV =3D "b40809dd59aa199d8afc307e228b55eeae06b17e"
> > diff --git a/meta-networking/recipes-support/mdio-tools/mdio-tools_1.0.=
1.bb
> > b/meta-networking/recipes-support/mdio-tools/mdio-tools_1.0.1.bb
> > new file mode 100644
> > index 000000000..cd4df3da0
> > --- /dev/null
> > +++ b/meta-networking/recipes-support/mdio-tools/mdio-tools_1.0.1.bb
> > @@ -0,0 +1,9 @@
> > +require mdio-tools.inc
> > +
> > +DEPENDS +=3D "libmnl"
> > +
> > +S =3D "${WORKDIR}/git"
> > +
> > +inherit pkgconfig autotools
> > +
> > +RDEPENDS:${PN} =3D "kernel-module-mdio-netlink"
> > --
> > 2.25.1

