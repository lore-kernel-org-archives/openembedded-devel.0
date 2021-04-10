Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.5455.1618064978597863323
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 10 Apr 2021 07:29:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=twAUXgLm;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d8so4107791plh.11
        for <openembedded-devel@lists.openembedded.org>; Sat, 10 Apr 2021 07:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id;
        bh=TH0EhKU6pkjMg9kYOgfqbAG3cOd2Tk4Ogy/8AnPj5is=;
        b=twAUXgLmR81fKFb+gEvUOJ611gHtVzIfkVj4AcEh2J+RM6K/9L+fc+ZaaSCcCi3ER7
         5egWJPuBgc8Rn0VZNU9kbDoB9h/BY1tUfpjoW/NisysaiNN9fQBJv5nJa2kluxRaYkHf
         e5DDM+RPSMcwstM4V8FtgnWPkz3Z4r1gvMTF/5e0Gu9MWYLXBjgUesxnblI0dux4SMws
         5hmWY04/JKFVUQYe7iZRoEjZEe9cINp8f+nnXQKFX1VsOKK0gPXOycfTkMSBGcSy7BDu
         EfaI3NpXqxo37SWg/Poxrq1RXlMWZDeH8Pa3TIv+AzQSatCDAlN/R+vAwa+DqP4CnpYV
         4uMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=TH0EhKU6pkjMg9kYOgfqbAG3cOd2Tk4Ogy/8AnPj5is=;
        b=awQbszgRBGgcqUan2OEik3T9k0YMe/rQiQHhmxHzJ0k5uCU8MRE1p45s9pJUBt4pFQ
         docJo5melahYfEmm9bWBHqPNA21aN/m9BvbfSeKGEfzWQdObd/qvpV7veo5tIS1p+mU5
         +L1HEoRl+a1X5Okic0urpeeSu67XGkEg6u9itV35yCV9peQqo6U4y89FJvHrTnDjklQg
         T17EKoTqE0R56F1Aioo3rNPh/BfvFz8pFCW/PdWQH/o9x6qzGDgj00LSq4vvdd5QhuzT
         jtgQ1B7j6QE13QxYYL+j151ENjf2uvBiJQl36AD54FwmJNY0cHd5Nyl6VCiJGv75+QFE
         zxTQ==
X-Gm-Message-State: AOAM531kKYVQfMeNMG7f8NQ2J3Ebgca8Ojmj+Vo0xTjDYA23H57D1Sg1
	leMBM7Q+iKy+uR/RLKVqS+/1PCb1z+s=
X-Google-Smtp-Source: ABdhPJx6pBjOZnPrDey+UIadDCMVul0csmwqTOp9GHrgNChDT6vYaF15Eb04ar7pB6B87/PBjLdYKw==
X-Received: by 2002:a17:90a:5898:: with SMTP id j24mr18773293pji.110.1618064977900;
        Sat, 10 Apr 2021 07:29:37 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:8d5:10ce:6d52:dfc6])
        by smtp.gmail.com with ESMTPSA id a65sm5120183pfb.116.2021.04.10.07.29.37
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Apr 2021 07:29:37 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [gatesgarth 0/6] patch review Arpil 10th
Date: Sat, 10 Apr 2021 07:29:28 -0700
Message-Id: <cover.1618064877.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1

Please have comments back by Sunday

The following changes since commit 317c2dd540c84556127ad07739c0c930a0741b50:

  packagegroup-meta-multimedia: include projucer only with x11 in DISTRO_FEATURES (2021-04-04 12:39:22 -0700)

are available in the Git repository at:

  git://git.openembedded.org/meta-openembedded-contrib stable/gatesgarth-nut
  http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=stable/gatesgarth-nut

Kartikey Rameshbhai Parmar (1):
  fluidsynth: update SRC_URI to remove non-existing 2.1.x branch

Martin Jansa (2):
  libsmi: use /bin/sh instead of ${base_bindir}/sh to silence QA error
    with usrmerge
  libyui: switch to libyui-old repo which still has this SRCREV

Mingli Yu (2):
  hostapd: fix CVE-2019-5061
  hostapd: fix CVE-2021-0326 and CVE-2021-27803

Oleksiy Obitotskyy (1):
  libsmi: set awk as target path

 .../fluidsynth/fluidsynth.inc                 |   2 +-
 .../hostapd/hostapd/CVE-2019-5061.patch       | 854 ++++++++++++++++++
 .../hostapd/hostapd/CVE-2021-0326.patch       |  43 +
 .../hostapd/hostapd/CVE-2021-27803.patch      |  54 ++
 .../hostapd/hostapd_2.9.bb                    |   3 +
 .../recipes-graphics/libyui/libyui_3.10.0.bb  |   2 +-
 .../recipes-support/libsmi/libsmi_0.5.0.bb    |   2 +-
 7 files changed, 957 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2019-5061.patch
 create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2021-0326.patch
 create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2021-27803.patch

-- 
2.17.1

