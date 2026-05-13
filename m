Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C302CD37B6
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 09:23:15 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3682.1778664187732674748
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 May 2026 02:23:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Mf1sDMeE;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-44a5174670eso3638053f8f.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 02:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778664186; x=1779268986; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=N18mT+/psX8zGKw/C+aJVGXMP3F6A9VyQQbywTO5SFc=;
        b=Mf1sDMeEQdWFrxyyy1BG7UcUhGtRfr3mBg+8jx8udveiNgAww++SUVzPdI7gGcZVyu
         83o3sY9gxr/3r/ItaKFIQQnGZ2DXYIsG0P8AP/AUQVlPKZzvkz+L7CwgHDM78ovpVczt
         Afxv2yavQ2HniTRhT7GVR0rz4nqahiWKL6lI4kkZe9iU6OB69j8jckIx6N1AySX89TzJ
         4Fb0HfUI+VNzuFrIDpuoadK/w6CTzCDBjGTtNjmMnwj+X09oqTGMul19/wC+X7MimRQt
         bD2w4Fm04hpQvHh/bfERsthKHB7vm41FUkRgLXZYDSa0SHS8HBoOJNSGCp5uVK/z2j8E
         ueCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778664186; x=1779268986;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N18mT+/psX8zGKw/C+aJVGXMP3F6A9VyQQbywTO5SFc=;
        b=Bv+UUWjuZdCqu1MP6iuVpe8lyo4TxO9HXWxKiih0H4ipJhzE2raHxBbzZEBTyuOvsm
         yI+Vr0LvD6Tkv4dGcQTtXQQmW7NN2jYvj3xa6lXqwQLV0+g3QVt+7Cm83M/gznwunNIK
         kP0LZBGrkbQduZFeDTGFNsro4CezvZhImhPiu0NiA6yyW69aTx9A68j2X2XOjJFs8H0r
         ldErKhAI/cBozMVBdpwE3XF+aCiKXfXl0s0k71ZORydJkqgmI+nzfwXzLfFD1j7WWYTp
         SXalI9LBidGQii71xUMOeUtX/cxEQA8BNFxqSJ4LOVTW6O+4qakMF9ata9bPhSiCEc+9
         xy7w==
X-Gm-Message-State: AOJu0Yyupzqz544mwkc9DIMPB2hlgwz9LcLI/L96O5zAFHhUFYucGIFZ
	uji4wafsORXFKi6S9mycxhpl9aa3IQLyumpDW37LkIX2BqBNf6BYjJAfga+eHQ==
X-Gm-Gg: Acq92OGQbXTOd2ezZFG3O3cIUootG6J4Zr38Rto/uArr8jJPtDzZbsRJXtJY2tBEulw
	CO2Ad49U0WlklHAd5xGPkbxiHSO56fy9qulV8ByOcfs3TnqUxq5hF+11RdbTTnDEOkPqb6KHMEx
	A6RxJ/Qdtw3rmBhjEZrawmJs780zdk2XVN1VGJItpIenTpfc+nV1c2TGeoirNALXvOqBGphGqrI
	3JTS93z5JDL5DIl0M0GtGoqGwgwV6UoeW2L8UUOhaIreT+kN3Xu7Mm81Ry3DLOa+TZ+kZo34tLy
	60qy5seft0xQmBYA2IynoAxMtIZQpEAuUnPzyzgyXIIDCt7BBMFWx25AAO2ExHyJP4lWhUZO2En
	TaN8VMse3GrOdDE49rNRDZYTO7HfhKL+3pdUzhlz+Pieb4/fnLHOr0brymJJbua5o378+0K5rjr
	s2fXxfwIQJZdz9zbjPFrQ0
X-Received: by 2002:a05:6000:1844:b0:43e:a69b:d814 with SMTP id ffacd0b85a97d-45c79f2996emr3431427f8f.28.1778664185820;
        Wed, 13 May 2026 02:23:05 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548eb75c29sm37924724f8f.9.2026.05.13.02.23.05
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 02:23:05 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Kirkstone pull request 13th May
Date: Wed, 13 May 2026 11:23:04 +0200
Message-ID: <20260513092304.1177892-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 09:23:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126960

Some last minute fixes - thanks to all contributors.

Test artifacts:
World build qemuarm: https://github.com/OldManYellsAtCloud/meta-oe-test/actions/runs/25286703147
World build qemuarm64: https://github.com/OldManYellsAtCloud/meta-oe-test/actions/runs/25289100851
World build qemux86: https://github.com/OldManYellsAtCloud/meta-oe-test/actions/runs/25290018061
World build qemux86-64: https://github.com/OldManYellsAtCloud/meta-oe-test/actions/runs/25290023412
YP layer compatibility: https://github.com/OldManYellsAtCloud/meta-oe-test/actions/runs/25261771118
Ptest execution (logs available at the link): https://github.com/OldManYellsAtCloud/meta-oe-test/actions/runs/25384396207

The following changes since commit 9d8ef26a9693e2c70ae34abe1a753873d42ec588:

  libssh: Fix CVE-2026-0964 (2026-03-29 11:11:33 +0200)

are available in the Git repository at:

  git://git.openembedded.org/meta-openembedded-contrib stable/kirkstone-nut

for you to fetch changes up to ce8539c941f6fcbecaca4d16640ac105c0595589:

  python3-soupsieve: fix tests with Python 3.10.20 (2026-05-04 15:59:37 +0200)

----------------------------------------------------------------
Bhabu Bindu (1):
      neon: Backport redirect test debug improvements

