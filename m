Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web09.6294.1622029971563087864
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 May 2021 04:52:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QXj/L5MN;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id e22so724199pgv.10
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 May 2021 04:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=D/gRn7rXDS6ZRkZLNQ7OfycHCxIs6CdMfEdkiM5hpg4=;
        b=QXj/L5MN28C9pxxyZ07pGq/8t78eXOntyhC1jObbARauKggJDuRfCoZT3uzei1woQH
         4iDkE6ieYkPCADwpC9XKGb5SXMjZB5Dgugp5Gx4xFTGi6drQ5F2/H0037u80lXMnSYti
         VdeyICQhYLnoW17lSW9jecpcX6YfThVVQhwEvDrFAEbOYhJaTS6qLSwczskdpjja1xbC
         NSD/gtY5cdrVVN8X4alH7OPis8zV+sdVuNK7DriV/5I+8n8BUGFVYuqczdbPa1fsSKlP
         3+V8aSTxDO8eY+8oZc9y4T89pSQjM3bemskyJ94BZzLIcgIEN6oSXDiXRpNjIxkCpPoc
         DkkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=D/gRn7rXDS6ZRkZLNQ7OfycHCxIs6CdMfEdkiM5hpg4=;
        b=WqDo3xoxUJ9PJmEUplAu/Dbc3kGRlTJY+mVqHIV49n5Vhx1jukcYHpTU66m44Zqt42
         WhEezLCerRNqXDGfoVefpYvis46cqGBL714VRQiIp3Bo+fa2HtL22NpTMpPfLgES3Rco
         A5oYR/z/7cgQ7uJGKOTQtpzXVpNB7Gl3utb97UU9pFn5Vgcog1K37rS8g27HWOC67M5j
         Zs+71qc1Ip/6sSdKUdDYSxi+jLfPiqX/zBxvr5C8QnsliaBSmkGstW724QoSH3Wf1qJy
         kVajy93ditDGoowenHsd6qkAlWhmFV6xMsladBBqRc3NUnQi8HXATx7PYFECZvroVA/k
         qU5w==
X-Gm-Message-State: AOAM530jTjsVpAB4U3TW8dhws2uZd08vu91SfslPTrQu56tk6/RWd9at
	Nc7uV9qw3JgGMgMga+c800EluESpZ/z4ZA==
X-Google-Smtp-Source: ABdhPJzuoH8ZM9rfojqb/od7U+XiOql2zNV+mfOB9zPuAvClpVQ02fSPIjLQnQEx40MyHnSImwzNBQ==
X-Received: by 2002:aa7:8a85:0:b029:2db:484c:de1a with SMTP id a5-20020aa78a850000b02902db484cde1amr34686901pfc.2.1622029970443;
        Wed, 26 May 2021 04:52:50 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:68d3:e59c:b64:76e3])
        by smtp.gmail.com with ESMTPSA id h22sm15408818pfn.55.2021.05.26.04.52.49
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 04:52:49 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [harkknott 00/23] Patch review
Date: Wed, 26 May 2021 04:52:15 -0700
Message-Id: <cover.1622029873.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Please have comments back by Friday
The following changes since commit cf5bd6a8308108b4313a1e45ce8aa87e73125bf9:

  xfce4-settings: upgrade 4.16.0 -> 4.16.1 (2021-05-17 07:18:41 -0700)

are available in the Git repository at:

  git://git.openembedded.org/meta-openembedded-contrib stable/hardknott-nut
  http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=stable/hardknott-nut

Alexander Vickberg (1):
  hostapd: fix building with CONFIG_TLS=internal

Andreas Müller (1):
  libgtop: tidy up recipe

Changqing Li (1):
  libgtop: fix do_compile error

Khem Raj (1):
  opencv: Disable tbb on riscv/musl

Leon Anavi (4):
  python3-cerberus: Upgrade 1.3.3 -> 1.3.4
  python3-robotframework: Upgrade 4.0.1 -> 4.0.2
  python3-rfc3339-validator: Upgrade 0.1.3 -> 0.1.4
  python3-pymongo: Upgrade 3.11.3 -> 3.11.4

Saul Wold (2):
  opencv: remove tbb packageconfig for powerpc
  sysdig: disable building for ppc

Trevor Gamblin (2):
  python3-django: upgrade 2.2.20 -> 2.2.22
  python3-django: upgrade 3.2 -> 3.2.2

