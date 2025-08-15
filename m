Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F37BCA0ED1
	for <webhook@archiver.kernel.org>; Fri, 15 Aug 2025 09:24:49 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web10.7949.1755249887513529761
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Aug 2025 02:24:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=T705QL19;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-afcb73621fcso230933466b.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 15 Aug 2025 02:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755249886; x=1755854686; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CKlP81b5KAkWUlvenRyv6ffx4qKXAz9Ky2rzD2fnS9Q=;
        b=T705QL19H+WM+0NRw41FS2pQL2+orOMR9XdycYIy72b4rBpal4xoEXqnQTO7f6BkQ1
         yCJ1ETtCLCnROFrg/fTivJ3KhwAXxajkSQW1jOdkLt2X5mq0K4QYsZ01udRVUIa6yCzo
         4TKFGfAhl1anFnZ5aIxZbpI9JsQQsizfdKFf6EfbU3P4nSSUGJFSp+8ibw5pIoZ3FzbO
         KSgn8Z2J1St6hS8X+EyHE/KKy5ltFOP4po9EJPNYVFbYgNX+WWcB2rVaxhAdXgg2KPOm
         iwKqJULefVzmpPnN/Xqg5JFhvsfROKKEjPRj8mDMKs6l5YoSPgHzs8OBmB+YCiwkroMf
         Nzgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755249886; x=1755854686;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CKlP81b5KAkWUlvenRyv6ffx4qKXAz9Ky2rzD2fnS9Q=;
        b=oU66DcBNwXkEpZbE2hvgI0pUZ1PD9fCWY3kMbERxsbWVaM9a2Irunv5+Gr5k2vVc1l
         la0Ifue+oGkVzArigEVYyhk+g6v7cnVf9nvMC23x+Qt2XKW4c+Ez6nAWobftH7NnXT6R
         RztyvLGCWSedf+kHaZbkAagZxqvXp0Ti2Hm2XOL8iPGfKgVjo9+/Gn2HlZ2K4RdHVsTS
         BtXMnSEJBBz/ce62ssQtVtDJjcyVcMdBiljaxNLHiPjhhAfNm0M49idilFkh30lRhP4W
         wHelq+d9KqYRTrinh8lxIKfQ5ZFyI77Vuk8yYZMjKUbGSKhHGrysM+KuJOuRRL+eRO4+
         Wz7w==
X-Forwarded-Encrypted: i=1; AJvYcCV/bhw5wQ4/7hTnKHHRIBsr9n92AVsyWJYyop0XzbFn9xvcIo1V+xIi0EX/b7f7i6HAuP6gW0IT+LqzsF015TDXz5A=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw38Wpzl5o3EdCuaFyPLrsftyFVwERZiXoJ6GRvAO4XgpNyY3vZ
	oZb28p/v80aMGybvP5McwGQQ5+TWDFN+uRsUnKafkKrzXOkqUlXn7oNa
X-Gm-Gg: ASbGncvQKsuOdN68pnk1OArRl71aIdO+V669KBifQTxKaBERw83KRciBPdVLtzkTIuw
	BTDwmu7+us4/tI+K95W24wcRcH2SRdkcgdVRMGRcGxcnrrMdJDWC6/95kCdgDUekzotyBXzzSwL
	QQpzvn/c6VY98q8cy/oJ+OUPbRg4w3GrsSuZyDoQSmsmfFiInmMfZtWPT5jvHheJ2MRU7vsiBfH
	NVatYV+jI38Ix5UOBQcbK0aZbQ/fdE/rFPaHOUIgjXupkX/M1EW/d7dRRFPkeKz6taZAE5BOM5J
	nrEzYh3/ZldCdrLJfZrTW7EwTPbaB3oVNcPtT0dQQF06rVG8LsfwAuf3HhkTahx41ZHwyUdXe79
	QXwbplv9CeY74dmD6845WICZ9BVpFQg==
