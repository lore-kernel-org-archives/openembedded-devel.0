Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rpurdie@rpsys.net>) id 1H3d82-0000La-H5
	for openembedded-devel@openembedded.org; Sun, 07 Jan 2007 19:52:24 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l07IobSP006731;
	Sun, 7 Jan 2007 18:50:37 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 06652-01; Sun,  7 Jan 2007 18:50:34 +0000 (GMT)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l07IoWU7006724
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO);
	Sun, 7 Jan 2007 18:50:33 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: bitbake-dev <bitbake-dev@lists.berlios.de>,
	openembedded-devel <openembedded-devel@openembedded.org>
Date: Sun, 07 Jan 2007 18:50:33 +0000
Message-Id: <1168195833.5610.46.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Bitbake task dependency stamp handling
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
X-List-Received-Date: Sun, 07 Jan 2007 18:52:24 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

I had some interesting thoughts regarding tasks and their timestamps.
Bitbake's current method of dealing with timestamps walks the task
digraph structure which only knows about a single .bb file. The result
is if you change an earlier task, say do_patch, later tasks like
do_compile would rerun. If you rebuild gtk, the rest of your system
linking to gtk doesn't rebuild though.

If we move away from the digraph which isn't really needed anymore,
taskData has the complete dependency tree available to it and the option
of rebuilding the whole system if you recompile gtk becomes possible.

At face value this sounds really useful. I'd guess that almost every OE
developer would find it insanely annoying in practise though?

Does anyone have any thoughts?

Richard






