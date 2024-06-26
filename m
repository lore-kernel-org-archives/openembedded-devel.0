Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30B1CC27C4F
	for <webhook@archiver.kernel.org>; Wed, 26 Jun 2024 19:01:03 +0000 (UTC)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
 by mx.groups.io with SMTP id smtpd.web10.35995.1719428456320404600
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Jun 2024 12:00:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aQnkZH1F;
 spf=pass (domain: gmail.com, ip: 209.85.160.41, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-25d5333989dso847220fac.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 Jun 2024 12:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719428455; x=1720033255; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qCeSkInEZZ+DewfNzhI7INPxA7GmPBprHmO6llJYQWo=;
        b=aQnkZH1FXNvdIO2ogylvwAg1vuZzrHDSKe9NGbMGkl8qjyD7SjKmAwceAfpRurNLkK
         tsYjPirdIpQ50+KGnoRjS/Z1muaDLr9DU4eOh66oIuMd6oDtevF9wGeCa6qVRNeAvzd5
         w3hKsSvVF1BHllFlPIo+SvranbLPXQlFr2Gg1BB2ovKsd6MTV0yqCdQ1wEGBmkKpJyhL
         kMAtrwXUM4+bB/6udbe7tpqizt5RArXF0mB1BCBip46PBQoL20MJc6ibt716qaEWFyCN
         Te5FhQGJPgewStGEd9UvF2AmBzQXMLiXkQECD6BFZjp1PLqstfUlpCSHtNsuskAWofTY
         CqwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719428455; x=1720033255;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qCeSkInEZZ+DewfNzhI7INPxA7GmPBprHmO6llJYQWo=;
        b=jPVaTKBDkuXv1Vy0PcklIFXsqO9Iekn6AjqWv1bVzIy3OkF/qru90GNgTvUlW0LIx+
         E6YoIS6MdvtlSlI+9ZFmG/5suT2H/dpTovQcsoJhLv3nPeWFdQu/NThxsb+rlKrRYK2z
         7DBVcaMcaGApyOUHxxiAQC9eDHGIe5y46LW8UUYjagau6dIXffiMlu8IlvwK736GBLol
         XQv+bW9S5RHk133d/R95nLtFtn7qhYJKUJU/8tVWtXWr8qbCfSbZxPJywTJbmp/RFboj
         bbXwdym7kyDP/PctI3uDUwUDDfp8zmuaaTbLrcAW3svI48aJxuyubiryhAs8HU+L4HpB
         exyw==
X-Gm-Message-State: AOJu0YyDGbVGL7h84I4IfqIwChu+wO30/2yoxBhVbnDGcZWbENRyXkSd
	1oYPyXOk0sNY8zQ0pi5Y34I76rglccEaUs+t5smIxioqmgF63+R5e5P/FAix7swvwbrFmgs7LAo
	2840YAkZ5CJOY5jOvL9fVTr1NVvI=
X-Google-Smtp-Source: AGHT+IHJRA7eDOn00sRoNQWAiGTH+rMUDpXKfXMo8giwcMFhVqSSV8gB+0NuVNGq7yqQyEbSKEMvwMgNKkHFIndt9Os=
X-Received: by 2002:a05:6871:548:b0:220:873d:dbcc with SMTP id
 586e51a60fabf-25d06ebbd19mr12929317fac.49.1719428455331; Wed, 26 Jun 2024
 12:00:55 -0700 (PDT)
MIME-Version: 1.0
References: <7037c6fb-85d8-4fe9-b0b7-20568872c3ac@gmail.com>
In-Reply-To: <7037c6fb-85d8-4fe9-b0b7-20568872c3ac@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 26 Jun 2024 12:00:28 -0700
Message-ID: <CAMKF1spu+O7hp3AyN0xn+jt29qkdE2QPUFDtZzKuUtpPVdwcWw@mail.gmail.com>
Subject: Re: scarthgap merge request: June 26th
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Jun 2024 19:01:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111115

merged thanks Armin

On Wed, Jun 26, 2024 at 11:50=E2=80=AFAM akuster808 <akuster808@gmail.com> =
wrote:
>
> The following changes since commit 4a7bb77f7ebe0ac8be5bab5103d8bd993e17e1=
8d:
>
>    pcapplusplus: Fix build with gcc14 (2024-06-02 14:57:06 -0400)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded scarthgap-next
>
> for you to fetch changes up to 78a14731cf0cf38a19ff8bd0e9255b319afaf3a7:
>
>    php: Upgrade to 8.2.20 (2024-06-26 07:33:55 -0400)
>
> ----------------------------------------------------------------
> Bartosz Golaszewski (1):
>        libgpiod: update to v2.1.2
>
> Changqing Li (1):
>        python3-grpcio: fix do_compile failure for qemuppc64/qemuppc
>
> Gerard Salvatella (1):
>        libwebsockets: fix buildpath warnings
>
> Gu=C3=B0ni M=C3=A1r Gilbert (2):
>        python3-twisted: prepend split PACKAGES
>        python3-twisted: remove obsolete python3-twisted-flow
>
> Hitendra Prajapati (1):
>        tcpdump: fix CVE-2024-2397
>
> Kai Kang (1):
>        daq: fix incompatible pointer type error
>
> Martin Jansa (1):
>        libwebsockets: remove STAGING_LIBDIR with /
>
> Peter Marko (4):
>        re2: remove dev dependencies from main package
>        re2: rework solibs handling
>        jemalloc: add +git to version
>        cjson: fix buildpath warnings
>
> Randolph Sapp (1):
>        vulkan-cts: add workaround for createMeshShaderMiscTestsEXT
>
> Scott Murray (1):
>        abseil-cpp: backport RISC-V fix
>
> Siddharth Doshi (1):
>        nano: Security fix for CVE-2024-5742
>
> Soumya Sambu (2):
>        unixodbc: Fix CVE-2024-1013
>        php: Upgrade to 8.2.20
>
> Vijay Anusuri (2):
>        c-ares: Update SRC tarball path
>        tipcutils: Add systemd support
>
> Wang Mingyu (1):
>        uriparser: upgrade 0.9.7 -> 0.9.8
>
> Yoann Congal (1):
>        libfido2: remove non-functional native and nativesdk BBCLASSEXTEND
>
> Zhang Peng (1):
>        hiredis: change ptest output format
>
> gr embeter (1):
>        python3-pytest-html: add missing runtime dependencies
>
> nikhil (1):
>        giflib: upgrade to version 5.2.2
>
>   meta-networking/recipes-connectivity/daq/daq_2.0.7.bb           | 1 +
>   .../daq/files/daq-fix-incompatible-pointer-type-error.patch     | 31
> +++++++
>   .../recipes-support/tcpdump/tcpdump/CVE-2024-2397.patch         | 129
> ++++++++++++++++++++++++++++
>   meta-networking/recipes-support/tcpdump/tcpdump_4.99.4.bb       | 1 +
>   .../recipes-connectivity/libwebsockets/libwebsockets_4.3.3.bb   | 2 +
>   .../0004-PR-1644-unscaledcycleclock-remove-RISC-V-support.patch | 82
> ++++++++++++++++++
>   meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20240116.2.bb    | 1 +
>   meta-oe/recipes-devtools/cjson/cjson_1.7.17.bb                  | 5 ++
>   .../files/add_suffix_to_convert_binary_used_in_Makefile.patch   | 42
> +++++++++
>   .../giflib/{giflib_5.2.1.bb =3D> giflib_5.2.2.bb} |   9 +-
>   meta-oe/recipes-devtools/jemalloc/jemalloc_5.3.0.bb             | 4 +-
>   meta-oe/recipes-devtools/php/{php_8.2.18.bb =3D> php_8.2.20.bb} |   2 +=
-
>   meta-oe/recipes-extended/hiredis/hiredis/run-ptest              | 17 ++=
+-
>   meta-oe/recipes-extended/tipcutils/tipcutils/tipcutils.conf     | 1 +
>   meta-oe/recipes-extended/tipcutils/tipcutils_git.bb             | 11 ++=
-
>   meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.3.7.3.bb        | 3 +
>   meta-oe/recipes-support/c-ares/c-ares_1.27.0.bb                 | 2 +-
>   meta-oe/recipes-support/libfido2/libfido2_1.14.0.bb             | 2 -
>   .../libgpiod/{libgpiod_2.1.1.bb =3D> libgpiod_2.1.2.bb} |   2 +-
>   meta-oe/recipes-support/nano/files/CVE-2024-5742.patch          | 101
> ++++++++++++++++++++++
>   meta-oe/recipes-support/nano/nano_7.2.bb                        | 4 +-
>   meta-oe/recipes-support/re2/re2_2024.03.01.bb                   | 8 +-
>   meta-oe/recipes-support/unixodbc/files/CVE-2024-1013.patch      | 53
> ++++++++++++
>   meta-oe/recipes-support/unixodbc/unixodbc_2.3.12.bb             | 1 +
>   .../uriparser/{uriparser_0.9.7.bb =3D> uriparser_0.9.8.bb} |   2 +-
>   .../0001-target.h-define-proper-macro-for-ppc-ppc64.patch       | 37
> ++++++++
>   meta-python/recipes-devtools/python/python3-grpcio_1.62.2.bb    | 1 +
>   .../recipes-devtools/python/python3-pytest-html_4.1.1.bb        | 2 +
>   meta-python/recipes-devtools/python/python3-twisted_24.3.0.bb   | 20 +-=
---
>   29 files changed, 539 insertions(+), 37 deletions(-)
>   create mode 100644
> meta-networking/recipes-connectivity/daq/files/daq-fix-incompatible-point=
er-type-error.patch
>   create mode 100644
> meta-networking/recipes-support/tcpdump/tcpdump/CVE-2024-2397.patch
>   create mode 100644
> meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0004-PR-1644-unscaledcycle=
clock-remove-RISC-V-support.patch
>   create mode 100644
> meta-oe/recipes-devtools/giflib/files/add_suffix_to_convert_binary_used_i=
n_Makefile.patch
>   rename meta-oe/recipes-devtools/giflib/{giflib_5.2.1.bb =3D>
> giflib_5.2.2.bb} (65%)
>   rename meta-oe/recipes-devtools/php/{php_8.2.18.bb =3D> php_8.2.20.bb} =
(99%)
>   create mode 100644
> meta-oe/recipes-extended/tipcutils/tipcutils/tipcutils.conf
>   rename meta-oe/recipes-support/libgpiod/{libgpiod_2.1.1.bb =3D>
> libgpiod_2.1.2.bb} (93%)
>   create mode 100644 meta-oe/recipes-support/nano/files/CVE-2024-5742.pat=
ch
>   create mode 100644
> meta-oe/recipes-support/unixodbc/files/CVE-2024-1013.patch
>   rename meta-oe/recipes-support/uriparser/{uriparser_0.9.7.bb =3D>
> uriparser_0.9.8.bb} (84%)
>   create mode 100644
> meta-python/recipes-devtools/python/python3-grpcio/0001-target.h-define-p=
roper-macro-for-ppc-ppc64.patch
>

