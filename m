Received: from [209.85.132.250] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <lvcargnini@gmail.com>) id 1I13PF-0006Mq-87
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Jun 2007 18:51:47 +0200
Received: by an-out-0708.google.com with SMTP id b33so43158ana
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jun 2007 09:48:01 -0700 (PDT)
Received: by 10.100.41.8 with SMTP id o8mr559505ano.1182358080805;
	Wed, 20 Jun 2007 09:48:00 -0700 (PDT)
Received: by 10.100.38.3 with HTTP; Wed, 20 Jun 2007 09:48:00 -0700 (PDT)
Message-ID: <ae36f8040706200948o54d0ec92qb94eb5c379bad1fd@mail.gmail.com>
Date: Wed, 20 Jun 2007 13:48:00 -0300
From: "=?ISO-8859-1?Q?Lu=EDs_Cargnini?=" <lvcargnini@gmail.com>
To: "Jamie Lenehan" <lenehan@twibble.org>
In-Reply-To: <20070614025356.GA6177@twibble.org>
MIME-Version: 1.0
References: <4666520C.8060000@dominion.kabel.utwente.nl>
	<ae36f8040706060937la8400adr2f98d7db547a2664@mail.gmail.com>
	<ae36f8040706061036i3662ee38x104bb1896550b64@mail.gmail.com>
	<ae36f8040706061143o47650436we993cf24bd807174@mail.gmail.com>
	<ae36f8040706071545i772205b2m85d251b45c7f26d7@mail.gmail.com>
	<20070613123908.GA19284@twibble.org>
	<ae36f8040706130931r4e81a08bi8ca10417336df3b5@mail.gmail.com>
	<20070614013553.GA4558@twibble.org>
	<ae36f8040706131940x128ce3b5ic2422b3fc5f6c99d@mail.gmail.com>
	<20070614025356.GA6177@twibble.org>
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
X-List-Received-Date: Wed, 20 Jun 2007 16:51:48 -0000
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Please can add the Gentoo patch as suggested ?
I emailed the list some days ago, this will make perl compile in any system
without errors I suppose

On 6/13/07, Jamie Lenehan <lenehan@twibble.org> wrote:
>
> On Wed, Jun 13, 2007 at 11:40:51PM -0300, Lu=EDs Cargnini wrote:
> > thanks for your answers
> > So why OE perl-native isn't compiling for me ???
>
> Because perl-native is compiled with your hosts's compiler, and you have =
a
> version of linux-headers (I think that's what gentoo calls them) that has
> removed /usr/include/asm/page.h
>
> I *think* this was removed and then re-added back later on (since so much
> stuff includes this header). In which case updating linux-headers on your
> system to a later version should fix it.
>
> If I'm wrong on this I can remove the need for it from perl, but I need t=
o
> make sure I don't break perl-native on other systems if I do that.
>
> > and perl-native use my host kernel ? probably not, because in this case
> we
> > won't have problem with page.h ? I'm right ?
>
> It doesn't use your kernel headers, but the linux-headers, which are
> generated from the kernel headers. So the version of linux-headers is not
> usually related to the version of the kernel that you are using.
>
> > And how to fix this ???
>
> Try the latest gentoo linux-headers package (or an older version). If tha=
t
> doesn't work then wait for me to test and remove it from the perl-native
> in
> OE.
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

