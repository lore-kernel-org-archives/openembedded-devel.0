Received: from [202.173.155.195] (helo=birgitte.twibble.org)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <lenehan@twibble.org>) id 1GGY7W-00053U-GK
	for openembedded-devel@openembedded.org; Fri, 25 Aug 2006 11:36:59 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by birgitte.twibble.org (Postfix) with ESMTP id CB4D280DCB
	for <openembedded-devel@openembedded.org>;
	Fri, 25 Aug 2006 19:35:17 +1000 (EST)
Received: from birgitte.twibble.org ([127.0.0.1])
	by localhost (birgitte [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 09735-03 for <openembedded-devel@openembedded.org>;
	Fri, 25 Aug 2006 19:35:16 +1000 (EST)
Received: from nynaeve.twibble.org (nynaeve.twibble.org [202.173.155.194])
	by birgitte.twibble.org (Postfix) with ESMTP id 0052680DC7
	for <openembedded-devel@openembedded.org>;
	Fri, 25 Aug 2006 19:35:15 +1000 (EST)
Received: by nynaeve.twibble.org (Postfix, from userid 500)
	id EFF87F0B51D; Fri, 25 Aug 2006 19:35:15 +1000 (EST)
Date: Fri, 25 Aug 2006 19:34:44 +1000
From: Jamie Lenehan <lenehan@twibble.org>
To: Richard Purdie <rpurdie@rpsys.net>
Message-ID: <20060825093443.GA18720@twibble.org>
References: <20060817105325.GA2172@twibble.org>
	<20060817153312.GA23152@twibble.org>
	<20060825053341.GA29761@twibble.org>
	<1156493289.5554.2.camel@localhost.localdomain>
	<20060825082210.GA18599@twibble.org>
	<1156495256.5554.16.camel@localhost.localdomain>
Mime-Version: 1.0
In-Reply-To: <1156495256.5554.16.camel@localhost.localdomain>
User-Agent: Mutt/1.4.2.1i
Resent-From: lenehan@twibble.org
Resent-Date: Fri, 25 Aug 2006 19:35:15 +1000
Resent-To: openembedded-devel@openembedded.org
Resent-Message-Id: <20060825093515.EFF87F0B51D@nynaeve.twibble.org>
X-Virus-Scanned: by amavisd at twibble.org
Subject: Re: site/* - using common files for site information
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
X-List-Received-Date: Fri, 25 Aug 2006 09:36:59 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 25, 2006 at 09:40:56AM +0100, Richard Purdie wrote:
> On Fri, 2006-08-25 at 18:22 +1000, Jamie Lenehan wrote:
> > On Fri, Aug 25, 2006 at 09:08:09AM +0100, Richard Purdie wrote:
> > I changed my mind about a dozen times on this, so seeing what someone
> > else thinks would be good. 
> 
> I'll try and take a look at the patches this weekend. I can't promise
> but I will try :).

No hurry. I'd had enough of looking at them was all and so figure I
should either throw out or push it of no one else had any comments on
it ;)

[...]
> > The autotools.bbclass then makes use of this to decided which site
> > files to use.
> 
> You can argue that both ways. Ultimately, those files are generally used
> by configure which implies autotools but other packages also use them to
> provide supplementary info, just to confuse the issue :). I like the

Right. I focussed too much on the "call it autotools-info" rather
than the "don't call it info cause that's too generic" bit of your
email. I agree with you now that I think about it that way.

> idea of some functions like get_info_endianess_select (although your
> example doesn't quite match with get_info_choice_endianess) and it would
> be good to abstract direct access to the site files.

Duh. I've been unable to decide on what to call the damn thing and
the two diffs were taken a few minutes apart - and I'd renamed it
(again!) during those few minutes.

> I still feel info is too generic as we have 101 different forms of info
> around and we need to find a better more descriptive name.
> config-info.bclass? site-config.bbclass? Calling it autotools-info
> doesn't mean none autotooled packages can't use it btw!

Yep. Agreed. config-info or target-info or something would probably make
more sense.

> > I also made use of the info.bbclass to provide the endiness
> > information to recipes that were currently manaully looking in the
> > site file to determine this (since the way they currently work breaks
> > with the site file.)
> 
> Just throwing ideas around, rather than create a function for each
> option like endiness, why not have a variable which contains the
> endiness set by the class and use base_conditional to get the value you
> want? This might make things a little more flexiable?

I didn't know about base_conditional, but now that I look it - yeah
that looks like it's very close to what I was trying to do and it'll
work fine in this case. And pre-loading into variables is probably a
good idea as well.

Thanks.

-- 
 Jamie Lenehan <lenehan@twibble.org>


