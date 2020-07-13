Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web12.11812.1594608979096670163
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Jul 2020 19:56:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=br1GYstg;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id u185so5388683pfu.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 12 Jul 2020 19:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rbViW9/y2s9vsyvPoG2QGDe+WrWC/hzmzM0874B25dQ=;
        b=br1GYstgDz6bgB2qXi8QGWg932Y9NJfFGDuOjluULVOz857MeApQMmExd/3+SUki8s
         QA4Q/fjQpDqrvBxNZhkSuRBkb3wOMlLef4he1LHRJInlIxEisUyRu53LcXbgPHsXh3wG
         P4h0UbSE1oKqAh88tANd19NLGTtUP5lOqRUOG5yo4UjoMEx4EMghvnmBis/8vsUXwG8j
         50rWi0atO9xw0jw1B0zOyR8DeguJJb0K1GuCa1xOOKw8j63hmzzp4ZlvMv5TbesvR/jl
         QCy8WunLEo7gHEF4N9k+GooP+FltDwqpb9dCJ/o2bFdfjxpHXmDTGkd3CSH1UIYlfb/p
         FiAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rbViW9/y2s9vsyvPoG2QGDe+WrWC/hzmzM0874B25dQ=;
        b=p1PXGLK4s6FlORm4ckV7rXowbBKo9oxRSOnbHPhnnIn4Mhe0SvWrDOMsLHBvrdJ/Ca
         b6wa1VeVLHrNHsz7QIyoa/hHeHEwVuD1ADrS/ZRxldt++1NQd2LVitZs8lONLIiBjOna
         zvwnXcJfYvsTBPdWsT67dPYc1HDcun1sio+3d/ura7LxNZiU89iuudNDJr6oHMC1YHIN
         tUEeaUywoqpPkouvRv5vsAsSwElyMlRx2sv8Dw6/25pAcEjdCJ5tbWBWXBr0ky/wCCqz
         3KS6IAlzFJ7xBriwO8XCD6PY2SVDKxiH6fKHTdHq0ycDxMTSZLENO6I6G9+gQRJmu+5u
         BeKA==
X-Gm-Message-State: AOAM530EashRg/OfjuL8zaR/MQjNGlapOB1i6WPF9L3BRawzNV0aCwQm
	7+/09y3sse15Kx33ik2kcU08wl9XxlE=
X-Google-Smtp-Source: ABdhPJxsLBekX42hdwMc+8l0nWidCRc2gDJqp0fjyWOBBVRTaxAt3DJfTMFqqJWmlUaOC9OKkyGIcw==
X-Received: by 2002:a62:5e83:: with SMTP id s125mr30181483pfb.197.1594608978167;
        Sun, 12 Jul 2020 19:56:18 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:e013:ddd8:d9b9:dad6])
        by smtp.gmail.com with ESMTPSA id u19sm13687976pfk.98.2020.07.12.19.56.16
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2020 19:56:17 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 00/18] Patch review
Date: Sun, 12 Jul 2020 19:55:56 -0700
Message-Id: <cover.1594608813.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Please have comments back by Wednesday.

The following changes since commit cc6fc6b1641ab23089c1e3bba11e0c6394f0867c:

  ntp: update 4.2.8p15 (2020-07-01 08:01:41 -0700)

are available in the Git repository at:

  git://git.openembedded.org/meta-openembedded-contrib stable/dunfell-nut
  http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=stable/dunfell-nut

Andreas Müller (3):
  blueman: upgrade 2.1.1 -> 2.1.3
  modemmanager: upgrade 1.12.10 -> 1.12.12
  ibus: upgrade 1.5.21 -> 1.5.22

Armin Kuster (2):
  net-snmp: Security fix CVE-2019-20892
  wireshark: Update to 3.2.5

Bog999 (1):
  python3: Add python3-cryptography to RDEPENDS for python3-redis

Changqing Li (1):
  libmcrypt: set CLEANBROKEN

Khem Raj (1):
  nss: Remove mcpu to avoid march conflicts

Konrad Weihmann (1):
  openldap: packaging fixes

Ovidiu Panait (1):
  freediameter: Fix testcnx ptest failure

Pierre-Jean Texier (1):
  minicoredumper: update SRC_URI to use github instead

Qi.Chen@windriver.com (1):
  multipath-tools: disable parallel build as a workaround

Robert Yang (1):
  drbd-utils: Add CLEANBROKEN to fix rebuild errors

Zang Ruochen (1):
  nftables: upgrade 0.9.5 -> 0.9.6

Zheng Ruoqin (4):
  Fix build error when enable multilib.
  mraa: Disable python2, otherwise, there is a build error when enable
    multilib.
  paho-mqtt-c: Fix build error when enable multilib.
  upm:Fix build error when enable multilib.

 .../tracker/tracker-miners_2.3.3.bb           |   4 +
 meta-gnome/recipes-support/ibus/ibus.inc      |   4 +-
 .../{blueman_2.1.1.bb => blueman_2.1.3.bb}    |   3 +-
 .../{nftables_0.9.5.bb => nftables_0.9.6.bb}  |   2 +-
 .../0001-Fix-testcnx-expired-CA-data.patch    | 746 ++++++++++++++++++
 .../freediameter/freediameter_1.3.2.bb        |   1 +
 .../net-snmp/net-snmp/CVE-2019-20892.patch    | 118 +++
 .../net-snmp/net-snmp_5.8.bb                  |   1 +
 .../recipes-support/drbd/drbd-utils_9.12.0.bb |   2 +
 ...{wireshark_3.2.4.bb => wireshark_3.2.5.bb} |   3 +-
 ...ger_1.12.10.bb => modemmanager_1.12.12.bb} |   7 +-
 .../paho-mqtt-c/paho-mqtt-c_1.3.2.bb          |   4 +
 .../libmcrypt/libmcrypt_2.5.8.bb              |   2 +
 meta-oe/recipes-extended/mraa/mraa_git.bb     |   2 +-
 meta-oe/recipes-extended/upm/upm_git.bb       |   4 +
 .../minicoredumper/minicoredumper_2.0.1.bb    |   2 +-
 .../multipath-tools/multipath-tools_0.8.4.bb  |   1 +
 meta-oe/recipes-support/nss/nss_3.51.1.bb     |   4 +
 .../openldap/openldap_2.4.50.bb               |   4 +-
 .../python/python3-redis_2.10.6.bb            |   1 +
 20 files changed, 899 insertions(+), 16 deletions(-)
 rename meta-networking/recipes-connectivity/blueman/{blueman_2.1.1.bb => blueman_2.1.3.bb} (94%)
 rename meta-networking/recipes-filter/nftables/{nftables_0.9.5.bb => nftables_0.9.6.bb} (93%)
 create mode 100644 meta-networking/recipes-protocols/freediameter/files/0001-Fix-testcnx-expired-CA-data.patch
 create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/CVE-2019-20892.patch
 rename meta-networking/recipes-support/wireshark/{wireshark_3.2.4.bb => wireshark_3.2.5.bb} (95%)
 rename meta-oe/recipes-connectivity/modemmanager/{modemmanager_1.12.10.bb => modemmanager_1.12.12.bb} (93%)

-- 
2.17.1

