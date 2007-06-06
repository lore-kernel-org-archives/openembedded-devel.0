Received: from [209.85.132.244] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <lvcargnini@gmail.com>) id 1Hvkja-0000TB-ES
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Jun 2007 03:54:50 +0200
Received: by an-out-0708.google.com with SMTP id b33so418365ana
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Jun 2007 18:52:32 -0700 (PDT)
Received: by 10.100.37.4 with SMTP id k4mr3727637ank.1181094751942;
	Tue, 05 Jun 2007 18:52:31 -0700 (PDT)
Received: by 10.100.38.6 with HTTP; Tue, 5 Jun 2007 18:52:31 -0700 (PDT)
Message-ID: <ae36f8040706051852s10483277h1ce4f162726d9d0a@mail.gmail.com>
Date: Tue, 5 Jun 2007 22:52:31 -0300
From: "=?ISO-8859-1?Q?Lu=EDs_Cargnini?=" <lvcargnini@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <ae36f8040706051806q120be1bdyae9da9c8f754ab59@mail.gmail.com>
MIME-Version: 1.0
References: <ae36f8040706021959p2c020f17k454aa346d7123f95@mail.gmail.com>
	<4663C0AC.7020804@dominion.kabel.utwente.nl>
	<ae36f8040706040555s79d65114r57f7f514c6c746d5@mail.gmail.com>
	<46641153.2050207@dominion.kabel.utwente.nl>
	<ae36f8040706051004j24debcd0g397143693f2f1285@mail.gmail.com>
	<ae36f8040706051136h36f72d93wd6c4df2845018c8a@mail.gmail.com>
	<7C28F02B-B392-4557-9E7A-2991BE0E1BF3@gmx.net>
	<ae36f8040706051251g22ae2a09ha560b3c8b6d0de57@mail.gmail.com>
	<4665CF19.2030501@dominion.kabel.utwente.nl>
	<ae36f8040706051806q120be1bdyae9da9c8f754ab59@mail.gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.9
Subject: Re: problems doing bitbake task-base
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 06 Jun 2007 01:54:50 -0000
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

I already upgraded the bitbake and uploaded to bugs.gentoo.org a new ebuild
file
Attachment #121306<https://bugs.gentoo.org/attachment.cgi?id=3D121306&actio=
n=3Dedit>to
Bug
#181034 <https://bugs.gentoo.org/show_bug.cgi?id=3D181034>
so my latest output from bitbake after try bitbake task-base was:

NOTE: Invalid cache found, rebuilding...
NOTE: Handling BitBake files: \ (0035/4598) [ 0 %]ERROR: Could not inherit
file classes/rootfs_tar.bbclass while parsing
/home/lvcargnini/puc/instramed/openembedded/org.openembedded.dev/packages/a=
ngstrom/angstrom-
bootmanager-image.bb
NOTE: Handling BitBake files: \ (0037/4598) [ 0 %]ERROR: Could not inherit
file classes/rootfs_tar.bbclass while parsing
/home/lvcargnini/puc/instramed/openembedded/org.openembedded.dev/packages/a=
ngstrom/angstrom-
console-image.bb
ERROR: Could not inherit file classes/rootfs_tar.bbclass while parsing
/home/lvcargnini/puc/instramed/openembedded/org.openembedded.dev/packages/a=
ngstrom/angstrom-
e-image.bb
ERROR: Could not inherit file classes/rootfs_tar.bbclass while parsing
/home/lvcargnini/puc/instramed/openembedded/org.openembedded.dev/packages/a=
ngstrom/angstrom-
mokogateway-image.bb
NOTE: Handling BitBake files: | (0041/4598) [ 0 %]ERROR: Could not inherit
file classes/rootfs_tar.bbclass while parsing
/home/lvcargnini/puc/instramed/openembedded/org.openembedded.dev/packages/a=
ngstrom/angstrom-
x11-image.bb
NOTE: Handling BitBake files: \ (0448/4598) [ 9 %]Traceback (most recent
call last):


