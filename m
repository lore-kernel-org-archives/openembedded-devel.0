Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14377CAC5BD
	for <webhook@archiver.kernel.org>; Tue, 30 Sep 2025 09:18:59 +0000 (UTC)
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
 by mx.groups.io with SMTP id smtpd.web10.21054.1759223930560311224
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Sep 2025 02:18:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GsEve46A;
 spf=pass (domain: gmail.com, ip: 209.85.166.44, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-93607aec358so2636539f.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Sep 2025 02:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759223929; x=1759828729; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V/l6ttCUdqsKYRCQ01l2rSsk+E8R75Nsf5RvL+FQG8I=;
        b=GsEve46A7s7dN8EudcHJB8Xm4WkXjTanoRhq2WCvTYb62r4Bgu8ykDv18dT/h3+G19
         Q/M3OtIUf/+o4CzkCG2R6Q9uLnhCgpFQnZhPbQNNm4LLvlT/CwxUX9OGUExULygJ7mIS
         tTbGpkAS1kHEUnyGj+z02TxRXvmSZ1pV06VTlUjPDOd+Rq3ncagw58CKNhbTE26tc9Pr
         MkWgEW9LgacoIegYLB4LsakK9hnU6YahCHAkyG5cRM0rTLHCnhDJI+Qq7tM9xM/Hb6Ke
         ZF7XYZrP3TGI4/N6HPSwTe7L4OmEANasp1Dl0YXH0yBjGmGE1vQuUGfdNJbw+9OaBM9R
         K7OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759223929; x=1759828729;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V/l6ttCUdqsKYRCQ01l2rSsk+E8R75Nsf5RvL+FQG8I=;
        b=G0R5DkvQ/EQSiFF6jBwvTp2J7ZrZnnW2T90PWvmGIy9A0Wp1TIohEwLPGVY7udNp/1
         mFCTv2DeRSn9SYfrH5iVNDGHeF6auFBLyqJ8LU2VC7CHPktfuKLQsIr+iIq80Z3mU9SR
         9fwC3i7LScsOxwQToJKsiXxp+thwOP7VdXSiKkkxSI5oWwXYTPW7ml8GTGq4PMc6EYk0
         Oo4HZAiisn8WjwdLpHAuIjFjcjgmRDIwl1j6L6c64T3+q4GEBDULsenXntcGrXrsKjUI
         aSRagOcpbgM4ZzUQHyEz3Gn86uRROkOPK3w/YVDn0u08tQES2WDh8Z6GjU+80RLAxyJN
         WEIQ==
X-Gm-Message-State: AOJu0YwZkvIY/DcX8cCJ2b8/BYPTar+eFe5r8yrVkr/KNyqVrRYLY22z
	Z8ZablPn78ET4CBaTPUkTUS5IdLnxa0Ft8hjTx/McB66NWILB2GRCCWNM5bOCYkb
X-Gm-Gg: ASbGnctW0ijoeZxsE3JOPMlP561iKepYyS0vm+DgPW2B5ne+CRbiUHyE1bMhR/4yQC9
	sLKAQ/rgaCTLts6lyXXh5ZPyN6IdEpltXflNX8O3e6AM1gITrDEMDnlku54Q+9ca/aETbPATKVQ
	MAzG6KDtVPyzc8gJHig6mosSREqfJtswKnNH9te6IK99gDmvnxwSqteJ5/QLxDkSo2hW24EHlV+
	rh4f2ehvNFHZFK+Vd+rlpy4BEWg70xve0M4M8J2N5XP+6yRdF0AqGpf6GBLH+GIdx3ITBVf5466
	TuRnWGaPosoxrsmmraIkcuP3660sXs5u3fk4STdT/TiWfRZRtlZbyFZYXXKFNL9hztfljnaBW/M
	0g3+D7xcjc4mToLjj82AJ17USZvKPbyxBFYW3rwfLEmVcAP4T8RgHSUEHJfkVnSX9sEu1BUsJVL
	lCxp5z9W4vRw==
X-Google-Smtp-Source: AGHT+IHR3t0jkuHcEkuBkDLHZQ+H8mReXfvqAvRGj3XQveihP9cdxDxjQ7NDpQlDUQxIUc3TaeT7xg==
X-Received: by 2002:a05:6e02:1489:b0:425:a02a:292d with SMTP id e9e14a558f8ab-425a02a2b0cmr254151475ab.2.1759223929354;
        Tue, 30 Sep 2025 02:18:49 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([147.161.217.10])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5742a4afbc3sm1837064173.2.2025.09.30.02.18.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 02:18:48 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][walnascar][PATCH 00/22] cherry-picks from master branch (batch-3)
Date: Tue, 30 Sep 2025 22:18:19 +1300
Message-ID: <20250930091841.1693131-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Sep 2025 09:18:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120052

Trying to keep recipes in the walnascar branch updated with useful fixes from
the master branch.

I have tried to carefully review the change logs and commit logs while updating
recipe versions.

Did basic validation by building against qemux86-64 and qemuarm64
machine targets.

Bartosz Golaszewski (1):
  libgpiod: update to v2.2.2

Denis OSTERLAND-HEIM (1):
  libusbgx: fix example gadget start

