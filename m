Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38B26C433FE
	for <webhook@archiver.kernel.org>; Sun, 15 May 2022 13:49:40 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web12.16969.1652622567405578998
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 May 2022 06:49:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OnUeEG9s;
 spf=pass (domain: gmail.com, ip: 209.85.215.177,
 mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id 31so11769191pgp.8
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 May 2022 06:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MJ4+wdWvVvdwsGsmNReB4qkahYxfMVtQ6Ft3+atdKK8=;
        b=OnUeEG9s50IYNpZGbzu3HFDMUs10GaUIbnKyO7iynKpahug/NErl0xBe35HnNehbki
         xLY8uHzsVCk3wjn+sOR043WNIOzwPt2/6nNaWmf11bBCogrpXxb37Uny2eo4pqawwy5n
         UZZ6t1A0/Z6WBRAEjXTzwRl4xbkOcFPpayBRVb+v1VS7CYnOnlPUZGYXzhSSx0RRMAWm
         sNuZUSgSSWNEEwknvessbg/OPo7wH0Xwsw3jL4eHFLEuA8NHlgH4zt0pe+yk9V/bNlHc
         C9oweA7yTWdvokA8+q80k7gPKW6gpg8t7exe4ErSdUHSvlDoypwI7/QntyTBxn3JeZpN
         eGyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MJ4+wdWvVvdwsGsmNReB4qkahYxfMVtQ6Ft3+atdKK8=;
        b=qn2V8EVnd7RuHpAktysjlb2aCWyF+2rASSu+Ft4Rw2Dpleq8CeD6Wvs4uRwvveJaZ0
         uMxbkz4N/VBWDclVS5i+E9kHcgj4+VvAEJgshWDYiwXD77SUMrbVPDC/yPv1QQoQVlH+
         3YgyhRiortnlTMz+tf8LhPek6f943hC9Re2Esz7DEZIfb23oI9hMu5+rha2gsNJU9xmI
         tAJkOoaDOshwfKOOUkGrckjaGdHbyXc1htfYclLaYgHwS+Lw3Upva3o4JTIxpYPB23cJ
         aZ0aoWuiuN07KgCuHT4Wz1WDXq+ryDwjfLng0CLBOClJXiF2OmwTD7rib2hl/CKzcQSp
         YmMA==
X-Gm-Message-State: AOAM533Dy+CkX278lEuPsBkNGPR2UWT81odG4ix8wAR406PIZoe1agG9
	FZVoK/Tx6aYHQiz1XmSITp29M7yFES8OfQ==
X-Google-Smtp-Source: 
 ABdhPJwiFbUHCMG1yG4UNBiVv3pvkEIiPCqJLAJXNVpNTbnLZVSNxh7ISVtsd6DuOWX79+anlIMhgw==
X-Received: by 2002:a05:6a00:ad2:b0:4f1:2734:a3d9 with SMTP id
 c18-20020a056a000ad200b004f12734a3d9mr13183870pfl.61.1652622566453;
        Sun, 15 May 2022 06:49:26 -0700 (PDT)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:48be:3d3d:c26:7949])
        by smtp.gmail.com with ESMTPSA id
 z22-20020a63e556000000b003c644b2180asm4961650pgj.77.2022.05.15.06.49.25
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 May 2022 06:49:25 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone 00/22] Patch review
Date: Sun, 15 May 2022 06:49:00 -0700
Message-Id: <cover.1652622481.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 May 2022 13:49:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97097

Please have comments back by Tuesday.

The following changes since commit 3b4da37a947c6ea244061929e7c457d02f34f748:

  boinc-client: Make script install not depend on host install paths (2022-04-29 06:30:11 -0700)

are available in the Git repository at:

  git://git.openembedded.org/meta-openembedded-contrib stable/kirkstone-nut
  http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=stable/kirkstone-nut

Armin Kuster (3):
  meta-oe-image: fix build depends
  meta-python-image: Fix build depends
  meta-gnome: fix layer depends.

Bassem Boubaker (1):
  conntrack-tools: Fix missing capability

Denys Dmytriyenko (2):
  devmem2: reinstate previous patches, removed by mistake
  devmem2: add support for different page sizes

Gianfranco Costamagna (1):
  vboxguestdrivers: upgrade 6.1.32 -> 6.1.34

Jiaqing Zhao (2):
  openldap: Remove libgcrypt dependency
  openldap: Upgrade 2.5.9 -> 2.5.12

