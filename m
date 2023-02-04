Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59804C61DA4
	for <webhook@archiver.kernel.org>; Sat,  4 Feb 2023 17:46:02 +0000 (UTC)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
 by mx.groups.io with SMTP id smtpd.web11.11424.1675532753040636432
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Feb 2023 09:45:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BRPb4Faz;
 spf=pass (domain: gmail.com, ip: 209.85.210.41, mailfrom: akuster808@gmail.com)
Received: by mail-ot1-f41.google.com with SMTP id e12-20020a0568301e4c00b0068bc93e7e34so2238436otj.4
        for <openembedded-devel@lists.openembedded.org>; Sat, 04 Feb 2023 09:45:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UM8r2zFqJiK1Q3EMzSb7ojWH3tUu/+OhvB8fR/TwrVw=;
        b=BRPb4Faz9h2fcEWzcKGmtRy+Mcv2k5fHk0gUjj4Y9k+f2qxLANd5Q1y/3OQMIGHutX
         0ACH61OAaMZojtf0VvL4KnXJYhKt0S6rFfMhWOFc5tErV6QXUbGwSf5oAGVQTKF7FgqG
         VOhi0PqoFdLZiC6EZXGwjduTjfnGX77NpeaoStjgB6oaWACO/KhuDYWbF40EpFE5qLCT
         RI38+90gCnZrH3zmF18O9ON8niwsiEkzJ4dOKFrnlMWpR3Ca80jhDyDwpy2LRIUh6RW3
         3KiNrNxl4zx1oSB1nSgStI+mldiBsKRTfRdOllpOXr/xhF8dLQD/W8bum+/IQEVynqRO
         AuwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UM8r2zFqJiK1Q3EMzSb7ojWH3tUu/+OhvB8fR/TwrVw=;
        b=rJQhe7t2fWjPCGgWaLnymdJES30WN8XJnKAq5M3hoDczTPOqg6pwT663Z7tM+moH0F
         f1dcLdELtjj2J2/KB1scT4DHVd8ANykHoZbfHr0EmOulKEReEQvmeDwWLmveWlylS5AT
         cKozKt2Fn6NrxDXJbHnotLJLIZQsAlrRHvHbQHRw8eZnoObnSBJ24gDygGv3qRF9bV59
         G09vsrqJbq2okwb5b0Z2bvRUadg/Tslbd2QMKPY5/NyVvB7fwNt/JYB4DSRROmyjL91m
         sS8ldKCet0UWWT7raUgwPMg6R4GaXKszzLUkhyhqEOzxD7QOdpLMSutKDs53TOnvi/1Y
         ++Jg==
X-Gm-Message-State: AO0yUKX0BYuo0HVtjExw7wpkIgvx7dRjgVl3mHrsRT8/d4Hldzn/iFZr
	BwGgfKVDCnbtIv9JpGs+9EI=
X-Google-Smtp-Source: AK7set/FWt8Fw/0b1uNN4giD8YcMeBWBbu8ZGYRWrQAfhgfeC2TTA8my0pH+hOT8c/u7LpMsosdMBA==
X-Received: by 2002:a05:6830:4782:b0:68d:6a22:396c with SMTP id df2-20020a056830478200b0068d6a22396cmr2429941otb.3.1675532752140;
        Sat, 04 Feb 2023 09:45:52 -0800 (PST)
Received: from ?IPV6:2600:1700:9190:ba10:fd94:48a2:26c4:6f81? ([2600:1700:9190:ba10:fd94:48a2:26c4:6f81])
        by smtp.gmail.com with ESMTPSA id y4-20020a056830208400b0068bd20cf07dsm2564561otq.48.2023.02.04.09.45.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Feb 2023 09:45:51 -0800 (PST)
Message-ID: <e7ca5239-44d6-1601-0b5a-805d50882173@gmail.com>
Date: Sat, 4 Feb 2023 12:45:50 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [oe] [meta-python][kirkstone][PATCH 3/6] python3-pillow: upgrade
 9.2.0 -> 9.3.0
Content-Language: en-US
To: Randy MacLeod <randy.macleod@windriver.com>,
 openembedded-devel@lists.openembedded.org
References: <20230131230851.2785067-1-Randy.MacLeod@windriver.com>
 <20230131230851.2785067-3-Randy.MacLeod@windriver.com>
 <06197dd2-46e8-ffba-c703-681cee51b14c@gmail.com>
 <c698b344-1b87-fa9a-59fc-692167fb6cd5@windriver.com>
