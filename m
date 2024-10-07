Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58011CFB44F
	for <webhook@archiver.kernel.org>; Mon,  7 Oct 2024 18:04:41 +0000 (UTC)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
 by mx.groups.io with SMTP id smtpd.web10.1693.1728324279496791892
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Oct 2024 11:04:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ICPOwC06;
 spf=pass (domain: gmail.com, ip: 209.85.167.171, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-3e2a1049688so2115745b6e.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 07 Oct 2024 11:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728324278; x=1728929078; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ti7dBgFfVCM/f6hOSsxmMGoV5thhw3aXJ5EsQJyQYhM=;
        b=ICPOwC06whXj7UMdGQRiGoA0qCbaFVILrWovTOJsht5a3ijFu6KG9q2bWWE2LYkK5d
         jr0fyCDixl/dK3xvb+MWltzaWcZhSaQEX3rfMIM7R3epUOwTDnkdnAePSgIy1fQzXyU7
         bobqwKGS2oyHrScW6aQI6uUROtO/og9AP81wyYsXSxoUNmRvgQXtXI6Oz52BhaChHBop
         xnPG+kRKb9OP7dZN3uL7EysATs/AY3lNMwio3+CtQJcKzcVxD1XXqRIxN3Wt8LwTdaNT
         GA/KdIXLFiBJQVspYQTkHlO1iOhXMOeYGJD5YIHeyYMtr2+I5+GvXTu6GiAHrZsZTseG
         lE0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728324278; x=1728929078;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ti7dBgFfVCM/f6hOSsxmMGoV5thhw3aXJ5EsQJyQYhM=;
        b=CT4oYeJkdEmqsIgWlj18YioeDWMYhBtYBcT0VcBunzfi2Yl2aB0TkqLuyAMZ+bAyN5
         ckdKVUXy1qfl0HlGS7ORidyjpLr1cF/L1QTjXxt3g38SHPdn5vS+WAklVTj5A2zChRYA
         6e9FbRp0HmMqi5VQI2nyKpSz/sZszLIpv++FCq3yQf/eUkALa/Fk7Efqh+kTyUbysfuQ
         XOBMJFkofIp3BBAh3g6RBLoRqQ/GKnmHx1YUYCGCg+fQgJG981kf5YhoKcSEqFcUKRBV
         z/7EEiTExqt+PXuuRBHfybDJrkZYdN3Mi0soW9uS9/h1QiaIUjlA6iUO1OB+gD8HZ4Ha
         EK3g==
X-Gm-Message-State: AOJu0Yy2TdGUxoxBpcZIrS8lL1eKmtqLJiDulQpL3aUgqrdWAGo0gJwG
	uEIAXhbUukqPj6FiBZw2Q67iuL53NFD/6we7IkAvwoBBscxW67z4Hewhg6IcGylaytehQOe7E+C
	204q2pFkItQv04obiOljdAxX6guA=
X-Google-Smtp-Source: AGHT+IEhhZiITVjU7cwsmxRZAXx8ds2mwXEJY92whIkjwW+zbl+WyI81bAG9pKs6wosbaDrX9bEc6gC7yP/3J4S9SYA=
X-Received: by 2002:a05:6870:9d98:b0:261:164e:d12a with SMTP id
 586e51a60fabf-287c1e55c5amr7586585fac.22.1728324277951; Mon, 07 Oct 2024
 11:04:37 -0700 (PDT)
MIME-Version: 1.0
References: <20241007130321.2873613-1-niko.mauno@vaisala.com>
In-Reply-To: <20241007130321.2873613-1-niko.mauno@vaisala.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 7 Oct 2024 11:04:12 -0700
Message-ID: <CAMKF1soMe+R3zgau7Hd+-h4aA7JyHff5Ubs0dW5FVeQLU82pAg@mail.gmail.com>
Subject: Re: [meta-oe][PATCH] fluentbit: Upgrade recipe to 3.1.9
To: Niko Mauno <niko.mauno@vaisala.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Oct 2024 18:04:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112700

Thanks for the patch, sadly it fails to build with clang + lld linker. See
https://errors.yoctoproject.org/Errors/Details/807488/

Perhaps its worth looking into if its finding a real issue underneath.

On Mon, Oct 7, 2024 at 6:10=E2=80=AFAM Niko Mauno <niko.mauno@vaisala.com> =
wrote:
>
> According to https://fluentbit.io/announcements/older-versions/
>
>   Security Policy: support for current series ends three months after a n=
ew series is released.
>
> Fluent Bit v1.9 Series has beel EOL since Dec 5, 2022, so upgrade the
> recipe to currently supported / newest available version.
>
> Relevant changelogs since previous 1.9.9 version of the component
>  - https://fluentbit.io/announcements/v2.0.0/
>  - https://fluentbit.io/announcements/v2.1.0/
>  - https://fluentbit.io/announcements/v2.2.0/
>  - https://fluentbit.io/announcements/v3.0.0/
>  - https://fluentbit.io/announcements/v3.1.0/
>  - https://fluentbit.io/announcements/v3.1.1/
>  - https://fluentbit.io/announcements/v3.1.2/
>  - https://fluentbit.io/announcements/v3.1.3/
>  - https://fluentbit.io/announcements/v3.1.4/
>  - https://fluentbit.io/announcements/v3.1.5/
>  - https://fluentbit.io/announcements/v3.1.6/
>  - https://fluentbit.io/announcements/v3.1.7/
>  - https://fluentbit.io/announcements/v3.1.8/
>  - https://fluentbit.io/announcements/v3.1.9/
>
> Associated added PACKAGECONFIG knobs are described for the most part in
> https://github.com/fluent/fluent-bit/blob/v3.1.9/CMakeLists.txt#L107-L167
>
> The PACKAGECONFIG knobs are named according to the constant names used
> in upstream source code. Please note that here the 'yaml' PACKAGECONFIG
> option has changed to 'config-yaml', and instead of 'kafka' there is
> now 'out-kafka'.
>
> As a related side note, the plugin options are now defined in
> https://github.com/fluent/fluent-bit/blob/v3.1.9/cmake/plugins_options.cm=
ake
>
> I have tested this change briefly against "qemuarm64" and "qemuppc"
> machines that the fluent-bit systemd service starts successfully in
> current master based core-image-minimal, and also on an i.MX6 board
> that the new Fluent Bit version seems to work as well as it did with
> the old 1.9.9 version with respect to logging in a Yocto Scarthgap
> based image.
>
> Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
> ---
>  .../packagegroups/packagegroup-meta-oe.bb     |   1 +
>  ...t-Do-not-use-private-makefile-target.patch |  64 ----------
>  .../0001-Use-posix-strerror_r-with-musl.patch |  34 ------
>  ...rivate-makefile-targets-in-CMakelist.patch | 106 ++++++++++++++++
>  ...ine-_GNU_SOURCE-for-memmem-API-check.patch |  28 -----
>  ...nkio-Link-with-fts-library-with-musl.patch |  30 -----
>  .../0002-mbedtls-Remove-unused-variable.patch |  40 ------
>  ...documentation-warning-as-error-with-.patch |  32 -----
>  ...0003-mbedtls-Do-not-overwrite-CFLAGS.patch |  34 ------
>  ...-to-store-return-from-flb_kv_item_cr.patch |  45 -------
>  ...md-init-systemd-detection-contingent.patch |  63 ----------
>  ...stackdriver-Fix-return-type-mismatch.patch |  33 -----
>  ...06-monkey-Fix-TLS-detection-testcase.patch |  36 ------
>  ...-not-check-for-upstart-on-build-host.patch |  46 -------
>  .../fluentbit/fluentbit_1.9.9.bb              |  97 ---------------
>  .../fluentbit/fluentbit_3.1.9.bb              | 114 ++++++++++++++++++
>  16 files changed, 221 insertions(+), 582 deletions(-)
>  delete mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit/0001-CMa=
keLists.txt-Do-not-use-private-makefile-target.patch
>  delete mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit/0001-Use=
-posix-strerror_r-with-musl.patch
>  create mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit/0001-lib=
-Do-not-use-private-makefile-targets-in-CMakelist.patch
>  delete mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit/0001-mon=
key-Define-_GNU_SOURCE-for-memmem-API-check.patch
>  delete mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit/0002-chu=
nkio-Link-with-fts-library-with-musl.patch
>  delete mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit/0002-mbe=
dtls-Remove-unused-variable.patch
>  delete mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit/0003-mbe=
dtls-Disable-documentation-warning-as-error-with-.patch
>  delete mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit/0003-mbe=
dtls-Do-not-overwrite-CFLAGS.patch
>  delete mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit/0004-Use=
-correct-type-to-store-return-from-flb_kv_item_cr.patch
>  delete mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit/0004-bui=
ld-Make-systemd-init-systemd-detection-contingent.patch
>  delete mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit/0005-sta=
ckdriver-Fix-return-type-mismatch.patch
>  delete mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit/0006-mon=
key-Fix-TLS-detection-testcase.patch
>  delete mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit/0007-cma=
ke-Do-not-check-for-upstart-on-build-host.patch
>  delete mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit_1.9.9.bb
>  create mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit_3.1.9.bb
>
> diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b=
/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> index 6dbe194cd..78239b1ea 100644
> --- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> +++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> @@ -333,6 +333,7 @@ RDEPENDS:packagegroup-meta-oe-extended =3D "\
>      dumb-init \
>      enscript \
>      figlet \
> +    fluentbit \
>      ${@bb.utils.contains("DISTRO_FEATURES", "x11", "gnuplot", "", d)} \
>      haveged \
>      hexedit \
> diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0001-CMakeLists=
.txt-Do-not-use-private-makefile-target.patch b/meta-oe/recipes-extended/fl=
uentbit/fluentbit/0001-CMakeLists.txt-Do-not-use-private-makefile-target.pa=
tch
> deleted file mode 100644
> index 0cabed963..000000000
> --- a/meta-oe/recipes-extended/fluentbit/fluentbit/0001-CMakeLists.txt-Do=
-not-use-private-makefile-target.patch
> +++ /dev/null
> @@ -1,64 +0,0 @@
> -From 6a704ab7bf69cd5d6970b3a7d3ae7798b26027c1 Mon Sep 17 00:00:00 2001
> -From: Paulo Neves <ptsneves@gmail.com>
> -Date: Thu, 28 Jul 2022 11:28:41 +0200
> -Subject: [PATCH] CMakeLists.txt Do not use private makefile $< target
> -
> -$< is a private detail from the Makefile generated by CMakefile and
> -are not under control or to be used at the CMakeLists level. In 3.20
> -that private generation changed pre-requisite targets[1] and now logs
> -contain the path compiler_depend.ts instead of the actual file.
> -
> -Upstream-Status: Pending [https://github.com/fluent/fluent-bit/issues/54=
92]
> ----
> - CMakeLists.txt              | 6 +-----
> - lib/chunkio/CMakeLists.txt  | 7 +------
> - lib/cmetrics/CMakeLists.txt | 7 +------
> - 3 files changed, 3 insertions(+), 17 deletions(-)
> -
> ---- a/CMakeLists.txt
> -+++ b/CMakeLists.txt
> -@@ -46,11 +46,7 @@ else()
> -   set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall")
> - endif()
> -
> --if(NOT ${CMAKE_SYSTEM_NAME} MATCHES "Windows")
> --  set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__FILENAME__=3D'\"$(subst ${CMA=
KE_SOURCE_DIR}/,,$(abspath $<))\"'")
> --else()
> --  set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__FILENAME__=3D__FILE__")
> --endif()
> -+set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__FILENAME__=3D__FILE__")
> -
> - if(${CMAKE_SYSTEM_PROCESSOR} MATCHES "armv7l")
> -   set(CMAKE_C_LINK_FLAGS "${CMAKE_C_LINK_FLAGS} -latomic")
> ---- a/lib/chunkio/CMakeLists.txt
> -+++ b/lib/chunkio/CMakeLists.txt
> -@@ -14,12 +14,7 @@ else()
> -   set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall ")
> - endif()
> -
> --# Set __FILENAME__
> --if(NOT ${CMAKE_SYSTEM_NAME} MATCHES "Windows")
> --  set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__FILENAME__=3D'\"$(subst ${CMA=
KE_SOURCE_DIR}/,,$(abspath $<))\"'")
> --else()
> --  set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__FILENAME__=3D__FILE__")
> --endif()
> -+set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__FILENAME__=3D__FILE__")
> -
> - include(cmake/macros.cmake)
> -
> ---- a/lib/cmetrics/CMakeLists.txt
> -+++ b/lib/cmetrics/CMakeLists.txt
> -@@ -34,12 +34,7 @@ set(CMT_VERSION_MINOR  3)
> - set(CMT_VERSION_PATCH  7)
> - set(CMT_VERSION_STR "${CMT_VERSION_MAJOR}.${CMT_VERSION_MINOR}.${CMT_VE=
RSION_PATCH}")
> -
> --# Define __CMT_FILENAME__ consistently across Operating Systems
> --if(NOT ${CMAKE_SYSTEM_NAME} MATCHES "Windows")
> --  set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__CMT_FILENAME__=3D'\"$(subst $=
{CMAKE_SOURCE_DIR}/,,$(abspath $<))\"'")
> --else()
> --  set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__CMT_FILENAME__=3D__FILE__")
> --endif()
> -+set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__CMT_FILENAME__=3D__FILE__")
> -
> - # Configuration options
> - option(CMT_DEV                       "Enable development mode"         =
          No)
> diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0001-Use-posix-=
strerror_r-with-musl.patch b/meta-oe/recipes-extended/fluentbit/fluentbit/0=
001-Use-posix-strerror_r-with-musl.patch
> deleted file mode 100644
> index 8d89e4df3..000000000
> --- a/meta-oe/recipes-extended/fluentbit/fluentbit/0001-Use-posix-strerro=
r_r-with-musl.patch
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -From f645128082117a0152a95b3dccd869a184b7513f Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Wed, 10 Aug 2022 01:23:48 -0700
> -Subject: [PATCH 1/2] Use posix strerror_r with musl
> -
> -Default with glibc is GNU extention of strerror_r
> -where as musl uses posix variant, call that out
> -
> -Upstream-Status: Inappropriate [Need wider porting beyond linux/musl/gli=
bc]
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - src/flb_network.c | 5 +++++
> - 1 file changed, 5 insertions(+)
> -
> -diff --git a/src/flb_network.c b/src/flb_network.c
> -index 992eb1d..5d7a337 100644
> ---- a/src/flb_network.c
> -+++ b/src/flb_network.c
> -@@ -506,7 +506,12 @@ static int net_connect_async(int fd,
> -             }
> -
> -             /* Connection is broken, not much to do here */
> -+#ifdef __GLIBC__
> -             str =3D strerror_r(error, so_error_buf, sizeof(so_error_buf=
));
> -+#else
> -+            strerror_r(error, so_error_buf, sizeof(so_error_buf));
> -+          str =3D so_error_buf;
> -+#endif
> -             flb_error("[net] TCP connection failed: %s:%i (%s)",
> -                       u->tcp_host, u->tcp_port, str);
> -             return -1;
> ---
> -2.37.1
> -
> diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0001-lib-Do-not=
-use-private-makefile-targets-in-CMakelist.patch b/meta-oe/recipes-extended=
/fluentbit/fluentbit/0001-lib-Do-not-use-private-makefile-targets-in-CMakel=
ist.patch
> new file mode 100644
> index 000000000..233e8c4e3
> --- /dev/null
> +++ b/meta-oe/recipes-extended/fluentbit/fluentbit/0001-lib-Do-not-use-pr=
ivate-makefile-targets-in-CMakelist.patch
> @@ -0,0 +1,106 @@
> +From 940a4e270bb8879a78c0eac4daf997cb77e25b4b Mon Sep 17 00:00:00 2001
> +From: Niko Mauno <niko.mauno@vaisala.com>
> +Date: Sun, 29 Sep 2024 12:00:00 +0000
> +Subject: [PATCH] lib: Do not use private makefile targets in CMakelists.=
txt
> +
> +By extending the scope of changes introduced in commit
> +fc325524d50fe179b76f127243ab9e03ddbdaaa4
> +("build: CMakeLists.txt Do not use private makefile targets (#5819)")
> +we mitigate the following error produced by BitBake in Yocto
> +
> +  ERROR: fluentbit-3.1.9-r0 do_package_qa: QA Issue: File /usr/bin/fluen=
t-bit in package fluentbit contains reference to TMPDIR [buildpaths]
> +  ERROR: fluentbit-3.1.9-r0 do_package_qa: Fatal QA errors were found, f=
ailing task.
> +
> +stemming from
> +
> +  $ strings packages-split/fluentbit/usr/bin/fluent-bit
> +  ...
> +  $(subst /yocto/upstream/build/tmp/work/cortexa57-poky-linux/fluentbit/=
3.1.9/git/,,$(abspath $<))
> +  ...
> +
> +Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
> +
> +Upstream-Status: Submitted [https://github.com/fluent/fluent-bit/pull/94=
50]
> +---
> + lib/cfl/CMakeLists.txt      | 8 ++------
> + lib/cmetrics/CMakeLists.txt | 8 ++------
> + lib/ctraces/CMakeLists.txt  | 8 ++------
> + lib/monkey/CMakeLists.txt   | 4 ----
> + 4 files changed, 6 insertions(+), 22 deletions(-)
> +
> +diff --git a/lib/cfl/CMakeLists.txt b/lib/cfl/CMakeLists.txt
> +index 2193cb29c..e2a5cba37 100644
> +--- a/lib/cfl/CMakeLists.txt
> ++++ b/lib/cfl/CMakeLists.txt
> +@@ -40,12 +40,8 @@ if(NOT MSVC)
> +   set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall")
> + endif()
> +
> +-# Define __FILENAME__ consistently across Operating Systems
> +-if(NOT ${CMAKE_SYSTEM_NAME} MATCHES "Windows")
> +-  set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__FILENAME__=3D'\"$$(subst ${CM=
AKE_SOURCE_DIR}/,,$$(abspath $$<))\"'")
> +-else()
> +-  set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__FILENAME__=3D__FILE__")
> +-endif()
> ++# Define __FILENAME__
> ++set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__FILENAME__=3D__FILE__")
> +
> +
> +
> +diff --git a/lib/cmetrics/CMakeLists.txt b/lib/cmetrics/CMakeLists.txt
> +index 4f2989106..9c40dadf4 100644
> +--- a/lib/cmetrics/CMakeLists.txt
> ++++ b/lib/cmetrics/CMakeLists.txt
> +@@ -60,12 +60,8 @@ if(NOT MSVC)
> +   set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall")
> + endif()
> +
> +-# Define __CMT_FILENAME__ consistently across Operating Systems
> +-if(NOT ${CMAKE_SYSTEM_NAME} MATCHES "Windows")
> +-  set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__CMT_FILENAME__=3D'\"$$(subst =
${CMAKE_SOURCE_DIR}/,,$$(abspath $$<))\"'")
> +-else()
> +-  set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__CMT_FILENAME__=3D__FILE__")
> +-endif()
> ++# Define __CMT_FILENAME__
> ++set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__CMT_FILENAME__=3D__FILE__")
> +
> + # Configuration options
> + option(CMT_DEV                       "Enable development mode"         =
          No)
