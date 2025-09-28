Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A06CCAC5BB
	for <webhook@archiver.kernel.org>; Sun, 28 Sep 2025 12:30:56 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web10.31541.1759062651984305744
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Sep 2025 05:30:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gdBD2EhU;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b3e25a4bfd5so38316266b.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Sep 2025 05:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759062650; x=1759667450; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lGJmNeQyFdWDNOUHktUwsAKzq8bS36tXzZpoZvAU9so=;
        b=gdBD2EhU5Ik8tIonuTyEjZyrO4niPwRH8bvrYki0FkyPzW5sLW25ANNe62a0yb//XZ
         xfGsC7MtBomXm8AQQ9OYG3CcvwGtnk7MMdvKJXDhDHHb78itIjbHAqNhwE+E/DYPLrmZ
         6ZYrhEZaYBtMYHeN/+S6DNxR2E2DPKvePCJl6eLl6WDhOvJQj2WAL6KXd6RhO/IQP5Av
         7MOcy98dCJfwj3ZYugq7niU1KRq1tdxFrgWlz+VZ2HlZnhevfIrfzX/qSv3Yu8m37iop
         WLRYFNpASXJCJpgpG33w+ejo5PnQZXDKahCBnFHZ4psnQkmmXyaLXDoxqOqn6q/lfcLx
         YcpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759062650; x=1759667450;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lGJmNeQyFdWDNOUHktUwsAKzq8bS36tXzZpoZvAU9so=;
        b=DGeu1ZXKdUY47DqujOXqj6reKx17f+VLQZXo8F+Y5VTYYHOVIH8il2pSshjoMyrw8T
         VyiuY/Qb0sW98Ml3BQVkG2MKPezlVK4vDQFq+Mr7Xmg3Wo53TnDpMHWpkP4omTcgnlu1
         j0/KYXu+d2/dd59HuC2HH9gr2I/2YPwLEEplh39SoH15cn3HdPw1SArQ9Tt6/U7tx3LQ
         Viw+r8wE7eAnAjLUP/5TatDDveq5qLM2WFi43VxaGeND8Ll3rgLHelk8kXmpGsYeWmuX
         2dBod2+6Px4ZBnFelMAOOdGQYFvC0VXvUBX1Qlx23JI5oatdX15u/jfOr+E/9hiq1rjn
         TuQQ==
X-Gm-Message-State: AOJu0Yz9hRwol/A4puWCP31LK+N8oLNFlS6H7hlQBX6I31dmU/PAb6CT
	r29edyS+ix4Fi+ll7ypDdZJHwq9xRVsxxm6WQ0IgZxdlfM48a4AW++7I
X-Gm-Gg: ASbGncuMOpgnzoa5fJ9BeqAxdTZMQorTV8SJTKd08qtpwbcFipf8wQg5MzPuZvWC8Gc
	tOMmKGxteqAw9s55SAAUIOPNEQ7ZzVxGHCwBWlodnX8GFQ+CbFlbNNLbRv8ZFUkZg/+PcNZqGez
	gydDXUCeFVyJk7Ud3R8aXOI6/2ZY63AHhAKWjzmo9oxd+aHFoPladei7LKKQDmOEkEazJovOw1s
	PsyMlCuaW7Bbs8iThhpz/0ipppOzwh3rk59uy/S8xbaJezGguYCEVRNmxao8xXCo47YVmfRI21C
	B65xlrFEtUNk7o2TwuNzXrGhwglM9aKXcn9sxwCmq3OGIP+fo42tr8u4CjgkwHHOjpAu+2gU3Fi
	GURSGO29N87wyGBkR+984cgOaLX0jyds=
X-Google-Smtp-Source: AGHT+IEs+O0KAA4lAtbg8xhIMluUIO/IJKeSGzRSE+VObVSx43N/VoLBxnz3bXjuIVwpSCWtMTHeLw==
X-Received: by 2002:a17:907:7fa9:b0:b07:e3a8:5194 with SMTP id a640c23a62f3a-b34bad28516mr1427913166b.22.1759062650123;
        Sun, 28 Sep 2025 05:30:50 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b353e5d0526sm726398666b.12.2025.09.28.05.30.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Sep 2025 05:30:49 -0700 (PDT)
Message-ID: <72825199-a734-4449-8581-b32e68a176d6@gmail.com>
Date: Sun, 28 Sep 2025 14:30:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe][meta-oe][walnascar][PATCH 00/21] Trying to keep recipes in
 the walnascar branch updated with useful fixes from the master branch.
