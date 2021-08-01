Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web09.8364.1627832201251592745
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 01 Aug 2021 08:36:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=auNqrD3+;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id e21so16784717pla.5
        for <openembedded-devel@lists.openembedded.org>; Sun, 01 Aug 2021 08:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=T2hxdqJfTuRGrBiAFzLqJdDYQt/x1gT+HBdjIgTNvNo=;
        b=auNqrD3+yIhHzDWkwavIUw5EdkJ4n3ynIVIonM20czljeAYLnrz4bwYt88qgDBjxik
         ap7YIzhY7AovDFCBtoK3jD7BrxizmQCV37PPlbxiS7G2Imw/m4vt9x9VBxMm50E0mPL5
         0zwaDxy0fct4RUizT0S4H8PGznDe3mGI3+e2Lgdx2ZoIR4DDDcSOxY3RSJScNT0VkjKU
         V43hu8l6h1NVTznwMdG4KK6Jpf7KqLelxQFOm+Zo9Ejnm2OUa+jI/C24lmfrwP4/NYmG
         MIWHN9SyaMwyD7VYMiSAv/DQL3T2seTWA7U4I6P8IvsnegiuXmmTn3kY40TZjhL+UVj8
         hQSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:message-id:date:user-agent
         :mime-version:content-transfer-encoding:content-language;
        bh=T2hxdqJfTuRGrBiAFzLqJdDYQt/x1gT+HBdjIgTNvNo=;
        b=H5KhjYmYTc9lwEKO2y2xpvb1Ej6ld6JTqE6o8NATh3Crvn/VhycpdGJV8W5NubAaoM
         f5dqy1BY2VEMtrpMjFLWvCLJ2Ne+kh3fCDiZRzxwJ3KA7QZnFwUCGeVBkmZwgjdlneuf
         mlQkLKGpznq3CW7R5Mn68npGfYH+ouBGi2m1Bq9RGspD24R/fxbBBACzBh2HiPMgknkv
         XdVXE8PK/qMnQBipp09iF9Mm7kJJWn40LVIKHKWAQ2b2DR6+68N5CRpz4tyc8as07rKe
         qtI5K4NG4mop3GT/B/CUivqX1mr8VwlpWdr2DdixiLZO3Plsc9Cg7D6tm7L800bWFGQL
         7BMw==
X-Gm-Message-State: AOAM531Gq5NGkAdFmLSCP9sxRfCgweINwd53Itk8T8iiks2j6qP3KNDT
	QZ9zMBEpLpoaJ9CwZnftA2Q=
X-Google-Smtp-Source: ABdhPJwnN+uSaF4/vS0Br4qxbPpwwC57q6JHvzAHzDMMfPDuj1ke+d/PZHkfNPSQ4aG0n24SAPhPwA==
X-Received: by 2002:a17:903:1cf:b029:12a:da08:f8e3 with SMTP id e15-20020a17090301cfb029012ada08f8e3mr10600936plh.15.1627832200785;
        Sun, 01 Aug 2021 08:36:40 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from [192.168.135.41] ([12.176.236.254])
        by smtp.gmail.com with ESMTPSA id q68sm2802025pgq.5.2021.08.01.08.36.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Aug 2021 08:36:40 -0700 (PDT)
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
 Khem Raj <raj.khem@gmail.com>
From: "Armin Kuster" <akuster808@gmail.com>
Subject: hardknott merge request Aug1st
Message-ID: <431cc3eb-3362-ca17-f915-b52a5056ddc0@gmail.com>
Date: Sun, 1 Aug 2021 08:36:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

The following changes since commit 6a7ba8f7f210e04183fb64ab181520d817a34a11:

  sysbench: fix memory test (2021-07-14 21:27:01 -0700)

are available in the Git repository at:

  https://git.openembedded.org/meta-openembedded hardknott-next

for you to fetch changes up to 5a4b2ab29d38c02535f24d5308cc40615739f557:

  python3-urllib3: Upgrade 1.26.4 -> 1.26.5 (2021-07-30 16:20:20 -0700)

----------------------------------------------------------------
Andreas Müller (1):
      mariadb: Fix configure

Armin Kuster (1):
      hiawatha: fix url.

Gianfranco (3):
      vboxguestdrivers: upgrade 6.1.18 -> 6.1.20
      vboxguestdrivers: upgrade 6.1.20 -> 6.1.22
      vboxguestdrivers: add a fix for build failure with kernel 5.13

Joe Slater (1):
      python3-pillow: fix CVE-2021-34552

Kai Kang (1):
      mariadb: fix failures to start install_db.service

