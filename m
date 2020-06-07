Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
 by mx.groups.io with SMTP id smtpd.web12.1290.1591500282284857872
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Jun 2020 20:24:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pCBCJYEK;
 spf=pass (domain: gmail.com, ip: 209.85.214.196, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f196.google.com with SMTP id x11so5281245plv.9
        for <openembedded-devel@lists.openembedded.org>; Sat, 06 Jun 2020 20:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qR2lGKmXbQTucutfPo4YClgBm3xPXZcqWbh0wskUyVw=;
        b=pCBCJYEKFkuN35DaOELwk1Vv+prqSVn5M6UAGVUhUvAQJKAY0DiNRQ+PAS6AvcILAn
         cK5X3cvsA041+juT22d5d3jraIJCG8zRvjK68yRcnRqydZvO/TTrfyXq7ICya1nDQP3o
         MkvDOM0vs+jEVnBXUkS7rU1EMfUqTidQDQ0FzgJlSq5EHRE0J/LdD02yJa//Y53O9jch
         LUQg0Eb4yN67x+mG2dNEgTES3ZiMNnfGNqYEk3tYs8AxyfGFodyEFuHKzCRGqThkIonS
         vM+/zECTj27sxTsS4hHdEZKiJLr3H7QaCaocpE9DNLQAzGoHqyYr28lxmHdhpMAT81Wr
         x5ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qR2lGKmXbQTucutfPo4YClgBm3xPXZcqWbh0wskUyVw=;
        b=IfPJbhKMWqaHqoL6kUDvQZl20jr3+at33onu0z0xEqaaF+T9Ti0he/q/PKlWo8pA+O
         InvSJYzHrHoZP219pbPBcsE7c+H7IvADaA0UaBOiANz4VLv/LaBfVzUhLyJo5aJhWSIA
         aX95FzmvM5PF76qGR4A4KF9ioBqS/i9rG4UeOrPamHY4+J7UsViD+hWRlWQvkXmCD1De
         b3rhiuMmMjthPOzrbl3y6WBEJk7Q90mWYjaQIRbxAuPB1h3F/BaMOk8jlnnIVFVvCDe6
         vY76NYLsr4yomePtG4n3pFJG2ru+tnBdPEbm5CHtclfKZOx4Aqpb8xkuf7mJH0/en06R
         vlwg==
X-Gm-Message-State: AOAM531eL/u/9PncgjQZqc+UKusnrsVt0P3dH8E6hqUMNGUi2skrc/a7
	UNtVfM8CsDj7iwF+nqz8yRLLSMlG
X-Google-Smtp-Source: ABdhPJxeFlmnN3K9cRwX9sWcFZMbneGD39QLEmo5t6Ue/YgXPCJnoIQjUSMGSPcVd87BaS62VNsGEg==
X-Received: by 2002:a17:90a:4805:: with SMTP id a5mr11476900pjh.22.1591500281235;
        Sat, 06 Jun 2020 20:24:41 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:590a:7b35:9222:2f9])
        by smtp.gmail.com with ESMTPSA id m7sm3372463pfb.1.2020.06.06.20.24.39
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2020 20:24:40 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 00/26] Patch review
Date: Sat,  6 Jun 2020 20:24:10 -0700
Message-Id: <cover.1591500139.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Next set of changes for Dunfell. Please review and have comments back by Tuesday.

This includes the three python3 changes need to match Core.

The following changes since commit cc155826b0b4f202a8fa4ac103b7c38368d32734:

  thunar: upgrade 1.8.14 -> 1.8.15 (2020-05-28 21:50:13 -0700)

are available in the Git repository at:

  git://git.openembedded.org/meta-openembedded-contrib stable/dunfell-nut
  http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=stable/dunfell-nut

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
 .../python/python3-pycryptodome_3.9.4.bb      |  2 -
 .../python/python3-pycryptodomex_3.9.4.bb     | 10 ----
 .../python/python3-pyelftools_0.25.bb         | 14 ------
 .../python/python3-pyyaml_5.3.1.bb            | 18 +++++++
 .../python/python3-pyyaml_5.3.bb              | 19 --------
 .../python/python3-smbus2_0.3.0.bb            |  2 -
 .../python/python3-twisted_19.10.0.bb         |  4 +-
 35 files changed, 144 insertions(+), 195 deletions(-)
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
 delete mode 100644 meta-python/recipes-devtools/python/python3-pycryptodome_3.9.4.bb
 delete mode 100644 meta-python/recipes-devtools/python/python3-pycryptodomex_3.9.4.bb
 delete mode 100644 meta-python/recipes-devtools/python/python3-pyelftools_0.25.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-pyyaml_5.3.1.bb
 delete mode 100644 meta-python/recipes-devtools/python/python3-pyyaml_5.3.bb

-- 
2.17.1

