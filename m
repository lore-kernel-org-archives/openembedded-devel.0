Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <rpurdie@rpsys.net>) id 1GGXH0-0008Pq-4U
	for openembedded-devel@openembedded.org; Fri, 25 Aug 2006 10:42:42 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.6) with ESMTP id k7P8f3Rr025608;
	Fri, 25 Aug 2006 09:41:03 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 25515-03; Fri, 25 Aug 2006 09:41:01 +0100 (BST)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.6) with ESMTP id k7P8evI3025600
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO);
	Fri, 25 Aug 2006 09:40:57 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: Jamie Lenehan <lenehan@twibble.org>
In-Reply-To: <20060825082210.GA18599@twibble.org>
References: <20060817105325.GA2172@twibble.org>
	<20060817153312.GA23152@twibble.org>
	<20060825053341.GA29761@twibble.org>
	<1156493289.5554.2.camel@localhost.localdomain>
	<20060825082210.GA18599@twibble.org>
Date: Fri, 25 Aug 2006 09:40:56 +0100
Message-Id: <1156495256.5554.16.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-devel@openembedded.org
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
X-List-Received-Date: Fri, 25 Aug 2006 08:42:43 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2006-08-25 at 18:22 +1000, Jamie Lenehan wrote:
> On Fri, Aug 25, 2006 at 09:08:09AM +0100, Richard Purdie wrote:
> I changed my mind about a dozen times on this, so seeing what someone
> else thinks would be good. 

I'll try and take a look at the patches this weekend. I can't promise
but I will try :).

> > review the patches. The name info.bbclass is perhaps too generic though
> > - could you call it something like autotools-info.bbclass?
> 
> The reason I called it info.bbclass is because it's not actually
> related to autotools. What it does is provide information about a
> target - endianess, 32/64 bit, which libc it's using, what alias
> exists for it in a general sort of way.
> 
> The autotools.bbclass then makes use of this to decided which site
> files to use.

You can argue that both ways. Ultimately, those files are generally used
by configure which implies autotools but other packages also use them to
provide supplementary info, just to confuse the issue :). I like the
idea of some functions like get_info_endianess_select (although your
example doesn't quite match with get_info_choice_endianess) and it would
be good to abstract direct access to the site files.

I still feel info is too generic as we have 101 different forms of info
around and we need to find a better more descriptive name.
config-info.bclass? site-config.bbclass? Calling it autotools-info
doesn't mean none autotooled packages can't use it btw!

> I also made use of the info.bbclass to provide the endiness
> information to recipes that were currently manaully looking in the
> site file to determine this (since the way they currently work breaks
> with the site file.)

Just throwing ideas around, rather than create a function for each
option like endiness, why not have a variable which contains the
endiness set by the class and use base_conditional to get the value you
want? This might make things a little more flexiable?

Cheers,

Richard





