Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rpurdie@rpsys.net>) id 1IiU8N-0007aE-JX
	for openembedded-devel@openembedded.org; Thu, 18 Oct 2007 14:05:54 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l9IBxDUW031448
	for <openembedded-devel@openembedded.org>;
	Thu, 18 Oct 2007 12:59:13 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 31381-02 for <openembedded-devel@openembedded.org>;
	Thu, 18 Oct 2007 12:59:10 +0100 (BST)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l9IBx6tD031442
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Thu, 18 Oct 2007 12:59:06 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <471729ED.9080208@student.utwente.nl>
References: <4510693243.20071017152524@vanille-media.de>
	<471729ED.9080208@student.utwente.nl>
Date: Thu, 18 Oct 2007 12:59:03 +0100
Message-Id: <1192708743.6158.25.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Cleaning up SDK/Toolchain
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
X-List-Received-Date: Thu, 18 Oct 2007 12:06:01 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2007-10-18 at 11:39 +0200, Koen Kooi wrote:
> Apart from the libc flaw I pointed out in another mail, the naming of the toolchains is
> broken as well:
> 
> angstrom-2007.9-test-20071017-arm-linux-gnueabi-toolchain.tar.bz2
> angstrom-2007.9-test-20071017-arm-linux-uclibcgnueabi-toolchain.tar.bz2
> angstrom-2007.9-test-20071018-powerpc-linux-toolchain.tar.bz2
> angstrom-2007.9-test-20071018-powerpc-linux-uclibc-toolchain.tar.bz2
> 
> There's no way to see if the arm ones are armv4t, armv5te or armv6 and the powerpc ones
> ppc405, ppc440 or ppc603e. For compiling 'hello world' that doesn't matter, but libc6.so
> and libgcc_s.so will contain instruction not available on other cpus of that arch (e.g.
> clz is not in armv4t), so your binary will probably not work on your device.
> 
> My idea is to use PACKAGE_ARCH (e.g. armv5te or ppc603e) instead of TARGET_ARCH.
> 
> Comments/hints/ideas?

We actually have a bigger problem. Staging uses an arm directory, not an
armv5te one so the armv5te binaries mix up with the armv4 ones etc.

This isn't a problem with images built from packages where everything
dynamically links since the right packages are used. The moment someone
tries to statically link an armv4 binary with armv5te in staging, game
over though.

So both the meta-toolchain and staging need some thought (and are
related since meta-toolchain has knowledge to rebuild bits of staging
for use in its "shortcut an OE build by skipping the toolchain" mode.

I agreed we probably need to add in some PACKAGE_ARCHs in places but its
yet another thing that needs some careful thought and we'll probably
break people's existing builds. I hope to look at/think about it soon if
nobody beats me too it...

Cheers,

Richard



