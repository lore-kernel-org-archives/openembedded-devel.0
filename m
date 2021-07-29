Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.17206.1627601814462112229
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Jul 2021 16:36:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tAneXMv+;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id z3so7508234plg.8
        for <openembedded-devel@lists.openembedded.org>; Thu, 29 Jul 2021 16:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NxsMQDG5lQdYoTJ2w07tv32RnHgvFMTO5gI7d+uxGM0=;
        b=tAneXMv+5ndBKKIELNUlRr1IxX0nwxjd2BEOycU4jlGQJuWf0U3kGX/KikCYVexlpV
         gOf0hyesk7a/Pw+JyieLPd/J1TQYTXe6Wg+dZm1zD73hkHOvYZYZNgWw36e8NbdW+QiK
         1GSH7yBoSclujvn9CwArEqi/mRnklUWn5iF6GbSVgl9TWQHR/Ty8iMS99NEfkuuUSlkb
         IUxmYopfQ9KNK8oAwGdhv3fjRWUe8995mtp6QpFIU9z1ZTLPHmFt4jzi2hp2BgNC9Dnd
         BFbh6jzJ5RZ7MCJFEhCzsI9n4TT15SfB4TIdgGYWIlT9jYSpvyvN3Dz/+Cbx+xx8iHDu
         SyCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NxsMQDG5lQdYoTJ2w07tv32RnHgvFMTO5gI7d+uxGM0=;
        b=FuAWHoCgy7YjesVL+0keIXU4uXj/o9mKmbrQWnH5SD0f1cSfNaZFecHrsFG3P5zytG
         5P6qK/edkhMAtH5MkypG8FTtasrrBqFgptmNMQwlQJyOPL9X4PHKE2a1ITBbwVHu1RPl
         HDVkvRn1O6m+3Yt9Glw30K1YCdOMch1/dyq44jixNGSdUboN31acXAv78rqd46Wuz8vM
         hnOWZOoGh7Zk/nehbZYF3x+zFoGWhyqCmMtpaaSOA22CMC5Jy4+BAu5kOlJHBR0YjLwe
         3ADRp/HyX6J+mMqeP9oRPD3CooZfiUuhXfDeCCv56daArABSC13bYHjINaX2cTvjy5Qk
         wLYg==
X-Gm-Message-State: AOAM531el6IIDknDzEwq1emubK8gSuDb3Xry+A5Pv1P/NsIdD2JJ3haO
	M9a5ulOQAPx2WbKpsMmk34mPHbBhg38RlA==
X-Google-Smtp-Source: ABdhPJyEZ5dnh+SqHd8OC6d3wUSZYPH3CjGzGRHvRi0ymnsQUDWxovWT8up4E1CBHHom99bsFCj3Pg==
X-Received: by 2002:a63:b953:: with SMTP id v19mr5841749pgo.40.1627601813575;
        Thu, 29 Jul 2021 16:36:53 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.hsd1.ca.comcast.net ([2601:202:4180:a5c0:43fe:2e36:1546:5b06])
        by smtp.gmail.com with ESMTPSA id w15sm2360487pfu.89.2021.07.29.16.36.53
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jul 2021 16:36:53 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 00/15] Patch review July 29th
Date: Thu, 29 Jul 2021 16:36:33 -0700
Message-Id: <cover.1627593245.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Please provide feedback by Saturday.

The following changes since commit 6a7ba8f7f210e04183fb64ab181520d817a34a11:

  sysbench: fix memory test (2021-07-14 21:27:01 -0700)

are available in the Git repository at:

  git://git.openembedded.org/meta-openembedded-contrib stable/hardknott-nut
  http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=stable/hardknott-nut

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

Tony Tascioglu (2):
  redis: fix CVE-2021-29477
  redis: fix CVE-2021-29478

Trevor Gamblin (1):
  python3-django: upgrade 3.2.4 -> 3.2.5 (fix CVE-2021-35042)

Zoltán Böszörményi (2):
  mariadb: Use qemu to run cross-compiled binaries
  mariadb: Upgrade to 10.5.11

 ...ve_10.5.9.bb => mariadb-native_10.5.11.bb} |   0
 meta-oe/recipes-dbs/mysql/mariadb.inc         |  56 ++--
 .../mariadb/fix-a-building-failure.patch      |  35 ---
 .../recipes-dbs/mysql/mariadb/mm_malloc.patch |  11 +
 .../mysql/mariadb/ppc-remove-glibc-dep.patch  |   2 +-
 ...Lists.txt-fix-gen_lex_hash-not-found.patch |  67 -----
 .../recipes-dbs/mysql/mariadb/ssize_t.patch   |  15 +
 .../{mariadb_10.5.9.bb => mariadb_10.5.11.bb} |   4 +-
 .../redis/redis/fix-CVE-2021-29477.patch      |  35 +++
 .../redis/redis/fix-CVE-2021-29478.patch      |  42 +++
 meta-oe/recipes-extended/redis/redis_6.2.2.bb |   2 +
 .../40-linux-5.13-support.patch               | 276 ++++++++++++++++++
 .../vboxguestdrivers/kernel-5.10.patch        |  23 --
 ...s_6.1.18.bb => vboxguestdrivers_6.1.22.bb} |   6 +-
 ...jango_3.2.4.bb => python3-django_3.2.5.bb} |   2 +-
 ...Limit-sprintf-modes-to-10-characters.patch |  49 ++++
 ...0001-Use-snprintf-instead-of-sprintf.patch |  43 +++
 .../python/python3-pillow_8.2.0.bb            |   2 +
 .../recipes-httpd/hiawatha/hiawatha_10.11.bb  |   2 +-
 19 files changed, 513 insertions(+), 159 deletions(-)
 rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.5.9.bb => mariadb-native_10.5.11.bb} (100%)
 delete mode 100644 meta-oe/recipes-dbs/mysql/mariadb/fix-a-building-failure.patch
 create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/mm_malloc.patch
 delete mode 100644 meta-oe/recipes-dbs/mysql/mariadb/sql-CMakeLists.txt-fix-gen_lex_hash-not-found.patch
 create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/ssize_t.patch
 rename meta-oe/recipes-dbs/mysql/{mariadb_10.5.9.bb => mariadb_10.5.11.bb} (81%)
 create mode 100644 meta-oe/recipes-extended/redis/redis/fix-CVE-2021-29477.patch
 create mode 100644 meta-oe/recipes-extended/redis/redis/fix-CVE-2021-29478.patch
 create mode 100644 meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/40-linux-5.13-support.patch
 delete mode 100644 meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/kernel-5.10.patch
 rename meta-oe/recipes-support/vboxguestdrivers/{vboxguestdrivers_6.1.18.bb => vboxguestdrivers_6.1.22.bb} (94%)
 rename meta-python/recipes-devtools/python/{python3-django_3.2.4.bb => python3-django_3.2.5.bb} (77%)
 create mode 100644 meta-python/recipes-devtools/python/python3-pillow/0001-Limit-sprintf-modes-to-10-characters.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-pillow/0001-Use-snprintf-instead-of-sprintf.patch

-- 
2.25.1