From: akuster808 <akuster808@gmail.com>
In-Reply-To: <c698b344-1b87-fa9a-59fc-692167fb6cd5@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Feb 2023 17:46:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100930



On 2/3/23 1:37 PM, Randy MacLeod wrote:
> On 2023-02-01 08:35, akuster808 wrote:
>> Hello Randy,
>>
>> On 1/31/23 6:08 PM, Randy MacLeod wrote:
>>> From: Wang Mingyu <wangmy@fujitsu.com>
>>>
>>> Changelog:
>>> =========
>>>
>>>      Limit SAMPLESPERPIXEL to avoid runtime DOS #6700 [wiredfool]
>>>      Initialize libtiff buffer when saving #6699 [radarhere]
>>>      Inline fname2char to fix memory leak #6329 [nulano]
>>>      Fix memory leaks related to text features #6330 [nulano]
>>>      Use double quotes for version check on old CPython on Windows 
>>> #6695 [hugovk]
>>>      Remove backup implementation of Round for Windows platforms 
>>> #6693 [cgohlke]
>>>      Fixed set_variation_by_name offset #6445 [radarhere]
>>>      Fix malloc in _imagingft.c:font_setvaraxes #6690 [cgohlke]
>>>      Release Python GIL when converting images using matrix 
>>> operations #6418 [hmaarrfk]
>>>      Added ExifTags enums #6630 [radarhere]
>>>      Do not modify previous frame when calculating delta in PNG 
>>> #6683 [radarhere]
>>>      Added support for reading BMP images with RLE4 compression 
>>> #6674 [npjg, radarhere]
>>>      Decode JPEG compressed BLP1 data in original mode #6678 
>>> [radarhere]
>>>      Added GPS TIFF tag info #6661 [radarhere]
>>>      Added conversion between RGB/RGBA/RGBX and LAB #6647 [radarhere]
>>>      Do not attempt normalization if mode is already normal #6644 
>>> [radarhere]
>>>      Fixed seeking to an L frame in a GIF #6576 [radarhere]
>>>      Consider all frames when selecting mode for PNG save_all #6610 
>>> [radarhere]
>>>      Don't reassign crc on ChunkStream close #6627 [wiredfool, 
>>> radarhere]
>>>      Raise a warning if NumPy failed to raise an error during 
>>> conversion #6594 [radarhere]
>>>      Show all frames in ImageShow #6611 [radarhere]
>>>      Allow FLI palette chunk to not be first #6626 [radarhere]
>>>      If first GIF frame has transparency for RGB_ALWAYS loading 
>>> strategy, use RGBA mode #6592 [radarhere]
>>>      Round box position to integer when pasting embedded color #6517 
>>> [radarhere, nulano]
>>>      Removed EXIF prefix when saving WebP #6582 [radarhere]
>>>      Pad IM palette to 768 bytes when saving #6579 [radarhere]
>>>      Added DDS BC6H reading #6449 [ShadelessFox, REDxEYE, radarhere]
>>>      Added support for opening WhiteIsZero 16-bit integer TIFF 
>>> images #6642 [JayWiz, radarhere]
>>>      Raise an error when allocating translucent color to RGB palette 
>>> #6654 [jsbueno, radarhere]
>>>      Added reading of TIFF child images #6569 [radarhere]
>>>      Improved ImageOps palette handling #6596 [PososikTeam, radarhere]
>>>      Defer parsing of palette into colors #6567 [radarhere]
>>>      Apply transparency to P images in ImageTk.PhotoImage #6559 
>>> [radarhere]
>>>      Use rounding in ImageOps contain() and pad() #6522 
>>> [bibinhashley, radarhere]
>>>      Fixed GIF remapping to palette with duplicate entries #6548 
>>> [radarhere]
>>>      Allow remap_palette() to return an image with less than 256 
>>> palette entries #6543 [radarhere]
>>>      Corrected BMP and TGA palette size when saving #6500 [radarhere]
>>>      Do not call load() before draft() in Image.thumbnail #6539 
>>> [radarhere]
>>>      Copy palette when converting from P to PA #6497 [radarhere]
>>>      Allow RGB and RGBA values for PA image putpixel #6504 [radarhere]
>>>      Removed support for tkinter in PyPy before Python 3.6 #6551 
>>> [nulano]
>>>      Do not use CCITTFaxDecode filter if libtiff is not available 
>>> #6518 [radarhere]
>>>      Fallback to not using mmap if buffer is not large enough #6510 
>>> [radarhere]
>>>      Fixed writing bytes as ASCII tag #6493 [radarhere]
>>>      Open 1 bit EPS in mode 1 #6499 [radarhere]
>>>      Removed support for tkinter before Python 1.5.2 #6549 [radarhere]
>>>      Allow default ImageDraw font to be set #6484 [radarhere, hugovk]
>>>      Save 1 mode PDF using CCITTFaxDecode filter #6470 [radarhere]
>>>      Added support for RGBA PSD images #6481 [radarhere]
>>>      Parse orientation from XMP tag contents #6463 [bigcat88, 
>>> radarhere]
>>>      Added support for reading ATI1/ATI2 (BC4/BC5) DDS images #6457 
>>> [REDxEYE, radarhere]
>>>      Do not clear GIF tile when checking number of frames #6455 
>>> [radarhere]
>>>      Support saving multiple MPO frames #6444 [radarhere]
>>>      Do not double quote Pillow version for setuptools >= 60 #6450 
>>> [radarhere]
>>>      Added ABGR BMP mask mode #6436 [radarhere]
>>>      Fixed PSDraw rectangle #6429 [radarhere]
>>>      Raise ValueError if PNG sRGB chunk is truncated #6431 [radarhere]
>>>      Handle missing Python executable in ImageShow on macOS #6416 
>>> [bryant1410, radarhere]
>>>
>>> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>
>> Whats missing here are the dependency needs for kirkstone:
>> harfbuzz to 4.4.1
>> libtiff to 4.4.0
>
> Hi Armin,
>
> Thanks for the comments, I think an update could make sense but really 
> I'm after CVE fixes so I won't argue.
> A CVE patch  was posted for dunfell and it's a one-liner so I'll take 
> that for kirkstone and send a patch.
>
>
> If you'd like to help me understand your concerns, since I haven't 
> worked with python modules much,
> you could answer the questions below but they aren't relevant now.
>
>
> Why do you think we need those versions? I don't see them called out 
> in the logs above or
>
> in any release notes for pillow and the tests work...
>
> Harfbuzz is mentioned as being needed for libraqm
>

