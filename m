Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by mx.groups.io with SMTP id smtpd.web09.14391.1611779913261133614
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Jan 2021 12:38:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmx.net header.s=badeba3b8450 header.b=N0SC8rwG;
 spf=pass (domain: gmx.net, ip: 212.227.17.20, mailfrom: n.jeker@gmx.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=badeba3b8450; t=1611779911;
	bh=1TXDpeIYHpd3y2v8rayK6MJ/yWXc+MuZ2gbF0n6QoJo=;
	h=X-UI-Sender-Class:Subject:From:To:Cc:In-Reply-To:References:Date;
	b=N0SC8rwG87S739dmQMHLydmF20Mth4lC3AI2N8YHzoZJ4xGSzF6Rv+MCfwVKU+c9P
	 jrhRJsRoKy7c5QX5aQet0rb/XDROEUyYNnjRpwaGwPk7LOuxwCrDBMNjbNz8RrNaBP
	 jUFZnbi1i71xeb/rWq4qB4LoSWiCgfrd3N4Dt5Ag=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.0.56] ([84.75.156.97]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MMXUN-1lNlD73rtv-00JYB3; Wed, 27
 Jan 2021 21:38:31 +0100
Message-ID: <0daa3ac1bccc464d899786cc777e493de999bf93.camel@gmx.net>
Subject: Re: [oe] [meta-networking][PATCH v2] networkmanager: Add PACKAGECONFIG for ovs
From: "Nicolas Jeker" <n.jeker@gmx.net>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
In-Reply-To: <CAMKF1soWp0Voqn3vTZQmnvhLGz=Bmeh+3_xcQDxcCFm9kvNjgQ@mail.gmail.com>
References: <20210126093122.716978-1-n.jeker@gmx.net>
	 <CAMKF1soWp0Voqn3vTZQmnvhLGz=Bmeh+3_xcQDxcCFm9kvNjgQ@mail.gmail.com>
Date: Wed, 27 Jan 2021 21:38:30 +0100
MIME-Version: 1.0
User-Agent: Evolution 3.38.3 
X-Provags-ID: V03:K1:3NZOiumg8YHOpD20xy1dexXlADn0/HLhM43iKbJNmARFe3/eT5w
 /I2/OEH4KSTNa8VifhJKorL/wMadzCjUU3n0ma1k+HOj53Gxi+pv5bPjk+FzuvQoWe5g+pf
 KwxgmSSEyCMWHBHYO0ps8r2QESEU1zVUYSgSGYj4b7yBNqYQ+5WN69arxgVgtyBdG+0mmTy
 kFZka17b/t5DH5bsw4xVg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:T8xS2pArd4I=:FSz5rbIv2O3Peb3olVMBC+
 9CT1s+E9nTmX8NQEJPhrLd9uIrAkyzc6hO0op+Yi1hZ41F22054rzpSrogNCTs58y4G4foRKX
 DrFAEnjGVRis8NfeCOLHPNFARqaw6Cb1vPjXrNCXI5RznF8QVjM2BwaLhambSduxp1fUwcMqy
 DvQsLpYkHotqICxXqAztpQkS5fKnzW/cIAmW38p7oD6OnmN35QWVF/MSxcBkOaugQPbMMEt2e
 AdDJdoSxQhb0TUGZRyHjh5A1kE4hbHxYQP6luyuXxUZ2EIgTRalby4rnKgyS1+/oAK9NS2ljn
 bnzVPL5nkjbAGQGSiBxfHkbJSkLq66w0dHZGmyDAAMUvF/izJb7jZYkVkrlXInBaVG63DWFOv
 KZHIYllUCJ2xURe5AUwzafAMwYWXaIxwMo8pPTsOxtDaVckGaIrdOHTOWzbDDHLvnulu89TeX
 N96zHmhwY4ElS2BW4v1vvN2SB9C/5Wu4ch42X21jprLWBFzJW3huo8XYdZVAlywe3PsvkbOn0
 +4oP2FBruveG8wE15Th8FFj/thQSprjNQEErj/NoytfVfnFxAzBw0Y6BCuTg6RTzaXUJ9KsUO
 kPyae04FkgYGsKaWQKhT491UreG+RFSFOQASTOvpN9tZ7lBviTZTTr6qr6e7wZDBBsxTxbv3a
 G+z8W2VHwSvX21M1bq15sM792PbWLZtiYTTuWomUzmoBZzR5oVxy8/qucVHiT2hK3Hx/ks0WE
 4tb5ck3hwFeJLwVR2++Dd51gXM0bW8fPywyl/Z/X+1ULPGjYJo1unqF/ErY/YDfTRifqdOkni
 4eN3+JMyTsvA7bjsDag3b5u8V/bGlvF5SEFc2guXxPP+sNwCSb7HjNh86cr+elGXx33shDHVS
 CVQjlDG4w//AxshJt/Rw==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2021-01-27 at 10:19 -0800, Khem Raj wrote:
> it seems that network-manager-applet needs jannson, see this failure
>
> https://errors.yoctoproject.org/Errors/Details/541973/

Okay, I'm going to take a deeper look into it tomorrow.

AFAICT jansson is only needed for the "team configuration editor".
NetworkManager is currently always built without the teamdctl feature,
so I can probably just build network-manager-applet with "-
Dteam=3Dfalse".

I'll send a new patch as soon as I tested it.

> On Tue, Jan 26, 2021 at 1:31 AM Nicolas Jeker <n.jeker@gmx.net>
> wrote:
> >
> > Open vSwitch support is enabled by default in NetworkManager, but
> > only
> > useful in the context of several virtualisation environments, e.g.
> > Xen,
> > KVM, OpenStack and more. Therefore, the ovs PACKAGECONFIG is now
> > disabled by
> > default.
> >
> > The jansson dependency is only required for Open vSwitch and
> > teamsdctl
> > support in NetworkManager. As there is no libteamsdctl recipe
> > around
> > (and no teamsdctl PACKAGECONFIG), make it dependent on the ovs
> > PACKAGECONFIG.
> >
> > Signed-off-by: Nicolas Jeker <n.jeker@gmx.net>
> > ---
> > =C2=A0.../networkmanager/networkmanager_1.28.0.bb=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
> > 2 +-
> > =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta-networking/recipes-
> > connectivity/networkmanager/networkmanager_1.28.0.bb b/meta-
> > networking/recipes-
> > connectivity/networkmanager/networkmanager_1.28.0.bb
> > index 3e7a068ac..646ebea49 100644
> > --- a/meta-networking/recipes-
> > connectivity/networkmanager/networkmanager_1.28.0.bb
> > +++ b/meta-networking/recipes-
> > connectivity/networkmanager/networkmanager_1.28.0.bb
> > @@ -15,7 +15,6 @@ DEPENDS =3D " \
> > =C2=A0=C2=A0=C2=A0=C2=A0 util-linux \
> > =C2=A0=C2=A0=C2=A0=C2=A0 libndp \
> > =C2=A0=C2=A0=C2=A0=C2=A0 libnewt \
> > -=C2=A0=C2=A0=C2=A0 jansson \
> > =C2=A0=C2=A0=C2=A0=C2=A0 curl \
> > =C2=A0"
> >
> > @@ -85,6 +84,7 @@ PACKAGECONFIG[wifi] =3D "--with-wext=3Dyes --enable-
> > wifi=3Dyes,--with-wext=3Dno --enable
> > =C2=A0PACKAGECONFIG[ifupdown] =3D "--enable-ifupdown,--disable-ifupdow=
n"
> > =C2=A0PACKAGECONFIG[qt4-x11-free] =3D "--enable-qt,--disable-qt,qt4-x1=
1-
> > free"
> > =C2=A0PACKAGECONFIG[cloud-setup] =3D "--with-nm-cloud-setup=3Dyes,--wi=
th-nm-
> > cloud-setup=3Dno"
> > +PACKAGECONFIG[ovs] =3D "--enable-ovs,--disable-ovs,jansson"
> >
> > =C2=A0PACKAGES =3D+ " \
> > =C2=A0=C2=A0 ${PN}-nmcli ${PN}-nmcli-doc \
> > --
> > 2.30.0
> >
> >
> >
> >
>
>=20
>

