Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBD45CAC5A7
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 07:57:04 +0000 (UTC)
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
 by mx.groups.io with SMTP id smtpd.web11.7176.1758700612215787046
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Sep 2025 00:56:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kovSsuJ3;
 spf=pass (domain: gmail.com, ip: 209.85.166.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-4248746aabfso25629525ab.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 00:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758700611; x=1759305411; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9v9IAieALYLgLCm/zSQmM01VlnjjvqBVug6gstz18/c=;
        b=kovSsuJ3F0VBAz3/w8qmFFjmXhksZecOAtjP7/lpcANnUJc2WfmB7OH5RvP6S/pnR3
         C/urGb7dt/2f6vAuwAFlMMDkRMwQI/47CYR5bW+DCBiYhTC3JPRLmEPY1hmO8VQ4jZCo
         qkx+dwtqcI9wKZE6eeUaz3qF6pyD47BOdP0a70qV2/fmDdt29DvKPewZxp9LXDGtu5KR
         zdMuMEr0atkevVc1WZjrvPN4+4RUixlx9tZ0ekIP/Ks1wcdAtUfbSYnHTurm5Ovjz5Yo
         RLN5/qerbJ43KkNkqEtTp+NcMlDcm3H3DB2UdRxkmJKE76exnLHfDCycjqwAx+gQHLdO
         LkJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758700611; x=1759305411;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9v9IAieALYLgLCm/zSQmM01VlnjjvqBVug6gstz18/c=;
        b=Nd7es5zc8d7mxZc/oEq8iH8G/KpM+ON5Omvu9XgXFyg46peueK2tQgd9ixotzg2Slw
         Ur9FbZG4yQLa9dgdXoykBKH1jzqw67cvngv8/VC9ocmShyvVZmeJMCu1JkY9VDwOQ6BN
         HdvOei2Cn8nJgoD0CuW1No5YJDpZn+kbov48DFJWNh3g1va5Qs6R3h7LVb1I7pvnIp+N
         QF7EmDSbtHg92hXDfJHf8VABOH3zK3kcXo4vxiqkLtj9/5Acmb9joVQecONX0/bQgWFL
         CUM6EvFMe8/rJfoIKm9l9sp5/I2UEScTf82rPL0i4ds3gcFaGRsvVaxcmd7BQZRPIPCR
         E/MQ==
X-Gm-Message-State: AOJu0YzscNuJdwt39w0bgEoZl5TFopposLkyFxWN2VrmAPg3dT6gJCtK
	StnLMYmD8/oET5hHLDLTR1/ios/ofNhD5/2NPiLWd4Pi1fnPF6w5PsWdBHn7Sg==
X-Gm-Gg: ASbGncsKYBLGLCi7ENDaujDi3NieuKwuLzwGUFU3S3oSe4+aHOB3jTeV0FbDPn62/Pt
	POJNutuiq5LdQKWYMSXYm4NzqS8ZTbOYoJGLiRBD2ak20OfXln0j+QbYAJINRYo0HZajy6sRjHI
	rWMTIqfuq1MgbudSo+Qote4yR0+XkIqX8C/ahS+Q7kO4F4Qre1mA01ErFI82vkY+jqsz76YfunT
	6krBzyGysadbsv2vSCuDlQZtAbbAvciJcbkTNVDP5aiYkyUsO2WjHgNFxHdzRlC41V4E7kaqrVV
	pm9gWTU2XxwQQoM5edmh37dA/Arr9fyX3kX982SndcC8fDESuYUdWWlpAyPls1dwJaRx/zmgD1s
	wGhyK2RYoBRkhi6E3+UhDwQocqyjyqJiqfRfRM0aCslaWiwGfluLFqVeAkzaWcgU=
X-Google-Smtp-Source: AGHT+IH6FAqcU/Kj5aHIshf6Z0f1PDHbmmPS522rVFfxyYbi4dfXuO+qn0G+P6GR6SjPghfHOpLw1w==
X-Received: by 2002:a05:6e02:4518:20b0:425:8a71:b3eb with SMTP id e9e14a558f8ab-4258a71b44emr47782855ab.4.1758700610625;
        Wed, 24 Sep 2025 00:56:50 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([147.161.216.253])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-55dba4465f4sm3203576173.37.2025.09.24.00.56.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 00:56:50 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][walnascar][PATCH 0/6] cherry-picks from master branch
