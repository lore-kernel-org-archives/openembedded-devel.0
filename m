Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web10.7839.1613570975501504674
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Feb 2021 06:09:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vKOTwJFg;
 spf=pass (domain: gmail.com, ip: 209.85.208.182, mailfrom: liu.ming50@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id r23so16292483ljh.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 17 Feb 2021 06:09:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6X+jQnKIatZqQX5nZXfAooUCpEvbG5EGKxqC9euhuxM=;
        b=vKOTwJFgAcRCX1gntV5sYBo11tMC2BDyO3DMRqRJhpNDqaGBKgJpLS21O3lAtdTwij
         is0TYJeJfjHxOJunJsbQjHaL3WmKUoqJE3f6sdyAL6E/Tj7wQsKAcEA5ZRqq7KmTEbfi
         8fery7WHnpbcrK7KgI5xJdS8qCvOq7A+CRQBL0LCxw3jpjzwlgV/nUZBD3eWR0EQ7zoI
         p33IMSSLt6/6Yv+y0Y2coi1A9FXGuEBxPo7KflEHbzSr2TmoS0xMb6PJlZIpJjlkgMoD
         1SFmSS0fOD7d56Tsz2JZtM/OneflRGrd9E7Pgr6GCEqaWDsT7idopotqYTt8pD0BUbxM
         GXUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6X+jQnKIatZqQX5nZXfAooUCpEvbG5EGKxqC9euhuxM=;
        b=nk0prAptG2CVfikUuMmPQJVBSMJFGhrxdBSSSV1WWT9izApQiHfFfimFeGJiEEWnQR
         Ufqocwa90ogillMwUJJISTqtPiQBs8LYDAO09/6FX1gzoa1Qfle/kOxPYJnaD/wZRfkz
         iOGu/R0Ujq8SBd4rTfwQ16QZ2FC4YGAng/g46dT079VCC2UoFyeUFtw2kMso5ssH/FYV
         BVP4FRfgobcGVVYzVd9jAXuy/dL6rCyAzdmiUvPVUivno0qX+C4WrT9LeCMJ6p3HpcwK
         wfbHodGQwefJ8UeRAZ5WdOyKHBWrL+6F4Gq/b7LK4rbsZfhFJe/0C9wN/ZW353tyg9dd
         RZOA==
X-Gm-Message-State: AOAM5322xV6HixzZFHHlthqxCEuHQP4YasHab3azYO0luOuJdxfSyzSt
	WuNAQN9SAuDMrfHoTS/V4D8=
X-Google-Smtp-Source: ABdhPJw1uNi2Tj0G3fip1KT2wtIMRDPNNLWnzOns8mZ9zDgUXqnV53z1WbZNBHpr5hueLhWxjpX7vQ==
X-Received: by 2002:a2e:8803:: with SMTP id x3mr14481816ljh.173.1613570973299;
        Wed, 17 Feb 2021 06:09:33 -0800 (PST)
Return-Path: <liu.ming50@gmail.com>
Received: from localhost.localdomain ([90.129.215.157])
        by smtp.gmail.com with ESMTPSA id q26sm253363lfc.254.2021.02.17.06.09.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Feb 2021 06:09:32 -0800 (PST)
From: "Ming Liu" <liu.ming50@gmail.com>
To: yocto@lists.yoctoproject.org,
	openembedded-devel@lists.openembedded.org
Cc: akuster808@gmail.com,
	sergio.prado@toradex.com,
	Ming Liu <liu.ming50@gmail.com>
Subject: [meta-security] [PATCH 0/5] Some fixes for IMA/EVM
Date: Wed, 17 Feb 2021 15:09:24 +0100
Message-Id: <20210217140929.987752-1-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ming Liu <liu.ming50@gmail.com>

Ming Liu (5):
  ima-evm-utils: set native REQUIRED_DISTRO_FEATURES to empty
  initramfs-framework-ima: fix a wrong path
  meta: refactor IMA/EVM sign rootfs
  initramfs-framework-ima: let ima_enabled return 0
  ima-evm-rootfs.bbclass: avoid generating /etc/fstab for wic

 meta-integrity/README.md                      |  4 ++-
 meta-integrity/classes/ima-evm-rootfs.bbclass | 33 +++++++++----------
 .../initrdscripts/initramfs-framework-ima.bb  |  2 +-
 .../initrdscripts/initramfs-framework-ima/ima |  3 +-
 .../ima-evm-keys/ima-evm-keys_1.0.bb          | 16 +++++++++
 .../ima-evm-utils/ima-evm-utils_git.bb        |  1 +
 6 files changed, 38 insertions(+), 21 deletions(-)
 create mode 100644 meta-integrity/recipes-security/ima-evm-keys/ima-evm-keys_1.0.bb

-- 
2.29.0

