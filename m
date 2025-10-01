Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9671CCA472
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 13:52:47 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web11.18606.1759326766329695774
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Oct 2025 06:52:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VCipIVOa;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-62fc28843ecso9991508a12.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 01 Oct 2025 06:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759326765; x=1759931565; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=uLUPR41AEXffoJ5q59DwL8qbRwW64br22vXVkJOjIqk=;
        b=VCipIVOaajddnKg97LY6DqMgrLWIRCsMh9ZhGYr39eSq0uSUy0EOi4QuGRnehU3fn2
         4EvOBbJK+HqMjLJVaKd5pt7CkN3IIGV9/1n3YsFGrB4hwYl4m9CQcI7bcTg7X0/eoCaY
         irQbz/Qx9ivUnjuXUOE3NjNvLBqhrL4wjXVKZEdlDCLSJv/Z8uM2SXpdugpuMZuJ8uqt
         r12Pi9bidYVQB7YGiobVQlSi5o1Y31yKEgzD9E5hH3G1eRr9pqUJF/KHbYO6iUMvn51e
         FfsxIepYIdh09yaWJvcmJGZmcNYJTD52lzBy36u/jagprZUYkzg+tNgS9A0DNhnnpKdO
         oeqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759326765; x=1759931565;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uLUPR41AEXffoJ5q59DwL8qbRwW64br22vXVkJOjIqk=;
        b=B17DBcCPyU5rMiVS/z829tM7pLt3/9I9I8fQnmqE8tfecy60MyWLkWA/WHD6/EMJn0
         gRZonNZD5Au8YrAFPGOMjo9/henOC/CbaiRi2oc3GI06YUPjYWr2vC8pyF5uaLKp4yTJ
         39mY8TcU6EFVM/G3du0MsQJESnE80GmlolWduJd9l1BvL41byZQ4VxcDU9A+5hcQCWrx
         SEB0xC5sUlKPtA2A2g7s7thl78rej/CD0xMCN3/eUYajgJ//bcsXUc3sxqrgG8xrxOEo
         PJ32fKmM5eFXV/Jx46TH5Fvo2ca6CYsqjkMPXOQAzASJUvfb/Kawf4pN2ZlK2KGUq0s+
         BOUw==
X-Gm-Message-State: AOJu0YwaN8Rq67KaenDmm/7p2RJ3Drb/3F/jam+ma/zhMLhb8pO8GYUn
	IpIPZ3eymYvqgq7v8/IFhJARPUyUZt3xHTPMHPFiT/258c4Uc511F2vnLw+k9g==
X-Gm-Gg: ASbGnctWLSrx64LsOwN5/uRqyHj8bUWgFvtULbfwlcguHn135r5ZPLzfmPed5MqSuRc
	WASGKW1ITjH0Vli6SVkKebqLgpqVNgu21ZhPVqIfaCvxusCQPBjFXWGJGRwpLco28bBu/vi0N95
	s/f+uPxl4Y9lp1dex+nifinrqXxrYMZHz+jfTNh2bxjKfuUH0DT2w3s0uZjnE1UAbbxrqMft391
	O/iz9rXXwBct0wX4qBjLIOR0r7+SaINS8sVkzNZ9aIfZkSroLrSCbt16yb5GEISrimVWIaZS1d/
	68QwUKnStqc2YGFplGCwHkU6MCrRqSCAS95s18nA1amYVK0N0k2RJLCP7A/NYF5e9ok7QdiRsTz
	okCrqXaN/idXmrzsvW7SWv898uwcTPoFa+fnNY0KVub15
X-Google-Smtp-Source: AGHT+IHdwApxvBMGxWYBa3zPMOqyNLy7ssL6xLLJfAOKej7+iIRM7Wwx37V5VJ/eadx4m6KM3M6W7g==
X-Received: by 2002:a05:6402:2689:b0:634:b377:5d4d with SMTP id 4fb4d7f45d1cf-63678ca5d9cmr3736227a12.21.1759326764491;
        Wed, 01 Oct 2025 06:52:44 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-634a3629badsm11507823a12.9.2025.10.01.06.52.43
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 06:52:44 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 00/25] Cherry-picks from Master Batch F
Date: Wed,  1 Oct 2025 15:52:18 +0200
Message-ID: <20251001135243.1490753-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Oct 2025 13:52:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120115

This batch contains only CVE patches and generic recipe fixes (SRC_URI update, dependencies...).

These have been tested so far with x86-64 - testing with other platforms is still underway.
If wnything would fail, will reply to this thread..

Please let me know if you have any questions or comments about these patches.

Thank you.

---

Alexandre Videgrain (1):
  openbox: fix crash on alt+tab with fullscreen app

Bartosz Golaszewski (1):
  python3-nmap: add missing run-time dependencies

Etienne Cordonnier (1):
  fsverity-utils: fix SRC_URI

Gyorgy Sarvari (1):
  nmap: add missing dependency

Jiaying Song (3):
  libconfig: switch source to GitHub repository
  vlock: fix do_fetch error
  softhsm: switch source to GitHub repository

