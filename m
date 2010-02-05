Received: from mail-iw0-f193.google.com ([209.85.223.193])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NdSWQ-0002Hd-FX
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Feb 2010 19:03:18 +0100
Received: by iwn33 with SMTP id 33so462717iwn.20
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Feb 2010 10:00:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=zdLR8RABIrRzKvJdxL+GSskK9LyydBKDoBglC35ZzD8=;
	b=UjpfbkvcM5BF38fUnbJNdMBKQEaTnWsh9Mulj4kJMiPRSA+UsheT0oj9Ie27D/SZaW
	Y3fXnD3H+sgfsE3LxaY5MPy/ktOmJ9VK7Lng7WfcE6ZfNB9NloIsULh95NGW0w2Go4Wn
	iEeGTiiboPcO+zuN2BYNZL+6YC5lo/yERs9ZA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=sZMp+r0uY7W4Tao2/FInJDGJDRz+vo6Pv7XpE/YaJ3qNBO169y5vuW2IRYTF1noG4C
	TFTUvPlX6XSBZLpGJH/6IIgK96BMReI//WUGqIFqT/syam72w39nvOpZZgN9haxK0gyZ
	4ELHm94Si7AercRLWnAdHQ7FHsH9DSNH52IPI=
MIME-Version: 1.0
Received: by 10.231.161.69 with SMTP id q5mr2692384ibx.57.1265392839384; Fri, 
	05 Feb 2010 10:00:39 -0800 (PST)
In-Reply-To: <4B6C0F0D.8030308@vollmann.ch>
References: <1497161523.3479291265205781088.JavaMail.root@sz0154a.westchester.pa.mail.comcast.net>
	<4B6C0F0D.8030308@vollmann.ch>
Date: Fri, 5 Feb 2010 10:00:39 -0800
Message-ID: <19c1b8a91002051000r69e645bey7395aa912d38e172@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.193
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: EABI pain and frustration!
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
X-List-Received-Date: Fri, 05 Feb 2010 18:03:18 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 5, 2010 at 4:29 AM, Detlef Vollmann <dv@vollmann.ch> wrote:
> On 02/03/10 15:03, pspreadborough@comcast.net wrote:
>>
>> My 2.6.29 kernel is built with the CodeSourcery
>> arm-2009q3-67-arm-none-linux-gnueabi compiler and has the EABI and
>> OABI_COMPAT config options enabled. Using this kernel I can boot my SA11=
10
>> iPaq into a OABI ramfs with no problems, however if I build a "HelloWorl=
d"
>> executable with the same compiler and try and run it I get an "Illegal
>> Instruction" error. I build the test program using static linking, selec=
t
>> the correct machine type and tune options but to no avail, I always get =
the
>> illegal instruction.

You need gcc 4.4 to get EABI working on ARMv4 and there are additional patc=
hes
to gcc on top of gcc 4.4 see
gcc-armv4-pass-fix-v4bx-to-ld.patch for gcc in OE. So as Koen suggested ear=
lier
if you try with OE compiler you might have better chance of getting it
to work as many
OE devs have tried it.
btw. are you passing march=3Darmv4 to the compiler when doing the compile ?

>
> Just checking: are you sure this is an EABI/OABI problem and not a
> Thumb code problem?
>
> =A0Detlef
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


