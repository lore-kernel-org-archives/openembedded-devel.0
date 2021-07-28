Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web08.684.1627446190826215669
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Jul 2021 21:23:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iQdm/BDK;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id mt6so3281733pjb.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jul 2021 21:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=IZ9EpPJ6RD6HJIjCWoKsW3mhH+zHPgRUrk7eYrUJjWw=;
        b=iQdm/BDKOMntrGi6c7PxPsauYX9USG+3w8MDvXNokImwDXzNGolS/bz+d2c+YYVqbQ
         +CrQirzuuQ6N149QtATY1TYo4PgQFN9cqh8z76Cpd+NlSemgKrQXFVh/+Fbe5XOXYbGc
         y0cOvT6NcZZ7TzN+/zyfDd4XMtgbNPgwbrLxMdoMZasjaE2I7fI3SHzEGFRqk5o2wU95
         JvHUKKiOZb5ZwzPun4ZoSUR4gppxesSgvAaGRwIKDpnItsUaKgu4EbcobcoON3dZkt00
         aWGXbB80Gl5sJLQbzIHIGHouyJkS7cIzLF44D3YAIYHVo9/qFFj8Sw0jlqSjVAHitJNQ
         FDmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:message-id:date:user-agent
         :mime-version:content-transfer-encoding:content-language;
        bh=IZ9EpPJ6RD6HJIjCWoKsW3mhH+zHPgRUrk7eYrUJjWw=;
        b=NepUrMeBrfaia7wIhra5Cf1josaS0c/EJRql4pPccdho+cECX8PsrEteYwWYUv6uob
         dT1hUTrm0Ciuj7fwBucTtt3MYYoUL5aSnaRoTien7OXRILXZQHgjzVku9Cby7N0uEzF2
         hyc50zGwvzE6kapa3ba/zHSYzn3omQcPX3mQ5lWYTnSKlH9Xza6/On/KN/LhWR8Bmz5w
         LQs/h9Yt4YZRDXPPBwuQk0L4JOR5JfwQX4fjn684Z7ri4WqC0QBUnOFAXqAUJr0iuQnd
         X8vDb4wRYHVYvmwYckCzfkGK9B9IK1Mqrku2AgD9Mg55mKSlFbVxwtlifmVX7wO5nxus
         9ZjQ==
X-Gm-Message-State: AOAM533oSFB8AzM1S64iDyor91fihg8R+DaQDXjUnIBSXA0A1pBOu1wp
	UxDJKdR8v7j43pu2JjYIhUE=
X-Google-Smtp-Source: ABdhPJzo21K6Xi1Pl66nJ7b3FUyDLKSKfzBnpcEuM8FDyG5XFGbHdV51L6Zw4pOiODpZuXKLYRdmVg==
X-Received: by 2002:aa7:980a:0:b029:358:adf9:c37b with SMTP id e10-20020aa7980a0000b0290358adf9c37bmr26227857pfl.12.1627446190070;
        Tue, 27 Jul 2021 21:23:10 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:cbf5:d7b8:4de2:e344? ([2601:202:4180:a5c0:cbf5:d7b8:4de2:e344])
        by smtp.gmail.com with ESMTPSA id f16sm6056541pgb.51.2021.07.27.21.23.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jul 2021 21:23:09 -0700 (PDT)
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
 Khem Raj <raj.khem@gmail.com>
From: "Armin Kuster" <akuster808@gmail.com>
Subject: dunfell merge request July 27th
Message-ID: <57336956-c478-d82a-7595-7f62190db4b7@gmail.com>
Date: Tue, 27 Jul 2021 21:23:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

The following changes since commit 7bd47ef6c98323c95a9e527129dca98c9a65ee08:

  dovecot: add CVE-2016-4983 to allowlist (2021-07-06 07:50:13 -0700)

are available in the Git repository at:

  https://git.openembedded.org/meta-openembedded dunfell-next

for you to fetch changes up to 85f8047c71047d93cf79a954142157f85079968d:

  php: Upgrade to 7.4.16 (2021-07-26 16:05:08 -0700)

----------------------------------------------------------------
Adrian Zaharia (1):
      ntp: fix ntpdate to wait for subprocesses

Armin Kuster (3):
      mariadb: update to 10.4.20
      hiawatha: fix url.
      wireshark: update to 3.2.15

Armin kuster (1):
      postgresql: update to 12.7

Bruce Ashfield (1):
      vboxguestdrivers: fix build against kernel v5.10+

Changqing Li (2):
      nginx: fix CVE-2021-23017
      php: allow php as empty

Diego Santa Cruz (1):
      php: split out phpdbg into a separate package

Gianfranco (5):
      vboxguestdrivers: upgrade 6.1.16 -> 6.1.18
      vboxguestdrivers: Add patch proposed upstream to fix a build
