Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <rpurdie@rpsys.net>) id 1JBywY-0000xV-B1
	for openembedded-devel@openembedded.org; Mon, 07 Jan 2008 21:51:34 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m07KiX2N021501;
	Mon, 7 Jan 2008 20:44:33 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21194-08; Mon,  7 Jan 2008 20:44:29 +0000 (GMT)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m07KiQRx021486
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO);
	Mon, 7 Jan 2008 20:44:26 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: Paul Sokolovsky <pmiscml@gmail.com>
In-Reply-To: <116173998.20080107221856@gmail.com>
References: <1068494393.20080104031751@gmail.com>
	<1199663243.4658.71.camel@localhost.localdomain>
	<116173998.20080107221856@gmail.com>
Date: Mon, 07 Jan 2008 20:44:24 +0000
Message-Id: <1199738665.4680.66.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-devel@openembedded.org
Subject: Re: Another weird case of PACKAGES_DYNAMIC and task deps, it seems
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
X-List-Received-Date: Mon, 07 Jan 2008 20:51:34 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2008-01-07 at 22:18 +0200, Paul Sokolovsky wrote:
> Monday, January 7, 2008, 1:47:23 AM, you wrote:
> > So the question is why doesn't your test case have this (I'm assuming it
> > doesn't). My best guess is that the kernel .bb file in question alters
> > DEPENDS and that update-modules isn't really in DEPENDS. Which
> > kernel .bb file serves the machine in question?
> 
>   Gotcha! I tried
> 
>  MACHINE=h4000 bitbake initramfs-image -g
> 
> and it gives the same matches as you quote below. But
> 
>  MACHINE=collie bitbake initramfs-image -g
> 
> Gives zero matches for update-modules. I don't try to investigate
> further now, as you probably know better about it ;-).

My money is on:

DEPENDS_collie += "bc-native"

in linux-rp.inc. Try removing that...

Cheers,

Richard




