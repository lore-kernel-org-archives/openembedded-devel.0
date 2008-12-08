Received: from [195.65.72.27] (helo=bagnes.atmel.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1L9jHZ-00076q-84
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Dec 2008 17:48:29 +0100
Received: from fribh01.corp.atmel.com (FRIBH01 [10.175.30.10])
	by bagnes.atmel.com (8.13.8+Sun/8.13.8) with ESMTP id mB8Gdx81001526
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 8 Dec 2008 08:39:59 -0800 (PST)
Received: from frimb01.corp.atmel.com ([10.175.30.12]) by
	fribh01.corp.atmel.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 8 Dec 2008 17:44:35 +0100
Received: from aeglos ([172.24.49.32]) by frimb01.corp.atmel.com with
	Microsoft SMTPSVC(6.0.3790.3959); Mon, 8 Dec 2008 17:44:33 +0100
Message-ID: <4B4AD5DB834948B0A7AC3D8B722645A6@aeglos>
From: "Ulf Samuelsson" <ulf.samuelsson@atmel.com>
To: <openembedded-devel@lists.openembedded.org>
References: <C41AF57F04424526AD798F542197E674@aeglos><493D1A83.1070500@balister.org><48239d390812080508p7585f22bo529c8a5ebf2f438e@mail.gmail.com><8162086526F74198823FA0003D5FA08D@aeglos>
	<48239d390812080709l2051390en9ec07e495eff560e@mail.gmail.com>
Date: Mon, 8 Dec 2008 17:26:42 +0100
MIME-Version: 1.0
X-Priority: 3
X-MSMail-Priority: Normal
X-Mailer: Microsoft Outlook Express 6.00.2900.5512
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2900.5579
X-OriginalArrivalTime: 08 Dec 2008 16:44:34.0124 (UTC)
	FILETIME=[3FEAB0C0:01C95954]
Subject: Re: Request for a personal git tree for AT91/AVR32
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
X-List-Received-Date: Mon, 08 Dec 2008 16:48:29 -0000
Content-Type: text/plain; format=flowed; charset="iso-8859-1";
	reply-type=original
Content-Transfer-Encoding: 7bit

> On Mon, Dec 8, 2008 at 4:44 PM, Ulf Samuelsson <ulf.samuelsson@atmel.com> 
> wrote:
>> I ran into a problem that linux would not build because if you
>> use linux and request UIMAGE, then you fail because
>> u-boot-mkimage is not available.
> Well, u-boot native tools are built perfectly now, and uImages
> work. Try to build for afeb9260 machine, and see for yourself.
> I tried that yesterday, it works perfectly.
>

If you can't download the source you can't build the tools.
It used the backup location which does not have a git server.
Obviously it could be a temporary problem with the main
location, but it is probably a bug trying to use the backup location.

If a "stable" version is used, then the backup location can contain the same 
source code.

Anyway , If it normally works, then I do not need to add it!

If people have problem, does it hurt that u-boot-1.3.4 is supported as well?

I checked with the AT91 group and they have been spending quite
some time to test and verify 1.3.4 on a multitude of boards so
it does make sense to have this supported.

Is the "personal" git tree really personal, or can you have
a git tree which is available to a group?

It makes sense for me to have an "atmel" group which I
could share with other interested atmel employees.

Who is making decisions on access?

Best Regards
Ulf Samuelsson


>>
>> I then made the linux recipy depend on the u-boot native tools,
>> and then u-boot.git was selected and oe tried
>> to do git access to www.angstrom-distribution.org or something similar.
>> I do not know why, and could not figure out why it did so.
>>
>> That is why I wrote the new recipy.
>>
>>> so I don't see real point in using versioned approach.
>>
>> If you want to add patches they may or may not be broken by a later git
>> version.
>> It is more important to have something which has been tested and 
>> validated
>> than the latest stuff.
>>
>> I agree that it would have been better to use the 2008.10 though.
> Wel, look at u-boot_git.bb, it has tags fixed for some machines, and
> apply patches too. I never had problems with it. That could save you
> lots of time.
> you can fix versions by providing git commit hashes in SRC_URI. Look
> at mentioned
> u-boot_git on how this is done.
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 




