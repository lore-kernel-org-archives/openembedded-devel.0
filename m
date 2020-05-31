Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
 by mx.groups.io with SMTP id smtpd.web11.18012.1590941788440783051
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 31 May 2020 09:16:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WRQj15Ni;
 spf=pass (domain: gmail.com, ip: 209.85.210.195, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f195.google.com with SMTP id a127so269950pfa.12
        for <openembedded-devel@lists.openembedded.org>; Sun, 31 May 2020 09:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vzp6yZJj66iLMlb4tOJxia1bm+NcOQe+/xNwbstksOA=;
        b=WRQj15Niy20ABsXeg/z5Vk0dy76dwZKJrIPZIcRMVyB+yBshy8pwPhqfRXC+F9sG0e
         X/fwwu/JH5TRI93vVsHvrzsI67m4FNs10WXkPp5UBGGlm1q/upydz9OwzzE5VSai/Ish
         ALfmLZAPb+6gDujYh5bOelxE1qXjMMHLre91fcG/rAlGINA8hw7Iv0fAGBvI4N3u4qvH
         ckrI8KlqCerYPPZrsBoZqfWyUWCRvYnGQC79TuQAFHgsg/sngh34fRCjj6gJLgUy5kPy
         HNzjElKCpMlDKMEv9SMBRphOolX4vUSOuUtdFDkIl3ESU0pZuxbOnHBe7r9X/iqxBf6V
         lhHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vzp6yZJj66iLMlb4tOJxia1bm+NcOQe+/xNwbstksOA=;
        b=pz5EZxvLMHBiBksqcgJekvHgSNn8Bh5p+kV8SlIVvVjp1/ZMvuRfTFb/I3BVVAf1+V
         aTYwptuUgxa0HoCT9yXFNN/8v3Pja1uM+rInXgdu8sqRmgnoAZqC+NrB0ClkQElqWXxG
         tl8ii9J6cxHCQPtSi+wnyn+6uVOx4+xEGzXG2wKqxvm5+PJbS2OwGzgl71AYt4oC+FCZ
         /8vMc5gMh7FJ3GIU6ZF6KD9TN2BOWn8ngLXaYHh0FfdMon6elZ+llrKF8dq4FoO5PBge
         lPinZfmOgBCCBrUvEnq32XLrRvDHox1soza16PN3wyWXu3ANwX4Ob1IgGGR10UQJ0hHh
         jPyQ==
X-Gm-Message-State: AOAM531GIdTZni1J7JYTBHufVnlOHkMDJp13udJe6NQCOVr3EPRdfVQS
	ZuoZITgZwFF3357ONlM2orvVuPH7
X-Google-Smtp-Source: ABdhPJzGkdYrb68yT7aBQp5LAp5kQcJXr2NdWDadX8zxKYt9oSvjvbdlYqnRCdR2vdt2zVmXAEvkig==
X-Received: by 2002:a63:6dc7:: with SMTP id i190mr15898374pgc.171.1590941787037;
        Sun, 31 May 2020 09:16:27 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:936:376a:3aad:6139])
        by smtp.gmail.com with ESMTPSA id b16sm9188871pfd.111.2020.05.31.09.16.25
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 09:16:26 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 00/35] Patch review
Date: Sun, 31 May 2020 09:15:47 -0700
Message-Id: <cover.1590941673.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Please review this next series of changes and have feedback by Wednesday.


The following changes since commit e413c1ef621688e69bb7830bb3151ed23b30b73e:

  samba: upgrade 4.10.13 -> 4.10.15 (2020-05-20 16:50:45 +0000)

are available in the Git repository at:

  git://git.openembedded.org/meta-openembedded-contrib stable/dunfell-nut
  http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=stable/dunfell-nut

Adrian Bunk (2):
  unicode-ucd: Stop broken license downloading
  postfix: Upgrade 3.4.10 -> 3.4.12

Andreas Müller (2):
  gexiv2: upgrade 0.12.0 -> 0.12.1
  thunar: upgrade 1.8.14 -> 1.8.15

Andrew Geissler (1):
  nlohmann-json: backport gcc10 fix

Armin Kuster (1):
  tremor: update SRC_URI as project moved to gitlab

Christoph Steiger (1):
  python-periphery: Add python-mmap to RDEPENDS

Domarys Correa (1):
  python3-jinja2: Update 2.11.1 -> 2.11.2

Kai Kang (3):
  xfconf: 4.14.2 -> 4.14.3
  thunar: 1.8.12 -> 1.8.14
  catfish: 1.4.11 -> 1.4.13

Khem Raj (4):
  netplan: Depend on systemd if it is in distro
  uim: Add patch to fix -fno-common link error
  postfix: Upgrade to 3.4.10 and compile with -fcommon
  safec: Update to latest on 3.5.1 release tags

Leon Anavi (5):
  python3-gmqtt: Upgrade to 0.6.5
  python3-appdirs: Upgrade to 1.4.4
  python3-pandas: Upgrade 1.0.1 -> 1.0.3
  python3-parallax: Upgrade 1.0.5 -> 1.0.6
  python3-openpyxl: Upgrade 2.6.3 -> 3.0.3

