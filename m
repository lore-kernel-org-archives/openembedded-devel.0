Received: from [195.234.128.72] (helo=scotty.chl-informatik.de)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <christopher.lang@plus.cablesurf.de>)
	id 1GNA7x-0007Mw-QL
	for openembedded-devel@openembedded.org; Tue, 12 Sep 2006 17:24:45 +0200
Received: from linux64.chl-informatik.de (linux64.chl-informatik.de
	[192.168.10.17])
	by scotty.chl-informatik.de (8.12.3/8.12.3/SuSE Linux 0.6) with ESMTP
	id k8CEVbVR015947; Tue, 12 Sep 2006 16:31:38 +0200
From: Christopher Lang <christopher.lang@plus.cablesurf.de>
To: openembedded-devel@openembedded.org
Date: Tue, 12 Sep 2006 17:26:12 +0200
User-Agent: KMail/1.9.1
References: <200609121630.39520.christopher.lang@chl-informatik.de>
	<055A7B53-12FA-4B78-88F9-9F65132BE966@inf.fu-berlin.de>
In-Reply-To: <055A7B53-12FA-4B78-88F9-9F65132BE966@inf.fu-berlin.de>
MIME-Version: 1.0
Message-Id: <200609121726.12582.christopher.lang@plus.cablesurf.de>
Subject: Re: relative paths in Openembedded/bitbake
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 12 Sep 2006 15:24:46 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


Hi Holger,

I looked up he bug (#1167). Too bad, relative paths would be nice to have. 
I'll try the symlink approach some time...

Chris



Am Dienstag, 12. September 2006 17:03 schrieb Holger Freyther:
> Am 12.09.2006 um 16:30 schrieb Christopher Lang:
> >> From what I can see all paths in OE/bitbake are absolute paths.
> >> This makes it
> >
> > difficult to move an OE build directory to another location.
> >
> > Questions:
> >
> > - which paths in which files do I need to change to move an entire
> > build
> > directory? (conf files of course, any other files?)
> >
> > - Is it possible to set up an OE build directory based on relative
> > paths?
> >
> > - If the 2nd question was answered with no, are there any plans to
> > enable
> > OE/bitbake to be able to handle an entire build directory with
> > relative
> > paths?
>
> Hi,
>
> take a look at bugs.openembedded.org as we have a bug for that
> already. Let us take a look at the first package we build:
> 	quilt-native
> 		Quilt runs autoconf and hardcodes absolute paths into its scripts.
>
> So after building the first package you may not move your tree
> anymore.  You could symlinks and see how far you get but I think I
> remember difficulties with that.
>
> I think we have three uses cases here:
> 	- Share one Build tree between multiple Operating Systems and Users
> 	- Move and avoid rebuilding
>
> Both have the same issues: One is the packages we have built require
> the absolute path e.g. hardcoded filenames (like quilt), hardcoded
> rpath to the native staging libdir. And one could be BitBake
> (unlikely though).
>
> h.
>
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