Looking at their git repo: 
https://github.com/python-pillow/Pillow/releases, under 9.30 there is a 
section on Dependencies:

They noted this:


    Dependencies

  * Updated harfbuzz to 5.3.1 #6669
    <https://github.com/python-pillow/Pillow/pull/6669> [@radarhere
    <https://github.com/radarhere>]
  * Updated zlib to 1.2.13 #6664
    <https://github.com/python-pillow/Pillow/pull/6664> [@radarhere
    <https://github.com/radarhere>]
  * Updated harfbuzz to 5.3.0 #6651
    <https://github.com/python-pillow/Pillow/pull/6651> [@radarhere
    <https://github.com/radarhere>]
  * Update github-actions #6616
    <https://github.com/python-pillow/Pillow/pull/6616> [@renovate
    <https://github.com/renovate>]
  * Updated Ghostscript to 10.0.0 #6609
    <https://github.com/python-pillow/Pillow/pull/6609> [@radarhere
    <https://github.com/radarhere>]
  * Fix Renovate config #6599
    <https://github.com/python-pillow/Pillow/pull/6599> [@hugovk
    <https://github.com/hugovk>]
  * Configure Renovate #6564
    <https://github.com/python-pillow/Pillow/pull/6564> [@renovate
    <https://github.com/renovate>]
  * Updated harfbuzz to 5.2.0 #6591
    <https://github.com/python-pillow/Pillow/pull/6591> [@radarhere
    <https://github.com/radarhere>]
  * [pre-commit.ci] pre-commit autoupdate #6560
    <https://github.com/python-pillow/Pillow/pull/6560> [@pre-commit-ci
    <https://github.com/pre-commit-ci>]
  * Updated libimagequant to 4.0.4 #6535
    <https://github.com/python-pillow/Pillow/pull/6535> [@radarhere
    <https://github.com/radarhere>]
  * Updated libimagequant to 4.0.2 #6523
    <https://github.com/python-pillow/Pillow/pull/6523> [@radarhere
    <https://github.com/radarhere>]
  * Updated libwebp to 1.2.4 #6483
    <https://github.com/python-pillow/Pillow/pull/6483> [@radarhere
    <https://github.com/radarhere>]
  * [pre-commit.ci] pre-commit autoupdate #6472
    <https://github.com/python-pillow/Pillow/pull/6472> [@pre-commit-ci
    <https://github.com/pre-commit-ci>]
  * Updated harfbuzz to 5.1.0 #6466
    <https://github.com/python-pillow/Pillow/pull/6466> [@radarhere
    <https://github.com/radarhere>]
  * Updated libimagequant to 4.0.1 #6451
    <https://github.com/python-pillow/Pillow/pull/6451> [@radarhere
    <https://github.com/radarhere>]
  * Updated libwebp to 1.2.3 #6442
    <https://github.com/python-pillow/Pillow/pull/6442> [@radarhere
    <https://github.com/radarhere>]


