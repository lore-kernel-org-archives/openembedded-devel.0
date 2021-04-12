Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web12.33486.1618237630864226215
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Apr 2021 07:27:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Q2FPHp7y;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id w10so9515610pgh.5
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Apr 2021 07:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:from:subject:autocrypt:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=Q+0Btq8uyhetRsg5iZMv6mIvwpxMey/eHF7Vg8fyBiE=;
        b=Q2FPHp7ylnWcj523CXgUEMAFAfh8hwBCBpwaq3bodGbNJS2swCJnz0yq2ICN4gSyuS
         kP9etSQWNpLwImcj4Kj3xorlA1gA3a+NfLTWhmyyUYrGByWqLtnxjUToCW+MmjpM4MfD
         3rrM/HFR08tp53DjiD0RPnfCLcWY9+wZFVqRH6tXQvxoEvXOKMBZibCaBEPmlrPz25qW
         zfHaEIp1pnCNrdCCI4xkby3KPgYm2uQaQye41zU66v9BuVXyxIfRqJbRfMNRp76jFJom
         Da4MbT/zSkreW+KveB8QTx/6+ts4EFMn5+JuZWOv1EsL1ZxizkntqCoFaVAR65p7/NeS
         Tk7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:autocrypt:message-id:date
         :user-agent:mime-version:content-transfer-encoding:content-language;
        bh=Q+0Btq8uyhetRsg5iZMv6mIvwpxMey/eHF7Vg8fyBiE=;
        b=K7rl1bEVdld4c+JqnjXMBwybYMlRvOdr1QbfljK3igT89JaV/dkI4qvaswgr5zCvr0
         UAqO+rK+i9CVcBmUP/lsT5Wj1uUexKiJKWP+JWbtWghrzZDenxfIBoFeLgrhnKa8jtB/
         Aof8pIvaBtmhLYNaIXKv3Dc4Ul/szE+aI52i/ldeLI4J1mUD5/Yk4pJL5ktAWKZPBf1M
         PjCv3gAv2Vm5hl2+m5ibbaw/2fLsZ4eb1y4qCbLs1U8kKs/uAJfLnrocDSrpd6w47uBu
         4qQ6BSy/DGtPcTtdw9cDkO9r32QbZvbj0goS7I7Bh9eONEP7aRVP1aDy4GV8FYCGt0lc
         z7gA==
X-Gm-Message-State: AOAM532SqEH7NR6DBgXFe1HrBPAhEM4icgA0udfhHxoDB16hA7h+QfpB
	zS7M1xuDou/nAzBLqNGaTF4=
X-Google-Smtp-Source: ABdhPJw+fmDQUu8/Eifpx9MueO3+nJ/cgF7NsFK/jWYKHPIaMKT50n4Y+eE6NyWD7FtCfrZWaRwbWg==
X-Received: by 2002:a63:5f0c:: with SMTP id t12mr26917731pgb.381.1618237630397;
        Mon, 12 Apr 2021 07:27:10 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:cc6c:b0b9:f575:afd2? ([2601:202:4180:a5c0:cc6c:b0b9:f575:afd2])
        by smtp.gmail.com with ESMTPSA id x1sm10056277pfj.209.2021.04.12.07.27.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Apr 2021 07:27:10 -0700 (PDT)
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
 Khem Raj <raj.khem@gmail.com>
From: "akuster" <akuster808@gmail.com>
Subject: Gatesgarth merge request April 12th
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <2f84fc8b-3ec9-cf2a-9b53-559bb1304043@gmail.com>
Date: Mon, 12 Apr 2021 07:27:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

The following changes since commit 317c2dd540c84556127ad07739c0c930a0741b50:

  packagegroup-meta-multimedia: include projucer only with x11 in
DISTRO_FEATURES (2021-04-04 12:39:22 -0700)

are available in the Git repository at:

  https://git.openembedded.org/meta-openembedded gatesgarth-next

for you to fetch changes up to c9815c86bfd63b2d9479915045197e7d315ef709:

  telepathy-glib: respect GI_DATA_ENABLED when enabling vala-bindings
(2021-04-10 07:37:44 -0700)

----------------------------------------------------------------
Kartikey Rameshbhai Parmar (1):
      fluidsynth: update SRC_URI to remove non-existing 2.1.x branch

Martin Jansa (4):
      libsmi: use /bin/sh instead of ${base_bindir}/sh to silence QA
error with usrmerge
      libyui: switch to libyui-old repo which still has this SRCREV
      uml-utilities: fix installed-vs-shipped with usrmerge
      telepathy-glib: respect GI_DATA_ENABLED when enabling vala-bindings

Mingli Yu (2):
      hostapd: fix CVE-2019-5061
      hostapd: fix CVE-2021-0326 and CVE-2021-27803

Oleksiy Obitotskyy (1):
      libsmi: set awk as target path

 .../recipes-multimedia/fluidsynth/fluidsynth.inc   |   2 +-
 .../hostapd/hostapd/CVE-2019-5061.patch            | 854
+++++++++++++++++++++
 .../hostapd/hostapd/CVE-2021-0326.patch            |  43 ++
 .../hostapd/hostapd/CVE-2021-27803.patch           |  54 ++
 .../recipes-connectivity/hostapd/hostapd_2.9.bb    |   3 +
 .../telepathy/telepathy-glib_0.24.1.bb             |   4 +-
 .../uml-utilities/uml-utilities_20040406.bb        |   5 +-
 meta-oe/recipes-graphics/libyui/libyui_3.10.0.bb   |   2 +-
 meta-oe/recipes-support/libsmi/libsmi_0.5.0.bb     |   2 +-
 9 files changed, 962 insertions(+), 7 deletions(-)
 create mode 100644
meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2019-5061.patch
 create mode 100644
meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2021-0326.patch
 create mode 100644
meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2021-27803.patch
