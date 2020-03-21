Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
 by mx.groups.io with SMTP id smtpd.web10.15440.1584818814249638145
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Mar 2020 12:26:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SbhJWMUj;
 spf=pass (domain: gmail.com, ip: 209.85.214.193, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f193.google.com with SMTP id g2so4004065plo.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 21 Mar 2020 12:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:cc:references:to:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=o60HYB0bRVGBldpSKbdjla43KbJk9f1kKKfpghbYzRc=;
        b=SbhJWMUjs4C9ScgnvRh9tKUTC1oZ0yvY918qA3myV2vcgq/emiKStrSmSFyYCInYAK
         yHS+kBaopywULRKTrNUrj2jvON2NkotZc8e6KNo23l6+x8cq5TLIxqFmp81J+6m6thxR
         he4obNtbrQJBvQXhlZXpSLLf+bkrDS53yUgwKIsYcltlF8RXwew6cEGPEhNofggsC4b1
         hLd/Nx1VxQJzXEDgw2XA2Ecg5HDSmDjvwLJLyhAFvp+gGOD4Ktpv9PgYhAsNwfPz2f55
         Be6RqObeywwzVadr4juFjTOZm3qbXBSDQNpStO0njAsbM1fkBPj+isYAhC3lOSHHbdWZ
         M8rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:cc:references:to:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-transfer-encoding:content-language;
        bh=o60HYB0bRVGBldpSKbdjla43KbJk9f1kKKfpghbYzRc=;
        b=U515c3ppAErY0FDyYh4oLhyXdoqV0/qJfoEKdi5lIFNUEC+YtF0WY25D8D0wUXLYEe
         Ep2af9EegNjQeBeaWTsuiTD0nk/HwLYrUJdFzes1HKxG4gV4Xmv7RBjwt278gCWgXkQn
         R/8oFCgK3FbqrTtOXr/CyHmQEw/sc3kQgpT87ASahix5JHcmH+dJw5m53KGiv812MNOx
         JXCB0eLTTCfJFd1NU86UJz3U8EtNA0RGxegTvtON/28HoSIxIuUpz3QNbyf0THTzfkAU
         I34gjQxCrGoK6c27gNONqQ3wIapC1yqD1UkfLVpDeavppAxBE+ZWg+88MX6uh6r4cuw8
         e14Q==
X-Gm-Message-State: ANhLgQ29jomBJvJom/8UILMV1KR3DDYjZCeCxxFwT8WhXfq450muIJKb
	76f6pF2gsA7erhwr/7XwxuO+t0HnjCQ=
X-Google-Smtp-Source: ADFU+vtQc5GEvOxMJDLb1KPXvaCAjfSpuASEgsSYHnlf/3ENyCUSNAXhJAgCGOeDoV+ynHiY9vTrlw==
X-Received: by 2002:a17:90a:c482:: with SMTP id j2mr16523115pjt.71.1584818813410;
        Sat, 21 Mar 2020 12:26:53 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:c5b0:bd3:55c0:2b58? ([2601:202:4180:a5c0:c5b0:bd3:55c0:2b58])
        by smtp.gmail.com with ESMTPSA id o29sm9283226pfp.208.2020.03.21.12.26.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Mar 2020 12:26:52 -0700 (PDT)
Subject: Re: [oe] zeus pull request
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
References: <c68254db-aa96-df47-7b86-179bab336393@gmail.com>
 <20200317150405.578ddb5f@ub1910>
To: Khem Raj <raj.khem@gmail.com>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <5ad42946-67ba-e089-7392-ece9afd1fc9e@gmail.com>
Date: Sat, 21 Mar 2020 12:26:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200317150405.578ddb5f@ub1910>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Khem,

ping

Did you want me to merge to zeus or do you ?

- armin

On 3/17/20 8:04 AM, Paul Barker wrote:
> On Tue, 17 Mar 2020 07:48:47 -0700
> akuster808 <akuster808@gmail.com> wrote:
>
>> The following changes since commit bb65c27a772723dfe2c15b5e1b27bcc1a1ed884c:
>>
>>   fluentbit: Fix packaging in multilib env (2020-01-30 18:38:10 -0800)
>>
>> are available in the Git repository at:
>>
>>   https://git.openembedded.org/meta-openembedded zeus-next
>>
>> for you to fetch changes up to 9e60d30669a2ad0598e9abf0cd15ee06b523986b:
>>
>>   sanlock: Replace cp -a with cp -R --no-dereference (2020-03-15
>> 13:30:34 -0700)
>>
>> ----------------------------------------------------------------
>> Adrian Bunk (1):
>>       wireshark: Upgrade 3.0.6 -> 3.0.8
>>
>> Carlos Rafael Giani (1):
>>       opencv: Enable pkg-config .pc file generation
>>
>> Khem Raj (2):
>>       ade: Fix install paths in multilib builds
>>       sanlock: Replace cp -a with cp -R --no-dereference
>>
>> Martin Jansa (1):
>>       s3c24xx-gpio, s3c64xx-gpio, sjf2410-linux-native, usbpath,
>> wmiconfig: use git fetcher instead of svn fetcher
>>
>> Mike Krupicka (1):
>>       mosquitto: Use mosquitto.init for daemon init
>>
>> Paul Barker (1):
>>       lmsensors: Fix sensord dependencies
>>
>> Peter Kjellerstedt (2):
>>       lvm2, libdevmapper: Do not patch configure
>>       libldb: Do not require the "pam" distro feature to be enabled
>>
>> Ross Burton (4):
>>       opencv: don't download during configure
>>       opencv: also download face alignment data in do_fetch()
>>       opencv: PACKAGECONFIG for G-API, use system ADE
>>       opencv: abort configure if we need to download
>>
>>  .../mosquitto/files/mosquitto.init                 |  2 +-
>>  .../recipes-support/libldb/libldb_1.5.6.bb         |  3 +-
>>  .../{wireshark_3.0.6.bb => wireshark_3.0.8.bb}     |  4 +-
>>  meta-oe/recipes-bsp/lm_sensors/lmsensors_3.5.0.bb  |  3 +-
>>  ...lace-cp-a-with-cp-R-no-dereference-preser.patch | 51
>> ++++++++++++++++++++++
>>  meta-oe/recipes-extended/sanlock/sanlock_3.8.0.bb  |  4 +-
>>  ...configure-Fix-setting-of-CLDFLAGS-default.patch | 34 +--------------
>>  ...NUInstallDirs-for-detecting-install-paths.patch | 39 +++++++++++++++++
>>  meta-oe/recipes-support/opencv/ade_0.1.1f.bb       |  1 +
>>  .../recipes-support/opencv/opencv/download.patch   | 32 ++++++++++++++
>>  meta-oe/recipes-support/opencv/opencv_4.1.0.bb     | 32 ++++++++++++--
>>  .../{s3c24xx-gpio_svn.bb => s3c24xx-gpio_git.bb}   |  7 ++-
>>  .../{s3c64xx-gpio_svn.bb => s3c64xx-gpio_git.bb}   |  6 +--
>>  ...x-native_svn.bb => sjf2410-linux-native_git.bb} | 11 +++--
>>  .../usbpath/{usbpath_svn.bb => usbpath_git.bb}     | 10 ++---
>>  .../{wmiconfig_svn.bb => wmiconfig_git.bb}         | 13 +++---
>>  16 files changed, 183 insertions(+), 69 deletions(-)
>>  rename meta-networking/recipes-support/wireshark/{wireshark_3.0.6.bb =>
>> wireshark_3.0.8.bb} (95%)
>>  create mode 100644
>> meta-oe/recipes-extended/sanlock/sanlock/0001-sanlock-Replace-cp-a-with-cp-R-no-dereference-preser.patch
>>  create mode 100644
>> meta-oe/recipes-support/opencv/ade/0001-use-GNUInstallDirs-for-detecting-install-paths.patch
>>  create mode 100644 meta-oe/recipes-support/opencv/opencv/download.patch
>>  rename meta-oe/recipes-support/samsung-soc-utils/{s3c24xx-gpio_svn.bb
>> => s3c24xx-gpio_git.bb} (73%)
>>  rename meta-oe/recipes-support/samsung-soc-utils/{s3c64xx-gpio_svn.bb
>> => s3c64xx-gpio_git.bb} (74%)
>>  rename
>> meta-oe/recipes-support/samsung-soc-utils/{sjf2410-linux-native_svn.bb
>> => sjf2410-linux-native_git.bb} (72%)
>>  rename meta-oe/recipes-support/usbpath/{usbpath_svn.bb =>
>> usbpath_git.bb} (68%)
>>  rename meta-oe/recipes-support/wmiconfig/{wmiconfig_svn.bb =>
>> wmiconfig_git.bb} (58%)
>>
> Could we also consider backport of:
>
> kernel-yocto.bbclass: Support config fragments with externalsrc (44f04c03)
> perf: Fix externalsrc support (eab605ba)
> kernelsrc.bbclass: Fix externalsrc support (2c17d35c)
>
> Thanks,
>

