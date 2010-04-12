Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1O1M68-00045d-R8
	for openembedded-devel@lists.openembedded.org;
	Mon, 12 Apr 2010 18:02:54 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1O1M2n-0000wP-8y from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 12 Apr 2010 08:59:25 -0700
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Mon, 12 Apr 2010 08:59:25 -0700
Received: from 172.30.80.192 ([172.30.80.192]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Mon, 12 Apr 2010 15:59:24 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	12 Apr 2010 08:59:18 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <hpum4g$18m$1@dough.gmane.org>
References: <1270135981.4993.128.camel@rex>  <hpum4g$18m$1@dough.gmane.org>
Organization: Mentor Graphics Corporation
Date: Mon, 12 Apr 2010 08:59:17 -0700
Message-ID: <1271087957.29304.86.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 12 Apr 2010 15:59:25.0016 (UTC)
	FILETIME=[1F931D80:01CADA59]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Request for branch merge
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
X-List-Received-Date: Mon, 12 Apr 2010 16:02:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2010-04-12 at 10:37 +0200, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> On 01-04-10 17:33, Richard Purdie wrote:
> > I've been aware that Poky and OE have been diverging slightly and I'd
> > like to correct this. There are some patches that I've promised for a
> > while too such as the rename from do_populate_staging ->
> > do_populate_sysroot.
> >=20
> > With some help from Joshua Lock, I have a branch I'd like to propose be
> > merged into OE.dev:
> >=20
> > http://cgit.openembedded.org/cgit.cgi/openembedded/log/?h=3Drpurdie/wor=
k-in-progress
>=20
> Joshuas last 3 commits to poky seem to fix Toms issue with binconfig and
> my issue with chrpath, which only leaves the cross staging lamangler
> stuff to get fixed.

Actually (and I'm OK with binconfig stuff being broken in the first
merge) the problem with binconfig junk isn't the file contents, but the
file location.  staging-target-pkg will contain
staging/<host>/usr/bin/<target>/foo-config.  Which means using pstaging
for a target pkg built on 32bit Linux fails when used on 64bit Linux.
Not that I wouldn't mind seeing the binconfig stuff die, just saying
it's a problem today :)

>=20
> regards,
>=20
> Koen
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>=20
> iD8DBQFLwtvQMkyGM64RGpERAlkTAJ9OgPD4AlWVQk7E0fSH80USdap4SgCfdS+X
> HSSYMh5iRIPDePeGRVVrnvk=3D
> =3DUsoG
> -----END PGP SIGNATURE-----
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


--=20
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


