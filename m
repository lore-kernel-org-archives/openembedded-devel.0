Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web12.28996.1610942949669371834
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Jan 2021 20:09:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sb6kfQEA;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id c22so10105837pgg.13
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 Jan 2021 20:09:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=275cNSE0iXQLsiQ/ypYC1E0Bw/Nr9nMZBNz/JfNkzuw=;
        b=sb6kfQEAAzwOQp3x49zx4TmE19jeVcCQbA05bArrWIOLx7P5VSQwA9PZGVw1vrJ1c2
         Ilv0itO4igaAnY1sVk2IWogyKZOVTy7LrVokhZkp5f5b0lGEGagNcnoiiMiuvlq5RmTg
         pdhRwsYkjhtXDUSFI+hYPHrqbb9LbFTOO5pfcAPi7zoIDKtin7F8FsGecIxYAJVH9nq8
         wPBaK6UYwguG0bQ/e0lIYmiPfUfYjEZEm/K76P/KAD3ft2pHXgqmSjRUtzttUEMSBdpf
         RiZIBV0j+9qMLS7zxEjYTfkqww2cCyMk+zYDTKgZWRteOCxmRsxSHe4ofwmSUk1upIaU
         1Eww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-transfer-encoding:content-language;
        bh=275cNSE0iXQLsiQ/ypYC1E0Bw/Nr9nMZBNz/JfNkzuw=;
        b=ZIawz1e6BpVMnF4Q7biAuBbcriVy9J4PH5LpPUI8NEsOl4kUQorl3qsOJQ8+T9Hzi8
         v9m6h2C2WvX9jqRIedIMt9oy8ExTGYtoRwpfPQlPFksjfUhcuvqjhorCacbwv+boK9wW
         sY6oqUDfVCs8dJuEst/ge/m6YUKTVDJ6RfjXZvIQuyCcqrSJ2QLK/gvslQPTtl0tqSXQ
         Xqp4fMmBSeWVQZT3c7hfBgx0sPzH0/Sbe6d1igMU3aK4Gu9P7vVRnDNzIp/Huj4FqYwx
         Pzqx7oupZejiBaYbMIlcezdRjiPu2mWk5vjuUOkQbJV8kTZs0lRh5xs5EWU4njped/MR
         QoQQ==
X-Gm-Message-State: AOAM531JkR9ckE5+MkD/lqsz+i36xbol+1n/FOo35BALOTKBf6h/masg
	U/YCjVTXMfjx9gVpqT3EDBpNFti9damZUg==
X-Google-Smtp-Source: ABdhPJzrv+1oAPGkc2GbvRaQzqYqtXm3x9DArRVidcBTclMmOb1W8tp4mE8sK0pGifOzACBXbhchFg==
X-Received: by 2002:a05:6a00:1623:b029:1a4:e935:87a8 with SMTP id e3-20020a056a001623b02901a4e93587a8mr24020998pfc.26.1610942948848;
        Sun, 17 Jan 2021 20:09:08 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:64d8:445c:d3ae:b514? ([2601:202:4180:a5c0:64d8:445c:d3ae:b514])
        by smtp.gmail.com with ESMTPSA id h24sm14849631pfq.13.2021.01.17.20.09.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Jan 2021 20:09:08 -0800 (PST)
Subject: Re: [oe] [dunfell 00/28] Patch review Jan 17th
To: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
References: <cover.1610905441.git.akuster808@gmail.com>
 <CALbNGRRUDhOSUiqAPBeTiuRofNy8Z0tUcq0n4=HQ3RqM_DzHBA@mail.gmail.com>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <b4eeb75d-7ea2-1439-12e8-6dc6de91d756@gmail.com>
