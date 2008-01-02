Received: from [216.145.245.199] (helo=mx03.dls.net)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <mwester@dls.net>) id 1JA6JK-0005yg-3U
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Jan 2008 17:19:18 +0100
Received: from gw.mwester.net ([209.242.5.110] helo=twilight)
	by mx03.dls.net with esmtpa (Exim 4.63)
	(envelope-from <mwester@dls.net>) id 1JA6D6-0003uC-DK
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Jan 2008 10:12:53 -0600
Message-ID: <0ced01c84d5a$37ce9520$6e01a8c0@twilight>
From: "Mike \(mwester\)" <mwester@dls.net>
To: <openembedded-devel@lists.openembedded.org>
References: <0cdd01c84d52$b60de4c0$6e01a8c0@twilight>
	<74d0deb30801020752p51c90f7fuff6d080fcf397e2f@mail.gmail.com>
Date: Wed, 2 Jan 2008 10:12:05 -0600
MIME-Version: 1.0
X-Priority: 3
X-MSMail-Priority: Normal
X-Mailer: Microsoft Outlook Express 6.00.2800.1914
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2800.1914
Subject: Re: "as" has gone missing.
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
X-List-Received-Date: Wed, 02 Jan 2008 16:19:18 -0000
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

"pHilipp Zabel" <philipp.zabel@gmail.com> writes:
...
> > I am need of a clue, if anyone can offer some direction.  Might this be
as
> > simple as a configuration option missing when gcc is built (and "as"
should
> > be part of the "gcc" package), or is this a case where I'll have to add
> > support for a separate "as" package to the recipe?
> >
> > Thanks,
> > Mike (~mwester)
>
> binutils, binutils-symlinks

Excellent, that (mostly) works.  So what's missing is the dependency in the
gcc package.  Does anyone have any particular heartburn if I add a RDEPENDS
= binutils to the gcc recipe?

(As for "mostly", it works, but there's a mismatch that might be important:
    $ gcc hello.c
    /usr/lib/gcc/armeb-linux/4.1.2/../../../../armeb-linux/bin/ld: Warning:
/tmp/cceIGUyh.o does not support interworking,
    whereas a.out does
    $
)

Mike (~mwester)




