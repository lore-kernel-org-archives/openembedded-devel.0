Received: from [93.97.173.237] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <richard@openedhand.com>) id 1MrYgo-0001c1-Mm
	for openembedded-devel@openembedded.org; Sat, 26 Sep 2009 16:56:01 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id n8QEtGN7011394;
	Sat, 26 Sep 2009 15:55:16 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 11132-05; Sat, 26 Sep 2009 15:55:08 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id n8QEt1ja011372
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Sat, 26 Sep 2009 15:55:03 +0100
From: Richard Purdie <richard@openedhand.com>
To: openembedded-devel@openembedded.org
In-Reply-To: <20090924194926.GG9726@smtp.west.cox.net>
References: <1253213978.30165.188.camel@dax.rpnet.com>
	<20090924194926.GG9726@smtp.west.cox.net>
Date: Sat, 26 Sep 2009 15:54:56 +0100
Message-Id: <1253976896.7598.49.camel@ted>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 93.97.173.237
X-SA-Exim-Mail-From: richard@openedhand.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: poky <poky@o-hand.com>
Subject: Re: Poky SDK generation changes
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
X-List-Received-Date: Sat, 26 Sep 2009 14:56:02 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2009-09-24 at 12:49 -0700, Tom Rini wrote:
> This all sounds pretty good.  My first concern is where does MACHINE
> fit into this stuff?

MACHINE changes the target of the SDK so it is taken into account.

>   My second is, is it possible to do something like:
> $ SDK_ARCH="i586-linux" MACHINE=machine1 bitbake my-sdk-target
> $ SDK_ARCH="i586-mingw" MACHINE=machine1 bitbake my-sdk-target
> I assume so.  Then after those two, how about:
> $ SDK_ARCH="i586-linux" MACHINE=machine2 bitbake my-sdk-target
> $ SDK_ARCH="i586-mingw" MACHINE=machine2 bitbake my-sdk-target

Yes, this all does exactly what you'd expect. 

I've also added "SDKMACHINE" to Poky too which works like MACHINE with
some predefined .conf files for common targets.

Cheers,

Richard




