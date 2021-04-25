Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web12.7156.1619386542316881869
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 25 Apr 2021 14:35:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IcVGkBvP;
 spf=pass (domain: gmail.com, ip: 209.85.215.169, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id z16so38794558pga.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 25 Apr 2021 14:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:from:subject:autocrypt:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=dOjuMW16/ZZ33KZrbk3D4bYNNYNyzE7Wnl5yKXPHYac=;
        b=IcVGkBvP+V1mMxdgF7n7NM9xNIPRNK60o7nLvV16u1JlGfn65XcGAiMbYjUeXIMtE9
         WwF9j3cQnaSo5KaDlkU8W2Wo2/uZOfFiMi6yoOgYVJj9UeWSyS2EHBmW6ewYCoiLxUlA
         E99TQY8TJy7mjF14Pc7a8w7LJYF8r+nq1Lpk1u2Ag7iFJdh+MywqZjWSWwAVn7IcXhK3
         OozHBCEBnGq3ZrcXjv8f1iocv7tz1mY5R+QpVculETAdl8F6vkY8mOrAXaBHqSeuhIDe
         lI1bo9swasDjvHuaNUtPsf1aNWQBGKQ9K2oAm20HTYWzq2+wv6b8Jy5kSm8tO4J6PUd/
         2z0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:autocrypt:message-id:date
         :user-agent:mime-version:content-transfer-encoding:content-language;
        bh=dOjuMW16/ZZ33KZrbk3D4bYNNYNyzE7Wnl5yKXPHYac=;
        b=B++MRiuBcDZpTxFxSAHTyBbOIHJ97ii7YrRxcOuZ7sSQSigfEgylGLz1ArwVy2uF07
         WLxU6q0zanWizXTy1w/w6SJIgxvZ2N/qxpnSMSxr6UbeD9tzqbZZeQRbY6aByggOYeXQ
         1kGX4IsTC+YRiB/Fow2DbcrIpl13yYZ3DWgNS9BigqOZ3GPfiaMavbuJ/v2WIAI3bbmb
         TucOlRtltrgAjpUUYH5QSuebzNkQKcZwCs1JoWtyRfIHwq93K4DsjDk/R8awxmZ/8BBj
         MLz5C8xEgpNbb24PKN1FPbcbs0czd67FCPJBMw2PImDmaK6hPu+dYL47Z9y1peWjOC3k
         dUrg==
X-Gm-Message-State: AOAM531XvD6V3JzlJWwJxgCW0No+IbVL5prLptoTl4VZR8+mLYBvbwkY
	rUUgMgGU/D55GQZyOaLJqJueFtDpcytvMg==
X-Google-Smtp-Source: ABdhPJzahCG46NXRxKD6i3TOT21qJJFTM7PNO7j3B1eO6GV6343xk1+pTKFHMLAJc/sou58PScIKLw==
X-Received: by 2002:a63:e443:: with SMTP id i3mr14181193pgk.114.1619386541700;
        Sun, 25 Apr 2021 14:35:41 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:880e:6a48:f6c3:8404? ([2601:202:4180:a5c0:880e:6a48:f6c3:8404])
        by smtp.gmail.com with ESMTPSA id u189sm9285917pfb.151.2021.04.25.14.35.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Apr 2021 14:35:41 -0700 (PDT)
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: "Armin Kuster" <akuster808@gmail.com>
Subject: Hardknott merge request - April 25th
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <bfd87f9a-d54f-25fd-5229-ff3cd60ad033@gmail.com>
Date: Sun, 25 Apr 2021 14:35:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

The following changes since commit 2297d4ee04b47bc574f8879732d9e213ab7bf685:

  wireguard: update to v1.0.20210219 +1 (2021-04-18 13:49:13 -0700)

are available in the Git repository at:

  https://git.openembedded.org/meta-openembedded hardknott-next

for you to fetch changes up to 71b546ed8595b14d29efc1e8b951f8c845ad10c4:

  python3-cryptography: Upgrade to 3.3.2 (2021-04-23 19:09:56 -0700)

----------------------------------------------------------------
Chen Qi (2):
      tigervnc: upgrade to 1.11.0
      python3-django: upgrade to 2.2.20

Mingli Yu (2):
      php: Upgrade to 7.4.16
      python3-cryptography: Upgrade to 3.3.2

Stefan Ghinea (1):
      python3-django: fix CVE-2021-28658

Ulrich Ölmann (1):
      v4l-utils: fix reproducibility

 .../recipes-devtools/php/php/CVE-2020-7069.patch   | 158
---------------------
 .../recipes-devtools/php/php/CVE-2020-7070.patch   |  24 ----
 .../php/{php_7.4.9.bb => php_7.4.16.bb}            |   7 +-
 .../0002-do-not-build-tests-sub-directory.patch    |  21 +--
 ...tigervnc-add-fPIC-option-to-COMPILE_FLAGS.patch |  36 ++---
 .../{tigervnc_1.10.1.bb => tigervnc_1.11.0.bb}     |  13 +-
 ...ure.ac-autodetect-availability-of-systemd.patch |  47 ++++++
 ...estrict-installation-of-50-rc_keymap.conf.patch |  40 ++++++
 .../v4l2apps/v4l-utils_1.20.0.bb                   |  11 +-
 ...aphy_3.3.1.bb => python3-cryptography_3.3.2.bb} |   2 +-
 .../python/python3-django_2.2.16.bb                |   9 --
 .../python/python3-django_2.2.20.bb                |   9 ++
 12 files changed, 137 insertions(+), 240 deletions(-)

