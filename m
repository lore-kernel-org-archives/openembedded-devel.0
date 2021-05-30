Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web11.34933.1622399674572619491
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 May 2021 11:34:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jOtRldpM;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id 29so6661137pgu.11
        for <openembedded-devel@lists.openembedded.org>; Sun, 30 May 2021 11:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id;
        bh=58/vJGclvHgileFmE19ELccr451dLb3QBy8b4PdojrI=;
        b=jOtRldpM4wS1wHWMquIS+Qhwmtu8pOT9s1PZt9X8JsjHI4Nb+Q1fch4nRqQ2xkhic5
         aOf1EHvfw8EznjqhlUsPlo1p9uL0QqhVVcFkyiWvhrHbe10z1b9SpMjlE7snKQFR4Sel
         /wGKCZ/C9W0Zzeq3UmkOgnjFODe5aRR8TxjSqJ1u16ptdv6yJlRHXV9OA5wqZTFw3KPZ
         o96o2KrfS8Z32ODHe9ba8FZrNIb3h7giE8lyYeQivVi0Hed+YPBHAw7crt4MhdVkB4Gt
         9eMg6aJXUNmK0ESvZd8oVmJJlx1YomsVlWhkiX7xwZ6SCqT2KUmG0mRCQfbion2sERxh
         GinQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=58/vJGclvHgileFmE19ELccr451dLb3QBy8b4PdojrI=;
        b=cC9yhKH5qn63+uB1HQ4zVstQIsXOs+UCh11uAwuo7Hmo7afVOdlUIYRpsglVG63U3w
         gYZXYIR5gjWmL2v2GOb781ZE+rzEvq1covm5RHrZzEHI3SGZbRvi3ZVBUgOY3X6MWYAr
         6/RK0q0FOgNJmoZUL+rhzpuSFNPxkoxxSV1fhMItSNSI4CeCB8NDCVbfY+MTIoYbx1YD
         gKUO0aQzwuMk/v/tXkOdAG3Zrkk5R/hIYy2bK2r+Z2JCIb0PooshXSUy2D7yXCtkejsE
         9M7qEHkmM2Giz2MQlLLgW7bxe8rmML92YJRJX6V6YUkTtFNzBkfrNIDR19XECK10vsd1
         4RrQ==
X-Gm-Message-State: AOAM5310auhyFFyS4VvKBbGmV1EIoV0MxgHmAO2VSA35Bs0MrOmjylG1
	lDd/6obmwpAaNOXnITdGv5pcdmKQuEamoA==
X-Google-Smtp-Source: ABdhPJzwfrZx2OPUQtJQZORepAqqsID4f7spuq8RqgR5UxnwhFnanWKoOltDLCab9s8aWMgWRUMvLA==
X-Received: by 2002:aa7:9f8f:0:b029:2dc:76bc:edce with SMTP id z15-20020aa79f8f0000b02902dc76bcedcemr13460778pfr.29.1622399673679;
        Sun, 30 May 2021 11:34:33 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:417e:d6cd:22c6:4534])
        by smtp.gmail.com with ESMTPSA id z19sm8828696pjq.11.2021.05.30.11.34.33
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 May 2021 11:34:33 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 00/12] Patch review May 30th
Date: Sun, 30 May 2021 11:34:10 -0700
Message-Id: <cover.1622399528.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1

Please have comments back by Monday. Some have already been posted on the ML.

The following changes since commit 11eae114522a6befa06c7f4021a83bc016133543:

  linuxptp: Fix cross build (2021-05-14 10:03:51 -0700)

are available in the Git repository at:

  git://git.openembedded.org/meta-openembedded-contrib stable/dunfell-nut
  http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=stable/dunfell-nut

Alexander Vickberg (1):
  hostapd: fix building with CONFIG_TLS=internal

Mikko Rapeli (1):
  ebtables: use bitbake optimization levels

Sana Kazi (1):
  dnsmasq: Add fixes for CVEs reported for dnsmasq

akash.hadke (1):
  opencv: Add fix for CVE-2019-5063 and CVE-2019-5064

wangmy (8):
  exiv2: Fix CVE-2021-29457
  exiv2: Fix CVE-2021-29458
  exiv2: Fix CVE-2021-29463
  exiv2: Fix CVE-2021-3482
  exiv2: Fix CVE-2021-29464
  exiv2: Fix CVE-2021-29470
  exiv2: Fix CVE-2021-29473
  libsdl: Fix CVE-2019-13616

 .../ebtables_optimizations.patch              |  19 +
 .../ebtables/ebtables_2.0.10-4.bb             |   1 +
 .../recipes-support/dnsmasq/dnsmasq_2.81.bb   |   7 +-
 .../dnsmasq/files/CVE-2020-25681.patch        | 370 +++++++++++
 .../dnsmasq/files/CVE-2020-25684.patch        |  98 +++
 .../dnsmasq/files/CVE-2020-25685-1.patch      | 587 ++++++++++++++++++
 .../dnsmasq/files/CVE-2020-25685-2.patch      | 175 ++++++
 .../dnsmasq/files/CVE-2020-25686-1.patch      | 332 ++++++++++
 .../dnsmasq/files/CVE-2020-25686-2.patch      |  63 ++
 ...001-Prepare-for-CVE-2021-30004.patch.patch |  45 ++
 .../hostapd/hostapd_2.9.bb                    |   1 +
 .../libsdl/libsdl-1.2.15/CVE-2019-13616.patch |  27 +
 .../recipes-graphics/libsdl/libsdl_1.2.15.bb  |   1 +
 .../exiv2/exiv2/CVE-2021-29457.patch          |  26 +
 .../exiv2/exiv2/CVE-2021-29458.patch          |  37 ++
 .../exiv2/exiv2/CVE-2021-29463.patch          | 120 ++++
 .../exiv2/exiv2/CVE-2021-29464.patch          |  72 +++
 .../exiv2/exiv2/CVE-2021-29470.patch          |  32 +
 .../exiv2/exiv2/CVE-2021-29473.patch          |  21 +
 .../exiv2/exiv2/CVE-2021-3482.patch           |  54 ++
 meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb |   9 +-
 .../opencv/CVE-2019-5063_and_2019-5064.patch  |  78 +++
 .../recipes-support/opencv/opencv_4.1.0.bb    |   1 +
 23 files changed, 2174 insertions(+), 2 deletions(-)
 create mode 100644 meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/ebtables_optimizations.patch
 create mode 100644 meta-networking/recipes-support/dnsmasq/files/CVE-2020-25681.patch
 create mode 100644 meta-networking/recipes-support/dnsmasq/files/CVE-2020-25684.patch
 create mode 100644 meta-networking/recipes-support/dnsmasq/files/CVE-2020-25685-1.patch
 create mode 100644 meta-networking/recipes-support/dnsmasq/files/CVE-2020-25685-2.patch
 create mode 100644 meta-networking/recipes-support/dnsmasq/files/CVE-2020-25686-1.patch
 create mode 100644 meta-networking/recipes-support/dnsmasq/files/CVE-2020-25686-2.patch
 create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/0001-Prepare-for-CVE-2021-30004.patch.patch
 create mode 100644 meta-oe/recipes-graphics/libsdl/libsdl-1.2.15/CVE-2019-13616.patch
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29457.patch
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29458.patch
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29463.patch
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29464.patch
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29470.patch
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29473.patch
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-3482.patch
 create mode 100644 meta-oe/recipes-support/opencv/opencv/CVE-2019-5063_and_2019-5064.patch

-- 
2.17.1

