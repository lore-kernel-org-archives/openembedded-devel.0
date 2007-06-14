Received: from [209.85.132.245] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <lvcargnini@gmail.com>) id 1HyfJV-0007W0-F3
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Jun 2007 04:43:57 +0200
Received: by an-out-0708.google.com with SMTP id b33so81438ana
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jun 2007 19:40:51 -0700 (PDT)
Received: by 10.100.165.9 with SMTP id n9mr799857ane.1181788851792;
	Wed, 13 Jun 2007 19:40:51 -0700 (PDT)
Received: by 10.100.38.6 with HTTP; Wed, 13 Jun 2007 19:40:51 -0700 (PDT)
Message-ID: <ae36f8040706131940x128ce3b5ic2422b3fc5f6c99d@mail.gmail.com>
Date: Wed, 13 Jun 2007 23:40:51 -0300
From: "=?ISO-8859-1?Q?Lu=EDs_Cargnini?=" <lvcargnini@gmail.com>
To: "Jamie Lenehan" <lenehan@twibble.org>
In-Reply-To: <20070614013553.GA4558@twibble.org>
MIME-Version: 1.0
References: <4665CF19.2030501@dominion.kabel.utwente.nl>
	<4666520C.8060000@dominion.kabel.utwente.nl>
	<4666576A.9030608@dominion.kabel.utwente.nl>
	<ae36f8040706060937la8400adr2f98d7db547a2664@mail.gmail.com>
	<ae36f8040706061036i3662ee38x104bb1896550b64@mail.gmail.com>
	<ae36f8040706061143o47650436we993cf24bd807174@mail.gmail.com>
	<ae36f8040706071545i772205b2m85d251b45c7f26d7@mail.gmail.com>
	<20070613123908.GA19284@twibble.org>
	<ae36f8040706130931r4e81a08bi8ca10417336df3b5@mail.gmail.com>
	<20070614013553.GA4558@twibble.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.9
Cc: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Thu, 14 Jun 2007 02:43:58 -0000
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

thanks for your answers
So why OE perl-native isn't compiling for me ???
and perl-native use my host kernel ? probably not, because in this case we
won't have problem with page.h ? I'm right ?
And how to fix this ???

On 6/13/07, Jamie Lenehan <lenehan@twibble.org> wrote:
>
> On Thu, Jun 14, 2007 at 02:32:47AM +1000, "Lu=EDs Cargnini" wrote:
> > So what you are telling me is this perl is been compiled to run over my
> host
> > machine ?
>
> Yes.
>
> > So it is not been cross-compiled for my target ?
>
> THe perl build system uses itself during the build. Obviously it
> can't use itself when built for the target. So we have to build perl
> first and then trick the perl build into using parts of the native
> build while trying to cross-compile for the target (shared
> libraries).
>
> So anything perl related *always* (including any perl modules) always
> needs to compile the native version first before the verison for the
> target.
>
> [...]
> > just put it as a pre-requisite for OE installation !
> > my perl --version of gentoo installed version:
> > enterprise ~ # perl --version
>
> We can't use the host perl because we need both the native and target
> versions to match - this means not just version numbers but
> *everything*, every option and every installed module.
>
> Also while you have have the same verison of perl there's no
> guarantee that this would be the case.
>
> [...]
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

