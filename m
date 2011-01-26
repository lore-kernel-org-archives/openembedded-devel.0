Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stefan@datenfreihafen.org>) id 1Pi3Jo-0004MV-9Y
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 Jan 2011 12:13:44 +0100
Received: from [2001:638:602:1183:21f:16ff:fe0d:7d41] (helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.69 #1)
	id 1Pi3J3-0001BI-0m by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Jan 2011 12:12:59 +0100
Received: from stefan by excalibur.local with local (Exim 4.72)
	(envelope-from <stefan@excalibur.local>) id 1Pi3J0-0002i2-IR
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 Jan 2011 12:12:54 +0100
Date: Wed, 26 Jan 2011 12:12:52 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110126111251.GB29416@excalibur.local>
References: <20110126102308.GA29416@excalibur.local>
	<4D3FFB03.9010206@xora.org.uk>
MIME-Version: 1.0
In-Reply-To: <4D3FFB03.9010206@xora.org.uk>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,NO_RELAYS
	autolearn=ham version=3.2.5
Subject: Re: OE 2011.03 release vs. oe-core migration
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
X-List-Received-Date: Wed, 26 Jan 2011 11:13:44 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Wed, 2011-01-26 at 10:44, Graeme Gregory wrote:
> On 26/01/2011 10:23, Stefan Schmidt wrote:
> >
> > During last OEDEM we set out a timeline for quarterly releases. The first one
> > hit on time in december 2010 (Thanks Khem).
> >
> > The next one would be scheduled for 2011-03. As our plans towards oe-core are
> > getting into shape I wonder if and how these both are going to conflict.
> >
> > Will we go ahead and make the 2011-03 release, maybe the last one before moving
> > over to oe-core? Personally I don't think these two block each other. Syncing
> > would be needed, but people will keep working on the OE repo for a bit longer
> > anyway I would think.
> >
> > If we are going to scratch the release what would be the next target for it?
> > Yocto 1.0 is planned for April 2011. Somehow I doubt we will have oe-core ready
> > for this in time, including yocto movs to it and we base the rest of OE on top
> > of it. Am I wrong here and that is the actual plan?
> >
> >
> My opinion is 2010-03 should be the last release on the old source tree.

Great

> Releases after this should be on the new oe-core layer system. I don't
> think we should scrap the release as its going to take some time to kick
> oe-core into shape and finish the poky merge. Then there is work on
> meta-openembedded and meta-distro to do on top of that.

Frans was saying something along these lines as well and personally I would be
happy with one last release with the current metadata layout. This would allow
current OE users to have a release with the latest changes as a base until we
found our way through the oe-core changes moving forward.

Should we try a freeze for the repo this time or go ahead with the model from
last time. Having a branch with fixes which gets deleted once the release taggin
is done?

Depending on some other factors I might also be interested in using this release
for a product and I'm thinking about having a branch for it with fixes and
pooling resources on it. Not much thinking about this yet though.

regards
Stefan Schmidt


