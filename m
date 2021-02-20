Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web09.10538.1613846251339158830
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 20 Feb 2021 10:37:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=g2hQY34d;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id n10so7488968pgl.10
        for <openembedded-devel@lists.openembedded.org>; Sat, 20 Feb 2021 10:37:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=vWSQEfvwguDuYHw9zk98CoiS676QxwPUQgWN5F1Uj8U=;
        b=g2hQY34d7dhrRPMmfcV02GWQZVj9goyIlz1H2Y/J4KqVNaMX4/Si/idkxAGRx72OPm
         TLE9018w6eQoz+irVb+BP+nitedZCS+V2WodWtnS+eXE4S1+N4oO6xRnOm+CdQ2rl5WP
         ve8iDPypwlpe5LoHGC9gpvosV5nTfKwlj/B+kjRMVIenK/Mc/1qFrEqyw9jcodvqjEc2
         r5TvYNjnQz8IUw+fsrgds0jma/RgPhujPYMQWkdXAG84iNkN4rM6KHDcUdwg3/72qy3s
         2Bv43PmlunQ9VUbifVjWKf765ccfVHqM96MF5vGQyjWTOIoxnt4rD7ts4cBKddW2KT/p
         ZIaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=vWSQEfvwguDuYHw9zk98CoiS676QxwPUQgWN5F1Uj8U=;
        b=dT8FoXJ97AnEBdQ2cvjZpF9EG8MTzj2eCFL+aV8dcsgxMo74sxo06+GXdMHjKCqXUU
         SVAuaPd7BZTpRNE4CwYjFUXzgFmU4TwgndW06JxevzDIPGLJrAZCOs+8HbFKDdJtzbnS
         6TAV/ziIzwHYXyMt004czIwlwh/mqB1lMJFGp4/yZkiduoQLm49PmTGnDyvLI9E3iThI
         jhJ4HG28EwYwRNnywbZcGMgIIscmsaNsDe39/9iA9psWRD0ZUMg9I9OOVJXkftO29xnP
         ql0HIQHQ29v/GmgJ5eCsV50PLTztPUwSYyNyTRXMWPlampNy0yO4AcZBAcKr63y0laOs
         cGvQ==
X-Gm-Message-State: AOAM532mSRCy+Z9htLOFUlAsT1z1MZVzYu0+jZsKK3d/SGan/ZtY6Cn9
	4J0Fp5TDH+KghQ5ZVftQqlTpYbRzwVDzyg==
X-Google-Smtp-Source: ABdhPJw1XkXuNt8vDk0cXaEAsDCOtAapzSQZSrZjTn5oZJ6hfrYy66K/uc+0ufDU1D0pTWjz3LWBbg==
X-Received: by 2002:a62:503:0:b029:1c0:aed7:c88 with SMTP id 3-20020a6205030000b02901c0aed70c88mr14915093pff.76.1613846250586;
        Sat, 20 Feb 2021 10:37:30 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0::7bdf? ([2601:646:9200:a0f0::7bdf])
        by smtp.gmail.com with ESMTPSA id e17sm12283478pjh.39.2021.02.20.10.37.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 20 Feb 2021 10:37:30 -0800 (PST)
Subject: Re: meta-openembedded gatesgarth merge request Feb 20th
To: akuster808 <akuster808@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
References: <f45abe8c-bd3d-3d8c-a46b-b4491d729f0f@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <41fffeaa-cf2d-9c34-3658-f98066b18aac@gmail.com>
Date: Sat, 20 Feb 2021 10:37:28 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <f45abe8c-bd3d-3d8c-a46b-b4491d729f0f@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Thanks Armin applied.

