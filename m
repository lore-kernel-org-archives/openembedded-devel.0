Received: from [209.85.132.245] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <lvcargnini@gmail.com>) id 1HvcUy-0000ze-SI
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Jun 2007 19:07:13 +0200
Received: by an-out-0708.google.com with SMTP id b33so390060ana
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Jun 2007 10:04:56 -0700 (PDT)
Received: by 10.100.196.3 with SMTP id t3mr3438495anf.1181063096362;
	Tue, 05 Jun 2007 10:04:56 -0700 (PDT)
Received: by 10.100.38.6 with HTTP; Tue, 5 Jun 2007 10:04:56 -0700 (PDT)
Message-ID: <ae36f8040706051004j24debcd0g397143693f2f1285@mail.gmail.com>
Date: Tue, 5 Jun 2007 14:04:56 -0300
From: "=?ISO-8859-1?Q?Lu=EDs_Cargnini?=" <lvcargnini@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <46641153.2050207@dominion.kabel.utwente.nl>
MIME-Version: 1.0
References: <ae36f8040706021959p2c020f17k454aa346d7123f95@mail.gmail.com>
	<73D8EBA5-2F97-43F0-B474-6BD6B7023BA3@gmx.net>
	<ae36f8040706032019q12a628fcte0325229297a9076@mail.gmail.com>
	<4663C0AC.7020804@dominion.kabel.utwente.nl>
	<ae36f8040706040555s79d65114r57f7f514c6c746d5@mail.gmail.com>
	<46641153.2050207@dominion.kabel.utwente.nl>
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
X-List-Received-Date: Tue, 05 Jun 2007 17:07:13 -0000
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

ok commented, cleaned the tmp using rm -rf and doing bitbake task-base righ
now

On 6/4/07, Koen Kooi <koen@dominion.kabel.utwente.nl> wrote:
>
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Lu=EDs Cargnini schreef:
> > maybe because of this configuration lines:
> > #ASSUME_PROVIDED +=3D "/opt/eldk/usr/bin"
> > ASSUME_PROVIDED +=3D " virtual/${TARGET_PREFIX}gcc "
> > ASSUME_PROVIDED +=3D " virtual/glibc "
> > # Select between multiple alternative providers, if more than one is
> > eligible.
> > PREFERRED_PROVIDERS =3D "virtual/qte:qte virtual/libqpe:libqpe-opie"
> > PREFERRED_PROVIDERS +=3D " virtual/libsdl:libsdl-x11"
> > PREFERRED_PROVIDERS +=3D "
> > virtual/${TARGET_PREFIX}gcc-initial:gcc-cross-initial"
> > PREFERRED_PROVIDERS +=3D " virtual/${TARGET_PREFIX}gcc:gcc-cross"
> > PREFERRED_PROVIDERS +=3D " virtual/${TARGET_PREFIX}g++:gcc-cross"
>
> Yes, remove all of those.
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFGZBFSMkyGM64RGpERAuTGAJ43KPrYYSHjLdFpvwooa66bGoFSFACcCGKk
> lJdmmKosSpqTvdl+Q4MPvGI=3D
> =3D6jKp
> -----END PGP SIGNATURE-----
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
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

