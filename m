Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web09.5836.1617634468792196946
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Apr 2021 07:54:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OUAxwM/J;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id h20so5782925plr.4
        for <openembedded-devel@lists.openembedded.org>; Mon, 05 Apr 2021 07:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id;
        bh=1RO2ZxOxEUvBpbu1ijWHKInT0/7ZhYvN8KQ7M9I7REw=;
        b=OUAxwM/JLrbTwuce1CJubtr7vXWf7fNlZDKIFrlsq4QvtdSZwqdAZTVn00xUuCiABw
         49+pGG2olIeCOQrfvTNVV3HVln3tXfkOW6sVCrvposUKXwredsumVXkcLVG0lGzVRiZq
         qdk+5T6frT94w2pwtVd0BOKNp6QXP2My2gxMeOeWqWJ8gDoWMvWz3QEiLXjo3p/mi3VB
         fVMs/fLQadwYj17aN7QIOXi1XnJmAdvWOVrVBx7iJMkaHeeXAaz7dQIl+rC90iBbcZ+w
         2D964PwFYnLIfxwZhHIGZVf41u2ZM2zeYECR3gXA8ER/okPrdhEDtqG5Fi6ExlNhH5Re
         huzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=1RO2ZxOxEUvBpbu1ijWHKInT0/7ZhYvN8KQ7M9I7REw=;
        b=HsCsBGJvZatzFW0s+pKgj9jLc03eu+MZ/Jx3DfyVss0+LQxrCgUzxNhFl6+9pjApSb
         jSbqBmVgvyzTBxwPmEdGIPyH2vekzUh0D2CJkSiZsM+lBhn6fm7rMh7qEjJkQuhfvXEJ
         G4utZDfjkmejIq/lcaULVGozd8cYQJh+iovyjoBKGk6OTKa327DTB3GMPK56OSQO51Km
         Olelq2zYncdSiKjRQkxHzHNhO3dOr8xbOIc4aVq96GANDBJsoZPhGKT4Kg5KvFP/l+rt
         WfcteJ87aBa0duAHRmDnv4502FxjDrBMQ7MVYkJi/OC9f4DZ5q2SwIk91kXNyBBnVPju
         j/Pg==
X-Gm-Message-State: AOAM53106R471/7nh5s1+Godw/MnB7KY7lCzC00pAxQIgEGwPKPFrlXP
	e7dx2aLRhFqiyAn0EpUOapEfT3DNtQk=
X-Google-Smtp-Source: ABdhPJwnqbPjVtR90CIoGfM9iWzTG9F1g79eUwmpkzpqAOBCPYBtX92CO/QV9Fhw/LJ9/nj8uesoWg==
X-Received: by 2002:a17:90a:bb02:: with SMTP id u2mr27861120pjr.175.1617634468089;
        Mon, 05 Apr 2021 07:54:28 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:cb2:3225:c999:3d47])
        by smtp.gmail.com with ESMTPSA id k11sm16501654pjs.1.2021.04.05.07.54.27
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 07:54:27 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [Dunfell patch review 00/11] April 05
Date: Mon,  5 Apr 2021 07:54:13 -0700
Message-Id: <cover.1617634345.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1

Most of these where patches already sent to the list so a shorter review window.
Please have comments back by this Tuesday.

The following changes since commit d9c703aab817eb30d8a0d2c5caba29530880d1aa:

  opencv: Security fixes (2021-03-11 21:20:01 -0800)

are available in the Git repository at:

  git://git.openembedded.org/meta-openembedded-contrib stable/dunfell-nut
  http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=stable/dunfell-nut

Aditya.Tayade (1):
  neon: Add ptest

Armin Kuster (1):
  wireguard: fix build issue with updated 5.4 kernel

Marek Vasut (1):
  freerdp: Add missing libxkbcommon WL dependency

Martin Jansa (5):
  opencv: refresh patches with devtool to apply cleanly
  ceres-solver: prevent fetching git hook during do_configure
  packagegroup-meta-oe: include nodejs without meta-python2 conditional
  packagegroup-meta-oe: move the packages depending on meta-python2 to
    separate packages
  packagegroup-meta-oe: add guider

Peace Lee (2):
  guider: Upgrade to 3.9.7
  Update commit for version 3.9.7

changqing.li@windriver.com (1):
  thin-provisioning-tools: switch branch from master to main

 ...send-functions-were-backported-exten.patch |  32 ++++++
 .../wireguard-module_1.0.20200401.bb          |   3 +-
 .../packagegroups/packagegroup-meta-oe.bb     |  37 +++++--
 .../recipes-devtools/guider/guider_3.9.6.bb   |  39 -------
 .../recipes-devtools/guider/guider_3.9.7.bb   |  19 ++++
 .../ceres-solver/ceres-solver_1.14.0.bb       |   8 ++
 .../recipes-support/freerdp/freerdp_git.bb    |   2 +-
 meta-oe/recipes-support/neon/neon/run-ptest   |  25 +++++
 meta-oe/recipes-support/neon/neon_0.30.2.bb   |  15 ++-
 ...dparty-ippicv-Use-pre-downloaded-ipp.patch |   4 +-
 .../opencv/opencv/0001-Dont-use-isystem.patch |   4 +-
 ...-around-deprecated-ffmpeg-RAW-functi.patch |   4 +-
 ...-ipcp-unit-growth-with-ipa-cp-unit-g.patch |   9 +-
 ...reate-share-library-intead-of-static.patch |   4 +-
 .../0003-To-fix-errors-as-following.patch     |   8 +-
 .../opencv/opencv/CVE-2019-14491.patch        |  56 +++++-----
 .../opencv/opencv/CVE-2019-14493.patch        | 104 +++++++++---------
 .../opencv/opencv/CVE-2019-15939.patch        |  20 ++--
 .../opencv/opencv/CVE-2019-19624.patch        |  22 ++--
 .../opencv/opencv/download.patch              |   9 ++
 .../thin-provisioning-tools_0.8.5.bb          |   2 +-
 21 files changed, 256 insertions(+), 170 deletions(-)
 create mode 100644 meta-networking/recipes-kernel/wireguard/files/0001-compat-icmp_ndo_send-functions-were-backported-exten.patch
 delete mode 100644 meta-oe/recipes-devtools/guider/guider_3.9.6.bb
 create mode 100644 meta-oe/recipes-devtools/guider/guider_3.9.7.bb
 create mode 100644 meta-oe/recipes-support/neon/neon/run-ptest

-- 
2.17.1

