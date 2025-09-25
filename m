Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E42DCCAC5AA
	for <webhook@archiver.kernel.org>; Thu, 25 Sep 2025 06:21:26 +0000 (UTC)
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
 by mx.groups.io with SMTP id smtpd.web10.4900.1758781282879140548
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Sep 2025 23:21:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GH3Rxyeo;
 spf=pass (domain: gmail.com, ip: 209.85.166.177, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-42521ca36d6so2778555ab.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 23:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758781282; x=1759386082; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MG5+R5qiLAOnQ+jPPqdc9tL3IrYFtKD9rg0U9PFVAnU=;
        b=GH3RxyeorHfk9aoqOpzbQxYl2E03hlcBFXXMrYZ8UgAWWN+s8zjy7Z5BE6NsYOh8ut
         zcrV23gIQcz+5jfut9duQwjmIst67oC1ijP4zdqmuzMqQnaCVUtb7jHw/cQ46ao9KO62
         SHtVP6yMnD8KF9GIIzJf4IgXy0Jo6meOGJUgO57BegX82MByLDKuNfryZdJrd/X9bkNX
         2x/eLmm7jbxOounvkJBg5+kbvZlHs0uhLo6+AdEtL9NcnckPj14LbAVYIzWxSq1tMaV/
         ZVqec85UfQrEZi7bd9vsjtjwIgUdM76dETzlgvNlsvtuaQy6Uhvsow4uxxeyNJABhXEa
         BbpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758781282; x=1759386082;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MG5+R5qiLAOnQ+jPPqdc9tL3IrYFtKD9rg0U9PFVAnU=;
        b=vm34wxY61/VkaAM2oYItiy2Llljjf8K0Al+myKATWPtKyGm+DMhVKhz1PAXNAZtx3p
         T1szaO3eCwo2YPBI32X3nmIjyLhUawa1EmOZioliiuAPY7GincomjMwEC6HnO9/8QL4J
         u64vqP9dJP95AbT3hrDaH5xw5Ft5pEXNLAs0+9HUa8E5HqxrU6GPqnB+ABVL+ejuFd+1
         phf+Cn90/kGsf7uL4y5ppRszcmhaHVHRKIzl63UTeAXHkWxwvSqmb5EZtVY1cYZys25M
         qJ5ZjNCs3knw/y7w2QoYqmTNzYlPeve+t520YOzTFooGLarY1FS6w37JGVRf08fGMxZR
         pjpA==
X-Gm-Message-State: AOJu0YzHtn46VxKlUldE1GXjyp++JNGca53GCJyTZIt0nVnNT32wzU74
	kCPKZgljOecBnXy5OdKor1JJ+H6mjeYUDIop4oL8dENXsphAjI0BgQ5qpt2GcQ==
X-Gm-Gg: ASbGncv6xIjv4KGL7ybduzYk/um00ELligPjMpiMXC4qahFuNOtQEHv4tKZdC7i89y/
	YI27kKymZShveZZ1Dt49YZfvHz4+PlgmFJuzlEa/J3aml0lLmbJ997sZGmuYjhxMlHzRijLsOrs
	oU79YHWZjNR/V6iVAMT+suZKlzU9IBOnIwEEK2jvLFcHPZpgUTFcb2Jay+VKpJvEpuWTxNkwAUD
	QbeqZU3EzsPbl4CwQYZgDanlFJfK547peHqLvP0ThvYRJPezCSWq3Cy71uvq5q4//50PRUD+sr/
	QO3JOuU2VjORjjfY/gTvbRZxnDMDKHESSLZwmHpTibFqh5heSrI7Z7KLcyiVNiK+tN7+0Ix3Tq7
	ASFXDKlzc3BoFWfezUcBcaSZF2PMGukZFRvDMh0b5KUpeei/hXx/3
X-Google-Smtp-Source: AGHT+IG7Wp6eOTeIAAESh9xhX4NMF+1OS5lVGx97mwj4AFpbZp1wZARz0OaBaq8gCXJn2gMxPQchkg==
X-Received: by 2002:a05:6e02:2701:b0:425:6f0b:a1e6 with SMTP id e9e14a558f8ab-425955fafa3mr30386275ab.13.1758781281372;
        Wed, 24 Sep 2025 23:21:21 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([147.161.216.253])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-425c016c6d8sm5560055ab.38.2025.09.24.23.21.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 23:21:20 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][walnascar][PATCH v2 0/3] cherry-picks from master branch
Date: Thu, 25 Sep 2025 18:21:08 +1200
Message-ID: <20250925062111.240262-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Sep 2025 06:21:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119849

Trying to keep recipes in the walnascar branch updated with useful fixes
from the master branch.

I intend to submit patch series for each sub-folder, this series is for
the recipes inside "meta-oe/recipes-bsp".

I have tried to carefully review the change logs and commit logs while updating
recipe versions.

Did basic validation by building against qemux86-64 and qemuarm64
machine targets.

---
changes in v2:

- Dropped following patches
 - flashrom: upgrade 1.5.1 -> 1.6.0
 - fwupd: update to 2.0.12
 - ledmon: upgrade 0.97 -> 1.1.0

Changqing Li (1):
  lsscsi: upgrade to version 0.32

Mikko Rapeli (1):
  fwupd-efi: update from 1.6 to 1.7

Wang Mingyu (1):
  bolt: upgrade 0.9.6 -> 0.9.10

 .../bolt/{bolt_0.9.6.bb => bolt_0.9.10.bb}    |  2 +-
 ..._binary.py-Use-env-to-detect-python3.patch | 23 -------------------
 .../{fwupd-efi_1.6.bb => fwupd-efi_1.7.bb}    |  5 ++--
 .../lsscsi/{lsscsi_030.bb => lsscsi_0.32.bb}  |  6 +++--
 4 files changed, 7 insertions(+), 29 deletions(-)
 rename meta-oe/recipes-bsp/bolt/{bolt_0.9.6.bb => bolt_0.9.10.bb} (92%)
 delete mode 100644 meta-oe/recipes-bsp/fwupd/fwupd-efi/0001-efi-generate_binary.py-Use-env-to-detect-python3.patch
 rename meta-oe/recipes-bsp/fwupd/{fwupd-efi_1.6.bb => fwupd-efi_1.7.bb} (90%)
 rename meta-oe/recipes-bsp/lsscsi/{lsscsi_030.bb => lsscsi_0.32.bb} (63%)