To: Ankur Tyagi <ankur.tyagi85@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20250927063216.1865627-1-ankur.tyagi85@gmail.com>
 <b882b222-eeaa-4f10-997a-2d281f09e4d6@gmail.com>
 <CADySD0EppQKCAP-m2d2Wq838c-rqCpSca6JzzfnHMAwkqj3okw@mail.gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <CADySD0EppQKCAP-m2d2Wq838c-rqCpSca6JzzfnHMAwkqj3okw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Sep 2025 12:30:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119998

On 9/28/25 03:00, Ankur Tyagi wrote:
> On Sun, Sep 28, 2025 at 6:53 AM Gyorgy Sarvari <skandigraun@gmail.com> wrote:
>> I have notes about two patches:
>>
>> 02/21: I wouldn't change defconfig in a stable branch.
> The base version of hostapd is unchanged and I thought these defconfig
> changes will be a good improvement.
> But understand this is a change in behavior.
>
> If we decide to keep this change then I will also include the
> following as well in v2 otherwise drop it.
> https://git.openembedded.org/meta-openembedded/commit/meta-oe/recipes-connectivity/hostapd?id=c9922073e4fab54b5b743947b68bda75dc72b064

I don't think that this warrants a v2, I can just skip these two.
03/21 fixes a generic bug - if users want to set the affected config
themselves, this will ensure that it will work. I find it to be useful
on its own merits, unless I'm missing something.

