Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PJ9HL-0004T2-2x
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Nov 2010 19:32:15 +0100
Received: by gyf3 with SMTP id 3so2141677gyf.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Nov 2010 10:31:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=bx9/fVaF4PiIN9ErNkGDRSiyE37Vc2hxujSOMsPjCas=;
	b=XbylofrSg5m+LunoGJW0dJnt4jK6CqOn1V/cidpjXJf3iHFa+zqGRPWzsVqC392aJ3
	KECMXTtnAkpwZqz9BtpWO698p4j8qgpppsy72m/t70rxcDcGwh7+NOZ/Cb8V5G5P1A8R
	BpA0n2S7vWNkrXlUXvLhtw8aIAUBoK44cBJ7U=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=pdKk0wZtaAaktsJEi223yoFhNuf0WEJJsCe8e3+k2UYgMD7dUNGDTBmZRe68SlHCKV
	QziUpRN8i2AWWYxtd17Ch6/VnePkJL8V+kPfDzx9VbDNOUXx/iZM7rUjsCzCsfMRAn2x
	mwoJpMBvN/YYjZ7nt35dn1e7EHDRkZ9FTN9OM=
Received: by 10.91.47.38 with SMTP id z38mr1450766agj.129.1290105059302; Thu,
	18 Nov 2010 10:30:59 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.120.8 with HTTP; Thu, 18 Nov 2010 10:30:39 -0800 (PST)
In-Reply-To: <4CE4EC1E.50903@gmail.com>
References: <4CE3D70F.2000101@gmail.com>
	<AANLkTin0i5rSxwA8Q3+jN7tLR-Rn3JEei6D==1CjKOh9@mail.gmail.com>
	<4CE3EF4C.2050105@gmail.com>
	<AANLkTin2v1+3UP_rk593i+V4=e4QeKgPinAkoWNwY0BO@mail.gmail.com>
	<4CE42FF0.1000702@mentor.com> <4CE4EC1E.50903@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 18 Nov 2010 10:30:39 -0800
Message-ID: <AANLkTi=cnG0DyVCmJjKrBEqR4AQgTVVn_ugHyUY194gF@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Error: git was compiled without libcurl support
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
X-List-Received-Date: Thu, 18 Nov 2010 18:32:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 18, 2010 at 1:04 AM, Marco Cavallini <koansoftware@gmail.com> w=
rote:
> Tom Rini ha scritto, Il 17/11/2010 20:41:
>> On 11/17/2010 12:30 PM, Khem Raj wrote:
>>> On Wed, Nov 17, 2010 at 7:05 AM, Marco
>>> Cavallini<koansoftware@gmail.com> =C2=A0wrote:
>>>> Frans Meulenbroeks ha scritto, Il 17/11/2010 15:01:
>>>>> 2010/11/17 Marco Cavallini<koansoftware@gmail.com>:
>>>>>> Hi, I just tried installing OE retrieving it from git
>>>>>> git clone git://git.openembedded.org/openembedded
>>>>>>
>>>>>> bitbake version 1.10.0
>>>>>> branch master
>>>>>> MACHINE=3Dakita time bitbake minimal-image
>>>>>> DISTRO =3D "angstrom-2008.1"
>>>>>> host machine : Debian lenny x86_64-linux
>>>>>>
>>>>>> I face to an unexpected error
>>>>>> "Error: git was compiled without libcurl support"
>>>>>>
>>>>>> I successfully built it until November 2nd but since last Saturday I
>>>>>> wonder if it should build or if is normal this behavoiur.
>>>>>> log: http://paste.ubuntu.com/533450/
>>>>>>
>>>>>
>>>>> you're using git from the host, guess that got changed one way or
>>>>> another.
>>>>>
>>>>
>>>> Frans,
>>>> thank you for answering.
>>>>
>>>> I tried removing ASSUME_PROVIDED git-native from my config (local.conf=
)
>>>> in this case bitbake create git and use it instead of the host provide=
d.
>>>> Then I did
>>>>
>>>> =C2=A0 bitbake -b git-native
>>>>
>>>> Anyway there are errors again
>>>> http://tinderbox.openembedded.net/packages/985559/
>>>>
>>> can you post your local.conf and additionally what version of autoconf
>>> is installed on your build host.
>>
>> On IRC we confirm that debian/lenny (on 64bit) has a git bug atm.
>>
>
> Here is my workaround, if you are using Debian Lenny as host distro
> please read this carefully
> http://www.kaeilos.com/debian-lenny-and-git-native
>
> Suggestions would be appreciated.

why not just use git-native ?


