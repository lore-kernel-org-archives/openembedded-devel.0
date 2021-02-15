Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web09.32777.1613404202124863749
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Feb 2021 07:50:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cOlwuArx;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id z15so4412243pfc.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 15 Feb 2021 07:50:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=6WbSAH0vSEjZqwtjkjVcj4PQhG/srRIVHeHkUwyITn4=;
        b=cOlwuArxsAUB2PWkpKy7QONm6kt3orrEGx7/vYB5UfvJ1hVFkNpqAM9cFPO5WOONk7
         zUJivUYX6w683mOAXOpdRxdatgtT5/tKusEzGFnkoYX94kb2zTg4evJ5P8Z0r9sO3HsV
         Uu+nM3POuqmTHZqpdAdpWD+yij638llIcb5bi5r3pYTvNc0pdZi2u3lfRvwboiILArQ+
         E3gviTWFErOn6TPaTwoAGX2U6WkeGUcchoZ+zfFIiYRtXa8C9z1vro8weVd+lfRqa9P5
         cJDrbQ5NUi2+uI9RoMoCOnhLbTHJNsA74f4BFsLueyDgbeChoUTI0ME+v0AbGLEjoGoE
         dlig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-transfer-encoding:content-language;
        bh=6WbSAH0vSEjZqwtjkjVcj4PQhG/srRIVHeHkUwyITn4=;
        b=dlHKqm65Jccb3isI1NJ/l/cajr9aO8/ArDAkg5tyfUIa3z24jpzk8BFd1mIk/GXvQE
         iQMIWlrE4I93u/zsqFrDmI0YiauOostKobq+QY4GVOIbWTQzFGO4Oy9Rr7yLJqdOKmwB
         J0SqYQbZALF2BnKqqMigNJH6JLgrkvgRLqIc8RX90miPEgAADlGbpvHg9j8J9EXSrmXw
         uAXH17y0sncndTHIfCR5oLNRKh659APch1gw8Nkc1lg7QyyMwOF61t0QLmXST6h92H3/
         PreN9zZNZAyd9JMf3Ru35uSpyawqW2OcbfDCX+4mkXo+bUkiHkWtk1ceQuWas+UyDUCl
         Obhw==
X-Gm-Message-State: AOAM531LFqpGD8DVuhCZd/stvBZHn+W1HAduwBUWNKqsVeGsUHfCRMUs
	lSp//PZ+dhIhrllvG7aTpOHnHYzgaNGvVw==
X-Google-Smtp-Source: ABdhPJx5W4R9vV5TAi2PZiOV/ZiY5Ivx89ND0/QJHLuAvhIhI7PF0/5Qo2WhhXTG/tcv6I5cDraxKA==
X-Received: by 2002:a62:1a4e:0:b029:1dc:5a62:c36b with SMTP id a75-20020a621a4e0000b02901dc5a62c36bmr15947633pfa.57.1613404201167;
        Mon, 15 Feb 2021 07:50:01 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:c8b8:7fc5:a225:bb8d? ([2601:202:4180:a5c0:c8b8:7fc5:a225:bb8d])
        by smtp.gmail.com with ESMTPSA id k9sm17329802pji.8.2021.02.15.07.50.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Feb 2021 07:50:00 -0800 (PST)
Subject: Re: [oe] [gatesgarth 00/15] Patch review Feb 14th
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
References: <cover.1613349480.git.akuster808@gmail.com>
 <CA+chaQfaQG3ZRRZ0r0D3EZKkjGOrhEVqAZTGkb823nE8UyEEwg@mail.gmail.com>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <94c706e0-779a-00a1-a23d-6b4c6b6dd674@gmail.com>
Date: Mon, 15 Feb 2021 07:49:59 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQfaQG3ZRRZ0r0D3EZKkjGOrhEVqAZTGkb823nE8UyEEwg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 2/15/21 12:49 AM, Martin Jansa wrote:
> Hi,
>
> this seems to be missing the top commit from:
> https://git.openembedded.org/meta-openembedded-contrib/log/?h=pkj/_PYTHON_SYSCONFIGDATA_NAME-gatesgarth
> so python3-grpcio-tools doesn't even parse since sysconfigdata were
> merged in oe-core.

Thanks.
I did run several builds with this series as I was having other build
issues around "python3targetconfig" changes.

I pull those in  too.

