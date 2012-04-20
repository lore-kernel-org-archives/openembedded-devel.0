Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1SLBU5-0008L1-7X
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Apr 2012 12:54:37 +0200
Received: by wera1 with SMTP id a1so6074440wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Apr 2012 03:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=+6JtG/VS1anHW8iY/L/mvyE3kx+BqAgYpgVD6tfBXxE=;
	b=NYgiUXiucsYZWDmQFzOokn2ydSjhO4Y/OTbUiXtV36ZwGNA47WGX1UeMPChADQhzYZ
	3/nP+O8QIy1PeBwjEkcAmPQ3lgIzqLSbdZN/279Q/YcEe96X23cmWLZbM4aqzJ1QHaxY
	4khrYKaSL7cmR8JkEWYNCs0z/SLj0ZR/doHTok/MwpyeKZo1W8eIP8L+qCiyoS1C/ysT
	+FszR9XPch7uqFya/0AMuVKxuu85YbzCHKSa3RGq8UsEpSr4luTNMdpCFvOyHSRrK5Ij
	yRHkoubbHhRKOrYUPV4KWdOf8YjGzLKV9ndhyEoI33nuHI6G7aPsNyLKMpBF8b7M+uHy
	WGdw==
MIME-Version: 1.0
Received: by 10.180.105.69 with SMTP id gk5mr7920272wib.3.1334918707540; Fri,
	20 Apr 2012 03:45:07 -0700 (PDT)
Received: by 10.223.14.149 with HTTP; Fri, 20 Apr 2012 03:45:07 -0700 (PDT)
In-Reply-To: <jmrdgc$cq4$1@dough.gmane.org>
References: <CAGiJk9c8ThXrLqsrgYQb03hShObTJynt+fxsRxG9VzYOkOsyUg@mail.gmail.com>
	<jmmst9$r5o$1@dough.gmane.org>
	<CAGiJk9e4vZoO1d1cCbh8Lq26m6h3M5rrOOe40CS1ov2VHqh9eQ@mail.gmail.com>
	<jmomha$co7$1@dough.gmane.org>
	<CAGiJk9fy3p550fUxadQUYmahhx4DVRYeEt_GDYgjBhMVpHzBMw@mail.gmail.com>
	<jmpg5o$52s$1@dough.gmane.org> <jmqsdv$ic7$1@dough.gmane.org>
	<CAGiJk9eh0KqA-qE96uc5BwHOu9n7VmGuZzgWcAisa+HhjGagzQ@mail.gmail.com>
	<jmrdgc$cq4$1@dough.gmane.org>
Date: Fri, 20 Apr 2012 12:45:07 +0200
Message-ID: <CAGiJk9cexZwA0SY5gSfpbMctg4wzjxZ6BAUxZgkY6ApR93SuAg@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-kde] Test images (was: Re: [OE-core] RFC: Porting KDE Plasma Active (WIP))
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
X-List-Received-Date: Fri, 20 Apr 2012 10:54:38 -0000
Content-Type: text/plain; charset=UTF-8

2012/4/20 Koen Kooi <koen@dominion.thruhere.net>:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Op 20-04-12 09:59, Samuel Stirtzel schreef:
>> 2012/4/20 Koen Kooi <koen@dominion.thruhere.net>: Op 19-04-12 18:57, Koen
>> Kooi schreef:
>>>>> Op 19-04-12 16:03, Samuel Stirtzel schreef:
>>>>>> 2012/4/19 Koen Kooi <koen@dominion.thruhere.net>: Op 19-04-12
>>>>>> 11:09, Samuel Stirtzel schreef:
>>>>>>>>>>> Feel free to comment on the images.
>>>>>>>>>>
>>>>>>>>>> Giving them a spin now :)
>>>>>>>>>
>>>>>>>>> Thanks.
>>>>>>>>>
>>>>>>>>> Just to let you know: Yesterday I accidentally added
>>>>>>>>> "inherit allarch" to kde-wallpapers, this will produce an
>>>>>>>>> error, I want to push my patch for this but Gitorious seems
>>>>>>>>> to be down.
>>>>>
>>>>>> Gitorious is down a lot, which is (partly) why I switched away
>>>>>> from it.
>>>>>
>>>>>>>>> Removing allarch from kde-wallpapers will do the trick.
>>>>>
>>>>>> I'll update the repo in a minute. Some other things I ran into:
>>>>>
>>>>>> * rasqal needs PARALLEL_MAKE = ""
>>>>>
>>>>>>> Done, committed it to master.
>>>>>>> (68edc1551c703bd83a60aa05edb898a7bdfa9ff9 if anyone wants to
>>>>>>> cherry-pick)
>>>>>
>>>>>> * soprano-native is needed for the onto2something binary, I did
>>>>>> 'yum install soprano' instead
>>>>>
>>>>>>> Which recipe is failing with the soprano-native error? The
>>>>>>> kdelibs4-native recipe should only optionally depend on it.
>>>>>
>>>>> I forgot which recipe, sorry. I do managed to build the images
>>>>> after a few tries. There were some more PARALLEL_MAKE and/or
>>>>> missing DEPENDS related problems, but rerunning the build a few
>>>>> times made those go away. The buildhistory output:
>>>>> https://github.com/Angstrom-distribution/buildhistory/commit/c4790bbe1534c8c536f6cacf509d93b14cf6050c
>>
>>>>>
>>> The diff from my buildhistory installed-packages.txt looks good.
>>> Although it seems like I have "some" strange kernel module installed
>>> [1].
>>
>>> The "+kde-wallpapers" and other shows that you have it installed in the
>>> image while I installed it as package when I noticed it was missing, so
>>> it is alright.
>>
>>
>> The
>>>>>
>> binaries don't run, lots of missing symbols to SessionManagement, do I
>> need to build qt4-x11 differently (apart from the GLES changes I
>> forgot)?
>>
>>> The qt4-x11-free_4.8.0.bbappend [2] should have done that. I can look
>>> into it if you provide the log.do_configure for kdelibs4.
>>
>>> At the first glance it looks like the .bbappend needs a PRINC, you
>>> could verify that with grep "-no-accessibility -no-sm" in your
>>> qt4-x11-free logfile dir.
>
> That probably it, I had already built qt4.

Pushed a commit,
244b03bb14a0d4646861df6e9952c03fea84e21e if you want to cherry pick it.

Currently working on a cmake cross compilation issue, as side effect
it could resolve the PARALLEL_MAKE problems too.


-- 
Regards
Samuel


