Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web12.9601.1613842790482641290
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 20 Feb 2021 09:39:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DncJD0gA;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id b145so3976908pfb.4
        for <openembedded-devel@lists.openembedded.org>; Sat, 20 Feb 2021 09:39:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:autocrypt:message-id:date:user-agent
         :mime-version:content-transfer-encoding:content-language;
        bh=Z+7sfQmK2xES4ydoqBLcgAIZAKotAgg5d+0nvJHp5Lg=;
        b=DncJD0gA4yHlliklI5r4ykW5DcFmKqaoWaCEcOQZmoCwwquHk40rLdgLxtdy2x68GI
         7GDGcfA9dYrcwrnddfuHkvwRoOlQPBq83ZScPKJWJhxG/rz4QiVAZnyUJTweBX8AOhvN
         Ka3EYgKy9fERTtCI6Z52fThmwNRdYF7pebMJphouezZyAJ35li8FkcfiAN+lNXeNHbmP
         RvWJFhdElEl1YqHrbDrH/o76a9uVVeTh7VfjjrwMeZqoDKKZcu/VflYO2YpJa8AlN9kD
         YAZbPnMw6x9EJIFPcCLofVN74TR8NYPtckS4/gg1dfOPjDNWGlk493uPdFCmlWGDfD0E
         IOKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:from:subject:autocrypt:message-id:date
         :user-agent:mime-version:content-transfer-encoding:content-language;
        bh=Z+7sfQmK2xES4ydoqBLcgAIZAKotAgg5d+0nvJHp5Lg=;
        b=PKB248Scwtl2LG0A7G5LrG7mBCSvGZ/525+V9v+a93aKYW8bQMZ2DFwrZma2KtZkyL
         yaTjoMWitp2sEN/P6OLWf7XX74EVaJAdR78hVXZr6/4kyPRrKQNuJLVa3icZ7/xSNxrl
         +d5q06ShS4nhxSXsdTIz53vaWFqNecEvctUdpEjZHVauz8d3tJEgkVPA7gJ40pzwZP1K
         +IqZwCPQrq0x/FKh6pG8yq2yGNdo6DvlDIxGdlWcyjKNpx7j38epN3nlN7EfhpTiR313
         I14XTNDXxVpoIb9wsFR7OfycjiuYd5FULBFKIQOgO/0tT23ecKexcLPlUpkg/I+eTV1s
         LZgQ==
X-Gm-Message-State: AOAM531jRvcEU9QSe0DDNFCUCjTnJGJUx2I4vusu6kAK/O8o7LYQG1cJ
	38QmXaOCCdYeIjjv7XHzlFs=
X-Google-Smtp-Source: ABdhPJytb5DccluVrdC3Exx0DITo33gl6FFEf/j56FvWkLv9FITQoOroTsIpgvjhQryrSDrIK4ZMbQ==
X-Received: by 2002:a63:c54c:: with SMTP id g12mr12910737pgd.449.1613842789864;
        Sat, 20 Feb 2021 09:39:49 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:70a2:885b:8c45:14d6? ([2601:202:4180:a5c0:70a2:885b:8c45:14d6])
        by smtp.gmail.com with ESMTPSA id c11sm11964293pfl.52.2021.02.20.09.39.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 20 Feb 2021 09:39:49 -0800 (PST)
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: Khem Raj <raj.khem@gmail.com>
From: "akuster" <akuster808@gmail.com>
Subject: meta-openembedded gatesgarth merge request Feb 20th
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <f45abe8c-bd3d-3d8c-a46b-b4491d729f0f@gmail.com>
Date: Sat, 20 Feb 2021 09:39:47 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

The following changes since commit cef93b7b00e620d90a610112ee574fa60b691cf8:

  openldap: upgrade 2.4.56 -> 2.4.57 (2021-02-02 10:18:22 -0800)

are available in the Git repository at:

  https://git.openembedded.org/meta-openembedded gatesgarth-next

for you to fetch changes up to 945f062ff098dc9c8ba8d22c5eef88adec60730d:

  meta-oe/README: add Ubuntu prerequisite information (2021-02-15
08:19:35 -0800)

----------------------------------------------------------------
Armin Kuster (1):
      lua: update to 5.3.6

Kai Kang (1):
      mariadb: add package config zstd

Khem Raj (7):
      mariadb: Fix build on 32bit arches with 64bit time_t
      gedit: Inherit python3targetconfig
      openipmi: Inherit python3targetconfig
      libplist: Inherit python3targetconfig
      postgresql: Inherit python3targetconfig
      python-grpcio-tools: Add missing space for append
      python3-pykwalify: Do not unset _PYTHON_SYSCONFIGDATA_NAME

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

akuster (2):
      enca: Fix SRC_URI
      meta-oe/README: add Ubuntu prerequisite information

changqing.li@windriver.com (1):
      celt051: update SRC_URI

 meta-gnome/recipes-gnome/gedit/gedit_3.36.2.bb     |  2 +-
 .../wireguard/wireguard-module_1.0.20200908.bb     |  7 ----
 .../recipes-support/celt051/celt051_git.bb         |  2 +-
 .../recipes-support/dnsmasq/dnsmasq/lua.patch      |  9 ++---
 .../recipes-support/dnsmasq/dnsmasq_2.82.bb        |  8 -----
 .../recipes-support/dnsmasq/dnsmasq_2.84.bb        |  8 +++++
 .../dnsmasq/files/dnsmasq-resolvconf.service       |  2 +-
 .../recipes-support/openipmi/openipmi_2.0.29.bb    |  2 +-
 meta-oe/README                                     |  3 ++
 ...b-native_10.5.6.bb => mariadb-native_10.5.8.bb} |  0
 meta-oe/recipes-dbs/mysql/mariadb.inc              |  5 ++-
 ...se-Define-__NR_futex-if-it-does-not-exist.patch | 37
+++++++++++++++++++++
 ...-stacktrace-t.c-make-the-test-conditional.patch | 38
++++++++++++++++++++++
 .../recipes-dbs/mysql/mariadb/c11_atomics.patch    | 14 ++++----
 .../mysql/{mariadb_10.5.6.bb => mariadb_10.5.8.bb} |  0
 meta-oe/recipes-dbs/postgresql/postgresql.inc      |  2 +-
 .../lua/{lua_5.3.5.bb => lua_5.3.6.bb}             |  6 ++--
 .../libimobiledevice/libplist_2.2.0.bb             |  2 +-
 .../minifi-cpp/minifi-cpp_0.7.0.bb                 |  1 +
 meta-oe/recipes-support/enca/enca_1.9.bb           |  7 ++--
 .../python/python-grpcio-tools.inc                 |  2 +-
 .../python/python3-pykwalify_1.7.0.bb              |  2 +-
 .../recipes-devtools/python/python3-sh_1.14.1.bb   |  1 -
 23 files changed, 117 insertions(+), 43 deletions(-)
 delete mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq_2.82.bb
 create mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq_2.84.bb
 rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.5.6.bb =>
mariadb-native_10.5.8.bb} (100%)
 create mode 100644
meta-oe/recipes-dbs/mysql/mariadb/0001-innobase-Define-__NR_futex-if-it-does-not-exist.patch
 create mode 100644
meta-oe/recipes-dbs/mysql/mariadb/0001-stacktrace-t.c-make-the-test-conditional.patch
 rename meta-oe/recipes-dbs/mysql/{mariadb_10.5.6.bb =>
mariadb_10.5.8.bb} (100%)
 rename meta-oe/recipes-devtools/lua/{lua_5.3.5.bb => lua_5.3.6.bb} (92%)

