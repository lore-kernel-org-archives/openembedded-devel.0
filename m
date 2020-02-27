Return-Path: <raj.khem@gmail.com>
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by mail.openembedded.org (Postfix) with ESMTP id 495B5608AB
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2020 01:42:39 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id c16so1395413ioh.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Feb 2020 17:42:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=Dt5UXTdX5SFkn70SHz6bDnD1jnLmrrG+aPc1N9SeSDM=;
	b=s0waNS1dhSE+aRyImomw/zmjpuLFw2P6zvC0xA6EDPM0PUC4pwhKBqqE7MpWTHYMZs
	InUEIvH0M9U2scVeAa5Q+wQfCbunoBQ29JCYBmskh79GPFNJMJuVqNpvBy0gMQ24W0Y1
	5sPfx08HrXKp50/wPeaI7mx5Q2ZCWCk8wS40oE2vikg09LeRBFZStw5om/trXQj6FHOF
	KLQ+2VziSQQotj32TcYeSUnriF5z19J05mNtYqqYVX5/4CJbGnmY4u36RB9CUFZ+fCkA
	1RgtJwh0IRQ+J5hcaW2byig7kLAkdEvRpufOdAKwtOxPbg3R8uS/TMLLrdqwD9QjAVdq
	btrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Dt5UXTdX5SFkn70SHz6bDnD1jnLmrrG+aPc1N9SeSDM=;
	b=JuXKI9oO7xYICppiC3/2Ox+AIGI6dyf9HloKvmRLgseJzJPhYG89z84Cc4pSHJifCv
	Ytw01sbOYYLG7HqmX1HiDyL4yNzN8iasV/NGaTJlbVgbvSYFIjCjyfaBBhW2dxGawOFQ
	n80KMAPNm0SjgYUDYIuFbRFuReyzoKGfIsOtD6C3xoJxH7DXaovB9gNCv3AYZT7J5PJB
	FQbo8QUgfsDBtAuttojvyjpMOxQJ1lirBcA+lNLgdp5zx/onMXtmX3Qx64BiDr8Bcgms
	TgfwICbUeheS94e70cU5lm7dmUldgYGnVCWANm+g6PK+evHxerDhnHk1UscJzhL4oobk
	TI0A==
X-Gm-Message-State: APjAAAUiU/tupElUx4R/szLJtFhb/qAdfG6CY+YXAY8NAXCNkp/ols48
	qWL8Q3zOH1LBgacRgBI0g6vb21Ln3VE=
X-Google-Smtp-Source: APXvYqzecslQYYxf6sDD2oNJ1fjUttuN/5gQ75/mgIaxYFN1PLPfyoNBs4AEGxcMfS67TjJ1eH3Tlg==
X-Received: by 2002:a05:6638:149:: with SMTP id
	y9mr2648655jao.132.1582767759878; 
	Wed, 26 Feb 2020 17:42:39 -0800 (PST)
Received: from ?IPv6:2601:646:9200:4e0:19c7:2796:79bc:80ea?
	([2601:646:9200:4e0:19c7:2796:79bc:80ea])
	by smtp.gmail.com with ESMTPSA id v15sm399198ilc.27.2020.02.26.17.42.39
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 26 Feb 2020 17:42:39 -0800 (PST)
To: Denys Dmytriyenko <denis@denix.org>
References: <1582765387-17990-1-git-send-email-denis@denix.org>
	<2688512e-5b56-9881-8b8b-d5d215453587@gmail.com>
	<20200227014050.GD1578@denix.org>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <727865e1-082c-4703-b131-3d533c5157f8@gmail.com>
Date: Wed, 26 Feb 2020 17:42:38 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200227014050.GD1578@denix.org>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] can-utils: update to v2020.02.04
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
X-List-Received-Date: Thu, 27 Feb 2020 01:42:39 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 2/26/20 5:40 PM, Denys Dmytriyenko wrote:
> On Wed, Feb 26, 2020 at 05:39:17PM -0800, Khem Raj wrote:
>>
>>
>> On 2/26/20 5:03 PM, Denys Dmytriyenko wrote:
>>> From: Denys Dmytriyenko <denys@ti.com>
>>>
>>> https://github.com/linux-can/can-utils/releases/tag/v2020.02.04
>>>
>>> This version is required to build against kernel > 5.2
>>>
>>> While at it, drop redundant DESCRIPTION and branch=master
>>>
>>> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>>> ---
>>>   meta-oe/recipes-extended/socketcan/can-utils_git.bb | 8 +++-----
>>>   1 file changed, 3 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/meta-oe/recipes-extended/socketcan/can-utils_git.bb b/meta-oe/recipes-extended/socketcan/can-utils_git.bb
>>> index e2609d4..6114bda 100644
>>> --- a/meta-oe/recipes-extended/socketcan/can-utils_git.bb
>>> +++ b/meta-oe/recipes-extended/socketcan/can-utils_git.bb
>>> @@ -1,17 +1,15 @@
>>>   SUMMARY = "Linux CAN network development utilities"
>>> -DESCRIPTION = "Linux CAN network development"
>>>   LICENSE = "GPLv2 & BSD-3-Clause"
>>>   LIC_FILES_CHKSUM = "file://include/linux/can.h;endline=44;md5=a9e1169c6c9a114a61329e99f86fdd31"
>>>   DEPENDS = "libsocketcan"
>>> -SRC_URI = "git://github.com/linux-can/${BPN}.git;protocol=git;branch=master"
>>> +SRC_URI = "git://github.com/linux-can/${BPN}.git;protocol=git"
>>> -SRCREV = "665d8699ebe728bf48e63e8ae58d2482db72f954"
>>> +SRCREV = "da65fdfe0d1986625ee00af0b56ae17ec132e700"
>>> -PV = "0.0+gitr${SRCPV}"
>>> +PV = "2020.02.04+gitr${SRCPV}"
>>
>> Since SRCREV is pointing to exact 2020.02.04 release we can drop gitr+...
> 
> Not for long, I'm afraid. Do you want v2?

as long as we can, yes v2 would be good.

> 
> 
>>>   S = "${WORKDIR}/git"
>>>   inherit autotools pkgconfig
>>> -
>>>
>>

