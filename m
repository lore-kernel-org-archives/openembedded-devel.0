Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.12330.1619098415619431276
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Apr 2021 06:33:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=p/rsEyk6;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id v13so9945695ple.9
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 Apr 2021 06:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id;
        bh=UR4nT5RVlZBI1jHd2vWaELeFb868BiAwou6x1IgLCdI=;
        b=p/rsEyk6nrauUwRjyic4ty85PndHx5zsf1Kirqj24PXrG2N4DRU+lD/UtRmaOQ2mTI
         Mr8Ur7Sfr3FCGUrGsNZTHEPiDoGfwFZqJLKpfT6DaIcwzITXP6qELQibbTl38bxdPYvR
         GHHqGp2ECFWsKW1MyHLVMQy27XTUyqZg5J3/3M2DGy4/cbv+jVT06oT3lz9hOugl0RSn
         k0YtUgdrznlkN6LlZf6JI2+khAdmykPH3xRgMmoQE5t8x1KPcm3sPkrHQ5RBRBk9Ak0B
         elxaygtS3owem9D48c5JQXDHB/cFeEWCYRq3vtKE6NDotreVvfQnE10kWwmTyoRVVnAf
         k93Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=UR4nT5RVlZBI1jHd2vWaELeFb868BiAwou6x1IgLCdI=;
        b=lpgJjqi0NELW3oIHQr8urGkW6dBvo6nEMOcSU8ZGK74iPV20nViJuLcfPBBchEqkr8
         DC2aTQ/oXr4Mu+1P58WmAUtXUf1Kyfl1jcJBwDwusA5TCxoYX8BVIl6xf5az5BQwMyQM
         CQpByb9w4Llb3BFlDLpolnReUhozFTfmstA3bDaG9gZ810xvSpoxvVeGtiIFYp5tmaVm
         KUysSWAo3p4H3qgtAdTWDAOyvXvx12OCX9pZL3eh3dkXU9XEyYySq1G2GLClGDHMsisB
         tZ7Hr2anoQ/jtLKvV36iws6qGLtTUQ2owAsMmz/WcloaH1UP1+grwIe3iprXWrCCHykK
         pWPQ==
X-Gm-Message-State: AOAM5327IW45jD/unm2meoNALvRnVe9k3rRg+S8cXhstlNGi6WTw9cpA
	DfUYoeNv03RcQ1Ih7ig++z10t+/Mymu77Q==
X-Google-Smtp-Source: ABdhPJxl89M2CZmiIjhzpTrFSR1ve4bH1RhI3hDJe+9lHh3ol4e4sGHv8pE4GROOb3WpO4wQ9E+3ZQ==
X-Received: by 2002:a17:90b:e8e:: with SMTP id fv14mr51460pjb.5.1619098414499;
        Thu, 22 Apr 2021 06:33:34 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:e183:e120:a0a1:83e4])
        by smtp.gmail.com with ESMTPSA id gd1sm2376182pjb.49.2021.04.22.06.33.33
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Apr 2021 06:33:33 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [gatesgarth 0/4] Patch review April 22
Date: Thu, 22 Apr 2021 06:33:16 -0700
Message-Id: <cover.1619098298.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1

Next patch review for Gatesgarth. 
Please have feedback by Fariday

The following changes since commit c9815c86bfd63b2d9479915045197e7d315ef709:

  telepathy-glib: respect GI_DATA_ENABLED when enabling vala-bindings (2021-04-10 07:37:44 -0700)

are available in the Git repository at:

  git://git.openembedded.org/meta-openembedded-contrib stable/gatesgarth-nut
  http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=stable/gatesgarth-nut

Hermes Zhang (1):
  gpsd: backport d-bus message time patch from upstream

Khem Raj (1):
  mariadb: Fix build on musl/ppc

Stefan Ghinea (1):
  hostapd: fix CVE-2021-30004

wangmy (1):
  mariadb: upgrade 10.5.8 -> 10.5.9

 .../hostapd/hostapd/CVE-2021-30004.patch      | 123 ++++++++++++++++++
 .../hostapd/hostapd_2.9.bb                    |   1 +
 ...ive_10.5.8.bb => mariadb-native_10.5.9.bb} |   0
 meta-oe/recipes-dbs/mysql/mariadb.inc         |   5 +-
 ...ktrace-t.c-make-the-test-conditional.patch |  38 ------
 .../mysql/mariadb/c11_atomics.patch           |  16 +--
 .../mysql/mariadb/ppc-remove-glibc-dep.patch  |  50 +++++++
 .../{mariadb_10.5.8.bb => mariadb_10.5.9.bb}  |   0
 ...port.c-Fix-broken-d-bus-message-time.patch |  36 +++++
 meta-oe/recipes-navigation/gpsd/gpsd_3.20.bb  |   1 +
 10 files changed, 222 insertions(+), 48 deletions(-)
 create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2021-30004.patch
 rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.5.8.bb => mariadb-native_10.5.9.bb} (100%)
 delete mode 100644 meta-oe/recipes-dbs/mysql/mariadb/0001-stacktrace-t.c-make-the-test-conditional.patch
 create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/ppc-remove-glibc-dep.patch
 rename meta-oe/recipes-dbs/mysql/{mariadb_10.5.8.bb => mariadb_10.5.9.bb} (100%)
 create mode 100644 meta-oe/recipes-navigation/gpsd/gpsd/0001-gpsd-dbusexport.c-Fix-broken-d-bus-message-time.patch

-- 
2.17.1

