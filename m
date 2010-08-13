Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <coolaj86@gmail.com>) id 1Ok2No-0004pr-IQ
	for openembedded-devel@lists.openembedded.org;
	Sat, 14 Aug 2010 00:05:52 +0200
Received: by fxm6 with SMTP id 6so2141637fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Aug 2010 15:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=CdklbTHtnxtjJdfcGpY3LtWcXczQO3L4t4+1DiUJ61k=;
	b=iXLcTVhdV1/W3pF2cD13bOqSUzvj/ldc7+tT30RaZXA2eKzwvUWsMmbzdBTT6z9rsS
	WOzFBM2QzGOEja0XJOWg8AD/tLBTCvpFAQFyaHhYHhxk44RfYBhOM4zuFkw7XzbkUqje
	u1FTmtlMQpllQwTVepOUzdZlRTcuq83CuO/A4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=VCs1Mbyn272TUvpSC8XtkPwlE+1L1AOOvl5VXA1k3dgWZeCuY33jZlkW7Pudc7XPM1
	RWa0KI5ZTHP6Hm3DpabkoJqQ+LoRw5bH9Dl25I/j3I7jjevHU7TMWs1AGQl0GbiR8dsW
	wghHgdYybDrPNlnMoH4NDh0ECQ5Hb3W0vx8Ws=
Received: by 10.223.104.145 with SMTP id p17mr2673490fao.34.1281737134173;
	Fri, 13 Aug 2010 15:05:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.125.209 with HTTP; Fri, 13 Aug 2010 15:05:14 -0700 (PDT)
In-Reply-To: <4C65BA04.9020908@mentor.com>
References: <AANLkTi=haC49V6XnCQpBCY8ickT24PL1F0sKYoh8h6=J@mail.gmail.com>
	<4C65BA04.9020908@mentor.com>
From: AJ ONeal <coolaj86@gmail.com>
Date: Fri, 13 Aug 2010 16:05:14 -0600
Message-ID: <AANLkTim0dxLN000-oqvGbeaBdLTs7P6=9ZVDBfGn4LuA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: coolaj86@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
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
X-List-Received-Date: Fri, 13 Aug 2010 22:05:52 -0000
Content-Type: text/plain; charset=ISO-8859-1

Actually, that's what I did. I just typed it wrong when I put it in the
e-mail. There is no non-native sgmlspl package.

AJ ONeal

On Fri, Aug 13, 2010 at 3:32 PM, Tom Rini <tom_rini@mentor.com> wrote:

> AJ ONeal wrote:
>
>> This is with a fresh install of oe and bitbake (as per the gumstix docs)
>>
>> |
>>
>> /mnt/data/Code/overo-oe/tmp/sysroots/i686-linux/usr/armv7a/lib/gcc/arm-angstrom-linux-gnueabi/4.3.3/../../../../arm-angstrom-linux-gnueabi/bin/ld:
>> warning: libc.so, needed by
>>
>> /mnt/data/Code/overo-oe/tmp/sysroots/i686-linux/usr/armv7a/lib/gcc/arm-angstrom-linux-gnueabi/4.3.3/../../../../arm-angstrom-linux-gnueabi/lib/libgcc_s.so,
>> not found (try using -rpath or -rpath-link)
>> | make -C doc man
>> | make[1]: Entering directory
>>
>> `/mnt/data/Code/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/iputils-20071127-r1/iputils_20071127.orig/doc'
>> | /bin/sh: sgmlspl: command not found
>> | make[1]: *** [arping.8] Error 127
>> | make[1]: Leaving directory
>>
>> `/mnt/data/Code/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/iputils-20071127-r1/iputils_20071127.orig/doc'
>> | make: *** [man] Error 2
>> | FATAL: oe_runmake failed
>>
>>
>> The problem is not solved by
>> bitbake -c clean iputils; bitbake sgmlspl; bitbake iputils
>>
>
> You would need to do bitbake sgmlspl-native ; bitbake iputils, to get
> sgmlspl that runs on the host.  sgmlspl-native will bring in perl-native
>  and some other stuff, FYI.
>
> --
> Tom Rini
> Mentor Graphics Corporation
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