Khem Raj (7):
  ufw: Fix packaging errors found with ppc64
  libcereal: Enable for glibc/ppc
  mimic: Use special rateconv.c license
  makedumpfile: Use right TARGET for ppc32
  evince: Add dbus to depnedencies on non-x11 builds
  evolution-data-server: Do not pass --library-path to gir compiler
  python3-wxgtk4: Needs x11 for sip module

Markus Volk (1):
  minidlna: fix obsolete license warning

Michael Opdenacker (1):
  devmem2: update SRC_URI according to redirect

Mingli Yu (1):
  s-nail: Set VAL_MTA

Xu Huan (1):
  python3-astroid: upgrade 2.11.2 -> 2.11.3

Yi Zhao (2):
  frr: inherit autotools-brokensep instead of autotools
  networkmanager: fix parallel build failure

 meta-gnome/conf/layer.conf                    |  2 +-
 .../recipes-gnome/evince/evince_42.2.bb       |  2 +-
 ...e-Do-not-export-CC-into-gir-compiler.patch | 14 ++-
 .../recipes-multimedia/mimic/mimic_1.3.0.1.bb |  2 +-
 .../recipes-multimedia/minidlna/minidlna.inc  |  2 +-
 ...t-add-dependency-libnm_client_public.patch | 34 +++++++
 .../networkmanager/networkmanager_1.36.2.bb   |  1 +
 .../recipes-connectivity/ufw/ufw_0.36.1.bb    |  2 +-
 .../conntrack-tools/conntrack-tools_1.4.6.bb  |  5 +
 .../recipes-protocols/frr/frr_8.2.2.bb        |  6 +-
 meta-oe/licenses/rateconv                     | 27 ++++++
 .../packagegroups/packagegroup-meta-oe.bb     |  8 +-
 .../files/0001-make.rc-set-VAL_MTA.patch      | 48 ++++++++++
 .../recipes-extended/s-nail/s-nail_14.9.24.bb |  3 +-
 .../makedumpfile/makedumpfile_1.7.1.bb        |  6 +-
 meta-oe/recipes-support/devmem2/devmem2.bb    |  7 +-
 ...word-is-32-bit-and-add-support-for-6.patch | 70 ++++++++++++++
 ...ort-different-page-sizes-at-run-time.patch | 35 +++++++
 .../devmem2/devmem2/devmem2-fixups-2.patch    | 91 +++++++++++++++++++
 .../libcereal/libcereal_1.3.2.bb              |  6 +-
 .../openldap-2.4.28-gnutls-gcrypt.patch       | 15 ---
 .../{openldap_2.5.9.bb => openldap_2.5.12.bb} |  8 +-
 ...s_6.1.32.bb => vboxguestdrivers_6.1.34.bb} |  2 +-
 .../packagegroups/packagegroup-meta-python.bb | 10 +-
 ...id_2.11.2.bb => python3-astroid_2.11.3.bb} |  2 +-
 .../python3-wxgtk4/python3-wxgtk4_4.1.1.bb    |  2 +-
 26 files changed, 361 insertions(+), 49 deletions(-)
 create mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-libnm-client-test-add-dependency-libnm_client_public.patch
 create mode 100644 meta-oe/licenses/rateconv
 create mode 100644 meta-oe/recipes-extended/s-nail/files/0001-make.rc-set-VAL_MTA.patch
 create mode 100644 meta-oe/recipes-support/devmem2/devmem2/0001-devmem.c-ensure-word-is-32-bit-and-add-support-for-6.patch
 create mode 100644 meta-oe/recipes-support/devmem2/devmem2/0001-devmem2-support-different-page-sizes-at-run-time.patch
 create mode 100644 meta-oe/recipes-support/devmem2/devmem2/devmem2-fixups-2.patch
 delete mode 100644 meta-oe/recipes-support/openldap/openldap/openldap-2.4.28-gnutls-gcrypt.patch
 rename meta-oe/recipes-support/openldap/{openldap_2.5.9.bb => openldap_2.5.12.bb} (96%)
 rename meta-oe/recipes-support/vboxguestdrivers/{vboxguestdrivers_6.1.32.bb => vboxguestdrivers_6.1.34.bb} (97%)
 rename meta-python/recipes-devtools/python/{python3-astroid_2.11.2.bb => python3-astroid_2.11.3.bb} (89%)

-- 
2.25.1


