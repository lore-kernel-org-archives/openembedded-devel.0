Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4CFED1D884
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 07:44:43 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38265.1764834274371891118
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Dec 2025 23:44:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=W969VQn3;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-42e2e239ec0so416413f8f.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 Dec 2025 23:44:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764834273; x=1765439073; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t+87ncA7s7IOAAsxCa+Ijh6qnCUx+9QtNznR0MgFQIk=;
        b=W969VQn3Embu/arvXMvr0keQMNYR/EgNAu7u6AsLfcZ3NQkhYWkrjDES+V/hZHUecO
         Jtxu41M84+bTyoVSuBwuPGga6S6EsKYuXM/q7GtWiU/kHZZ/GwHr7x13Kdk1l57FIb4R
         pkyHTF6ZgpvGU+6Zd0cG/DSIdPbL9+onayS/PUVp9sDfRnOiGO8LzZcikxnbZ8QTq8gf
         BO5NTUAL+Ml8mEpZXyeabj2nskd3qaaw0LF1Mo75BI08+pOc2qZgJUfzGbWH2Y57VI4P
         SleXK6xaIQtU8L/MY2M5Fb+wzLIZFbipp4wNJiks1gBvqRQyAN6LTc/LDZzorPaymZa/
         n6yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764834273; x=1765439073;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t+87ncA7s7IOAAsxCa+Ijh6qnCUx+9QtNznR0MgFQIk=;
        b=pNDO0CVCwxnPXOsMm68pfeDNL+aH6VYgrFf3i0gENJfs32herMzxEJj4azriFs9SL4
         GndHiO5vVbovmp+AljCB44yWkhHts2RJbV1N9CWrbVK91WRs+lkAHKRqOEupfPoK3SZr
         tq87+cjLjx1uF8Mnvy+/Sb4vaz7+xsXQ3UuMebU4lUEcx3W+2idd9gHXEoGqvoBkqcal
         PBIKf0y9+Fep9UZG9E7E/2PXN6xobmyhxXogCRbpiF0UOKTyrGg1xq6GutznStHOPWFx
         VwDLh3W0/WXKxCmIipCLPnFGLnQTO9NsrsGfxEKQ7X1wQ+LYf+MbhbrchCWwjf+mVCXE
         LiKg==
X-Gm-Message-State: AOJu0YxX3eI9WoFuwvsAO6fCaZq3n7VM0PbAxrNRZUXdCka6hCI1LfUj
	NmJ9KD51oARgrIygK6Urqz9sPTVODd/msxhwF114CaZKqYA63pPNNdY+
X-Gm-Gg: ASbGnctoLJkQBB64FeXSZHL6NyAqhQz1l8fb9MBTYUSYbCxco0DdkwcY09HW1lp6HmK
	tSxqFPjWbqZbpTEX42wkdgqhI2kz/rpvdKGBNO7QoICZl4TnbnwcR0e21wecwSxj0esVRX7kj1g
	71fvUZQ/DOH/7bXRKOPG56oekMJCuZrYdyO9CHJdbGuvicQ6ZadPIgRrdLlFs27zlBkm3zEGifk
	j1cCucSaLrP0UbKMyHp0pUUGFUw2SxDFmlf7ZTtkOnHmOSpKSf56F4qS8g30YW7g2OTIkk0WHkY
	61NzvvvB0euUlzpixZ/pmQBvqb+tgfABUEkFSpLo5A0MoKgV4D3rwdzZn8YNSCK08zIiELh04Nv
	QDs525mrRe/JFFb+TsQ/p4Yp+5nhtY6oh0JDNIxNKjWuSwByIbv8/aEKvguGf6QoupwWYXbHAPR
	BVQUKl0oNwKUzptUDN+NI=
X-Google-Smtp-Source: AGHT+IEMKmXOrmxt7grX+BocKSGljOIfvmIX1N0l/LT4gLYPBb1ic52H/lHkOr5wIcoLPylDUuiukg==
X-Received: by 2002:a05:6000:607:b0:42b:40df:2339 with SMTP id ffacd0b85a97d-42f731bd331mr5192555f8f.57.1764834272564;
        Wed, 03 Dec 2025 23:44:32 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7cbfee66sm1651503f8f.11.2025.12.03.23.44.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Dec 2025 23:44:32 -0800 (PST)
Message-ID: <59f6c479-8b86-4170-903b-723a709e2089@gmail.com>
Date: Thu, 4 Dec 2025 08:44:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][scarthgap][PATCH 07/12] xrdp: patch CVE-2022-23482
To: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20251203212949.4046524-1-skandigraun@gmail.com>
 <20251203212949.4046524-7-skandigraun@gmail.com>
 <CA+s=J=yaHySJQz4O2EmkqD=r_ZsN24keObg9q8c06UHcJadcPQ@mail.gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <CA+s=J=yaHySJQz4O2EmkqD=r_ZsN24keObg9q8c06UHcJadcPQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Dec 2025 07:44:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122302

