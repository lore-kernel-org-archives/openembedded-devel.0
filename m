Received: from mail6.pr.hu (mail6.pr.hu [87.242.0.6])
 by mx.groups.io with SMTP id smtpd.web09.363.1630126379639637490
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Aug 2021 21:53:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pr.hu header.s=pr20170203 header.b=hesY+tiu;
 spf=pass (domain: pr.hu, ip: 87.242.0.6, mailfrom: zboszor@pr.hu)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1mJqKv-0007Vr-Hu; Sat, 28 Aug 2021 06:52:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=+mzhFUqkIqPDLflyuYxyeZ7tVoQjtSTVk2WqHtnTHjM=; b=hesY+tiuxe/Nd+uti+qaCmGZBy
	/TB8qUX3B1MX/IlOWbExptn+meGj9E4Gkev0fXpgfvbUNTje/WRH5l5gtFqGsjFx6rzm/AYr+Ma9m
	B/L8S2M4Okek9Nwvsu7Mx0XRL9kfpxe0jyE4YC7PPdXQ0l9o9xwSYZCQyZjwqXAvmkJ8e2aMWYsSX
	mVUascaifc2q9wMZ4RU2LVMw2yW+zcUUwIc0bkNlOTu604PXBllJg7M3Tm6cY7Gr4jEVLvVElNsnr
	DqjPVuVuOGd0QQTtUcvDUY171ve0yT5d73cBy9EGxJTVdOcqkxSrw0TCjFkJFy/X4zFpGWOx1n4iL
	vBNyoOZg==;
Received: from host-87-242-23-58.prtelecom.hu ([87.242.23.58] helo=localhost.localdomain)
	by mail.pr.hu with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <zboszor@pr.hu>)
	id 1mJqKq-0007qA-QK; Sat, 28 Aug 2021 06:52:55 +0200
Subject: Re: [oe] [meta-gnome][PATCH] metacity: Use autotools-brokensep
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
 =?UTF-8?B?Wm9sdMOhbiBCw7ZzesO2cm3DqW55aQ==?= <zboszor@gmail.com>
References: <20210827084346.2770947-1-zboszor@pr.hu>
 <f0a92ad5-1cc1-c383-7ca2-31825762c761@gmail.com>
 <32da7686-4098-2025-bbf4-43aab27c9f4c@pr.hu>
 <CAMKF1sqPuFD9FiDKOZLKGxZ_adC2D0=ps48crffTtx0oG01jBg@mail.gmail.com>
 <ef6e4f5b-044e-0649-ae59-aa25ecba95dd@pr.hu>
 <CAMKF1sr8H+DSu-w1irXb51cZLAjp5uzXjxs3ex4gTJw2Le1aDQ@mail.gmail.com>
From: "Zoltan Boszormenyi" <zboszor@pr.hu>
Message-ID: <65cbcc51-4cbe-150b-d941-8eab9c92bc53@pr.hu>
Date: Sat, 28 Aug 2021 06:52:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1sr8H+DSu-w1irXb51cZLAjp5uzXjxs3ex4gTJw2Le1aDQ@mail.gmail.com>
X-Spam-Score: -1.0 (-)
X-Scan-Signature: d44d414421fb166c200efb3fd2b2349e
X-Spam-Tracer: backend.mail.pr.hu -1.0 20210828045255Z
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

2021. 08. 28. 6:34 keltezéssel, Khem Raj írta:
> this patch is better, perhaps worth sharing with metacirty upstream as well.

I don't know if they backport to older GNOME releases,
but I have submitted an MR against metacity's master branch.

https://gitlab.gnome.org/GNOME/metacity/-/merge_requests/24

> 
> On Fri, Aug 27, 2021 at 9:16 PM Böszörményi Zoltán <zboszor@pr.hu> wrote:
>>
>> (Resending from the subscriber email.)
>>
>> 2021. 08. 27. 19:11 keltezéssel, Khem Raj írta:
>>> On Fri, Aug 27, 2021 at 10:04 AM Böszörményi Zoltán <zboszor@pr.hu> wrote:
>>>>
>>>> 2021. 08. 27. 18:49 keltezéssel, Khem Raj írta:
>>>>>
>>>>>
>>>>> On 8/27/21 1:43 AM, Zoltan Boszormenyi via lists.openembedded.org wrote:
>>>>>> From: Zoltán Böszörményi <zboszor@gmail.com>
>>>>>>
>>>>>> The split build directory causes a make error because
>>>>>> build/src/core is not created during the build but generated
>>>>>> sources are moved to it which fails.
>>>>>>
>>>>>> Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
>>>>>> ---
>>>>>>     meta-gnome/recipes-gnome/metacity/metacity_3.40.0.bb | 2 ++
>>>>>>     1 file changed, 2 insertions(+)
>>>>>>
>>>>>> diff --git a/meta-gnome/recipes-gnome/metacity/metacity_3.40.0.bb
>>>>>> b/meta-gnome/recipes-gnome/metacity/metacity_3.40.0.bb
>>>>>> index a5c704740..969fe13dd 100644
>>>>>> --- a/meta-gnome/recipes-gnome/metacity/metacity_3.40.0.bb
>>>>>> +++ b/meta-gnome/recipes-gnome/metacity/metacity_3.40.0.bb
>>>>>> @@ -21,6 +21,8 @@ DEPENDS = " \
>>>>>>     # depends on startup-notification which depends on virtual/libx11
>>>>>>     REQUIRED_DISTRO_FEATURES = "x11"
>>>>>> +GNOMEBASEBUILDCLASS = "autotools-brokensep"
>>>>>> +
>>>>>
>>>>> this does not fail on jenkins so I wonder what are the conditions to reproduce it.
>>>>
>>>> Fedora 33 build host, master branches of oe-core and meta-oe.
>>>> I also use meta-clang and meta-intel.
>>>>
>>>> The commit message says it all. metacity-3.40.0/src/core exists
>>>> because it was there in the tarball, but build/src/core does
>>>> not get created automatically for some reason here.
>>>
>>> the builders are ubuntu 18.04 and I wonder if there is some race
>>> condition here in creating these dirs
>>> Does it happen all the time?
>>
>> For me, it's 3 failures out of 3 attempts.
>>
>>>
>>>>
>>>> I can carry this assignment or the equivalent B = "${S}" in my local bbappend.
>>>>
>>>
>>> I think if we can understand the underlying problem we can fix it in
>>> code itself.
>>
>> The attached proof of concept patch helps.
>> (Only not attaching this time, sending a properly signed patch to the list instead.)
>>
>>>
>>>> Best regards,
>>>> Zoltán Böszörményi
>>>>
>>>>>
>>>>>>     inherit gnomebase gsettings gettext upstream-version-is-even features_check
>>>>>>     SRC_URI[archive.sha256sum] =
>>>>>> "224c1f65487eac21f0c1d9856152343768ee726c48b1a8a2835a46a8ad9015b5"
>>>>>>
>>>>>>
>>>>>>
>>>>>>
>>>>>>
>>>>>
>>>>>
>>>>> 
>>>>>
>>>>
>>

