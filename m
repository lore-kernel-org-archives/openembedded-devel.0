Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 442C6CAC5B0
	for <webhook@archiver.kernel.org>; Sat, 27 Sep 2025 17:54:00 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web11.17645.1758995630214646810
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 27 Sep 2025 10:53:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NyPjhywz;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b3727611d76so411410766b.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 27 Sep 2025 10:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758995628; x=1759600428; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ht198RweB4sxUYPVSs5s+EKGa9xRKKOaGGXST7jJ3Sk=;
        b=NyPjhywzou3PTqQL2zDc11o1u6Al5bIQ4NX5bUB4Nss9jShlczsTnk/ooqAjcMDbV+
         HmoRRdrlkf994QQdBjh70Vv+EIainjrcyF+SCNoHp2wfW6TRKwyHO4YeJgWi9d76ShAc
         ptVErin3TRpH2urHtIO+PkWWYb3KsAYGlfzoMIGnukk2upyBF+E5HaegDyn6wkYbIM1m
         UQQLxNKHRDX6PbXHcqGSr+d+nPzO9T42eaIwuSPg2f1B0VBYr/5hSJhPxwRq/zqGjbFl
         AJ615SqXd/1omUYPOfI+3LP6qK97dWT6MpLhP5dIMa8ViYctAVhXHt3j/i0joHHgFr0h
         UIzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758995628; x=1759600428;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ht198RweB4sxUYPVSs5s+EKGa9xRKKOaGGXST7jJ3Sk=;
        b=q0w108hUJhitFdZpPl8mpgxYz+gkVgC0HtKr9Pw0H7ZcnjfHxjursWWH5fATcPdSDj
         GpBlMlT6FJI/ZaRm66FSsL21hWCpbePblTUwH06hZH9po4XtOBJ8Y4sVo5NpBkYGa2PA
         mP1U0VSnd0nUtH6du3g/YZqO2BfCvynIG9fTqBFDoccUU5xoEbYigXy1wdWsZzmGBpFU
         kycwMOwGqR5XMS/8lnUS6zSjTSAq9gzCACcEIwIrDka2mQC+L43VTQfFmgLDTpnNAHaQ
         pFr5VxghhPs7nJBw2sDgip+7P3fDVg21FyrggHQmf1zjU3UuBjy2LSwaUQ5mLaGJ8TIQ
         mRgA==
X-Forwarded-Encrypted: i=1; AJvYcCUZf6QSxh2FYp68zEWWKQ08bth9oO2NfxgUAOhFJlvK3JKLy3kHRH5sPDkrcue3diBLexz/9r+IGS2Py9lTGA7+Cp4=@lists.openembedded.org
X-Gm-Message-State: AOJu0YysHQ+GAy996I+RmknGUScwCl874IxB0MX0DvDgkAF7LCLLs2gs
	EcRchjrinBk31XmsKIDZSqDjc3b0/WxSkb0SUKK2miKKdrZP1gh4YOOf
X-Gm-Gg: ASbGncsHntbgljOTz/8HuKX0qTXH83dbV1MA1H2IZcFgRJbOKWQO5KXSGxjo0td5UTP
	LT6GB0BE2hNkrqaNwix/qRPfimLuwPfAeZ2YeW8WGRcHy299knHo3p+5H178DJo8ityDObvfwQb
	mHjZ61AbjmVp9DJQ3l9FHwvAnX5UkHR4flYWg3eErUPG7EJWdOOAGg1pt2cL4n7C0Nm8oZipnqO
	Up/Ns3la/CgSFQjMuzVFM7pYRsGEBOfMS2FriDmKsn/QcayWfoLpwUla2CZ2eJY2Oa7B701AzK0
	SyhNadKRuBnWclr1zB/uWzE0D/fa5KbJpEbyI8jzFjY6ykOJO9npSp/4MBitkKKGqehuGEWU+qD
	bDT+Q75fS3b8R0Tv7mQU6NHOv3KScLc7CRoHdBF3JpVVSpX6RoBHo