On 12/4/25 05:02, Anuj Mittal wrote:
> On Thu, Dec 4, 2025 at 3:00 AM Gyorgy Sarvari via
> lists.openembedded.org <skandigraun=gmail.com@lists.openembedded.org>
> wrote:
>> Details: https://nvd.nist.gov/vuln/detail/CVE-2022-23482
>>
>> Pick the patch that mentions this vulnerability explicitly.
>>
>> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
>> ---
>>  .../xrdp/xrdp/CVE-2022-23482.patch            | 69 +++++++++++++++++++
>>  meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb   |  1 +
>>  2 files changed, 70 insertions(+)
>>  create mode 100644 meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23482.patch
>>
>> diff --git a/meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23482.patch b/meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23482.patch
>> new file mode 100644
>> index 0000000000..5c22701d35
>> --- /dev/null
>> +++ b/meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23482.patch
>> @@ -0,0 +1,69 @@
>> +From bb9766c79f24a0238644e273bbcdcb2c9d2df1bf Mon Sep 17 00:00:00 2001
>> +From: matt335672 <30179339+matt335672@users.noreply.github.com>
>> +Date: Wed, 7 Dec 2022 11:05:46 +0000
>> +Subject: [PATCH] CVE-2022-23482
>> +
>> +Check minimum length of TS_UD_CS_CORE message
>> +
>> +CVE: CVE-2022-23482
>> +Upstream-Status: Backport[https://github.com/neutrinolabs/xrdp/commit/bb9766c79f24a0238644e273bbcdcb2c9d2df1bf]
> This causes yocto-check-layer to fail for this and other patches in
> this series with same issue:

D'oh, thanks, will send a v2. I wonder why did this not warn during
regular QA checks on Scarthgap.

>
> AssertionError: 9 != 0 : Found following patches with malformed or
> missing upstream status:
> /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23481.patch
> /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23483.patch
> /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23480-2.patch
> /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23468.patch
> /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23479.patch
> /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23480-1.patch
> /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23478.patch
> /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23477.patch
> /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23482.patch
>
>
>
>> +Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
>> +---
>> + libxrdp/xrdp_sec.c | 23 ++++++++++++++++++++++-
>> + 1 file changed, 22 insertions(+), 1 deletion(-)
>> +
>> +diff --git a/libxrdp/xrdp_sec.c b/libxrdp/xrdp_sec.c
>> +index 691d4f04f3..084fca6b8d 100644
>> +--- a/libxrdp/xrdp_sec.c
>> ++++ b/libxrdp/xrdp_sec.c
>> +@@ -1946,6 +1946,17 @@ xrdp_sec_send_fastpath(struct xrdp_sec *self, struct stream *s)
>> + static int
>> + xrdp_sec_process_mcs_data_CS_CORE(struct xrdp_sec *self, struct stream *s)
>> + {
>> ++#define CS_CORE_MIN_LENGTH \
>> ++    (\
>> ++     4 +            /* Version */ \
>> ++     2 + 2 +        /* desktopWidth + desktopHeight */ \
>> ++     2 + 2 +        /* colorDepth + SASSequence */ \
>> ++     4 +            /* keyboardLayout */ \
>> ++     4 + 32 +       /* clientBuild + clientName */ \
>> ++     4 + 4 + 4 +    /* keyboardType + keyboardSubType + keyboardFunctionKey */ \
>> ++     64 +           /* imeFileName */ \
>> ++     0)
>> ++
>> +     int version;
>> +     int colorDepth;
>> +     int postBeta2ColorDepth;
>> +@@ -1956,7 +1967,12 @@ xrdp_sec_process_mcs_data_CS_CORE(struct xrdp_sec *self, struct stream *s)
>> +
>> +     UNUSED_VAR(version);
>> +
>> +-    /* TS_UD_CS_CORE requiered fields */
>> ++    /* TS_UD_CS_CORE required fields */
>> ++    if (!s_check_rem_and_log(s, CS_CORE_MIN_LENGTH,
>> ++                             "Parsing [MS-RDPBCGR] TS_UD_CS_CORE"))
>> ++    {
>> ++        return 1;
>> ++    }
>> +     in_uint32_le(s, version);
>> +     in_uint16_le(s, self->rdp_layer->client_info.width);
>> +     in_uint16_le(s, self->rdp_layer->client_info.height);
>> +@@ -1994,6 +2010,10 @@ xrdp_sec_process_mcs_data_CS_CORE(struct xrdp_sec *self, struct stream *s)
>> +               clientName);
>> +
>> +     /* TS_UD_CS_CORE optional fields */
>> ++    if (!s_check_rem(s, 2))
>> ++    {
>> ++        return 0;
>> ++    }
>> +     in_uint16_le(s, postBeta2ColorDepth);
>> +     LOG_DEVEL(LOG_LEVEL_TRACE, "Received [MS-RDPBCGR] TS_UD_CS_CORE "
>> +               "<Optional Field> postBeta2ColorDepth %s",
>> +@@ -2138,6 +2158,7 @@ xrdp_sec_process_mcs_data_CS_CORE(struct xrdp_sec *self, struct stream *s)
>> +               "<Optional Field> desktopOrientation (ignored)");
>> +
>> +     return 0;
>> ++#undef CS_CORE_MIN_LENGTH
>> + }
>> +
>> + /*****************************************************************************/
>> diff --git a/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb b/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb
>> index ff14cf8397..29245f3747 100644
>> --- a/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb
>> +++ b/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb
>> @@ -23,6 +23,7 @@ SRC_URI = "https://github.com/neutrinolabs/${BPN}/releases/download/v${PV}/${BPN
>>             file://CVE-2022-23480-1.patch \
>>             file://CVE-2022-23480-2.patch \
>>             file://CVE-2022-23481.patch \
>> +           file://CVE-2022-23482.patch \
>>             "
>>
>>  SRC_URI[sha256sum] = "db693401da95b71b4d4e4c99aeb569a546dbdbde343f6d3302b0c47653277abb"
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#122285): https://lists.openembedded.org/g/openembedded-devel/message/122285
>> Mute This Topic: https://lists.openembedded.org/mt/116602085/3616702
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [anuj.mittal@oss.qualcomm.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>


