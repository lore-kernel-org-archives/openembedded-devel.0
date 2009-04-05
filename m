Received: from [93.97.173.237] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1Lqb5b-0007UM-1T
	for openembedded-devel@openembedded.org; Mon, 06 Apr 2009 00:45:21 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id n35MgWnr005960
	for <openembedded-devel@openembedded.org>;
	Sun, 5 Apr 2009 23:42:32 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 30844-06 for <openembedded-devel@openembedded.org>;
	Sun,  5 Apr 2009 23:42:24 +0100 (BST)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id n35MgLa9005925
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Sun, 5 Apr 2009 23:42:21 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <gr7nfd$32a$1@ger.gmane.org>
References: <gr7nfd$32a$1@ger.gmane.org>
Date: Sun, 05 Apr 2009 23:43:02 +0100
Message-Id: <1238971382.5343.10.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 93.97.173.237
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=AWL,BAYES_00,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] Rebuild external kernel modules on kernel change
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
X-List-Received-Date: Sun, 05 Apr 2009 22:45:21 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sat, 2009-04-04 at 15:31 +0200, Koen Kooi wrote:
> For beagleboard I have a few things I need to rebuild everytime the 
> kernel changes:
> 
> * powervr kerneldrivers
> * sdma kernel module
> * dmai kernel module
> * codec-engine
> 
> And I have roughly two kinds of kernel changes:
> 
> 1) version upgrade (e.g. 2.6.29 -> 2.6.29)
> 2) config changes (e.g. enable ethernet bridging)
> 
> The first type of change could be solved by putting KERNEL_VERSION in PV 
> or PR, but that needs a non-trivial amount of python since the 
> information isn't available at parsing time (exactly like debian.bbclass).
> The second kind of change is a lot harder to detect, unless we start 
> storing md5sums for kernel defconfigs.
> 
> I have a lowtech proposal for this:

The thing is if we start doing this for kernels, we'll probably end up
having to do it for other things and the end result will be a mess.

A better fix for this is BB_STAMP_POLICY = "whitelist" which will at
least cause the right things to rebuild.

No, this doesn't bump the PR when packages change but I'd actually like
to see some new code to fix this problem and several others once and for
all. The idea would be to "compare" the current build with any previous
ones and error if bad differences are detected. In this case if PR = X
had already built that would be an "error" which the system may work
around by using PR = "X-Z1" in the output packages. You could teach that
code interesting (even distribution specific) logic e.g. to ignore
changes in system libraries like libc.

This would imply this comparison data would have to come from a shared
source for multiple build machines for a distribution like Angstrom.

No, this solution isn't simple but hacking around the problem just
builds a house on top of quicksand ;-).

Cheers,

Richard