X-Google-Smtp-Source: AGHT+IFcQooSZMs4cbBEG1YDnmgbd4FB8y+tRwHXCYYFqBnalvQ0T5yZH8yGhGL56NigQyjh0lYwuA==
X-Received: by 2002:a17:907:1c15:b0:b2d:d73:de59 with SMTP id a640c23a62f3a-b34b9f599a7mr1198697766b.9.1758995628238;
        Sat, 27 Sep 2025 10:53:48 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b35446f7472sm601399466b.57.2025.09.27.10.53.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Sep 2025 10:53:47 -0700 (PDT)
Message-ID: <b882b222-eeaa-4f10-997a-2d281f09e4d6@gmail.com>
Date: Sat, 27 Sep 2025 19:53:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe][meta-oe][walnascar][PATCH 00/21] Trying to keep recipes in
 the walnascar branch updated with useful fixes from the master branch.
To: ankur.tyagi85@gmail.com, openembedded-devel@lists.openembedded.org
References: <20250927063216.1865627-1-ankur.tyagi85@gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20250927063216.1865627-1-ankur.tyagi85@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 27 Sep 2025 17:54:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119993

I have notes about two patches:

02/21: I wouldn't change defconfig in a stable branch.
17/21: Despite the semver-like versioning, this looks like a full
fledged feature release, with over a 1.3k commits and a long list of new
features and changes.

Otherwise I plan to test the rest (assuming no other objections arise),
thanks a lot.

