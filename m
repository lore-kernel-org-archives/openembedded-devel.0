Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rpurdie@rpsys.net>) id 1IuPWF-0004At-W9
	for openembedded-devel@openembedded.org; Tue, 20 Nov 2007 10:35:48 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id lAK9XemI008549
	for <openembedded-devel@openembedded.org>; Tue, 20 Nov 2007 09:33:40 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 08524-01 for <openembedded-devel@openembedded.org>;
	Tue, 20 Nov 2007 09:33:37 +0000 (GMT)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id lAK9XZ9q008541
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>; Tue, 20 Nov 2007 09:33:35 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <4741FB41.7080602@trolltech.com>
References: <20071119120819.GA17788@lenovo>
	<C7148B94-6A92-42DE-BF35-75B409DAA8E7@selfish.org>
	<4741FB41.7080602@trolltech.com>
Date: Tue, 20 Nov 2007 09:33:33 +0000
Message-Id: <1195551213.6337.9.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Getting Started -Makefile
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
X-List-Received-Date: Tue, 20 Nov 2007 09:35:48 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2007-11-20 at 07:08 +1000, Lorn Potter wrote:
> Holger Freyther wrote:
> > Am 19.11.2007 um 13:08 schrieb David Farning:
> > 
> >> This eliminates many of problems the new users have setting up bb
> >> and oe.  There is no need to know any thing about svn of monotone.
> > 
> > Hey,
> > 
> > this is the issue you want to solve? IMO developers should know about  
> > how to build software and this includes getting the source. I think  
> > it is no use in hiding OpenEmbedded and BitBake behind a GNU Makefile.
> 
> well, me and lot of other developers disagree. Hence the popularity of 
> the openmoko makefile.
> 
> Are you trying to make it easier or harder to generate file systems? 
> Lots of developers do not have time to learn the symantics of 
> bitbake/monotone, etc.
> 
> Anything that can make it easier to set up and build is needed. 
> Otherwise it is just easier to build it from scratch.

I think Holger's point and the general feeling of other OE devs, me
included is that the current wave of makefiles hide too much. I had to
solve this problem with Poky and I did it with a script you source which
sets up a magic environment. I don't expect users to know/care about
what the script does. I do want users to end up typing "bitbake xyz"
though. Why?

Users end up realising that everything is either an SCM command ("svn
up" for Poky) or a bitbake one. Neither are complicated programs to
learn. Yes monotone is more complex than svn but all you really need to
know is "mtn pull;mtn up" and even then, understanding why there are two
commands actually teaches you something important about the SCM. Hiding
them from the user just creates a  phobia of using the real tools.

Cheers,

Richard



