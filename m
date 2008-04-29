Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1JqotD-0000I0-Fd
	for openembedded-devel@openembedded.org; Tue, 29 Apr 2008 14:24:55 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m3TCORv4006318
	for <openembedded-devel@openembedded.org>;
	Tue, 29 Apr 2008 13:24:27 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 06198-02 for <openembedded-devel@openembedded.org>;
	Tue, 29 Apr 2008 13:24:23 +0100 (BST)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m3TCOIIj006296
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Tue, 29 Apr 2008 13:24:18 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <c384c5ea0804290507t66765c59w2fbc82366bec675d@mail.gmail.com>
References: <200804281451.05548.geoffrey@pager.net>
	<200804282349.46539.zecke@selfish.org>
	<c384c5ea0804281519o596e224bw252bbac9cca4abc6@mail.gmail.com>
	<c384c5ea0804282203n7b743ed7w41e5e4c201b81a13@mail.gmail.com>
	<19c1b8a90804290048g7618e76dw65ad0273504c9c74@mail.gmail.com>
	<c384c5ea0804290507t66765c59w2fbc82366bec675d@mail.gmail.com>
Date: Tue, 29 Apr 2008 13:24:19 +0100
Message-Id: <1209471859.5642.16.camel@dax.rpnet.com>
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
X-List-Received-Date: Tue, 29 Apr 2008 12:24:55 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2008-04-29 at 14:07 +0200, Leon Woestenberg wrote:
> On Tue, Apr 29, 2008 at 9:48 AM, Khem Raj <raj.khem@gmail.com> wrote:
> >  That should pull the dependency. but this line
> >
> >  DEPENDS = "linux-libc-headers"
> >
> >  should be changed to
> >
> >  DEPENDS += "linux-libc-headers"
> >
> >  I think.
> >
> No, I think the DEPENDS was *intended* to be overridden with a small
> *sub*set that is enough for -initial (to prevent cyclic dependencies).
> 
> However, I suspect it should DEPEND on ncurses-native now as well.
> 
> You know, I'll fire off a Poky Linux build on a system without
> ncurses-dev on the host to verify my thesis,

This was a recent fix to Poky. I removed all the -dev packages from our
build machine and my desktop and can confirm it worked without the -dev
package installed after the fix. I don't think its needed for -initial,
just for the main version but I could be wrong. Be sure to use "bitbake
uclibc-initial" when you test.

Cheers,

Richard






