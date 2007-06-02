Received: from [209.85.132.247] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <lvcargnini@gmail.com>) id 1Huam8-0005yw-52
	for openembedded-devel@lists.openembedded.org;
	Sat, 02 Jun 2007 23:04:40 +0200
Received: by an-out-0708.google.com with SMTP id b33so224791ana
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 02 Jun 2007 14:02:40 -0700 (PDT)
Received: by 10.100.248.18 with SMTP id v18mr1780707anh.1180818159771;
	Sat, 02 Jun 2007 14:02:39 -0700 (PDT)
Received: by 10.100.11.6 with HTTP; Sat, 2 Jun 2007 14:02:39 -0700 (PDT)
Message-ID: <ae36f8040706021402o6306798ax50e7038f7c334c01@mail.gmail.com>
Date: Sat, 2 Jun 2007 18:02:39 -0300
From: "=?ISO-8859-1?Q?Lu=EDs_Cargnini?=" <lvcargnini@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <ae36f8040706011335u7cf556afo7d9a36890b7df2a@mail.gmail.com>
MIME-Version: 1.0
References: <465F3C8B.80200@dominion.kabel.utwente.nl>
	<ae36f8040705311923r4a9e871ewf4c5a6bf76adc9ab@mail.gmail.com>
	<432beae0705311951p68201aa4u542ad050cbe5b609@mail.gmail.com>
	<ae36f8040706011335u7cf556afo7d9a36890b7df2a@mail.gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.9
Subject: Re: Glibc 2.6 added, please test
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
X-List-Received-Date: Sat, 02 Jun 2007 21:04:41 -0000
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

rewsult :


| dl-lookup.c: In function 'add_dependency':
| dl-lookup.c:104: error: 'RTLD_SINGLE_THREAD_P' undeclared (first use in
this function)
| dl-lookup.c:104: error: (Each undeclared identifier is reported only once
| dl-lookup.c:104: error: for each function it appears in.)
| make[2]: ***
[/home/lvcargnini/puc/instramed/openembedded/tmp/work/armv5te-linux/glibc-
2.6-r0/build-arm-linux/elf/dl-lookup.o] Error 1
| make[2]: Leaving directory
`/home/lvcargnini/puc/instramed/openembedded/tmp/work/armv5te-linux/glibc-
2.6-r0/glibc-2.6/elf'
| make[1]: *** [elf/subdir_lib] Error 2
| make[1]: Leaving directory
`/home/lvcargnini/puc/instramed/openembedded/tmp/work/armv5te-linux/glibc-
2.6-r0/glibc-2.6'
| make: *** [all] Error 2
| FATAL: oe_runmake failed
NOTE: Task failed:
/home/lvcargnini/puc/instramed/openembedded/tmp/work/armv5te-linux/glibc-
2.6-r0/temp/log.do_compile.522
NOTE: package glibc-2.6-r0: task do_compile: failed
ERROR: TaskFailed event exception, aborting
NOTE: package glibc-2.6: failed
ERROR: Build of 'glibc' failed
Build statistics:
  Attempted builds: 1
  Failed builds: 1


On 6/1/07, Lu=EDs Cargnini <lvcargnini@gmail.com> wrote:
>
> I should always perform, pull before update ?
>
> On 5/31/07, Justin Patrin <papercrane@gmail.com> wrote:
> >
> > On 5/31/07, Lu=EDs Cargnini <lvcargnini@gmail.com > wrote:
> > > I did an mtn update but glibc 2.6 is not appearing on my
> > packages/glibc
> > > directory
> >
> > Did you mtn pull first?
> >
> > >
> > > On 5/31/07, Koen Kooi < koen@dominion.kabel.utwente.nl> wrote:
> > > >
> > > > -----BEGIN PGP SIGNED MESSAGE-----
> > > > Hash: SHA1
> > > >
> > > > Hi,
> > > >
> > > > Glibc 2.6 has just been added to OE, please test it and report bugs=
.
> >
> > > >
> > > > TIA,
> > > >
> > > > Koen
> > > > -----BEGIN PGP SIGNATURE-----
> > > > Version: GnuPG v1.4.5 (Darwin)
> > > >
> > > > iD8DBQFGXzyLMkyGM64RGpERAk8EAJ9vszt8ghLdUoVvRLarLWNM40TpUgCfToVG
> > > > QCCW9dQifUQvV8H8H+5VVR0=3D
> > > > =3D9U8f
> > > > -----END PGP SIGNATURE-----
> > > >
> > > > _______________________________________________
> > > > Openembedded-devel mailing list
> > > > Openembedded-devel@lists.openembedded.org
> > > > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-de=
vel
> >
> > > >
> > >
> > >
> > >
> > > --
> > >
> > -----------------------------------------------------------------------=
-------
> > > Thanks && Regards
> > > Msc. Bsc. Lu=EDs Vit=F3rio Cargnini
> > > IEEE Member
> > > Electrical Engineer Faculty @ PUCRS
> > > Ipiranga Avenue, 6681 =96 Building 30
> > > P.O. Box: 90619-900 =96 Porto Alegre/RS
> > > Phone: +55 51 3320 3500  extension: 7696
> > >
> > -----------------------------------------------------------------------=
----------
> >
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-deve=
l
> > >
> >
> >
> > --
> > Justin Patrin
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

