Received: from [64.233.184.234] (helo=wr-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <lvcargnini@gmail.com>) id 1HvCDn-0002Xi-Ln
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Jun 2007 15:03:46 +0200
Received: by wr-out-0506.google.com with SMTP id i20so741631wra
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Jun 2007 06:01:34 -0700 (PDT)
Received: by 10.100.227.5 with SMTP id z5mr2528169ang.1180962093615;
	Mon, 04 Jun 2007 06:01:33 -0700 (PDT)
Received: by 10.100.38.6 with HTTP; Mon, 4 Jun 2007 06:01:33 -0700 (PDT)
Message-ID: <ae36f8040706040601t3f93b2d3t79895363257ca6a6@mail.gmail.com>
Date: Mon, 4 Jun 2007 10:01:33 -0300
From: "=?ISO-8859-1?Q?Lu=EDs_Cargnini?=" <lvcargnini@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <ae36f8040706040555s79d65114r57f7f514c6c746d5@mail.gmail.com>
MIME-Version: 1.0
References: <ae36f8040706021959p2c020f17k454aa346d7123f95@mail.gmail.com>
	<73D8EBA5-2F97-43F0-B474-6BD6B7023BA3@gmx.net>
	<ae36f8040706032019q12a628fcte0325229297a9076@mail.gmail.com>
	<4663C0AC.7020804@dominion.kabel.utwente.nl>
	<ae36f8040706040555s79d65114r57f7f514c6c746d5@mail.gmail.com>
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
X-List-Received-Date: Mon, 04 Jun 2007 13:03:47 -0000
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

distro var modified from angstrom to

DISTRO =3D "angstrom-2007.1"


On 6/4/07, Lu=EDs Cargnini <lvcargnini@gmail.com> wrote:
>
> maybe because of this configuration lines:
> #ASSUME_PROVIDED +=3D "/opt/eldk/usr/bin"
> ASSUME_PROVIDED +=3D " virtual/${TARGET_PREFIX}gcc "
> ASSUME_PROVIDED +=3D " virtual/glibc "
> # Select between multiple alternative providers, if more than one is
> eligible.
> PREFERRED_PROVIDERS =3D "virtual/qte:qte virtual/libqpe:libqpe-opie"
> PREFERRED_PROVIDERS +=3D " virtual/libsdl:libsdl-x11"
> PREFERRED_PROVIDERS +=3D "
> virtual/${TARGET_PREFIX}gcc-initial:gcc-cross-initial"
> PREFERRED_PROVIDERS +=3D " virtual/${TARGET_PREFIX}gcc:gcc-cross"
> PREFERRED_PROVIDERS +=3D " virtual/${TARGET_PREFIX}g++:gcc-cross"
>
>
> On 6/4/07, Koen Kooi <koen@dominion.kabel.utwente.nl> wrote:
> >
> > -----BEGIN PGP SIGNED MESSAGE-----
> > Hash: SHA1
> >
> > Lu=EDs Cargnini schreef:
> > > I modified my distro to angstrom, and the following happens:
> > > elf/dl-lookup.o.dt -MT
> > > /home/lvcargnini/puc/instramed/openembedded/tmp/work/glibc- 2.6-r0
> >
> > I think you mistyped something, since angstrom doesn't use glibc 2.6.
> > See
> > http://www.angstrom-distribution.org/building-angstrom
> >
> > regards,
> >
> > Koen
> > -----BEGIN PGP SIGNATURE-----
> > Version: GnuPG v1.4.5 (Darwin)
> >
> > iD8DBQFGY8CrMkyGM64RGpERAkYlAJ97kczQnhSFWRlMZL+ODLONl44NHACfUtdc
> > sYh+XI//+EujwtVBs54EULE=3D
> > =3DnBWA
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