On 2/20/21 9:39 AM, akuster808 wrote:
> The following changes since commit cef93b7b00e620d90a610112ee574fa60b691cf8:
> 
>    openldap: upgrade 2.4.56 -> 2.4.57 (2021-02-02 10:18:22 -0800)
> 
> are available in the Git repository at:
> 
>    https://git.openembedded.org/meta-openembedded gatesgarth-next
> 
> for you to fetch changes up to 945f062ff098dc9c8ba8d22c5eef88adec60730d:
> 
>    meta-oe/README: add Ubuntu prerequisite information (2021-02-15
> 08:19:35 -0800)
> 
> ----------------------------------------------------------------
> Armin Kuster (1):
>        lua: update to 5.3.6
> 
> Kai Kang (1):
>        mariadb: add package config zstd
> 
> Khem Raj (7):
>        mariadb: Fix build on 32bit arches with 64bit time_t
>        gedit: Inherit python3targetconfig
>        openipmi: Inherit python3targetconfig
>        libplist: Inherit python3targetconfig
>        postgresql: Inherit python3targetconfig
>        python-grpcio-tools: Add missing space for append
>        python3-pykwalify: Do not unset _PYTHON_SYSCONFIGDATA_NAME
> 
> Mario Schuknecht (1):
>        dnsmasq: Fix systemd service
> 
> Martin Jansa (1):
>        wireguard-module: remove PKG assignment
> 
> Mingli Yu (1):
>        mariadb: upgrade to 10.5.8
> 
> Qi.Chen@windriver.com (1):
>        minifi-cpp: set PSEUDO_CONSIDER_PATHS
> 
> Shlomi Vaknin (1):
>        python3-sh: remove python3-tests from RDEPENDS
> 
> Wang Mingyu (1):
>        dnsmasq: upgrade 2.82 -> 2.84
> 
> akuster (2):
>        enca: Fix SRC_URI
>        meta-oe/README: add Ubuntu prerequisite information
> 
> changqing.li@windriver.com (1):
>        celt051: update SRC_URI
> 
>   meta-gnome/recipes-gnome/gedit/gedit_3.36.2.bb     |  2 +-
>   .../wireguard/wireguard-module_1.0.20200908.bb     |  7 ----
>   .../recipes-support/celt051/celt051_git.bb         |  2 +-
>   .../recipes-support/dnsmasq/dnsmasq/lua.patch      |  9 ++---
>   .../recipes-support/dnsmasq/dnsmasq_2.82.bb        |  8 -----
>   .../recipes-support/dnsmasq/dnsmasq_2.84.bb        |  8 +++++
>   .../dnsmasq/files/dnsmasq-resolvconf.service       |  2 +-
>   .../recipes-support/openipmi/openipmi_2.0.29.bb    |  2 +-
>   meta-oe/README                                     |  3 ++
>   ...b-native_10.5.6.bb => mariadb-native_10.5.8.bb} |  0
>   meta-oe/recipes-dbs/mysql/mariadb.inc              |  5 ++-
>   ...se-Define-__NR_futex-if-it-does-not-exist.patch | 37
> +++++++++++++++++++++
>   ...-stacktrace-t.c-make-the-test-conditional.patch | 38
> ++++++++++++++++++++++
>   .../recipes-dbs/mysql/mariadb/c11_atomics.patch    | 14 ++++----
>   .../mysql/{mariadb_10.5.6.bb => mariadb_10.5.8.bb} |  0
>   meta-oe/recipes-dbs/postgresql/postgresql.inc      |  2 +-
>   .../lua/{lua_5.3.5.bb => lua_5.3.6.bb}             |  6 ++--
>   .../libimobiledevice/libplist_2.2.0.bb             |  2 +-
>   .../minifi-cpp/minifi-cpp_0.7.0.bb                 |  1 +
>   meta-oe/recipes-support/enca/enca_1.9.bb           |  7 ++--
>   .../python/python-grpcio-tools.inc                 |  2 +-
>   .../python/python3-pykwalify_1.7.0.bb              |  2 +-
>   .../recipes-devtools/python/python3-sh_1.14.1.bb   |  1 -
>   23 files changed, 117 insertions(+), 43 deletions(-)
>   delete mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq_2.82.bb
>   create mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq_2.84.bb
>   rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.5.6.bb =>
> mariadb-native_10.5.8.bb} (100%)
>   create mode 100644
> meta-oe/recipes-dbs/mysql/mariadb/0001-innobase-Define-__NR_futex-if-it-does-not-exist.patch
>   create mode 100644
> meta-oe/recipes-dbs/mysql/mariadb/0001-stacktrace-t.c-make-the-test-conditional.patch
>   rename meta-oe/recipes-dbs/mysql/{mariadb_10.5.6.bb =>
> mariadb_10.5.8.bb} (100%)
>   rename meta-oe/recipes-devtools/lua/{lua_5.3.5.bb => lua_5.3.6.bb} (92%)
> 
