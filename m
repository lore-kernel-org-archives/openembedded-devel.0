Received: from [194.109.24.25] (helo=smtp-vbr5.xs4all.nl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <udovdh@xs4all.nl>) id 1KM17n-0002ZZ-Fx
	for openembedded-devel@openembedded.org; Thu, 24 Jul 2008 15:44:55 +0200
Received: from surfplank2.hierzo (pindarots.xs4all.nl [80.101.128.228])
	(authenticated bits=0)
	by smtp-vbr5.xs4all.nl (8.13.8/8.13.8) with ESMTP id m6ODhcIq008882
	for <openembedded-devel@openembedded.org>;
	Thu, 24 Jul 2008 15:43:40 +0200 (CEST)
	(envelope-from udovdh@xs4all.nl)
Message-ID: <48888709.40906@xs4all.nl>
Date: Thu, 24 Jul 2008 15:43:37 +0200
From: Udo van den Heuvel <udovdh@xs4all.nl>
User-Agent: Thunderbird 2.0.0.14 (X11/20080501)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <200807240048.20980.bluelightning@bluelightning.org>	<g69aeh$5cu$1@ger.gmane.org>	<1404.78.86.188.127.1216886903.squirrel@webmail12.pair.com>	<1216890490.6103.1.camel@dax.rpnet.com>
	<48887DC7.3030603@xs4all.nl>
	<1216905807.6103.32.camel@dax.rpnet.com>
In-Reply-To: <1216905807.6103.32.camel@dax.rpnet.com>
X-Enigmail-Version: 0.95.2
OpenPGP: id=8300CC02
X-Virus-Scanned: by XS4ALL Virus Scanner
Subject: Re: PATCH: make h2200-bootloader load & depend on mtdblock
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Thu, 24 Jul 2008 13:44:55 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Richard Purdie wrote:
> On Thu, 2008-07-24 at 15:04 +0200, Udo van den Heuvel wrote:
>> Richard Purdie wrote:
>>> Yes, its standard practise to RRECOMMEND kernel modules since if they're
>>> built into the kernel you get build failures otherwise. The RRECOMMEND
>>> is a standard approach and well tested.
>> Apart from this discussion, sorry to interrupt, but does mtdchar
>> 9related to mtdblock I guess) actually work?
>> On my H2200('s) it fails to properly flash a kernel.
>> It doesn't matter much now because we boot from SD, but nevertheless it
>> is strange.
>> The mtd folks refuse to help me when I repeatedly queried them.
> 
> Yes, mtdchar usually works.

'usually' sounds atypical here:

http://bugs.openembedded.net/show_bug.cgi?id=4354
but also:
http://bugs.openembedded.net/show_bug.cgi?id=4324
and:
http://bugs.openembedded.net/show_bug.cgi?id=4362

So a whole slew of flash-related issues, all based on mtd-related code.
My ipaq ran win2003 mobile fine.

> It may not do exactly what you expect though

That is what I observe, others see similar issues.

Udo


