Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1JYfh1-0000cf-Va
	for openembedded-devel@openembedded.org; Mon, 10 Mar 2008 11:57:21 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m2AAtTmL019273;
	Mon, 10 Mar 2008 10:55:29 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 19254-01; Mon, 10 Mar 2008 10:55:21 +0000 (GMT)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m2AAtKiu019261
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 10 Mar 2008 10:55:20 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: Stanislav Brabec <utx@penguin.cz>
In-Reply-To: <1205144527.3728.16.camel@hammer.suse.cz>
References: <47D375BD.6010009@gmail.com>
	<1205144527.3728.16.camel@hammer.suse.cz>
Date: Mon, 10 Mar 2008 10:55:19 +0000
Message-Id: <1205146519.4529.2.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 194.106.48.114
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@openembedded.org
Subject: Re: htcuni.patch generic for all devices?
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
X-List-Received-Date: Mon, 10 Mar 2008 10:57:22 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit


On Mon, 2008-03-10 at 11:22 +0100, Stanislav Brabec wrote:
> Junqian Gordon Xu wrote:
> > htcuni.patch is not clean in .dev and breaks linux-rp_2.6.24 for all 
> > devices. My questions is why this patch was applied to all devices in 
> > thefirst place. Shouldn't this patch be put under the htcuniversal 
> > section, regardless if it's broken or not?
> 
> I am not a HTC Universal user, so I cannot test its function, but from
> aspect of other devices, it looks clean and does not break my Zaurus
> kernel.
> 
> Consequent reject in another patch sharpsl-rc is another problem,
> trivial to fix.
> 
> Richard, what is your opinion? Do you prefer device specific patch sets
> or making all clean enough patches generic?

I favour making clean generic patches which are applied on all machines.
Anything intending to head for mainline needs to cope with this and the
patches are in linux-rp are mainly intended for mainline.

I know I didn't do that with the tosa checkin but I do hope to find time
to resolve that soon :)

I will try and test out the status of 2.6.24 and fix the various issues
I'm aware of today.

Cheers,

Richard




