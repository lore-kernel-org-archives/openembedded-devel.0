Return-Path: <garbados@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 02AA371AFA
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Aug 2017 21:37:32 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id d40so7007117wma.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Aug 2017 14:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=MAMIT2qSAZm8WleBUL7As6HPIEl3qJIl/fwzq/FXKvc=;
	b=hi3UzdGaxtjjFe+r4pQ2pl29oTZ5FzuJkmSmX1pEWSJPALTvOxPlUWTpeNnglzrSqZ
	ysHIe9O2oE5MkJjcj5WwQ8yQuPfT6JojQsD5HZE3oHqON/HzxGz0AfgXaxy/y09ANRO+
	QHPMvIH5o06AaUSjN3eLhv7jzxKpx4xwk3xVLVoGg0lK8EMKAd1Vv0h6dc2m1Z2ZOjyH
	2k6dtu5TddsdIADtpPqJZViVIueeNwlZZygzOZgUJLvvKJTRrnmeoIwaE6Ux/cQPz3YK
	PjCJ6iqY6C5J2ey7dc+L4eyOrh1/51TRDBdpW0w+O4U8jm9ZAIxkKHIgoZmfA1aDKBk7
	rXcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=MAMIT2qSAZm8WleBUL7As6HPIEl3qJIl/fwzq/FXKvc=;
	b=USWKYIOcOScyER+neQDQ9uuwztaoiiN3J+BUw2cp54XmLhD06Dt8Lb1yIjICZFP2xV
	XgCl8ol4dmjUzjW6wNs0GEUs4xGTv5VfOx1Ao2pxbSO42eHY09Khul9vqs74fqUTJzrD
	mvn6PUqwbHZMaO4OencyFrc21LCqSJrqySgSjjH/8Ae2jWBJihDcshVQMIfp2RA3tqRt
	7lOfmJH+CF2R0n2stVIF4ZT8cDMY8LUA0PpDNBKXEJfbjypfjcoeyqOPcKIfdTR7iiR+
	2wyGtsrrjMBbn7HV6x4fmGmz4IdxVSE1srb+RTK7Osgn25PDZQlTbT8h1O5UTfn7GRRK
	IYfQ==
X-Gm-Message-State: AIVw112f88B1npYCoR81PWBVi6ZWAwz/vcmuIkPIemnAf4yp6YsLeNWQ
	zJN2En/qnIj5q57zOsM+G1YnRYi+4A==
X-Received: by 10.80.167.65 with SMTP id h59mr3711372edc.142.1501882654010;
	Fri, 04 Aug 2017 14:37:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.167.164 with HTTP; Fri, 4 Aug 2017 14:36:53 -0700 (PDT)
In-Reply-To: <CAMKF1spBau=OW8iA2K=ULnkZ_fFvdiRupDsPeiL8bPhPfms2cg@mail.gmail.com>
References: <CA++8a_B59JkA14c9aN531E_HZN64ig_kDY_m_oNzcbEt39-hBw@mail.gmail.com>
	<CAMKF1sqx0z62dbQtQQZHhiDU1_0gjrzSfhOacsmBVkP5ehariQ@mail.gmail.com>
	<CA++8a_BLciSLffmy_MyxyeSEWCX+07BkiQ4u80Rz+upJ1rzBdw@mail.gmail.com>
	<CAMKF1spBau=OW8iA2K=ULnkZ_fFvdiRupDsPeiL8bPhPfms2cg@mail.gmail.com>
From: Diana Thayer <garbados@gmail.com>
Date: Fri, 4 Aug 2017 14:36:53 -0700
Message-ID: <CA++8a_CQEZBUGm_u04cA1EddT=QnMxgWqEY8ZJGiVrTnbaKmoA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-openwrt] Issues adding layer using readme instructions
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
X-List-Received-Date: Fri, 04 Aug 2017 21:37:33 -0000
Content-Type: text/plain; charset="UTF-8"

That did the trick. Should I submit a patch to remove it?

On Fri, Aug 4, 2017 at 2:34 PM, Khem Raj <raj.khem@gmail.com> wrote:

> Ok please look for this class being inherited in this layer and delete it
> it has been merged into image class in oe-core we should have kept an empty
> class in or-core for backward compatibility but that's another matter
>
> On Fri, Aug 4, 2017 at 2:30 PM Diana Thayer <garbados@gmail.com> wrote:
>
>> Alright. I've added it manually. I get this error:
>>
>> ```
>> ParseError at /home/garbados/openembedded-core/meta-openwrt/recipes-
>> core/images/openwrt-base-image.bb:5: Could not inherit file
>> classes/image_types_uboot.bbclass
>> ```
>>
>> This is also the error Toaster gives me when trying to build the layer.
>>
>> On Fri, Aug 4, 2017 at 2:25 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>
>>> Hi Diana
>>>
>>> Haven't seen anyone report this error thus far
>>> I would suggest to add the layer manually to
>>> Bblayer.conf and see how then you get better error messages during parse
>>>
>>> On Fri, Aug 4, 2017 at 1:45 PM Diana Thayer <garbados@gmail.com> wrote:
>>>
>>>> Hello!
>>>>
>>>> I'm experiencing issues building with meta-openwrt. Following the
>>>> instructions in the readme <https://github.com/kraj/meta-openwrt>, I
>>>> get
>>>> this error:
>>>>
>>>> ```
>>>> $ bitbake-layers add-layer ../meta-openwrt
>>>> NOTE: Starting bitbake server...
>>>> Loading cache: 100% |#############################
>>>> ############################################################
>>>> #########################|
>>>> Time: 0:00:00
>>>> Loaded 66 entries from dependency cache.
>>>> ERROR: Parse failure with the specified layer added
>>>>                                                           | ETA:
>>>> --:--:--
>>>> ```
>>>>
>>>> What failed? Why? How do I debug it? I followed the directions step by
>>>> step, both within openembedded-core and poky.
>>>>
>>>> Thanks for any help you can provide.
>>>>
>>>> Best regards,
>>>> Diana
>>>> --
>>>> _______________________________________________
>>>> Openembedded-devel mailing list
>>>> Openembedded-devel@lists.openembedded.org
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>>>
>>>
>>