failure on i386
      vboxguestdrivers: upgrade 6.1.18 -> 6.1.20
      vboxguestdrivers: upgrade 6.1.20 -> 6.1.22
      vboxguestdrivers: add a fix for build failure with kernel 5.13

Gianfranco Costamagna (3):
      vboxguestdrivers: upgrade 6.1.6 -> 6.1.12
      vboxguestdrivers: upgrade 6.1.12 -> 6.1.14 Drop kernel 5.8
compatibility patch, now part of upstream codebase
      vboxguestdrivers: upgrade 6.1.14 -> 6.1.16

Hongxu Jia (1):
      vboxguestdrivers: fix failed to compile with kernel 5.8.0

Jate Sujjavanich (1):
      ufw: backport patches, update RRECOMMENDS, python3 support, tests

Khem Raj (5):
      tracker-miners: Check for commercial license to enable ffmpeg
      sysprof: Enable sysprofd/libsysprof only when polkit in
DISTRO_FEATURES
      vboxguestdrivers: Fix build with kernel 5.8
      vboxguestdrivers: Add __divmoddi4 builtin support
      libdevmapper,lvm2: Do not inherit license

Li Wang (1):
      apache2: fix CVE-2020-13950 CVE-2020-35452 CVE-2021-26690
CVE-2021-26691 CVE-2021-30641

Masaki Ambai (1):
      nss: add CVE-2006-5201 to allowlist

Mingli Yu (1):
      php: Upgrade to 7.4.16

Nicolas Dechesne (4):
      python3-markupsafe: remove recipe
      python3-jinja2: remove recipe
      python3-{pyyaml,cython,pyparsing}: move from meta-python to meta-oe
      ostree: Do not check for meta-python

 meta-gnome/recipes-gnome/tracker/tracker-miners_2.3.3.bb        |     2 +-
 meta-gnome/recipes-kernel/sysprof/sysprof_3.34.1.bb             |     4 +-
 .../ufw/ufw/0006-check-requirements-get-error.patch             |    36 +
 .../ufw/ufw/0007-use-conntrack-instead-of-state-module.patch    | 14903
++++++++++++++++++++++++++
 .../ufw/ufw/0008-support-.-setup.py-build-LP-819600.patch       |    93 +
 .../ufw/ufw/0009-adjust-runtime-tests-to-use-daytime-port.patch |  2895
+++++
 .../0010-empty-out-IPT_MODULES-and-update-documentation.patch   |   106 +
 ...ts-check-requirements--simplify-and-support-python-3.8.patch |    33 +
 .../Add-code-to-detect-openembedded-python-interpreter.patch    |    33 +
 .../ufw/ufw/setup-only-make-one-reference-to-env.patch          |    14 +-
 meta-networking/recipes-connectivity/ufw/ufw_0.33.bb            |    49 +-
 meta-networking/recipes-support/ntp/ntp/ntpdate                 |     5 +
 .../wireshark/{wireshark_3.2.10.bb => wireshark_3.2.15.bb}      |     2 +-
 .../{mariadb-native_10.4.17.bb => mariadb-native_10.4.20.bb}    |     0
 meta-oe/recipes-dbs/mysql/mariadb.inc                           |     4 +-
 .../mysql/{mariadb_10.4.17.bb => mariadb_10.4.20.bb}            |     0
 .../postgresql/{postgresql_12.5.bb => postgresql_12.7.bb}       |     4 +-
 meta-oe/recipes-devtools/php/php/CVE-2020-7069.patch            |   158 -
 meta-oe/recipes-devtools/php/php/CVE-2020-7070.patch            |    24 -
 meta-oe/recipes-devtools/php/{php_7.4.9.bb => php_7.4.16.bb}    |    12 +-
 .../recipes-devtools/python/python-cython.inc                   |     0
 .../recipes-devtools/python/python3-cython_0.29.14.bb           |     0
 .../recipes-devtools/python/python3-pyparsing_2.4.6.bb          |     0
 .../recipes-devtools/python/python3-pyyaml_5.3.1.bb             |     0
 meta-oe/recipes-extended/ostree/ostree_2020.3.bb                |     2 +-
 meta-oe/recipes-support/lvm2/lvm2.inc                           |     5 +-
 meta-oe/recipes-support/nss/nss_3.51.1.bb                       |     3 +
 .../vboxguestdrivers/40-linux-5.13-support.patch                |   276 +
 .../vboxguestdrivers/vboxguestdrivers/add__divmoddi4.patch      |    36 +
 .../{vboxguestdrivers_6.1.6.bb => vboxguestdrivers_6.1.22.bb}   |     9 +-
 meta-python/recipes-devtools/python/python3-jinja2/run-ptest    |     3 -
 meta-python/recipes-devtools/python/python3-jinja2_2.11.2.bb    |    43 -
 .../recipes-devtools/python/python3-markupsafe/run-ptest        |     3 -
 meta-python/recipes-devtools/python/python3-markupsafe_1.1.1.bb |     2 -
 .../recipes-httpd/apache2/apache2/CVE-2020-13950.patch          |    45 +
 .../recipes-httpd/apache2/apache2/CVE-2020-35452.patch          |    49 +
 .../recipes-httpd/apache2/apache2/CVE-2021-26690.patch          |    39 +
 .../recipes-httpd/apache2/apache2/CVE-2021-26691.patch          |    35 +
 .../recipes-httpd/apache2/apache2/CVE-2021-30641.patch          |    66 +
 meta-webserver/recipes-httpd/apache2/apache2_2.4.46.bb          |     5 +
 meta-webserver/recipes-httpd/hiawatha/hiawatha_10.10.bb         |     2 +-
 meta-webserver/recipes-httpd/nginx/files/CVE-2021-23017.patch   |    46 +
 meta-webserver/recipes-httpd/nginx/nginx.inc                    |     1 +
 43 files changed, 18786 insertions(+), 261 deletions(-)
 create mode 100644
