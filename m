Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rpurdie@rpsys.net>) id 1IJrsd-0006GY-1r
	for openembedded-devel@openembedded.org; Sat, 11 Aug 2007 16:23:51 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l7BENoEK006144
	for <openembedded-devel@openembedded.org>;
	Sat, 11 Aug 2007 15:23:50 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 05644-08 for <openembedded-devel@openembedded.org>;
	Sat, 11 Aug 2007 15:23:46 +0100 (BST)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l7BENkD1006135
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Sat, 11 Aug 2007 15:23:46 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <46BDB574.40009@dominion.kabel.utwente.nl>
References: <1186835653.5859.27.camel@localhost.localdomain>
	<46BDB574.40009@dominion.kabel.utwente.nl>
Date: Sat, 11 Aug 2007 15:23:45 +0100
Message-Id: <1186842225.5859.51.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: RFC: SRC_URI_OVERIDES_PACKAGE_ARCH
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
X-List-Received-Date: Sat, 11 Aug 2007 14:23:51 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sat, 2007-08-11 at 15:11 +0200, Koen Kooi wrote:
> Richard Purdie schreef:
> > The problem is that translating SRC_URI to localpaths is computationally
> > expensive. In the SRCREV case, it involves hitting the network which is
> > very slow. If we use the localpath calls at all, we hit the database
> > which will slow down parsing.
> > 
> > We have several options:
> >  * restore the old behaviour, accept the parsing slowdown
> 
> If people want to know how much the slowdown is, add:
> 
> SRC_URI_OVERIDES_PACKAGE_ARCH = "1"
> 
> to your local.conf. On a dual opteron with U320 scsi disks it becomes unbearably slow.
> 
> I think checking only file:// paths is the best intermediate solution.

With bitbake 1.8.7 and SRC_URI_OVERIDES_PACKAGE_ARCH just set in recipes
that need it parsing OE.dev takes:

real    5m49.043s
user    4m35.649s
sys     0m11.057s

Whereas if we check file:// urls:

real    9m8.550s
user    5m55.542s
sys     0m45.847s

Its possible that machine was more loaded when I ran the second test but
it was reproducibly taking 9 mins vs 5.5 mins with just that change. Its
safe to say there is a 20%+ speed hit, probably worse.

For comparison bitbake 1.8.6 with SRC_URI_OVERIDES_PACKAGE_ARCH just set
in recipes that need it:

real    6m56.088s
user    4m50.558s
sys     0m11.933s

Whereas if we check file:// urls:

real    6m45.358s
user    4m52.466s
sys     0m12.225s

So we have what looks like a speedup in 1.8.7 if we can sort the
SRC_URI_OVERIDES_PACKAGE_ARCH problem...

I suspect I should throw away the sql based primary cache and go back to
the ugly global variable as its tons faster...

Cheers,

Richard



