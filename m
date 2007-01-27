Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rpurdie@rpsys.net>) id 1HAmbk-0006cS-Ql
	for openembedded-devel@openembedded.org; Sat, 27 Jan 2007 13:24:37 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l0RCOZOq031195;
	Sat, 27 Jan 2007 12:24:35 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 30730-09; Sat, 27 Jan 2007 12:24:32 +0000 (GMT)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l0RCOS1S031187
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO);
	Sat, 27 Jan 2007 12:24:28 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: bitbake-dev <bitbake-dev@lists.berlios.de>
Date: Sat, 27 Jan 2007 12:24:28 +0000
Message-Id: <1169900668.5796.17.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-devel <openembedded-devel@openembedded.org>
Subject: Interactive task handling in Bitbake
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
X-List-Received-Date: Sat, 27 Jan 2007 12:24:37 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

As some will have noticed, "interactive" tasks such as devshell and
patch aren't working properly in bitbake trunk when the -b option isn't
used. The problem comes about when the multithreading code is active as
the forked processes no longer have proper access to stdin/stdout.

I've given quite a lot of thought on how to solve this both to fix the
current problems and to fix the even worse problems we'll have when we
split bitbake into a client and server where the server might not even
be on the same machine as the client.

This morning, a solution hit me and I now have a proposal on how we
could handle this. My plan is to take advantage of X's remote display
functionality so when bitbake drops to a shell it does so over the
standard DISPLAY environment variable. This has the benefit of being a
well established standard than can be setup in a number of widely
documented configurations (such as over ssh tunnels) and presents no
arbitrary limits such the number of interactive tasks we can run at
once.

It should be on record, I never want bitbake to *have* to use
interactive tasks. Bitbake should be capable of unattended operation
either when an X display isn't present or its an automated build eg. an
autobuilder or QA tests/builds. This currently is the case as the
devshell task is an optional task and the patch class has the NOOP
resolver.

I've yet to work out the specifics of this plan and it will probably
happen in stages. Initially, I guess it will rely on some standard
terminal applications being present on the server, eventually bitbake
might build its own native version of one of these. This would be a lot
easier if we can remove the special case of native .bb files, something
I'm also giving thought to in the longer term.

For now, I think it would be enough for bitbake to be able to launch a
variety of terminal programs and if people want interactive support,
they need to ensure one is installed on the server. I've not even tested
the specifics of doing this, but it should at least be technically
possible :).

Does anyone see a better way of handling this (or object to this plan)?

Cheers,

Richard




