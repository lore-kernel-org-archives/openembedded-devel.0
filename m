Received: from [209.85.132.245] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <lvcargnini@gmail.com>) id 1Hv38R-0004rq-TQ
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Jun 2007 05:21:36 +0200
Received: by an-out-0708.google.com with SMTP id b33so274323ana
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 03 Jun 2007 20:19:29 -0700 (PDT)
Received: by 10.100.46.19 with SMTP id t19mr2336764ant.1180927168565;
	Sun, 03 Jun 2007 20:19:28 -0700 (PDT)
Received: by 10.100.38.6 with HTTP; Sun, 3 Jun 2007 20:19:28 -0700 (PDT)
Message-ID: <ae36f8040706032019q12a628fcte0325229297a9076@mail.gmail.com>
Date: Mon, 4 Jun 2007 00:19:28 -0300
From: "=?ISO-8859-1?Q?Lu=EDs_Cargnini?=" <lvcargnini@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <73D8EBA5-2F97-43F0-B474-6BD6B7023BA3@gmx.net>
MIME-Version: 1.0
References: <ae36f8040706021959p2c020f17k454aa346d7123f95@mail.gmail.com>
	<73D8EBA5-2F97-43F0-B474-6BD6B7023BA3@gmx.net>
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
X-List-Received-Date: Mon, 04 Jun 2007 03:21:36 -0000
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

I modified my distro to angstrom, and the following happens:
elf/dl-lookup.o.dt -MT
/home/lvcargnini/puc/instramed/openembedded/tmp/work/glibc-2.6-r0
/build-arm-linux/elf/dl-lookup.o
| dl-lookup.c: In function 'add_dependency':
| dl-lookup.c:104: error: 'RTLD_SINGLE_THREAD_P' undeclared (first use in
this function)
| dl-lookup.c:104: error: (Each undeclared identifier is reported only once
| dl-lookup.c:104: error: for each function it appears in.)
| make[2]: *** [/home/lvcargnini/puc/instramed/openembedded/tmp/work/glibc-
2.6-r0/build-arm-linux/elf/dl-lookup.o] Error 1
| make[2]: Leaving directory
`/home/lvcargnini/puc/instramed/openembedded/tmp/work/glibc-2.6-r0/glibc-2.=
6
/elf'
| make[1]: *** [elf/subdir_lib] Error 2
| make[1]: Leaving directory
`/home/lvcargnini/puc/instramed/openembedded/tmp/work/glibc-2.6-r0/glibc-2.=
6
'
| make: *** [all] Error 2
| FATAL: oe_runmake failed
NOTE: Task failed:
/home/lvcargnini/puc/instramed/openembedded/tmp/work/glibc-2.6-r0
/temp/log.do_compile.9205
NOTE: package glibc-2.6-r0: task do_compile: failed
ERROR: TaskFailed event exception, aborting
NOTE: package glibc-2.6: failed
ERROR: Build of task-base failed


On 6/3/07, Holger Freyther <freyther@gmx.net> wrote:
>
> >
> > OE Build Configuration:
> > BB_VERSION     =3D "1.6.6"
> > OE_REVISION    =3D "c6559ceba5987d7142c9759ae7f895632ac3b712"
> > TARGET_ARCH    =3D "arm"
> > TARGET_OS      =3D "linux"
> > MACHINE        =3D "omap5912osk"
> > DISTRO         =3D "generic"
>
> Hi,
> does this happen with angstrom linux as distribution as well?
>
> h.
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

