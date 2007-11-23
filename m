Received: from [209.242.20.84] (helo=green.dls.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <mwester@dls.net>) id 1IvdFL-0003Le-RC
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Nov 2007 19:27:23 +0100
Received: from twilight (gw.mwester.net [209.242.5.110])
	by green.dls.net (Postfix) with ESMTP id 2A324412750
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Nov 2007 12:24:56 -0600 (CST)
Message-ID: <05db01c82dfe$1401e230$6e01a8c0@twilight>
From: "Mike \(mwester\)" <mwester@dls.net>
To: <openembedded-devel@lists.openembedded.org>
References: <E1Iv6U0-0003D9-3S@linuxtogo.org>
	<4746C4A5.6040501@student.utwente.nl>
Date: Fri, 23 Nov 2007 12:24:25 -0600
MIME-Version: 1.0
X-Priority: 3
X-MSMail-Priority: Normal
X-Mailer: Microsoft Outlook Express 6.00.2800.1914
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2800.1914
Subject: Re: [oe-commits] org.oe.dev SlugOS: ixp4xx-kernel - added 2.6.23.8 recipe and supporting files. (Note that
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
X-List-Received-Date: Fri, 23 Nov 2007 18:27:24 -0000
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

Koen Kooi writes:
> mwester commit schreef:
> > SlugOS: ixp4xx-kernel - added 2.6.23.8 recipe and supporting files.
(Note that
> > SlugOS still selects 2.6.21 as the preferred version for now.)
>
> Why am I forced to download a 40MB 2.6.23.8 tarball instead of the small
> 2.6.23.8 patch? I already have 2.6.23 in DL_DIR.

The set of developers that will actually be using that recipe is
extraordinarily small (two at present), so the relative benefit of such
significant modifications to a stable, working bb skeleton just don't seem
worth the risk of breaking things for every user of the ixp4xx-kernel*.bb
recipes at the moment.  Yes, I agree that in a perfect world, fixing this
would be the Right Thing To Do(tm).

> It's as easy as doing:
>
> VANILLA_VERSION = "2.6.23"
> KERNEL_VERSION = "2.6.23.8"
>
>
> SRC_URI = "
> ${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${VANILLA_VERSION}.tar.bz2
> \
>
${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/patch-${KERNEL_VERSION}.bz2;patch=
1
> \
> "

I don't think so, in this case.  There's a lot of other logic in the include
file that looks like it will get in the way of this simple change.  I'll
look at it and see how it might be altered to handle this use-case (I don't
see that it currently does, although it seems to handle other kernel
patchsets nicely).  Just don't expect it to be fixed right away; there are
bigger problems right now with 2.6.23 and ixp4xx than the bb recipe (which
is why that recipe is not selected by default).

> in the recipe. I would have fixed it myself, but the huge block of
> python magic in ixp4xx-kernel.inc scared me away.

Perhaps this will force me to learn python.  Yes, I know it's not difficult,
but my brain crawls into the back of my head and protests mightily when it
is forced to use a language that reminds it so much of Fortran and the
horrors of column-sensitivity.  :p

Mike (mwester)