Pierre-Jean Texier (3):
  librsync: upgrade 2.3.0 -> 2.3.1
  ser2net: fix upstream check URL
  ser2net: upgrade 4.1.5 -> 4.1.8

Trevor Gamblin (1):
  python3-iso8601: add python3-numbers to RDEPENDS

Wang Mingyu (4):
  jansson: upgrade 2.12 -> 2.13.1
  openldap: upgrade 2.4.49 -> 2.4.50
  python3-pycparser: upgrade 2.19 -> 2.20
  cryptsetup: upgrade 2.3.1 -> 2.3.2

Yanfei Xu (1):
  turbostat: fix the build failure for new v5.7-rc6 kernel

Yi Zhao (1):
  apache2: create log/run directory via pkg_postinst

Zang Ruochen (2):
  dnsmasq: upgrade 2.80 -> 2.81
  fetchmail: upgrade 6.4.3 -> 6.4.4

Zheng Ruoqin (3):
  dstat: Fix runtime error that depend python.
  kea: upgrade 1.7.6 -> 1.7.7
  libqmi: upgrade 1.24.8 -> 1.24.12

 .../{gexiv2_0.12.0.bb => gexiv2_0.12.1.bb}    |  4 +-
 .../tremor/tremor_20180319.bb                 |  2 +-
 .../kea/{kea_1.7.6.bb => kea_1.7.7.bb}        |  4 +-
 .../netplan/netplan_0.98.bb                   |  3 +-
 ...ure-with-glibc-2.30-due-to-dropped-R.patch | 37 -------
 .../{postfix_3.4.8.bb => postfix_3.4.12.bb}   |  5 +-
 ...nsmasq-fix-build-against-5.2-headers.patch | 31 ------
 ...-dnsmasq-fix-memory-leak-in-helper-c.patch | 49 ---------
 .../recipes-support/dnsmasq/dnsmasq_2.80.bb   | 10 --
 .../recipes-support/dnsmasq/dnsmasq_2.81.bb   |  8 ++
 ...{fetchmail_6.4.3.bb => fetchmail_6.4.4.bb} |  4 +-
 .../{libqmi_1.24.8.bb => libqmi_1.24.12.bb}   |  3 +-
 .../{ser2net_4.1.5.bb => ser2net_4.1.8.bb}    |  5 +-
 ...r-Use-_ISOC11_SOURCE-only-with-glibc.patch | 30 ------
 .../safec/{safec_3.5.bb => safec_3.5.1.bb}    |  8 +-
 ...ryptsetup_2.3.1.bb => cryptsetup_2.3.2.bb} |  4 +-
 ...latize-basic_json-ctor-from-json_ref.patch | 99 +++++++++++++++++++
 .../nlohmann-json/0001-typo-fix.patch         | 43 ++++++++
 .../nlohmann-json/nlohmann-json_3.7.3.bb      |  5 +-
 .../{jansson_2.12.bb => jansson_2.13.1.bb}    |  6 +-
 .../recipes-kernel/turbostat/turbostat_3.4.bb | 20 +++-
 .../dstat/0001-change-dstat-to-python3.patch  | 89 +++++++++++++++++
 meta-oe/recipes-support/dstat/dstat_0.7.4.bb  |  4 +-
 .../{librsync_2.3.0.bb => librsync_2.3.1.bb}  |  2 +-
 ...{openldap_2.4.49.bb => openldap_2.4.50.bb} |  4 +-
 .../uim/uim/JMP_BUF_GC_jmp_buf.patch          | 15 +++
 meta-oe/recipes-support/uim/uim_1.8.8.bb      |  1 +
 .../unicode-ucd/files/license.html            | 98 ++++++++++++++++++
 .../unicode-ucd/unicode-ucd_12.1.0.bb         |  7 +-
 .../python/python-iso8601.inc                 |  1 +
 .../python/python-periphery.inc               |  2 +
 ...dirs_1.4.3.bb => python3-appdirs_1.4.4.bb} |  4 +-
 ...-gmqtt_0.6.2.bb => python3-gmqtt_0.6.5.bb} |  4 +-
 .../python/python3-jinja2_2.11.1.bb           |  4 -
 ...on-jinja2.inc => python3-jinja2_2.11.2.bb} | 40 +++++---
 ...yxl_2.6.3.bb => python3-openpyxl_3.0.3.bb} |  6 +-
 .../python/python3-pandas_1.0.1.bb            |  2 -
 ...hon-pandas.inc => python3-pandas_1.0.3.bb} |  6 +-
 ...lax_1.0.5.bb => python3-parallax_1.0.6.bb} |  4 +-
 ...rser_2.19.bb => python3-pycparser_2.20.bb} |  4 +-
 .../recipes-httpd/apache2/apache2_2.4.43.bb   | 18 ++++
 .../apache2/files/apache2-volatile.conf       |  2 +
 .../apache2/files/apache2.service             |  4 -
 .../recipes-httpd/apache2/files/init          |  5 -
 .../apache2/files/volatiles.04_apache2        |  3 +
 .../{catfish_1.4.11.bb => catfish_1.4.13.bb}  |  4 +-
 .../{thunar_1.8.12.bb => thunar_1.8.15.bb}    |  4 +-
 .../{xfconf_4.14.2.bb => xfconf_4.14.3.bb}    |  4 +-
 48 files changed, 475 insertions(+), 246 deletions(-)
 rename meta-gnome/recipes-gnome/gexiv2/{gexiv2_0.12.0.bb => gexiv2_0.12.1.bb} (69%)
 rename meta-networking/recipes-connectivity/kea/{kea_1.7.6.bb => kea_1.7.7.bb} (94%)
 delete mode 100644 meta-networking/recipes-daemons/postfix/files/0001-Fixed-build-failure-with-glibc-2.30-due-to-dropped-R.patch
 rename meta-networking/recipes-daemons/postfix/{postfix_3.4.8.bb => postfix_3.4.12.bb} (75%)
 delete mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq/0001-dnsmasq-fix-build-against-5.2-headers.patch
 delete mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq/0001-dnsmasq-fix-memory-leak-in-helper-c.patch
 delete mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq_2.80.bb
 create mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq_2.81.bb
 rename meta-networking/recipes-support/fetchmail/{fetchmail_6.4.3.bb => fetchmail_6.4.4.bb} (86%)
 rename meta-oe/recipes-connectivity/libqmi/{libqmi_1.24.8.bb => libqmi_1.24.12.bb} (85%)
 rename meta-oe/recipes-connectivity/ser2net/{ser2net_4.1.5.bb => ser2net_4.1.8.bb} (69%)
 delete mode 100644 meta-oe/recipes-core/safec/safec/0001-memrchr-Use-_ISOC11_SOURCE-only-with-glibc.patch
 rename meta-oe/recipes-core/safec/{safec_3.5.bb => safec_3.5.1.bb} (59%)
 rename meta-oe/recipes-crypto/cryptsetup/{cryptsetup_2.3.1.bb => cryptsetup_2.3.2.bb} (96%)
 create mode 100644 meta-oe/recipes-devtools/nlohmann-json/nlohmann-json/0001-Templatize-basic_json-ctor-from-json_ref.patch
 create mode 100644 meta-oe/recipes-devtools/nlohmann-json/nlohmann-json/0001-typo-fix.patch
 rename meta-oe/recipes-extended/jansson/{jansson_2.12.bb => jansson_2.13.1.bb} (60%)
 create mode 100644 meta-oe/recipes-support/dstat/dstat/0001-change-dstat-to-python3.patch
 rename meta-oe/recipes-support/librsync/{librsync_2.3.0.bb => librsync_2.3.1.bb} (88%)
 rename meta-oe/recipes-support/openldap/{openldap_2.4.49.bb => openldap_2.4.50.bb} (98%)
 create mode 100644 meta-oe/recipes-support/uim/uim/JMP_BUF_GC_jmp_buf.patch
 create mode 100644 meta-oe/recipes-support/unicode-ucd/files/license.html
 rename meta-python/recipes-devtools/python/{python3-appdirs_1.4.3.bb => python3-appdirs_1.4.4.bb} (75%)
 rename meta-python/recipes-devtools/python/{python3-gmqtt_0.6.2.bb => python3-gmqtt_0.6.5.bb} (74%)
 delete mode 100644 meta-python/recipes-devtools/python/python3-jinja2_2.11.1.bb
 rename meta-python/recipes-devtools/python/{python-jinja2.inc => python3-jinja2_2.11.2.bb} (44%)
 rename meta-python/recipes-devtools/python/{python3-openpyxl_2.6.3.bb => python3-openpyxl_3.0.3.bb} (70%)
 delete mode 100644 meta-python/recipes-devtools/python/python3-pandas_1.0.1.bb
 rename meta-python/recipes-devtools/python/{python-pandas.inc => python3-pandas_1.0.3.bb} (78%)
 rename meta-python/recipes-devtools/python/{python3-parallax_1.0.5.bb => python3-parallax_1.0.6.bb} (72%)
 rename meta-python/recipes-devtools/python/{python3-pycparser_2.19.bb => python3-pycparser_2.20.bb} (74%)
 create mode 100644 meta-webserver/recipes-httpd/apache2/files/apache2-volatile.conf
 create mode 100644 meta-webserver/recipes-httpd/apache2/files/volatiles.04_apache2
 rename meta-xfce/recipes-apps/catfish/{catfish_1.4.11.bb => catfish_1.4.13.bb} (72%)
 rename meta-xfce/recipes-xfce/thunar/{thunar_1.8.12.bb => thunar_1.8.15.bb} (84%)
 rename meta-xfce/recipes-xfce/xfconf/{xfconf_4.14.2.bb => xfconf_4.14.3.bb} (83%)

-- 
2.17.1

