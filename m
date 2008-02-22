Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <rpurdie@rpsys.net>) id 1JSYAX-0002q2-Eg
	for openembedded-devel@openembedded.org; Fri, 22 Feb 2008 14:42:36 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m1MDgDb9003507
	for <openembedded-devel@openembedded.org>; Fri, 22 Feb 2008 13:42:13 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 03089-10 for <openembedded-devel@openembedded.org>;
	Fri, 22 Feb 2008 13:42:05 +0000 (GMT)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m1MDg5hS003494
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>; Fri, 22 Feb 2008 13:42:05 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <20080222150945.18f94036@widy.localdomain>
References: <1203589276.9329.6.camel@dax.rpnet.com>
	<20080222150945.18f94036@widy.localdomain>
Date: Fri, 22 Feb 2008 13:42:04 +0000
Message-Id: <1203687724.8186.8.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 194.106.48.114
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: RFC: Library file extensions
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
X-List-Received-Date: Fri, 22 Feb 2008 13:42:36 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,

On Fri, 2008-02-22 at 15:09 +0200, Paul Sokolovsky wrote:
> On Thu, 21 Feb 2008 10:21:16 +0000 Richard Purdie <rpurdie@rpsys.net> wrote:
> > As some may have gathered I made some experiments with using Poky to
> > cross compile things to run on the iPodTouch which is
> > arm-apple-darwin. THe good news is they were successful however
> > Darwin creates some interesting challenges for OE, one of them is the
> > dynamic libraries being called *.dylib, not *.so.
> 
> The easiest way to account for would be to introduce something short
> like:
> 
> SO ?= "so"
> 
> But if, as look at the patch below shows, we need to actually account
> for cases like .so.<ver> vs .<ver>.dylib, then apparently it's the way
> to go.

Right, thats exactly the problem...

Cheers,

Richard