Justin Bronder (1):
  tk: inherit pkgconfig

Khem Raj (1):
  nicstat: Use SOURCEFORGE_MIRROR in SRC_URI

Lee Chee Yang (2):
  libsdl: fix CVE-2022-34568
  x11vnc: Fix CVE-2020-29074

Markus Volk (1):
  p8platform: unbreak do_populate_sdk

Mingli Yu (2):
  dialog: Update the SRC_URI
  minicoredumper: correct the sysvinit service file attribute

Peter Kjellerstedt (1):
  paho-mqtt-cpp: Improve the license information

Peter Marko (8):
  audiofile: fix multiple CVEs
  audiofile: patch CVE-2017-6829
  audiofile: fix multiple CVEs
  audiofile: patch CVE-2017-6831
  audiofile: patch CVE-2017-6839
  libmad: ignore CVE-2017-11552 and CVE-2018-7263
  libmad: patch CVE-2017-8372 and CVE-2017-8373
  libmad: patch CVE-2017-8372 and CVE-2017-8373

Randy MacLeod (1):
  libmad: switch links/SRC_URI to https sites

Soumya Sambu (1):
  gtk+: Fix CVE-2024-6655

 .../paho-mqtt-cpp/paho-mqtt-cpp_1.2.0.bb      |   3 +-
 .../fsverity-utils/fsverity-utils_1.5.bb      |   2 +-
 meta-oe/recipes-devtools/tcltk/tk_8.6.10.bb   |   2 +-
 .../dialog/dialog_1.3-20210509.bb             |   2 +-
 .../libconfig/libconfig_1.7.3.bb              |   9 +-
 .../recipes-extended/nicstat/nicstat_1.95.bb  |   2 +-
 .../p8platform/p8platform_git.bb              |   2 +
 meta-oe/recipes-extended/vlock/vlock_2.2.3.bb |   2 +-
 .../gtk+/gtk+/CVE-2024-6655.patch             |  40 +
 meta-oe/recipes-gnome/gtk+/gtk+_2.24.33.bb    |   1 +
 .../libsdl/libsdl-1.2.15/CVE-2022-34568.patch |  28 +
 .../recipes-graphics/libsdl/libsdl_1.2.15.bb  |   1 +
 ...traversal-issue-in-client_calc_layer.patch |  56 ++
 .../recipes-graphics/openbox/openbox_3.6.1.bb |   1 +
 .../x11vnc/files/CVE-2020-29074.patch         |  27 +
 .../recipes-graphics/x11vnc/x11vnc_0.9.16.bb  |   1 +
 .../minicoredumper/minicoredumper_2.0.1.bb    |   2 +-
 .../audiofile/audiofile_0.3.6.bb              |   5 +
 ...ays-check-the-number-of-coefficients.patch |  45 +
 ...ues-to-fix-index-overflow-in-IMA.cpp.patch |  43 +
 ...multiplication-overflow-in-sfconvert.patch |  79 ++
 ...ail-when-error-occurs-in-parseFormat.patch |  46 +
 ...lication-overflow-in-MSADPCM-decodeS.patch | 126 +++
 .../libmad/CVE-2017-8372_CVE-2017-8373.patch  |  69 ++
 .../libmad/libmad/CVE-2017-8374.patch         | 830 ++++++++++++++++++
 .../libmad/libmad_0.15.1b.bb                  |  12 +-
 meta-oe/recipes-security/nmap/nmap_7.80.bb    |   8 +-
 .../recipes-security/softhsm/softhsm_2.6.1.bb |   5 +-
 28 files changed, 1429 insertions(+), 20 deletions(-)
 create mode 100644 meta-oe/recipes-gnome/gtk+/gtk+/CVE-2024-6655.patch
 create mode 100644 meta-oe/recipes-graphics/libsdl/libsdl-1.2.15/CVE-2022-34568.patch
 create mode 100644 meta-oe/recipes-graphics/openbox/files/0001-Fix-list-traversal-issue-in-client_calc_layer.patch
 create mode 100644 meta-oe/recipes-graphics/x11vnc/files/CVE-2020-29074.patch
 create mode 100644 meta-oe/recipes-multimedia/audiofile/files/0004-Always-check-the-number-of-coefficients.patch
 create mode 100644 meta-oe/recipes-multimedia/audiofile/files/0005-clamp-index-values-to-fix-index-overflow-in-IMA.cpp.patch
 create mode 100644 meta-oe/recipes-multimedia/audiofile/files/0006-Check-for-multiplication-overflow-in-sfconvert.patch
 create mode 100644 meta-oe/recipes-multimedia/audiofile/files/0007-Actually-fail-when-error-occurs-in-parseFormat.patch
 create mode 100644 meta-oe/recipes-multimedia/audiofile/files/0008-Check-for-multiplication-overflow-in-MSADPCM-decodeS.patch
 create mode 100644 meta-oe/recipes-multimedia/libmad/libmad/CVE-2017-8372_CVE-2017-8373.patch
 create mode 100644 meta-oe/recipes-multimedia/libmad/libmad/CVE-2017-8374.patch


