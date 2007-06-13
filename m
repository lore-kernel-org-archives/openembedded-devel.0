Received: from [209.85.132.250] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <lvcargnini@gmail.com>) id 1HyVnX-0003AS-UZ
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Jun 2007 18:34:33 +0200
Received: by an-out-0708.google.com with SMTP id b33so50141ana
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jun 2007 09:31:16 -0700 (PDT)
Received: by 10.100.195.10 with SMTP id s10mr448373anf.1181752276372;
	Wed, 13 Jun 2007 09:31:16 -0700 (PDT)
Received: by 10.100.38.6 with HTTP; Wed, 13 Jun 2007 09:31:16 -0700 (PDT)
Message-ID: <ae36f8040706130931r4e81a08bi8ca10417336df3b5@mail.gmail.com>
Date: Wed, 13 Jun 2007 13:31:16 -0300
From: "=?ISO-8859-1?Q?Lu=EDs_Cargnini?=" <lvcargnini@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20070613123908.GA19284@twibble.org>
MIME-Version: 1.0
References: <7C28F02B-B392-4557-9E7A-2991BE0E1BF3@gmx.net>
	<4665CF19.2030501@dominion.kabel.utwente.nl>
	<ae36f8040706051806q120be1bdyae9da9c8f754ab59@mail.gmail.com>
	<4666520C.8060000@dominion.kabel.utwente.nl>
	<4666576A.9030608@dominion.kabel.utwente.nl>
	<ae36f8040706060937la8400adr2f98d7db547a2664@mail.gmail.com>
	<ae36f8040706061036i3662ee38x104bb1896550b64@mail.gmail.com>
	<ae36f8040706061143o47650436we993cf24bd807174@mail.gmail.com>
	<ae36f8040706071545i772205b2m85d251b45c7f26d7@mail.gmail.com>
	<20070613123908.GA19284@twibble.org>
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
X-List-Received-Date: Wed, 13 Jun 2007 16:34:48 -0000
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

So what you are telling me is this perl is been compiled to run over my hos=
t
machine ?
So it is not been cross-compiled for my target ?
I  am correct in this tw statements ?
If yes ..... why ? Why compilate the perl ????
just put it as a pre-requisite for OE installation !
my perl --version of gentoo installed version:
enterprise ~ # perl --version

This is perl, v5.8.8 built for i686-linux

Copyright 1987-2006, Larry Wall

Perl may be copied only under the terms of either the Artistic License or
the
GNU General Public License, which may be found in the Perl 5 source kit.

Complete documentation for Perl, including FAQ lists, should be found on
this system using "man perl" or "perldoc perl".  If you have access to the
Internet, point your browser at http://www.perl.org/, the Perl Home Page.

enterprise ~ #


this asm/page.h is plataform dependent when we configure the kernel it will
create a symlink inside include of asm to especific asm-ARCH that we are
compiling or even cross-compiling.

On 6/13/07, Jamie Lenehan <lenehan@twibble.org> wrote:
>
> On Fri, Jun 08, 2007 at 08:53:49AM +1000, "Lu=EDs Cargnini" wrote:
> > new problems:
> > (BD06DC30:~/puc/instramed/openembedded) lvcargnini% bitbake task-base
> > NOTE: Handling BitBake files: - (4588/4588) [100 %]
> > NOTE: Parsing finished. 4373 cached, 0 parsed, 215 skipped, 0 masked.
> > NOTE: build 200706071941: started
> [...]
> > SysV.xs:7:25: error: asm/page.h: No such file or directory
> > make[1]: *** [SysV.o] Error 1
> > make[1]: Leaving directory
> > `/home/lvcargnini/puc/instramed/openembedded/tmp/work/i686-linux/perl-
> native-5.8.8-r11/perl-5.8.8/ext/IPC/SysV'
> [...]
>
> This is an issue with the version linux-headers not including
> asm/page.h.
>
> Creating an empty asm/page.h (in /usr/include) would get past this,
> but could cause other issues.
>
> Does the latest version of linux-headers for gentoo put this back or
> is it gone for good? Checking the latest kernel here (not gentoo, I
> don't use that) and it seems be getting installed as part of make
> headers_install - so it looks like it's back. So you might want to
> try the latest gentoo version of linux-headers before doing anything
> else.
>
> If you update your host to the latest version and it still has
> problems then put a bug in the OE bug tracker and I can look at
> fixing this. Perl is only including it in order to get the definition
> of getpagesize which has been defined in unistd.h for a long time
> now, so just removing that include for perl should (in theory) work
> without any issues (unless you had a really old system?)
>
> --
> Jamie Lenehan <lenehan@twibble.org>
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

