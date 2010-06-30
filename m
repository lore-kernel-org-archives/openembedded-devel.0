Received: from hxhsvr03.internetintuitive.net ([80.254.228.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dokuwiki@keylevel.com>) id 1OTt1V-0002e2-2V
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Jun 2010 10:52:02 +0200
Received: from durham.keylevel.com ([109.224.134.115]:1180 helo=[192.168.1.98])
	by hxhsvr03.internetintuitive.net with esmtpa (Exim 4.69)
	(envelope-from <dokuwiki@keylevel.com>) id 1OTswx-0007wC-5N
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Jun 2010 09:47:19 +0100
Message-Id: <15292C28-2BC7-48B5-A964-FDA2F5EF2737@keylevel.com>
From: Chris Tapp <dokuwiki@keylevel.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTimHu_IwTMM2CyZv0Hz6yOsHsJyMGyGh-iYyKBWJ@mail.gmail.com>
Mime-Version: 1.0 (Apple Message framework v936)
Date: Wed, 30 Jun 2010 09:47:16 +0100
References: <933C8D2B-2A4E-46EE-A342-ED5EB3636F38@keylevel.com>
	<AANLkTilmoW3cU9hcM1PbN8-yDTM36uzkNB5CwU8obJf1@mail.gmail.com>
	<92233E3F-2CFC-4F88-A780-1A15D7D94A00@keylevel.com>
	<AANLkTim3wnL18BjsIrLiKZC5NRc70UG77N1GtOiISghA@mail.gmail.com>
	<69E07E36-D08B-4CD2-9B79-EF876EE47C52@keylevel.com>
	<20100629223859.GE12539@jama>
	<D1248977-0BA9-49ED-B748-4C131AAB39D9@keylevel.com>
	<AANLkTimHu_IwTMM2CyZv0Hz6yOsHsJyMGyGh-iYyKBWJ@mail.gmail.com>
X-Mailer: Apple Mail (2.936)
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - hxhsvr03.internetintuitive.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - keylevel.com
X-SA-Exim-Connect-IP: 80.254.228.43
X-SA-Exim-Mail-From: dokuwiki@keylevel.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: 'swapper' process using 100% cpu when system idle
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
X-List-Received-Date: Wed, 30 Jun 2010 08:52:03 -0000
Content-Type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit

> Well, I can only guess, but you may have a misbehaving application.  I
> experienced something similar on a laptop, and didn't even know it
> until I unplugged and took an airplane ride.  In 2 hours, my 6+ hour
> battery was dead...an HP scanner driver was consuming 99% CPU even
> though the scanner was not even plugged into the laptop!  Bad me for
> trusting, and bad HP for a dumb design (or even dumber bug!)
>
> If you can, try selectively killing applications until the condition
> goes away.  Also, you didn't mention how much memory you're system
> has, you may be overwhelming it.  And by 'swapper' I presume you mean
> kswapd?
>
> Alternatively, start out with as minimal a system as possible, ie just
> start a shell, then mount /proc and see what's going on using ps/top,
> etc. Then manually walk through your system init until you find the
> offender, if it's userspace at all.  Given that you changed kernel
> versions and still have the issue, that points more towards apps.

Thanks - this is a very basic image (basically just console-image) and  
has nothing running. 'swapper' is process '1' and top shows that all  
cpu is used by it as 'system' time - the 'idle' time counter always  
shows 0%.

Chris


