Return-Path: <patrick.ohly@gmx.de>
X-Greylist: delayed 304 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 05 Dec 2016 12:18:27 UTC
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	by mail.openembedded.org (Postfix) with ESMTP id 42E1C6093E
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Dec 2016 12:18:27 +0000 (UTC)
Received: from pohly-mobl1 ([93.232.208.235]) by mail.gmx.com (mrgmx103
	[212.227.17.168]) with ESMTPSA (Nemesis) id 0LjJCt-1coZwZ0bKZ-00dUAU;
	Mon, 05 Dec 2016 13:13:24 +0100
Message-ID: <1480940003.17535.32.camel@gmx.de>
From: Patrick Ohly <patrick.ohly@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 05 Dec 2016 13:13:23 +0100
In-Reply-To: <CABcZANkz-QEg-+rLr0q-W8BD5K6Z=UFs3MUpZHQXRO+T2xF2hw@mail.gmail.com>
References: <20161129164817.16671-1-dev@codyps.com>
	<CABcZANkz-QEg-+rLr0q-W8BD5K6Z=UFs3MUpZHQXRO+T2xF2hw@mail.gmail.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
X-Provags-ID: V03:K0:Gwy5lUligQkpxU285NXYrRx7e044m796uaC/nKhTwnXQTm/kj1W
	Erje7jcANKGbzkHZFpRW1N/6lsfQbRjMtZGwGXQhtciBZKYYYj7utC+QpR7pRPkvXltZLUe
	dhgM/xJWZVE8XB/HDE/8aI+ytwJobss4MhjNQNHCby4wpWKE2Y3lzS87X5NWM82apQ34dmt
	h4udrLBdvgMbY9XuK10ZQ==
X-UI-Out-Filterresults: notjunk:1;V01:K0:OMyLKcG3/os=:eRDFQ4ZOJ6m46U7smbEZ+a
	2Hj0hRumH1duEosBRV3XJjoHkEDxj7yC4vbdDEV4xNCISu8ODNWTKADqIV9LRGBb2Ub6tKzGC
	qbL900bFN8FIvjAP+wRTyJLTqb7ykimvsJyhY29jx9o4Y8HVU2VPRZo/K4xG8bg9na2v/E9bi
	4UucFJetphoWauz8aqCxzfwS3sxrWuZNvdENxKBAVmaZxlT6QUXRD2elC3ndWeacdBxiaNyPa
	V9sB6GPl2ACf/ImXAyPVDr1O3BOBoIPCmMD0EU4qa3CWJckVLp/2tU58zK5ooLNnMvXeFQbMI
	b6BEDFr0ONjbiLEccDjw1bhA4zs4HvsuNru3Xc+yUIGkwS1vDRYodVtCfTfrjY23c6bjSYk8X
	os6kT4F/RDrnD3EI95zFnc+FvcBUfG4UOXOzETGJKtBiZuUXyqqun00Q5C05lvFhEWoL6UliL
	V1YQI56vi6sSkK/041nDn9yQEE2d+54EaotovIEtFMvKGkg4Pnq+HCHZUunKtmGpTqHvVdlXX
	uKiH1zxwROGukRwKK1N7Ws5aK105dj/nP+IwIrGCk8vjnp2yjcfqydMZMwI+gtTuupzxDK2o2
	GN5CkqmllQ0OKMwmniIlyNQssmTl8RYqfQK0CFzjzALVNKy6mJAA9FfV4bKxP1HA9uQSKhefr
	KhliU/Yt6K9M8BTA+1Z2Fen4CQH3IrGgMIDkXZV0OCBsoWIOWoz75e0aG3YA6nBB2Sf86rRui
	HDx4FcBThyhdEk/iPzUkYzFwgxSFt09q5xK9hfVO14hT5BrYVKn31qPlYVL+eBoU6Q6G/UgTy
	zwGbLC/
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Mario Domenech Goulart <mario@ossystems.com.br>
Subject: Re: [meta-java][PATCH] move from bb.data.getVar(x, d, 1) to d.getVar(x, True)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 05 Dec 2016 12:18:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2016-11-29 at 13:16 -0700, Christopher Larson wrote:
> On Tue, Nov 29, 2016 at 9:48 AM, Cody P Schafer <dev@codyps.com> wrote:
>=20
> > bb.data.getVar was removed, need to use the modern mechanism.
> >
> > Signed-off-by: Cody P Schafer <dev@codyps.com>
> > ---
> >  classes/java-library.bbclass              |  4 ++--
> >  recipes-core/icedtea/icedtea7-native.inc  |  2 +-
> >  recipes-core/openjdk/openjdk-7-common.inc |  2 +-
> >  recipes-core/openjdk/openjdk-8-common.inc | 10 +++++-----
> >  recipes-core/openjdk/openjdk-common.inc   |  6 +++---
> >  5 files changed, 12 insertions(+), 12 deletions(-)
> >
> > diff --git a/classes/java-library.bbclass b/classes/java-library.bbclas=
s
> > index 144cd2f..58d5a40 100644
> > --- a/classes/java-library.bbclass
> > +++ b/classes/java-library.bbclass
> > @@ -23,8 +23,8 @@ def java_package_name(d):
> >    pre=3D""
> >    post=3D""
> >
> > -  bpn =3D bb.data.getVar('BPN', d, 1)
> > -  ml =3D bb.data.getVar('MLPREFIX', d, 1)
> > +  bpn =3D d.getVar('BPN', True)
> > +  ml =3D d.getVar('MLPREFIX', True)
> >
>=20
> If you=E2=80=99re working on master, even the =E2=80=98, True=E2=80=99 is=
 no longer needed, FYI.

I suspect that meta-java master is meant to work with more than just
bitbake master, so keeping the parameter makes sense.

I think the change is okay and I'd love to see it merged as soon as
possible. In Ostro OS, updating to bitbake and OE-core master is blocked
by this meta-java incompatibility with bitbake master.

Can someone with commit rights to meta-java please merge it?

Bye, Patrick


