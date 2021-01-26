Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by mx.groups.io with SMTP id smtpd.web10.9818.1611651676207683527
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Jan 2021 01:01:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmx.net header.s=badeba3b8450 header.b=d+tHHzi3;
 spf=pass (domain: gmx.net, ip: 212.227.17.21, mailfrom: n.jeker@gmx.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=badeba3b8450; t=1611651674;
	bh=59BCqwX7oJyRTg7VYBkJb0SDeUgWJ+teFYxB43mztzg=;
	h=X-UI-Sender-Class:Subject:From:To:Cc:In-Reply-To:References:Date;
	b=d+tHHzi3oLhCgPVwmJjXhGN9lsSBVhH0IzQ4AdbfoOT0xaWoJAXUAYp8viT99xfkY
	 W165OZ+WrX/d12HGZM/vCqze/Gk08QgBvdF3zf0rdidJ5VUFpy7LcwxK5sle3pjA/x
	 veGxiYTSeKCVVbO6YAxSdZAl9Lq9nnwUjvbw53/M=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.0.56] ([84.75.156.97]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MO9z7-1lNksS3O0H-00Ob32; Tue, 26
 Jan 2021 10:01:13 +0100
Message-ID: <6341290c0b95c6f880b4bae3730eee7d284cf2a5.camel@gmx.net>
Subject: Re: [oe] [meta-networking][PATCH 1/2] networkmanager: Add PACKAGECONFIG for ovs
From: "Nicolas Jeker" <n.jeker@gmx.net>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
In-Reply-To: <CAMKF1sqf2VzsOy-UgepF_H=j7fuWjF48uqD7W-LCje5p37PEvA@mail.gmail.com>
References: <20210126082535.49621-1-n.jeker@gmx.net>
	 <CAMKF1sqf2VzsOy-UgepF_H=j7fuWjF48uqD7W-LCje5p37PEvA@mail.gmail.com>
Date: Tue, 26 Jan 2021 10:01:13 +0100
MIME-Version: 1.0
User-Agent: Evolution 3.38.3 
X-Provags-ID: V03:K1:9BVdQhcuZEjNsSya1zob+VPowNgtDSyItiF7+h7f26KU7iEP+/y
 OPqKpPjeZUbrm21Pg+7Ov+QQnwTYcEdYS6xVQnu/UfwCvTr3SNG5FaSJM5BG7MZGwkrEW1R
 /70lS/Vq7IIpUlYbmeLiZyAzHV1oYcPxsliMH9Y185zV1Uq908V6SxJaaaKtWxTMuLGxWnd
 cse6C7fKtTPysKxLNuFWg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:LVX8b1hAzys=:lC4uMkiTrrKmS7YTaGu1tm
 jmYKgVvVZEs0CAr1RtwIkqea5NoPURs4RpwShFrkmAry/eYnPbt+uWH+d3RToS+CmkOMJc6qT
 JRqKfdIHQCRxgwG/iAyBrkICtq+ShUwXdQeBx8z5STy+sKJhjMbBXgKHD+pZ1VEtBNRF2OSHw
 5Pw0rErF7jVCa+ltL7SrGwq42BmvnvsvS7M+gsJJaFrrjOTb3Gnx7mArEl6Q9xfcD6QHLcNdv
 Ga10zwJJufgMpuVDChW74s7xe1UL3FVQmj8erU0WVaP4yuNYgwlkhUM8bRka/EBm4h9169zEp
 F6nFhn1STHczqWkbs3l/6V0947FWr/6+50waNu72zE77tvCgrLjExkXZTHD8QuvOyXTvvLMm8
 DxQrD213484PIYUesxf0OzNaZQqCCyvFF+1c8mRck2MK3hePoPC8xTAP3PZhYUCgqZNqAS4ET
 /xAG6yeWIJZt7nrYsM78nBw+b6Im08I3gMXYyOP707YfQ6YzNiQ5HKWjAhbSSz1Qz7E7C4htU
 JPDzX149ZcReU4Lb1YQ3SChkwlrZRJlh1N1NLriZcOctwLjub28217JK9J0WXtnwR8YTFxLP6
 IVRFo+CTHe0azT73nRMDPpijDIMdrjYmDdgQEehk0FcZ41rSYhQ2lKhMwgHbfLfYW9uopvSRB
 bCQpjkGcHhL6D476LHtkPp5xxuOSAa0l2FeiavhoHXI9kabk31t5tbHuUnrPo71hlWoLKz/JA
 tC3GQ6YUKcGQUikJ1uLMzj7Kw9zbDogE1kchPDb6owLDrQyFz/HVTNGp3TkTFzbjrb7FeJiQS
 w+1qfJAsqsx2FTThSwnor1FpxKed8B2jdGqzXzA/teiaYGI5jHdD8Kn5LWbDAETeqgv/Qke0c
 Oanvt8zNao/i9V3tSBSQ==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2021-01-26 at 00:28 -0800, Khem Raj wrote:
> On Tue, Jan 26, 2021 at 12:25 AM Nicolas Jeker <n.jeker@gmx.net>
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
> > index 1053bdd42..157a7e7b0 100644
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
> > @@ -85,6 +84,7 @@ PACKAGECONFIG[wifi] =3D "--enable-wifi=3Dyes,--
> > enable-wifi=3Dno,,wpa-supplicant"
> > =C2=A0PACKAGECONFIG[ifupdown] =3D "--enable-ifupdown,--disable-ifupdow=
n"
> > =C2=A0PACKAGECONFIG[qt4-x11-free] =3D "--enable-qt,--disable-qt,qt4-x1=
1-
> > free"
> > =C2=A0PACKAGECONFIG[cloud-setup] =3D "--with-nm-cloud-setup=3Dyes,--wi=
th-nm-
> > cloud-setup=3Dno"
> > +PACKAGECONFIG[ovs] =3D "--enable-ovs,--disable-ovs,,jansson"
>
> jansson was in depends and here its moved to rdepends, don't we need
> it during build ?
>

Most likely, yes. I'll make some more tests and send v2 soon.

> >
> > =C2=A0PACKAGES =3D+ " \
> > =C2=A0=C2=A0 ${PN}-nmcli ${PN}-nmcli-doc \
> > --
> > 2.30.0
> >
> >
> >=20
> >

