Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rpurdie@rpsys.net>) id 1HOL9m-0002YL-FF
	for openembedded-devel@openembedded.org; Mon, 05 Mar 2007 22:55:46 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l25LtZfP004488;
	Mon, 5 Mar 2007 21:55:36 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04061-05; Mon,  5 Mar 2007 21:55:33 +0000 (GMT)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l25LtUAS004478
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO);
	Mon, 5 Mar 2007 21:55:30 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: bitbake-dev <bitbake-dev@lists.berlios.de>,
	openembedded-devel <openembedded-devel@openembedded.org>
Date: Mon, 05 Mar 2007 21:55:31 +0000
Message-Id: <1173131731.5842.140.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Bitbake Request for Testing of bitbake 1.8
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
X-List-Received-Date: Mon, 05 Mar 2007 21:55:47 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

I've been putting this off for a while but bitbake trunk has branched
for a new stable release series, 1.8.x which will ultimately replace the
1.6.x stable series.

Could people give the 1.8 branch in bitbake a try? If you have problems,
I will do my best to resolve them before 1.8.0 is released. I estimate
1.8.0 is say a week away, I want to release soon.

For what its worth, some of the core devs have been using trunk for a
while with success and its been used in poky without incident for a
while now too.


What's will be new in 1.8?

* We basically rewrote half the core. Bitbake used to calculate the
build path "on the fly" which was no use for multithreading, its now
been replaced with a calculation in advance (taskdata and runqueue).
This allows it to do simplistic multithreading. Set BB_NUMBER_THREADS =
"100" in local.conf to lock your machine up or something lower to try
multithreading ;-).

* The -g dependency graph output has changed and now includes a task
dependency file. Has anyone got a good way to view these graphically
yet?

* The fetchers were refactored removing duplicate code and standardising
behaviour.

* Numerous code changes were made internally to refactor/modularise the
code. This will be useful in future developments (the last code I
checked in prepares for the UI).


What will happen in trunk?

I've branched as I have some fairly invasive changes planned for trunk.
The aim of these is to split bitbake into a client/server and look at
UIs. Whilst 1.7.x was very stable more recently, 1.9.x is going to
break ;-). 

The current UI code I have is about as secure as publishing your IP
address and root password on the web and leaving the telnet port open so
when I check it in, use at your own risk. I will accept patches to
address these issues ;-). My main concern is the structure at the moment
rather than security or functionality which can come later.


So please do test the bitbake 1.8 branch and lets make it as successful
as 1.6!

Cheers,

Richard