Khem Raj (3):
      mariadb: Upgrade to 10.5.10
      mariadb: Include missing sys/type.h for ssize_t
      mariadb: Fix build with clang/musl

Leon Anavi (1):
      python3-urllib3: Upgrade 1.26.4 -> 1.26.5

Tony Tascioglu (2):
      redis: fix CVE-2021-29477
      redis: fix CVE-2021-29478

Trevor Gamblin (1):
      python3-django: upgrade 3.2.4 -> 3.2.5 (fix CVE-2021-35042)

Zoltán Böszörményi (2):
      mariadb: Use qemu to run cross-compiled binaries
      mariadb: Upgrade to 10.5.11

 .../{mariadb-native_10.5.9.bb => mariadb-native_10.5.11.bb}     |   0
 meta-oe/recipes-dbs/mysql/mariadb.inc                           |  56
+++---
 meta-oe/recipes-dbs/mysql/mariadb/fix-a-building-failure.patch  |  35 ----
 meta-oe/recipes-dbs/mysql/mariadb/mm_malloc.patch               |  11 ++
 meta-oe/recipes-dbs/mysql/mariadb/ppc-remove-glibc-dep.patch    |   2 +-
 .../mariadb/sql-CMakeLists.txt-fix-gen_lex_hash-not-found.patch |  67
-------
 meta-oe/recipes-dbs/mysql/mariadb/ssize_t.patch                 |  15 ++
 .../recipes-dbs/mysql/{mariadb_10.5.9.bb => mariadb_10.5.11.bb} |   4 +-
 meta-oe/recipes-extended/redis/redis/fix-CVE-2021-29477.patch   |  35 ++++
 meta-oe/recipes-extended/redis/redis/fix-CVE-2021-29478.patch   |  42 +++++
 meta-oe/recipes-extended/redis/redis_6.2.2.bb                   |   2 +
 .../vboxguestdrivers/40-linux-5.13-support.patch                | 276
++++++++++++++++++++++++++++
 .../vboxguestdrivers/vboxguestdrivers/kernel-5.10.patch         |  23 ---
 .../{vboxguestdrivers_6.1.18.bb => vboxguestdrivers_6.1.22.bb}  |   6 +-
 .../python/{python3-django_3.2.4.bb => python3-django_3.2.5.bb} |   2 +-
 .../0001-Limit-sprintf-modes-to-10-characters.patch             |  49 +++++
 .../python3-pillow/0001-Use-snprintf-instead-of-sprintf.patch   |  43 +++++
 meta-python/recipes-devtools/python/python3-pillow_8.2.0.bb     |   2 +
 .../{python3-urllib3_1.26.4.bb => python3-urllib3_1.26.5.bb}    |   2 +-
 meta-webserver/recipes-httpd/hiawatha/hiawatha_10.11.bb         |   2 +-
 20 files changed, 514 insertions(+), 160 deletions(-)
 rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.5.9.bb =>
mariadb-native_10.5.11.bb} (100%)
 delete mode 100644
meta-oe/recipes-dbs/mysql/mariadb/fix-a-building-failure.patch
 create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/mm_malloc.patch
 delete mode 100644
meta-oe/recipes-dbs/mysql/mariadb/sql-CMakeLists.txt-fix-gen_lex_hash-not-found.patch
 create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/ssize_t.patch
 rename meta-oe/recipes-dbs/mysql/{mariadb_10.5.9.bb =>
mariadb_10.5.11.bb} (81%)
 create mode 100644
meta-oe/recipes-extended/redis/redis/fix-CVE-2021-29477.patch
 create mode 100644
meta-oe/recipes-extended/redis/redis/fix-CVE-2021-29478.patch
 create mode 100644
meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/40-linux-5.13-support.patch
 delete mode 100644
meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/kernel-5.10.patch
 rename
meta-oe/recipes-support/vboxguestdrivers/{vboxguestdrivers_6.1.18.bb =>
vboxguestdrivers_6.1.22.bb} (94%)
 rename meta-python/recipes-devtools/python/{python3-django_3.2.4.bb =>
python3-django_3.2.5.bb} (77%)
 create mode 100644
meta-python/recipes-devtools/python/python3-pillow/0001-Limit-sprintf-modes-to-10-characters.patch
 create mode 100644
meta-python/recipes-devtools/python/python3-pillow/0001-Use-snprintf-instead-of-sprintf.patch
 rename meta-python/recipes-devtools/python/{python3-urllib3_1.26.4.bb
=> python3-urllib3_1.26.5.bb} (86%)

