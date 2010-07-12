Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1OYKX2-000391-Un
	for openembedded-devel@lists.openembedded.org;
	Mon, 12 Jul 2010 17:03:02 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o6CEw0jX029151
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Jul 2010 15:58:00 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 28842-05 for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Jul 2010 15:57:56 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o6CEvq33029145
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Jul 2010 15:57:53 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4C3AA282.3030006@gmail.com>
References: <AANLkTinadOzl08k8hENqZJf9fMzcHHCnpUP1DfmatDj7@mail.gmail.com>
	<4C3AA282.3030006@gmail.com>
Date: Mon, 12 Jul 2010 15:57:48 +0100
Message-ID: <1278946668.28835.769.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 93.97.173.237
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=AWL,BAYES_00,RDNS_DYNAMIC,
	TVD_RCVD_IP autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: canadian-cross sdk?
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
X-List-Received-Date: Mon, 12 Jul 2010 15:03:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2010-07-12 at 11:05 +0600, Dmitry Vinokurov wrote:
> This question is important for me to. I'm running OE on linux-x86_64 
> machine and want to build ARM toolchain for linux-x86 machine. I've 
> asked about it on #irc and CruX| gave me config for building mingw32 
> toolchain, it's in attachment and maybe it'll be helpful for you. 
> Unfortunately, I couldn't adapt this config for my task, OE tries to 
> build mingw all the same.
> 
> It would be great if someone explain how to build canadian cross SDK. I 
> haven't found nothing helpful about it neither in documentation nor in 
> ML archives but it is very important question I think.

The canadian toolchain bits in OE are still in need to some attention to
fully enable the case where the build machine is not the same as the
machine you want to run the SDK on.

In Poky this works already, you'd set SDKMACHINE=i586 and then
"MACHINE=qemuarm bitbake meta-toolchain".

Cheers,

Richard