I was just repeating what they said.

Also based on 
https://pillow.readthedocs.io/en/stable/releasenotes/9.3.0.html, there 
are API additions.

Those two bits of information does prompt me to question why and push back.




> https://pillow.readthedocs.io/en/latest/installation.html#external-libraries
>
> but there's no recipe for libraqm yet and so it's not a requirement it 
> seems:
>
> b/pillow$ grep Requiring 
> tmp-glibc/work/core2-64-oe-linux/python3-pillow/9.4.0-r0/temp/log.do_compile
> Requiring zlib
> Requiring jpeg
> Requiring tiff
> Requiring freetype
> Requiring lcms
> Requiring jpeg2000
>
>>
>> neither version exists in kirkstone.
>>
>> and it appears to be adding a lot of new features.
>
> Yeah, IMO it's a reasonable update because of the semantic versioning 
> approach
> followed by pillow, specifically:
>
> https://pillow.readthedocs.io/en/stable/releasenotes/versioning.html#versioning
>
>  - MINOR version when you add functionality in a backwards compatible 
> manner,
>

Ah, so it is.
>
> but you're the maintainer so I'll send a patch next week.
>

I appreciate the additional information.  Thanks for your persistence.

Where things get trick is "New Features" is under the "*Unacceptable:*". 
New Features that break backward compatibility who be a no, but new 
feature that are backward compatible should be fine and that is how I am 
interpreting this.

I plan on taking your patch series.

BR,
Armin
>
> ../Randy
>
>
>>   Per our stable branch process, this update does not qualify to be 
>> included.
>>
>> BR,
>> Armin
>>> ---
>>>   .../{python3-pillow_9.2.0.bb => python3-pillow_9.3.0.bb}      | 4 
>>> ++--
>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>   rename 
>>> meta-python/recipes-devtools/python/{python3-pillow_9.2.0.bb => 
>>> python3-pillow_9.3.0.bb} (86%)
>>>
>>> diff --git 
>>> a/meta-python/recipes-devtools/python/python3-pillow_9.2.0.bb 
>>> b/meta-python/recipes-devtools/python/python3-pillow_9.3.0.bb
>>> similarity index 86%
>>> rename from meta-python/recipes-devtools/python/python3-pillow_9.2.0.bb
>>> rename to meta-python/recipes-devtools/python/python3-pillow_9.3.0.bb
>>> index 454d61a48..11f545160 100644
>>> --- a/meta-python/recipes-devtools/python/python3-pillow_9.2.0.bb
>>> +++ b/meta-python/recipes-devtools/python/python3-pillow_9.3.0.bb
>>> @@ -5,7 +5,7 @@ HOMEPAGE = "https://pillow.readthedocs.io"
>>>   LICENSE = "MIT"
>>>   LIC_FILES_CHKSUM = 
>>> "file://LICENSE;md5=ad081a0aede51e89f8da13333a8fb849"
>>>   -SRC_URI = 
>>> "git://github.com/python-pillow/Pillow.git;branch=9.2.x;protocol=https 
>>> \
>>> +SRC_URI = 
>>> "git://github.com/python-pillow/Pillow.git;branch=main;protocol=https \
>>> file://0001-support-cross-compiling.patch \
>>> file://0001-explicitly-set-compile-options.patch \
>>>              "
>>> @@ -39,4 +39,4 @@ RPROVIDES:${PN} += "python3-imaging"
>>>     BBCLASSEXTEND = "native"
>>>   -SRCREV = "58acec3312fb8671c9d84829197e1c8150085589"
>>> +SRCREV = "d594f4cb8dc47fb0c69ae58d9fff86faae4515bd"
>>>
>>> -=-=-=-=-=-=-=-=-=-=-=-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#100894): 
>>> https://lists.openembedded.org/g/openembedded-devel/message/100894
>>> Mute This Topic: https://lists.openembedded.org/mt/96664649/3616698
>>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>>> Unsubscribe: 
>>> https://lists.openembedded.org/g/openembedded-devel/unsub 
>>> [akuster808@gmail.com]
>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>
>>
>
> -- 
> # Randy MacLeod
> # Wind River Linux


