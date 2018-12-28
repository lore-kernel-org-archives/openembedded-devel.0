Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id BD748601F2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Dec 2018 17:13:28 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id g189so10286899pgc.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Dec 2018 09:13:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=x9JTuH+F/VW3mYAikb6BVGhpU8lptTG3baq3XEpqSSE=;
	b=WwyNP4qOtXr2tjc6Bj2rG+VHm2RiqXDurZJ6aPHE2qs49urxSDs6LkKMJjI9g+2nEo
	UjY2RuioXog9GuAW8TcZ5v1yFc7nOs2d4zA4OQWnD2E/qmLtJKhSus3LzoLVJiqQSOOe
	Bwvp9Q7E5WB9T1g/bwGdoyRBnj5aOAOW1srORb6QRsGb0/qCAgeJJGdVYYDdut5eQazB
	KWwrItzsX7TvWyoe2ZsnCF4Ho5KF16z+L53Ojqmc/kufMUbMxtGkFYuUoE31mjJ1CZPt
	cecmndpEHRrNVTlEgFfxhEF6FqZuUTc0E+XbhSx+DEMzTEFKUq2XzOpLUQrvWcN6wcny
	aWVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=x9JTuH+F/VW3mYAikb6BVGhpU8lptTG3baq3XEpqSSE=;
	b=mxECu97ciRydaExLlHaqC9yfRBCmZ+eVyzsJvGTo36QLrpxmJPpUYeFyiapM99dMw9
	SiqnK2k0zQUFOs/7BIbyqVFKWVXVGPN2z8bQY3VSmgBBrYuoxU18ylnSs5rX5on4r/om
	DI1Duf9tfNAFlY6CajUP3XUMHl9WvZl/YBRSOpy8kz+885EN6yh/Izq74cQT9zlacf+w
	6I+cTxnzyE7bgu1hnSK4HFfaBbLvIYOmzxTUHByi3WRq7eZtt6vE9EASc+kyg+QIlScZ
	PDIiJV1d7CAUWXHXrGUZbVxydIRo6jx87QcNnYgygisOs5d99RKECUd5MJ+e9ZLLLkkl
	vDpw==
X-Gm-Message-State: AA+aEWYvfKuijRY0WIw2umMvJNTcYOAURw933an8shuZVTqHpLx++3Y9
	0cYjKHIZORYy3166ZdhcZI9MpfKTtRk=
X-Google-Smtp-Source: AFSGD/UXe/sZTbw/G1EuClzNn/O5utZ4cvhOH+okr3N5k2K/wIogMMlE649JK8QUFv3vvQKCVtQyEA==
X-Received: by 2002:a62:2082:: with SMTP id m2mr28276431pfj.163.1546017209333; 
	Fri, 28 Dec 2018 09:13:29 -0800 (PST)
Received: from hermes.local ([2601:646:877f:9499:3c66:e24:63f5:7a43])
	by smtp.gmail.com with ESMTPSA id
	z9sm122228681pfd.99.2018.12.28.09.13.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 28 Dec 2018 09:13:28 -0800 (PST)
To: =?UTF-8?B?zpHOuM6xzr3OrM+DzrnOv8+CIM6fzrnOus6/zr3PjM68zr/PhQ==?=
	<athoik@gmail.com>
References: <1545978520-30261-1-git-send-email-athoik@gmail.com>
	<CAMKF1spWKvTezgKLyEs6m=tY_GcXA6fz_E-LN6fvQCZc0evtOg@mail.gmail.com>
	<CANDbA3fwBSiK6zL-+-OH3BNJE0bvD1cWt+HqdmGSofW6-OWbtw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <1ceb5a5d-cbd0-3b43-8115-a7502e0e7729@gmail.com>
Date: Fri, 28 Dec 2018 09:13:27 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:64.0)
	Gecko/20100101 Thunderbird/64.0
MIME-Version: 1.0
In-Reply-To: <CANDbA3fwBSiK6zL-+-OH3BNJE0bvD1cWt+HqdmGSofW6-OWbtw@mail.gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-multimedia][PATCH] faac: update 1.29 -> 1.29.9.2
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
X-List-Received-Date: Fri, 28 Dec 2018 17:13:28 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 12/28/18 5:24 AM, Αθανάσιος Οικονόμου wrote:
> Στις Παρ, 28 Δεκ 2018 στις 8:51 π.μ., ο/η Khem Raj <raj.khem@gmail.com> έγραψε:
>>
>> On Thu, Dec 27, 2018 at 10:32 PM Athanasios Oikonomou <athoik@gmail.com> wrote:
>>>
>>> Remove not required patch and extra EXTRA_OECONF "--without-mp4v2".
>>
>> have you build tested this patch on a musl platform ?
>> if not please try one and report back.
>>
> 
> bitbake faac was tested using TCLIBC = "musl"
> (39e933936e11e186f21dacf4bccedddaa0a122df)
> for machines qemuarm and qemuarm64. Build was successful.
> 
> Please let me know if above test case is enough or further actions required.
> 

Thanks for confirming.

>>> Previously not required mp4v2 library was dropped on 1.29.9.2.
>>>
>>> While being there also fix issue with multilib build on aarch64
>>> using FILES_lib${BPN} instead of FILES_lib${PN}.
>>>
>>> WARNING: lib32-faac-1.29.9.2-r0 do_package: QA Issue: lib32-faac: Files/directories were installed but not shipped in any package:
>>>    /usr/lib/libfaac.so.0
>>>    /usr/lib/libfaac.so.0.0.0
>>> Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
>>> lib32-faac: 2 installed and not shipped files. [installed-vs-shipped]
>>>
>>> Signed-off-by: Athanasios Oikonomou <athoik@gmail.com>
>>> ---
>>>   .../faac/{faac_1.29.bb => faac_1.29.9.2.bb}        | 14 ++++-------
>>>   ...Define-__STRING-if-cdefs.h-does-not-exist.patch | 28 ----------------------
>>>   2 files changed, 4 insertions(+), 38 deletions(-)
>>>   rename meta-multimedia/recipes-multimedia/faac/{faac_1.29.bb => faac_1.29.9.2.bb} (56%)
>>>   delete mode 100644 meta-multimedia/recipes-multimedia/faac/files/0001-mp4v2-Define-__STRING-if-cdefs.h-does-not-exist.patch
>>>
>>> diff --git a/meta-multimedia/recipes-multimedia/faac/faac_1.29.bb b/meta-multimedia/recipes-multimedia/faac/faac_1.29.9.2.bb
>>> similarity index 56%
>>> rename from meta-multimedia/recipes-multimedia/faac/faac_1.29.bb
>>> rename to meta-multimedia/recipes-multimedia/faac/faac_1.29.9.2.bb
>>> index d36f2f4..4fc1121 100644
>>> --- a/meta-multimedia/recipes-multimedia/faac/faac_1.29.bb
>>> +++ b/meta-multimedia/recipes-multimedia/faac/faac_1.29.9.2.bb
>>> @@ -1,29 +1,23 @@
>>>   SUMMARY = "Freeware Advanced Audio Coder (MPEG2-AAC, MPEG4-AAC)"
>>>   SECTION = "libs"
>>>   LICENSE = "LGPLv2+"
>>> -HOMEPAGE = "http://www.audiocoding.com/faac.html"
>>>   LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
>>>                       file://libfaac/coder.h;beginline=5;endline=17;md5=fa1fd6a5fa8cdc877d63a12530d273e0"
>>>
>>> -LICENSE_FLAGS = "commercial"
>>> -

why is this dropped. May be document it in commit message


