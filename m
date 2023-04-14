Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02614C77B72
	for <webhook@archiver.kernel.org>; Fri, 14 Apr 2023 11:52:01 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.7187.1681473113784411147
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Apr 2023 04:51:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=E6UI1+4z;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.44, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f44.google.com with SMTP id w24so7610590wra.10
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Apr 2023 04:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1681473112; x=1684065112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B4+HMh4/sR1MTh7Z3GeN/Fx9/pAbzSqOuNhi5lkpJw0=;
        b=E6UI1+4zDRV3xC0ryVIfLS+p2gPGnnXJWUoT8CRTkGeTXFhfayUXfatgian03ygfW6
         jkx9d/LcLPKXYakXfGuYgwxcjnIqKL2davE5Yu9MwgVYL4FPI/L5IjJ0XOWa+8c6DP2K
         LxUlQnE2Z32GsA71bWvI/2Ejy9DPWtQYZOF3uNpJTu68p6M4VZefeFlxuMpBVzsGNdRQ
         YdM2DbW2XlxVvudQMIXbdJurM5DnKARD05Mb5GxFAsiNpJ2TxlNUwP6QWh88XNuHmTS5
         2m9uUO/5u8bIVP5TpPeuYyYEkCSn1YgR6HY4tA++yMyFOa9LnYpq/OXt3nEA9GGHq8Md
         V3xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681473112; x=1684065112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B4+HMh4/sR1MTh7Z3GeN/Fx9/pAbzSqOuNhi5lkpJw0=;
        b=FpJAJwOo7tj5f2mrom3LxyOoQdJCleu3XGVi83ikcZc0Ew9zBukbGH76an/eaKW06b
         TtS2EJq9DRkUTqJGmxFsskA1ceaosbOoe9CuTb2sICEkq754yYGCC7gGhtskb1bm5hW3
         nIejc6WAttiNxjG0hneUZ0MWM/agL/GH/9cFi1CawyvSXFysB2eHNhuafTJ1O6V2u0z2
         IBOn9J8EGO3bsbtChtHRv2kHhYIVNSs4FSkCd2ULfSsv/iRoDb7DqE9dNZBqDpYj5gWV
         bc/GmRx38OD+AUwAxnBsh98HFCSqMqkggf2IMWH9l+0+GKj8/XOvBQ4FfE37SJ25amEd
         AVrw==
X-Gm-Message-State: AAQBX9foIyJH0kjuJ3WHDZAfxCKPZ6AcNYk1FBb/fYKS0f5BnF84qDVo
	0eJZtSy9+Fo+zagX56x3nWNriA==
X-Google-Smtp-Source: AKy350YOAZz9eVAC/RoLYwv0B0KIH8w/zbrOtYBtXhv2LrVIu3r9Vl0F8V/Mw7S2++CSzAFUpeJzCA==
X-Received: by 2002:a05:6000:1b8c:b0:2ef:bada:2f04 with SMTP id r12-20020a0560001b8c00b002efbada2f04mr4113688wru.59.1681473111956;
        Fri, 14 Apr 2023 04:51:51 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:e6b0:9ea2:8124:b254])
        by smtp.gmail.com with ESMTPSA id f15-20020adff58f000000b002efb3566b0asm3379523wro.52.2023.04.14.04.51.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Apr 2023 04:51:51 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-oe][PATCH v2 0/4] python3-gpiod: fetch sources from pypi
Date: Fri, 14 Apr 2023 13:51:43 +0200
Message-Id: <20230414115147.136593-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Apr 2023 11:52:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102093

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Khem,

There were two issues in the previous version. First, the gpiosim.h
header is not installed as it's for tests only so we need to manually
install it when ptests are enabled so that the python package can see
it in its sysroot. The second issue were the PTEST_FLAGS that were not
correctly expanded. I dropped them now as they are no longer needed when
using the python build front-end.

I added an additional patch which removed libgpiod-src.inc as it's no
longer required by python3-gpiod. Tested with gcc & clang and glibc & musl.

Bartosz Golaszewski (4):
  python3-gpiod: add missing run-time dependencies
  libgpiod: install the libgpiosim header
  python3-gpiod: fetch sources from pypi
  libgpiod: fold libgpiod-src.inc into libgpiod.inc

 .../recipes-support/libgpiod/libgpiod-src.inc |  1 -
 meta-oe/recipes-support/libgpiod/libgpiod.inc |  7 +--
 .../libgpiod/libgpiod_2.0.1.bb                |  6 +++
 .../python/python3-gpiod_2.0.1.bb             | 38 ++++++++++++++++
 .../python/python3-gpiod_2.0.bb               | 45 -------------------
 5 files changed, 48 insertions(+), 49 deletions(-)
 delete mode 100644 meta-oe/recipes-support/libgpiod/libgpiod-src.inc
 create mode 100644 meta-python/recipes-devtools/python/python3-gpiod_2.0.1.bb
 delete mode 100644 meta-python/recipes-devtools/python/python3-gpiod_2.0.bb

-- 
2.37.2


