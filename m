Return-Path: <salman.isd@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6866C433FE
	for <webhook@archiver.kernel.org>; Mon, 25 Oct 2021 11:45:48 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web12.30967.1635162347798425799
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Oct 2021 04:45:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JGGYDhHm;
 spf=pass (domain: gmail.com, ip: 209.85.208.41,
 mailfrom: salman.isd@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id n1so15344581edd.0
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Oct 2021 04:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WIhwkGMcSAQ83pmhLqQdFQwtJUHoqnPEHAU/69LA5xU=;
        b=JGGYDhHmw2lQ4YidZ4JGpfM7b/tQLzxDzxBCSKRP5/nBMkgPVhs4aQY5PFe6c5kQ1n
         1jWE+fRs8+9lHX1Rbu1SFjfaSJYwE5zisv5ocPMNTFml60D+aZjfp9Uh3jpq3SN5tuDr
         HrK4/caPRmaCJPieSoIHCJ3Wy1KW2max5maRKvNoV8QyyVzzsAKIrfkln+I4GWW/BT2t
         ZDLDFYVKMawidL0L2HUSFRGrmU3c5EEoLpjp2YZPYKZFNpvGr8bqeJDeiJtdcPmeDlii
         YB/G8n1ryxhiLEKGVTd9wT2krCSEXZRl8ernMcC3fQ69T9J6lnLa1XGO+YerHMW9QWKZ
         Uwiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WIhwkGMcSAQ83pmhLqQdFQwtJUHoqnPEHAU/69LA5xU=;
        b=R2TXiwsPx5Au09DEqAruXpvf9XuIQCS+76ZNLVLUjLZMyv5ZfbdQ3Y7Oj4NVAL0ZHH
         +Ciz1RsWAUxYfF3Ie5CD0sxxlZtDlA1+rSeBmbHYVmvESfEYtt9zfg5sFhxhok1r9D5e
         m0BBj1Z3eueYNXMvrwc8eJqzYyuogR+aX8toe4MPvLrB48xYFHO02Xo8B/GtTaJQzA3B
         HRvWDBA4Pj5ezHhWUkpV1BLf4Qw6eRV9wgetxYBDfdspmCfpvP6RWWRxmTgbwRHYvuSP
         aJKlhZPkGxcYoYoL2sWsVVd6yLLbJuIZEtL2RSpD39maMu9Uz9w3DtpunmQwGfOgGzsA
         0jkg==
X-Gm-Message-State: AOAM530HkyH6kXaniZPMxttVfQ2LRwTBCWDJdU1H0696A6V2epkMMI5I
	2I74cCSiEFBkXA5Ls1ZJa6lx5QK6tHU=
X-Google-Smtp-Source: 
 ABdhPJxEZXwoQnQkvDM1L+dWQcf3d6U/43NaZAKPzgVEaSeyBqv2E8KtkOYZcrUJ1Z99ZFj5+wJkaw==
X-Received: by 2002:a05:6402:5189:: with SMTP id
 q9mr25486467edd.94.1635162345562;
        Mon, 25 Oct 2021 04:45:45 -0700 (PDT)
Received: from salman-VirtualBox.home044weidmueller.com
 (ip-37-201-145-145.hsi13.unitymediagroup.de. [37.201.145.145])
        by smtp.gmail.com with ESMTPSA id
 v15sm8727929edi.89.2021.10.25.04.45.45
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Oct 2021 04:45:45 -0700 (PDT)
From: Salman Ahmed <salman.isd@gmail.com>
X-Google-Original-From: Salman Ahmed <salman.ahmed@weidmueller.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe] [PATCH 0/1] openldap: upgrade 2.4.58 -> 2.5.8
Date: Mon, 25 Oct 2021 13:45:41 +0200
Message-Id: <cover.1635161379.git.salman.ahmed@weidmueller.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Oct 2021 11:45:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93561

 openldap: upgrade 2.4.58 -> 2.5.8

- dropped retired backends (bdb, hdb, shell)
- back-monitor is now built as part of slapd
- added asyncmeta and wt backends
- dropped patches for functionalities which don't
  exist anymore

The following changes since commit 763769eb446acf8377bc2d84c76cd7fffd904f84:

  vboxguestdrivers: Fix build failure due to the last update. (2021-10-22 16:31:41 -0700)

are available in the Git repository at:

  git://github.com/salmanisd/meta-openembedded upgrade-openldap
  https://github.com/salmanisd/meta-openembedded/tree/upgrade-openldap

Salman Ahmed (1):
  openldap: upgrade 2.4.58 -> 2.5.8

 .../openldap/openldap/install-strip.patch     |  2 +-
 .../openldap-2.4.28-gnutls-gcrypt.patch       | 10 ++-
 .../openldap/openldap-CVE-2015-3276.patch     | 58 ----------------
 .../openldap/openldap-m4-pthread.patch        | 22 ------
 .../openldap/openldap/thread_stub.patch       | 20 ------
 .../openldap/openldap/use-urandom.patch       | 15 ++--
 .../{openldap_2.4.58.bb => openldap_2.5.8.bb} | 68 +++++++------------
 7 files changed, 37 insertions(+), 158 deletions(-)
 delete mode 100644 meta-oe/recipes-support/openldap/openldap/openldap-CVE-2015-3276.patch
 delete mode 100644 meta-oe/recipes-support/openldap/openldap/openldap-m4-pthread.patch
 delete mode 100644 meta-oe/recipes-support/openldap/openldap/thread_stub.patch
 rename meta-oe/recipes-support/openldap/{openldap_2.4.58.bb => openldap_2.5.8.bb} (82%)

-- 
2.32.0


