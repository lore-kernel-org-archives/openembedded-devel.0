Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web10.25550.1613351616093428894
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 Feb 2021 17:13:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=X4OrNjyU;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id q20so3220184pfu.8
        for <openembedded-devel@lists.openembedded.org>; Sun, 14 Feb 2021 17:13:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id;
        bh=1UVDWe0wPYRGJEuP+Yp0TI4vK9CWgXsVNySqAE/bdgk=;
        b=X4OrNjyUyiw40cNfVIK1CxVco9+SdI1CAAOR6grzj8R88LdwVQwE+782inGrdf7+Is
         vVOfXLTTxEoyLNcQ6/b2e06/PYAFwarAixk9YuUMwWEVRMxZi9J5hBgvHrwFbrtVdHm+
         14V58KCUyAAvSEwKqx3mq25vwnWit34fiMW510D+k4FuAini78E+9RycVbr+T9TiM2ju
         eJX9e+k1bAfjZzKUH8fhs8D9HjhXcy10IQSjs69N2ZNwrpePtUS8sW2blZGqCJ6/bo0T
         6Lz2nzbhzdVZbWzSPVleecp4/4M+S5Sr4h3w7PFse5Tjw3TSOBc8nd5DLHcspGADK5SZ
         vIkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=1UVDWe0wPYRGJEuP+Yp0TI4vK9CWgXsVNySqAE/bdgk=;
        b=IAqbLRmkP8e+JCkJQvcl1Yc5fXyrCDjIXmKNV5NEkDVi/JX2QSgd8flM6bWvmHct3g
         dFxQUOMlVPNo1n7kvLQm3qKp6J8drmqsTURRE4cLqyeOZdZo2EP+RxT2VSLSoBbj9qzZ
         DNz+abMoQ45vt8ptK691jNu5OC2g7hYajH6SN8B1dHrOLPcIqKmdc6NSHs+3IENRzxZC
         Qx1W1s6gn49iT8vsz4tAc0cn7PS3uxX4ndabMlnM2eX5GWNVMUblnpP2d0485lC/purs
         gWFpxeiUUW0yVlZnc8YRGehdhS95GS57UA91ayAnNE59bXpRTh3SxVUYWNGUp3vRF678
         Hv4Q==
X-Gm-Message-State: AOAM530xaQXI7dXwZtT8+gUQm7sM8/+aNWyzm1eRK8a15gObwomH9AKG
	JZnuDcSJGwuMgA6GnCXNkuMyW51hplgVGg==
X-Google-Smtp-Source: ABdhPJzwtZ0ugnCg8mEktmjI4pwnnX39IwbrvvP6QkC6wd7EdmnE4Cyj4Hz9z3ZdFR5vRzya3fsC4g==
X-Received: by 2002:aa7:8758:0:b029:1ec:a12f:354 with SMTP id g24-20020aa787580000b02901eca12f0354mr1862463pfo.79.1613351615331;
        Sun, 14 Feb 2021 17:13:35 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:c8b8:7fc5:a225:bb8d])
        by smtp.gmail.com with ESMTPSA id t1sm16077998pfl.194.2021.02.14.17.13.33
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Feb 2021 17:13:34 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [gatesgarth 00/15] Patch review Feb 14th
Date: Sun, 14 Feb 2021 17:13:14 -0800
Message-Id: <cover.1613349480.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1

Next set for Gatesgarth.
Please have feedback by Tuesday.

The following changes since commit cef93b7b00e620d90a610112ee574fa60b691cf8:

  openldap: upgrade 2.4.56 -> 2.4.57 (2021-02-02 10:18:22 -0800)

are available in the Git repository at:

  git://git.openembedded.org/meta-openembedded-contrib stable/gatesgarth-nut
  http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=stable/gatesgarth-nut

Armin Kuster (1):
  lua: update to 5.3.6

Kai Kang (1):
  mariadb: add package config zstd

Khem Raj (5):
  mariadb: Fix build on 32bit arches with 64bit time_t
  gedit: Inherit python3targetconfig
  openipmi: Inherit python3targetconfig
  libplist: Inherit python3targetconfig
  postgresql: Inherit python3targetconfig

Mario Schuknecht (1):
  dnsmasq: Fix systemd service

Martin Jansa (1):
  wireguard-module: remove PKG assignment

Mingli Yu (1):
  mariadb: upgrade to 10.5.8

Qi.Chen@windriver.com (1):
  minifi-cpp: set PSEUDO_CONSIDER_PATHS

Shlomi Vaknin (1):
  python3-sh: remove python3-tests from RDEPENDS

Wang Mingyu (1):
  dnsmasq: upgrade 2.82 -> 2.84

akuster (1):
  enca: Fix SRC_URI

changqing.li@windriver.com (1):
  celt051: update SRC_URI

 .../recipes-gnome/gedit/gedit_3.36.2.bb       |  2 +-
 .../wireguard-module_1.0.20200908.bb          |  7 ----
 .../recipes-support/celt051/celt051_git.bb    |  2 +-
 .../recipes-support/dnsmasq/dnsmasq/lua.patch |  9 +++--
 .../recipes-support/dnsmasq/dnsmasq_2.82.bb   |  8 ----
 .../recipes-support/dnsmasq/dnsmasq_2.84.bb   |  8 ++++
 .../dnsmasq/files/dnsmasq-resolvconf.service  |  2 +-
 .../openipmi/openipmi_2.0.29.bb               |  2 +-
 ...ive_10.5.6.bb => mariadb-native_10.5.8.bb} |  0
 meta-oe/recipes-dbs/mysql/mariadb.inc         |  5 ++-
 ...fine-__NR_futex-if-it-does-not-exist.patch | 37 ++++++++++++++++++
 ...ktrace-t.c-make-the-test-conditional.patch | 38 +++++++++++++++++++
 .../mysql/mariadb/c11_atomics.patch           | 14 +++----
 .../{mariadb_10.5.6.bb => mariadb_10.5.8.bb}  |  0
 meta-oe/recipes-dbs/postgresql/postgresql.inc |  2 +-
 .../lua/{lua_5.3.5.bb => lua_5.3.6.bb}        |  6 +--
 .../libimobiledevice/libplist_2.2.0.bb        |  2 +-
 .../minifi-cpp/minifi-cpp_0.7.0.bb            |  1 +
 meta-oe/recipes-support/enca/enca_1.9.bb      |  7 ++--
 .../python/python3-sh_1.14.1.bb               |  1 -
 20 files changed, 112 insertions(+), 41 deletions(-)
 delete mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq_2.82.bb
 create mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq_2.84.bb
 rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.5.6.bb => mariadb-native_10.5.8.bb} (100%)
 create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/0001-innobase-Define-__NR_futex-if-it-does-not-exist.patch
 create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/0001-stacktrace-t.c-make-the-test-conditional.patch
 rename meta-oe/recipes-dbs/mysql/{mariadb_10.5.6.bb => mariadb_10.5.8.bb} (100%)
 rename meta-oe/recipes-devtools/lua/{lua_5.3.5.bb => lua_5.3.6.bb} (92%)

-- 
2.17.1

