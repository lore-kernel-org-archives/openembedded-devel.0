Received: from [93.97.175.187] (helo=dan.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1MWtgz-0007JJ-RF
	for openembedded-devel@openembedded.org; Fri, 31 Jul 2009 17:06:50 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	n6VEoN37031839; Fri, 31 Jul 2009 15:50:24 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 7W0O2ooIkgED; Fri, 31 Jul 2009 15:50:23 +0100 (BST)
Received: from [192.168.1.3] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	n6VEoH5f031826
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Fri, 31 Jul 2009 15:50:20 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <1248989671.3629.1358.camel@conroy-linux>
References: <1248989671.3629.1358.camel@conroy-linux>
Date: Fri, 31 Jul 2009 15:50:12 +0100
Message-Id: <1249051812.2289.215.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Cc: Phil Black <Phil.Black@hillcrestlabs.com>
Subject: Re: Packaged-staging and RPATH with native/cross/sdk
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
X-List-Received-Date: Fri, 31 Jul 2009 15:06:59 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2009-07-30 at 17:34 -0400, Chris Conroy wrote:
> I'm trying to use packaged-staging to set up a sane prebuilt toolchain
> environment to share with other developers. I view packaged-staging as a
> promising route of creating a "Stage 3" version of OE (to use some
> Gentoo parlance). While building the toolchain isn't all that painful,
> even on a decent system it can add 1-2 hours to the build process, and
> every individual developer needs to redo the toolchain and base
> libraries for every feature branch. This is all needlessly wasted time
> since they're all ultimately building the same things if on the same
> arch.
> 
> Packaged-staging seems to give me everything we need in order to
> accomplish this except for the way RPATH is handled. This is a known
> issue which is worked around in packaged-staging with the following
> snippet:
> 
>     # These classes encode staging paths into the binary data so can
> only be
>     # reused if the path doesn't change/
>     if bb.data.inherits_class('native', d) or
> bb.data.inherits_class('cross', d) or bb.data.inherits_class('sdk', d):
>         path = bb.data.getVar('PSTAGE_PKGPATH', d, 1)
>         path = path + bb.data.getVar('TMPDIR', d, 1).replace('/', '-')
>         bb.data.setVar('PSTAGE_PKGPATH', path, d)

Not meaning to sound negative but I think you'll hit some interesting
edge cases and this is why packaged staging currently works as above.

You do have one other option which is an external toolchain. The idea
here is that you have OE build an SDK to install into
say /usr/local/OE-toolchain-foobar, then ask your users to install this
and point OE at the toolchain in that folder. It will still build some
-native packages but you get a big speedup as the toolchain is the heavy
part.

Also, I think the -cross packages could be made relocatable quite
easily, particularly with sysroot and its the -native ones which are
hard. If the -cross packages were fixed, a large chunk of your build
time also goes away.

There are plenty of options but they all need a little bit of time
investment unfortunately.

Cheers,

Richard



