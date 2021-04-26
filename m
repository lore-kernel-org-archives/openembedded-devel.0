Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.9277.1619452972332871171
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Apr 2021 09:02:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QM/u3kE9;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id v13so15582133ple.9
        for <openembedded-devel@lists.openembedded.org>; Mon, 26 Apr 2021 09:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=u//+VDX074LgZBlODL0cSTrTKlamErZj0Y9u8nLQPQE=;
        b=QM/u3kE9yFbM1iqv+C2/B1Y/wJhqX4TSmVE2WXK5G4H6ccXYCn2ct+2JwQYRG70fCU
         3Z+QXs7dRXEEEjUll82WFds7ylhG/FdXtcaR6fy9ljVEJigrgdkBEk7vyXI7frvdC4x0
         8AypEQX4cnj/0iuTZFINjzc3vZ4fOWhelpEuzOF092dsD+IS6N9Mug8bFvy4odiIFFkX
         Ae3s7DdGLF/5aCHua75JdoKKicAm6M+l0DqUiuMbv1aH1mqX+mZggBriIqZ+ywhTvxJ2
         gAO9cwf0sfv5nbE4CwHjNsC+3YiFaY8HuXBlBMwB4Gwq5j7nIoLzVk1dnOBmD3Mf1Pc8
         Y0Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=u//+VDX074LgZBlODL0cSTrTKlamErZj0Y9u8nLQPQE=;
        b=j1RgLrD7fzZm/K0EVwWsIctlMTXne2fh/U0rzJK3MwAW568PA8Bsx1HiNf4f1NaBWk
         sdRC4kAm0KQr6M+WEzm0Jz8J/09ujLu2FcyZGLGsL7Hc8dSnPVYpwTVwrNGMwpySu3r4
         fRZy5aAutxy89l7BcDpXFALvTN3iWwKGDujlmIqRZaTTUvlF1wUjXUDQc015NyRUvL4A
         MJkhPRF5s2TJDG+twGrVfxlCFnXkre0BbySxvzKcMIcr2HUM9DgRI0PQltfSghxZtzfH
         n0dWgYAr1f/QDZjurlC5RsKGZPxZQEV4/Z4vbFX+tIw5bB57WMARmu195SUybjU5zm/C
         azIA==
X-Gm-Message-State: AOAM530tmhKXITSrj3J0Tt04/v69SqM6ZPxWWhfbEzeRQO8Ecv9S8qok
	CZcD0xqpa5kVKBFeV9Jqbj0=
X-Google-Smtp-Source: ABdhPJz+yFHKP46xbN8hyC8cSySuUijJ9X0A1usmS4b6NgBCyNQa4wlyBple8VIOWBvZ0uYqNxUpMA==
X-Received: by 2002:a17:90a:730c:: with SMTP id m12mr23298409pjk.111.1619452971763;
        Mon, 26 Apr 2021 09:02:51 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:1c81:c15:4155:b74d? ([2601:202:4180:a5c0:1c81:c15:4155:b74d])
        by smtp.gmail.com with ESMTPSA id k14sm2434258pgl.2.2021.04.26.09.02.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Apr 2021 09:02:51 -0700 (PDT)
Subject: Re: [oe] Hardknott merge request - April 25th
To: Randy MacLeod <randy.macleod@windriver.com>, Khem Raj
 <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
 "Yang, Liezhi" <Liezhi.Yang@windriver.com>,
 "Jia, Hongxu" <Hongxu.Jia@windriver.com>
References: <bfd87f9a-d54f-25fd-5229-ff3cd60ad033@gmail.com>
 <8f10c7cd-696b-7276-90bb-99e1194ff859@windriver.com>
From: "Armin Kuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <b5d31016-10a8-9f80-1041-5f3a0d0ec38d@gmail.com>
Date: Mon, 26 Apr 2021 09:02:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <8f10c7cd-696b-7276-90bb-99e1194ff859@windriver.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 4/26/21 7:28 AM, Randy MacLeod wrote:
> On 2021-04-25 5:35 p.m., Armin Kuster wrote:
>> The following changes since commit
>> 2297d4ee04b47bc574f8879732d9e213ab7bf685:
>>
>>    wireguard: update to v1.0.20210219 +1 (2021-04-18 13:49:13 -0700)
>>
>> are available in the Git repository at:
>>
>>    https://git.openembedded.org/meta-openembedded hardknott-next
>>
>> for you to fetch changes up to 71b546ed8595b14d29efc1e8b951f8c845ad10c4:
>>
>>    python3-cryptography: Upgrade to 3.3.2 (2021-04-23 19:09:56 -0700)
>>
>> ----------------------------------------------------------------
>> Chen Qi (2):
>>        tigervnc: upgrade to 1.11.0
>>        python3-django: upgrade to 2.2.20
>>
>> Mingli Yu (2):
>>        php: Upgrade to 7.4.16
>>        python3-cryptography: Upgrade to 3.3.2
>>
>> Stefan Ghinea (1):
>>        python3-django: fix CVE-2021-28658
>>
>> Ulrich Ölmann (1):
>>        v4l-utils: fix reproducibility
>
>
> These are CVE or fix-ups to get to a supported version of tigervnc.
>
> Thanks for letting us get open-vm-tools and syslog-ng updated.
>
> Armin,
>   Do we hope/expect things to slow down now
> aside from CVE patches (or 'dot' updates to fix them)?

correct. That should be how stable is run IMHO. Or any changes to
address any major changes in Core.

-armin
>
>
> ../Randy
>
>
>>
>>   .../recipes-devtools/php/php/CVE-2020-7069.patch   | 158
>> ---------------------
>>   .../recipes-devtools/php/php/CVE-2020-7070.patch   |  24 ----
>>   .../php/{php_7.4.9.bb => php_7.4.16.bb}            |   7 +-
>>   .../0002-do-not-build-tests-sub-directory.patch    |  21 +--
>>   ...tigervnc-add-fPIC-option-to-COMPILE_FLAGS.patch |  36 ++---
>>   .../{tigervnc_1.10.1.bb => tigervnc_1.11.0.bb}     |  13 +-
>>   ...ure.ac-autodetect-availability-of-systemd.patch |  47 ++++++
>>   ...estrict-installation-of-50-rc_keymap.conf.patch |  40 ++++++
>>   .../v4l2apps/v4l-utils_1.20.0.bb                   |  11 +-
>>   ...aphy_3.3.1.bb => python3-cryptography_3.3.2.bb} |   2 +-
>>   .../python/python3-django_2.2.16.bb                |   9 --
>>   .../python/python3-django_2.2.20.bb                |   9 ++
>>   12 files changed, 137 insertions(+), 240 deletions(-)
>>
>>
>>
>> 
>>
>
>