On 9/27/25 08:31, Ankur Tyagi via lists.openembedded.org wrote:
> I have tried to carefully review the change logs and commit logs while updating
> recipe versions.
>
> Did basic validation by building against qemux86-64 and qemuarm64
> machine targets.
>
> Ankur Tyagi (1):
>   lsscsi: fix versioning
>
> Changqing Li (1):
>   pahole: fix a Segmentation fault error
>
> Jason Schonberg (1):
>   Remove the use of http://ftp.gnome.org/pub/gnome
>
> Jeroen Hofstee (1):
>   php: ignore CVE-2024-3566
>
> Khem Raj (2):
>   tomlplusplus: Fix test failures with clang/libcxx
>   safec: Pass Qunused-arguments when using clang
>
> Leon Anavi (1):
>   ssd1306: Update to newer version
>
> Miaoqing Pan (1):
>   hostapd: enable 802.11be, SAE-PK, OWE, SuiteB, ACS, and MBO support
>
> Nitin Wankhade (1):
>   iperf3: Fix CVE-2025-54350
>
> Peace Lee (1):
>   guider: Upgrade 3.9.8 -> 3.9.9
>
> Peter Kjellerstedt (1):
>   hostapd: Backport a patch to build SAE-PK correctly
>
> Wang Mingyu (9):
>   gensio: upgrade 2.8.7 -> 2.8.15
>   libimobiledevice-glue: upgrade 1.3.1 -> 1.3.2
>   ser2net: upgrade 4.6.4 -> 4.6.5
>   mm-common: upgrade 1.0.6 -> 1.0.7
>   valijson: upgrade 1.0.4 -> 1.0.5
>   valijson: upgrade 1.0.5 -> 1.0.6
>   tk: upgrade 9.0.1 -> 9.0.2
>   sexpect: upgrade 2.3.14 -> 2.3.15
>   iptraf-ng: upgrade 1.2.1 -> 1.2.2
>
> Yi Zhao (1):
>   tk8: upgrade 8.6.15 -> 8.6.17
>
>  .../iperf3/iperf3/CVE-2025-54350.patch        | 24 +++++++++
>  .../recipes-benchmark/iperf3/iperf3_3.18.bb   |  3 +-
>  meta-oe/recipes-bsp/lsscsi/lsscsi_030.bb      |  2 +
>  .../{gensio_2.8.7.bb => gensio_2.8.15.bb}     |  4 +-
>  ...e64-for-hostapd-CONFIG_SAE_PK-builds.patch | 40 ++++++++++++++
>  .../hostapd/hostapd/defconfig                 | 28 ++++++++++
>  .../hostapd/hostapd_2.11.bb                   |  1 +
>  ....3.1.bb => libimobiledevice-glue_1.3.2.bb} |  2 +-
>  .../{ser2net_4.6.4.bb => ser2net_4.6.5.bb}    |  2 +-
>  .../libsigc++-2.0/libsigc++-2.0_2.12.1.bb     |  2 +-
>  .../libsigc++-2.0/libsigc++-3_3.6.0.bb        |  2 +-
>  ...{mm-common_1.0.6.bb => mm-common_1.0.7.bb} |  4 +-
>  .../proxy-libintl/proxy-libintl_20100902.bb   |  4 +-
>  meta-oe/recipes-core/safec/safec_3.7.1.bb     |  3 ++
>  .../recipes-devtools/glade/glade_3.36.0.bb    |  2 +-
>  .../{guider_3.9.8.bb => guider_3.9.9.bb}      |  8 +--
>  ...{iptraf-ng_1.2.1.bb => iptraf-ng_1.2.2.bb} |  4 +-
>  ...r-Fix-elf_functions-cleanup-on-error.patch | 54 +++++++++++++++++++
>  .../recipes-devtools/pahole/pahole_1.29.bb    |  3 +-
>  meta-oe/recipes-devtools/php/php_8.4.10.bb    |  1 +
>  .../{sexpect_2.3.14.bb => sexpect_2.3.15.bb}  |  4 +-
>  .../recipes-devtools/ssd1306/ssd1306_git.bb   |  2 +-
>  .../tcltk/{tk8_8.6.15.bb => tk8_8.6.17.bb}    |  2 +-
>  .../tcltk/{tk_9.0.1.bb => tk_9.0.2.bb}        |  2 +-
>  .../tomlplusplus/tomlplusplus_git.bb          |  4 ++
>  .../{valijson_1.0.4.bb => valijson_1.0.6.bb}  |  4 +-
>  .../gnome-themes/gnome-themes-extra_3.28.bb   |  2 +-
>  meta-oe/recipes-gnome/gtk+/gtk+_2.24.33.bb    |  2 +-
>  28 files changed, 187 insertions(+), 28 deletions(-)
>  create mode 100644 meta-oe/recipes-benchmark/iperf3/iperf3/CVE-2025-54350.patch
>  rename meta-oe/recipes-connectivity/gensio/{gensio_2.8.7.bb => gensio_2.8.15.bb} (92%)
>  create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/0001-Include-base64-for-hostapd-CONFIG_SAE_PK-builds.patch
>  rename meta-oe/recipes-connectivity/libimobiledevice-glue/{libimobiledevice-glue_1.3.1.bb => libimobiledevice-glue_1.3.2.bb} (89%)
>  rename meta-oe/recipes-connectivity/ser2net/{ser2net_4.6.4.bb => ser2net_4.6.5.bb} (91%)
>  rename meta-oe/recipes-core/mm-common/{mm-common_1.0.6.bb => mm-common_1.0.7.bb} (78%)
>  rename meta-oe/recipes-devtools/guider/{guider_3.9.8.bb => guider_3.9.9.bb} (75%)
>  rename meta-oe/recipes-devtools/iptraf/{iptraf-ng_1.2.1.bb => iptraf-ng_1.2.2.bb} (89%)
>  create mode 100644 meta-oe/recipes-devtools/pahole/files/0001-btf_encoder-Fix-elf_functions-cleanup-on-error.patch
>  rename meta-oe/recipes-devtools/sexpect/{sexpect_2.3.14.bb => sexpect_2.3.15.bb} (82%)
>  rename meta-oe/recipes-devtools/tcltk/{tk8_8.6.15.bb => tk8_8.6.17.bb} (97%)
>  rename meta-oe/recipes-devtools/tcltk/{tk_9.0.1.bb => tk_9.0.2.bb} (97%)
>  rename meta-oe/recipes-devtools/valijson/{valijson_1.0.4.bb => valijson_1.0.6.bb} (90%)
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#119954): https://lists.openembedded.org/g/openembedded-devel/message/119954
> Mute This Topic: https://lists.openembedded.org/mt/115461658/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


