Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1SLCA3-0001To-No
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Apr 2012 13:37:59 +0200
Received: by wgbdr12 with SMTP id dr12so7987155wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Apr 2012 04:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=YY3cxcaoVRcFUYQKCbic2py9/fczXBe+oQnpCT4rFbk=;
	b=EgfxLFhZlN3RsIYDOVevi30l79igw7Gglbg7EpuJkEuo6bKhEfQZDLg40xh8ySQZgY
	4T3PZ1X9egGelahc9ltx5q12kruQyAdtbt2P44HBl2gRF8RKSwZQlxw5haLd2/5vI2GC
	M/aEJV2nHWxuVQOYpn/OJ8auCgQ5LHdUcSALO8pbBN6LcvKtITcKmHIb+T6i2iGQNlor
	AcIy7gDSlSoDlmE9shkfXFbyhneYZJRJbx6wL2fx6TpnC3Pw/g19hlRCZph2SXOVP1xg
	76kPzzSzp/XYzgTDgnAwPUJP0ABn1KUsv0Ci0YkSAdjXfR8aOOgkGuYAyIISHM9VhSez
	hSxw==
MIME-Version: 1.0
Received: by 10.216.132.40 with SMTP id n40mr3606068wei.68.1334921310000; Fri,
	20 Apr 2012 04:28:30 -0700 (PDT)
Received: by 10.223.14.149 with HTTP; Fri, 20 Apr 2012 04:28:29 -0700 (PDT)
In-Reply-To: <jmrfan$q6g$1@dough.gmane.org>
References: <CAGiJk9c8ThXrLqsrgYQb03hShObTJynt+fxsRxG9VzYOkOsyUg@mail.gmail.com>
	<jmmst9$r5o$1@dough.gmane.org>
	<CAGiJk9e4vZoO1d1cCbh8Lq26m6h3M5rrOOe40CS1ov2VHqh9eQ@mail.gmail.com>
	<jmomha$co7$1@dough.gmane.org>
	<CAGiJk9fy3p550fUxadQUYmahhx4DVRYeEt_GDYgjBhMVpHzBMw@mail.gmail.com>
	<jmpg5o$52s$1@dough.gmane.org> <jmqsdv$ic7$1@dough.gmane.org>
	<CAGiJk9eh0KqA-qE96uc5BwHOu9n7VmGuZzgWcAisa+HhjGagzQ@mail.gmail.com>
	<jmrdgc$cq4$1@dough.gmane.org>
	<CAGiJk9cexZwA0SY5gSfpbMctg4wzjxZ6BAUxZgkY6ApR93SuAg@mail.gmail.com>
	<jmrfan$q6g$1@dough.gmane.org>
Date: Fri, 20 Apr 2012 13:28:29 +0200
Message-ID: <CAGiJk9eBf_d5pOZtL_Vrmb7aisGBadSzA36yohZJbO7MTPPnFw@mail.gmail.com>
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
X-List-Received-Date: Fri, 20 Apr 2012 11:38:00 -0000
Content-Type: text/plain; charset=UTF-8

2012/4/20 Koen Kooi <koen@dominion.thruhere.net>:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Op 20-04-12 12:45, Samuel Stirtzel schreef:
>> 2012/4/20 Koen Kooi <koen@dominion.thruhere.net>:
>>> -----BEGIN PGP SIGNED MESSAGE----- Hash: SHA1
>>>
>>> Op 20-04-12 09:59, Samuel Stirtzel schreef:
>>>> 2012/4/20 Koen Kooi <koen@dominion.thruhere.net>: Op 19-04-12 18:57,
>>>> Koen Kooi schreef:
>>>>>>> Op 19-04-12 16:03, Samuel Stirtzel schreef:
>>>>>>>> 2012/4/19 Koen Kooi <koen@dominion.thruhere.net>: Op
>>>>>>>> 19-04-12 11:09, Samuel Stirtzel schreef:
>>>>>>>>>>>>> Feel free to comment on the images.
>>>>>>>>>>>>
>>>>>>>>>>>> Giving them a spin now :)
>>>>>>>>>>>
>>>>>>>>>>> Thanks.
>>>>>>>>>>>
>>>>>>>>>>> Just to let you know: Yesterday I accidentally added
>>>>>>>>>>> "inherit allarch" to kde-wallpapers, this will produce
>>>>>>>>>>> an error, I want to push my patch for this but
>>>>>>>>>>> Gitorious seems to be down.
>>>>>>>
>>>>>>>> Gitorious is down a lot, which is (partly) why I switched
>>>>>>>> away from it.
>>>>>>>
>>>>>>>>>>> Removing allarch from kde-wallpapers will do the
>>>>>>>>>>> trick.
>>>>>>>
>>>>>>>> I'll update the repo in a minute. Some other things I ran
>>>>>>>> into:
>>>>>>>
>>>>>>>> * rasqal needs PARALLEL_MAKE = ""
>>>>>>>
>>>>>>>>> Done, committed it to master.
>>>>>>>>> (68edc1551c703bd83a60aa05edb898a7bdfa9ff9 if anyone wants
>>>>>>>>> to cherry-pick)
>>>>>>>
>>>>>>>> * soprano-native is needed for the onto2something binary, I
>>>>>>>> did 'yum install soprano' instead
>>>>>>>
>>>>>>>>> Which recipe is failing with the soprano-native error? The
>>>>>>>>> kdelibs4-native recipe should only optionally depend on
>>>>>>>>> it.
>>>>>>>
>>>>>>> I forgot which recipe, sorry. I do managed to build the images
>>>>>>> after a few tries. There were some more PARALLEL_MAKE and/or
>>>>>>> missing DEPENDS related problems, but rerunning the build a
>>>>>>> few times made those go away. The buildhistory output:
>>>>>>> https://github.com/Angstrom-distribution/buildhistory/commit/c4790bbe1534c8c536f6cacf509d93b14cf6050c
>>>>
>>>>>>>
>>>>>
>>>>>>>
> The diff from my buildhistory installed-packages.txt looks good.
>>>>> Although it seems like I have "some" strange kernel module
>>>>> installed [1].
>>>>
>>>>> The "+kde-wallpapers" and other shows that you have it installed in
>>>>> the image while I installed it as package when I noticed it was
>>>>> missing, so it is alright.
>>>>
>>>>
>>>> The
>>>>>>>
>>>> binaries don't run, lots of missing symbols to SessionManagement, do
>>>> I need to build qt4-x11 differently (apart from the GLES changes I
>>>> forgot)?
>>>>
>>>>> The qt4-x11-free_4.8.0.bbappend [2] should have done that. I can
>>>>> look into it if you provide the log.do_configure for kdelibs4.
>>>>
>>>>> At the first glance it looks like the .bbappend needs a PRINC, you
>>>>> could verify that with grep "-no-accessibility -no-sm" in your
>>>>> qt4-x11-free logfile dir.
>>>
>>> That probably it, I had already built qt4.
>>
>> Pushed a commit, 244b03bb14a0d4646861df6e9952c03fea84e21e if you want to
>> cherry pick it.
>>
>> Currently working on a cmake cross compilation issue, as side effect it
>> could resolve the PARALLEL_MAKE problems too.
>
> I think the bbappend needs to do:
>
> PRINC := "${@int(PRINC) + 1}"
>
> instead of
>
> PRINC = "1"
>
> Since meta-oe has a bbappend as well (patches to fix that will show up soon)

Done,
thanks for pointing that out.


-- 
Regards
Samuel


