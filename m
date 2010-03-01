Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1NmCfL-00072p-4p
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Mar 2010 21:56:35 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o21Krjn6013990
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 1 Mar 2010 20:53:45 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 13618-05 for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Mar 2010 20:53:34 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o21KrVVA013984
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 1 Mar 2010 20:53:32 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20100228033438.GE30145@xora-desktop.xora.org.uk>
References: <ac9c93b11002270725t46beb56dx5c4dc63c0f6485ca@mail.gmail.com>
	<20100227165600.GD30145@xora-desktop.xora.org.uk>
	<1267303607.5437.446.camel@lenovo.internal.reciva.com>
	<20100228033438.GE30145@xora-desktop.xora.org.uk>
Date: Mon, 01 Mar 2010 20:53:29 +0000
Message-ID: <1267476809.15923.31.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.2 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 93.97.173.237
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=5.0 tests=RDNS_DYNAMIC,TVD_RCVD_IP
	autolearn=no version=3.2.5
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
X-List-Received-Date: Mon, 01 Mar 2010 20:56:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2010-02-28 at 03:34 +0000, Graeme Gregory wrote:
> On Sat, Feb 27, 2010 at 08:46:47PM +0000, Phil Blundell wrote:
> > On Sat, 2010-02-27 at 16:56 +0000, Graeme Gregory wrote:
> > > NAK on creating extra levels.
> > > 
> > > Changing the level where recipes are held is not an option do to the way
> > > you tell bitbake how to find them.
> > > 
> > > BBFILES = "${OE}/org.openembedded.dev/recipes/*/*.bb"
> > 
> > Is that really such a big deal?  We seemed to manage to switch BBFILES
> > from /packages/ to /recipes/ without any major casualties, and I would
> > have thought that adding an extra level in there would be equally
> > straightforward.  Or of course, even better, the distro-specific recipes
> > could go in an overlay which the distro config would select.
> > 
> I have been talking about using overlays for distros at every OE meetup
> since kergoth made it easy to do. So I fully support that idea.

My layers suggestion for bitbake would make it much easier to enable
this kind of thing for end users too...

Perhaps this would get people testing bitbake master? :)

Cheers,

Richard



