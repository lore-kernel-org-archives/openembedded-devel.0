Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C2EC1077616
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 20:22:40 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23807.1773865354169970375
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Mar 2026 13:22:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fJGcweRq;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48374014a77so2432345e9.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 18 Mar 2026 13:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773865352; x=1774470152; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8upALaK0t0HbJiSa2Vb4oKf9ttywPZ4IGXdIU+Ke2aQ=;
        b=fJGcweRqiwBjikyzznz4TWCk4CVn/e8SDJYJUq94nTXYia0sxyFxsb3lFVk2Z5Ba7l
         HtW34YnW4YpnF5OCAZASkOuClEKRQeGU39MA0itXxUTkb6j3BL8K7j2R1IHOz0+uSirs
         p7aLf1EdphLJ5IW17kxM45O9SWL8uwdERQ1DU5hAVCY1s6WRD7pOUu5fwyRJjE9UkYch
         Ck5IQF/FdMwyYE+uS5i8g5v0qPplyI7n++MRG+RBVODQQU4eUvtrw2Q1cnpOoIp8YuUa
         SdD+1u8mAIjf0XKi1MTzj/GmkcbjUm0naDDaqNVxi0Lo5n+NXrwGCvMqeFvL+Qp9Cmus
         cfgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773865352; x=1774470152;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8upALaK0t0HbJiSa2Vb4oKf9ttywPZ4IGXdIU+Ke2aQ=;
        b=meyNpnurmefe+zxVsQxmlWM994svkWTVP3mzfNd+8+GdEpLSVlHjqAEP1zxOPz/+PS
         oHFz68w7FV/fBm/FO9VxQfU8ySbkhkQOb/z5ZdnV8WprCTLLXgTi1saOTonetfhgTGeo
         +9h8O9bPjyWV8nT8+vQJjZlW5eNPAm3L4PA+rHoiG3fzyI9q2VLi4MolbhV7bMw50oST
         yXXok/IapMkpasaoo2Jw2Bqdh+imdQKB2uf7Hb9hP3vi7upXvY2PyLubsqcXhAxtKAU4
         tyJEH6ySvqwBMd9nE/AmYAT2Zdo3fyQtn76FWQ1qPrXESFLCp9kyMLr0LYf0CbON3/f2
         gwvg==
X-Gm-Message-State: AOJu0Yx1A5doRvuC2XVqUWyKPJj8sPDX4gfN7aoBfT+RUZ9sK6ZZwbLJ
	RyprzDMSehHcxmCfebDJAhrR/jAMlo1oZRzQCnPYTeL3KXc00sqdVtd5
X-Gm-Gg: ATEYQzy7VDeQ6q6/sHvox1Qce2E6N6opr/JRn4tbirGbAS0MWZ+xhpzxLFKUyfoZtUC
	fpdy88ExlmKRIMZemVtRDgie2zr1tExb6qBc4L3zll9EBGWnek83P+YJOQ4nnxGEhKhgMlkJKPr
	WTCTpnQkF9KcFUJSgon8S7fkztcQbqGgE90LrP2SJCc8VOEINfRxGtqO7FKT2D+AL2TPcH3G899
	FnwfQ5uPHOJB3KGXDRFmf7SmvtbEB3MOvXOo5QZTtJ4JhM82/vzAD/kK7rWsbDnoeCe7dQA1BpV
	ukX558Iaz/+G/nlywIsuDtGhge/8rONxElaAWukPELH28mgZIghGIbPR+K5FwX3OXYvCDBdf09y
	/fvUNTpcrcDa39Ht0yWp6CypTTX+driyLsEfReO/lpk+kQYc99KOrGuNAZRjOYTVXg+btpokT/t
	chPzlSIhoPaCScCla6cILKAP3HelbLo94=
X-Received: by 2002:a05:600c:8484:b0:485:33ad:3c9f with SMTP id 5b1f17b1804b1-486f4474c27mr81938375e9.25.1773865352404;
        Wed, 18 Mar 2026 13:22:32 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f4d10a20sm62856855e9.0.2026.03.18.13.22.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 13:22:31 -0700 (PDT)
