Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TcwRP-0000vW-Hy
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Nov 2012 12:01:31 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 26 Nov 2012 02:47:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.83,319,1352102400"; d="scan'208";a="252517439"
Received: from unknown (HELO helios.localnet) ([10.252.122.215])
	by fmsmga001.fm.intel.com with ESMTP; 26 Nov 2012 02:47:17 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Eric =?ISO-8859-1?Q?B=E9nard?= <eric@eukrea.com>
Date: Mon, 26 Nov 2012 10:47:16 +0000
Message-ID: <4687762.mJq0VPosuu@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.3 (Linux/3.2.0-33-generic-pae; KDE/4.9.3; i686; ; )
In-Reply-To: <20121126113853.5e09dcff@eb-e6520>
References: <1353885218-5623-1-git-send-email-eric@eukrea.com>
	<5889530.MeT4QD1KUF@helios> <20121126113853.5e09dcff@eb-e6520>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] ntp: fix checksum
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
X-List-Received-Date: Mon, 26 Nov 2012 11:01:31 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On Monday 26 November 2012 11:38:53 Eric B=E9nard wrote:
> Hi Paul,
>=20
> Le Mon, 26 Nov 2012 10:34:23 +0000,
>=20
> Paul Eggleton <paul.eggleton@linux.intel.com> a =E9crit :
> > On Monday 26 November 2012 00:13:38 Eric B=E9nard wrote:
> > > commit e15543f05bb2c321cd649b90de50d1a3d8cd1199 upgrade the recip=
e to
> > > a newer version but didn't update the checksum so fetch is failin=
g.
> > >=20
> > > Signed-off-by: Eric B=E9nard <eric@eukrea.com>
> > > ---
> > >=20
> > >  meta-networking/recipes-support/ntp/ntp_4.2.6p5.bb | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >=20
> > > diff --git a/meta-networking/recipes-support/ntp/ntp_4.2.6p5.bb
> > > b/meta-networking/recipes-support/ntp/ntp_4.2.6p5.bb index
> > > f7c5b68..0fce5ce
> > > 100644
> > > --- a/meta-networking/recipes-support/ntp/ntp_4.2.6p5.bb
> > > +++ b/meta-networking/recipes-support/ntp/ntp_4.2.6p5.bb
> > > @@ -8,8 +8,8 @@ SRC_URI =3D
> > > "http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-${PV}.=
tar.g
> > > file://ntpdate \
> > >=20
> > >  "
> > >=20
> > > -SRC_URI[md5sum] =3D "59876a9009b098ff59767ee45a88ebd2"
> > > -SRC_URI[sha256sum] =3D
> > > "6e84d4ddfa14b911c3ed88463af10867e1fa9b287e7b34d8a02e78be85a7c40e=
"
> > > +SRC_URI[md5sum] =3D "00df80a84ec9528fcfb09498075525bc"
> > > +SRC_URI[sha256sum] =3D
> > > "d6ab8371f9d31e594eb6922823d5ccd03dcc4e9d84b0e23ea25ac1405432f91c=
"
> > >=20
> > >  EXTRA_OECONF +=3D " --with-net-snmp-config=3Dno --without-ntpsnm=
pd"
> >=20
> > Hmm, you're right - it did get missed. Strangely though if I do -c
> > cleanall
> > ntp then build ntp again I don't get an error with the wrong checks=
um
> > (with
> > danny) :/
>=20
> I also met this kind of behaviour but didn't look in depth at it : it=

> seems that once a package is fetched, further builds won't trigger
> an error if the checksum in the recipe is wrong.

The checksum is not verified if the .done file exists on the assumption=
 that the=20
fetch completed successfully and has already been verified; however whe=
n I did=20
-c cleanall I checked - there was no .done file, so this is unexpected=20=

behaviour.

Cheers,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre


