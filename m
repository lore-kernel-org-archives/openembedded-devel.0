Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A9F3CED61A
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 11:23:00 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10111.1763464976689147802
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Nov 2025 03:22:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=T2w2IRDn;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4779a637712so20391645e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 03:22:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763464975; x=1764069775; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GvrZ3aLdsp8s1kghB1OMDEqsb2o+EDfWDcZOkKTDbF4=;
        b=T2w2IRDn71a5/efr1HGbKI+iF/QgQz5IbvFGlvJHsW1feucokIvdDHjG0lvRO1poYq
         EYYYRr/V1gqFU8diKLueYbN8irA6L4HVImGTTBGh9VUPzXcrMLhQOSdiv6jUjepRU+HK
         4+K3elh3lSFiovLjzmwf6EtmSeu4ZrLjMXwea2zU/WQh1nVKbXweVVVHlAbHFIop6/wM
         54xj+6OGLCOVDGEGRVYj/GyRGR0sXGqFxR+Vshb63h7dJn4IHaKqGHgpARFUHwZp/2RE
         nnfbLLWqoL5zdMSOAat+4+4ILhH8PyjV9o8k90slrrakFzw51ZhUk7FSGpRhFnomBdGK
         ROeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763464975; x=1764069775;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GvrZ3aLdsp8s1kghB1OMDEqsb2o+EDfWDcZOkKTDbF4=;
        b=hoHGEm6KaAftlmF5u7oPjgLI3BIyq3Hvhw76ZWWuxaWJq1h2stQYUdFiMVRcVZ6Knl
         UcV1rvmk9kvTzJ/3FLkD5ruGO0iQYrY6b03wEPKM+s1eS68QvFWN3xc95m5FMhjdluzM
         PUvLm7KLYTqHc7w9hI7XHEh8nUCulDFQlRO9Fs6bzvXn/noPOEwdcQi6C0PzXRee+WKU
         5/R4WuPp9QMSqc3e18n6U/M1tK3h1xgVU63dfSs73ZtUWglyYKQrWuqvlYTEkxKedDNJ
         aD8ZUCMNXeyiguFutEubs7ONbZAEopnNBwu+XJxS3gcqvrh5vN2DdLlWs4HqDN4KQGoL
         bXkg==
X-Gm-Message-State: AOJu0YzzJcaN7apJYOGn74NSzezJlFOBcGFEVzDFx+WRziwNFNarVXHT
	aiwYLv+QQ4ArejMy6xy6VyYzKQqzv27WDqAFAQ4j/yYBxAhlq98Z4+zx
X-Gm-Gg: ASbGncveKwM/kC7PCQA89uMqyzseXYU/XV4ZETCaSROS4EoXFMkct3ZU3B1rJHEBaQ0
	xFomGNvFdYoMHr28ae0CsCBkjetuu1C3hO/V/FLQmLb8qvMnQOWA2X06DH68HyMvA6kqNB7/7CO
	bBQe7+cqaOHoskOt/yc2c54kdxPocO6M0jETKon3X22hUf2mFd/sFqvjklpogoF6x3/CH/tBPh7
	sWwQjl/oBmlL964aXvdcQDrTNg61rHVmguVO2mdnilQg7JGojMs/ZNa5dZKCg9F1JWFzE6ipSuk
	JUqgoWbjJzZ41PlthFH/mFAgXsLij9yYOtMYB7hv0GZQ7MAo4JSMwwqKFk28RCbISqnFSK8HzF/
	CJ8HFpIXxSviP6gWCqHTyJjj3NOWK948Zn13fhHSpznPLVaixysqerUBf9IvlFa+g3K6FMb5NC7
	tAWtesh5WHMdmkZRhAvPIk1iPIN+FsHQ==
X-Google-Smtp-Source: AGHT+IG0l5l6wLYJHLF0RgHLS7gN/yXSuBzjzyY+tYKlef5b5vX1aV4IqAKmy9+QBHk9WMaskm2AXQ==
X-Received: by 2002:a05:600c:524b:b0:477:9dc1:b706 with SMTP id 5b1f17b1804b1-4779dc1c8cfmr75888475e9.19.1763464974874;
        Tue, 18 Nov 2025 03:22:54 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a9723a6esm16658785e9.1.2025.11.18.03.22.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 03:22:54 -0800 (PST)
Message-ID: <bb7e05b5-e6d2-4e1b-abc5-33f3569752b4@gmail.com>
Date: Tue, 18 Nov 2025 12:22:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] CVE report - scarthgap - 2025-11-17
To: Ankur Tyagi <ankur.tyagi85@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20251117093847.844119-1-skandigraun@gmail.com>
 <CADySD0HMDbgW2jmg4SosEQhtrHZ86xPGBb36ofVC7Hf9pksHvg@mail.gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <CADySD0HMDbgW2jmg4SosEQhtrHZ86xPGBb36ofVC7Hf9pksHvg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 11:23:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121859

On 11/18/25 12:14, Ankur Tyagi wrote:
> Hi Gyorgy,
>
> On Mon, Nov 17, 2025 at 10:38 PM Gyorgy Sarvari via
> lists.openembedded.org <skandigraun=gmail.com@lists.openembedded.org>
> wrote:
>> List of all open CVEs (138, out of which new this week: 1):
>>
>>  - apache2: CVE-2025-3891: https://nvd.nist.gov/vuln/detail/CVE-2025-3891
>>  - botan: CVE-2024-39312: https://nvd.nist.gov/vuln/detail/CVE-2024-39312
>>  - botan: CVE-2024-50382: https://nvd.nist.gov/vuln/detail/CVE-2024-50382
>>  - botan: CVE-2024-50383: https://nvd.nist.gov/vuln/detail/CVE-2024-50383
>>  - dhrystone: CVE-2020-23026: https://nvd.nist.gov/vuln/detail/CVE-2020-23026
>>  - emacs: CVE-2024-53920: https://nvd.nist.gov/vuln/detail/CVE-2024-53920
>>  - ez-ipupdate: CVE-2003-0887: https://nvd.nist.gov/vuln/detail/CVE-2003-0887
>>  - freerdp3: CVE-2025-4478: https://nvd.nist.gov/vuln/detail/CVE-2025-4478
>>  - [NEW] frr: CVE-2024-44070: https://nvd.nist.gov/vuln/detail/CVE-2024-44070
> This CVE was fixed in version 9.1.2
> (https://github.com/FRRouting/frr/releases/tag/frr-9.1.2) and current
> recipe version is 9.1.3
> I believe CPE is incorrect in this case
> (https://nvd.nist.gov/vuln/search#/nvd/home?cpeFilterMode=cpe&cpeName=cpe:2.3:a:frrouting:frrouting:9.1.3:*:*:*:*:*:*:*&resultType=records)
>
> If we agree then I'll send a patch for this.

I don't see this particularly controversial :)
If this is the case, then you can just set the CVE_STATUS to
"backported-patch: ..." and call it a day. The CVE reports frequently
miss these, when a project has multiple active branches.

>
>>  - frr: CVE-2025-61099: https://nvd.nist.gov/vuln/detail/CVE-2025-61099
>>  - frr: CVE-2025-61100: https://nvd.nist.gov/vuln/detail/CVE-2025-61100
>>  - frr: CVE-2025-61101: https://nvd.nist.gov/vuln/detail/CVE-2025-61101
>>  - frr: CVE-2025-61102: https://nvd.nist.gov/vuln/detail/CVE-2025-61102
>>  - frr: CVE-2025-61103: https://nvd.nist.gov/vuln/detail/CVE-2025-61103
>>  - frr: CVE-2025-61104: https://nvd.nist.gov/vuln/detail/CVE-2025-61104
>>  - frr: CVE-2025-61105: https://nvd.nist.gov/vuln/detail/CVE-2025-61105
>>  - frr: CVE-2025-61106: https://nvd.nist.gov/vuln/detail/CVE-2025-61106
>>  - frr: CVE-2025-61107: https://nvd.nist.gov/vuln/detail/CVE-2025-61107
>>  - giflib: CVE-2024-45993: https://nvd.nist.gov/vuln/detail/CVE-2024-45993
>>  - gimp: CVE-2007-3741: https://nvd.nist.gov/vuln/detail/CVE-2007-3741
>>  - gimp: CVE-2025-5473: https://nvd.nist.gov/vuln/detail/CVE-2025-5473
>>  - hdf5: CVE-2025-2912: https://nvd.nist.gov/vuln/detail/CVE-2025-2912
>>  - hdf5: CVE-2025-2926: https://nvd.nist.gov/vuln/detail/CVE-2025-2926
>>  - hdf5: CVE-2025-6270: https://nvd.nist.gov/vuln/detail/CVE-2025-6270
>>  - id3lib: CVE-2007-4460: https://nvd.nist.gov/vuln/detail/CVE-2007-4460
>>  - imagemagick: CVE-2023-5341: https://nvd.nist.gov/vuln/detail/CVE-2023-5341
>>  - imagemagick: CVE-2024-41817: https://nvd.nist.gov/vuln/detail/CVE-2024-41817
>>  - imagemagick: CVE-2025-53014: https://nvd.nist.gov/vuln/detail/CVE-2025-53014
>>  - imagemagick: CVE-2025-53015: https://nvd.nist.gov/vuln/detail/CVE-2025-53015
>>  - imagemagick: CVE-2025-53019: https://nvd.nist.gov/vuln/detail/CVE-2025-53019
>>  - imagemagick: CVE-2025-53101: https://nvd.nist.gov/vuln/detail/CVE-2025-53101
>>  - imagemagick: CVE-2025-55004: https://nvd.nist.gov/vuln/detail/CVE-2025-55004
>>  - imagemagick: CVE-2025-55005: https://nvd.nist.gov/vuln/detail/CVE-2025-55005
>>  - imagemagick: CVE-2025-55154: https://nvd.nist.gov/vuln/detail/CVE-2025-55154
>>  - imagemagick: CVE-2025-55160: https://nvd.nist.gov/vuln/detail/CVE-2025-55160
>>  - imagemagick: CVE-2025-55212: https://nvd.nist.gov/vuln/detail/CVE-2025-55212
>>  - imagemagick: CVE-2025-55298: https://nvd.nist.gov/vuln/detail/CVE-2025-55298
>>  - imagemagick: CVE-2025-57803: https://nvd.nist.gov/vuln/detail/CVE-2025-57803
>>  - imagemagick: CVE-2025-57807: https://nvd.nist.gov/vuln/detail/CVE-2025-57807
>>  - imagemagick: CVE-2025-62171: https://nvd.nist.gov/vuln/detail/CVE-2025-62171
>>  - imagemagick: CVE-2025-62594: https://nvd.nist.gov/vuln/detail/CVE-2025-62594
>>  - iptraf-ng: CVE-2024-52949: https://nvd.nist.gov/vuln/detail/CVE-2024-52949
>>  - libao: CVE-2017-11548: https://nvd.nist.gov/vuln/detail/CVE-2017-11548
>>  - libavif: CVE-2025-48174: https://nvd.nist.gov/vuln/detail/CVE-2025-48174
>>  - libcdio: CVE-2024-36600: https://nvd.nist.gov/vuln/detail/CVE-2024-36600
>>  - libmemcached: CVE-2023-27478: https://nvd.nist.gov/vuln/detail/CVE-2023-27478
>>  - libtar: CVE-2013-4420: https://nvd.nist.gov/vuln/detail/CVE-2013-4420
>>  - libtar: CVE-2021-33643: https://nvd.nist.gov/vuln/detail/CVE-2021-33643
>>  - libtar: CVE-2021-33644: https://nvd.nist.gov/vuln/detail/CVE-2021-33644
>>  - libtar: CVE-2021-33645: https://nvd.nist.gov/vuln/detail/CVE-2021-33645
>>  - libtar: CVE-2021-33646: https://nvd.nist.gov/vuln/detail/CVE-2021-33646
>>  - libvpx: CVE-2024-5197: https://nvd.nist.gov/vuln/detail/CVE-2024-5197
>>  - libwmf: CVE-2009-1364: https://nvd.nist.gov/vuln/detail/CVE-2009-1364
>>  - libwmf: CVE-2015-0848: https://nvd.nist.gov/vuln/detail/CVE-2015-0848
>>  - libwmf: CVE-2015-4588: https://nvd.nist.gov/vuln/detail/CVE-2015-4588
>>  - libwmf: CVE-2015-4695: https://nvd.nist.gov/vuln/detail/CVE-2015-4695
>>  - libwmf: CVE-2015-4696: https://nvd.nist.gov/vuln/detail/CVE-2015-4696
>>  - libwmf: CVE-2016-9011: https://nvd.nist.gov/vuln/detail/CVE-2016-9011
>>  - links: CVE-2008-3319: https://nvd.nist.gov/vuln/detail/CVE-2008-3319
>>  - linuxptp: CVE-2024-42861: https://nvd.nist.gov/vuln/detail/CVE-2024-42861
>>  - minio: CVE-2018-1000538: https://nvd.nist.gov/vuln/detail/CVE-2018-1000538
>>  - minio: CVE-2020-11012: https://nvd.nist.gov/vuln/detail/CVE-2020-11012
>>  - minio: CVE-2021-21287: https://nvd.nist.gov/vuln/detail/CVE-2021-21287
>>  - minio: CVE-2021-21362: https://nvd.nist.gov/vuln/detail/CVE-2021-21362
>>  - minio: CVE-2021-21390: https://nvd.nist.gov/vuln/detail/CVE-2021-21390
>>  - minio: CVE-2021-43858: https://nvd.nist.gov/vuln/detail/CVE-2021-43858
>>  - minio: CVE-2022-35919: https://nvd.nist.gov/vuln/detail/CVE-2022-35919
>>  - minio: CVE-2023-28433: https://nvd.nist.gov/vuln/detail/CVE-2023-28433
>>  - minio: CVE-2023-28434: https://nvd.nist.gov/vuln/detail/CVE-2023-28434
>>  - nbdkit: CVE-2025-47711: https://nvd.nist.gov/vuln/detail/CVE-2025-47711
>>  - nbdkit: CVE-2025-47712: https://nvd.nist.gov/vuln/detail/CVE-2025-47712
>>  - openflow: CVE-2018-1000155: https://nvd.nist.gov/vuln/detail/CVE-2018-1000155
>>  - openjpeg: CVE-2023-39327: https://nvd.nist.gov/vuln/detail/CVE-2023-39327
>>  - openjpeg: CVE-2023-39328: https://nvd.nist.gov/vuln/detail/CVE-2023-39328
>>  - openjpeg: CVE-2023-39329: https://nvd.nist.gov/vuln/detail/CVE-2023-39329
>>  - opusfile: CVE-2022-47021: https://nvd.nist.gov/vuln/detail/CVE-2022-47021
>>  - p7zip: CVE-2022-47069: https://nvd.nist.gov/vuln/detail/CVE-2022-47069
>>  - pidgin: CVE-2022-26491: https://nvd.nist.gov/vuln/detail/CVE-2022-26491
>>  - proftpd: CVE-2023-48795: https://nvd.nist.gov/vuln/detail/CVE-2023-48795
>>  - redis: CVE-2022-0543: https://nvd.nist.gov/vuln/detail/CVE-2022-0543
>>  - redis: CVE-2025-27151: https://nvd.nist.gov/vuln/detail/CVE-2025-27151
>>  - sassc: CVE-2022-43357: https://nvd.nist.gov/vuln/detail/CVE-2022-43357
>>  - smarty: CVE-2020-10375: https://nvd.nist.gov/vuln/detail/CVE-2020-10375
>>  - sngrep: CVE-2024-35434: https://nvd.nist.gov/vuln/detail/CVE-2024-35434
>>  - spice: CVE-2016-0749: https://nvd.nist.gov/vuln/detail/CVE-2016-0749
>>  - spice: CVE-2016-2150: https://nvd.nist.gov/vuln/detail/CVE-2016-2150
>>  - spice-gtk: CVE-2012-4425: https://nvd.nist.gov/vuln/detail/CVE-2012-4425
>>  - sthttpd: CVE-2021-26843: https://nvd.nist.gov/vuln/detail/CVE-2021-26843
>>  - synergy: CVE-2020-15117: https://nvd.nist.gov/vuln/detail/CVE-2020-15117
>>  - tcpreplay: CVE-2025-9384: https://nvd.nist.gov/vuln/detail/CVE-2025-9384
>>  - tcpreplay: CVE-2025-9385: https://nvd.nist.gov/vuln/detail/CVE-2025-9385
>>  - tcpreplay: CVE-2025-9386: https://nvd.nist.gov/vuln/detail/CVE-2025-9386
>>  - uw-imap: CVE-2018-19518: https://nvd.nist.gov/vuln/detail/CVE-2018-19518
>>  - webkitgtk3: CVE-2025-6558: https://nvd.nist.gov/vuln/detail/CVE-2025-6558
>>  - webmin: CVE-2017-15644: https://nvd.nist.gov/vuln/detail/CVE-2017-15644
>>  - webmin: CVE-2017-15645: https://nvd.nist.gov/vuln/detail/CVE-2017-15645
>>  - webmin: CVE-2017-15646: https://nvd.nist.gov/vuln/detail/CVE-2017-15646
>>  - webmin: CVE-2017-17089: https://nvd.nist.gov/vuln/detail/CVE-2017-17089
>>  - webmin: CVE-2019-12840: https://nvd.nist.gov/vuln/detail/CVE-2019-12840
>>  - webmin: CVE-2019-15107: https://nvd.nist.gov/vuln/detail/CVE-2019-15107
>>  - webmin: CVE-2019-15641: https://nvd.nist.gov/vuln/detail/CVE-2019-15641
>>  - webmin: CVE-2019-15642: https://nvd.nist.gov/vuln/detail/CVE-2019-15642
>>  - webmin: CVE-2020-12670: https://nvd.nist.gov/vuln/detail/CVE-2020-12670
>>  - webmin: CVE-2020-35606: https://nvd.nist.gov/vuln/detail/CVE-2020-35606
>>  - webmin: CVE-2020-8820: https://nvd.nist.gov/vuln/detail/CVE-2020-8820
>>  - webmin: CVE-2020-8821: https://nvd.nist.gov/vuln/detail/CVE-2020-8821
>>  - webmin: CVE-2022-0824: https://nvd.nist.gov/vuln/detail/CVE-2022-0824
>>  - webmin: CVE-2022-0829: https://nvd.nist.gov/vuln/detail/CVE-2022-0829
>>  - webmin: CVE-2022-30708: https://nvd.nist.gov/vuln/detail/CVE-2022-30708
>>  - webmin: CVE-2022-36446: https://nvd.nist.gov/vuln/detail/CVE-2022-36446
>>  - webmin: CVE-2023-43309: https://nvd.nist.gov/vuln/detail/CVE-2023-43309
>>  - webmin: CVE-2023-52046: https://nvd.nist.gov/vuln/detail/CVE-2023-52046
>>  - webmin: CVE-2024-36450: https://nvd.nist.gov/vuln/detail/CVE-2024-36450
>>  - webmin: CVE-2024-36451: https://nvd.nist.gov/vuln/detail/CVE-2024-36451
>>  - webmin: CVE-2024-36452: https://nvd.nist.gov/vuln/detail/CVE-2024-36452
>>  - webmin: CVE-2024-36453: https://nvd.nist.gov/vuln/detail/CVE-2024-36453
>>  - webmin: CVE-2024-45692: https://nvd.nist.gov/vuln/detail/CVE-2024-45692
>>  - weechat: CVE-2024-46613: https://nvd.nist.gov/vuln/detail/CVE-2024-46613
>>  - yasm: CVE-2021-33454: https://nvd.nist.gov/vuln/detail/CVE-2021-33454
>>  - yasm: CVE-2021-33455: https://nvd.nist.gov/vuln/detail/CVE-2021-33455
>>  - yasm: CVE-2021-33456: https://nvd.nist.gov/vuln/detail/CVE-2021-33456
>>  - yasm: CVE-2021-33457: https://nvd.nist.gov/vuln/detail/CVE-2021-33457
>>  - yasm: CVE-2021-33458: https://nvd.nist.gov/vuln/detail/CVE-2021-33458
>>  - yasm: CVE-2021-33459: https://nvd.nist.gov/vuln/detail/CVE-2021-33459
>>  - yasm: CVE-2021-33460: https://nvd.nist.gov/vuln/detail/CVE-2021-33460
>>  - yasm: CVE-2021-33461: https://nvd.nist.gov/vuln/detail/CVE-2021-33461
>>  - yasm: CVE-2021-33462: https://nvd.nist.gov/vuln/detail/CVE-2021-33462
>>  - yasm: CVE-2021-33463: https://nvd.nist.gov/vuln/detail/CVE-2021-33463
>>  - yasm: CVE-2021-33464: https://nvd.nist.gov/vuln/detail/CVE-2021-33464
>>  - yasm: CVE-2021-33465: https://nvd.nist.gov/vuln/detail/CVE-2021-33465
>>  - yasm: CVE-2021-33466: https://nvd.nist.gov/vuln/detail/CVE-2021-33466
>>  - yasm: CVE-2021-33467: https://nvd.nist.gov/vuln/detail/CVE-2021-33467
>>  - yasm: CVE-2021-33468: https://nvd.nist.gov/vuln/detail/CVE-2021-33468
>>  - yasm: CVE-2023-30402: https://nvd.nist.gov/vuln/detail/CVE-2023-30402
>>  - yasm: CVE-2023-31972: https://nvd.nist.gov/vuln/detail/CVE-2023-31972
>>  - yasm: CVE-2023-31973: https://nvd.nist.gov/vuln/detail/CVE-2023-31973
>>  - yasm: CVE-2023-31974: https://nvd.nist.gov/vuln/detail/CVE-2023-31974
>>  - yasm: CVE-2023-51258: https://nvd.nist.gov/vuln/detail/CVE-2023-51258
>>
>> ====================
>>
>> Removed this week (18):
>>
>>  - audiofile: CVE-2018-13440: https://nvd.nist.gov/vuln/detail/CVE-2018-13440
>>  - audiofile: CVE-2018-17095: https://nvd.nist.gov/vuln/detail/CVE-2018-17095
>>  - audiofile: CVE-2019-13147: https://nvd.nist.gov/vuln/detail/CVE-2019-13147
>>  - audiofile: CVE-2020-18781: https://nvd.nist.gov/vuln/detail/CVE-2020-18781
>>  - audiofile: CVE-2022-24599: https://nvd.nist.gov/vuln/detail/CVE-2022-24599
>>  - hostapd: CVE-2022-37660: https://nvd.nist.gov/vuln/detail/CVE-2022-37660
>>  - jasper: CVE-2023-51257: https://nvd.nist.gov/vuln/detail/CVE-2023-51257
>>  - proftpd: CVE-2001-0027: https://nvd.nist.gov/vuln/detail/CVE-2001-0027
>>  - pure-ftpd: CVE-2024-48208: https://nvd.nist.gov/vuln/detail/CVE-2024-48208
>>  - redis: CVE-2022-3734: https://nvd.nist.gov/vuln/detail/CVE-2022-3734
>>  - redis: CVE-2025-21605: https://nvd.nist.gov/vuln/detail/CVE-2025-21605
>>  - redis: CVE-2025-46817: https://nvd.nist.gov/vuln/detail/CVE-2025-46817
>>  - redis: CVE-2025-46818: https://nvd.nist.gov/vuln/detail/CVE-2025-46818
>>  - redis: CVE-2025-46819: https://nvd.nist.gov/vuln/detail/CVE-2025-46819
>>  - rsyslog: CVE-2015-3243: https://nvd.nist.gov/vuln/detail/CVE-2015-3243
>>  - rtmpdump: CVE-2015-8270: https://nvd.nist.gov/vuln/detail/CVE-2015-8270
>>  - rtmpdump: CVE-2015-8271: https://nvd.nist.gov/vuln/detail/CVE-2015-8271
>>  - rtmpdump: CVE-2015-8272: https://nvd.nist.gov/vuln/detail/CVE-2015-8272
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#121769): https://lists.openembedded.org/g/openembedded-devel/message/121769
>> Mute This Topic: https://lists.openembedded.org/mt/116334907/3619737
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [ankur.tyagi85@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>


