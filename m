Return-Path: <otavio.salvador@gmail.com>
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com
	[209.85.220.54])
	by mail.openembedded.org (Postfix) with ESMTP id AA70874056
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jun 2015 20:23:18 +0000 (UTC)
Received: by pacyx8 with SMTP id yx8so43969598pac.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jun 2015 13:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=X7cjnDht++zheGDnhbp6mC7RauETiy+xXVCwDA5s15o=;
	b=nF/6RZq3nw3dEEIvcd8EopWjxKaXiETfxgrGpd7ZGyLH7nFPDr/Hr+wWGGIcPIlhrI
	PMg5GZaMJ/3YqaP43xmi+2nfhnHmXxex45LSmWlH7JCtVnwY9N4kfdK+e2VEJdO6ti1y
	sj5+2TqnLCM9VYIp2P7r+s5J56HBCAbGmfKUxTYLsqYUJajxZL9xiEGfWRS4xXGW2Wkb
	Jukf+pwjqeIl4y2QFLVScVGY6olq8S8Ot66q2GqZptF9dl0MVe4Ma2f6TEh9n/2L2h5L
	Z9vC9wyTwah7G638hLQBCbnFBp1GHoP9tPJxuFdDIX58S/qQHbarf3eR0u4oqaQGvjJG
	9kvw==
MIME-Version: 1.0
X-Received: by 10.68.108.65 with SMTP id hi1mr14132504pbb.129.1434572600306;
	Wed, 17 Jun 2015 13:23:20 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.70.34.109 with HTTP; Wed, 17 Jun 2015 13:23:20 -0700 (PDT)
In-Reply-To: <1434572301.2944.16.camel@Saturn.local.all>
References: <CALbNGRSo5g0ndeQTmrKYppX6g6-KTB2CrnDjJCs=d84PxnpQPQ@mail.gmail.com>
	<55818938.3090405@mlbassoc.com>
	<1434572301.2944.16.camel@Saturn.local.all>
Date: Wed, 17 Jun 2015 17:23:20 -0300
X-Google-Sender-Auth: KOKzjbzapCzVjcjV63L5fLxHbTs
Message-ID: <CAP9ODKpE1AAOQoFNk6StdHGpvtJrzOoVX-3xju7c-wzD602WkQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: Gary Thomas <gary@mlbassoc.com>
Subject: Re: [meta-browser] firefox not working for me (only)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 17 Jun 2015 20:23:20 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jun 17, 2015 at 5:18 PM, Max Krummenacher <max.oss.09@gmail.com> wrote:
>> > * firefox fails with illeagal ARM instruction
>
> That sounds familiar, I thought then that it was specific to our setup
> with the binary Tegra X driver and the armv7a without neon setup, that's
> why I did not upstream my patches.
>
>> > On Wed, Jun 17, 2015 at 3:32 PM, Gary Thomas <gary@mlbassoc.com> wrote:
>> >>> Hmm - I was wondering why nobody took care.
>> >>>
>> >>> All my plattforms fail:
>> >>> * i.MX6 base
>> >>> * gumstix
>> >>> * raspberry Pi2
>> >>>
>> >>> I'll put this browser issue on my TODO currently I have no further
>> >>> time to take care.
>> >>
>> >>
>> >> BTW, I just tested both chromium and firefox on the i.MX6Q and RPi2
>> >> and they worked just fine.  Built from meta-browser:0cc0419a
>> >>
>> > Thanks for information. Let's focus on firefox's illegal ARM
>> > instruction crasher:
>> >
>> > * Last time I felt the only one facing a specific error it was caused
>> > by angstrom enabling thumb(2) for ARM (long story @meta-fsl-arm).
>> > Gary: I assume, you don't have thumb enabled - right?
>> > * firefox doesn't crash with "--safe-mode"
>>
>> I am not using thumb - off the shelf configurations for RaspberryPi2 and
>> BoundaryDevices nitrogen6x built with $DISTRO=poky are the ones I've tested.
>>
> Actually I use Angstrom with the instruction set defaulting to ARM.
>
>> >
>> > Looking into meta-browser I saw that firefox pins ARM_INSTRUCTION_SET
>> > = "arm" but firefox-l10n does not. When having some time left over
>> > (=never) I will test with thumb disabled for firefox-l10n and
>> > chromium.
>> >
>> > Andreas
>
> Have a look at
> http://git.toradex.com/cgit/meta-toradex.git/tree/recipes-mozilla/firefox?h=V2.4-next
>
> alignment.patch,
> Prevent-SIGILL-crashes-on-ARMv6-builds-built-with-the-NDK_10.0esr.patch .
>
> If usefull I could send a patch for meta-browser.

An upgraded version would be awesome :-)

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

