Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web11.5802.1596074725890177548
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Jul 2020 19:05:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DBJOlaQz;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id s15so4092071pgc.8
        for <openembedded-devel@lists.openembedded.org>; Wed, 29 Jul 2020 19:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Mqy5rGNiZHeDF/gJxd8mvrVrZ+pfXwmCN0f7c+uQIH4=;
        b=DBJOlaQznDi9+Wx07MPZtodikv4jfY+7CobgGZK6R2j8U+QmcvOVA9qrm0PFS7f/yI
         vwHNJ0VvpuJKOvKvzh3yrFFa2eGsQon6COSbKkG/BgVdL9xyS1TkeTGibIi+XncpL4xZ
         9ceEBdJI+x9VUq7Yg4NV0p5qpAIdKHzyt1vaXOxp5JoHeHhJctRwD0RjXUJoZVFZSKDE
         oC86r1jwXkOlx4nNN/c6pXdYABzcdZKSljcit7Qeb9b40JpfmiE409QZkVbETwgmqfMb
         PQymnDTJueRZhCKHd6yi66yUAzAXHWBtSocQRy8xccyWPZKS2hvFyXaF970ESjd3Vd9F
         CYUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Mqy5rGNiZHeDF/gJxd8mvrVrZ+pfXwmCN0f7c+uQIH4=;
        b=Du2OEGWCsInNxx+pRraArZnvom/O6SfW3eBvfuyFkkVWOZRIeHXTziucQDmNEWCkVb
         KbcMRt+vJa6zXsECM6MG5yqTHcz/FDtX9pxji4UDLQLdiny3rYoZbEgr6q3hH85j4LdM
         /OTKb9Vn9LTa3CDsb5Ex7i4CMTpT55YV81V42YAgUD135pKVkU3A1OhHGEmbSgMZ+zp3
         UTxODG8ZI2Ys04Yn8SsBF68b+BtjQXW3420Mkcq9ue9qLF+F8OYbQOt6DzBN3iBs2wE9
         gxFPJAxa+s4mdKexV+LAAAavUKjou1M3pxsQiRH83wTOeZNRLWbEc+D9elVko3Z6IEYV
         SC6g==
X-Gm-Message-State: AOAM531kDIfEupPh9qs4mkXaBodQcNGUMPlqxy1+HMvlZhRUkWRRAi9l
	iQUTtaTWR5EsEfv3f0CF3/oC3S+E
X-Google-Smtp-Source: ABdhPJx15Ws1MUpa/9HXDPkBBOtYDnviC3BSNhZMR0KievWcbmvLubEKQMqyr+QMSHJ0zFQeRtWJ7g==
X-Received: by 2002:a62:ac05:: with SMTP id v5mr982031pfe.8.1596074724984;
        Wed, 29 Jul 2020 19:05:24 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:78ea:3c50:1a71:2bae])
        by smtp.gmail.com with ESMTPSA id d29sm3807354pgb.54.2020.07.29.19.05.23
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2020 19:05:24 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 00/21] Dunfell pull request 4/29
Date: Wed, 29 Jul 2020 19:04:57 -0700
Message-Id: <cover.1596074628.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Cover letter only.

Please merge this into dunfell.

The following changes since commit cc6fc6b1641ab23089c1e3bba11e0c6394f0867c:

  ntp: update 4.2.8p15 (2020-07-01 08:01:41 -0700)

are available in the Git repository at:

  git://git.openembedded.org/meta-openembedded dunfell-next
  http://cgit.openembedded.org/meta-openembedded/log/?h=dunfell-next

Andreas Müller (3):
  blueman: upgrade 2.1.1 -> 2.1.3
  modemmanager: upgrade 1.12.10 -> 1.12.12
  ibus: upgrade 1.5.21 -> 1.5.22

Armin Kuster (4):
  net-snmp: Security fix CVE-2019-20892
  wireshark: Update to 3.2.5
  Revert "jsoncpp: upgrade 1.9.2 -> 1.9.3"
  jsoncpp: add PE do to revert to older PV

Bog999 (1):
  python3: Add python3-cryptography to RDEPENDS for python3-redis

Changqing Li (1):
  libmcrypt: set CLEANBROKEN

Khem Raj (1):
  nss: Remove mcpu to avoid march conflicts

Konrad Weihmann (1):
  openldap: packaging fixes

Ovidiu Panait (2):
  freediameter: Fix testcnx ptest failure
  nss: Fix CVE-2020-12399

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
 .../{jsoncpp_1.9.3.bb => jsoncpp_1.9.2.bb}    |   4 +-
 meta-oe/recipes-extended/mraa/mraa_git.bb     |   2 +-
 meta-oe/recipes-extended/upm/upm_git.bb       |   4 +
 .../minicoredumper/minicoredumper_2.0.1.bb    |   2 +-
 .../multipath-tools/multipath-tools_0.8.4.bb  |   1 +
 ...e-a-fixed-length-for-DSA-exponentiat.patch | 110 +++
 meta-oe/recipes-support/nss/nss_3.51.1.bb     |   5 +
 .../openldap/openldap_2.4.50.bb               |   4 +-
 .../python/python3-redis_2.10.6.bb            |   1 +
 22 files changed, 1013 insertions(+), 17 deletions(-)
 rename meta-networking/recipes-connectivity/blueman/{blueman_2.1.1.bb => blueman_2.1.3.bb} (94%)
 rename meta-networking/recipes-filter/nftables/{nftables_0.9.5.bb => nftables_0.9.6.bb} (93%)
 create mode 100644 meta-networking/recipes-protocols/freediameter/files/0001-Fix-testcnx-expired-CA-data.patch
 create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/CVE-2019-20892.patch
 rename meta-networking/recipes-support/wireshark/{wireshark_3.2.4.bb => wireshark_3.2.5.bb} (95%)
 rename meta-oe/recipes-connectivity/modemmanager/{modemmanager_1.12.10.bb => modemmanager_1.12.12.bb} (93%)
 rename meta-oe/recipes-devtools/jsoncpp/{jsoncpp_1.9.3.bb => jsoncpp_1.9.2.bb} (92%)
 create mode 100644 meta-oe/recipes-support/nss/nss/0001-Bug-1631576-Force-a-fixed-length-for-DSA-exponentiat.patch

-- 
2.17.1

