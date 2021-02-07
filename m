Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web12.24603.1612725012543313703
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Feb 2021 11:10:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZZ/VHQd4;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id t11so5154459pgu.8
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Feb 2021 11:10:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=31d1T3Wu1KuAXS9zyxAWdkX9280LcrsqF0s0i6LAFpk=;
        b=ZZ/VHQd4+IiOFpX9eIkAa0m5TVRl/JVud+YyY05Tfg4mMLFlkCgkxQ+3UoTPqkOGW0
         ygTmTv+SQDy7zOx9ze3xd8x9VB6u7lt/EIaOsLWYEkmXuwWg6VbIkSiOObZmNzUvB9Yj
         /pKdVlVqxz/wVEsEGKfw5eedEdQBpD0gPQLI1uTNVgqGQ5uhho0e+xHIun82Bqt4xtMP
         ZVvYfSP1TRohQA4MxVcZm7dmPC11LcrUTfLUfFArWt7z5leUbZ0jXaz9STdPmyp5dTx6
         NapcsnloiuC8UfjsYeiBX2juWonqHeGNd6w0VZUCTco3YWNwEYHkzqaSdhTqlLHBE1zv
         Vqeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=31d1T3Wu1KuAXS9zyxAWdkX9280LcrsqF0s0i6LAFpk=;
        b=YakO6LiE7X329kxr20PrtOso1BeeU46c32ChlXSnuY3FerPL4mZG12tQnVTMRh+5mt
         veJwjvjR+5a8ItQ1nHAkLPJhYZG7gGxuFFdw4bPs44mBKu2HGZ0vEXaHX/IOzIfu+VnW
         6oGlwi7k8i3zMLOBZpfqvX7qv0y6ISC+gpgsiFlHQ8So2D1NALGZ1oMmBG1DkgSE765k
         Bq/NgquHC2mySFY+f+RNnMWUI7WoO+WKvcdqrlJWovBHJsVPmthWmqIao2N/rVKsabCs
         CN0Z9lvXIlV9lGv2j8MKqW0hvnv4gvpTxzjCmWSfl4XT5ZQZVibZc6O+8fsXuKgVkKal
         Yowg==
X-Gm-Message-State: AOAM532Ta1xhw2qkenv8yr4kO3tkMbg6il6hD3Im6yNEZPWEx2daRq/D
	/p16z+9FYeY876GNizZBLc91mMRJv9QIgA==
X-Google-Smtp-Source: ABdhPJz/9SRSFWmTMrVlWA1zb3eI+hfBKnjnmDzy8j9bZMhUzcYb11Y32lLyfERxdmP8Awi12khc1Q==
X-Received: by 2002:aa7:8f13:0:b029:1bd:f965:66d8 with SMTP id x19-20020aa78f130000b02901bdf96566d8mr13971534pfr.80.1612725011730;
        Sun, 07 Feb 2021 11:10:11 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:1d07:684d:b210:7d14])
        by smtp.gmail.com with ESMTPSA id 123sm16371911pfd.91.2021.02.07.11.10.10
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Feb 2021 11:10:11 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [gatesgarth 00/10] Patch review Feb 7
Date: Sun,  7 Feb 2021 11:09:58 -0800
Message-Id: <cover.1612724878.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Next Gatesgarth series.
Please have comments/feedback by Wednesday.

The following changes since commit 6ff4bd4f345b4e8030b9197d13097308df521576:

  postgresql: Update to 12.5 (2021-01-18 08:20:58 -0800)

are available in the Git repository at:

  git://git.openembedded.org/meta-openembedded-contrib stable/gatesgarth-nut
  http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=stable/gatesgarth-nut

Anatol Belski (1):
  xmlsec1: Fix configure QA error caused by host lookup path

Dmitry Baryshkov (2):
  xterm: install xterm and uxterm desktop files
  xterm: provide virtual/x-terminal-emulator

Mikko Rapeli (2):
  flatbuffers: whitelist CVE-2020-35864
  giflib: apply patch for CVE-2019-15133 and set CVE_PRODUCT

S. Lockwood-Childs (1):
  sip3: simplify recipe

Søren Andersen (1):
  zram: fix sourcing of zram parameters

zangrc (2):
  iscsi-initiator-utils: upgrade 2.1.2 -> 2.1.3
  openldap: upgrade 2.4.51 -> 2.4.56

zhengruoqin (1):
  openldap: upgrade 2.4.56 -> 2.4.57

 ...Compare-with-max-int-instead-of-max-.patch | 48 -------------------
 ....1.2.bb => iscsi-initiator-utils_2.1.3.bb} |  3 +-
 .../flatbuffers/flatbuffers_1.12.0.bb         |  2 +
 .../giflib/files/CVE-2019-15133.patch         | 23 +++++++++
 .../recipes-devtools/giflib/giflib_5.1.4.bb   |  7 ++-
 meta-oe/recipes-devtools/sip/sip3_4.19.23.bb  | 17 ++-----
 .../recipes-extended/zram/zram/zram-swap-init |  2 +-
 .../recipes-graphics/xorg-app/xterm_353.bb    | 16 ++++++-
 ...{openldap_2.4.51.bb => openldap_2.4.57.bb} |  6 +--
 .../xmlsec1/ensure-search-path-non-host.patch | 22 +++++++++
 .../recipes-support/xmlsec1/xmlsec1_1.2.30.bb |  1 +
 11 files changed, 78 insertions(+), 69 deletions(-)
 delete mode 100644 meta-networking/recipes-daemons/iscsi-initiator-utils/files/0001-libopeniscsiusr-Compare-with-max-int-instead-of-max-.patch
 rename meta-networking/recipes-daemons/iscsi-initiator-utils/{iscsi-initiator-utils_2.1.2.bb => iscsi-initiator-utils_2.1.3.bb} (96%)
 create mode 100644 meta-oe/recipes-devtools/giflib/files/CVE-2019-15133.patch
 rename meta-oe/recipes-support/openldap/{openldap_2.4.51.bb => openldap_2.4.57.bb} (97%)
 create mode 100644 meta-oe/recipes-support/xmlsec1/xmlsec1/ensure-search-path-non-host.patch

-- 
2.17.1

