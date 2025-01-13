Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0129FE77188
	for <webhook@archiver.kernel.org>; Mon, 13 Jan 2025 01:02:12 +0000 (UTC)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
 by mx.groups.io with SMTP id smtpd.web10.7164.1736730132520309653
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Jan 2025 17:02:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Fq1fyP6k;
 spf=pass (domain: gmail.com, ip: 209.85.219.171, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e54d268bc3dso6572161276.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 12 Jan 2025 17:02:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736730131; x=1737334931; darn=lists.openembedded.org;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1P8SvvDYMfWNcRyQHqxtr2t1YA23cUNTxhj5jm1N/nw=;
        b=Fq1fyP6k5T4gTeN7QixsPfR9xsQB7Byjj8/p81G48N3npfEXw58WW5WkgRCXE/KR8Y
         oG4OgUgNSpZjeC1Arb6J7Verx8IFltFc5Re0JJo14A2dvp+0ruEkv+a+dtqwyV5LEpHW
         wCaj4nLOBvEZwA59tpiW+AYJaYl9qVQgYflNoxqg+eSfdC1E9MnlTpx2ld2to7EoGPth
         nUuuYE5OIyJ6BcFhCmfRoJockZyS43M4/UMeNEfdaRogLeEWUexBGLynn00jqhzSf/WX
         xhoYB5ys5srVd7rk4MIb3TrOUibQd9XoDI+212VtnPjEH7S0AOpVZ+caSF43t3UZiqHZ
         OjGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736730131; x=1737334931;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1P8SvvDYMfWNcRyQHqxtr2t1YA23cUNTxhj5jm1N/nw=;
        b=u1MJizVJ1XENHUM5/zuX+pGfGo22bIkk2IihfU8q7B8uTV4y2+3onnz14FNbQf9Egk
         GBfGUpyz2WCKxuElFVyn0XF9AsQkhq+Y/i7Nw694D6W6EM305KD26502UAs4UjunPxAc
         SpltzEjzJgwHXyRspIBOPlHCGmtQutrz/f4Jom0PLxzt5wX+Z1dqhIo2i1sSN5ECXHYi
         4WTQfsS/1HZ3m7EMhZQf0VAu9BBC7DpTkDv/h/HKNOA4oJ9HoZDBiOU5IWfhvZuv7H6H
         Q8CRdIYZF5l67mlM6TKJ90bcav2UCGZ0BBu3UyUcklVNud15fyxLj1TsaYjxIxYxlOBB
         nB2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWJZFrXXBvsGNkDKF8VtGRDWpnegMv/MwSptqOwn75jCJFyAmCZQUSUkUaozeMR8pSxH6lv/6/motEXJK67FzdMEbw=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz3o7o4Gug6lrc8ckUeAEQBRqq9i4BpepHM6xwV3J27i32+WawY
	8C9GOzgDPXC7HJdksV/S4hZio8JL+qFSyUfs84ocAS7NVxV4auSh0t5OcqWE
X-Gm-Gg: ASbGncvF67Lc62L3IRMqwkI15DEQwaH0jeyZfnYdUeNisuQl90JUGkWKI4m+hrFIgon
	BJD9S2XX+YYY7er4gl7siNMFwsCITg0kSslXWzyHK4il6hznfsuajvj6YIqO57wU7jy4KmTEhVq
	fdoiJx6zKQ5EiIT3fZ3WP76ZhwuVL9ImE6qdaPfDeI10oNTXxUvg8HLC8dsnPxBiAjmnTd/2vrs
	48PDn4cXEroQmjJuyzWS8AxjYZWaanyu7xkizTjXRNUgc2LT1gRhqtUD5VDZnpR5scxrmyKOhRH
	J6rMqZSMcE66b3wCyUQ7bhizoyhRdA==
X-Google-Smtp-Source: AGHT+IEPaJivv0CL5PWSxkrdyt569vt4IZkXkk6CTv5fZZl09MDy15FZjJiM1L8Noh6Fq3DZLP99NQ==
X-Received: by 2002:a05:6902:18ca:b0:e57:4167:477c with SMTP id 3f1490d57ef6-e5741675807mr3978751276.28.1736730131510;
        Sun, 12 Jan 2025 17:02:11 -0800 (PST)
Received: from ?IPV6:2600:1700:45dd:7000:9984:c5c:600f:f2e7? ([2600:1700:45dd:7000:9984:c5c:600f:f2e7])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e55a5979b50sm1351721276.28.2025.01.12.17.02.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Jan 2025 17:02:11 -0800 (PST)
Message-ID: <05f57241-f78b-441b-a352-39ebf6f8cabf@gmail.com>
Date: Sun, 12 Jan 2025 20:02:10 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: styhead merge request: Jan 12th
Autocrypt: addr=akuster808@gmail.com; keydata=
 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
 ApZ86eOP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Jan 2025 01:02:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114817

The following changes since commit 7cd38212e73e0e9f42f4d92defb16dd81f71221d:

   lvm2: Remove the lvm2-udevrules package (2024-11-25 15:32:56 -0500)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded styhead-next

for you to fetch changes up to 31a24ab044a24936f50a80828ecd7048bf5b1f5e:

   libmodule-build-tiny-perl: fix QA Issue: TMPDIR [buildpaths] 
(2025-01-12 19:57:19 -0500)

----------------------------------------------------------------
Benjamin Bouvier (1):
       bridge-utils: add CVE_PRODUCT

Derek Straka (1):
       nginx: Upgrade mainline release version 1.27.1 -> 1.27.3

Ghislain Mangé (1):
       wireshark: use inherit_defer for conditional cases

Hongxu Jia (1):
       ntfs-3g-ntfsprogs: fix CVE-2023-52890

J. S. (4):
       libhtml-tree-perl: Drop unnecessary SRC_URI md5sum
       libhtml-tree-perl: update HOMEPAGE
       libhtml-tree-perl: fix QA Issue: TMPDIR [buildpaths]
       libmodule-build-tiny-perl: fix QA Issue: TMPDIR [buildpaths]

Khem Raj (3):
       mariadb: Fix build with clang-20/trunk
       ghex,gnome-chess,gnome-photos: Add missing dep on itstool-native
       mpd: Fix build with icu 76+

Markus Volk (2):
       geary: add itstool-native dependency
       eog: add itstool-native dependency

Peter Kjellerstedt (1):
       abseil-cpp: Do not leak -Wnon-virtual-dtor into the .pc files

Peter Marko (15):
       proftpd: set status of CVE-2001-0027
       dash: set CVE_PRODUCT
       ace: ignore CVE-2009-1147
       apache2: ignore CVE-1999-0678 and CVE-1999-1412
       apache2: remove old version references from CVEs
       spice: ignore CVE-2016-0749
       gattlib: mark CVE-2019-6498 as fixed
       monkey: ignore CVE-2013-1771
       redis: ignore CVE-2022-0543
       spice-gtk: mark CVE-2012-4425 as fixed
       apache2: ignore disputed CVE CVE-2007-0086
       memcached: ignore disputed CVE-2022-26635
       emlog: set CVE_PRODUCT
       php: upgrade 8.2.20 -> 8.2.26
       wireshark: upgrade 4.2.8 -> 4.2.9

Ruiqiang Hao (1):
       mariadb: Ensure compatibility with ARMv9 by updating .arch directive

Yoann Congal (1):
       gimp: fix gimptool buildpaths errors

Yogita Urade (1):
       postgresql: upgrade 16.4 -> 16.5

  ...0001-unistr.c-Fix-use-after-free-in-ntfs_uppercase_mbs.patch | 42 
++++++++++++++
  .../ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.10.3.bb            | 1 +
  meta-gnome/recipes-connectivity/geary/geary_46.0.bb             | 1 +
  .../gimp/gimp/0001-gimptool-allow-default-CC-override.patch     | 85 
+++++++++++++++++++++++++++++
  meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb                    | 21 
+++++++
  meta-gnome/recipes-gnome/eog/eog_47.0.bb                        | 1 +
  meta-gnome/recipes-gnome/ghex/ghex_46.0.bb                      | 1 +
  meta-gnome/recipes-gnome/gnome-chess/gnome-chess_47.0.bb        | 2 +-
  meta-gnome/recipes-gnome/gnome-photos/gnome-photos_44.0.bb      | 1 +
  .../mpd/0001-meson.build-support-building-with-ICU-76.patch     | 52 
++++++++++++++++++
  meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.15.bb       | 1 +
  meta-networking/recipes-daemons/proftpd/proftpd_1.3.8b.bb       | 2 +
  .../recipes-support/bridge-utils/bridge-utils_1.7.1.bb          | 2 +
  meta-networking/recipes-support/memcached/memcached_1.6.17.bb   | 2 +
  meta-networking/recipes-support/spice/spice-gtk_0.42.bb         | 2 +
  meta-networking/recipes-support/spice/spice_git.bb              | 1 +
  .../wireshark/{wireshark_4.2.7.bb => wireshark_4.2.9.bb} |  4 +-
  meta-oe/recipes-connectivity/ace/ace_6.5.19.bb                  | 2 +
  meta-oe/recipes-connectivity/gattlib/gattlib_git.bb             | 2 +
  meta-oe/recipes-core/emlog/emlog.inc                            | 2 +
  meta-oe/recipes-dbs/mysql/mariadb.inc                           | 2 +
  ...1-Ensure-compatibility-with-ARMv9-by-updating-.arch-di.patch | 44 
+++++++++++++++
  ...1-Use-a-lambda-function-as-deleter-prototype-in-unique.patch | 26 
+++++++++
  .../0003-configure.ac-bypass-autoconf-2.69-version-check.patch  | 6 +-
  .../postgresql/{postgresql_16.4.bb => postgresql_16.5.bb} |  2 +-
  ...5-Don-t-match-Wnon-virtual-dtor-in-the-flags-are-neede.patch | 30 
++++++++++
  meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20240722.0.bb    | 1 +
  .../php/php/0001-ext-opcache-config.m4-enable-opcache.patch     | 4 +-
  .../php/php/0002-build-php.m4-don-t-unset-cache-variables.patch | 2 +-
  .../0003-php-remove-host-specific-info-from-header-file.patch   | 2 +-
  .../php/0006-ext-phar-Makefile.frag-Fix-phar-packaging.patch    | 4 +-
  .../php/php/0008-ext-imap-config.m4-fix-include-paths.patch     | 4 +-
  .../php/php/0009-php-don-t-use-broken-wrapper-for-mkdir.patch   | 3 +-
  meta-oe/recipes-devtools/php/php/0010-iconv-fix-detection.patch | 2 +-
  meta-oe/recipes-devtools/php/{php_8.2.20.bb => php_8.2.26.bb} |  2 +-
  meta-oe/recipes-extended/redis/redis_7.2.5.bb                   | 1 +
  meta-oe/recipes-shells/dash/dash_0.5.12.bb                      | 2 +
  meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.03.bb        | 10 +++-
  .../recipes-perl/libmodule/libmodule-build-tiny-perl_0.048.bb   | 7 +++
  meta-webserver/recipes-httpd/apache2/apache2_2.4.62.bb          | 17 
+++---
  meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb             | 1 +
  .../recipes-httpd/nginx/{nginx_1.27.1.bb => nginx_1.27.3.bb} |  4 +-
  42 files changed, 374 insertions(+), 29 deletions(-)
  create mode 100644 
meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/0001-unistr.c-Fix-use-after-free-in-ntfs_uppercase_mbs.patch
  create mode 100644 
meta-gnome/recipes-gimp/gimp/gimp/0001-gimptool-allow-default-CC-override.patch
  create mode 100644 
meta-multimedia/recipes-multimedia/musicpd/mpd/0001-meson.build-support-building-with-ICU-76.patch
  rename meta-networking/recipes-support/wireshark/{wireshark_4.2.7.bb 
=> wireshark_4.2.9.bb} (95%)
  create mode 100644 
meta-oe/recipes-dbs/mysql/mariadb/0001-Ensure-compatibility-with-ARMv9-by-updating-.arch-di.patch
  create mode 100644 
meta-oe/recipes-dbs/mysql/mariadb/0001-Use-a-lambda-function-as-deleter-prototype-in-unique.patch
  rename meta-oe/recipes-dbs/postgresql/{postgresql_16.4.bb => 
postgresql_16.5.bb} (86%)
  create mode 100644 
meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0005-Don-t-match-Wnon-virtual-dtor-in-the-flags-are-neede.patch
  rename meta-oe/recipes-devtools/php/{php_8.2.20.bb => php_8.2.26.bb} (99%)
  rename meta-webserver/recipes-httpd/nginx/{nginx_1.27.1.bb => 
nginx_1.27.3.bb} (53%)


