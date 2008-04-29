Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1JqtIM-0003ed-RL
	for openembedded-devel@openembedded.org; Tue, 29 Apr 2008 19:07:11 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m3TH6gcQ027673
	for <openembedded-devel@openembedded.org>;
	Tue, 29 Apr 2008 18:06:42 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 27356-08 for <openembedded-devel@openembedded.org>;
	Tue, 29 Apr 2008 18:06:32 +0100 (BST)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m3TH6JMZ027605
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Tue, 29 Apr 2008 18:06:19 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <1209478958.30327.1.camel@isis>
References: <200804281451.05548.geoffrey@pager.net>
	<200804282349.46539.zecke@selfish.org>
	<c384c5ea0804281519o596e224bw252bbac9cca4abc6@mail.gmail.com>
	<c384c5ea0804282203n7b743ed7w41e5e4c201b81a13@mail.gmail.com>
	<19c1b8a90804290048g7618e76dw65ad0273504c9c74@mail.gmail.com>
	<c384c5ea0804290507t66765c59w2fbc82366bec675d@mail.gmail.com>
	<1209471859.5642.16.camel@dax.rpnet.com>
	<1209478958.30327.1.camel@isis>
Date: Tue, 29 Apr 2008 18:06:20 +0100
Message-Id: <1209488780.5642.39.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Mixed up STAGING_INCDIR's in uclibc.inc?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10b4
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
X-List-Received-Date: Tue, 29 Apr 2008 17:07:11 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit


On Tue, 2008-04-29 at 07:22 -0700, Khem Raj wrote:
> On Tue, 2008-04-29 at 13:24 +0100, Richard Purdie wrote:
> > This was a recent fix to Poky. I removed all the -dev packages from our
> > build machine and my desktop and can confirm it worked without the -dev
> > package installed after the fix. I don't think its needed for -initial,
> > just for the main version but I could be wrong. Be sure to use "bitbake
> > uclibc-initial" when you test.
> 
> if you are doing anything with kconfig in the recipe you will need
> libncurses-dev which I think uclibc-initial is doing.

Thanks makes sense and I didn't explicitly test uclibc-initial so its
likely I didn't see the problem. I'll update Poky with that change too.

Cheers,

Richard



