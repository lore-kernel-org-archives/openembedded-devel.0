Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12693E9129C
	for <webhook@archiver.kernel.org>; Thu,  5 Feb 2026 09:24:10 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16845.1770283448131474251
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Feb 2026 01:24:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=PH+XlZdN;
 spf=pass (domain: konsulko.com, ip: 209.85.128.68, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-482f2599980so7794945e9.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Feb 2026 01:24:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1770283446; x=1770888246; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U3JDF0LgZYSI2XyArUjCxzPEIniNSveDhqGbBYQKYcI=;
        b=PH+XlZdNcrE2zIze5Y6u+0TeT/4+DUGpfb41LpmVEM++i0+Em2NYvAuz+BCE8R93G7
         VbHjWe0U9otqn0XuJbHHfKDI4Mzame7S6BWZT9e30WwVirm7XixTo2Np0D0AMMh8b7RE
         BgAmIzGrR7/kbdz2Rp4jZHcMvWeAjzE8ysUbQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770283446; x=1770888246;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U3JDF0LgZYSI2XyArUjCxzPEIniNSveDhqGbBYQKYcI=;
        b=NqxjETyCFl2JK+tTY8qB0rR6cGwnl3+n7iaJYeJRkkwCiTtvYxLAK9e+ABopt77xUg
         C/xCdmTr6LXiT05IRtARmOSIYQ1uf2HuCxn7VzhvBI3rQ+2J5l081GfgeCpHFyq6IrpA
         zSualnVgC8WG2yX9n3ZG9GvWkhL73dg8U8KWaO0m9hMVForwIpxh3FWbv8tHISYPsbEK
         QZWZxx9v9Diiu0YZ0yRMsdEpRBvsG4b78jOiNi2mVRI0jxC9V5mghsx+rSBqSi1VQ0Y4
         Uhsx2NYjjOwRmJnnWlsY8aqji+kzayqTiRa2eJwEZtkZ982C6Ho4rPv7RmmXNZM849jK
         +www==
X-Gm-Message-State: AOJu0Yz7Olye75w98ZABi3Z9fWj2ASba2RzF4orVpW9DmmvIwzJQ9mIm
	FwGHnjCa+nwa7dB0JzkZaKwlRO+GxvT6tSOFHsEQxr7fU5VHkZJIm6r4968O/aGiyHI=
X-Gm-Gg: AZuq6aLrwytagjFYBWwoJJAFt833EzmoZ24Nc3gljVXFNe38j4LyoFE0BVS05MPHZ0X
	YcIDMybIyJbkDDvDft5I11CzJUIYTQVjb58BNdh3YqnU8njQ5cQPqEOQu79R9SV2d1bHBIR8BZ/
	ElhgAHiqkuILU6a1imZwf5MDeWGRt7/c1zCEwmw+P9gKmVVshdRQyMPTJhl+uBdtrV3jT4FEu1T
	W24fEaI3bIRlENBu031hxhuCr6Xbob4jHlzWiAi/YSEHNOrD02C9Va/GYD+zCuLssCAhKLExLLo
	YmV6IZj3bzK6P6yWHPBeLevwipuEtZFtP3vsCz6HXGLs4Kwj6xd7D6bXHxIXqBet+t4hnSIrLqm
	oC2SdXoutm4eBBQ++YBoq3WpUF8G8J1Ga1yXAsu1XbriTL40E4EG3Jw7+xAZSNmhF45wgx0z8BD
	vbHG1+v3cF25YPHFz+Eqliuef2Y5Th
X-Received: by 2002:a05:600d:844f:10b0:480:7162:fa48 with SMTP id 5b1f17b1804b1-4830e9492aamr57696915e9.13.1770283446374;
        Thu, 05 Feb 2026 01:24:06 -0800 (PST)
Received: from [192.168.5.161] ([46.55.231.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4830ec810absm40634775e9.7.2026.02.05.01.24.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Feb 2026 01:24:05 -0800 (PST)
Message-ID: <0b44133b-1237-4c26-979a-47923c7d6926@konsulko.com>
Date: Thu, 5 Feb 2026 11:24:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] valkey: Upgrade 9.0.1 -> 9.0.2
To: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20260204143603.1103031-1-leon.anavi@konsulko.com>
 <CA+s=J=zzMn4GTQCRj+J43737MvsbkMCgMTX9Fg+-0=nNiE3Y_A@mail.gmail.com>
Content-Language: en-US
From: Leon Anavi <leon.anavi@konsulko.com>
In-Reply-To: <CA+s=J=zzMn4GTQCRj+J43737MvsbkMCgMTX9Fg+-0=nNiE3Y_A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Feb 2026 09:24:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124203

Hi Anuj,

On 2/5/26 09:32, Anuj Mittal wrote:
> On Wed, Feb 4, 2026 at 10:36 PM Leon Anavi via lists.openembedded.org
> <leon.anavi=konsulko.com@lists.openembedded.org> wrote:
>> Upgrade to release 9.0.2:
>>
>> - Avoid memory leak of new argv when HEXPIRE commands target only
>>    non-exiting fields
>> - Fix HINCRBY and HINCRBYFLOAT to update volatile key tracking
>> - Avoid empty hash object when HSETEX added no fields
>> - Fix case-sensitive check for the FNX and FXX arguments in HSETEX
>> - Prevent assertion in active expiration job after a hash with
>>    volatile fields is overwritten
>> - Fix HRANDFIELD to return null response when no field could be
>>    found
>> - Fix HEXPIRE to not delete items when validation rules fail and
>>    expiration is in the past
>> - Fix how hash is handling overriding of expired fields overwrite
>> - HSETEX - Always issue keyspace notifications after validation
>> - Make zero a valid TTL for hash fields during import mode and data
>>    loading
>> - Trigger prepareCommand on argc change in module command filters
>> - Restrict TTL from being negative and avoid crash in import-mode
>> - Fix chained replica crash when doing dual channel replication
>> - Skip slot cache optimization for AOF client to prevent key
>>    duplication and data corruption
>> - Fix used_memory_dataset underflow due to miscalculated
>>    used_memory_overhead
>> - Avoid duplicate calculations of network-bytes-out in slot stats
>>    with copy-avoidance
>> - Fix XREAD returning error on empty stream with + ID
>> - Track reply bytes in I/O threads if commandlog-reply-larger-than
>>    is -1
>> - This makes it possible to mitigate a performance regression in
>>    9.0.1 caused by the related bug fix
>>
>> Fixes references to TMPDIR [buildpaths] and avoids [already-stripped].
>>
>> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
>> ---
>>   .../valkey/{valkey_9.0.1.bb => valkey_9.0.2.bb}        | 10 +++++++++-
>>   1 file changed, 9 insertions(+), 1 deletion(-)
>>   rename meta-oe/recipes-extended/valkey/{valkey_9.0.1.bb => valkey_9.0.2.bb} (87%)
>>
>> diff --git a/meta-oe/recipes-extended/valkey/valkey_9.0.1.bb b/meta-oe/recipes-extended/valkey/valkey_9.0.2.bb
>> similarity index 87%
>> rename from meta-oe/recipes-extended/valkey/valkey_9.0.1.bb
>> rename to meta-oe/recipes-extended/valkey/valkey_9.0.2.bb
>> index 1f27224772..3334f57599 100644
>> --- a/meta-oe/recipes-extended/valkey/valkey_9.0.1.bb
>> +++ b/meta-oe/recipes-extended/valkey/valkey_9.0.2.bb
>> @@ -15,7 +15,7 @@ SRC_URI = "git://github.com/valkey-io/valkey.git;branch=9.0;protocol=https;tag=$
>>              file://0001-src-Do-not-reset-FINAL_LIBS.patch \
>>              file://GNU_SOURCE-7.patch \
>>              "
>> -SRCREV = "ab3c953b80289d88991095f53c1235fc2f8b44d6"
>> +SRCREV = "1ac4cfe4c877a6cb8cb2e28fa7094055ac06f64b"
>>
>>   RPROVIDES:${PN} = "virtual-redis"
>>
>> @@ -44,6 +44,11 @@ do_compile() {
>>   }
>>
>>   do_install() {
>> +    # Remove debug paths to avoid TMPDIR [buildpaths] errors
>> +    sed -i -e 's#${TMPDIR}##g' ${UNPACKDIR}/${PN}-${PV}/src/valkey-benchmark
>> +    sed -i -e 's#${TMPDIR}##g' ${UNPACKDIR}/${PN}-${PV}/src/valkey-server
>> +    sed -i -e 's#${TMPDIR}##g' ${UNPACKDIR}/${PN}-${PV}/src/valkey-cli
>> +
> I think these should be using ${S} instead or the files in ${D} should
> be changed after install.


Yes, you are right. Thanks! Let's keep it simple: I've just sent v2 of 
the patch that uses ${S}.

Best regards, Leon


>
>>       export PREFIX=${D}/${prefix}
>>       oe_runmake install
>>       install -d ${D}/${sysconfdir}/valkey
>> @@ -63,6 +68,7 @@ do_install() {
>>       fi
>>   }
>>
>> +
>>   CONFFILES:${PN} = "${sysconfdir}/valkey/valkey.conf"
>>
>>   INITSCRIPT_NAME = "valkey-server"
>> @@ -71,3 +77,5 @@ INITSCRIPT_PARAMS = "defaults 87"
>>   SYSTEMD_SERVICE:${PN} = "valkey.service"
>>
>>   CVE_STATUS[CVE-2022-3734] = "not-applicable-platform: CVE only applies for Windows."
>> +
>> +INSANE_SKIP:${PN} = "already-stripped"
>> --
>> 2.47.3
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#124129): https://lists.openembedded.org/g/openembedded-devel/message/124129
>> Mute This Topic: https://lists.openembedded.org/mt/117634817/3616702
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [anuj.mittal@oss.qualcomm.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

