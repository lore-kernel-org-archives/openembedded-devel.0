Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1Myo4S-0006nk-Ly
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Oct 2009 16:46:23 +0200
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1Myo3Z-0002mJ-6A
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Oct 2009 15:45:25 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <philb@gnu.org>) id 1Myo3Y-0004rY-Pa
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Oct 2009 15:45:24 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4AD87CF8.8040706@dresearch.de>
References: <4AD59AF2.50003@dresearch.de> <4AD8531B.6070208@dresearch.de>
	<4AD87CF8.8040706@dresearch.de>
Date: Fri, 16 Oct 2009 15:45:18 +0100
Message-Id: <1255704318.28050.19.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.3 
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: glibc_2.9 compile failed for armv5te
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
X-List-Received-Date: Fri, 16 Oct 2009 14:46:24 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2009-10-16 at 16:02 +0200, Steffen Sledz wrote:
> > My tries to identifiy the commit responsible to this problem drive me
> > crazy. Everytime i thought i'de catched the causer a recheck brought a
> > different result. :(
> > 
> > So i updated to the HEAD (commit
> > 9a6a9e12a1ef50296621c2eea9fe385464b64f02) and tried again. And really
> > it seems that the behaviour is not deterministic:
> > ...
> 
> Disabling parallel make for glibc seems to fix this problem (but i'm
> not really sure).
> 
> Any protests against putting a
> 
>   PARALLEL_MAKE = " "
> 
> into recipes/glibc/glibc_2.9.bb? Or better into recipes/glibc/glibc.inc?

Putting it in glibc.inc definitely seems like a bad idea unless there is
evidence to suggest that all versions of glibc have this problem.
Nobody else has reported it previously, so I am guessing that either it
is specific to 2.9 or it is in some way unique to your system.

Assuming that it is a general problem with 2.9 then a better solution
would obviously be to find and fix the dependency problem.  Here's a
rough guide as to how to attack that:

1. Find the compile command that corresponds to the failing file
(setjmp.os or whatever it was).  Modify the command to replace -c with
-E and remove the "-o ..." option, then run it by hand.  This will
output the preprocessed source to standard output.

2. Inspect the preprocessed source to find out which symbol is not being
correctly defined.

3. Run a build without -j (so that it works) and then use grep to
establish which header file is meant to define the symbol in question.

p.




