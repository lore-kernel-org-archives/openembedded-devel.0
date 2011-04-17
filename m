Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1QBRAU-0001rJ-3f
	for openembedded-devel@lists.openembedded.org;
	Sun, 17 Apr 2011 14:33:34 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 040C53150329
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Apr 2011 14:31:15 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id nUrn9mjdcYY0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Apr 2011 14:31:09 +0200 (CEST)
Received: from [172.22.22.61] (drms-4d014738.pool.mediaWays.net [77.1.71.56])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.multimedia-labs.de (Postfix) with ESMTPSA id 8EDCF3150260
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Apr 2011 14:31:09 +0200 (CEST)
Message-ID: <4DAADD8D.6060708@opendreambox.org>
Date: Sun, 17 Apr 2011 14:31:09 +0200
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.15) Gecko/20110411 Lightning/1.0b2 Thunderbird/3.1.9
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4DA97D88.9020509@atmel.com>
In-Reply-To: <4DA97D88.9020509@atmel.com>
Subject: Re: undefined reference to `__gnu_thumb1_case_uqi'
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
X-List-Received-Date: Sun, 17 Apr 2011 12:33:34 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 04/16/2011 01:29 PM, Ulf Samuelsson wrote:
> The following code, (part of a bootloader - at91bootstrap-3.0)
> 
> "void sub(unsigned char Mode)
> {
>     switch (Mode) {
>     ...
>     /* 4 case statements */
> "
> 
> generates an error when compiling in thumb mode, using the latest OE.
> 
> "undefined reference to `__gnu_thumb1_case_uqi'"
> 
> I think this subroutine will optimize a switch statment
> with only a few choices.
> 
> 
> Googling for this seems to indicate that __gnu_thumb1_case_uqi is part
> of libgcc, but hidden.
> 
> Switches used: -DCONFIG_THUMB -mthumb -mthumb-interwork
> 
> Any clues on fixing this?
> Meanwhile I will rewrite the bootloader using if statements

Does adding -ffreestanding help?

Regards,
Andreas


