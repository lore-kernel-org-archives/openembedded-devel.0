Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <coolaj86@gmail.com>) id 1OkIly-0005D9-2e
	for openembedded-devel@lists.openembedded.org;
	Sat, 14 Aug 2010 17:36:05 +0200
Received: by fxm6 with SMTP id 6so2408053fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Aug 2010 08:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=ZYv2amem0qvgu6A6AaElNRjVYaCiUz+LjGLL6hh/oYc=;
	b=mJitpd6pMAvJ5WWLMGtegNKE9iYVfYfwqx+pdAap82ewKyaP+CuV71WeBehJL2YNpG
	LAi1mVP+HJUXn58rFNGMdvP2AZMJKtj6Sm7dWPaS6zIR85q2ZEMFiIX1RNoeNjHtNwdS
	OpFueRIO7KV+MI9Y4K86K31AzbRtYwXT+twPg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=XW10emhjVkxKzT6I2xRxfqaPHtz5VwASZgob3LnM7xRLzkMsqRQ3JoEGA4N+cK4FWA
	ysiFQuB8BjQQ6ZnGCmUtnDnlBcXrChQMx98O8pzccfIg2Gghv2PIk8pxnVZ2chaQcr89
	Pe3wwqOInVgI10Y5SH/myebMlk5wR9QD+Bt58=
Received: by 10.223.104.145 with SMTP id p17mr3352145fao.34.1281800122810;
	Sat, 14 Aug 2010 08:35:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.125.209 with HTTP; Sat, 14 Aug 2010 08:35:02 -0700 (PDT)
In-Reply-To: <AANLkTikAY38Wg01czaYa_o3_a2pXg2YcjAL8vbrEUYpL@mail.gmail.com>
References: <AANLkTi=haC49V6XnCQpBCY8ickT24PL1F0sKYoh8h6=J@mail.gmail.com>
	<4C65BA04.9020908@mentor.com>
	<AANLkTim0dxLN000-oqvGbeaBdLTs7P6=9ZVDBfGn4LuA@mail.gmail.com>
	<AANLkTikAY38Wg01czaYa_o3_a2pXg2YcjAL8vbrEUYpL@mail.gmail.com>
From: AJ ONeal <coolaj86@gmail.com>
Date: Sat, 14 Aug 2010 09:35:02 -0600
Message-ID: <AANLkTik8ujUK5vczYTOuoDdjuEEzTuY7_ifxbBnePpN9@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: coolaj86@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: iputils fails to build due to missing sgmlspl
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
X-List-Received-Date: Sat, 14 Aug 2010 15:36:06 -0000
Content-Type: text/plain; charset=ISO-8859-1

I was mistaken. It didn't build iputils. I started over from scratch, built
everything up to iputils, and failed!

sgmlspl wasn't installed correctly (not in the path). I tried:
bash-3.2$
cp $OVEROTOP/tmp/work/i686-linux/sgmlspl-native-1.03ii-r0/SGMLSpm/sgmlspl
$OVEROTOP/tmp/sysroots/i686-linux/usr/bin/

but then got another error:
Can't locate SGMLS/Output.pm in @INC (@INC contains: /etc/perl
/usr/local/lib/perl/5.10.0 /usr/local/share/perl/5.10.0 /usr/lib/perl5
/usr/share/perl5 /usr/lib/perl/5.10 /usr/share/perl/5.10
/usr/local/lib/site_perl .) at
/mnt/data/overo-oe/tmp/sysroots/i686-linux/usr/bin/sgmlspl line 62.

Seeing that is was looking outside of the OE paths and not able to find it,
I gave up.

sudo-apt-get install sgmlspl
bitbake iputils

now it appears to be running...


AJ ONeal
(317) 426-6525


On Fri, Aug 13, 2010 at 6:25 PM, AJ ONeal <coolaj86@gmail.com> wrote:

> Seems that it was a hanging environment issue. I exited from the current
> shell, opened a new one, ran the same thing a third time and it worked.
>
> AJ ONeal
>
>
>
> On Fri, Aug 13, 2010 at 4:05 PM, AJ ONeal <coolaj86@gmail.com> wrote:
>
>> Actually, that's what I did. I just typed it wrong when I put it in the
>> e-mail. There is no non-native sgmlspl package.
>>
>> AJ ONeal
>>
>>
>> On Fri, Aug 13, 2010 at 3:32 PM, Tom Rini <tom_rini@mentor.com> wrote:
>>
>>> AJ ONeal wrote:
>>>
>>>> This is with a fresh install of oe and bitbake (as per the gumstix docs)
>>>>
>>>> |
>>>>
>>>> /mnt/data/Code/overo-oe/tmp/sysroots/i686-linux/usr/armv7a/lib/gcc/arm-angstrom-linux-gnueabi/4.3.3/../../../../arm-angstrom-linux-gnueabi/bin/ld:
>>>> warning: libc.so, needed by
>>>>
>>>> /mnt/data/Code/overo-oe/tmp/sysroots/i686-linux/usr/armv7a/lib/gcc/arm-angstrom-linux-gnueabi/4.3.3/../../../../arm-angstrom-linux-gnueabi/lib/libgcc_s.so,
>>>> not found (try using -rpath or -rpath-link)
>>>> | make -C doc man
>>>> | make[1]: Entering directory
>>>>
>>>> `/mnt/data/Code/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/iputils-20071127-r1/iputils_20071127.orig/doc'
>>>> | /bin/sh: sgmlspl: command not found
>>>> | make[1]: *** [arping.8] Error 127
>>>> | make[1]: Leaving directory
>>>>
>>>> `/mnt/data/Code/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/iputils-20071127-r1/iputils_20071127.orig/doc'
>>>> | make: *** [man] Error 2
>>>> | FATAL: oe_runmake failed
>>>>
>>>>
>>>> The problem is not solved by
>>>> bitbake -c clean iputils; bitbake sgmlspl; bitbake iputils
>>>>
>>>
>>> You would need to do bitbake sgmlspl-native ; bitbake iputils, to get
>>> sgmlspl that runs on the host.  sgmlspl-native will bring in perl-native
>>>  and some other stuff, FYI.
>>>
>>> --
>>> Tom Rini
>>> Mentor Graphics Corporation
>>>
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>>
>>
>>
>

