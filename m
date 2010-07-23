Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1OcE6R-0006IJ-Ot
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Jul 2010 10:59:37 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o6N8xNNc013248
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Jul 2010 09:59:23 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 13123-02 for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Jul 2010 09:59:19 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o6N8xEQV013242
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Jul 2010 09:59:15 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <i2bir6$un3$1@dough.gmane.org>
References: <1279735486-7050-1-git-send-email-raj.khem@gmail.com>
	<i2bg5t$mvp$1@dough.gmane.org>
	<1279872152.21888.149.camel@lenovo.internal.reciva.com>
	<i2bir6$un3$1@dough.gmane.org>
Date: Fri, 23 Jul 2010 09:59:08 +0100
Message-ID: <1279875548.13006.32.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 93.97.173.237
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=AWL,BAYES_00,RDNS_DYNAMIC,
	TVD_RCVD_IP autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 0/4][RFC] Remove CROSS_DIR, install cross-packages into native sysroot
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
X-List-Received-Date: Fri, 23 Jul 2010 08:59:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2010-07-23 at 10:11 +0200, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> On 23-07-10 10:02, Phil Blundell wrote:
> > On Fri, 2010-07-23 at 09:25 +0200, Koen Kooi wrote:
> >> There is a BIG problem with these patches, they break multimachine builds.
> >>
> >> The previous situation had:
> >>
> >> cross/armv7a-angstrom-foo/usr/bin/
> >> cross/armv5te-angstrom-foo/usr/bin/
> >> etc
> >>
> >> The new situation has:
> >>
> >> x86_64-linux/usr/bin
> >>
> >> So all the toolchains get dropped into the *same* directory, which
> >> breaks horribly.
> > 
> > Which are the actual binaries that collide?  I would have thought that
> > everything which gets installed into the cross bindir ought to be
> > prefixed with TARGET_SYS (i.e. usr/bin/armv7a-angstrom-linux-gcc, etc).
> 
> It's all 'arm-angstrom-foo', I was just about to make the suggestion to
> change it to 'armv7a-angstrom-foo' :)

I've just been talking to Koen about this. When building for armv7a,
TARGET_ARCH which goes into TARGET_PREFIX and TARGET_SYS is "arm".

I suspect if we change TARGET_ARCH to be armv7a, nasty things will
happen but I could be wrong.

If that doesn't help which I suspect it won't, my gut instinct is to add
a architecture specific directory under bin for the cross bits. This
could be as simple as changing bindir in cross.bbclass.

> I don't know if that solves the binutils-cross problem[1], though.
>
> Koen
> 
> [1] http://thread.gmane.org/gmane.comp.handhelds.openembedded/34685

Is that libiberty.a file actually useful or could we just stop
binutils-cross installing it?

Cheers,

Richard