On 6/5/07, Lu=EDs Cargnini <lvcargnini@gmail.com> wrote:
>
> so just to make it fast before I could upload everything to some server
> here follow my local.conf:
>
> DL_DIR =3D "/home/lvcargnini/puc/instramed/openembedded/build/sources"
> BBFILES :=3D
> "/home/lvcargnini/puc/instramed/openembedded/org.openembedded.dev/package=
s/*/*.bb"
>
> BBMASK =3D ""
> TMPDIR=3D/home/lvcargnini/puc/instamed/openembedded/tmp
> MACHINE =3D "omap5912osk"
> TARGET_ARCH =3D "arm"
> TARGET_OS =3D "linux"
> DISTRO =3D "angstrom-2007.1"
> GLIBC_GENERATE_LOCALES =3D "en en_GB.UTF-8 fr pt_BR.UTF-8"
> INHERIT =3D "package_tar"
> IMAGE_FSTYPES =3D "jffs2 tar cramfs"
> BBDEBUG =3D "yes
> BBINCLUDELOGS =3D "yes"
>
>
>
> On 6/5/07, Koen Kooi <koen@dominion.kabel.utwente.nl> wrote:
> >
> > -----BEGIN PGP SIGNED MESSAGE-----
> > Hash: SHA1
> >
> > Lu=EDs Cargnini schreef:
> > > dev-embedded/bitbake
> > >       Latest version available: 1.6.6
> > >       Latest version installed: 1.6.6
> > >       Size of files: 89 kB
> > >       Homepage:      http://developer.berlios.de/projects/bitbake/
> > >       Description:   package management tool for OpenEmbedded
> > >       License:       GPL-2
> > >
> > >
> > > Searching...
> > > [ Results for search key : monotone ]
> > > [ Applications found : 1 ]
> > >
> > > *  dev-util/monotone
> > >       Latest version available: 0.33
> > >       Latest version installed: 0.33
> > >       Size of files: 4,651 kB
> > >       Homepage:      http://monotone.ca
> > >       Description:   Monotone Distributed Version Control System
> > >       License:       GPL-2
> > >
> > > my revision of OE I think is the latest I downloaded it from
> > > openembedded.org, I did an pull update 2 days ago and mtn update
> > today.
> > > I installed the bitbake and monotone using emerge of my gentoo it get
> > the
> > > latest stable version I suppose ?
> > > I will get all the information and put somewhere than they could
> > download
> > > it.
> >
> > Follow http://www.angstrom-distribution.org/building-angstrom to get
> > something that was a
> > 99% chance of building without any troubles.
> >
> > regards,
> >
> > Koen
> > -----BEGIN PGP SIGNATURE-----
> > Version: GnuPG v1.4.5 (Darwin)
> >
> > iD8DBQFGZc8ZMkyGM64RGpERApLmAKC6kPVEgMfA0bQfDoMP6dMOlcdHHQCfT+TA
> > dccaqsifJr47CCHOsjiKYy0=3D
> > =3D5QOT
> > -----END PGP SIGNATURE-----
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >
>
>
>
> --
>
> -------------------------------------------------------------------------=
-----
> Thanks && Regards
> Msc. Bsc. Lu=EDs Vit=F3rio Cargnini
> IEEE Member
> Electrical Engineer Faculty @ PUCRS
> Ipiranga Avenue, 6681 =96 Building 30
> P.O. Box: 90619-900 =96 Porto Alegre/RS
> Phone: +55 51 3320 3500  extension: 7696
> -------------------------------------------------------------------------=
--------
>
>



--=20
---------------------------------------------------------------------------=
---
Thanks && Regards
Msc. Bsc. Lu=EDs Vit=F3rio Cargnini
IEEE Member
Electrical Engineer Faculty @ PUCRS
Ipiranga Avenue, 6681 =96 Building 30
P.O. Box: 90619-900 =96 Porto Alegre/RS
Phone: +55 51 3320 3500  extension: 7696
---------------------------------------------------------------------------=
------

