Received: from 12.mo4.mail-out.ovh.net ([178.33.104.253]
	helo=mo4.mail-out.ovh.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1TcwO8-0000Ns-1E
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Nov 2012 11:58:10 +0100
Received: from mail413.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo4.mail-out.ovh.net (Postfix) with SMTP id 221C210503BF
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Nov 2012 11:46:51 +0100 (CET)
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 26 Nov 2012 12:38:54 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO eb-e6520)
	(eric%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 26 Nov 2012 12:38:53 +0200
Date: Mon, 26 Nov 2012 11:38:53 +0100
From: Eric =?ISO-8859-1?B?QuluYXJk?= <eric@eukrea.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Ovh-Mailout: 178.32.228.4 (mo4.mail-out.ovh.net)
Message-ID: <20121126113853.5e09dcff@eb-e6520>
In-Reply-To: <5889530.MeT4QD1KUF@helios>
References: <1353885218-5623-1-git-send-email-eric@eukrea.com>
	<5889530.MeT4QD1KUF@helios>
Organization: =?ISO-8859-1?B?RXVrculh?= Electromatique
X-Mailer: Claws Mail 3.8.1 (GTK+ 2.24.8; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
X-Ovh-Tracer-Id: 5097230355095727433
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-OVH-SPAMSTATE: OK
X-OVH-SPAMSCORE: -110
X-OVH-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeehgedrvdehucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfghrlhcuvffnffculddquddtmdenucfhrhhomhepgfhrihgtuceurohnrghrugcuoegvrhhitgesvghukhhrvggrrdgtohhmqeenucffohhmrghinhepuhguvghlrdgvughunecujfgurhepfffhvffukfgjfhhoofggtgfgsehtqhertdertddu
X-Spam-Check: DONE|U 0.5/N
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -110
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeehgedrvdehucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfghrlhcuvffnffculddquddtmdenucfhrhhomhepgfhrihgtuceurohnrghrugcuoegvrhhitgesvghukhhrvggrrdgtohhmqeenucffohhmrghinhepuhguvghlrdgvughunecujfgurhepfffhvffukfgjfhhoofggtgfgsehtqhertdertddu
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
X-List-Received-Date: Mon, 26 Nov 2012 10:58:11 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Paul,

Le Mon, 26 Nov 2012 10:34:23 +0000,
Paul Eggleton <paul.eggleton@linux.intel.com> a =E9crit :

> On Monday 26 November 2012 00:13:38 Eric B=E9nard wrote:
> > commit e15543f05bb2c321cd649b90de50d1a3d8cd1199 upgrade the recipe to
> > a newer version but didn't update the checksum so fetch is failing.
> >=20
> > Signed-off-by: Eric B=E9nard <eric@eukrea.com>
> > ---
> >  meta-networking/recipes-support/ntp/ntp_4.2.6p5.bb | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/meta-networking/recipes-support/ntp/ntp_4.2.6p5.bb
> > b/meta-networking/recipes-support/ntp/ntp_4.2.6p5.bb index f7c5b68..0fc=
e5ce
> > 100644
> > --- a/meta-networking/recipes-support/ntp/ntp_4.2.6p5.bb
> > +++ b/meta-networking/recipes-support/ntp/ntp_4.2.6p5.bb
> > @@ -8,8 +8,8 @@ SRC_URI =3D
> > "http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-${PV}.tar.g
> > file://ntpdate \
> >  "
> >=20
> > -SRC_URI[md5sum] =3D "59876a9009b098ff59767ee45a88ebd2"
> > -SRC_URI[sha256sum] =3D
> > "6e84d4ddfa14b911c3ed88463af10867e1fa9b287e7b34d8a02e78be85a7c40e"
> > +SRC_URI[md5sum] =3D "00df80a84ec9528fcfb09498075525bc"
> > +SRC_URI[sha256sum] =3D
> > "d6ab8371f9d31e594eb6922823d5ccd03dcc4e9d84b0e23ea25ac1405432f91c"
> >=20
> >  EXTRA_OECONF +=3D " --with-net-snmp-config=3Dno --without-ntpsnmpd"
>=20
> Hmm, you're right - it did get missed. Strangely though if I do -c cleana=
ll=20
> ntp then build ntp again I don't get an error with the wrong checksum (wi=
th=20
> danny) :/
>=20
I also met this kind of behaviour but didn't look in depth at it : it
seems that once a package is fetched, further builds won't trigger
an error if the checksum in the recipe is wrong.=20

Eric


