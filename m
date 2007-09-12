Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rpurdie@rpsys.net>) id 1IVbZo-0001vl-8B
	for openembedded-devel@openembedded.org; Thu, 13 Sep 2007 01:24:56 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l8CNLjes029495
	for <openembedded-devel@openembedded.org>;
	Thu, 13 Sep 2007 00:21:45 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 29172-08 for <openembedded-devel@openembedded.org>;
	Thu, 13 Sep 2007 00:21:41 +0100 (BST)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l8CNLcLE029487
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Thu, 13 Sep 2007 00:21:38 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <HOECLKEKOHLAMMGDLLBHGENPMDAA.skoroneos@digital-opsis.com>
References: <HOECLKEKOHLAMMGDLLBHGENPMDAA.skoroneos@digital-opsis.com>
Date: Thu, 13 Sep 2007 00:21:37 +0100
Message-Id: <1189639297.6480.142.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Task-base is big :(
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
X-List-Received-Date: Wed, 12 Sep 2007 23:24:56 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2007-09-12 at 08:56 +0300, Stelios Koroneos wrote:
> As more people start to use OE and as these people would be mostly
> interested in "vertical" solutions (develop an app or add apps to an
> existing distro without having to rebuild everything) i think we need to
> have a closer look at the OE SDK vs build everything from scratch.
> Having a "standard" toolchain availiable (and the way to use it) for people
> that are not interested in developing distro's would IMHO provide additional
> "user friendliness" and make OE an even more attractive solution.

Poky has some partially developed ideas here. Have a look at:

http://pokylinux.org/autobuild/toolchain/2732/poky-0.0-snapshot-20070912-arm-toolchain.tar.bz2
and
http://pokylinux.org/autobuild/toolchain/2732/poky-0.0-snapshot-20070912-i586-toolchain.tar.bz2

These are two toolchains that can be used in two ways:

1. As an external SDK style standalone toolchain
2. When combined with a poky build it becomes a poor mans "packaged
staging" which removes the toolchain build time from the equation by
using this prebuilt toolchain + glibc package.

OE has half the needed functionality since meta-toolchain works the same
in OE as it does in Poky now and will generate tarballs like the above.

The missing link is a distro configuration to actually use such a
generated tarball in OE.

Whilst Poky doesn't package much in the way of libraries, they would be
straight forward to add just by adding the package names to the
appropriate tasks.

Cheers,

Richard 



