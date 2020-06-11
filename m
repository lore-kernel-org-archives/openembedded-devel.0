Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com [209.85.216.67])
 by mx.groups.io with SMTP id smtpd.web12.8872.1591886313068775802
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Jun 2020 07:38:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JmttC5b0;
 spf=pass (domain: gmail.com, ip: 209.85.216.67, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f67.google.com with SMTP id i4so2454733pjd.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 11 Jun 2020 07:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TrgfirTgM2rSWzviD/KHMJlsdylin1cwOKIGpnxT2xg=;
        b=JmttC5b025enpLkYklcPruhrDuzcI5ePK5xrEDUptHKuyYiVdrUDYf7k7W3RG8xusm
         Pfy0IviIwey0ZZLpRdavhbDk/374OdQockbYCz4JkLnQUkeB+9Nt/7AxqVXJrpjTWNy1
         Q6CPj4CFDstw0A4RJv2aOobK4qpoL7uxT4/KxrmWLwqtWz02EXlu5fDFhPDQwBOWHAjz
         5g7dnOZ1fNp/3LKS9CSMDsjzylrrSP8Xf9Zl3Jj9L2z6mTMgReNPhbzZBgoLzCU0B3sk
         T24gg7NUXh/ISfH+XwiT21chlIxZpbhE9hs4iyL4vgyyLiVzmwCrXigS6rRg12STP+Hw
         1kXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TrgfirTgM2rSWzviD/KHMJlsdylin1cwOKIGpnxT2xg=;
        b=LSNM1aobmvlZ/+Fdtk5rK3ay9BWvxNYCFrexWIzHcgo4b7Z3QShdJySfbLBipGZ4US
         vaMsCjNUBTw9RkYz/++XPPYdXHoND1hDniXN/eXVSln5hdVaFQJM+T0fLllsvrNqXEEK
         jjiCjUwXWBbJvtZ7FMRiFeaqUrUZWzRTa60XHK0j4cq6fbHh+4q+UKFAcw3MnBxUhbd+
         u9otmJijT8Na2exYnEE94Cf18VxZvzqxqMe+wwuHOWJq2y7DVU9zDNyezzW08g+bfo9P
         2BzkMyVceaydwlgzFShDT2XepDCVBwzfOSsg+RYLc0a25bUHjXJuZHd6Be8a9HA+aVpb
         KWJw==
X-Gm-Message-State: AOAM532Mv2Egh3UcT+68ekMZOxfRAMhmckVWlbihN+cmjgedZVa1PGLg
	/nO2z9iZPsD3NHbhv7qfFlqQsGXE
X-Google-Smtp-Source: ABdhPJwhH63IiL7mEjH7GKNTh9sYc9XgKBqS0M6YC4w1OyAH+t93Xc5INUonTxH8CEwZr/twIhXOJw==
X-Received: by 2002:a17:902:6bcb:: with SMTP id m11mr7424536plt.126.1591886312010;
        Thu, 11 Jun 2020 07:38:32 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:8db7:61a4:bc7:9403])
        by smtp.gmail.com with ESMTPSA id l3sm2916033pgm.59.2020.06.11.07.38.31
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2020 07:38:31 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 00/27] Merge request #3
Date: Thu, 11 Jun 2020 07:38:00 -0700
Message-Id: <cover.1591886131.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Please merge these changes to dunfell
Cover letter only

The following changes since commit cc155826b0b4f202a8fa4ac103b7c38368d32734:

  thunar: upgrade 1.8.14 -> 1.8.15 (2020-05-28 21:50:13 -0700)

are available in the Git repository at:

  git://git.openembedded.org/meta-openembedded dunfell-next
  http://cgit.openembedded.org/meta-openembedded/log/?h=dunfell-next

Adrian Bunk (1):
  python3-docutils: Remove, moved to OE-core

Andreas Müller (1):
  fluidsynth: upgrade 2.1.2 -> 2.1.3

Denys Dmytriyenko (2):
  python3-pycryptodome(x): moved to OE-Core, remove from meta-python
  python3-pyelftools: moved to OE-Core, remove from meta-python

Domarys Correa (1):
  python3-pyyaml: Update 5.3 -> 5.3.1

Hongxu Jia (1):
  multipath-tools: fix compiling parallel issue

Kai Kang (1):
  plymouth: disable systemd-integration for sysvinit

Khem Raj (1):
  dfu-util-native: Remove DEPLOY_DIR_TOOLS from sstate-outputdirs

Konrad Weihmann (6):
  passwdqc: remove double modify operation
  sound-theme-freedesktop: remove double depends
  python3-cmd2: remove double colorama in RDEPENDS
  python3-smbus2: remove duplicate RDEPENDS settings
  python3-twisted: remove double var modification
  proftpd: Fix typo for SRC_URI[md5sum]

Leon Anavi (1):
  python3-colorama: Upgrade 0.4.1 -> 0.4.3

Maciej Pijanowski (1):
  qpdf: fix typo in RDEPENDS

Martin Jansa (2):
  irssi: package libirc_proxy.a in PN-staticdev
  meta-python: depend on core version 12 or higher

Patrick Williams (1):
  net-snmp: refresh patches

Zang Ruochen (4):
  libgphoto2: upgrade 2.5.24 -> 2.5.25
  mosquitto: upgrade 1.6.9 -> 1.6.10
  snort: upgrade 2.9.15 -> 2.9.16
  wireshark: upgrade 3.2.2 -> 3.2.4

