Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web08.3310.1612413255494720070
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Feb 2021 20:34:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cf2a6i8C;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id z21so1266617pgj.4
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 Feb 2021 20:34:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:from:subject:autocrypt:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=rBTCPZY4MKjVs0U6KikBHdPwo4grddV7XCsgHIju8nE=;
        b=cf2a6i8CxatqJF5+VZ94vO34xnovw5jXhUV0IdqvUVq7aOMYJFeqUvdTYQ3R2cDnzl
         cdc8pqrLoVXVniF49TeF/tr88CwQRy56pxnuNmWEOAr6xTmS2ucqP6kE4aWNnnfCb7XN
         ntk0vqka5UI8wcVPeNIPASCwmuCVsDhZSzuQiJtldH1kYUGAize4xc3GvY4N54VT5g/N
         lSuCm5IKGWoJ8ZCbqHLZmtDl6LCVmSMcypv+Zl733AOctJuti/fYI1SRj5bMNYn4vxEb
         IvXuQ70WksFLU2uXW0QIfH+NeKwolqqDX0ijreXV/qaU3hZO81lNOPawVVf65Ml9Yhfo
         wBkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:autocrypt:message-id:date
         :user-agent:mime-version:content-transfer-encoding:content-language;
        bh=rBTCPZY4MKjVs0U6KikBHdPwo4grddV7XCsgHIju8nE=;
        b=WQXoweNucXs5DBQQYG3jFu2bw6Xf4Qtr0ELGZIiXvopVx4LMtAxaKt3TqS9fTh4Mwk
         fyYd0AAalks3T6r1ayUf6DM4pJKX+cMaOtaC5tt5rVnfmYsk5GeZSMWi0YMjwc1ZADYJ
         j2SnvOMfCfZeZAiwtNlcQxym9LIm0x+k7uR7oDYF2lvzZ/3fVC/8krYxrOcQqh+3i4f/
         odpvmBNK45tLUdcMlvM88vsr2yF/uUVZE9gVZm0R6GU4vD73EWty4aKbB69tXRkRvasb
         8nglIcqSuOGQ+jhV/BJykCEJYqKoSupaYxodvz7jtiKdPP4lwYVvZGsBxZcZvdT3DSma
         ytCw==
X-Gm-Message-State: AOAM531fsaBPzBnhADkTisjrp0pQFWtxwZLK4H+fLsRwZ4IBGHULNeei
	PIhe7S117QjizepwgFoHUgM=
X-Google-Smtp-Source: ABdhPJyO8cD7bCT3PZovTFEOTpj/8oTv1E0xcg8WJ/dn0n0jvRLHZkNEiZKswDt44JrRLHK0zVtfXA==
X-Received: by 2002:a63:220b:: with SMTP id i11mr7109460pgi.2.1612413254981;
        Wed, 03 Feb 2021 20:34:14 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:bcbf:9808:caec:6e2b? ([2601:202:4180:a5c0:bcbf:9808:caec:6e2b])
        by smtp.gmail.com with ESMTPSA id t8sm3817194pjm.9.2021.02.03.20.34.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Feb 2021 20:34:14 -0800 (PST)
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
 Khem Raj <raj.khem@gmail.com>
From: "akuster" <akuster808@gmail.com>
Subject: Dunfell merge request Feb 3
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <ed6f91cd-578c-dc4d-7d3d-b3764947d40d@gmail.com>
Date: Wed, 3 Feb 2021 20:34:12 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

The following changes since commit 5bba79488b7d393d2258d6e917f7bf7b0d7c4073:

  gupnp: Upgrade to 1.2.2 -> 1.2.4 (2021-01-18 08:40:15 -0800)

are available in the Git repository at:

  https://git.openembedded.org/meta-openembedded dunfell-next

for you to fetch changes up to de37512b25c1f8c6bb6ab2b3782ac0fe01443483:

  gpsd: mark CLEANBROKEN (2021-01-31 09:42:35 -0800)

----------------------------------------------------------------
Dan Murphy (1):
      mariadb: Fix 64bit builds if pam is enabled

Dmitry Baryshkov (2):
      xterm: install xterm and uxterm desktop files
      xterm: provide virtual/x-terminal-emulator

Harpritkaur Bhandari (1):
      rapidjson: Upgrade SRCREV to latest

Khem Raj (2):
      iscsi-initiator-utils: Upgrade to _2.1.2
      iscsi-initiator-utils: Silence a clang warning on 64bit systems

Leon Anavi (2):
      sip3: Consolidate in a single file
      sip3: Upgrade 4.19.19 -> 4.19.23

Martin Jansa (1):
      networkd-dispatcher: use git fetcher

Mikko Rapeli (2):
      flatbuffers: whitelist CVE-2020-35864
      giflib: apply patch for CVE-2019-15133 and set CVE_PRODUCT

Sean Nyekjaer (1):
      gpsd: mark CLEANBROKEN

Søren Andersen (1):
      zram: fix sourcing of zram parameters

zangrc (1):
      iscsi-initiator-utils: upgrade 2.1.2 -> 2.1.3

 .../files/0001-Makefile-Do-not-set-Werror.patch    | 31
++++++++++++++++++++++
 ...ils_2.1.0.bb => iscsi-initiator-utils_2.1.3.bb} |  9 +++----
 .../networkd-dispatcher_2.0.1.bb                   |  7 ++---
 meta-oe/recipes-dbs/mysql/mariadb.inc              |  8 ++++--
 .../flatbuffers/flatbuffers_1.12.0.bb              |  3 +++
 .../giflib/files/CVE-2019-15133.patch              | 23 ++++++++++++++++
 meta-oe/recipes-devtools/giflib/giflib_5.1.4.bb    |  7 ++++-
 .../recipes-devtools/rapidjson/rapidjson_git.bb    |  5 ++--
 meta-oe/recipes-devtools/sip/sip3_4.19.19.bb       | 11 --------
 .../sip/{sip.inc => sip3_4.19.23.bb}               | 17 +++++++++---
 meta-oe/recipes-extended/zram/zram/zram-swap-init  |  2 +-
 meta-oe/recipes-graphics/xorg-app/xterm_353.bb     | 16 +++++++++--
 meta-oe/recipes-navigation/gpsd/gpsd_3.19.bb       |  2 ++
 13 files changed, 109 insertions(+), 32 deletions(-)
 create mode 100644
meta-networking/recipes-daemons/iscsi-initiator-utils/files/0001-Makefile-Do-not-set-Werror.patch
 rename
meta-networking/recipes-daemons/iscsi-initiator-utils/{iscsi-initiator-utils_2.1.0.bb
=> iscsi-initiator-utils_2.1.3.bb} (96%)
 create mode 100644
meta-oe/recipes-devtools/giflib/files/CVE-2019-15133.patch
 delete mode 100644 meta-oe/recipes-devtools/sip/sip3_4.19.19.bb
 rename meta-oe/recipes-devtools/sip/{sip.inc => sip3_4.19.23.bb} (79%)

