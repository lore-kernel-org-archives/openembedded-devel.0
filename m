Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D652CCD18E
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 23:32:58 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web11.3553.1760484769750168631
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 16:32:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KHJ4mn39;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b554bb615dcso4105998a12.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 16:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760484769; x=1761089569; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JHM9cMW3ce/T3BRbJysEua4aqAOiumIl9tXAq3VHpfg=;
        b=KHJ4mn39Y+c6ZDnenssCESADnvENjmFW6m4b8J6TI0cS+Xdk901flFI6qYwUsXa1VT
         exUB/wyY+YuGipn0r+tPwDLVq9NxId6IrT65s9GN3yJpyUz2WlHlQWZ7gizBRHKOrwvp
         ml8gSihfGlTj+rf5schqcptC9QKEDr5Za+EhCMAzutskZx5l+y0pTVUisQ7xMufkGEZf
         LZsSUH5RW9h4/ljooFsRPvOH07mtcO3dcOcTXSwNjwctSR2BnRDOEmzm372fwykjHO4I
         DhQR0mg63tdOdOXAqQkumG0D40H8JClH2JBG+msAdBrtdzWbrjGM2zwedSEUX0kkc66f
         MPEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760484769; x=1761089569;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JHM9cMW3ce/T3BRbJysEua4aqAOiumIl9tXAq3VHpfg=;
        b=OP2EKvlog8XaoNYyn0j5lbOjc5RkrBrXwiUCAwDMUSet7peMvs9mifflKrLDnoN+eZ
         7jmAxfnLeKfHD68ZJtlpxCTcKnTp8ltxs4o/xYzUDHYxQ37Vp6QNlKoda/3kEuymebMN
         SSrnyPlcx3B3O60vyM/+PZRA/UEKzE7sd+ZpZdTUbtueKfl8PllAJrR+mbbMqzqGbMso
         fLSytSyIrBlNW9cIAqZPhNCK/TsIL2GNKIerdmretuxGWmVfwK6eNA+6nGDMV7WxblTy
         LyIBneG9fX1ZfaBMJDjOyz/IJuCrInuKaQbrJILCszRhTnF5EQqeOUSclXjpiDyUCJpV
         DcfQ==
X-Gm-Message-State: AOJu0Yx/snMOzc7WLkCT7NVagMndkZuzqNA4h80hcxquDNsGgKMm57x2
	b4qlPUL4L8XA5DcuoVlrYo7Dn+zG9nTRYOPbosJJXMI3sq+CqdLIuTDXTq2UpQ==
X-Gm-Gg: ASbGncvYF7RCePOW2udOgmol2JSeF8uBMWqDCHBGvYeEsOdT3/ZM5wujKK2Un3G1kkG
	WtVD6uw5XN80y3md1XFujfDBXjHEC/yZmyFH6WHhnbI0trf0mrSb5Wv/jK7yrFCALQDyqvq6ClI
	Kjt5h248dFXRsFZK6HIRqygkidMiVIwPfxxwC50v1Kcqluy1UkGAZN+Z4HLkwm42BAgZUxfMdtb
	F9XZYJ0YB0CzObxGIP6GOWcgxhg5ROknhTel3o7pIIcGxwTP7JoGWJQBA5ZohOeRaAD0fwBSEXu
	xbg83pneT2sbt7XBqoLZRBjwdu3LM2pidIWjjaUw8jbCqAWxpEYFpjZzKMJT3ezNxepeHCjD3KH
	7ezytDfh1sehQF4Ps3Jzrovu3EbeVl5kKoE8OSrraGbHZCGl9MgW055MP/ApV9gmsag==
X-Google-Smtp-Source: AGHT+IHXXMh0yj2CMqw8sIN0PGIT8F6t3/XBtWbk1qGz2qVosaiFhgksH/McjDfSgRQxiajk+MmKuQ==
X-Received: by 2002:a17:902:d54c:b0:270:e595:a440 with SMTP id d9443c01a7336-290272cf91cmr322104935ad.25.1760484768890;
        Tue, 14 Oct 2025 16:32:48 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b61aac5besm17033254a91.14.2025.10.14.16.32.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 16:32:48 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH v2 v2 00/18] patch CVE
Date: Wed, 15 Oct 2025 12:32:11 +1300
Message-ID: <20251014233233.304125-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 23:32:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120659

changes in v2:
- fixed UNPACKDIR usage in influxdb
- removed jasper v4.1.1

