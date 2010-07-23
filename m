Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1OcM36-0004Ys-0N
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Jul 2010 19:29:01 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o6NHSRqp020764
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Jul 2010 18:28:27 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20211-08 for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Jul 2010 18:28:23 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o6NHSLLa020758
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Jul 2010 18:28:22 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1279882577.13006.40.camel@rex>
References: <1279735486-7050-1-git-send-email-raj.khem@gmail.com>
	<i2bg5t$mvp$1@dough.gmane.org>
	<1279872152.21888.149.camel@lenovo.internal.reciva.com>
	<i2bir6$un3$1@dough.gmane.org>  <1279875548.13006.32.camel@rex>
	<1279880258.2692.15.camel@mill.internal.reciva.com>
	<1279882577.13006.40.camel@rex>
Date: Fri, 23 Jul 2010 18:28:14 +0100
Message-ID: <1279906094.13006.60.camel@rex>
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
X-List-Received-Date: Fri, 23 Jul 2010 17:29:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2010-07-23 at 11:56 +0100, Richard Purdie wrote:
> I'm testing some patches against poky which add an extra directory level
> in /usr/bin/. I've also patched binutils-cross to stop spewing excess
> bits all over the place. I'll report back how it goes.

I got things fixed in Poky, pending more extensive testing which I
haven't had time for yet. There are several things needed though:


a) Have gcc dump a load of symlinks into its libexec directory:

http://git.pokylinux.org/cgit.cgi/poky/commit/?id=bf8023237c6fe43781fa4ce0db00f2b08cab7817

This is so when it tries to find "as" (not TARGET_PREFIX-as) it will
find the right ones. It means we don't need the duplicates from bintuils
which always end up in a multimachine unsafe path which means we can
then:

b) Kill off bits of binutils that don't make sense

http://git.pokylinux.org/cgit.cgi/poky/commit/?id=066535608e879c0327dfa874f3978d6cc15fa59f

and then 

c) Create some extra path layers which hold the different toolchains. We
have to split out bindir, libdir and libexec dir as they all contain
varying amounts of potentially machine sensitive code (sysroot
settings).

http://git.pokylinux.org/cgit.cgi/poky/commit/?id=66d7b58f224e55b70b80a01d451270b7de757885


Poky has the complication its using gcc-runtime which builds/packages
the target gcc libs separately where it possibly can. I had to tweak
things to account for this with some other patches and also make that
multi arch safe. I think OE should be ok in this regard but something
like:

http://git.pokylinux.org/cgit.cgi/poky/commit/?id=ab82312433f8a7eacd6ee90d3bc9e5153282ec3f

may be required due to the way gcc makes assumptions about paths.

Cheers,

Richard