Message-ID: <1a738b88-e9fd-4a27-a577-0bfd4316ca95@gmail.com>
Date: Wed, 18 Mar 2026 21:22:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [PATCH] libssh: Upgrade 0.11.3 -> 0.11.4
To: ankur.tyagi85@gmail.com, jakubszczudlo40@gmail.com
Cc: openembedded-devel@lists.openembedded.org
References: <20260318190300.270982-1-jakubszczudlo40@gmail.com>
 <CADySD0E7DpkLgBU428-GmsT=Txjj2Lboq+W_EdsgeoAUPraddQ@mail.gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <CADySD0E7DpkLgBU428-GmsT=Txjj2Lboq+W_EdsgeoAUPraddQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 18 Mar 2026 20:22:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125366


On 3/18/26 20:37, Ankur Tyagi via lists.openembedded.org wrote:
> On Thu, Mar 19, 2026 at 8:03 AM Jakub Szczudlo via
> lists.openembedded.org
> <jakubszczudlo40=gmail.com@lists.openembedded.org> wrote:
>>
>> Release note:
>> https://www.libssh.org/2026/02/10/libssh-0-12-0-and-0-11-4-security-releases/
>>
>> Signed-off-by: Jakub Szczudlo <jakubszczudlo40@gmail.com>
>> ---
>>  .../libssh/{libssh_0.11.3.bb => libssh_0.11.4.bb}          | 7 ++++++-
>>  1 file changed, 6 insertions(+), 1 deletion(-)
>>  rename meta-oe/recipes-support/libssh/{libssh_0.11.3.bb => libssh_0.11.4.bb} (78%)
>>
>> diff --git a/meta-oe/recipes-support/libssh/libssh_0.11.3.bb b/meta-oe/recipes-support/libssh/libssh_0.11.4.bb
>> similarity index 78%
>> rename from meta-oe/recipes-support/libssh/libssh_0.11.3.bb
>> rename to meta-oe/recipes-support/libssh/libssh_0.11.4.bb
>> index 5928581312..c39b121be6 100644
>> --- a/meta-oe/recipes-support/libssh/libssh_0.11.3.bb
>> +++ b/meta-oe/recipes-support/libssh/libssh_0.11.4.bb
>> @@ -13,7 +13,7 @@ SRC_URI = "git://git.libssh.org/projects/libssh.git;protocol=https;branch=stable
>>
>>  SRC_URI:append:toolchain-clang = " file://0001-CompilerChecks.cmake-drop-Wunused-variable-flag.patch"
>>
>> -SRCREV = "301d0e16dfa8a5cac1cff956b6880ca90eb82864"
>> +SRCREV = "ca9c055d7c78ce357346ac7c2b14047568d47aa1"
>>
>>
>>  inherit cmake ptest
>> @@ -50,3 +50,8 @@ BBCLASSEXTEND = "native nativesdk"
>>
>>  CVE_STATUS[CVE-2025-5987] = "fixed-version: The vulnerability was fixed in 0.11.2"
>>  CVE_STATUS[CVE-2025-5318] = "fixed-version: The vulnerability was fixed in 0.11.2"
>> +CVE_STATUS[CVE-2026-0964] = "fixed-version: The vulnerability was fixed in 0.11.4"
>> +CVE_STATUS[CVE-2026-0965] = "fixed-version: The vulnerability was fixed in 0.11.4"
>> +CVE_STATUS[CVE-2026-0966] = "fixed-version: The vulnerability was fixed in 0.11.4"
>> +CVE_STATUS[CVE-2026-0967] = "fixed-version: The vulnerability was fixed in 0.11.4"
>> +CVE_STATUS[CVE-2026-0968] = "fixed-version: The vulnerability was fixed in 0.11.4"
> 
> These CVEs are not yet available in the NVD, don't think we should be
> adding them here.
> 

This update was submitted earlier also some time ago, it is currently
soaking in master-next[1] - it just took a bit of time to get there.

[1]:
https://git.openembedded.org/meta-openembedded/commit/?h=master-next&id=99e9d4aba13ae466a6e6fe5c56276917d295cf0b