X-Google-Smtp-Source: AGHT+IHrE/FMYFzhmhAfQmXyuSOkFfAp/OOIX0bWwEYu65jZcUE6rh88J4gAp3IplFMfc94niwz9kw==
X-Received: by 2002:a17:907:94d0:b0:af9:406d:f0a8 with SMTP id a640c23a62f3a-afcdc1afa75mr124465766b.23.1755249885419;
        Fri, 15 Aug 2025 02:24:45 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdce53eccsm104650966b.19.2025.08.15.02.24.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Aug 2025 02:24:45 -0700 (PDT)
Message-ID: <ca874a51-93f1-4c38-bf27-1fab243f4395@gmail.com>
Date: Fri, 15 Aug 2025 11:24:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-networking][PATCH] meta-networking: mbedtls: Remove
 tag from SRC_URI
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: raj.khem@gmail.com, d.schultz@phytec.de,
 openembedded-devel@lists.openembedded.org, upstream@lists.phytec.de
References: <20250814225042.3310913-1-d.schultz@phytec.de>
 <CAMKF1sqM_bVMcSJ+929XJ8DK_4_NDhDN75KtnTtF=Rz+bRkFgQ@mail.gmail.com>
 <63158bab-8681-4e23-af58-418e2874ea78@gmail.com>
 <CANNYZj-xiJWKedBF-k9rzA5W734b1cMkz3U91Ahjt7upjTA8oQ@mail.gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <CANNYZj-xiJWKedBF-k9rzA5W734b1cMkz3U91Ahjt7upjTA8oQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Aug 2025 09:24:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118965

On 8/15/25 11:08, Alexander Kanavin wrote:
> Same as the other proposed patch. I would not take it before there is
> an explanation of why the issue suddenly appeared. Did something
> change in scarthgap, or is there a mismatch between the tag and
> revision?

The tag+revision matching was introduced in walnascar, before that it
was either/or. This patch got into scarthgap, which uses this:
https://lists.openembedded.org/g/openembedded-devel/message/118611

>
> Alex
>
> On Fri, 15 Aug 2025 at 07:53, Gyorgy Sarvari via
> lists.openembedded.org <skandigraun=gmail.com@lists.openembedded.org>
> wrote:
>> On 8/15/25 04:06, Khem Raj via lists.openembedded.org wrote:
>>> I wonder why it works on autobuilder. Can you try with bitbake -ccleanall ?
>>> and see if fetching works. I can see the SRCREV is same as v3.6.4 tag.
>> Was this patch meant for scarthgap, where mbedtls got just broken due to
>> this rev vs tag issue?
>>
>>
>>> On Thu, Aug 14, 2025 at 3:51 PM Daniel Schultz via
>>> lists.openembedded.org <d.schultz=phytec.de@lists.openembedded.org>
>>> wrote:
>>>> This recipe uses SRCREV as well as defines a tag in the SRC_URI.
>>>> Only use SRCREV since this will generate an error.
>>>>
>>>> Fix following error:
>>>>   [...] FetchError: Fetcher failure: Conflicting revisions
>>>>   (c765c831e5c2a0971410692f92f7a81d6ec65ec2 from SRCREV and v3.6.4
>>>>   from the url) found, please specify one valid value
>>>>
>>>> Signed-off-by: Daniel Schultz <d.schultz@phytec.de>
>>>> ---
>>>>  meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.4.bb | 2 +-
>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.4.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.4.bb
>>>> index 88b50a406b..a0dc6a689a 100644
>>>> --- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.4.bb
>>>> +++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.4.bb
>>>> @@ -23,7 +23,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=379d5819937a6c2f1ef1630d341e026d"
>>>>  SECTION = "libs"
>>>>
>>>>  S = "${WORKDIR}/git"
>>>> -SRC_URI = "gitsm://github.com/Mbed-TLS/mbedtls.git;protocol=https;branch=mbedtls-3.6;tag=v${PV} \
>>>> +SRC_URI = "gitsm://github.com/Mbed-TLS/mbedtls.git;protocol=https;branch=mbedtls-3.6 \
>>>>             file://run-ptest \
>>>>             "
>>>>
>>>> --
>>>> 2.25.1
>>>>
>>>>
>>>>
>>>>
>>>>
>>>>
>>>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#118958): https://lists.openembedded.org/g/openembedded-devel/message/118958
>> Mute This Topic: https://lists.openembedded.org/mt/114709547/1686489
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [alex.kanavin@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>


