Received: from [209.172.120.180] (helo=skymoon.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ckamas@finesse.com>) id 1MBVLL-0004Uw-G8
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Jun 2009 16:51:59 +0200
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Tue, 2 Jun 2009 07:43:07 -0700
Message-ID: <C62896630644CE43BF64B0FF0AC27F0E05B514@mail.ad.skymv.com>
In-Reply-To: <1243929198.5049.45.camel@lenovo.internal.reciva.com>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [oe] bitbake virtual/kernel -c menuconfig
Thread-Index: AcnjV8LwUzBWjAjnRuOJjKV7mjX/AwAN/aKQ
References: <C62896630644CE43BF64B0FF0AC27F0E05B4D2@mail.ad.skymv.com>
	<1243929198.5049.45.camel@lenovo.internal.reciva.com>
From: "Chuck Kamas" <ckamas@finesse.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: Re: bitbake virtual/kernel -c menuconfig
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
X-List-Received-Date: Tue, 02 Jun 2009 14:51:59 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> > export DISPLAY=3D0.0 such that menuconfig gets it?
>=20
> I'd have thought you would be able to put it in the=20
> environment, but failing that local.conf should work.

I'll give this a try.

>=20
> > Also I noticed that the patch files are being applied before=20
> > menuconfig in Angstrom but not in minimal and micro.  How=20
> do I fix this?
>=20
> That's a bit odd.  Which particular kernel are you trying to build?
>=20

The kernel is 2.6.28 and the patches are the AT91 set.   What is
interesting is that I change nothing but the distro=3D line and the
menuconfig works with the patches applied.  I do know that there is a
lot hidden behind the distro=3D line,  that is why I am asking the =
experts
for their insight into how it all works and where to look for what is
going wrong.

Regarding Angstrom:  I have no animosity against it. I am simply
following the rule: "start with the bare metal and build up".  This is
allowing me to learn how OE works and be a contributing member of the
community.  I could have gone the other way, but I find a great number
of options confusing.  It is just a preference thing.  I choose "small"
in both the sense of options and image size.

Chuck


