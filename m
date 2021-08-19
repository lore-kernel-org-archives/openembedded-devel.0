Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web08.65104.1629347036010592036
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Aug 2021 21:23:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rwKU04OO;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id y190so4300297pfg.7
        for <openembedded-devel@lists.openembedded.org>; Wed, 18 Aug 2021 21:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=lgbExCAcb6ssq0iJCaNX7NYTsJMLxGfB5TcSwCxJpI0=;
        b=rwKU04OOiUWysZZeJKJACuWAtKKftzAmoeZ8xROczDZSJVewT/2aFZA3WYpk2tJKh3
         7ZF+ycInFFAi0Xn6AdryeMG7+Cw2+oaeFSYauUyNnwPezPJPKktpPqc3/RSeKTOOy0B3
         NAXKhTK0N2cvMT4yavZlwM1gf6Jd+xn7o4tYwOiV8zNDSSYN6aPFkG+RVCtiTixdHqQz
         bWNS3RE5Es7zTM9WvNIPUlkJkP1M86Evbv2Xkaw+VPgx0UVf4T1XPlUyQHHaZxigiAeG
         T5XvvSQMEK2Zx9ayLHrvh9Ep3QUW1SJmsz4ADM1riL3hJJghBU7KNB7LAjKFBP3S8Ba/
         gWsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:message-id:date:user-agent
         :mime-version:content-transfer-encoding:content-language;
        bh=lgbExCAcb6ssq0iJCaNX7NYTsJMLxGfB5TcSwCxJpI0=;
        b=EWEre0vpcjQ6YmPNZh5kZ8xATDBH9P3tsPvJDyMAhCIfsQxed6hQyVi4LLpMJHIjyT
         GMi0wdutaBxAtMNcr+XJLACpOy1HsbDHra2iRkUm3Xf2l8jYw3o4b7ovNhFewDakRS/3
         FYEqH9rtR822B1FVTWCIGLoa9HXwu++qwxuP4QKAyB68GUyTw0c4NhmEzwrRkd2r3MGu
         8gWnKAJjQwCMOABXwbUcQQeitK5froGaZInDJXvXV5MRDWRlOor/tycgKYFK1SOUt1bn
         1aIE4cHqn4lTJiJtxpQxby4WEaXuoTR/EIMgD8bqH+Y5uOv+axx57OQf0WDMmn+79z92
         NLpQ==
X-Gm-Message-State: AOAM531TG10Vzk1n1MiDKFFNfZYZ10ho6lsVSZXky5/5xmrCk6zdcDWK
	BLAyMuuYCLv2LWvNBKDC8jE=
X-Google-Smtp-Source: ABdhPJxhKfkI5Hxrl5/LGYdr1eI3Sx0IFxKPGcwzDWu0SNAu6yayUCsudJteVk8rr5jljY6tBLVxyA==
X-Received: by 2002:a65:6251:: with SMTP id q17mr7504346pgv.416.1629347035554;
        Wed, 18 Aug 2021 21:23:55 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:b96e:f117:a0f6:f2a? ([2601:202:4180:a5c0:b96e:f117:a0f6:f2a])
        by smtp.gmail.com with ESMTPSA id w5sm1622000pgp.79.2021.08.18.21.23.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Aug 2021 21:23:55 -0700 (PDT)
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
 Khem Raj <raj.khem@gmail.com>
From: "Armin Kuster" <akuster808@gmail.com>
Subject: hardknott merge request: Aug 18th
Message-ID: <0e9dfbe9-da90-b903-eb0e-dde41f4a6a33@gmail.com>
Date: Wed, 18 Aug 2021 21:23:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

The following changes since commit 5a4b2ab29d38c02535f24d5308cc40615739f557:

  python3-urllib3: Upgrade 1.26.4 -> 1.26.5 (2021-07-30 16:20:20 -0700)

are available in the Git repository at:

  https://git.openembedded.org/meta-openembedded hardknott-next

for you to fetch changes up to d323115ecd437e397bd504758ba52988900f4747:

  fvwm: Fix build time paths in target perl/python scripts (2021-08-15
07:09:56 -0700)

----------------------------------------------------------------
Anastasios Kavoukis (1):
      pm-qa: fix paths for shell scripts

Armin Kuster (1):
      wireshark: update to 3.4.7

Changqing Li (1):
      ndpi: fix CVE-2021-36082