Date: Sun, 17 Jan 2021 20:09:07 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CALbNGRRUDhOSUiqAPBeTiuRofNy8Z0tUcq0n4=HQ3RqM_DzHBA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 1/17/21 12:38 PM, Andreas Müller wrote:
> On Sun, Jan 17, 2021 at 6:46 PM akuster <akuster808@gmail.com> wrote:
>> Here is the next batch for Dunfell. Please review and have comments back by Wednesday.
>>
>> The following changes since commit f2d02cb71eaff8eb285a1997b30be52486c160ae:
>>
>>   python3-pyinotify: Add missing ctypes dependency (2020-11-15 11:13:25 -0800)
>>
>> are available in the Git repository at:
>>
>>   git://git.openembedded.org/meta-openembedded-contrib stable/dunfell-nut
>>   http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=stable/dunfell-nut
>>
>> Armin Kuster (5):
>>   wireguard-module: fix build issue with 5.4 kernel
>>   mariadb: update to 10.4.17 for cve fixes
>>   lua: update to 5.3.6
>>   nss: Security fix CVE-2020-12401
>>   wireshark: Several securtiy fixes
>>
>> Chenxi Mao (1):
>>   geoclue: select avahi-daemon if nmea enabled
>>
>> Gianfranco (1):
>>   dlt-daemon: add upstream patch to fix CVE-2020-29394
>>
>> Khem Raj (4):
>>   nodejs: Fix build with icu 67.1
>>   nodejs: Upgrade to 12.18.3
>>   nodejs: Fix arm32/thumb builds with clang
>>   nodejs: Update to 12.19.0
>>
>> Leon Anavi (1):
>>   php: Upgrade 7.4.4 -> 7.4.9
>>
>> Max Kellermann (1):
>>   php: remove the failing ${D}/${TMPDIR} code
>>
>> Roland Hieber (1):
>>   pcsc-lite: provide pcsc-lite-lib-native explicitly for native build
>>
>> Sakib Sajal (1):
>>   apache2: upgrade v2.4.43 -> v2.4.46
>>
>> Sean Nyekjaer (1):
>>   nodejs: 12.19.1 -> 12.20.1
>>
>> Stacy Gaikovaia (1):
>>   nodejs: 12.19.0 -> 12.19.1
>>
>> Wang Mingyu (1):
>>   zabbix: CVE-2020-15803 Security Advisory
>>
>> Wenlin Kang (2):
>>   lua: fix CVE-2020-15945
>>   lua: fix CVE-2020-24371
>>
>> Zang Ruochen (1):
>>   mcpp: Normalize the patch format of CVE
>>
>> Zheng Ruoqin (4):
>>   samba: CVE-2020-14318 Security Advisory
>>   samba: CVE-2020-14383 Security Advisory
>>   php: CVE-2020-7070
>>   php: CVE-2020-7069
>>
>> jabdoa2 (2):
>>   libsdl2-mixer: Fix ogg/vorbis support in libsdl2-mixer
>>   libsdl2-mixer: set --disable-music-ogg-shared to link statically
>>
>> viatsk (1):
>>   tcpdump: Patch for CVE-2020-8037
>>
>>  .../samba/samba/CVE-2020-14318.patch          | 142 +++++++++++++++
>>  .../samba/samba/CVE-2020-14383.patch          | 112 ++++++++++++
>>  .../samba/samba_4.10.18.bb                    |   2 +
>>  ...NC_-START-END-were-backported-to-5.4.patch |  29 +++
>>  .../wireguard-module_1.0.20200401.bb          |   3 +-
>>  ...ping-don-t-allocate-a-too-large-buff.patch |  70 ++++++++
>>  .../recipes-support/tcpdump/tcpdump_4.9.3.bb  |   1 +
>>  ...wireshark_3.2.7.bb => wireshark_3.2.10.bb} |   2 +-
>>  .../zabbix/zabbix/CVE-2020-15803.patch        |  36 ++++
>>  .../zabbix/zabbix_4.4.6.bb                    |   1 +
>>  ...e_10.4.12.bb => mariadb-native_10.4.17.bb} |   0
>>  meta-oe/recipes-dbs/mysql/mariadb.inc         |   6 +-
>>  ...-breakage-from-lock_guard-error-6161.patch |  32 ----
>>  .../mariadb/0001-Fix-library-LZ4-lookup.patch |  19 +-
>>  .../mysql/mariadb/c11_atomics.patch           |  24 ++-
>>  .../configure.cmake-fix-valgrind.patch        |  10 +-
>>  .../mariadb/fix-a-building-failure.patch      |  13 +-
>>  .../mysql/mariadb/fix-arm-atomic.patch        |  13 +-
>>  ...Lists.txt-fix-gen_lex_hash-not-found.patch |  12 +-
>>  ...akeLists.txt-fix-do_populate_sysroot.patch |  10 +-
>>  ...{mariadb_10.4.12.bb => mariadb_10.4.17.bb} |   0
>>  ...rriers-cannot-be-active-during-sweep.patch |  90 ++++++++++
>>  .../lua/lua/CVE-2020-15945.patch              | 167 ++++++++++++++++++
>>  .../lua/{lua_5.3.5.bb => lua_5.3.6.bb}        |   8 +-
>>  .../mcpp/files/CVE-2019-14274.patch           |  34 ++++
>>  .../mcpp/files/ice-mcpp.patch                 |  31 ----
>>  meta-oe/recipes-devtools/mcpp/mcpp_2.7.2.bb   |   3 +-
>>  ...gister-r7-because-llvm-now-issues-an.patch |  53 ++++++
>>  ...-passing-multiple-libs-to-pkg_config.patch |  41 -----
>>  ...allow-use-of-system-installed-brotli.patch |  66 -------
>>  ...Install-both-binaries-and-use-libdir.patch |  28 ++-
>>  .../{nodejs_12.14.1.bb => nodejs_12.20.1.bb}  |  12 +-
>>  .../php/php/CVE-2020-7069.patch               | 158 +++++++++++++++++
>>  .../php/php/CVE-2020-7070.patch               |  24 +++
>>  .../php/php/debian-php-fixheader.patch        |  27 +--
>>  .../php/{php_7.4.4.bb => php_7.4.9.bb}        |  16 +-
>>  .../dlt-daemon/dlt-daemon/275.patch           |  38 ++++
>>  .../dlt-daemon/dlt-daemon_2.18.4.bb           |   1 +
>>  .../libsdl/libsdl2-mixer_2.0.4.bb             |   2 +-
>>  .../geoclue/geoclue_2.5.3.bb                  |   2 +-
>>  .../nss/nss/CVE-2020-12401.patch              |  52 ++++++
>>  meta-oe/recipes-support/nss/nss_3.51.1.bb     |   1 +
>>  .../pcsc-lite/pcsc-lite_1.8.26.bb             |   1 +
>>  .../{apache2_2.4.43.bb => apache2_2.4.46.bb}  |   4 +-
>>  44 files changed, 1111 insertions(+), 285 deletions(-)
>>  create mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-2020-14318.patch
>>  create mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-2020-14383.patch
>>  create mode 100644 meta-networking/recipes-kernel/wireguard/files/0001-compat-SYM_FUNC_-START-END-were-backported-to-5.4.patch
>>  create mode 100644 meta-networking/recipes-support/tcpdump/tcpdump/0001-PPP-When-un-escaping-don-t-allocate-a-too-large-buff.patch
>>  rename meta-networking/recipes-support/wireshark/{wireshark_3.2.7.bb => wireshark_3.2.10.bb} (96%)
>>  create mode 100644 meta-oe/recipes-connectivity/zabbix/zabbix/CVE-2020-15803.patch
>>  rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.4.12.bb => mariadb-native_10.4.17.bb} (100%)
>>  delete mode 100644 meta-oe/recipes-dbs/mysql/mariadb/0001-Fix-build-breakage-from-lock_guard-error-6161.patch
>>  rename meta-oe/recipes-dbs/mysql/{mariadb_10.4.12.bb => mariadb_10.4.17.bb} (100%)
>>  create mode 100644 meta-oe/recipes-devtools/lua/lua/0001-Fixed-bug-barriers-cannot-be-active-during-sweep.patch
>>  create mode 100644 meta-oe/recipes-devtools/lua/lua/CVE-2020-15945.patch
>>  rename meta-oe/recipes-devtools/lua/{lua_5.3.5.bb => lua_5.3.6.bb} (87%)
>>  create mode 100644 meta-oe/recipes-devtools/mcpp/files/CVE-2019-14274.patch
>>  create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0001-Remove-use-of-register-r7-because-llvm-now-issues-an.patch
>>  delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0001-build-allow-passing-multiple-libs-to-pkg_config.patch
>>  delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0002-build-allow-use-of-system-installed-brotli.patch
>>  rename meta-oe/recipes-devtools/nodejs/{nodejs_12.14.1.bb => nodejs_12.20.1.bb} (94%)
>>  create mode 100644 meta-oe/recipes-devtools/php/php/CVE-2020-7069.patch
>>  create mode 100644 meta-oe/recipes-devtools/php/php/CVE-2020-7070.patch
>>  mode change 100755 => 100644 meta-oe/recipes-devtools/php/php/debian-php-fixheader.patch
>>  rename meta-oe/recipes-devtools/php/{php_7.4.4.bb => php_7.4.9.bb} (97%)
>>  create mode 100644 meta-oe/recipes-extended/dlt-daemon/dlt-daemon/275.patch
>>  create mode 100644 meta-oe/recipes-support/nss/nss/CVE-2020-12401.patch
>>  rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.43.bb => apache2_2.4.46.bb} (98%)
>>
> Hi Armin,
>
> maybe you take the graphviz patches into account I just sent out. As
> said in cover letter: graphviz is broken currently

sure thing.

thanks,
Armin
>
> Cheers
>
> Andreas

