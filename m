Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1NuNsR-0002gf-SK
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Mar 2010 11:31:56 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o2OASkV3022466
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Mar 2010 10:28:46 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 22088-08 for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Mar 2010 10:28:42 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o2OASb1i022460
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Mar 2010 10:28:38 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4BA9B440.2050608@zenlinux.com>
References: <4B99791E.1020102@zenlinux.com> <4BA981A5.5030609@zenlinux.com>
	<19c1b8a91003232245y3409bca3p4b74ab5562424b5c@mail.gmail.com>
	<4BA9B440.2050608@zenlinux.com>
Date: Wed, 24 Mar 2010 10:28:36 +0000
Message-ID: <1269426516.1681.35.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 93.97.173.237
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=AWL,BAYES_00,RDNS_DYNAMIC,
	TVD_RCVD_IP autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: BBCLASSEXTEND sdk vs. nativesdk
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
X-List-Received-Date: Wed, 24 Mar 2010 10:31:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2010-03-23 at 23:42 -0700, Scott Garman wrote:
> On 03/23/2010 10:45 PM, Khem Raj wrote:
> >> It seems to me the correct course of action is to use nativesdk in
> >> BBCLASSEXTEND and rename the dependencies on other recipes, yes?
> >
> > you should rename the dependencies on zlib-sdk to zlib-nativesdk
> > wherever they exist.

This isn't quite correct. nativesdk is not a drop in replacement for the
old sdk but you are right that is is the replacement.

The difference is that the old "sdk" assumes the system you want the sdk
to run on is the same as the build system. This has always been a big
can of worms causing problems so "nativesdk" removes this assumption and
allows you to set SDKMACHINE to be the machine you want the resulting
sdk to run on.

This adds some complexity since we need another cross compiling
toolchain. But cross compiling toolchains are something we're good
at :). It also means we ship *everything* with the sdk including a
standalone glibc massively removing system dependencies from the result
which in my opinion can only be a good thing.

"sdk" and "nativesdk" are designed to coexist and the idea is that we
add "nativesdk" to OE alongside "sdk", get it working, then remove the
old broken "sdk" stuff.

In theory you can therefore just add the BBCLASSEXTEND line to the zlib
recipe and work backwards from there. You will need a working -crosssdk
version of gcc to provide the different compiler.

> I am running into some problems now trying to get zlib-nativesdk to 
> build. If I change the recipe to use sdk, it builds fine, so I have 
> something useful to compare things to.
> 
> When I build using nativesdk, configure dies pretty quickly when testing 
> the compiler. It's trying to run i686-linux-gcc.
> 
> Sure enough, if I compare the BitBake environments using the -e option, 
> I see that CC is being set to "gcc" when I use sdk but "i686-linux-gcc" 
> when I use nativesdk.
> 
> If I create the needed symlink to gcc, the compilation gets further but 
> still fails, wanting i686-linux-ar, etc. So I have a basic understanding 
> of what the problem is, but I'm sure the solution is not to go symlink 
> crazy with my native compiler environment.

See above, its missing the -crosssdk cross compiler. Did you not have to
ASSUME_PROVIDED something to make the dependencies work?

> So I took a look at sdk.bbclass and nativesdk.bbclass. They both set up 
> a number of architecture-specific variables, but neither of them 
> explicitly set CC. Where I should look next?
> 
> It turns out there is only one package currently in OE that uses 
> BBCLASSEXTEND with nativesdk (gettext_0.17). So perhaps it is the case 
> that nativesdk.bbclass needs additional work. I did test copying over 
> Poky's nativesdk.bbclass (which has just a few differences), but I still 
> get the same results.

We probably need those differences in OE. Its nice to see someone
looking at this!

Cheers,

Richard