Date: Wed, 24 Sep 2025 19:56:37 +1200
Message-ID: <20250924075643.2047506-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 07:57:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119755

Trying to keep recipes in the walnascar branch updated with useful fixes
from the master branch.

I intend to submit patch series for each sub-folder, this series is for
the recipes inside "meta-oe/recipes-bsp".

I have tried to carefully review the change logs and commit logs while updating
recipe versions.

Did basic validation by building against qemux86-64 and qemuarm64
machine targets.

Changqing Li (1):
  lsscsi: upgrade to version 0.32

Gyorgy Sarvari (1):
  ledmon: upgrade 0.97 -> 1.1.0

Mikko Rapeli (2):
  fwupd: update to 2.0.12
  fwupd-efi: update from 1.6 to 1.7

Wang Mingyu (2):
  bolt: upgrade 0.9.6 -> 0.9.10
  flashrom: upgrade 1.5.1 -> 1.6.0

 .../bolt/{bolt_0.9.6.bb => bolt_0.9.10.bb}    |   2 +-
 ...-meson-Add-options-pciutils-ftdi-usb.patch |  17 ++-
 .../{flashrom_1.5.1.bb => flashrom_1.6.0.bb}  |   2 +-
 ..._binary.py-Use-env-to-detect-python3.patch |  23 ---
 .../{fwupd-efi_1.6.bb => fwupd-efi_1.7.bb}    |   5 +-
 ...certs.py-use-usr-bin-env-for-python3.patch |  28 ++++
 ...-reduce-lzma-compression-level-from-.patch |  47 ++++++
 meta-oe/recipes-bsp/fwupd/fwupd_1.9.25.bb     | 134 ------------------
 meta-oe/recipes-bsp/fwupd/fwupd_2.0.12.bb     |  93 ++++++++++++
 .../ledmon/0001-fix-build-with-clang.patch    |  90 ------------
 ...nclude-sys-select.h-and-sys-types.h.patch} |  27 ++--
 .../{ledmon_0.97.bb => ledmon_1.1.0.bb}       |  10 +-
 .../lsscsi/{lsscsi_030.bb => lsscsi_0.32.bb}  |   6 +-
 13 files changed, 197 insertions(+), 287 deletions(-)
 rename meta-oe/recipes-bsp/bolt/{bolt_0.9.6.bb => bolt_0.9.10.bb} (92%)
 rename meta-oe/recipes-bsp/flashrom/{flashrom_1.5.1.bb => flashrom_1.6.0.bb} (89%)
 delete mode 100644 meta-oe/recipes-bsp/fwupd/fwupd-efi/0001-efi-generate_binary.py-Use-env-to-detect-python3.patch
 rename meta-oe/recipes-bsp/fwupd/{fwupd-efi_1.6.bb => fwupd-efi_1.7.bb} (90%)
 create mode 100644 meta-oe/recipes-bsp/fwupd/fwupd/0001-build-certs.py-use-usr-bin-env-for-python3.patch
 create mode 100644 meta-oe/recipes-bsp/fwupd/fwupd/0001-fu-lzma-common.c-reduce-lzma-compression-level-from-.patch
 delete mode 100644 meta-oe/recipes-bsp/fwupd/fwupd_1.9.25.bb
 create mode 100644 meta-oe/recipes-bsp/fwupd/fwupd_2.0.12.bb
 delete mode 100644 meta-oe/recipes-bsp/ledmon/ledmon/0001-fix-build-with-clang.patch
 rename meta-oe/recipes-bsp/ledmon/ledmon/{0002-include-sys-select.h-and-sys-types.h.patch => 0001-include-sys-select.h-and-sys-types.h.patch} (56%)
 rename meta-oe/recipes-bsp/ledmon/{ledmon_0.97.bb => ledmon_1.1.0.bb} (79%)
 rename meta-oe/recipes-bsp/lsscsi/{lsscsi_030.bb => lsscsi_0.32.bb} (63%)


