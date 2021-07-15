Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web08.6871.1626351116509131677
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Jul 2021 05:11:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=eom4QTJa;
 spf=pass (domain: ossystems.com.br, ip: 209.85.219.49, mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-qv1-f49.google.com with SMTP id ck17so2662941qvb.9
        for <openembedded-devel@lists.openembedded.org>; Thu, 15 Jul 2021 05:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=VdmuTnD2nOpT7BfgLstyti6LRzshw/xwE/ORUUaNJX4=;
        b=eom4QTJa61hYIs2OIOrV0m4Nn9dDhWGSlfycFOKtVv2szJIj74Y+TXalWts31HisPH
         Hm1DESB8ex4N/6ophYOj3QvLPhmRNI/CYk8z02mD4WbBazsA919N8Svoc6VT8HS8BJSK
         ykItjWmtoWOusKzW/uuEtqk/azHEPuUNHssDal2DwoBai3vdJZlPALn9rtnZ3BaZYMcQ
         nnbz5fvTyp8Hm/esHyp+EekVH1d1b8ZxltC9DsV3xWZ4LgA+9IoeCXOvDaWhVFKrd9R7
         /nnWZ2znQ+2KAMvyQ87t1ezIO7SFetl+ikKIfsRHjFxH1Pgj2iuxuWIC0QY3Fzdub6P5
         RTtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=VdmuTnD2nOpT7BfgLstyti6LRzshw/xwE/ORUUaNJX4=;
        b=kO9kIw3vtoIdFBWVedSp7yYNlKfT+6L5EvaEm+9yeYGntfDfb3vxuaq/oguIjehF2c
         iWX3bwJxOQ1RIUfdKXJ6XJ/ZzApr1FA+X6rwuVCkwccXq3Ux/nOOd8YpIyLZn4V+Xqhl
         lsXWKQ7CWY24rJ1K/xIrrMrhviScxYag9dlclOwqTOJR+jgDLlqWwQKsJr/CInaG+wRs
         CF4rMZx3QybOIMDxiDS6K7hb1h3TYOC6BBwPXfGKF3PWPSgU0JmEaS2rMaN6liVFtRDQ
         W2wX/5zrgDg2iZF2+3+JBEGLPNmGevt6jCcwjc1cPIL34vFX2xZqEbtX50J2kn1ne7JO
         m7nA==
X-Gm-Message-State: AOAM5311e5h5YBpiUBiUKLJ8Qsryc+T5/3AmJIddNB30irzprbXwdM4l
	LKvUvHoNBsdW+D+L4VRZSz6G/zkynxzLQSik
X-Google-Smtp-Source: ABdhPJwN9a6egMHz83g+ozIqc8XXpIqfZWa9rOps9QHVL+ouwG8yPj4E9J9MqcWGiD9mlr/mGZmjgA==
X-Received: by 2002:ad4:5144:: with SMTP id g4mr4061749qvq.3.1626351115412;
        Thu, 15 Jul 2021 05:11:55 -0700 (PDT)
Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com. [209.85.222.173])
        by smtp.gmail.com with ESMTPSA id c22sm1903527qtd.42.2021.07.15.05.11.54
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jul 2021 05:11:55 -0700 (PDT)
From: "Otavio Salvador" <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qk1-f173.google.com with SMTP id 201so4871408qkj.13
        for <openembedded-devel@lists.openembedded.org>; Thu, 15 Jul 2021 05:11:54 -0700 (PDT)
X-Received: by 2002:a37:a907:: with SMTP id s7mr3706041qke.247.1626351114670;
 Thu, 15 Jul 2021 05:11:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210715120558.182141-1-luan.rafael@ossystems.com.br>
