Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56F15CD37AC
	for <webhook@archiver.kernel.org>; Thu, 14 May 2026 01:13:36 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.904.1778721208679034291
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 May 2026 18:13:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=SBEvYCk+;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-488a14c31eeso50197735e9.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 18:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778721207; x=1779326007; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3G4kvYkFvthlVRnI4egLJvxbigIRIZ4455fL6EatgWk=;
        b=SBEvYCk+sk2QsjoOvNO0crInKQz/YP7nkv4UpeECC7p7kKl+GrwGNgSXcCCk2iLlXI
         aETNkl4CC1GWHmUSsSqRlj5vV3A7ZvHreg9tnuxsYyh2df7CP7DHngr6B2t9fWSKZRnz
         ZEY1uUsvuyzXfpwzFpeuFQdNLhaoUA70TD6kxU4BDgWst94TT8AnqYIahKyVBwbia/Re
         CZtray6ONRIhWbu+rTd+0RKPgkC8uDQzJnukNdV+/jx91vGe53NsuL+KOvZX2Y/rRvYn
         tosz/kHFBYHPF58jfUjMvfaiUzYnULB5Ur2pWunSnmMtPk6lXq75OzcYx37rDvxSRcz7
         OR2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778721207; x=1779326007;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3G4kvYkFvthlVRnI4egLJvxbigIRIZ4455fL6EatgWk=;
        b=G8CshfYBprtsmywgfoewVbG5GD3x/hahNXQ8xIpNNjiOH2nuVH8qMTIPfi5XdrHjKP
         QpkyBILccHtdCwBvJMt9TqgiOwfZYh77QQslU+BERE4t+ZlTRxT01OiUcZOW6g3/lz1f
         y/nLHfw6iPosnsHVu1VUG+qp/axqobC0KyXi66anSCcSvGE7M2vcXuBP7UCPgCr0pTdc
         D4QZ9oDHJtQP8X/S6OPstaJBUUx6j2bGcPKquJhSZaG+e5BEeuMbtnuA8UotlvMEevBP
         cV7MiSYtI5xCzKlRWee4YoDnskuKTyFUhU8Q29iMw1Wnu+83GOaoaqZDBVfap0uBf7c5
         nPuQ==
X-Gm-Message-State: AOJu0Yxo9uBYWPQ6WX6b9ADh8yEUzFsBTw8rISEuq5jbsz2/omNgRLyi
	HAzmADQSyAONtbmqX/+P5FuVP6rLvnp2/fv3nPIQpoKqo8hwQT8tk364UYETYQ==
X-Gm-Gg: Acq92OEIA7CdhWlxSEuQzNacjHFHNXWd2BeL1rUPVQie/YvR+gkoCSNlOATBx6YJedh
	Yjz20kVQncdDN/rPYN2P9xnjea5T86EYPZmzCy4kUCoH/VtbO/MmZq0KYMLum0FU/MP/NGGOyAp
	1HQ8MrarQtwf62WrKqOCLo09TgKHPIYytjexFiv1sSBLdtrvgMiujBhx8FIASDu6+sN+cTFshMj
	7TBcQo+eEFbXb0RweiyMGIIJbI1JUWrkUAJI04sXIMnLxAn8QM2b5pkBeNVgnlSPIbxP4OKEK8L
	bxq19Aq+1n7zVI6Cf9RtYhVe7LYcyaqvDEYPtx66gyoVFd7YvcueOZVlPeSOEUdO+WZqfHbfWbf
	5MGrllyONAHJk+cD1RgsMmouX1ACOtikp5C10jvBGYKK8+p/GRcUuHrbbkpl77NmH4w/Sr8hhmI
	jAWdKd2IsJ/EytdEVofB1sPDNG76rH1I3sAByfN9F22Q==
