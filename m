Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web09.21207.1612115043507415683
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 31 Jan 2021 09:44:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZkL5yRPE;
 spf=pass (domain: gmail.com, ip: 209.85.215.169, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id i7so10428805pgc.8
        for <openembedded-devel@lists.openembedded.org>; Sun, 31 Jan 2021 09:44:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=CA4hvexW/Vh1kDGl7cnXeOJeZzn5J5x2m0LvMyZAIkM=;
        b=ZkL5yRPEPrGNct/ZjlR47igsLbvQGHuJFgT6AP/O2zMMX2MiC55hKX2uLnQmbjvU0D
         ZJqIIy2RzSU1jl/ZS0j17YhxvdTDDbNXQnOCcttQIZmM8m9vYQfULU9RKHN8knE6ZbtF
         YyJ/pz9AieGpDEAWNSd4h7MX4WNWdsbCchEHvfmz6n5Ro1ZY9Ondc89Rg/1JvmZm0nrB
         RNbagEgk9IZcqJyWMvO2g1nL5Z0auNjSD5pB6MhMGAng9nLGZwimOmkqOXQWj81Lc/R+
         jWleUMB6SifwNT0YkoWv42u1bs8qr7c9lUuJWWXtBp84w2jBjNtoLLwoxa1zupkr1z5P
         hRpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-transfer-encoding:content-language;
        bh=CA4hvexW/Vh1kDGl7cnXeOJeZzn5J5x2m0LvMyZAIkM=;
        b=d+cWW8HJa/fSYlUGgxksu7i40cWQYBkWIydVaDkwAd8zZWtvU/gQcO9FjTCcOzaQkh
         qyPsVdQ+YTc1JM30bBRCA1jRI8KXdX2iZqTffjrQ72WtAM1OJ0lFCbPktHTFLq7ug8/R
         jJOQmnbIsgclM6H/DtCn58OZy4y2oMG5FvbJv8ZmWLTAch8BVQVZaW5iXmmWUPgrsqrz
         InQC9Xa3qNgTzvkIkuj4vcuVAj3kv9j7V5yT5jE8DCV5iwPU0vptwlXy3xisHiSOruaZ
         PhDbFtWbtTUKE/Tci1346dfcAa/zVAoKqv9ybvGeRx6HQgnvSOZvBRYcdRX1IFNsfsnb
         8iBw==
X-Gm-Message-State: AOAM5320rKqt9bFnkrkx9Vwzv9u/BdCr9EK82YBHewWgMriw8HLHkHYh
	mXqQ81UB5Y5w/B2zBrOft+g6/ToVS9k8DQ==
X-Google-Smtp-Source: ABdhPJyGYv39ICThuNephk54ivmGnGWhlsnhwPNaZB/8CRKjxWCNLPTcvXdfpzmkP7bafh/4DvBINg==
X-Received: by 2002:aa7:988e:0:b029:1cd:409b:8c57 with SMTP id r14-20020aa7988e0000b02901cd409b8c57mr1460658pfl.81.1612115042786;
        Sun, 31 Jan 2021 09:44:02 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:ad82:c8d3:65fc:8728? ([2601:202:4180:a5c0:ad82:c8d3:65fc:8728])
        by smtp.gmail.com with ESMTPSA id p15sm15029037pfn.172.2021.01.31.09.44.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 Jan 2021 09:44:02 -0800 (PST)
Subject: Re: [oe] [dunfell 00/13] Patch review Jan 30
To: Andrey Zhizhikin <andrey.z@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
References: <cover.1612035229.git.akuster808@gmail.com>
 <CAHtQpK4jpZET4UZ=-34AJSvOCUGqOAVKMn-L-dh7WiLzerJPKg@mail.gmail.com>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <4205f0a8-f747-264a-9c39-84dd2b4221cc@gmail.com>
Date: Sun, 31 Jan 2021 09:44:00 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAHtQpK4jpZET4UZ=-34AJSvOCUGqOAVKMn-L-dh7WiLzerJPKg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 1/30/21 1:53 PM, Andrey Zhizhikin wrote:
> Hello Armin,
>
> On Sat, Jan 30, 2021 at 8:37 PM akuster <akuster808@gmail.com> wrote:
>> Here are the next block of changes for dunfell.
>> Please have comments back my Tues
> Would it be possible to include also the following commit from master:
> 04afc692a gpsd: mark CLEANBROKEN
got. thanks for the request.

-armin
>
> This solves sporadic build errors for gpsd on dunfell, see
> https://lists.openembedded.org/g/openembedded-core/message/147317
>
>> Yes, this is out-of-sync with Gatesgath but I am seeing build issues there and did not want to hold up this review cycle.
>>
>> Clean world build
>>
>> The following changes since commit 5bba79488b7d393d2258d6e917f7bf7b0d7c4073:
>>
>>   gupnp: Upgrade to 1.2.2 -> 1.2.4 (2021-01-18 08:40:15 -0800)
>>
>> are available in the Git repository at:
>>
>>   git://git.openembedded.org/meta-openembedded-contrib stable/dunfell-nut
>>   http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=stable/dunfell-nut
>>
>> Dan Murphy (1):
>>   mariadb: Fix 64bit builds if pam is enabled
>>
>> Dmitry Baryshkov (2):
>>   xterm: install xterm and uxterm desktop files
>>   xterm: provide virtual/x-terminal-emulator
>>
>> Harpritkaur Bhandari (1):
>>   rapidjson: Upgrade SRCREV to latest
>>
>> Khem Raj (2):
>>   iscsi-initiator-utils: Upgrade to _2.1.2
>>   iscsi-initiator-utils: Silence a clang warning on 64bit systems
>>
>> Leon Anavi (2):
>>   sip3: Consolidate in a single file
>>   sip3: Upgrade 4.19.19 -> 4.19.23
>>
>> Martin Jansa (1):
>>   networkd-dispatcher: use git fetcher
>>
>> Mikko Rapeli (2):
>>   flatbuffers: whitelist CVE-2020-35864
>>   giflib: apply patch for CVE-2019-15133 and set CVE_PRODUCT
>>
>> Søren Andersen (1):
>>   zram: fix sourcing of zram parameters
>>
>> zangrc (1):
>>   iscsi-initiator-utils: upgrade 2.1.2 -> 2.1.3
>>
>>  .../0001-Makefile-Do-not-set-Werror.patch     | 31 +++++++++++++++++++
>>  ....1.0.bb => iscsi-initiator-utils_2.1.3.bb} |  9 ++----
>>  .../networkd-dispatcher_2.0.1.bb              |  7 +++--
>>  meta-oe/recipes-dbs/mysql/mariadb.inc         |  8 +++--
>>  .../flatbuffers/flatbuffers_1.12.0.bb         |  3 ++
>>  .../giflib/files/CVE-2019-15133.patch         | 23 ++++++++++++++
>>  .../recipes-devtools/giflib/giflib_5.1.4.bb   |  7 ++++-
>>  .../rapidjson/rapidjson_git.bb                |  5 ++-
>>  meta-oe/recipes-devtools/sip/sip3_4.19.19.bb  | 11 -------
>>  .../sip/{sip.inc => sip3_4.19.23.bb}          | 17 ++++++++--
>>  .../recipes-extended/zram/zram/zram-swap-init |  2 +-
>>  .../recipes-graphics/xorg-app/xterm_353.bb    | 16 ++++++++--
>>  12 files changed, 107 insertions(+), 32 deletions(-)
>>  create mode 100644 meta-networking/recipes-daemons/iscsi-initiator-utils/files/0001-Makefile-Do-not-set-Werror.patch
>>  rename meta-networking/recipes-daemons/iscsi-initiator-utils/{iscsi-initiator-utils_2.1.0.bb => iscsi-initiator-utils_2.1.3.bb} (96%)
>>  create mode 100644 meta-oe/recipes-devtools/giflib/files/CVE-2019-15133.patch
>>  delete mode 100644 meta-oe/recipes-devtools/sip/sip3_4.19.19.bb
>>  rename meta-oe/recipes-devtools/sip/{sip.inc => sip3_4.19.23.bb} (79%)
>>
>> --
>> 2.17.1
>>
>>
>> 
>>
> Thanks a lot!
>