wangmy (10):
  uftrace: Fix a plthook crash on aarch64 with binutils2.35.1 and later
    versions on aarch64
  exiv2: Fix CVE-2021-29457
  exiv2: Fix CVE-2021-29458
  exiv2: Fix CVE-2021-29463
  exiv2: Fix CVE-2021-3482
  exiv2: Fix CVE-2021-29464
  exiv2: Fix CVE-2021-29470
  exiv2: Fix CVE-2021-29473
  libsdl: Fix CVE-2019-13616
  trace-cmd: Conflict resolution

zangrc (1):
  postgresql: upgrade 13.2 -> 13.3

 ...-fix-compile-error-for-cross-compile.patch |  37 ++++++
 .../recipes-gnome/libgtop/libgtop_2.40.0.bb   |   7 +-
 ...001-Prepare-for-CVE-2021-30004.patch.patch |  45 +++++++
 .../hostapd/hostapd_2.9.bb                    |   1 +
 ...n-bypass-autoconf-2.69-version-check.patch |   2 +-
 ...{postgresql_13.2.bb => postgresql_13.3.bb} |   2 +-
 ...error-on-aarch64-with-binutils2.35.1.patch |  27 ----
 ...thook-crash-on-aarch64-with-binutils.patch |  47 +++++++
 .../recipes-devtools/uftrace/uftrace_0.9.4.bb |   2 +-
 meta-oe/recipes-extended/sysdig/sysdig_git.bb |   2 +
 .../libsdl/libsdl-1.2.15/CVE-2019-13616.patch |  27 ++++
 .../recipes-graphics/libsdl/libsdl_1.2.15.bb  |   1 +
 .../trace-cmd/trace-cmd_2.9.1.bb              |   2 +
 .../exiv2/exiv2/CVE-2021-29457.patch          |  26 ++++
 .../exiv2/exiv2/CVE-2021-29458.patch          |  37 ++++++
 .../exiv2/exiv2/CVE-2021-29463.patch          | 120 ++++++++++++++++++
 .../exiv2/exiv2/CVE-2021-29464.patch          |  72 +++++++++++
 .../exiv2/exiv2/CVE-2021-29470.patch          |  32 +++++
 .../exiv2/exiv2/CVE-2021-29473.patch          |  21 +++
 .../exiv2/exiv2/CVE-2021-3482.patch           |  54 ++++++++
 meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb |   9 +-
 .../recipes-support/opencv/opencv_4.5.2.bb    |   6 +
 ...rus_1.3.3.bb => python3-cerberus_1.3.4.bb} |   4 +-
 ...ngo_2.2.20.bb => python3-django_2.2.22.bb} |   4 +-
 ...-django_3.2.bb => python3-django_3.2.2.bb} |   4 +-
 ...go_3.11.3.bb => python3-pymongo_3.11.4.bb} |   2 +-
 ....bb => python3-rfc3339-validator_0.1.4.bb} |   2 +-
 ...0.1.bb => python3-robotframework_4.0.2.bb} |   2 +-
 28 files changed, 554 insertions(+), 43 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/libgtop/libgtop/0001-fix-compile-error-for-cross-compile.patch
 create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/0001-Prepare-for-CVE-2021-30004.patch.patch
 rename meta-oe/recipes-dbs/postgresql/{postgresql_13.2.bb => postgresql_13.3.bb} (78%)
 delete mode 100644 meta-oe/recipes-devtools/uftrace/uftrace/0001-Fix-error-on-aarch64-with-binutils2.35.1.patch
 create mode 100644 meta-oe/recipes-devtools/uftrace/uftrace/0001-aarch64-Fix-a-plthook-crash-on-aarch64-with-binutils.patch
 create mode 100644 meta-oe/recipes-graphics/libsdl/libsdl-1.2.15/CVE-2019-13616.patch
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29457.patch
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29458.patch
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29463.patch
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29464.patch
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29470.patch
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29473.patch
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-3482.patch
 rename meta-python/recipes-devtools/python/{python3-cerberus_1.3.3.bb => python3-cerberus_1.3.4.bb} (75%)
 rename meta-python/recipes-devtools/python/{python3-django_2.2.20.bb => python3-django_2.2.22.bb} (41%)
 rename meta-python/recipes-devtools/python/{python3-django_3.2.bb => python3-django_3.2.2.bb} (59%)
 rename meta-python/recipes-devtools/python/{python3-pymongo_3.11.3.bb => python3-pymongo_3.11.4.bb} (91%)
 rename meta-python/recipes-devtools/python/{python3-rfc3339-validator_0.1.3.bb => python3-rfc3339-validator_0.1.4.bb} (83%)
 rename meta-python/recipes-devtools/python/{python3-robotframework_4.0.1.bb => python3-robotframework_4.0.2.bb} (91%)

-- 
2.17.1

