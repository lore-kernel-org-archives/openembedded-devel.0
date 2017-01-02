Return-Path: <piotr.lewicki@elfin.de>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 2B92060796
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Jan 2017 14:25:27 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id a197so366520558wmd.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Jan 2017 06:25:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elfin.de; s=google;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=J0ry4p97ims3Kk6VAjR/Ocpssf3PadIYry7BM918t8w=;
	b=UtM9t7uCPvshv7GFsnoOEPg8sLw+dYy1ZtbJP7RZ6Otp0ahOCLSHYZZdCFop8f0i0C
	pq1MoXHJUhnZLo3pjovV0VTZMJxaTL5+4lYOOyjtBvaExX6sPj1zF8pBEF8aLarsQWq8
	XiZsV8H/GruUSu1+N4jQ0emZXP/KHfHSs/nGgnkMBP2SwQ/ugHoMtp9W8KPB1qOhVpT2
	2e26KdDuGNAwQhZC8LgYJgjW1TgNO3q5ji3ABJn5ZzhlhnpWIVD7lQid7X5e36K9kk+z
	widgUn8FhTgDLEMEFmUdhE8yqmPUwrJD9OqVbNypMSC4TxtPL/8lkhqrlE+2kcIE7ap0
	fjKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=J0ry4p97ims3Kk6VAjR/Ocpssf3PadIYry7BM918t8w=;
	b=Avl1nDNR15x6sProYOFmrs4SWdWbhO7YGUbdlf4mWtM8uRA+Ll4Rey+1Hs8YQp/bP3
	moom2yMozGxbdQv3FeC7bDbW0od1WOh/N/mBon9AkkP0F54dEg9+9T6hTC1m8V1H8lWS
	BHGyuVYkL2weO3SrE+CWhmLT/+iN1F7qZ6+kXOrODRDcAafCQyK2VIpxIp3phljhUwEe
	53uauE3fWKtwj8eI7S1XP6k3nUSf72ZGwAgzkh4YYabDFO2vJBjTwAHBkhpMk51G9lk9
	aZUrVavomZcDHMvOM6nG6KDA6P7yYcGbcdkAj/yb9juKnvOTejl7bzI5dvlNQG85OfM+
	IWvQ==
X-Gm-Message-State: AIkVDXKvFvdjHFVGj92oTW/VPGEX3Qt9Rfu1Xa4FE9bhqqzoT/WyfTKPTcGkIApAH33y7A==
X-Received: by 10.28.93.74 with SMTP id r71mr47834835wmb.67.1483367127471;
	Mon, 02 Jan 2017 06:25:27 -0800 (PST)
Received: from [192.168.2.176] (b2b-94-79-174-114.unitymedia.biz.
	[94.79.174.114])
	by smtp.gmail.com with ESMTPSA id l6sm84779428wmd.5.2017.01.02.06.25.26
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 02 Jan 2017 06:25:27 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <CADnUhn2STGnqzDuYoAo8yLvDnPFcmm+4M+xq387oxdhwF_pFMQ@mail.gmail.com>
	<CAKuJqM9sse_hCpGQBbfQrcCThtichn=WLeuA2iEEU=NP9N_nMw@mail.gmail.com>
	<CADnUhn16Dyc2tnRgQtGMwy6xuBKchjWP3oCtnRdpg4GK1L0BcQ@mail.gmail.com>
From: Piotr Lewicki <piotr.lewicki@elfin.de>
Message-ID: <a37b0cee-f82e-129e-c24a-e2460588fe75@elfin.de>
Date: Mon, 2 Jan 2017 15:25:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <CADnUhn16Dyc2tnRgQtGMwy6xuBKchjWP3oCtnRdpg4GK1L0BcQ@mail.gmail.com>
Subject: Re: apache2_2.4.23.bb fetcher crashes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 02 Jan 2017 14:25:28 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

Derek  Straka had already created a patch for it. Filter for msg topic: 
"[oe] [meta-webserver][PATCH] apache2: always use the archive.apache.org 
to ensure older releases are always available".

Just reapply it on krogoth branch and send a patch.

I will do the same with the morty.


What troubles me is: why isn't this patch applied on master?


BR,

Piotr


On 02.01.2017 15:20, matti kaasinen wrote:
> Olkesandr,
> Actually it was regarding that jquery library that I patched today. That
> really was pretty trivial fix if fix at all ­- just to make it more formal.
> However, I really do not know if it is just to update Apache version or is
> there something else to do. Pure revision change would be trivial for me,
> too, or actually a new recipe should be made. Other choice would be trying
> to find that older version of Apache and fix source URL accordingly.
> It seems that old version is in archive:
> https://archive.apache.org/dist/httpd/
> I'm fine making the patch to update SRC to point to apache archive.
> However, recipe seems using several patches that I do not care creating for
> the new release now. That should do someone more devoted to apache
> functionality, I suppose.
> -Matti
>
>
> 2017-01-02 15:46 GMT+02:00 Oleksandr Kravchuk <
> oleksandr.kravchuk@pelagicore.com>:
>
>> Matti -
>>
>> As I have previously suggested, you can make a patch and send it to
>> this mailing list. Here is an instruction:
>> http://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded
>>
>> Would you like to try to do it yourself or you actually want us to fix it?
>>
>> On 2 January 2017 at 14:15, matti kaasinen <matti.kaasinen@gmail.com>
>> wrote:
>>> Hi!
>>>
>>> http://www.apache.org/dist/httpd/httpd-2.4.23.tar.bz2 has been removed.
>>> Latest/current version on http://www.apache.org/dist/httpd/ page is
>>> httpd-2.4.25.tar.bz2. This crashes fetcher of
>>> meta-openembedded/meta-webserver/recipes-httpd/apache2/apache2_2.4.23.bb
>>> that is Krogoth recipe for apache2.
>>>
>>> Thanks,
>>> Matti
>>> --
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>