Gyorgy Sarvari (4):
  zlog: upgrade 1.2.16 -> 1.2.18
  nmap: set correct license
  tokyocabinet: fix license
  daemonize: update to latest revision

Jan Vermaete (1):
  freeglut: changed SRC_URI to github + added UPSTREAM_CHECK

Jason Schonberg (1):
  Remove the use of http://ftp.gnome.org/pub/gnome

Kéléfa Sané (1):
  crash: fix reproducibility

Markus Volk (1):
  malcontent: update 0.13.0 -> 0.13.1

Nylon Chen (1):
  kernel-selftest: handle missing -64.h headers

Patrick Zacharias (1):
  libcanberra: Fix sound not playing on Colibri iMX8X

Sana Kazi (1):
  imagemagick: guard sed operations in do_install for optional files

Wang Mingyu (5):
  parallel: upgrade 20250322 -> 20250422
  parallel: upgrade 20250422 -> 20250522
  parallel: upgrade 20250522 -> 20250622
  parallel: upgrade 20250622 -> 20250722
  parallel: upgrade 20250722 -> 20250822

Yi Zhao (1):
  nmap: set UPSTREAM_CHECK_REGEX

Yoann Congal (2):
  boinc-client: fix hostname reproducibility
  gutenprint: fix a build race-condition

jacobpanov (1):
  kernel-selftest: Fix PTP selftest compilation for kernel 6.7+

 meta-oe/conf/include/non-repro-meta-oe.inc    |   3 -
 meta-oe/licenses/NPSL                         | 583 ++++++++++++++++++
 .../libsigc++-2.0/libsigc++-2.0_2.12.1.bb     |   2 +-
 .../libsigc++-2.0/libsigc++-3_3.6.0.bb        |   2 +-
 .../proxy-libintl/proxy-libintl_20100902.bb   |   4 +-
 .../recipes-devtools/glade/glade_3.36.0.bb    |   2 +-
 .../boinc/boinc-client_7.20.5.bb              |   5 +-
 ...allel_20250322.bb => parallel_20250822.bb} |   2 +-
 ...01-Don-t-overwrite-systemwide-cflags.patch |  31 +
 .../files/upgrade_cmake_minimum_version.patch |  25 +
 meta-oe/recipes-extended/zlog/zlog_1.2.16.bb  |  17 -
 meta-oe/recipes-extended/zlog/zlog_1.2.18.bb  |  14 +
 .../gnome-themes/gnome-themes-extra_3.28.bb   |   2 +-
 meta-oe/recipes-gnome/gtk+/gtk+_2.24.33.bb    |   2 +-
 .../recipes-gnome/malcontent/malcontent.inc   |   6 +-
 .../freeglut/freeglut_3.4.0.bb                |   6 +-
 meta-oe/recipes-kernel/crash/crash.inc        |   1 +
 ...e-CC-env-var-to-get-compiler-version.patch |  48 ++
 .../kernel-selftest/kernel-selftest.bb        |  17 +-
 ...-race-condition-around-empty-directo.patch |  60 ++
 .../gutenprint/gutenprint_5.3.4.bb            |   4 +-
 meta-oe/recipes-security/nmap/nmap_7.95.bb    |   5 +-
 ...-many-arguments-to-function-write-er.patch |  46 --
 .../daemonize/daemonize_git.bb                |   3 +-
 .../imagemagick/imagemagick_7.1.1-43.bb       |  23 +-
 ...udio-buffer-size-for-a-time-of-500ms.patch |  42 ++
 .../libcanberra/libcanberra_0.30.bb           |   1 +
 .../{libgpiod_2.2.1.bb => libgpiod_2.2.2.bb}  |   2 +-
 .../recipes-support/libusbgx/libusbgx_git.bb  |   2 +-
 .../tokyocabinet/tokyocabinet_1.4.48.bb       |   2 +-
 30 files changed, 869 insertions(+), 93 deletions(-)
 create mode 100644 meta-oe/licenses/NPSL
 rename meta-oe/recipes-extended/parallel/{parallel_20250322.bb => parallel_20250822.bb} (93%)
 create mode 100644 meta-oe/recipes-extended/zlog/files/0001-Don-t-overwrite-systemwide-cflags.patch
 create mode 100644 meta-oe/recipes-extended/zlog/files/upgrade_cmake_minimum_version.patch
 delete mode 100644 meta-oe/recipes-extended/zlog/zlog_1.2.16.bb
 create mode 100644 meta-oe/recipes-extended/zlog/zlog_1.2.18.bb
 create mode 100644 meta-oe/recipes-kernel/crash/crash/0001-Use-CC-env-var-to-get-compiler-version.patch
 create mode 100644 meta-oe/recipes-printing/gutenprint/gutenprint/0001-cups-fix-a-build-race-condition-around-empty-directo.patch
 delete mode 100644 meta-oe/recipes-support/daemonize/daemonize/0001-fix-getopt.c-too-many-arguments-to-function-write-er.patch
 create mode 100644 meta-oe/recipes-support/libcanberra/files/0001-Determine-audio-buffer-size-for-a-time-of-500ms.patch
 rename meta-oe/recipes-support/libgpiod/{libgpiod_2.2.1.bb => libgpiod_2.2.2.bb} (98%)