> +diff --git a/lib/ctraces/CMakeLists.txt b/lib/ctraces/CMakeLists.txt
> +index e92834e06..5cebb3b73 100644
> +--- a/lib/ctraces/CMakeLists.txt
> ++++ b/lib/ctraces/CMakeLists.txt
> +@@ -30,12 +30,8 @@ set(CTR_VERSION_MINOR  5)
> + set(CTR_VERSION_PATCH  6)
> + set(CTR_VERSION_STR "${CTR_VERSION_MAJOR}.${CTR_VERSION_MINOR}.${CTR_VE=
RSION_PATCH}")
> +
> +-# Define __FILENAME__ consistently across Operating Systems
> +-if(NOT ${CMAKE_SYSTEM_NAME} MATCHES "Windows")
> +-  set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__FILENAME__=3D'\"$$(subst ${CM=
AKE_SOURCE_DIR}/,,$$(abspath $$<))\"'")
> +-else()
> +-  set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__FILENAME__=3D__FILE__")
> +-endif()
> ++# Define __FILENAME__
> ++set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__FILENAME__=3D__FILE__")
> +
> + # Configuration options
> + option(CTR_DEV             "Enable development mode"                   =
No)
> +diff --git a/lib/monkey/CMakeLists.txt b/lib/monkey/CMakeLists.txt
> +index 95d8cc1e6..8c66887da 100644
> +--- a/lib/monkey/CMakeLists.txt
> ++++ b/lib/monkey/CMakeLists.txt
> +@@ -15,10 +15,8 @@ include(GNUInstallDirs)
> + # Set default compiler options
> + if (NOT CMAKE_SYSTEM_NAME MATCHES "Windows")
> + set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -std=3Dgnu99 -Wall -Wextra")
> +-set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__FILENAME__=3D'\"$$(subst ${CMAK=
E_SOURCE_DIR}/,,$$(abspath \$$<))\"'")
> +-else()
> +-set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__FILENAME__=3D__FILE__")
> + endif()
> ++set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__FILENAME__=3D__FILE__")
> +
> + # Monkey Version
> + set(MK_VERSION_MAJOR  1)
> +--
> +2.39.2
> +
> diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0001-monkey-Def=
ine-_GNU_SOURCE-for-memmem-API-check.patch b/meta-oe/recipes-extended/fluen=
tbit/fluentbit/0001-monkey-Define-_GNU_SOURCE-for-memmem-API-check.patch
> deleted file mode 100644
> index e70664031..000000000
> --- a/meta-oe/recipes-extended/fluentbit/fluentbit/0001-monkey-Define-_GN=
U_SOURCE-for-memmem-API-check.patch
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -From 0d22024c5defba7007e3e633753790e20209c6f6 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Tue, 9 Aug 2022 09:59:41 -0700
> -Subject: [PATCH 1/5] monkey: Define _GNU_SOURCE for memmem API check
> -
> -This define is necessary to get this API on glibc based systems
> -
> -Upstream-Status: Pending
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - lib/monkey/mk_core/CMakeLists.txt | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/lib/monkey/mk_core/CMakeLists.txt b/lib/monkey/mk_core/CMak=
eLists.txt
> -index 0e74f8d..739fff3 100644
> ---- a/lib/monkey/mk_core/CMakeLists.txt
> -+++ b/lib/monkey/mk_core/CMakeLists.txt
> -@@ -62,6 +62,7 @@ set(src "${src}"
> -   )
> -
> - check_c_source_compiles("
> -+  #define _GNU_SOURCE
> -   #include <string.h>
> -   int main() {
> -      char  haystack[] =3D \"1234\";
> ---
> -2.37.1
> -
> diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0002-chunkio-Li=
nk-with-fts-library-with-musl.patch b/meta-oe/recipes-extended/fluentbit/fl=
uentbit/0002-chunkio-Link-with-fts-library-with-musl.patch
> deleted file mode 100644
> index bdcc53496..000000000
> --- a/meta-oe/recipes-extended/fluentbit/fluentbit/0002-chunkio-Link-with=
-fts-library-with-musl.patch
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -From 63dbbad5978e5f5b0e7d42614999cb6b4ebcce10 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Wed, 10 Aug 2022 01:27:16 -0700
> -Subject: [PATCH 2/2] chunkio: Link with fts library with musl
> -
> -Fixes
> -cio_utils.c:(.text+0x64): undefined reference to `fts_read'
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> -Upstream-Status: Pending
> -
> - lib/chunkio/src/CMakeLists.txt | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/lib/chunkio/src/CMakeLists.txt b/lib/chunkio/src/CMakeLists=
.txt
> -index a4fc2d3..4244eb8 100644
> ---- a/lib/chunkio/src/CMakeLists.txt
> -+++ b/lib/chunkio/src/CMakeLists.txt
> -@@ -13,6 +13,7 @@ set(src
> -   )
> -
> - set(libs cio-crc32)
> -+set(libs ${libs} fts)
> -
> - if(${CMAKE_SYSTEM_NAME} MATCHES "Windows")
> -   set(src
> ---
> -2.37.1
> -
> diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0002-mbedtls-Re=
move-unused-variable.patch b/meta-oe/recipes-extended/fluentbit/fluentbit/0=
002-mbedtls-Remove-unused-variable.patch
> deleted file mode 100644
> index d911420df..000000000
> --- a/meta-oe/recipes-extended/fluentbit/fluentbit/0002-mbedtls-Remove-un=
used-variable.patch
> +++ /dev/null
> @@ -1,40 +0,0 @@
> -From c7b969d1a2a6b61bd179214ee2516b7b6cd55b27 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Tue, 9 Aug 2022 11:21:57 -0700
> -Subject: [PATCH 2/5] mbedtls: Remove unused variable
> -
> -Fixes
> -library/bignum.c:1395:29: error: variable 't' set but not used [-Werror,=
-Wunused-but-set-variable]
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> -Upstream-Status: Pending
> -
> - lib/mbedtls-2.28.0/library/bignum.c | 4 +---
> - 1 file changed, 1 insertion(+), 3 deletions(-)
> -
> -diff --git a/lib/mbedtls-2.28.0/library/bignum.c b/lib/mbedtls-2.28.0/li=
brary/bignum.c
> -index 62e7f76..9c256ae 100644
> ---- a/lib/mbedtls-2.28.0/library/bignum.c
> -+++ b/lib/mbedtls-2.28.0/library/bignum.c
> -@@ -1392,7 +1392,7 @@ void mpi_mul_hlp( size_t i,
> -                   mbedtls_mpi_uint *d,
> -                   mbedtls_mpi_uint b )
> - {
> --    mbedtls_mpi_uint c =3D 0, t =3D 0;
> -+    mbedtls_mpi_uint c =3D 0;
> -
> - #if defined(MULADDC_HUIT)
> -     for( ; i >=3D 8; i -=3D 8 )
> -@@ -1443,8 +1443,6 @@ void mpi_mul_hlp( size_t i,
> -     }
> - #endif /* MULADDC_HUIT */
> -
> --    t++;
> --
> -     while( c !=3D 0 )
> -     {
> -         *d +=3D c; c =3D ( *d < c ); d++;
> ---
> -2.37.1
> -
> diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0003-mbedtls-Di=
sable-documentation-warning-as-error-with-.patch b/meta-oe/recipes-extended=
/fluentbit/fluentbit/0003-mbedtls-Disable-documentation-warning-as-error-wi=
th-.patch
> deleted file mode 100644
> index 473ebaf7d..000000000
> --- a/meta-oe/recipes-extended/fluentbit/fluentbit/0003-mbedtls-Disable-d=
ocumentation-warning-as-error-with-.patch
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -From 2d12629f768d2459b1fc8a8ca0c38024d84bc195 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Tue, 9 Aug 2022 11:32:12 -0700
> -Subject: [PATCH 3/5] mbedtls: Disable documentation warning as error wit=
h
> - clang
> -
> -There are shortcomings with doxygen info which clang-15+ flags, dont
> -treat them as errors
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> -Upstream-Status: Pending
> -
> - lib/mbedtls-2.28.0/CMakeLists.txt | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/lib/mbedtls-2.28.0/CMakeLists.txt b/lib/mbedtls-2.28.0/CMak=
eLists.txt
> -index b33c088..c5f886f 100644
> ---- a/lib/mbedtls-2.28.0/CMakeLists.txt
> -+++ b/lib/mbedtls-2.28.0/CMakeLists.txt
> -@@ -212,7 +212,7 @@ if(CMAKE_COMPILER_IS_GNU)
> - endif(CMAKE_COMPILER_IS_GNU)
> -
> - if(CMAKE_COMPILER_IS_CLANG)
> --    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall -Wextra -Wwrite-strings -=
Wpointer-arith -Wimplicit-fallthrough -Wshadow -Wvla -Wformat=3D2 -Wno-form=
at-nonliteral")
> -+      set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall -Wextra -Wwrite-strings=
 -Wpointer-arith -Wimplicit-fallthrough -Wshadow -Wvla -Wformat=3D2 -Wno-fo=
rmat-nonliteral -Wno-error=3Ddocumentation")
> -     set(CMAKE_C_FLAGS_COVERAGE    "-O0 -g3 --coverage")
> -     set(CMAKE_C_FLAGS_ASAN        "-fsanitize=3Daddress -fno-common -fs=
anitize=3Dundefined -fno-sanitize-recover=3Dall -O3")
> -     set(CMAKE_C_FLAGS_ASANDBG     "-fsanitize=3Daddress -fno-common -fs=
anitize=3Dundefined -fno-sanitize-recover=3Dall -O1 -g3 -fno-omit-frame-poi=
nter -fno-optimize-sibling-calls")
> ---
> -2.37.1
> -
> diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0003-mbedtls-Do=
-not-overwrite-CFLAGS.patch b/meta-oe/recipes-extended/fluentbit/fluentbit/=
0003-mbedtls-Do-not-overwrite-CFLAGS.patch
> deleted file mode 100644
> index 158857ae2..000000000
> --- a/meta-oe/recipes-extended/fluentbit/fluentbit/0003-mbedtls-Do-not-ov=
erwrite-CFLAGS.patch
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -From 8486b912281ae85db0c9fc05bb546f16872e114c Mon Sep 17 00:00:00 2001
> -From: Paulo Neves <ptsneves@gmail.com>
> -Date: Thu, 28 Jul 2022 14:37:18 +0200
> -Subject: [PATCH] mbedtls: Do not overwrite CFLAGS
> -
> -bitbake passes CFLAGS that are often in conflict with the ones set
> -in mbedtls' CMakeLists.txt. Such conflicts are the inability to use
> -FORTIFY_SOURCE=3D2 except in release mode
> -
> -Upstream-Status: Inappropriate [due to fluent-bit having it's own Releas=
e flags that also overwrite bitbake ones.]
> ----
> - lib/mbedtls-2.28.0/CMakeLists.txt | 2 --
> - 1 file changed, 2 deletions(-)
> -
> ---- a/lib/mbedtls-2.28.0/CMakeLists.txt
> -+++ b/lib/mbedtls-2.28.0/CMakeLists.txt
> -@@ -204,8 +204,6 @@ if(CMAKE_COMPILER_IS_GNU)
> -     if (GCC_VERSION VERSION_GREATER 7.0 OR GCC_VERSION VERSION_EQUAL 7.=
0)
> -       set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wformat-overflow=3D2 -Wforma=
t-truncation")
> -     endif()
> --    set(CMAKE_C_FLAGS_RELEASE     "-O2")
> --    set(CMAKE_C_FLAGS_DEBUG       "-O0 -g3")
> -     set(CMAKE_C_FLAGS_COVERAGE    "-O0 -g3 --coverage")
> -     set(CMAKE_C_FLAGS_ASAN        "-fsanitize=3Daddress -fno-common -fs=
anitize=3Dundefined -fno-sanitize-recover=3Dall -O3")
> -     set(CMAKE_C_FLAGS_ASANDBG     "-fsanitize=3Daddress -fno-common -fs=
anitize=3Dundefined -fno-sanitize-recover=3Dall -O1 -g3 -fno-omit-frame-poi=
nter -fno-optimize-sibling-calls")
> -@@ -215,8 +213,6 @@ endif(CMAKE_COMPILER_IS_GNU)
> -
> - if(CMAKE_COMPILER_IS_CLANG)
> -     set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall -Wextra -Wwrite-strings -=
Wpointer-arith -Wimplicit-fallthrough -Wshadow -Wvla -Wformat=3D2 -Wno-form=
at-nonliteral")
> --    set(CMAKE_C_FLAGS_RELEASE     "-O2")
> --    set(CMAKE_C_FLAGS_DEBUG       "-O0 -g3")
> -     set(CMAKE_C_FLAGS_COVERAGE    "-O0 -g3 --coverage")
> -     set(CMAKE_C_FLAGS_ASAN        "-fsanitize=3Daddress -fno-common -fs=
anitize=3Dundefined -fno-sanitize-recover=3Dall -O3")
> -     set(CMAKE_C_FLAGS_ASANDBG     "-fsanitize=3Daddress -fno-common -fs=
anitize=3Dundefined -fno-sanitize-recover=3Dall -O1 -g3 -fno-omit-frame-poi=
nter -fno-optimize-sibling-calls")
> diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0004-Use-correc=
t-type-to-store-return-from-flb_kv_item_cr.patch b/meta-oe/recipes-extended=
/fluentbit/fluentbit/0004-Use-correct-type-to-store-return-from-flb_kv_item=
_cr.patch
> deleted file mode 100644
> index bd4276193..000000000
> --- a/meta-oe/recipes-extended/fluentbit/fluentbit/0004-Use-correct-type-=
to-store-return-from-flb_kv_item_cr.patch
> +++ /dev/null
> @@ -1,45 +0,0 @@
> -From a797b79483940ed4adcaa5fe2c40dd0487c7c2c7 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Tue, 9 Aug 2022 11:39:08 -0700
> -Subject: [PATCH 4/5] Use correct type to store return from flb_kv_item_c=
reate
> -
> -Fix
> -error: incompatible pointer to integer conversion assigning to 'int' fro=
m 'struct flb_kv *'
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> -Upstream-Status: Pending
> -
> - plugins/out_stackdriver/stackdriver_conf.c | 4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/plugins/out_stackdriver/stackdriver_conf.c b/plugins/out_st=
ackdriver/stackdriver_conf.c
> -index a9a8eb0..e4f969e 100644
> ---- a/plugins/out_stackdriver/stackdriver_conf.c
> -+++ b/plugins/out_stackdriver/stackdriver_conf.c
> -@@ -176,12 +176,12 @@ static int read_credentials_file(const char *cred_=
file, struct flb_stackdriver *
> -
> - static int parse_configuration_labels(struct flb_stackdriver *ctx)
> - {
> --    int ret;
> -     char *p;
> -     flb_sds_t key;
> -     flb_sds_t val;
> -     struct mk_list *head;
> -     struct flb_slist_entry *entry;
> -+    struct flb_kv *ret;
> -     msgpack_object_kv *kv =3D NULL;
> -
> -     if (ctx->labels) {
> -@@ -216,7 +216,7 @@ static int parse_configuration_labels(struct flb_sta=
ckdriver *ctx)
> -             flb_sds_destroy(key);
> -             flb_sds_destroy(val);
> -
> --            if (ret =3D=3D -1) {
> -+            if (!ret) {
> -                 return -1;
> -             }
> -         }
> ---
> -2.37.1
> -
> diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0004-build-Make=
-systemd-init-systemd-detection-contingent.patch b/meta-oe/recipes-extended=
/fluentbit/fluentbit/0004-build-Make-systemd-init-systemd-detection-conting=
ent.patch
> deleted file mode 100644
> index f6e3dce2f..000000000
> --- a/meta-oe/recipes-extended/fluentbit/fluentbit/0004-build-Make-system=
d-init-systemd-detection-contingent.patch
> +++ /dev/null
> @@ -1,63 +0,0 @@
> -From 7a792624925d46690c1f07fe4b194b5f4c510db6 Mon Sep 17 00:00:00 2001
> -From: Paulo Neves <ptsneves@gmail.com>
> -Date: Tue, 2 Aug 2022 09:57:05 +0200
> -Subject: [PATCH 1/1] build: Make systemd init systemd detection continge=
nt on
> - pkgconfig
> -
> -Use pkg-config to get systemd.pc variables and systemdunitdir. Those
> -variable ensure that .service files are installed in the correct paths
> -and only when systemd is detected.
> -
> -Upstream-Status: Pending [https://github.com/fluent/fluent-bit/pull/5818=
]
> -
> ----
> - cmake/FindJournald.cmake | 4 ++++
> - src/CMakeLists.txt       | 4 ++--
> - 2 files changed, 6 insertions(+), 2 deletions(-)
> -
> -diff --git a/cmake/FindJournald.cmake b/cmake/FindJournald.cmake
> -index f5a3a832b..9e6657a29 100644
> ---- a/cmake/FindJournald.cmake
> -+++ b/cmake/FindJournald.cmake
> -@@ -5,6 +5,8 @@
> - #  JOURNALD_INCLUDE_DIR - the Journald include directory
> - #  JOURNALD_LIBRARIES - Link these to use Journald
> - #  JOURNALD_DEFINITIONS - Compiler switches required for using Journald
> -+#  SYSTEMD_UNITDIR - The systemd units' directory
> -+#
> - # Redistribution and use is allowed according to the terms of the BSD l=
icense.
> - # For details see the accompanying COPYING-CMAKE-SCRIPTS file.
> - #
> -@@ -16,7 +18,9 @@
> - # in the FIND_PATH() and FIND_LIBRARY() calls
> - find_package(PkgConfig)
> - pkg_check_modules(PC_JOURNALD QUIET systemd)
> -+pkg_get_variable(PC_SYSTEMD_UNITDIR systemd "systemdsystemunitdir")
> -
> -+set(SYSTEMD_UNITDIR ${PC_SYSTEMD_UNITDIR})
> - set(JOURNALD_FOUND ${PC_JOURNALD_FOUND})
> - set(JOURNALD_DEFINITIONS ${PC_JOURNALD_CFLAGS_OTHER})
> -
> -diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
> -index 522bbf9bd..30743d8d6 100644
> ---- a/src/CMakeLists.txt
> -+++ b/src/CMakeLists.txt
> -@@ -480,13 +480,13 @@ if(FLB_BINARY)
> -   endif()
> -
> -   # Detect init system, install upstart, systemd or init.d script
> --  if(IS_DIRECTORY /lib/systemd/system)
> -+  if(DEFINED SYSTEMD_UNITDIR)
> -     set(FLB_SYSTEMD_SCRIPT "${PROJECT_SOURCE_DIR}/init/${FLB_OUT_NAME}.=
service")
> -     configure_file(
> -       "${PROJECT_SOURCE_DIR}/init/systemd.in"
> -       ${FLB_SYSTEMD_SCRIPT}
> -       )
> --    install(FILES ${FLB_SYSTEMD_SCRIPT} COMPONENT binary DESTINATION /l=
ib/systemd/system)
> -+    install(FILES ${FLB_SYSTEMD_SCRIPT} COMPONENT binary DESTINATION ${=
SYSTEMD_UNITDIR})
> -     install(DIRECTORY DESTINATION ${FLB_INSTALL_CONFDIR} COMPONENT bina=
ry)
> -   elseif(IS_DIRECTORY /usr/share/upstart)
> -     set(FLB_UPSTART_SCRIPT "${PROJECT_SOURCE_DIR}/init/${FLB_OUT_NAME}.=
conf")
> ---
> -2.25.1
> -
> diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0005-stackdrive=
r-Fix-return-type-mismatch.patch b/meta-oe/recipes-extended/fluentbit/fluen=
tbit/0005-stackdriver-Fix-return-type-mismatch.patch
> deleted file mode 100644
> index f023ab573..000000000
> --- a/meta-oe/recipes-extended/fluentbit/fluentbit/0005-stackdriver-Fix-r=
eturn-type-mismatch.patch
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -From 27f0bd5a3339612e03112e6b490900a9fabc3337 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Tue, 9 Aug 2022 11:44:25 -0700
> -Subject: [PATCH 5/5] stackdriver: Fix return type mismatch
> -
> -Fix
> -error: incompatible integer to pointer conversion returning 'int' from a=
 function with result type 'flb_sds_t' (aka 'char *') [-Wint-conversion]
> -            return -1;
> -                   ^~
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> -Upstream-Status: Pending
> -
> - plugins/out_stackdriver/stackdriver.c | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/plugins/out_stackdriver/stackdriver.c b/plugins/out_stackdr=
iver/stackdriver.c
> -index ae66bf2..e01755c 100644
> ---- a/plugins/out_stackdriver/stackdriver.c
> -+++ b/plugins/out_stackdriver/stackdriver.c
> -@@ -2033,7 +2033,7 @@ static flb_sds_t stackdriver_format(struct flb_sta=
ckdriver *ctx,
> -             flb_sds_destroy(operation_producer);
> -             msgpack_unpacked_destroy(&result);
> -             msgpack_sbuffer_destroy(&mp_sbuf);
> --            return -1;
> -+            return NULL;
> -         }
> -
> -         /* Number of parsed labels */
> ---
> -2.37.1
> -
> diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0006-monkey-Fix=
-TLS-detection-testcase.patch b/meta-oe/recipes-extended/fluentbit/fluentbi=
t/0006-monkey-Fix-TLS-detection-testcase.patch
> deleted file mode 100644
> index c3f2574d2..000000000
> --- a/meta-oe/recipes-extended/fluentbit/fluentbit/0006-monkey-Fix-TLS-de=
tection-testcase.patch
> +++ /dev/null
> @@ -1,36 +0,0 @@
> -From f88d9b82e8bd8ae38fba666b5825ffb41769f81a Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Tue, 9 Aug 2022 12:25:22 -0700
> -Subject: [PATCH] monkey: Fix TLS detection testcase
> -
> -Clang15 errors out on compiling the check and disables TLS
> -
> -Fixes errors like
> -
> -error: call to undeclared function '__tls_get_addr'; ISO C99 and later d=
o not support implicit function declarations [-Wimplicit-function-declarati=
on]
> -         __tls_get_addr(0);
> -         ^
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> -Upstream-Status: Pending
> -
> - lib/monkey/CMakeLists.txt | 2 ++
> - 1 file changed, 2 insertions(+)
> -
> -diff --git a/lib/monkey/CMakeLists.txt b/lib/monkey/CMakeLists.txt
> -index 15e62e8..96ac2bd 100644
> ---- a/lib/monkey/CMakeLists.txt
> -+++ b/lib/monkey/CMakeLists.txt
> -@@ -178,6 +178,8 @@ endif()
> - # Use old Pthread TLS
> - if(NOT MK_PTHREAD_TLS)
> -   check_c_source_compiles("
> -+     #include <sys/types.h>
> -+     extern void *__tls_get_addr(size_t *v);
> -      __thread int a;
> -      int main() {
> -          __tls_get_addr(0);
> ---
> -2.37.1
> -
> diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0007-cmake-Do-n=
ot-check-for-upstart-on-build-host.patch b/meta-oe/recipes-extended/fluentb=
it/fluentbit/0007-cmake-Do-not-check-for-upstart-on-build-host.patch
> deleted file mode 100644
> index 71bdd34ee..000000000
> --- a/meta-oe/recipes-extended/fluentbit/fluentbit/0007-cmake-Do-not-chec=
k-for-upstart-on-build-host.patch
> +++ /dev/null
> @@ -1,46 +0,0 @@
> -From c41653e856d05ed430d22f8b311714ff756a0e0b Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Thu, 23 Mar 2023 18:05:27 -0700
> -Subject: [PATCH] cmake: Do not check for upstart on build host
> -
> -Some ubuntu distros might have this directory /usr/share/upstart around
> -and yocto based distros not using systemd will process this piece of
> -code and falsely assume that target supports upstart, which may not be
> -true in case of cross-compilation.
> -
> -This also can end up in configure errors e.g.
> -
> -| CMake Error at src/CMakeLists.txt:496 (install):
> -|   install DIRECTORY given unknown argument "/etc/td-agent-bit/".
> -|
> -|
> -| -- Configuring incomplete, errors occurred!
> -
> -Upstream-Status: Inappropriate [ Cross-compile Specific ]
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - src/CMakeLists.txt | 8 --------
> - 1 file changed, 8 deletions(-)
> -
> -diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
> -index bb30b2a..c63b6d8 100644
> ---- a/src/CMakeLists.txt
> -+++ b/src/CMakeLists.txt
> -@@ -486,14 +486,6 @@ if(FLB_BINARY)
> -       )
> -     install(FILES ${FLB_SYSTEMD_SCRIPT} COMPONENT binary DESTINATION ${=
SYSTEMD_UNITDIR})
> -     install(DIRECTORY DESTINATION ${FLB_INSTALL_CONFDIR} COMPONENT bina=
ry)
> --  elseif(IS_DIRECTORY /usr/share/upstart)
> --    set(FLB_UPSTART_SCRIPT "${PROJECT_SOURCE_DIR}/init/${FLB_OUT_NAME}.=
conf")
> --    configure_file(
> --      "${PROJECT_SOURCE_DIR}/init/upstart.in"
> --      ${FLB_UPSTART_SCRIPT}
> --      )
> --    install(FILES ${FLB_UPSTART_SCRIPT} COMPONENT binary DESTINATION /e=
tc/init)
> --    install(DIRECTORY DESTINATION COMPONENT binary ${FLB_INSTALL_CONFDI=
R})
> -   else()
> -     # FIXME: should we support Sysv init script ?
> -   endif()
> ---
> -2.40.0
> -
> diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit_1.9.9.bb b/meta=
-oe/recipes-extended/fluentbit/fluentbit_1.9.9.bb
> deleted file mode 100644
> index 660a3a63e..000000000
> --- a/meta-oe/recipes-extended/fluentbit/fluentbit_1.9.9.bb
> +++ /dev/null
> @@ -1,97 +0,0 @@
> -SUMMARY =3D "Fast Log processor and Forwarder"
> -DESCRIPTION =3D "Fluent Bit is a data collector, processor and  \
> -forwarder for Linux. It supports several input sources and \
> -backends (destinations) for your data. \
> -"
> -
> -HOMEPAGE =3D "http://fluentbit.io"
> -BUGTRACKER =3D "https://github.com/fluent/fluent-bit/issues"
> -
> -LICENSE =3D "Apache-2.0"
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D2ee41112a44fe7014dce33e26468b=
a93"
> -SECTION =3D "net"
> -
> -SRC_URI =3D "https://releases.fluentbit.io/1.9/source-${PV}.tar.gz;subdi=
r=3Dfluent-bit-${PV};downloadfilename=3D${BPN}-${PV}.tar.gz \
> -           file://0001-CMakeLists.txt-Do-not-use-private-makefile-target=
.patch \
> -           file://0002-flb_info.h.in-Do-not-hardcode-compilation-directo=
rie.patch \
> -           file://0003-mbedtls-Do-not-overwrite-CFLAGS.patch \
> -           file://0004-build-Make-systemd-init-systemd-detection-conting=
ent.patch \
> -           file://0001-monkey-Define-_GNU_SOURCE-for-memmem-API-check.pa=
tch \
> -           file://0002-mbedtls-Remove-unused-variable.patch \
> -           file://0003-mbedtls-Disable-documentation-warning-as-error-wi=
th-.patch \
> -           file://0004-Use-correct-type-to-store-return-from-flb_kv_item=
_cr.patch \
> -           file://0005-stackdriver-Fix-return-type-mismatch.patch \
> -           file://0006-monkey-Fix-TLS-detection-testcase.patch \
> -           file://0007-cmake-Do-not-check-for-upstart-on-build-host.patc=
h \
> -           "
> -SRC_URI:remove:x86 =3D "file://0002-mbedtls-Remove-unused-variable.patch=
"
> -SRC_URI:append:libc-musl =3D "\
> -           file://0001-Use-posix-strerror_r-with-musl.patch \
> -           file://0002-chunkio-Link-with-fts-library-with-musl.patch \
> -           "
> -SRC_URI[sha256sum] =3D "3f6cd4bd1894cda16b465aef6ffec7e920d54c4209b3e232=
0fcffe7ae345700e"
> -S =3D "${WORKDIR}/fluent-bit-${PV}"
> -
> -DEPENDS =3D "zlib bison-native flex-native openssl"
> -DEPENDS +=3D "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
> -
> -PACKAGECONFIG[yaml] =3D "-DFLB_CONFIG_YAML=3DOn,-DFLB_CONFIG_YAML=3DOff,=
libyaml"
> -PACKAGECONFIG[kafka] =3D "-DFLB_OUT_KAFKA=3DOn,-DFLB_OUT_KAFKA=3DOff,lib=
rdkafka"
> -PACKAGECONFIG[examples] =3D "-DFLB_EXAMPLES=3DOn,-DFLB_EXAMPLES=3DOff"
> -PACKAGECONFIG[jemalloc] =3D "-DFLB_JEMALLOC=3DOn,-DFLB_JEMALLOC=3DOff,je=
malloc"
> -#TODO add more fluentbit options to PACKAGECONFIG[]
> -
> -DEPENDS:append:libc-musl =3D " fts "
> -
> -# flex hardcodes the input file in #line directives leading to TMPDIR co=
ntamination of debug sources.
> -do_compile:append() {
> -    find ${B} -name '*.c' -or -name '*.h' | xargs sed -i -e 's|${TMPDIR}=
|${TARGET_DBGSRC_DIR}/|g'
> -}
> -
> -PACKAGECONFIG ?=3D "yaml"
> -
> -LTO =3D ""
> -
> -# Use CMake 'Unix Makefiles' generator
> -OECMAKE_GENERATOR ?=3D "Unix Makefiles"
> -
> -# Fluent Bit build options
> -# =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> -
> -# Host related setup
> -EXTRA_OECMAKE +=3D "-DGNU_HOST=3D${HOST_SYS} -DFLB_TD=3D1"
> -
> -# Disable LuaJIT and filter_lua support
> -EXTRA_OECMAKE +=3D "-DFLB_LUAJIT=3DOff -DFLB_FILTER_LUA=3DOff "
> -
> -# Disable Library and examples
> -EXTRA_OECMAKE +=3D "-DFLB_SHARED_LIB=3DOff"
> -
> -# Enable systemd iff systemd is in DISTRO_FEATURES
> -EXTRA_OECMAKE +=3D "${@bb.utils.contains('DISTRO_FEATURES','systemd','-D=
FLB_SYSTEMD=3DOn','-DFLB_SYSTEMD=3DOff',d)}"
> -
> -# Enable release builds
> -EXTRA_OECMAKE +=3D "-DFLB_RELEASE=3DOn"
> -
> -# musl needs these options
> -EXTRA_OECMAKE:append:libc-musl =3D ' -DFLB_JEMALLOC_OPTIONS=3D"--with-je=
malloc-prefix=3Dje_ --with-lg-quantum=3D3" -DFLB_CORO_STACK_SIZE=3D24576'
> -
> -EXTRA_OECMAKE:append:riscv64 =3D " -DCMAKE_C_STANDARD_LIBRARIES=3D-latom=
ic"
> -EXTRA_OECMAKE:append:riscv32 =3D " -DCMAKE_C_STANDARD_LIBRARIES=3D-latom=
ic"
> -EXTRA_OECMAKE:append:mips =3D " -DCMAKE_C_STANDARD_LIBRARIES=3D-latomic"
> -EXTRA_OECMAKE:append:powerpc =3D " -DCMAKE_C_STANDARD_LIBRARIES=3D-latom=
ic"
> -EXTRA_OECMAKE:append:x86 =3D " -DCMAKE_C_STANDARD_LIBRARIES=3D-latomic"
> -
> -CFLAGS:append:x86 =3D " -DMBEDTLS_HAVE_SSE2"
> -
> -# Fixes build with GCC-14
> -CFLAGS +=3D "-Wno-error=3Dincompatible-pointer-types"
> -
> -inherit cmake systemd pkgconfig
> -
> -SYSTEMD_SERVICE:${PN} =3D "td-agent-bit.service"
> -
> -EXTRA_OECMAKE +=3D "-DCMAKE_DEBUG_SRCDIR=3D${TARGET_DBGSRC_DIR}/"
> -TARGET_CC_ARCH +=3D " ${SELECTED_OPTIMIZATION}"
> -
> -SKIP_RECIPE[fluentbit] ?=3D "It is not reproducible. QA Issue: File /usr=
/bin/.debug/td-agent-bit in package fluentbit-dbg contains reference to TMP=
DIR [buildpaths]"
> diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit_3.1.9.bb b/meta=
-oe/recipes-extended/fluentbit/fluentbit_3.1.9.bb
> new file mode 100644
> index 000000000..e88b5e91a
> --- /dev/null
> +++ b/meta-oe/recipes-extended/fluentbit/fluentbit_3.1.9.bb
> @@ -0,0 +1,114 @@
> +SUMMARY =3D "Fast Log Processor and Forwarder"
> +DESCRIPTION =3D "Fluent Bit allows to collect log events or metrics from=
 \
> +different sources, process them and deliver them to different backends \
> +such as Fluentd, Elasticsearch, Splunk, DataDog, Kafka, New Relic, Azure=
 \
> +services, AWS services, Google services, NATS, InfluxDB or any custom \
> +HTTP end-point."
> +HOMEPAGE =3D "http://fluentbit.io"
> +BUGTRACKER =3D "https://github.com/fluent/fluent-bit/issues"
> +SECTION =3D "net"
> +LICENSE =3D "Apache-2.0"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D2ee41112a44fe7014dce33e26468b=
a93"
> +DEPENDS =3D "\
> +    bison-native \
> +    flex-native \
> +    ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
> +"
> +
> +SRCREV =3D "431fa79ae27edaef8d050a7af6f038f4400193a1"
> +SRC_URI =3D "\
> +    git://github.com/fluent/fluent-bit.git;branch=3D3.1;protocol=3Dhttps=
 \
> +    file://0001-lib-Do-not-use-private-makefile-targets-in-CMakelist.pat=
ch \
> +    file://0002-flb_info.h.in-Do-not-hardcode-compilation-directorie.pat=
ch \
> +"
> +
> +S =3D "${WORKDIR}/git"
> +
> +PACKAGECONFIG ??=3D "\
> +    aws \
> +    binary \
> +    config-yaml \
> +    custom-calyptia \
> +    http-server \
> +    inotify \
> +    metrics \
> +    parser \
> +    proxy-go \
> +    record-accessor \
> +    regex \
> +    release \
> +    signv4 \
> +    sqldb \
> +    stream-processor \
> +    tls \
> +    utf8-encoder \
> +"
> +
> +PACKAGECONFIG[all] =3D "-DFLB_ALL=3DYes,-DFLB_ALL=3DNo"
> +PACKAGECONFIG[arrow] =3D "-DFLB_ARROW=3DYes,-DFLB_ARROW=3DNo"
> +PACKAGECONFIG[avro-encoder] =3D "-DFLB_AVRO_ENCODER=3DYes,-DFLB_AVRO_ENC=
ODER=3DNo"
> +PACKAGECONFIG[aws-error-reporter] =3D "-DFLB_AWS_ERROR_REPORTER=3DYes,-D=
FLB_AWS_ERROR_REPORTER=3DNo"
> +PACKAGECONFIG[aws] =3D "-DFLB_AWS=3DYes,-DFLB_AWS=3DNo"
> +PACKAGECONFIG[backtrace] =3D "-DFLB_BACKTRACE=3DYes,-DFLB_BACKTRACE=3DNo=
"
> +PACKAGECONFIG[binary] =3D "-DFLB_BINARY=3DYes,-DFLB_BINARY=3DNo"
> +PACKAGECONFIG[chunk-trace] =3D "-DFLB_CHUNK_TRACE=3DYes,-DFLB_CHUNK_TRAC=
E=3DNo"
> +PACKAGECONFIG[config-yaml] =3D "-DFLB_CONFIG_YAML=3DYes,-DFLB_CONFIG_YAM=
L=3DNo,libyaml"
> +PACKAGECONFIG[coverage] =3D "-DFLB_COVERAGE=3DYes,-DFLB_COVERAGE=3DNo"
> +PACKAGECONFIG[custom-calyptia] =3D "-DFLB_CUSTOM_CALYPTIA=3DYes,-DFLB_CU=
STOM_CALYPTIA=3DNo"
> +PACKAGECONFIG[debug] =3D "-DFLB_DEBUG=3DYes,-DFLB_DEBUG=3DNo"
> +PACKAGECONFIG[enforce-alignment] =3D "-DFLB_ENFORCE_ALIGNMENT=3DYes,-DFL=
B_ENFORCE_ALIGNMENT=3DNo"
> +PACKAGECONFIG[examples] =3D "-DFLB_EXAMPLES=3DYes,-DFLB_EXAMPLES=3DNo"
> +PACKAGECONFIG[http-client-debug] =3D "-DFLB_HTTP_CLIENT_DEBUG=3DYes,-DFL=
B_HTTP_CLIENT_DEBUG=3DNo"
> +PACKAGECONFIG[http-server] =3D "-DFLB_HTTP_SERVER=3DYes,-DFLB_HTTP_SERVE=
R=3DNo"
> +PACKAGECONFIG[inotify] =3D "-DFLB_INOTIFY=3DYes,-DFLB_INOTIFY=3DNo"
> +PACKAGECONFIG[jemalloc] =3D "-DFLB_JEMALLOC=3DYes,-DFLB_JEMALLOC=3DNo,je=
malloc"
> +PACKAGECONFIG[luajit] =3D "-DFLB_LUAJIT=3DYes,-DFLB_LUAJIT=3DNo"
> +PACKAGECONFIG[metrics] =3D "-DFLB_METRICS=3DYes,-DFLB_METRICS=3DNo"
> +PACKAGECONFIG[mtrace] =3D "-DFLB_MTRACE=3DYes,-DFLB_MTRACE=3DNo"
> +PACKAGECONFIG[parser] =3D "-DFLB_PARSER=3DYes,-DFLB_PARSER=3DNo"
> +PACKAGECONFIG[posix-tls] =3D "-DFLB_POSIX_TLS=3DYes,-DFLB_POSIX_TLS=3DNo=
"
> +PACKAGECONFIG[proxy-go] =3D "-DFLB_PROXY_GO=3DYes,-DFLB_PROXY_GO=3DNo"
> +PACKAGECONFIG[record-accessor] =3D "-DFLB_RECORD_ACCESSOR=3DYes,-DFLB_RE=
CORD_ACCESSOR=3DNo"
> +PACKAGECONFIG[regex] =3D "-DFLB_REGEX=3DYes,-DFLB_REGEX=3DNo"
> +PACKAGECONFIG[release] =3D "-DFLB_RELEASE=3DYes,-DFLB_RELEASE=3DNo"
> +PACKAGECONFIG[run-ldconfig] =3D "-DFLB_RUN_LDCONFIG=3DYes,-DFLB_RUN_LDCO=
NFIG=3DNo"
> +PACKAGECONFIG[shared-lib] =3D "-DFLB_SHARED_LIB=3DYes,-DFLB_SHARED_LIB=
=3DNo"
> +PACKAGECONFIG[signv4] =3D "-DFLB_SIGNV4=3DYes,-DFLB_SIGNV4=3DNo"
> +PACKAGECONFIG[small] =3D "-DFLB_SMALL=3DYes,-DFLB_SMALL=3DNo"
> +PACKAGECONFIG[sqldb] =3D "-DFLB_SQLDB=3DYes,-DFLB_SQLDB=3DNo"
> +PACKAGECONFIG[stream-processor] =3D "-DFLB_STREAM_PROCESSOR=3DYes,-DFLB_=
STREAM_PROCESSOR=3DNo"
> +PACKAGECONFIG[tests-runtime] =3D "-DFLB_TESTS_RUNTIME=3DYes,-DFLB_TESTS_=
RUNTIME=3DNo"
> +PACKAGECONFIG[tls] =3D "-DFLB_TLS=3DYes,-DFLB_TLS=3DNo"
> +PACKAGECONFIG[trace] =3D "-DFLB_TRACE=3DYes,-DFLB_TRACE=3DNo"
> +PACKAGECONFIG[utf8-encoder] =3D "-DFLB_UTF8_ENCODER=3DYes,-DFLB_UTF8_ENC=
ODER=3DNo"
> +PACKAGECONFIG[valgrind] =3D "-DFLB_VALGRIND=3DYes,-DFLB_VALGRIND=3DNo"
> +PACKAGECONFIG[wamrc] =3D "-DFLB_WAMRC=3DYes,-DFLB_WAMRC=3DNo"
> +PACKAGECONFIG[wasm-stack-protect] =3D "-DFLB_WASM_STACK_PROTECT=3DYes,-D=
FLB_WASM_STACK_PROTECT=3DNo"
> +PACKAGECONFIG[wasm] =3D "-DFLB_WASM=3DYes,-DFLB_WASM=3DNo"
> +PACKAGECONFIG[windows-defaults] =3D "-DFLB_WINDOWS_DEFAULTS=3DYes,-DFLB_=
WINDOWS_DEFAULTS=3DNo"
> +
> +# Option to disable all Fluent Bit plugins by default. See cmake/plugins=
_options.cmake which
> +# individual plugins then to enable (e.g. using EXTRA_OECMAKE:append =3D=
 " -DFLB_FOOBAR=3DON")
> +PACKAGECONFIG[minimal] =3D "-DFLB_MINIMAL=3DYes,-DFLB_MINIMAL=3DNo"
> +
> +# Without zstd dependency, kafka plugin build fails at link attempt agai=
nst native libzstd.so
> +PACKAGECONFIG[in-kafka] =3D "-DFLB_IN_KAFKA=3DON,-DFLB_IN_KAFKA=3DOFF,li=
brdkafka zstd"
> +PACKAGECONFIG[out-kafka] =3D "-DFLB_OUT_KAFKA=3DON,-DFLB_OUT_KAFKA=3DOFF=
,librdkafka zstd"
> +
> +SYSTEMD_SERVICE:${PN} =3D "fluent-bit.service"
> +
> +inherit cmake systemd pkgconfig
> +
> +TARGET_CC_ARCH +=3D " ${SELECTED_OPTIMIZATION}"
> +TARGET_CC_ARCH:remove =3D "-D_FORTIFY_SOURCE=3D2"
> +EXTRA_OECMAKE +=3D "-DCMAKE_DEBUG_SRCDIR=3D${TARGET_DBGSRC_DIR}/"
> +EXTRA_OECMAKE:append:mips =3D " -DCMAKE_C_STANDARD_LIBRARIES=3D-latomic"
> +EXTRA_OECMAKE:append:powerpc =3D " -DCMAKE_C_STANDARD_LIBRARIES=3D-latom=
ic"
> +EXTRA_OECMAKE:append:riscv32 =3D " -DCMAKE_C_STANDARD_LIBRARIES=3D-latom=
ic"
> +EXTRA_OECMAKE:append:riscv64 =3D " -DCMAKE_C_STANDARD_LIBRARIES=3D-latom=
ic"
> +EXTRA_OECMAKE:append:x86 =3D " -DCMAKE_C_STANDARD_LIBRARIES=3D-latomic"
> +
> +# flex hardcodes the input file in #line directives leading to TMPDIR co=
ntamination of debug sources.
> +do_compile:append() {
> +    find ${B} -name '*.c' -or -name '*.h' | xargs sed -i -e 's|${TMPDIR}=
|${TARGET_DBGSRC_DIR}/|g'
> +}
> --
> 2.39.2
>