Gyorgy Sarvari (16):
      python3-cbor2: return correct error code from run-ptest
      python3-cbor2: more patch indent and test fixes
      nginx: set CVE_PRODUCT
      tomoyo-tools: fix SRC_URI
      logwatch: fix SRC_URI
      dnfdragora: fix SRC_URI
      ipc-run: fix SRC_URI
      linux-atm: fix SRC_URI
      driverctl: fix SRC_URI
      libsodium: fix SRC_URI
      sblim-sfcc: fix SRC_URI
      ttf-sazanami: fix SRC_URI
      libubox: fix SRC_URI
      unicode-ucd: fix license hash (again)
      ttf-vlgothic: fix SRC_URI
      python3-soupsieve: fix tests with Python 3.10.20

Hitendra Prajapati (3):
      nginx: fix CVE-2026-27784, CVE-2026-28755
      nginx: fix multiple CVEs
      nginx: fix CVE-2026-32647

Jon Mason (1):
      python3-cbor2: Fix CVE-2025-68131 CVE patch error

Naman Jain (2):
      python3-protobuf: ignore CVE-2024-7254
      imagemagick: Fix CVE-2025-68950

Shaik Moin (1):
      imagemagick: Fix CVE-2025-62594

Tyler Park (1):
      fmt: Updated master->main in SRC_URI.

Vijay Anusuri (1):
      strongswan: Fix CVE-2026-25075

Zahir Hussain (1):
      rocksdb: fix typo in PACKAGECONFIG

 .../recipes-support/linux-atm/linux-atm_2.5.2.bb   |   2 +-
 .../strongswan/files/CVE-2026-25075.patch          |  50 ++++++
 .../strongswan/strongswan_5.9.13.bb                |   1 +
 .../recipes-crypto/libsodium/libsodium_1.0.18.bb   |   2 +-
 meta-oe/recipes-dbs/rocksdb/rocksdb_6.20.3.bb      |   2 +-
 meta-oe/recipes-devtools/libubox/libubox_git.bb    |   2 +-
 .../recipes-devtools/perl/ipc-run_20200505.0.bb    |   2 +-
 meta-oe/recipes-extended/logwatch/logwatch_7.6.bb  |   2 +-
 .../sblim-sfcc/sblim-sfcc_2.2.8.bb                 |   2 +-
 .../dnfdragora/dnfdragora_2.1.2.bb                 |   2 +-
 .../ttf-fonts/ttf-sazanami_20040629.bb             |   2 +-
 .../ttf-fonts/ttf-vlgothic_20200720.bb             |   2 +-
 .../tomoyo-tools/tomoyo-tools_2.5.0.bb             |   2 +-
 .../recipes-support/driverctl/driverctl_0.111.bb   |   2 +-
 meta-oe/recipes-support/fmt/fmt_8.1.1.bb           |   2 +-
 .../imagemagick/files/CVE-2025-62594.patch         | 197 +++++++++++++++++++++
 .../imagemagick/files/CVE-2025-68950.patch         |  24 +++
 .../imagemagick/imagemagick_7.0.10.bb              |   2 +
 .../0001-Temporarily-disable-no_redirect.patch     |  45 +++++
 ...-enabling-no_redirect-with-more-debugging.patch |  50 ++++++
 ...rect-Switch-to-using-double_serve_sstring.patch |  48 +++++
 .../neon/neon/0004-test-redirect.c-Cleanup.patch   |  49 +++++
 meta-oe/recipes-support/neon/neon_0.30.2.bb        |   4 +
 .../unicode-ucd/unicode-ucd_14.0.0.bb              |   6 +-
 .../0001-fix-test-parameterization.patch           |  48 +++++
 .../python/python3-cbor2/CVE-2025-68131.patch      |  51 ++++--
 .../python/python3-cbor2/run-ptest                 |   3 +-
 .../recipes-devtools/python/python3-cbor2_5.4.2.bb |   1 +
 .../python/python3-protobuf_3.20.3.bb              |   3 +
 ...djustments-for-changes-in-HTML-parser-285.patch | 190 ++++++++++++++++++++
 .../python/python3-soupsieve_2.3.1.bb              |   8 +-
 .../nginx/nginx-1.24.0/CVE-2026-27651.patch        |  34 ++++
 .../nginx/nginx-1.24.0/CVE-2026-27654.patch        |  81 +++++++++
 .../nginx/nginx-1.24.0/CVE-2026-27784.patch        |  88 +++++++++
 .../nginx/nginx-1.24.0/CVE-2026-28753.patch        |  93 ++++++++++
 .../nginx/nginx-1.24.0/CVE-2026-28755.patch        |  48 +++++
 .../nginx/nginx-1.24.0/CVE-2026-32647.patch        |  78 ++++++++
 meta-webserver/recipes-httpd/nginx/nginx.inc       |   2 +
 meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb |   9 +
 39 files changed, 1199 insertions(+), 40 deletions(-)
 create mode 100644 meta-networking/recipes-support/strongswan/files/CVE-2026-25075.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/files/CVE-2025-62594.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/files/CVE-2025-68950.patch
 create mode 100644 meta-oe/recipes-support/neon/neon/0001-Temporarily-disable-no_redirect.patch
 create mode 100644 meta-oe/recipes-support/neon/neon/0002-Re-enabling-no_redirect-with-more-debugging.patch
 create mode 100644 meta-oe/recipes-support/neon/neon/0003-no_redirect-Switch-to-using-double_serve_sstring.patch
 create mode 100644 meta-oe/recipes-support/neon/neon/0004-test-redirect.c-Cleanup.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-cbor2/0001-fix-test-parameterization.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-soupsieve/0001-Adjustments-for-changes-in-HTML-parser-285.patch
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-27651.patch
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-27654.patch
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-27784.patch
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-28753.patch
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-28755.patch
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-32647.patch

