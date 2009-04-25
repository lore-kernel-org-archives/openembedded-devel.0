Received: from [78.47.116.26] (helo=drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1LxnsX-0003JE-Le
	for openembedded-devel@lists.openembedded.org;
	Sat, 25 Apr 2009 21:49:39 +0200
Received: from andromeda.vanille.de (e180133179.adsl.alicedsl.de
	[85.180.133.179])
	by drlauer-research.com (Postfix) with ESMTP id A350E584A0F
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 Apr 2009 22:13:51 +0200 (CEST)
From: "Michael 'Mickey' Lauer" <mickey@vanille-media.de>
Organization: Vanille-Media
To: openembedded-devel@lists.openembedded.org
Date: Sat, 25 Apr 2009 21:44:45 +0200
User-Agent: KMail/1.11.2 (Linux/2.6.28-11-generic; KDE/4.2.2; x86_64; ; )
References: <20090425075933.E6E18188456@amethyst.openembedded.net>
	<200904252034.35801.mickey@vanille-media.de>
	<49F35A2B.7070907@xora.org.uk>
In-Reply-To: <49F35A2B.7070907@xora.org.uk>
MIME-Version: 1.0
Message-Id: <200904252144.45513.mickey@vanille-media.de>
Subject: Re: [oe-commits] Koen Kooi : Revert "ecore: catch up with the new SONAMEs; move to autosplitting"
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
X-List-Received-Date: Sat, 25 Apr 2009 19:49:46 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Saturday 25 April 2009 20:44:59 Graeme Gregory wrote:
> Michael 'Mickey' Lauer wrote:
> > On Saturday 25 April 2009 20:17:22 Otavio Salvador wrote:
> >> This all is not a justification to break the whole World at dev. dev
> >> will be the basis of next stable, and even more, it is the source of
> >> changes for stable. So if we mess it up we'll end up with an very
> >> difficult to maintain stable branch and an unusable dev.
> >
> > Yes, and I agree with all that, however there is the need to balance
> > between breaking everything and letting everything through. If -- like it
> > is happening right now -- people are paranoid about upgrade paths, then
> > .dev moves to something where no actual development happens.
> >
> > If you want to move forward, you will have to allow breakage now and
> > then. This is the way with all projects. If you don't allow that, people
> > will move elsewhere with their contributions and .dev will get stale
> > rather than stable.
>
> In this case was it actually necessary to change the names?

Yes. Upstream changed their SONAME in a freaky way, hence we needed to catch 
up.

> I'm afraid I try and ignore E stuff as much as possible so I am totally
> unclear about its state of development.

All was clear and calm until last week. It took Angus two days to come up with 
a solution in MS5.5 were E-Wm was starting again and everything necessary was 
installed in the image (RRECOMMENDS and friends...). His solution involved 
turning off the debian renaming for each and every package -- a solution that 
works fine but that was unacceptable for me in .dev -- hence I went forward and 
worked on a better solution that involved keeping debian naming and even 
removed the verbosity in ecore.inc.

This solution has now been reverted for the sake of the upgrade path. And just 
for the records, the technical issue wasn't the reason for me leaving the OE 
core team and resigning from all duties -- it was the way how this situation 
was handled. Again the core team pretty much stood watching in apathy and let 
the most vocal decide on his own, letting him carry his own way again.

:M:



