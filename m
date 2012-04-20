Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1SL8u9-0002eE-AF
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Apr 2012 10:09:21 +0200
Received: by wibhj13 with SMTP id hj13so327860wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Apr 2012 00:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=DyrRxYKZ8/rosk5ZSuLwDGSilCT7wWKj+mtmWMTj2fg=;
	b=ILDihJDf1ZXw2THIXfzsrITCX83cT2etzfQUI3MaijY9i+RchxIfMi+zB7T/qB9Ti3
	CDgwC+iA3govl0OV11saSoImnTF5CPWBO2CXDJoHNX91bEENQdEWR1doVwV6zFGuvyam
	T9hENR0larMl9xUV9fdY0evtT+I6soMV72zsf1duryC/0UPeLFuuvMD+MFXlZj/2+J6L
	cxeCXJIYBdXEM4QMP+5kNSXOOAAM4oWR4qJ6aFHMBsJkZJAHOej/EQzzXyRILwmnpuqz
	0G1g0meJOPfJcJn5EaHtyusXafQSu1EZMzpuEEKmeUd2H0NLsq2bbomoG4DN489kSA7H
	d6GA==
MIME-Version: 1.0
Received: by 10.216.134.24 with SMTP id r24mr3160877wei.84.1334908792009; Fri,
	20 Apr 2012 00:59:52 -0700 (PDT)
Received: by 10.223.14.149 with HTTP; Fri, 20 Apr 2012 00:59:51 -0700 (PDT)
In-Reply-To: <jmqsdv$ic7$1@dough.gmane.org>
References: <CAGiJk9c8ThXrLqsrgYQb03hShObTJynt+fxsRxG9VzYOkOsyUg@mail.gmail.com>
	<jmmst9$r5o$1@dough.gmane.org>
	<CAGiJk9e4vZoO1d1cCbh8Lq26m6h3M5rrOOe40CS1ov2VHqh9eQ@mail.gmail.com>
	<jmomha$co7$1@dough.gmane.org>
	<CAGiJk9fy3p550fUxadQUYmahhx4DVRYeEt_GDYgjBhMVpHzBMw@mail.gmail.com>
	<jmpg5o$52s$1@dough.gmane.org> <jmqsdv$ic7$1@dough.gmane.org>
Date: Fri, 20 Apr 2012 09:59:51 +0200
Message-ID: <CAGiJk9eh0KqA-qE96uc5BwHOu9n7VmGuZzgWcAisa+HhjGagzQ@mail.gmail.com>
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
X-List-Received-Date: Fri, 20 Apr 2012 08:09:21 -0000
Content-Type: text/plain; charset=UTF-8

2012/4/20 Koen Kooi <koen@dominion.thruhere.net>:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Op 19-04-12 18:57, Koen Kooi schreef:
>> Op 19-04-12 16:03, Samuel Stirtzel schreef:
>>> 2012/4/19 Koen Kooi <koen@dominion.thruhere.net>: Op 19-04-12 11:09,
>>> Samuel Stirtzel schreef:
>>>>>>>> Feel free to comment on the images.
>>>>>>>
>>>>>>> Giving them a spin now :)
>>>>>>
>>>>>> Thanks.
>>>>>>
>>>>>> Just to let you know: Yesterday I accidentally added "inherit
>>>>>> allarch" to kde-wallpapers, this will produce an error, I want
>>>>>> to push my patch for this but Gitorious seems to be down.
>>
>>> Gitorious is down a lot, which is (partly) why I switched away from
>>> it.
>>
>>>>>> Removing allarch from kde-wallpapers will do the trick.
>>
>>> I'll update the repo in a minute. Some other things I ran into:
>>
>>> * rasqal needs PARALLEL_MAKE = ""
>>
>>>> Done, committed it to master.
>>>> (68edc1551c703bd83a60aa05edb898a7bdfa9ff9 if anyone wants to
>>>> cherry-pick)
>>
>>> * soprano-native is needed for the onto2something binary, I did 'yum
>>> install soprano' instead
>>
>>>> Which recipe is failing with the soprano-native error? The
>>>> kdelibs4-native recipe should only optionally depend on it.
>>
>> I forgot which recipe, sorry. I do managed to build the images after a
>> few tries. There were some more PARALLEL_MAKE and/or missing DEPENDS
>> related problems, but rerunning the build a few times made those go
>> away. The buildhistory output:
>> https://github.com/Angstrom-distribution/buildhistory/commit/c4790bbe1534c8c536f6cacf509d93b14cf6050c

The diff from my buildhistory installed-packages.txt looks good.
Although it seems like I have "some" strange kernel module installed [1].

The "+kde-wallpapers" and other shows that you have it installed in
the image while I installed it as package when I noticed it was
missing, so it is alright.

>
> The
>>
> binaries don't run, lots of missing symbols to SessionManagement, do I
> need to build qt4-x11 differently (apart from the GLES changes I forgot)?

The qt4-x11-free_4.8.0.bbappend [2] should have done that.
I can look into it if you provide the log.do_configure for kdelibs4.

At the first glance it looks like the .bbappend needs a PRINC, you
could verify that with grep "-no-accessibility -no-sm" in your
qt4-x11-free logfile dir.

>
> regards,
>
> Koen
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.11 (Darwin)
> Comment: GPGTools - http://gpgtools.org
>
> iQIcBAEBAgAGBQJPkPUHAAoJEHZqAkdh1vT6dfcP/jJmlp/RlOMTuh6NTFe3Dv/3
> r/TDi/vjlasQsI5PJ1e9dyLnJGvsUDXaAJBseTZWzWYJ2a9KTHIqVfuTiolvr8Jv
> 4cMfeKLvoCTBYDlaoTsS8R5aYiQ4TTgntRQRJpyAkitL348cGW867tbbvLg6K+IG
> DVjDAZAf3hXg+DFHNnE99dxHCSAQg9ZizIcPre5VORhHlyGzJZi1yNuRm/KgiUIm
> APBQbQuWd3JbREuOxLftMpARudYsi/+pINH5NQlDRJxkLeW4slT34rUhNF2zjWlR
> XjRzmnADQLvQVN95x7hZiyy7yILhPfRKA6/o1H/bEAYPttPkVfxBfO/qXS67bRHB
> 857w/B/e+m3kVkYgVoarCuvdRZtL52t6QFXTPAEyhOFYdDi92ccHp3vZHzlMFeuv
> 9Whv9VRZnSLyk7Y3BBeSqRZ0pROl3XoTxHBzmYe5DJdKNAlTxJ6FeDjdQhO1p9bM
> Douyg8QeS+Ai5C/vtfWjFn0Kz8z0z/yYXjqM1gLxtTvU8tXwpOpvDXe1yzMiWB1v
> XN1IUjCDq5FEg4lnHwxwf5HpQehCYCmoTAx3Gieq6cqrpmqYLBH79gXvr2cjB3W+
> eDwtCGK8o+oNCm/3y3c1avfV3QHrVJNx65n2f7k8AhemPd0tzg1TainmVNyJjt9M
> zK3ctXBv59B2BUnAFLxc
> =m4Hh
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

[1] http://pastebin.com/RzPXqtxv
[2] https://gitorious.org/openembedded-core-layers/meta-kde/blobs/master/recipes-misc-support/qt4-x11-free_4.8.0.bbappend

-- 
Regards
Samuel


