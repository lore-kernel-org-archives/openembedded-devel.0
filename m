Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rpurdie@rpsys.net>) id 1IZuzL-0002y5-JP
	for openembedded-devel@openembedded.org; Mon, 24 Sep 2007 22:57:07 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l8OKqlRG017005
	for <openembedded-devel@openembedded.org>;
	Mon, 24 Sep 2007 21:52:47 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 16681-08-2 for <openembedded-devel@openembedded.org>;
	Mon, 24 Sep 2007 21:52:43 +0100 (BST)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l8OKqXa3016970
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Mon, 24 Sep 2007 21:52:33 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <46F80688.2020702@trolltech.com>
References: <46F587F7.4060501@balister.org> <46F80688.2020702@trolltech.com>
Date: Mon, 24 Sep 2007 21:52:32 +0100
Message-Id: <1190667152.19359.38.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: How should OE be used?
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
X-List-Received-Date: Mon, 24 Sep 2007 20:57:07 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2007-09-25 at 04:48 +1000, Lorn Potter wrote:
> I have always thought that oe needed an easier way to choose packages, 
> like buildroot.
> 
> Some gui that can edit all the conf's and task's, and image.bb's 
> painlessly and easily would make a tom of difference.
> The learning curve for oe is too high.

This is something I plan to raise at OEDEM.

It should be relatively well known by now that I want to improve bitbake
to the extent where writing some kind of UI around it is straightforward
and we can start improving the user experience from this angle.

Bitbake trunk now has some foundations for this in place although there
are some gaps and a few regressions that need fixing. There is no new UI
itself yet.

The job isn't actually that difficult, the problem is that the learning
curve anyone implementing it faces with no previous experience is
steep. 

Personally, the big problem I have is the lack of time to do it and I
suspect others with the experience also have time issues :-(.

> Take buildroot, for example. A person can download it, run make 
> menuconfig, set up the system, arch, and select packages, all in one
> go. 
> You do not need to know that you should have to either edit or create 
> your own tasks, or image .bb's, much less the syntax for those files.

Playing devil's advocate, take Poky, for example. A person can
download/check it out, edit one simple configuration file
(comment/uncomment lines), source a file and go :).

So it is possible.

Cheers,

Richard