Devendra Tewari (1):
      Suppress eol in functionfs setup scripts (#147)

Gianfranco (1):
      vboxguestdrivers: upgrade 6.1.22 -> 6.1.24

Joe Slater (1):
      php: move to version 7.4.21

Kai Kang (1):
      libdbi-perl: fix CVE-2014-10402

Khem Raj (2):
      fvwm: Package extra files and man pages
      fvwm: Fix build time paths in target perl/python scripts

Li Wang (1):
      openlldp: fix segfault

Michael Opdenacker (1):
      bigbuckbunny-1080p: fix sample video URL

Mingli Yu (2):
      mariadb: redefine log-error item
      mariadb: Update SRC_URI

Paulo Neves (1):
      htop: Add ncurses-terminfo-base to RDEPENDS

Tony Battersby (3):
      net-snmp: fix QA Issue after LDFLAGS change
      curlpp: fix QA Issue after LDFLAGS change
      ldns: fix QA Issue after LDFLAGS change

Tony Tascioglu (1):
      redis: fix CVE-2021-32625

wangmy (2):
      nghttp2: upgrade 1.43.0 -> 1.44.0
      libtalloc: upgrade 2.3.2 -> 2.3.3

 .../recipes-multimedia/sample-content/bigbuckbunny-1080p.bb     |   2 +-
 meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.1.bb    |   5 +
 .../openlldp/files/lldp_head-remove-all-references.patch        | 331
++++++++++++++++++++++++++++
 meta-networking/recipes-protocols/openlldp/openlldp_1.0.1.bb    |   1 +
 meta-networking/recipes-support/curlpp/curlpp_0.8.1.bb          |   7 +
 .../libtalloc/{libtalloc_2.3.2.bb => libtalloc_2.3.3.bb}        |   6 +-
 .../nghttp2/{nghttp2_1.43.0.bb => nghttp2_1.44.0.bb}            |   2 +-
 .../recipes-support/ntopng/files/CVE-2021-36082.patch           | 116
++++++++++
 meta-networking/recipes-support/ntopng/ndpi_3.4.bb              |   1 +
 .../wireshark/{wireshark_3.4.6.bb => wireshark_3.4.7.bb}        |   2 +-
 meta-oe/recipes-dbs/mysql/mariadb.inc                           |   7 +-
 meta-oe/recipes-dbs/mysql/mariadb/my.cnf                        |   2 +-
 .../android-tools-conf-configfs/android-gadget-cleanup          |   2 +-
 .../android-tools-conf-configfs/android-gadget-setup            |   4 +-
 .../android-tools-conf-configfs/android-gadget-start            |   2 +-
 meta-oe/recipes-devtools/ldns/ldns_1.7.1.bb                     |   7 +
 meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2014-10402.patch  |  56 +++++
 meta-oe/recipes-devtools/perl/libdbi-perl_1.643.bb              |   4 +-
 meta-oe/recipes-devtools/php/{php_7.4.16.bb => php_7.4.21.bb}   |   3 +-
 meta-oe/recipes-extended/redis/redis/fix-CVE-2021-32625.patch   |  61 +++++
 meta-oe/recipes-extended/redis/redis_6.2.2.bb                   |   1 +
 meta-oe/recipes-graphics/fvwm/fvwm_2.6.9.bb                     |  23 +-
 meta-oe/recipes-support/htop/htop_3.0.5.bb                      |   2 +
 .../vboxguestdrivers/40-linux-5.13-support.patch                | 276
-----------------------
 .../{vboxguestdrivers_6.1.22.bb => vboxguestdrivers_6.1.26.bb}  |   6 +-
 meta-oe/recipes-test/pm-qa/pm-qa_git.bb                         |   3 +-
 26 files changed, 628 insertions(+), 304 deletions(-)
 create mode 100644
meta-networking/recipes-protocols/openlldp/files/lldp_head-remove-all-references.patch
 rename meta-networking/recipes-support/libtalloc/{libtalloc_2.3.2.bb =>
libtalloc_2.3.3.bb} (91%)
 rename meta-networking/recipes-support/nghttp2/{nghttp2_1.43.0.bb =>
nghttp2_1.44.0.bb} (93%)
 create mode 100644
meta-networking/recipes-support/ntopng/files/CVE-2021-36082.patch
 rename meta-networking/recipes-support/wireshark/{wireshark_3.4.6.bb =>
wireshark_3.4.7.bb} (97%)
 create mode 100644
meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2014-10402.patch
 rename meta-oe/recipes-devtools/php/{php_7.4.16.bb => php_7.4.21.bb} (99%)
 create mode 100644
meta-oe/recipes-extended/redis/redis/fix-CVE-2021-32625.patch
 delete mode 100644
meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/40-linux-5.13-support.patch
 rename
meta-oe/recipes-support/vboxguestdrivers/{vboxguestdrivers_6.1.22.bb =>
vboxguestdrivers_6.1.26.bb} (94%)

