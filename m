Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1K9eDF-0004EE-7i
	for openembedded-devel@openembedded.org; Fri, 20 Jun 2008 12:51:25 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m5KAo6DE025355
	for <openembedded-devel@openembedded.org>;
	Fri, 20 Jun 2008 11:50:06 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 25272-01-4 for <openembedded-devel@openembedded.org>;
	Fri, 20 Jun 2008 11:49:58 +0100 (BST)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m5K9ikO5017906
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Fri, 20 Jun 2008 10:44:46 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <485B01CC.3000701@palm.com>
References: <48598ECE.9030604@palm.com>
	<1213862302.5018.2.camel@dax.rpnet.com>  <485B01CC.3000701@palm.com>
Date: Fri, 20 Jun 2008 10:44:46 +0100
Message-Id: <1213955086.5049.7.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: bitbake vs incremental builds
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Fri, 20 Jun 2008 10:51:25 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2008-06-19 at 18:03 -0700, Rich Pixley wrote:
> Richard Purdie wrote:
> > It wasn't done for a long time simply because nobody had taken the time
> > to implement it. It has however recently been implemented, simply set:
> >
> > BB_STAMP_POLICY = "full"
> > or
> > BB_STAMP_POLICY = "whitelist"
> >
> > Whitelist allows you to exempt certain packages from stamp checking, see
> > packaged-staging.bbclass for an example.
> This isn't working for me simply by taking a top of tree bitbake and 
> shoving it into my environment.  However, my OE environment is over a 
> year old and is moderately hacked locally.

You used bitbake 1.8 svn, not bitbake trunk? It should be near enough a
drop in replacement although there are possibly some tweaks needed, I
can't remember offhand whats changed in the past year.

> I tried to write a trivial test case, but I got bogged down.  It's not 
> at all clear to me what one would need to do to use bitbake in some 
> environment other than OE.  I was hoping it would be simple to just 
> write an empty conf/bitbake.conf and a couple of a.bb and b.bb files 
> with a depending on b, but 2hrs later I'm still confused.
> 
> So this isn't working for me and I don't see an easy way to debug it.  
> Any suggestions?

This is pretty much impossible to help with unless you can share more
information. Using bitbake outside of OE is perfectly possible, you do
just need a bitbake.conf and a base.bbclass. When we're making changes
to bitbake we do mainly care about OE since OE is the major public user.
If there were others we'd take them into consideration too. OE.dev does
work with bitbake 1.8 svn and many people are using that.

If you can show a more specific problem perhaps we can help but at the
moment you're tying our hands :(.

Cheers,

Richard




