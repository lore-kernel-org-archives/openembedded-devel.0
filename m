Received: from [202.4.237.240] (helo=kirsty.vergenet.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raster@vergenet.net>) id 1L1jLV-0001aD-NI
	for openembedded-devel@lists.openembedded.org;
	Sun, 16 Nov 2008 16:15:31 +0100
Received: by kirsty.vergenet.net (Postfix, from userid 1001)
	id 15B0324097; Mon, 17 Nov 2008 02:13:12 +1100 (EST)
Date: Mon, 17 Nov 2008 02:13:09 +1100
From: Carsten Haitzler (The Rasterman) <raster@rasterman.com>
To: openembedded-devel@lists.openembedded.org
Message-Id: <20081117021309.1e431de0.raster@rasterman.com>
In-Reply-To: <20081116145911.GB14299@dodger.lab.datenfreihafen.org>
References: <gfnf5u$r3j$1@ger.gmane.org>
	<20081116145911.GB14299@dodger.lab.datenfreihafen.org>
Organization: You expect me to be organized?
X-Mailer: Sylpheed 2.4.8 (GTK+ 2.12.9; i486-pc-linux-gnu)
X-Pants: on
X-Cluestick: Get jiggy with it!
Mime-Version: 1.0
Subject: Re: e-wm broken after yesterdays upgrade
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 16 Nov 2008 15:15:47 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 16 Nov 2008 15:59:11 +0100 Stefan Schmidt <stefan@datenfreihafen.org>
babbled:

same. i have done a lot of changes to e packaging to keep up with upstream
changes - and i tested newly build and flashed images (thats how i always do
it) and of course it all works. i find it hard to think eina would have been
dropped somewhere there as u'd get much bigger problems (you wouldn't even get e
to start and get that far). are there loaders in the loaders dir (dirs with
arch dirs and module.so's in them?). something smells broken to me :) (but be
assured that it does work upstream from source, on destkop and in newly build
and flashed images).

> Hello.
> 
> Sorry for the delay. Having a cold I decided to have a releaxed weekend. Will
> take a deeper look next days if the stuff below does not help.
> 
> On Sat, 2008-11-15 at 22:32, Koen Kooi wrote:
> >
> > I just built and installed the updated e-wm and it refuses to start:
> 
> Installed means from the updated angstrom feed I guess?
> 
> > [..]
> > ESTART: 0.20785 [0.00140] - ipc
> > INFO: E_IPC_SOCKET=/tmp/enlightenment-root/disp-:0.0-4494
> > ESTART: 0.21292 [0.00507] - font
> > ESTART: 0.21494 [0.00202] - theme
> > ESTART: 0.25406 [0.03912] - splash
> > ESTART: 0.25430 [0.00024] - test file format support
> > <<<< Enlightenment Error >>>>
> > Enlightenment found Evas can't load PNG files. Check Evas has PNG
> > loader support.
> >
> > E17: Begin shutdown procedure!
> >
> > But I have:
> 
> The only thing I could think about bringing such serious breakage could be the
> new dependency of all kind of e libs on eina. Can you please check if the lib
> is installed?
> 
> > Could the people that touched e-wm please make it work again?
> 
> Sure.
> 
> As a sidenote. This was not rushed in without testing or review. I spent some
> good hours on reviewing it together with mickey, in his role as E maintainer
> in OE. We also decided to keep some more patches out until there is more time
> for review.
> 
> And I of course tested it before pushing. Building and actually using it. No
> breakage here. But as I only tested with a complete new image and not with
> updating from a feed I may have messed up here. Should not happen though :(
> 
> If eina is installed in a matching version I would need the foolowing to track
> this down as I don't have the problem here:
> 
> - Full x.log
> - Full strace
> - Full list of installed packages
> 
> Thanks forthe time to look into this problem and let me know.
> 
> regards
> Stefan Schmidt
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 


-- 
------------- Codito, ergo sum - "I code, therefore I am" --------------
The Rasterman (Carsten Haitzler)    raster@rasterman.com



