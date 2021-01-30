Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web12.8534.1612035467293334114
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Jan 2021 11:37:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UBLIIdmY;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id j2so7511752pgl.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 30 Jan 2021 11:37:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eQGqY/hjOcVpeKHtt0cNeTL82KcK5dkPV11Ats99KfM=;
        b=UBLIIdmY42AIaYBLNohbCG+1IAtzSFbeynAIX+HhIbsmrLIQsX9VwAL2ws+BpYEv1W
         V9Sc1y0jDHzVvtN2y31PRWtNv50W6Ylq/abPyK7vbQdTu18cyfGlk+eggiAiYalwBWEK
         pBekZ4fDu+eV7AsyEX5LJPhFWQjqE7HXCzWwqkSSZiQEWPZFW1glD0hliXcG00W5bHy0
         6xYFeNIxoXAkuimOhXfL/LPIrDhARS/7dcDHrRJwBLjqju+f4uAUSB1+305MgAhlXIe2
         +DgTZ68FYjku7YHSSqp9wfdq69YQBQkrli+R9MhtWZGx1i6FremKljGtgbsHM8bxxh0W
         NXng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eQGqY/hjOcVpeKHtt0cNeTL82KcK5dkPV11Ats99KfM=;
        b=Fi38K++JyO5Fz94+Myx1Bna8lzJzasoKtfW+JGLpph949VvGB4WcShDB4iE6tQkPT7
         CYmPk6t941DONFXwtnDEa7WizpGuXrlOnkH2RenhKhfOc0Wta4Mi40V8HjGRGVA3AYPV
         QZ0yyCEdsOH+jTYp9DGKAJoS8pUduYA/vlqRWbtxOjIqJSDEVFxRH/C4GhEyoSXV4rJt
         gwbO56OxF6PL4L+j6IJMWbl2pIxvd9+VzPHxIC9KayRoRi9cLbeb1XH4EVT0pPMKOVBh
         z8WQL5xvElRr0CE3YPah3Y6MFqj9wRdFa+g+7GZRIHANv2z4hkPeSm+L7bG9+nQM5E5C
         i9ww==
X-Gm-Message-State: AOAM533HeYpw+hjsWTcRL5M8/YvSNyIte3WnPVqLNEjjaMSyyRcyOfFt
	nEn50yan2W/HCiJ0nLDKf6r2oq0cNmrTOA==
X-Google-Smtp-Source: ABdhPJxehPT3g6T/6UP0I0CkVEfG0yCYjL/gEUEsgkhDvp1Du983SzBSdDDQe7Czboki77XDe3lYVw==
X-Received: by 2002:a63:405:: with SMTP id 5mr9960097pge.44.1612035466475;
        Sat, 30 Jan 2021 11:37:46 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:315d:c5e7:1295:54a9])
        by smtp.gmail.com with ESMTPSA id q197sm12518096pfc.155.2021.01.30.11.37.45
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Jan 2021 11:37:46 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 00/13] Patch review Jan 30
Date: Sat, 30 Jan 2021 11:37:25 -0800
Message-Id: <cover.1612035229.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Here are the next block of changes for dunfell.
Please have comments back my Tues

Yes, this is out-of-sync with Gatesgath but I am seeing build issues there and did not want to hold up this review cycle.

Clean world build

The following changes since commit 5bba79488b7d393d2258d6e917f7bf7b0d7c4073:

  gupnp: Upgrade to 1.2.2 -> 1.2.4 (2021-01-18 08:40:15 -0800)

are available in the Git repository at:

  git://git.openembedded.org/meta-openembedded-contrib stable/dunfell-nut
  http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=stable/dunfell-nut

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

Søren Andersen (1):
  zram: fix sourcing of zram parameters

zangrc (1):
  iscsi-initiator-utils: upgrade 2.1.2 -> 2.1.3

 .../0001-Makefile-Do-not-set-Werror.patch     | 31 +++++++++++++++++++
 ....1.0.bb => iscsi-initiator-utils_2.1.3.bb} |  9 ++----
 .../networkd-dispatcher_2.0.1.bb              |  7 +++--
 meta-oe/recipes-dbs/mysql/mariadb.inc         |  8 +++--
 .../flatbuffers/flatbuffers_1.12.0.bb         |  3 ++
 .../giflib/files/CVE-2019-15133.patch         | 23 ++++++++++++++
 .../recipes-devtools/giflib/giflib_5.1.4.bb   |  7 ++++-
 .../rapidjson/rapidjson_git.bb                |  5 ++-
 meta-oe/recipes-devtools/sip/sip3_4.19.19.bb  | 11 -------
 .../sip/{sip.inc => sip3_4.19.23.bb}          | 17 ++++++++--
 .../recipes-extended/zram/zram/zram-swap-init |  2 +-
 .../recipes-graphics/xorg-app/xterm_353.bb    | 16 ++++++++--
 12 files changed, 107 insertions(+), 32 deletions(-)
 create mode 100644 meta-networking/recipes-daemons/iscsi-initiator-utils/files/0001-Makefile-Do-not-set-Werror.patch
 rename meta-networking/recipes-daemons/iscsi-initiator-utils/{iscsi-initiator-utils_2.1.0.bb => iscsi-initiator-utils_2.1.3.bb} (96%)
 create mode 100644 meta-oe/recipes-devtools/giflib/files/CVE-2019-15133.patch
 delete mode 100644 meta-oe/recipes-devtools/sip/sip3_4.19.19.bb
 rename meta-oe/recipes-devtools/sip/{sip.inc => sip3_4.19.23.bb} (79%)

-- 
2.17.1

