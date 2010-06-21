Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OQghS-0003fP-KI
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 Jun 2010 15:06:11 +0200
Received: by fxm18 with SMTP id 18so1862314fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Jun 2010 06:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=iffLel2VqqnkoayYi4/+vk7hk+ksydzcDNijvWwq0fs=;
	b=CT2tbsuBLuOI1IC6gNXyKeb9ARzywB9wbGQx5IbVhstkHt1EzUKVk1KC0MBxomnNgS
	gRdYE6RSoD+jS9Oib4uhoXZxkUxOE02IkTPwDBxffEUx6Wlx/mSsZEkxtUsB42HqExj5
	D1UC/YsdQOO6dHI8gwq/84AvtTkOgUap++8CQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=Bp9e5gbhGVjiS7tLjHwwMuNz6HCRno6kM7r1RPLoAwfueVwWa/nXpXlMe8g9u4mpxV
	uA4ygPl5CHTtHKvGf4j5WcfqdCDzHA6+bi3STFD3nWITro3RHZAieRInDNujsEfOvG6U
	dcjhksbi3DbMxjljfAg1/JG7jMO0Jy5LT5V/A=
MIME-Version: 1.0
Received: by 10.204.162.143 with SMTP id v15mr1439948bkx.15.1277125292287; 
	Mon, 21 Jun 2010 06:01:32 -0700 (PDT)
Received: by 10.204.77.132 with HTTP; Mon, 21 Jun 2010 06:01:32 -0700 (PDT)
In-Reply-To: <AANLkTimOqdguwX_c_wTR3mhBBVfjhSjf245UlWWTHOIA@mail.gmail.com>
References: <AANLkTinfB8ijBzNHOoUSbkYIE-9Fug4nc-HOP8EICHzA@mail.gmail.com>
	<AANLkTimOqdguwX_c_wTR3mhBBVfjhSjf245UlWWTHOIA@mail.gmail.com>
Date: Mon, 21 Jun 2010 15:01:32 +0200
Message-ID: <AANLkTilEChqx75xF5OTrvvom3aX9-3oLR9oCg7-AO2Yc@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: linux-libc-headers-native, gcc-cross issue
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
X-List-Received-Date: Mon, 21 Jun 2010 13:06:11 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/6/21 Khem Raj <raj.khem@gmail.com>:
> On Sun, Jun 20, 2010 at 1:51 PM, Frans Meulenbroeks
> <fransmeulenbroeks@gmail.com> wrote:
>> Dear all,
>>
>> After the introduction of linux-libc-headers-native I've bumped into
>> the following issue.
>> linux-libc-headers-native installs unistd.h in sysroots
>> This causes other recipes to pick up the x86 files instead of the target=
 ones.
>> I've seen this happen for both unistd.h and sigcontext.h
>>
>> One of the recipes suffering from this is gcc-cross (for some architectu=
res).
>> Reason is that files are compiled with
>> -I/home/frans/oe/tmp_angstrom/sysroots/i686-linux/usr/include whereas
>> the target specific includes are added with -isystem.
>> This causes the -I to win.
>
> right. gcc-cross is a special case where its not building purely cross
> binaries but
> also making libraries and objects that will run on the target. This
> problem probaly
> is seen when building startup objects =A0(crt*.o). This path is added by
> gcc build
> machinery as a path where it finds gmp headers. I suspect that gcc build =
should
> not be passing this in the incudes when building target stuff.
>
> I think with sysroot using -isystem<target_headers> should not be needed.

It is not the -isystem that is the problem. as stated above there is
an explicit -I to sysroots/i686-linux that is causing the problem.
This dir used to be unpopulated (or maybe even non-existing), butwith
linux-libc-headers-native it became populated and as it got precedence
the dir wins.
I have no idea how to remove the -I dir (and also no idea if it is ok).

The problem only occurs in .../gcc/config/${ARCH}/
typical issue where this happens is linux_unwind.h This includes
<signal.h> to get <sigcontext.h> and eventually the typedef for
sigcontext.
However sigcontext is of course archtecture specific so if one picks
up the wrong signal.h it does not work.

The unistd.h problem is probably specific for the nios2 variant, in
which an additional system call is defined, which of course is not
present in the x86 unistd.h

Frans

>
>
>>
>> In the past sysroots/i686-linux/usr/include was empty, but with
>> linux-libc-headers-native it gets populated causing the files in there
>> to be used instead of the ones in the target ones.
>> By setting linux-libc-headers-native to ASSUME-PROVIDED and cleaning
>> and rebuilding TMPDIR I was able to avoid the problem.
>
> yeah this masked the problem as it has been masked till now.
>
>>
>> However, I think this needs a more structural solution.
>> Suggestions are appreciated.
>
> We should explore if passing this isystem in CFLAGS is needed at all.
> if not then we should remove it.
>
>>
>> Frans.
>>
>> PS: it might also be that other files suffer from this, but until now
>> I only had problems with gcc-cross
>
> could be but I doubt.
>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


