Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rpurdie@rpsys.net>) id 1HXmwt-0006J5-BX
	for openembedded-devel@openembedded.org; Sun, 01 Apr 2007 01:25:31 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l2VNPUbo013536;
	Sun, 1 Apr 2007 00:25:30 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 12850-09; Sun,  1 Apr 2007 00:25:27 +0100 (BST)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l2VNPK8V013517
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO);
	Sun, 1 Apr 2007 00:25:21 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel <openembedded-devel@openembedded.org>
Date: Sun, 01 Apr 2007 00:25:22 +0100
Message-Id: <1175383522.5852.21.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: bitbake-dev <bitbake-dev@lists.berlios.de>
Subject: Fixing OE.dev dependency issues
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
X-List-Received-Date: Sat, 31 Mar 2007 23:25:31 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

There is a bitbake 1.8.x bug I've kind of been avoiding for a while. The
classic case is where a multithreaded bitbake tries to run a do_patch
task before do_populate_staging for quilt-native has run. This
highlights a gaping hole in our dependency information and worse still,
we have no mechanism to make bitbake aware of this dependency. There are
also more subtle bugs too.

I'm proposing we add the syntax:

do_patch[depends] = "quilt-native:populate_staging" 

to handle needs like this. Experiments on my local tree suggest we need
the following patch to generate the correct dependencies:

http://www.rpsys.net/openzaurus/temp/oe-depends-fixes.patch

but of course once we do this, bitbake 1.6 is no longer going to work
with the metadata since this change is not backwards compatible.

I'm proposing to release bitbake 1.8.2 with code to handle the above,
and epoch handling code in the very near future. We will then have to
aim to make bitbake 1.8.2 the minimum bitbake version for .dev before
the above fix can be checked in and epoch packages can be more
widely/easily used. Does anyone have any objections to a move to bitbake
1.8 in due course? What timescale would people class as acceptable?

Cheers,

Richard