meta-networking/recipes-connectivity/ufw/ufw/0006-check-requirements-get-error.patch
 create mode 100644
meta-networking/recipes-connectivity/ufw/ufw/0007-use-conntrack-instead-of-state-module.patch
 create mode 100644
meta-networking/recipes-connectivity/ufw/ufw/0008-support-.-setup.py-build-LP-819600.patch
 create mode 100644
meta-networking/recipes-connectivity/ufw/ufw/0009-adjust-runtime-tests-to-use-daytime-port.patch
 create mode 100644
meta-networking/recipes-connectivity/ufw/ufw/0010-empty-out-IPT_MODULES-and-update-documentation.patch
 create mode 100644
meta-networking/recipes-connectivity/ufw/ufw/0011-tests-check-requirements--simplify-and-support-python-3.8.patch
 create mode 100644
meta-networking/recipes-connectivity/ufw/ufw/Add-code-to-detect-openembedded-python-interpreter.patch
 rename meta-networking/recipes-support/wireshark/{wireshark_3.2.10.bb
=> wireshark_3.2.15.bb} (96%)
 rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.4.17.bb =>
mariadb-native_10.4.20.bb} (100%)
 rename meta-oe/recipes-dbs/mysql/{mariadb_10.4.17.bb =>
mariadb_10.4.20.bb} (100%)
 rename meta-oe/recipes-dbs/postgresql/{postgresql_12.5.bb =>
postgresql_12.7.bb} (51%)
 delete mode 100644 meta-oe/recipes-devtools/php/php/CVE-2020-7069.patch
 delete mode 100644 meta-oe/recipes-devtools/php/php/CVE-2020-7070.patch
 rename meta-oe/recipes-devtools/php/{php_7.4.9.bb => php_7.4.16.bb} (96%)
 rename {meta-python =>
meta-oe}/recipes-devtools/python/python-cython.inc (100%)
 rename {meta-python =>
meta-oe}/recipes-devtools/python/python3-cython_0.29.14.bb (100%)
 rename {meta-python =>
meta-oe}/recipes-devtools/python/python3-pyparsing_2.4.6.bb (100%)
 rename {meta-python =>
meta-oe}/recipes-devtools/python/python3-pyyaml_5.3.1.bb (100%)
 create mode 100644
meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/40-linux-5.13-support.patch
 create mode 100644
meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/add__divmoddi4.patch
 rename
meta-oe/recipes-support/vboxguestdrivers/{vboxguestdrivers_6.1.6.bb =>
vboxguestdrivers_6.1.22.bb} (90%)
 delete mode 100644
meta-python/recipes-devtools/python/python3-jinja2/run-ptest
 delete mode 100644
meta-python/recipes-devtools/python/python3-jinja2_2.11.2.bb
 delete mode 100644
meta-python/recipes-devtools/python/python3-markupsafe/run-ptest
 delete mode 100644
meta-python/recipes-devtools/python/python3-markupsafe_1.1.1.bb
 create mode 100644
meta-webserver/recipes-httpd/apache2/apache2/CVE-2020-13950.patch
 create mode 100644
meta-webserver/recipes-httpd/apache2/apache2/CVE-2020-35452.patch
 create mode 100644
meta-webserver/recipes-httpd/apache2/apache2/CVE-2021-26690.patch
 create mode 100644
meta-webserver/recipes-httpd/apache2/apache2/CVE-2021-26691.patch
 create mode 100644
meta-webserver/recipes-httpd/apache2/apache2/CVE-2021-30641.patch
 create mode 100644
meta-webserver/recipes-httpd/nginx/files/CVE-2021-23017.patch

