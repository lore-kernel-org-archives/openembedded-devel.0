Received: from [209.85.219.172] (helo=mail-ew0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1LtcOw-0004DP-F6
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Apr 2009 08:45:53 +0200
Received: by ewy20 with SMTP id 20so2426302ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Apr 2009 23:42:05 -0700 (PDT)
Received: by 10.210.71.12 with SMTP id t12mr2622096eba.3.1239691325327;
	Mon, 13 Apr 2009 23:42:05 -0700 (PDT)
Received: from ?192.168.1.10? (94-193-93-235.zone7.bethere.co.uk
	[94.193.93.235])
	by mx.google.com with ESMTPS id 11sm7071000ewy.74.2009.04.13.23.42.04
	(version=SSLv3 cipher=RC4-MD5); Mon, 13 Apr 2009 23:42:04 -0700 (PDT)
Message-ID: <49E4303C.10600@xora.org.uk>
Date: Tue, 14 Apr 2009 07:42:04 +0100
From: Graeme Gregory <dp@xora.org.uk>
User-Agent: Thunderbird 2.0.0.21 (X11/20090318)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20090414050720.GA22247@denix.org>
In-Reply-To: <20090414050720.GA22247@denix.org>
X-Enigmail-Version: 0.95.0
X-SA-Exim-Connect-IP: 209.85.219.172
X-SA-Exim-Mail-From: dp@xora.org.uk
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=AWL,BAYES_50,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: e2fsprogs is broken in configure/autoreconf
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
X-List-Received-Date: Tue, 14 Apr 2009 06:45:56 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Denys Dmytriyenko wrote:
> Hi,
>
> XorA's commit[1] seems to break e2fsprogs for me (omap3evm/davinci), not fix. 
> I know, it's not a bug, it's a feature! :) All I know it used to work and it's 
> too late now for me to debug it...
>
> Anyway, the logs are at [2] and [3]. Thanks!
>
> http://cgit.openembedded.net/cgit.cgi?url=openembedded/commit/&id=d187eec071bb0afe8bda13cbf7b89170fe99e384
> http://tinderbox.openembedded.net/packages/477200/
> http://tinderbox.openembedded.net/public/logs/4350191.txt
>
>   
Interesting, but that log isnt an omap log. Looks to me like an
incomplete tmp/ directory for armv5te.

Graeme