-armin
>
> Cheers,
>
> On Mon, Feb 15, 2021 at 2:13 AM akuster <akuster808@gmail.com
> <mailto:akuster808@gmail.com>> wrote:
>
>     Next set for Gatesgarth.
>     Please have feedback by Tuesday.
>
>     The following changes since commit
>     cef93b7b00e620d90a610112ee574fa60b691cf8:
>
>       openldap: upgrade 2.4.56 -> 2.4.57 (2021-02-02 10:18:22 -0800)
>
>     are available in the Git repository at:
>
>       git://git.openembedded.org/meta-openembedded-contrib
>     <http://git.openembedded.org/meta-openembedded-contrib>
>     stable/gatesgarth-nut
>      
>     http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=stable/gatesgarth-nut
>
>     Armin Kuster (1):
>       lua: update to 5.3.6
>
>     Kai Kang (1):
>       mariadb: add package config zstd
>
>     Khem Raj (5):
>       mariadb: Fix build on 32bit arches with 64bit time_t
>       gedit: Inherit python3targetconfig
>       openipmi: Inherit python3targetconfig
>       libplist: Inherit python3targetconfig
>       postgresql: Inherit python3targetconfig
>
>     Mario Schuknecht (1):
>       dnsmasq: Fix systemd service
>
>     Martin Jansa (1):
>       wireguard-module: remove PKG assignment
>
>     Mingli Yu (1):
>       mariadb: upgrade to 10.5.8
>
>     Qi.Chen@windriver.com <mailto:Qi.Chen@windriver.com> (1):
>       minifi-cpp: set PSEUDO_CONSIDER_PATHS
>
>     Shlomi Vaknin (1):
>       python3-sh: remove python3-tests from RDEPENDS
>
>     Wang Mingyu (1):
>       dnsmasq: upgrade 2.82 -> 2.84
>
>     akuster (1):
>       enca: Fix SRC_URI
>
>     changqing.li@windriver.com <mailto:changqing.li@windriver.com> (1):
>       celt051: update SRC_URI
>
>      .../recipes-gnome/gedit/gedit_3.36.2.bb <http://gedit_3.36.2.bb> 
>          |  2 +-
>      .../wireguard-module_1.0.20200908.bb
>     <http://wireguard-module_1.0.20200908.bb>          |  7 ----
>      .../recipes-support/celt051/celt051_git.bb
>     <http://celt051_git.bb>    |  2 +-
>      .../recipes-support/dnsmasq/dnsmasq/lua.patch |  9 +++--
>      .../recipes-support/dnsmasq/dnsmasq_2.82.bb
>     <http://dnsmasq_2.82.bb>   |  8 ----
>      .../recipes-support/dnsmasq/dnsmasq_2.84.bb
>     <http://dnsmasq_2.84.bb>   |  8 ++++
>      .../dnsmasq/files/dnsmasq-resolvconf.service  |  2 +-
>      .../openipmi/openipmi_2.0.29.bb <http://openipmi_2.0.29.bb>     
>              |  2 +-
>      ...ive_10.5.6.bb <http://ive_10.5.6.bb> =>
>     mariadb-native_10.5.8.bb <http://mariadb-native_10.5.8.bb>} |  0
>      meta-oe/recipes-dbs/mysql/mariadb.inc         |  5 ++-
>      ...fine-__NR_futex-if-it-does-not-exist.patch | 37 ++++++++++++++++++
>      ...ktrace-t.c-make-the-test-conditional.patch | 38
>     +++++++++++++++++++
>      .../mysql/mariadb/c11_atomics.patch           | 14 +++----
>      .../{mariadb_10.5.6.bb <http://mariadb_10.5.6.bb> =>
>     mariadb_10.5.8.bb <http://mariadb_10.5.8.bb>}  |  0
>      meta-oe/recipes-dbs/postgresql/postgresql.inc |  2 +-
>      .../lua/{lua_5.3.5.bb <http://lua_5.3.5.bb> => lua_5.3.6.bb
>     <http://lua_5.3.6.bb>}        |  6 +--
>      .../libimobiledevice/libplist_2.2.0.bb
>     <http://libplist_2.2.0.bb>        |  2 +-
>      .../minifi-cpp/minifi-cpp_0.7.0.bb <http://minifi-cpp_0.7.0.bb> 
>               |  1 +
>      meta-oe/recipes-support/enca/enca_1.9.bb <http://enca_1.9.bb>   
>       |  7 ++--
>      .../python/python3-sh_1.14.1.bb <http://python3-sh_1.14.1.bb>   
>                |  1 -
>      20 files changed, 112 insertions(+), 41 deletions(-)
>      delete mode 100644
>     meta-networking/recipes-support/dnsmasq/dnsmasq_2.82.bb
>     <http://dnsmasq_2.82.bb>
>      create mode 100644
>     meta-networking/recipes-support/dnsmasq/dnsmasq_2.84.bb
>     <http://dnsmasq_2.84.bb>
>      rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.5.6.bb
>     <http://mariadb-native_10.5.6.bb> => mariadb-native_10.5.8.bb
>     <http://mariadb-native_10.5.8.bb>} (100%)
>      create mode 100644
>     meta-oe/recipes-dbs/mysql/mariadb/0001-innobase-Define-__NR_futex-if-it-does-not-exist.patch
>      create mode 100644
>     meta-oe/recipes-dbs/mysql/mariadb/0001-stacktrace-t.c-make-the-test-conditional.patch
>      rename meta-oe/recipes-dbs/mysql/{mariadb_10.5.6.bb
>     <http://mariadb_10.5.6.bb> => mariadb_10.5.8.bb
>     <http://mariadb_10.5.8.bb>} (100%)
>      rename meta-oe/recipes-devtools/lua/{lua_5.3.5.bb
>     <http://lua_5.3.5.bb> => lua_5.3.6.bb <http://lua_5.3.6.bb>} (92%)
>
>     -- 
>     2.17.1
>
>
>     
>

