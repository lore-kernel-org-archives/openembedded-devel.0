Received: from www.xora.org.uk ([80.68.91.202] helo=xora.vm.bytemark.co.uk)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1NlZyL-00084E-HF
	for openembedded-devel@lists.openembedded.org;
	Sun, 28 Feb 2010 04:37:37 +0100
Received: from localhost (localhost [127.0.0.1])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTP id 7EAA9A5011
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Feb 2010 03:34:50 +0000 (GMT)
X-Virus-Scanned: Debian amavisd-new at xora.vm.bytemark.co.uk
Received: from xora.vm.bytemark.co.uk ([127.0.0.1])
	by localhost (xora.vm.bytemark.co.uk [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id lp8atqvi9mLp
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Feb 2010 03:34:47 +0000 (GMT)
Received: from xora-desktop.xora.org.uk (188-220-34-37.zone11.bethere.co.uk
	[188.220.34.37])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTPSA id 75B3AA5005
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Feb 2010 03:34:47 +0000 (GMT)
Received: by xora-desktop.xora.org.uk (Postfix, from userid 500)
	id 198EF24548; Sun, 28 Feb 2010 03:34:39 +0000 (GMT)
Date: Sun, 28 Feb 2010 03:34:39 +0000
From: Graeme Gregory <dp@xora.org.uk>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100228033438.GE30145@xora-desktop.xora.org.uk>
References: <ac9c93b11002270725t46beb56dx5c4dc63c0f6485ca@mail.gmail.com>
	<20100227165600.GD30145@xora-desktop.xora.org.uk>
	<1267303607.5437.446.camel@lenovo.internal.reciva.com>
MIME-Version: 1.0
In-Reply-To: <1267303607.5437.446.camel@lenovo.internal.reciva.com>
User-Agent: Mutt/1.5.20 (2009-08-17)
X-SA-Exim-Connect-IP: 80.68.91.202
X-SA-Exim-Mail-From: dp@xora.org.uk
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=none autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] recipes/images/${distro}
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
X-List-Received-Date: Sun, 28 Feb 2010 03:37:38 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Feb 27, 2010 at 08:46:47PM +0000, Phil Blundell wrote:
> On Sat, 2010-02-27 at 16:56 +0000, Graeme Gregory wrote:
> > NAK on creating extra levels.
> > 
> > Changing the level where recipes are held is not an option do to the way
> > you tell bitbake how to find them.
> > 
> > BBFILES = "${OE}/org.openembedded.dev/recipes/*/*.bb"
> 
> Is that really such a big deal?  We seemed to manage to switch BBFILES
> from /packages/ to /recipes/ without any major casualties, and I would
> have thought that adding an extra level in there would be equally
> straightforward.  Or of course, even better, the distro-specific recipes
> could go in an overlay which the distro config would select.
> 
I have been talking about using overlays for distros at every OE meetup
since kergoth made it easy to do. So I fully support that idea.

Graeme