In-Reply-To: <20210715120558.182141-1-luan.rafael@ossystems.com.br>
Date: Thu, 15 Jul 2021 09:11:42 -0300
X-Gmail-Original-Message-ID: <CAP9ODKqZu+KO17HNO0f6M+_98E4fDXwiP3QDpzEY7aV-N8tn_w@mail.gmail.com>
Message-ID: <CAP9ODKqZu+KO17HNO0f6M+_98E4fDXwiP3QDpzEY7aV-N8tn_w@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] libwebsockets: Update 4.2.0 -> 4.2.1
To: Luan Rafael Carneiro <luan.rafael@ossystems.com.br>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em qui., 15 de jul. de 2021 =C3=A0s 09:05, Luan Rafael Carneiro
<luan.rafael@ossystems.com.br> escreveu:
>
> Update the library to the 4.2.1 stable release.
> This commit includes following changes:
>
>     8a580b59 v4.2.1
>     e90f005a vhost: listen: protect listen port transfer between
>     041baf93 mbedtls: sessions: clean session on bail path
>     4038a7d4 windows: align plat insert socket POLLIN handling to linux
>     a310e16f socks5: cast for mingw3 nonposix recv args
>     439651fa openssl: manage _GNU_SOURCE better
>     c042ba8c mqtt: handle NULL mqtt publish metadata
>     04761c4b event libs: glib: use glib.h specifically
>     599d318a mqtt: coverity: help coverity see we wont have an mqtt role =
wsi without mqtt member allocated
>     bae99f63 tls: add option to serialize ssl handshake
>     ff1b8ed0 tls: fix inbalanced tls restrict borrow/return calls
>     ad3901d0 raw-proxy: fix role bind flag
>     4bc8b1a4 extpoll: clean up test server for Wconversion in extpoll par=
ts
>     eeea000c dns: handle EAI_NONAME as fatal
>     9e5acc05 minimal: hcmulti: modernize startup to use OPERATIONAL
>     55533f96 netlink: hold in COLDPLUG until we actually have some routin=
g table contents
>     fa1a7040 sspc: close: differentiate between ss and sspc at final wsi =
close
>     3f0fef17 gcc: gcc8 only recognizes fallthu
>     e319b15b minimal: ws client spam: modernize with pvo and cancel servi=
ce after interrupted
>     ea4d8008 service: fix casts for EXTERNAL_POLL
>     aea9d0ce tls-sessions: remove no stash warning
>     10c1b882 ss: check destroy null policy
>     e4aa3ece ss: check serialize null policy
>     4141a68f ss: avoid null ss policy on req tx len
>     de8185db ss: avoid null ss policy on req tx
>     526310df ss: h1: log dereferences NULL
>     7a283eba minimal: htt-client: send user agent and accept
>     3d13468e ctest: do not reuse ctest-ssp path
>     e3da2a3b android: getnameinfo uses nonstandard size_t
>     8398ef79 getifaddrs: casts for android
>     02ae95fa non-windows: explicit cast vaarg to mode_t
>     7c3c179e win32: client: just do WIN32 check
>     4c8195df windows: only conceal mode_t on windows
>     0ba8df6e threadpool: disassociate wsi on close
>     94c50618 tls: mbedtls: fix cast for dump helper
>     d896d401 freertos: check for forcing each time around service loop
>     cd87bc1c cmake: tls: use CHECK_SYMBOL_EXISTS
>     da17f018 plugin: post: check unexpected write after protocol unbind
>     1c935dff clean: else became a NOP
>     896a2e09 strexp: handle NULL better
>     aa090fc2 cygwin: include in unix type socket init
>     58a34cb0 examples: embedded: keep loop running on WROVER
>     85f772f2 OSX: Fixed can't find clock_gettime
>     014aa77e core-net: Remove unused variable
>     e1ef2301 ss: h2: handle zero length COLON_PATH for metadata
>     0557e919 sspc: handle nonexistent metadata cleanly
>     07bef6b8 coverity: ntp from blob: handle blob missing
>     2f9ed48d coverity: report problem in hpack_dynamic_size() to parent
>     d155970b coverity: h->cwsi must be valid if we are handling rx on it
>     2d97e343 ss: split out blob into own minimal example
>     c3dd4d05 ss: sspc: handle destroy for client_connect and request_tx
>
> Signed-off-by: Luan Rafael Carneiro <luan.rafael@ossystems.com.br>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>


--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