X-Received: by 2002:a05:600c:8b2b:b0:489:1d74:56d with SMTP id 5b1f17b1804b1-48fc9a4db09mr90636325e9.29.1778721206814;
        Wed, 13 May 2026 18:13:26 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0fe13a7sm2876427f8f.29.2026.05.13.18.13.25
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 18:13:26 -0700 (PDT)
Message-ID: <a52a266f-a5d0-40bf-a307-10676231d477@gmail.com>
Date: Thu, 14 May 2026 03:13:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] Kirkstone pull request 13th May
To: "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
References: <20260513092304.1177892-1-skandigraun@gmail.com>
 <CAMKF1sqp9hrU_+PUzo95fTP28_Hd_9g_ECON8Jb78BEqxxxTvg@mail.gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <CAMKF1sqp9hrU_+PUzo95fTP28_Hd_9g_ECON8Jb78BEqxxxTvg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 May 2026 01:13:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126980

With this the upstream support for the Kirkstone branch of meta-oe is
concluded.

You can still send patches to the ML for others to benefit, but there
are no plans to integrate any new patches into this branch.

Thank you to all who contributed to this branch over its whole lifetime.


On 5/14/26 02:50, Khem Raj wrote:
> Thanks Gyorgy, this is installed.
> 
> On Wed, May 13, 2026 at 2:23 AM Gyorgy Sarvari via
> lists.openembedded.org <http://lists.openembedded.org>
> <skandigraun=gmail.com@lists.openembedded.org
> <mailto:gmail.com@lists.openembedded.org>> wrote:
> 
>     Some last minute fixes - thanks to all contributors.
> 
>     Test artifacts:
>     World build qemuarm: https://github.com/OldManYellsAtCloud/meta-oe-
>     test/actions/runs/25286703147 <https://github.com/
>     OldManYellsAtCloud/meta-oe-test/actions/runs/25286703147>
>     World build qemuarm64: https://github.com/OldManYellsAtCloud/meta-
>     oe-test/actions/runs/25289100851 <https://github.com/
>     OldManYellsAtCloud/meta-oe-test/actions/runs/25289100851>
>     World build qemux86: https://github.com/OldManYellsAtCloud/meta-oe-
>     test/actions/runs/25290018061 <https://github.com/
>     OldManYellsAtCloud/meta-oe-test/actions/runs/25290018061>
>     World build qemux86-64: https://github.com/OldManYellsAtCloud/meta-
>     oe-test/actions/runs/25290023412 <https://github.com/
>     OldManYellsAtCloud/meta-oe-test/actions/runs/25290023412>
>     YP layer compatibility: https://github.com/OldManYellsAtCloud/meta-
>     oe-test/actions/runs/25261771118 <https://github.com/
>     OldManYellsAtCloud/meta-oe-test/actions/runs/25261771118>
>     Ptest execution (logs available at the link): https://github.com/
>     OldManYellsAtCloud/meta-oe-test/actions/runs/25384396207 <https://
>     github.com/OldManYellsAtCloud/meta-oe-test/actions/runs/25384396207>
> 
>     The following changes since commit
>     9d8ef26a9693e2c70ae34abe1a753873d42ec588:
> 
>       libssh: Fix CVE-2026-0964 (2026-03-29 11:11:33 +0200)
> 
>     are available in the Git repository at:
> 
>       git://git.openembedded.org/meta-openembedded-contrib <http://
>     git.openembedded.org/meta-openembedded-contrib> stable/kirkstone-nut
> 
>     for you to fetch changes up to ce8539c941f6fcbecaca4d16640ac105c0595589:
> 
>       python3-soupsieve: fix tests with Python 3.10.20 (2026-05-04
>     15:59:37 +0200)
> 
>     ----------------------------------------------------------------
>     Bhabu Bindu (1):
>           neon: Backport redirect test debug improvements
> 
>     Gyorgy Sarvari (16):
>           python3-cbor2: return correct error code from run-ptest
>           python3-cbor2: more patch indent and test fixes
>           nginx: set CVE_PRODUCT
>           tomoyo-tools: fix SRC_URI
>           logwatch: fix SRC_URI
>           dnfdragora: fix SRC_URI
>           ipc-run: fix SRC_URI
>           linux-atm: fix SRC_URI
>           driverctl: fix SRC_URI
>           libsodium: fix SRC_URI
>           sblim-sfcc: fix SRC_URI
>           ttf-sazanami: fix SRC_URI
>           libubox: fix SRC_URI
>           unicode-ucd: fix license hash (again)
>           ttf-vlgothic: fix SRC_URI
>           python3-soupsieve: fix tests with Python 3.10.20
> 
>     Hitendra Prajapati (3):
>           nginx: fix CVE-2026-27784, CVE-2026-28755
>           nginx: fix multiple CVEs
>           nginx: fix CVE-2026-32647
> 
>     Jon Mason (1):
>           python3-cbor2: Fix CVE-2025-68131 CVE patch error
> 
>     Naman Jain (2):
>           python3-protobuf: ignore CVE-2024-7254
>           imagemagick: Fix CVE-2025-68950
> 
>     Shaik Moin (1):
>           imagemagick: Fix CVE-2025-62594
> 
>     Tyler Park (1):
>           fmt: Updated master->main in SRC_URI.
> 
>     Vijay Anusuri (1):
>           strongswan: Fix CVE-2026-25075
> 
>     Zahir Hussain (1):
>           rocksdb: fix typo in PACKAGECONFIG
> 
>      .../recipes-support/linux-atm/linux-atm_2.5.2.bb <http://linux-
>     atm_2.5.2.bb>   |   2 +-
>      .../strongswan/files/CVE-2026-25075.patch          |  50 ++++++
>      .../strongswan/strongswan_5.9.13.bb <http://strongswan_5.9.13.bb> 
>                   |   1 +
>      .../recipes-crypto/libsodium/libsodium_1.0.18.bb <http://
>     libsodium_1.0.18.bb>   |   2 +-
>      meta-oe/recipes-dbs/rocksdb/rocksdb_6.20.3.bb <http://
>     rocksdb_6.20.3.bb>      |   2 +-
>      meta-oe/recipes-devtools/libubox/libubox_git.bb <http://
>     libubox_git.bb>    |   2 +-
>      .../recipes-devtools/perl/ipc-run_20200505.0.bb <http://ipc-
>     run_20200505.0.bb>    |   2 +-
>      meta-oe/recipes-extended/logwatch/logwatch_7.6.bb <http://
>     logwatch_7.6.bb>  |   2 +-
>      .../sblim-sfcc/sblim-sfcc_2.2.8.bb <http://sblim-sfcc_2.2.8.bb>   
>                  |   2 +-
>      .../dnfdragora/dnfdragora_2.1.2.bb <http://dnfdragora_2.1.2.bb>   
>                  |   2 +-
>      .../ttf-fonts/ttf-sazanami_20040629.bb <http://ttf-
>     sazanami_20040629.bb>             |   2 +-
>      .../ttf-fonts/ttf-vlgothic_20200720.bb <http://ttf-
>     vlgothic_20200720.bb>             |   2 +-
>      .../tomoyo-tools/tomoyo-tools_2.5.0.bb <http://tomoyo-
>     tools_2.5.0.bb>             |   2 +-
>      .../recipes-support/driverctl/driverctl_0.111.bb <http://
>     driverctl_0.111.bb>   |   2 +-
>      meta-oe/recipes-support/fmt/fmt_8.1.1.bb <http://fmt_8.1.1.bb>     
>          |   2 +-
>      .../imagemagick/files/CVE-2025-62594.patch         | 197 ++++++++++
>     +++++++++++
>      .../imagemagick/files/CVE-2025-68950.patch         |  24 +++
>      .../imagemagick/imagemagick_7.0.10.bb <http://
>     imagemagick_7.0.10.bb>              |   2 +
>      .../0001-Temporarily-disable-no_redirect.patch     |  45 +++++
>      ...-enabling-no_redirect-with-more-debugging.patch |  50 ++++++
>      ...rect-Switch-to-using-double_serve_sstring.patch |  48 +++++
>      .../neon/neon/0004-test-redirect.c-Cleanup.patch   |  49 +++++
>      meta-oe/recipes-support/neon/neon_0.30.2.bb <http://
>     neon_0.30.2.bb>        |   4 +
>      .../unicode-ucd/unicode-ucd_14.0.0.bb <http://unicode-
>     ucd_14.0.0.bb>              |   6 +-
>      .../0001-fix-test-parameterization.patch           |  48 +++++
>      .../python/python3-cbor2/CVE-2025-68131.patch      |  51 ++++--
>      .../python/python3-cbor2/run-ptest                 |   3 +-
>      .../recipes-devtools/python/python3-cbor2_5.4.2.bb <http://python3-
>     cbor2_5.4.2.bb> |   1 +
>      .../python/python3-protobuf_3.20.3.bb <http://python3-
>     protobuf_3.20.3.bb>              |   3 +
>      ...djustments-for-changes-in-HTML-parser-285.patch | 190 ++++++++++
>     ++++++++++
>      .../python/python3-soupsieve_2.3.1.bb <http://python3-
>     soupsieve_2.3.1.bb>              |   8 +-
>      .../nginx/nginx-1.24.0/CVE-2026-27651.patch        |  34 ++++
>      .../nginx/nginx-1.24.0/CVE-2026-27654.patch        |  81 +++++++++
>      .../nginx/nginx-1.24.0/CVE-2026-27784.patch        |  88 +++++++++
>      .../nginx/nginx-1.24.0/CVE-2026-28753.patch        |  93 ++++++++++
>      .../nginx/nginx-1.24.0/CVE-2026-28755.patch        |  48 +++++
>      .../nginx/nginx-1.24.0/CVE-2026-32647.patch        |  78 ++++++++
>      meta-webserver/recipes-httpd/nginx/nginx.inc       |   2 +
>      meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb <http://
>     nginx_1.24.0.bb> |   9 +
>      39 files changed, 1199 insertions(+), 40 deletions(-)
>      create mode 100644 meta-networking/recipes-support/strongswan/
>     files/CVE-2026-25075.patch
>      create mode 100644 meta-oe/recipes-support/imagemagick/files/
>     CVE-2025-62594.patch
>      create mode 100644 meta-oe/recipes-support/imagemagick/files/
>     CVE-2025-68950.patch
>      create mode 100644 meta-oe/recipes-support/neon/neon/0001-
>     Temporarily-disable-no_redirect.patch
>      create mode 100644 meta-oe/recipes-support/neon/neon/0002-Re-
>     enabling-no_redirect-with-more-debugging.patch
>      create mode 100644 meta-oe/recipes-support/neon/neon/0003-
>     no_redirect-Switch-to-using-double_serve_sstring.patch
>      create mode 100644 meta-oe/recipes-support/neon/neon/0004-test-
>     redirect.c-Cleanup.patch
>      create mode 100644 meta-python/recipes-devtools/python/python3-
>     cbor2/0001-fix-test-parameterization.patch
>      create mode 100644 meta-python/recipes-devtools/python/python3-
>     soupsieve/0001-Adjustments-for-changes-in-HTML-parser-285.patch
>      create mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.24.0/
>     CVE-2026-27651.patch
>      create mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.24.0/
>     CVE-2026-27654.patch
>      create mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.24.0/
>     CVE-2026-27784.patch
>      create mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.24.0/
>     CVE-2026-28753.patch
>      create mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.24.0/
>     CVE-2026-28755.patch
>      create mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.24.0/
>     CVE-2026-32647.patch
> 
>     -=-=-=-=-=-=-=-=-=-=-=-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#126960): https://lists.openembedded.org/g/
>     openembedded-devel/message/126960 <https://lists.openembedded.org/g/
>     openembedded-devel/message/126960>
>     Mute This Topic: https://lists.openembedded.org/mt/119294323/1997914
>     <https://lists.openembedded.org/mt/119294323/1997914>
>     Group Owner: openembedded-devel+owner@lists.openembedded.org
>     <mailto:openembedded-devel%2Bowner@lists.openembedded.org>
>     Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/
>     unsub <https://lists.openembedded.org/g/openembedded-devel/unsub>
>     [raj.khem@gmail.com <mailto:raj.khem@gmail.com>]
>     -=-=-=-=-=-=-=-=-=-=-=-
> 


