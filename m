Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OndJW-0005k0-8W
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Aug 2010 22:08:23 +0200
Received: by iwn2 with SMTP id 2so3249132iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Aug 2010 13:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=S6Umxhg7qWoAj1MmAcuQRsZd3FW8TB5smnnvS255TwM=;
	b=L0sgyHilIYaa7ogoqX8nbBVaMq4o7UfU47Hn0FkazEthQD6BcFoBIYW9xy47+ixVse
	RycSwcjzj2kUtKx5ykcQiP0fAB8Jr6741mrV2drIHrBr2buTR3qc9Kkl3LmL1M3/lH7H
	hzzHHoDi1SWfqAGOor8q7+5zgqeCjGsYU1UXA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=p6Pe3z/JTfkqMx1R/WCFX4GrLpuya0yRtMMITQ5ZK2zkiaeyIr9tuaNpWejc5Bmbao
	+WNAQ73p17AuVpr6tMk1LaL2yu6mUyVfpo0x9zmlMWqeUZKR5D2sy8cMEBt54lT4Ivh+
	upNWTWIATRODCEwx1K5hsyBQUn73H/jiviM4c=
MIME-Version: 1.0
Received: by 10.231.192.80 with SMTP id dp16mr7199255ibb.39.1282594067669;
	Mon, 23 Aug 2010 13:07:47 -0700 (PDT)
Received: by 10.231.205.138 with HTTP; Mon, 23 Aug 2010 13:07:47 -0700 (PDT)
In-Reply-To: <alpine.LNX.2.00.1008231134030.5745@asterix.crazy-teaparty.dyndns.org>
References: <AANLkTinr4-xEo+Urc_9P+uLmLk6qPJSRzCJNYVsKAxD6@mail.gmail.com>
	<alpine.LNX.2.00.1008191432360.5745@asterix.crazy-teaparty.dyndns.org>
	<AANLkTinMr1=Bj8eK2D+mg_J-P6jzvSAQAhXNtgkK=u1n@mail.gmail.com>
	<alpine.LNX.2.00.1008201656030.5745@asterix.crazy-teaparty.dyndns.org>
	<AANLkTime=tuSZNkBnM6XacjEC2Nucix0UtWTJ1VehOsr@mail.gmail.com>
	<alpine.LNX.2.00.1008231134030.5745@asterix.crazy-teaparty.dyndns.org>
Date: Mon, 23 Aug 2010 22:07:47 +0200
Message-ID: <AANLkTik-1P7AHQnMzWu0c4b=AZeESjV6Gd4mMrXLZjgN@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Rcpt-To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: orphaned files
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
X-List-Received-Date: Mon, 23 Aug 2010 20:08:24 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/8/23 Vitus Jensen <vjensen@gmx.de>:
> On Sat, 21 Aug 2010, Frans Meulenbroeks wrote:

>> Vitus as the owner/maintainer of the recipe do you want me to reinstate
>> 1.8.28 ?
>
> Yes, please do so.
>
> Afterwards I will move 1.8 and 1.9 to the current versions.
>
> Vitus
>
reverted the patch as requested.

Vitus can you also try to merge the native and non-native recipe
(BBCLASSEXTEBD = "native") and remove the legacy staging?

Thanks, Frans.


