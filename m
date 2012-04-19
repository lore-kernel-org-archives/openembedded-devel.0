Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1SKs6a-0007jH-KX
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Apr 2012 16:13:04 +0200
Received: by wera1 with SMTP id a1so5496398wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Apr 2012 07:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=A4+WIro36OLHvPEPq84nJo24Vk0SKBxq56eg+01D3EE=;
	b=A0CFepUE90g6heBYbm7BqYd1UgB/HfqviDByETN5sddXsZ0UJ1KNNWKd0g/wtvd2+J
	KrNQtoos633Riffy/My8n0B6Rc7HP1W0ecyyIzPQLY+f3pD1ZoUMKN4IspF1/rByyZ+W
	gG6tv1k7bwS5ofxJbuJ5wKr9BbeKJi5fr5cYVpa+SqFRO9eMSC52UD3rVUPwsCSAs1Jt
	8kMV+oA1Z6i5q4N7E6HwVsOUfFhQhmoOicHJIrbmXpN1jM1liPPVf2c2kRj9fDm3Dnja
	mPiBc5j7tCKIUse3vkC8RmarBiqDrf/gISnINQyZMYb0kneUdTwHPiu+uscEXQTHGTxa
	4VMg==
MIME-Version: 1.0
Received: by 10.180.100.230 with SMTP id fb6mr6430920wib.3.1334844215922; Thu,
	19 Apr 2012 07:03:35 -0700 (PDT)
Received: by 10.223.14.149 with HTTP; Thu, 19 Apr 2012 07:03:35 -0700 (PDT)
In-Reply-To: <jmomha$co7$1@dough.gmane.org>
References: <CAGiJk9c8ThXrLqsrgYQb03hShObTJynt+fxsRxG9VzYOkOsyUg@mail.gmail.com>
	<jmmst9$r5o$1@dough.gmane.org>
	<CAGiJk9e4vZoO1d1cCbh8Lq26m6h3M5rrOOe40CS1ov2VHqh9eQ@mail.gmail.com>
	<jmomha$co7$1@dough.gmane.org>
Date: Thu, 19 Apr 2012 16:03:35 +0200
Message-ID: <CAGiJk9fy3p550fUxadQUYmahhx4DVRYeEt_GDYgjBhMVpHzBMw@mail.gmail.com>
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
X-List-Received-Date: Thu, 19 Apr 2012 14:13:04 -0000
Content-Type: text/plain; charset=UTF-8

2012/4/19 Koen Kooi <koen@dominion.thruhere.net>:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Op 19-04-12 11:09, Samuel Stirtzel schreef:
>>>> Feel free to comment on the images.
>>>
>>> Giving them a spin now :)
>>
>> Thanks.
>>
>> Just to let you know: Yesterday I accidentally added "inherit allarch" to
>> kde-wallpapers, this will produce an error, I want to push my patch for
>> this but Gitorious seems to be down.
>
> Gitorious is down a lot, which is (partly) why I switched away from it.
>
>> Removing allarch from kde-wallpapers will do the trick.
>
> I'll update the repo in a minute. Some other things I ran into:
>
> * rasqal needs PARALLEL_MAKE = ""

Done, committed it to master.
(68edc1551c703bd83a60aa05edb898a7bdfa9ff9 if anyone wants to cherry-pick)

> * soprano-native is needed for the onto2something binary, I did 'yum install
> soprano' instead

Which recipe is failing with the soprano-native error?
The kdelibs4-native recipe should only optionally depend on it.

> The build has restarted due to the gcc patch and OEBasicHash, so it will be
> a while before I can test these images.
>
> regards,
>
> Koen
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.11 (Darwin)
> Comment: GPGTools - http://gpgtools.org
>
> iQIcBAEBAgAGBQJPj91wAAoJEHZqAkdh1vT60T0QAKPi3WeWUixdKnYVEblnoOC3
> qLw9kVglZ4RAbulOYylznNrDBzIxyDFi3aofO5M68vOLa0ng8V7EFZ+lOZgI3goI
> wwd76JIXbu9P/pojE5jXhpU1gZiISnCwJrdkso6MRVXzi6UlS/PGEyORPhcX6KcS
> IGSeV1aP+3LfJCbd0BVS3LZKALPcVlz6cVSqMi6KpmKvzeFaAN5PUtEH5soNCNh6
> LR+hh9Q/Kz1wur3pk2mAWzj9B1uy+VtWN1vI/ywtEb1zXlvokI6NcwgKS/ZzBTOM
> 8KjaF4GqBpBSvHLJjyZrtjpTjIW6HMcic5IWAM1H/ta5X4mb6eOYFieGNnnaNU2v
> t2uUDYqyxWvgNrhChrG3foF6/AMPhmyz53iDVwjdaG9/NuC3fniB80Cp7E9ejwrj
> sPWJ2tZ/LcraDlMfvYEqe8KSa0UuV9PrD1FMA48JmWwR8s92lc4Ug67HsGv728KB
> bRmQh3g/OKPupYrnwj8eddY30Anxz4sZADtXD5St5TTJKbuq3yidK/OA/bb/M1b1
> CfTdvsWoYnPAAAcJkiQaptKf2g7NI7GYrXbdvcMDDbdj3NX9qfFAlHyGWsNThoNm
> U8uievGsgyR8A1PxGPKdq72BauoZM28bJN9vZMEpgAJpx9kuO5wnZRzu7s/ZLuHg
> 1sWvYGV98ReHoDEMGNHA
> =Z5pO
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



-- 
Regards
Samuel


