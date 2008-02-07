Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <rpurdie@rpsys.net>) id 1JMv9v-0006Ae-SE
	for openembedded-devel@openembedded.org; Thu, 07 Feb 2008 02:02:36 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m1712m6x013707
	for <openembedded-devel@openembedded.org>; Thu, 7 Feb 2008 01:02:48 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 13602-01-4 for <openembedded-devel@openembedded.org>;
	Thu,  7 Feb 2008 01:02:40 +0000 (GMT)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m170scYH012301
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>; Thu, 7 Feb 2008 00:54:38 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <47AA0276.6020100@palm.com>
References: <47A78C40.8000308@palm.com>
	<1202166317.4788.105.camel@localhost.localdomain>	<47A7CBE6.70401@palm.com>
	<1202248991.4619.5.camel@localhost.localdomain>	<47A91B74.9040605@palm.com>
	<1202300290.8393.6.camel@dax.rpnet.com>  <47AA0276.6020100@palm.com>
Date: Thu, 07 Feb 2008 00:54:40 +0000
Message-Id: <1202345680.8393.51.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: getVar. setVar, "d", etc.
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
X-List-Received-Date: Thu, 07 Feb 2008 01:02:36 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2008-02-06 at 10:54 -0800, K. Richard Pixley wrote:
> Richard Purdie wrote:
> > Once again I should remind people that := is usually a bad idea (see
> > recent discussions).
> That's counterintuitive and backwards from other build systems.  

Counterintuitive, yes, backwards, no. It does this differently since
bitbake works differently in general to other build systems. The
overrides syntax OE/bitbake uses is extremely powerful but has some
costs and this is one of them.

> I've often pulled significant savings out of makefile based systems by 
> switching from = to :=.  

This isn't a makefile based system.

> The problem being that "x = ${@ 
> a_long_running_function() }" is a killer, especially when 
> a_long_running_function is deterministic.  In that case, := requires 
> exactly one call during assignment while = requires a fresh call for 
> each and every reference. 

You need to think carefully about when bitbake will execute these
expressions. If a variable is never used, the code in it will never be
run. Most variables are not expanded and hence any functions are not run
during initial parsing. They may run when the recipe is executed but any
time taken at this point isn't usually a problem.

> I used := in this situation specifically because of the sequence 
> ordering.   The assignments in my example are dummies whose sole purpose 
> is to force the side effects to happen at a predictable and early point 
> in the run - specifically, before the assignment to SRC_URI.  If I don't 
> force the side effects to happen at := time, then there's no reason to 
> believe that they will have occurred prior to the expansion of ${PR} in 
> ${SRC_URI}.  (And, in fact, changing this doesn't affect my results).
> 
> I have discovered that converting the constructions into "python 
> setting() {" seem to give them consistent contexts.  I don't understand 
> why ${@ ... } lacks that context, but at least I have a way to proceed. 

The "anonymous" functions are run after the file is parsed but before
the data is used.

${@...} runs when the variable is expanded.

> Event handlers also seem to have consistent context so if I can reverse 
> engineer what events actually exist, or force one to occur at the right 
> time, then I should be able to get my assignments done early enough.
> 
> Neither these differences nor event handlers are very well described in 
> the manual, btw.

Patches welcome!

Regards,

Richard



