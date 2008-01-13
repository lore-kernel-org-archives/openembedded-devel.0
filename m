Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.68)
	(envelope-from <thommycheck@gmx.de>) id 1JE2at-0006vf-KJ
	for openembedded-devel@lists.openembedded.org;
	Sun, 13 Jan 2008 14:09:43 +0100
Received: (qmail invoked by alias); 13 Jan 2008 13:09:17 -0000
Received: from BAEf986.bae.pppool.de (EHLO [192.168.178.21]) [77.132.249.134]
	by mail.gmx.net (mp040) with SMTP; 13 Jan 2008 14:09:17 +0100
X-Authenticated: #2218979
X-Provags-ID: V01U2FsdGVkX1+QyyoZQH2Qs3FbpvX5NSy0xVuF5ioLDROEO3DmN1
	dk2B+JLXMdu8lH
From: Thomas Kunze <thommycheck@gmx.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <fma5d5$5k5$1@ger.gmane.org>
References: <47871C71.5020800@student.utwente.nl>
	<fm79ef$hak$1@ger.gmane.org>	<47872B1A.9010400@student.utwente.nl>
	<fm86uh$qa8$1@ger.gmane.org>	<fm8dm0$ikl$1@ger.gmane.org>
	<4787C194.4060907@student.utwente.nl> <fm8g7r$r27$1@ger.gmane.org>
	<1200093760.6074.2.camel@HD>  <fma5d5$5k5$1@ger.gmane.org>
Date: Sun, 13 Jan 2008 14:09:16 +0100
Message-Id: <1200229756.6056.4.camel@HD>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Y-GMX-Trusted: 0
Subject: Re: mtn disapprove
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
X-List-Received-Date: Sun, 13 Jan 2008 13:09:44 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit


On Sat, 2008-01-12 at 11:39 +0100, Rolf Leggewie wrote:
> Thomas,
> 
> thank you for your suggestion.  Please correct me if I misunderstand you.
> 
> Thomas Kunze schrieb:
> > I would also move the PACKAGE_ARCH stuff.
> 
> You suggest to move the PACKAGE_ARCH stuff out of the inc file and into
> the individual config files?  For what benefit?  They are common for all
> machines except for the collie, so I believe .inc is the best place for
> that.
The same is true for "include tune-xscale.inc". So one could use
include_collie (if this is possible). But the other way is IMO cleaner.
Have only things in zaurus-2.6.inc that are common to all zaurus. OTOH
it may make sense to separate collie from the other zaurus because
collie doesn't have much in common with them.

> 
> Regards
> 
> Rolf
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



