Received: from [202.173.155.195] (helo=birgitte.twibble.org)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <lenehan@twibble.org>) id 1HyfWB-0007ej-H1
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Jun 2007 04:57:04 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by birgitte.twibble.org (Postfix) with ESMTP id 7A27310D709;
	Thu, 14 Jun 2007 12:53:57 +1000 (EST)
Received: from birgitte.twibble.org ([127.0.0.1])
	by localhost (birgitte [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 29702-06; Thu, 14 Jun 2007 12:53:57 +1000 (EST)
Received: from nynaeve.twibble.org (nynaeve.twibble.org [202.173.155.194])
	by birgitte.twibble.org (Postfix) with ESMTP id 0799D10D681;
	Thu, 14 Jun 2007 12:53:57 +1000 (EST)
Received: by nynaeve.twibble.org (Postfix, from userid 500)
	id E649EB70149; Thu, 14 Jun 2007 12:53:56 +1000 (EST)
Date: Thu, 14 Jun 2007 12:53:56 +1000
From: Jamie Lenehan <lenehan@twibble.org>
To: =?iso-8859-1?Q?Lu=EDs?= Cargnini <lvcargnini@gmail.com>
Message-ID: <20070614025356.GA6177@twibble.org>
References: <4666520C.8060000@dominion.kabel.utwente.nl>
	<4666576A.9030608@dominion.kabel.utwente.nl>
	<ae36f8040706060937la8400adr2f98d7db547a2664@mail.gmail.com>
	<ae36f8040706061036i3662ee38x104bb1896550b64@mail.gmail.com>
	<ae36f8040706061143o47650436we993cf24bd807174@mail.gmail.com>
	<ae36f8040706071545i772205b2m85d251b45c7f26d7@mail.gmail.com>
	<20070613123908.GA19284@twibble.org>
	<ae36f8040706130931r4e81a08bi8ca10417336df3b5@mail.gmail.com>
	<20070614013553.GA4558@twibble.org>
	<ae36f8040706131940x128ce3b5ic2422b3fc5f6c99d@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <ae36f8040706131940x128ce3b5ic2422b3fc5f6c99d@mail.gmail.com>
User-Agent: Mutt/1.5.12-2006-07-14
X-Virus-Scanned: by amavisd at twibble.org
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
X-List-Received-Date: Thu, 14 Jun 2007 02:57:05 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 13, 2007 at 11:40:51PM -0300, Lu=EDs Cargnini wrote:
> thanks for your answers
> So why OE perl-native isn't compiling for me ???

Because perl-native is compiled with your hosts's compiler, and you have =
a
version of linux-headers (I think that's what gentoo calls them) that has
removed /usr/include/asm/page.h

I *think* this was removed and then re-added back later on (since so much
stuff includes this header). In which case updating linux-headers on your
system to a later version should fix it.

If I'm wrong on this I can remove the need for it from perl, but I need t=
o
make sure I don't break perl-native on other systems if I do that.

> and perl-native use my host kernel ? probably not, because in this case=
 we
> won't have problem with page.h ? I'm right ?

It doesn't use your kernel headers, but the linux-headers, which are
generated from the kernel headers. So the version of linux-headers is not
usually related to the version of the kernel that you are using.

> And how to fix this ???

Try the latest gentoo linux-headers package (or an older version). If tha=
t
doesn't work then wait for me to test and remove it from the perl-native =
in
OE.

--=20
 Jamie Lenehan <lenehan@twibble.org>


