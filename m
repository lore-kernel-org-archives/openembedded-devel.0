Received: from www.xora.org.uk ([80.68.91.202] helo=xora.vm.bytemark.co.uk)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1NlrOa-0008V2-W5
	for openembedded-devel@lists.openembedded.org;
	Sun, 28 Feb 2010 23:13:54 +0100
Received: from localhost (localhost [127.0.0.1])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTP id D9B63A5014
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Feb 2010 22:11:04 +0000 (GMT)
X-Virus-Scanned: Debian amavisd-new at xora.vm.bytemark.co.uk
Received: from xora.vm.bytemark.co.uk ([127.0.0.1])
	by localhost (xora.vm.bytemark.co.uk [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id kTMz5r9ObPvb
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Feb 2010 22:11:03 +0000 (GMT)
Received: from xora-desktop.xora.org.uk (188-220-34-37.zone11.bethere.co.uk
	[188.220.34.37])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTPSA id B50ABA5010
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Feb 2010 22:11:03 +0000 (GMT)
Received: by xora-desktop.xora.org.uk (Postfix, from userid 500)
	id 7859724538; Sun, 28 Feb 2010 22:10:56 +0000 (GMT)
Date: Sun, 28 Feb 2010 22:10:56 +0000
From: Graeme Gregory <dp@xora.org.uk>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100228221056.GG30145@xora-desktop.xora.org.uk>
References: <ac9c93b11002281201j44a861e1saa803be9f338ee10@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <ac9c93b11002281201j44a861e1saa803be9f338ee10@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-08-17)
X-SA-Exim-Connect-IP: 80.68.91.202
X-SA-Exim-Mail-From: dp@xora.org.uk
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=none autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] duplicate recipes
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
X-List-Received-Date: Sun, 28 Feb 2010 22:13:54 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Feb 28, 2010 at 09:01:45PM +0100, Frans Meulenbroeks wrote:
> Below is a list of all recipes that have 5 or more versions.
> Guess a lot of these are deadwood.
> Proposal is to do some cleaning for these.
> 
> Probably the best scenario is to remove all versions which
> - are not the latest version
> - are not  pinned with  PREFERRED_VERSION  in conf/distro/*
> - do not have the largest DEFAULT_PREFERENCE
> 
> What do people feel about this?
> 
If you search back in the list this question is asked once every 6 months
ago and the discussion always ends the same. We dont need to blindly delete
old recipes.

Now on to important issues.

If people are looking for something to keep them busy then there are two
important tasks that need to be completed in OE one of them saves hours
on build times, the other makes parsing quicker.

Convert as many -native recipes to BBCLASSEXTEND as possible. Poky has lots
of them done already so this is as simple as copy and test.

Convert recipes to new staging. There have been numerous posts on the list
lately detailing how to do this. This one saves hours in build time.

Graeme