>> 17/21: Despite the semver-like versioning, this looks like a full
>> fledged feature release, with over a 1.3k commits and a long list of new
>> features and changes.
>>
> It was not intended to be included, I need to fix my workflow. Sorry for that.
>
>> Otherwise I plan to test the rest (assuming no other objections arise),
>> thanks a lot.
>>
> Thanks for the review, I have another batch ready but will wait for
> this batch to be validated first.
>
>> On 9/27/25 08:31, Ankur Tyagi via lists.openembedded.org wrote:
>>> I have tried to carefully review the change logs and commit logs while updating
>>> recipe versions.
>>>
>>> Did basic validation by building against qemux86-64 and qemuarm64
>>> machine targets.
>>>
>>> Ankur Tyagi (1):
>>>   lsscsi: fix versioning
>>>
>>> Changqing Li (1):
>>>   pahole: fix a Segmentation fault error
>>>
>>> Jason Schonberg (1):
>>>   Remove the use of http://ftp.gnome.org/pub/gnome
>>>
>>> Jeroen Hofstee (1):
>>>   php: ignore CVE-2024-3566
>>>
>>> Khem Raj (2):
>>>   tomlplusplus: Fix test failures with clang/libcxx
>>>   safec: Pass Qunused-arguments when using clang
>>>
>>> Leon Anavi (1):
>>>   ssd1306: Update to newer version
>>>
>>> Miaoqing Pan (1):
>>>   hostapd: enable 802.11be, SAE-PK, OWE, SuiteB, ACS, and MBO support
>>>
>>> Nitin Wankhade (1):
>>>   iperf3: Fix CVE-2025-54350
>>>
>>> Peace Lee (1):
>>>   guider: Upgrade 3.9.8 -> 3.9.9
>>>
>>> Peter Kjellerstedt (1):
>>>   hostapd: Backport a patch to build SAE-PK correctly
>>>
>>> Wang Mingyu (9):
>>>   gensio: upgrade 2.8.7 -> 2.8.15
>>>   libimobiledevice-glue: upgrade 1.3.1 -> 1.3.2
>>>   ser2net: upgrade 4.6.4 -> 4.6.5
>>>   mm-common: upgrade 1.0.6 -> 1.0.7
>>>   valijson: upgrade 1.0.4 -> 1.0.5
>>>   valijson: upgrade 1.0.5 -> 1.0.6
>>>   tk: upgrade 9.0.1 -> 9.0.2
>>>   sexpect: upgrade 2.3.14 -> 2.3.15
>>>   iptraf-ng: upgrade 1.2.1 -> 1.2.2
>>>
>>> Yi Zhao (1):
>>>   tk8: upgrade 8.6.15 -> 8.6.17
>>>
>>>  .../iperf3/iperf3/CVE-2025-54350.patch        | 24 +++++++++
>>>  .../recipes-benchmark/iperf3/iperf3_3.18.bb   |  3 +-
>>>  meta-oe/recipes-bsp/lsscsi/lsscsi_030.bb      |  2 +
>>>  .../{gensio_2.8.7.bb => gensio_2.8.15.bb}     |  4 +-
>>>  ...e64-for-hostapd-CONFIG_SAE_PK-builds.patch | 40 ++++++++++++++
>>>  .../hostapd/hostapd/defconfig                 | 28 ++++++++++
>>>  .../hostapd/hostapd_2.11.bb                   |  1 +
>>>  ....3.1.bb => libimobiledevice-glue_1.3.2.bb} |  2 +-
>>>  .../{ser2net_4.6.4.bb => ser2net_4.6.5.bb}    |  2 +-
>>>  .../libsigc++-2.0/libsigc++-2.0_2.12.1.bb     |  2 +-
>>>  .../libsigc++-2.0/libsigc++-3_3.6.0.bb        |  2 +-
>>>  ...{mm-common_1.0.6.bb => mm-common_1.0.7.bb} |  4 +-
>>>  .../proxy-libintl/proxy-libintl_20100902.bb   |  4 +-
>>>  meta-oe/recipes-core/safec/safec_3.7.1.bb     |  3 ++
>>>  .../recipes-devtools/glade/glade_3.36.0.bb    |  2 +-
>>>  .../{guider_3.9.8.bb => guider_3.9.9.bb}      |  8 +--
>>>  ...{iptraf-ng_1.2.1.bb => iptraf-ng_1.2.2.bb} |  4 +-
>>>  ...r-Fix-elf_functions-cleanup-on-error.patch | 54 +++++++++++++++++++
>>>  .../recipes-devtools/pahole/pahole_1.29.bb    |  3 +-
>>>  meta-oe/recipes-devtools/php/php_8.4.10.bb    |  1 +
>>>  .../{sexpect_2.3.14.bb => sexpect_2.3.15.bb}  |  4 +-
>>>  .../recipes-devtools/ssd1306/ssd1306_git.bb   |  2 +-
>>>  .../tcltk/{tk8_8.6.15.bb => tk8_8.6.17.bb}    |  2 +-
>>>  .../tcltk/{tk_9.0.1.bb => tk_9.0.2.bb}        |  2 +-
>>>  .../tomlplusplus/tomlplusplus_git.bb          |  4 ++
>>>  .../{valijson_1.0.4.bb => valijson_1.0.6.bb}  |  4 +-
>>>  .../gnome-themes/gnome-themes-extra_3.28.bb   |  2 +-
>>>  meta-oe/recipes-gnome/gtk+/gtk+_2.24.33.bb    |  2 +-
>>>  28 files changed, 187 insertions(+), 28 deletions(-)
>>>  create mode 100644 meta-oe/recipes-benchmark/iperf3/iperf3/CVE-2025-54350.patch
>>>  rename meta-oe/recipes-connectivity/gensio/{gensio_2.8.7.bb => gensio_2.8.15.bb} (92%)
>>>  create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/0001-Include-base64-for-hostapd-CONFIG_SAE_PK-builds.patch
>>>  rename meta-oe/recipes-connectivity/libimobiledevice-glue/{libimobiledevice-glue_1.3.1.bb => libimobiledevice-glue_1.3.2.bb} (89%)
>>>  rename meta-oe/recipes-connectivity/ser2net/{ser2net_4.6.4.bb => ser2net_4.6.5.bb} (91%)
>>>  rename meta-oe/recipes-core/mm-common/{mm-common_1.0.6.bb => mm-common_1.0.7.bb} (78%)
>>>  rename meta-oe/recipes-devtools/guider/{guider_3.9.8.bb => guider_3.9.9.bb} (75%)
>>>  rename meta-oe/recipes-devtools/iptraf/{iptraf-ng_1.2.1.bb => iptraf-ng_1.2.2.bb} (89%)
>>>  create mode 100644 meta-oe/recipes-devtools/pahole/files/0001-btf_encoder-Fix-elf_functions-cleanup-on-error.patch
>>>  rename meta-oe/recipes-devtools/sexpect/{sexpect_2.3.14.bb => sexpect_2.3.15.bb} (82%)
>>>  rename meta-oe/recipes-devtools/tcltk/{tk8_8.6.15.bb => tk8_8.6.17.bb} (97%)
>>>  rename meta-oe/recipes-devtools/tcltk/{tk_9.0.1.bb => tk_9.0.2.bb} (97%)
>>>  rename meta-oe/recipes-devtools/valijson/{valijson_1.0.4.bb => valijson_1.0.6.bb} (90%)
>>>
>>>
>>> -=-=-=-=-=-=-=-=-=-=-=-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#119954): https://lists.openembedded.org/g/openembedded-devel/message/119954
>>> Mute This Topic: https://lists.openembedded.org/mt/115461658/6084445
>>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>


