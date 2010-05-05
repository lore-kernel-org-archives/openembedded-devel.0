Received: from www.xora.org.uk ([80.68.91.202] helo=xora.vm.bytemark.co.uk)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1O9ZVR-0004p0-4S
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 May 2010 09:58:58 +0200
Received: from localhost (localhost [127.0.0.1])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTP id C1E21A43E4
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 May 2010 08:55:10 +0100 (BST)
X-Virus-Scanned: Debian amavisd-new at xora.vm.bytemark.co.uk
Received: from xora.vm.bytemark.co.uk ([127.0.0.1])
	by localhost (xora.vm.bytemark.co.uk [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id VjPk-flhB+XW
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 May 2010 08:55:10 +0100 (BST)
Received: from xora-desktop.xora.org.uk (188-220-34-37.zone11.bethere.co.uk
	[188.220.34.37])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTPSA id 1997EA43E3
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 May 2010 08:55:10 +0100 (BST)
Received: by xora-desktop.xora.org.uk (Postfix, from userid 500)
	id D6D2A20DB9; Wed,  5 May 2010 08:54:58 +0100 (BST)
Date: Wed, 5 May 2010 08:54:58 +0100
From: Graeme Gregory <dp@xora.org.uk>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100505075458.GB2444@xora-desktop.xora.org.uk>
References: <1273041286-632-1-git-send-email-hvontres@gmail.com>
	<20100505064527.GA2444@xora-desktop.xora.org.uk>
	<l2ka7f8874a1005050043i52ed483fl629d6eb71326ba@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <l2ka7f8874a1005050043i52ed483fl629d6eb71326ba@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-08-17)
X-SA-Exim-Connect-IP: 80.68.91.202
X-SA-Exim-Mail-From: dp@xora.org.uk
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] libtorrent / rtorrent: add latest upstream versions and fix crash on nslu2
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
X-List-Received-Date: Wed, 05 May 2010 07:58:58 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 05, 2010 at 12:43:46AM -0700, Hans Henry von Tresckow wrote:
> On Tue, May 4, 2010 at 11:45 PM, Graeme Gregory <dp@xora.org.uk> wrote:
> 
> > You need to add a PACKAGE_ARCH_nlus2 = "${MACHINE_ARCH}" to this as its
> > now nslu2 specific.
> >
> > Graeme
> >
> >
> How should I apply the optimization only for nslu2 and other xscale
> machines? To make matters even more complicated, it seems that gcc > 4.3.0
> doesn't need this workaround.
> 
> Any pointers would be appreciated. Also, should I fix up the older revisions
> as well or just the newest version?

Is this some recent bug, back in my zaurus days I never had a problem
running rtorrent without special flags?

In the Angstrom distribution we had to add CPU class support for some things
so we can for example add the same optimisations to all omap3 without
naming each machine individually. I also added this years ago to openmoko
distribution. Its something someone needs to get right for inclusion into
OE wholescale!

Graeme