Zheng Ruoqin (4):
  nano: upgrade 4.9.2 -> 4.9.3
  gsoap: upgrade 2.8.100 -> 2.8.103
  logwatch: upgrade 7.5.1 -> 7.5.3
  libnet-dns-perl: upgrade 1.23 -> 1.24

 .../fluidsynth/fluidsynth.inc                 |  4 +-
 ...tables-helper-we-have-to-use-native-.patch | 32 +++++++++----
 ...mosquitto_1.6.9.bb => mosquitto_1.6.10.bb} |  4 +-
 ...deck-for-gettid-API-during-configure.patch | 48 -------------------
 .../{snort_2.9.15.bb => snort_2.9.16.bb}      |  5 +-
 .../recipes-daemons/proftpd/proftpd_1.3.6.bb  |  2 +-
 ...upport-for-building-applications-and.patch | 24 +++++-----
 .../0001-config_os_headers-Error-Fix.patch    | 10 ++--
 ...t-snmp-fix-compile-error-disable-des.patch | 14 +++---
 ...add-knob-whether-nlist.h-are-checked.patch | 15 +++---
 ...{wireshark_3.2.2.bb => wireshark_3.2.4.bb} |  4 +-
 .../recipes-connectivity/irssi/irssi_1.2.2.bb |  2 +
 .../recipes-core/plymouth/plymouth_0.9.4.bb   |  2 +-
 .../{logwatch_7.5.1.bb => logwatch_7.5.3.bb}  |  4 +-
 ...gphoto2_2.5.24.bb => libgphoto2_2.5.25.bb} |  4 +-
 .../sound-theme-freedesktop_0.8.bb            |  2 +-
 meta-oe/recipes-printing/qpdf/qpdf_10.0.1.bb  |  2 +-
 .../passwdqc/passwdqc_1.3.1.bb                |  2 +-
 .../dfu-util/dfu-util-native_0.9.bb           |  1 -
 .../{gsoap_2.8.100.bb => gsoap_2.8.103.bb}    |  4 +-
 ...add-explicit-dependency-on-libraries.patch | 40 ++++++++++++++++
 .../multipath-tools/multipath-tools_0.8.4.bb  |  1 +
 .../nano/{nano_4.9.2.bb => nano_4.9.3.bb}     |  4 +-
 ...s-perl_1.23.bb => libnet-dns-perl_1.24.bb} |  4 +-
 meta-python/conf/layer.conf                   |  2 +-
 .../python/python-pycryptodome.inc            | 29 -----------
 .../python/python3-cmd2_0.9.23.bb             |  1 -
 ...ama_0.4.1.bb => python3-colorama_0.4.3.bb} |  4 +-
 .../python/python3-docutils_0.15.2.bb         | 15 ------
 .../python/python3-pycryptodome_3.9.4.bb      |  2 -
 .../python/python3-pycryptodomex_3.9.4.bb     | 10 ----
 .../python/python3-pyelftools_0.25.bb         | 14 ------
 .../python/python3-pyyaml_5.3.1.bb            | 18 +++++++
 .../python/python3-pyyaml_5.3.bb              | 19 --------
 .../python/python3-smbus2_0.3.0.bb            |  2 -
 .../python/python3-twisted_19.10.0.bb         |  4 +-
 36 files changed, 144 insertions(+), 210 deletions(-)
 rename meta-networking/recipes-connectivity/mosquitto/{mosquitto_1.6.9.bb => mosquitto_1.6.10.bb} (95%)
 delete mode 100644 meta-networking/recipes-connectivity/snort/snort/0001-chdeck-for-gettid-API-during-configure.patch
 rename meta-networking/recipes-connectivity/snort/{snort_2.9.15.bb => snort_2.9.16.bb} (95%)
 rename meta-networking/recipes-support/wireshark/{wireshark_3.2.2.bb => wireshark_3.2.4.bb} (95%)
 rename meta-oe/recipes-extended/logwatch/{logwatch_7.5.1.bb => logwatch_7.5.3.bb} (95%)
 rename meta-oe/recipes-graphics/gphoto2/{libgphoto2_2.5.24.bb => libgphoto2_2.5.25.bb} (91%)
 rename meta-oe/recipes-support/gsoap/{gsoap_2.8.100.bb => gsoap_2.8.103.bb} (89%)
 create mode 100644 meta-oe/recipes-support/multipath-tools/files/0001-add-explicit-dependency-on-libraries.patch
 rename meta-oe/recipes-support/nano/{nano_4.9.2.bb => nano_4.9.3.bb} (80%)
 rename meta-perl/recipes-perl/libnet/{libnet-dns-perl_1.23.bb => libnet-dns-perl_1.24.bb} (92%)
 delete mode 100644 meta-python/recipes-devtools/python/python-pycryptodome.inc
 rename meta-python/recipes-devtools/python/{python3-colorama_0.4.1.bb => python3-colorama_0.4.3.bb} (61%)
 delete mode 100644 meta-python/recipes-devtools/python/python3-docutils_0.15.2.bb
 delete mode 100644 meta-python/recipes-devtools/python/python3-pycryptodome_3.9.4.bb
 delete mode 100644 meta-python/recipes-devtools/python/python3-pycryptodomex_3.9.4.bb
 delete mode 100644 meta-python/recipes-devtools/python/python3-pyelftools_0.25.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-pyyaml_5.3.1.bb
 delete mode 100644 meta-python/recipes-devtools/python/python3-pyyaml_5.3.bb

-- 
2.17.1