Ankur Tyagi (11):
  libppd: patch CVE-2024-47175
  hdf5: patch CVE-2025-2923
  hdf5: patch CVE-2025-2924
  hdf5: patch CVE-2025-2925
  hdf5: patch CVE-2025-6269
  libcupsfilters: patch CVE-2024-47076
  libraw: patch CVE-2025-43961 CVE-2025-43962
  libraw: patch CVE-2025-43963
  libraw: patch CVE-2025-43964
  zlog: fix CVE-2024-22857
  jasper: upgrade to 4.1.2 release

Gyorgy Sarvari (3):
  exiv2: patch CVE-2025-26623
  exiv2: patch CVE-2025-54080
  exiv2: patch CVE-2025-55304

Khem Raj (1):
  influxdb: Do not remove non-existing files

Ninette Adhikari (1):
  influxdb: Update CVE status for CVE-2019-10329

Peter Marko (2):
  dash: set CVE_PRODUCT
  gattlib: mark CVE-2019-6498 as fixed

 .../gattlib/gattlib_git.bb                    |   2 +
 .../recipes-dbs/influxdb/influxdb_1.8.10.bb   |   9 +-
 ...E-2024-22857-buffer-overflow-patched.patch |  31 +
 meta-oe/recipes-extended/zlog/zlog_1.2.16.bb  |   4 +-
 .../{jasper_4.1.1.bb => jasper_4.1.2.bb}      |   3 +-
 .../libcupsfilters/0001-CVE-2024-47076.patch  |  38 ++
 .../cups/libcupsfilters_2.0.0.bb              |   1 +
 .../cups/libppd/0001-CVE-2024-47175.patch     | 600 ++++++++++++++++++
 meta-oe/recipes-printing/cups/libppd_2.0.0.bb |   5 +-
 meta-oe/recipes-shells/dash/dash_0.5.12.bb    |   2 +
 ...ppendIccProfile-to-fix-quadratic-per.patch |  96 +++
 .../exiv2/exiv2/0001-CVE-2025-54080-fix.patch |  77 +++
 .../0001-Revert-fix-copy-constructors.patch   |  82 +++
 meta-oe/recipes-support/exiv2/exiv2_0.28.3.bb |   6 +-
 .../hdf5/files/0001-CVE-2025-2923.patch       |  67 ++
 .../hdf5/files/0002-CVE-2025-2924.patch       |  39 ++
 .../hdf5/files/0003-CVE-2025-2925.patch       |  53 ++
 .../0004-CVE-2025-6269-OSV-2023-77.patch      | 294 +++++++++
 meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb |   4 +
 .../0001-CVE-2025-43961-CVE-2025-43962.patch  | 108 ++++
 .../libraw/libraw/0002-CVE-2025-43963.patch   |  40 ++
 .../libraw/libraw/0003-CVE-2025-43964.patch   |  29 +
 .../recipes-support/libraw/libraw_0.21.2.bb   |   7 +-
 23 files changed, 1589 insertions(+), 8 deletions(-)
 create mode 100644 meta-oe/recipes-extended/zlog/zlog/0001-CVE-2024-22857-buffer-overflow-patched.patch
 rename meta-oe/recipes-graphics/jasper/{jasper_4.1.1.bb => jasper_4.1.2.bb} (89%)
 create mode 100644 meta-oe/recipes-printing/cups/libcupsfilters/0001-CVE-2024-47076.patch
 create mode 100644 meta-oe/recipes-printing/cups/libppd/0001-CVE-2024-47175.patch
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/0001-Add-new-method-appendIccProfile-to-fix-quadratic-per.patch
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/0001-CVE-2025-54080-fix.patch
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/0001-Revert-fix-copy-constructors.patch
 create mode 100644 meta-oe/recipes-support/hdf5/files/0001-CVE-2025-2923.patch
 create mode 100644 meta-oe/recipes-support/hdf5/files/0002-CVE-2025-2924.patch
 create mode 100644 meta-oe/recipes-support/hdf5/files/0003-CVE-2025-2925.patch
 create mode 100644 meta-oe/recipes-support/hdf5/files/0004-CVE-2025-6269-OSV-2023-77.patch
 create mode 100644 meta-oe/recipes-support/libraw/libraw/0001-CVE-2025-43961-CVE-2025-43962.patch
 create mode 100644 meta-oe/recipes-support/libraw/libraw/0002-CVE-2025-43963.patch
 create mode 100644 meta-oe/recipes-support/libraw/libraw/0003-CVE-2025-43964.patch


