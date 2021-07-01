Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web09.1481.1625165789254122281
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Jul 2021 11:56:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BEh4u8y1;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id fi7so2960451qvb.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 01 Jul 2021 11:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Jp3GDatYSVzTqhxaFEkT2i/+KEa55A9DJD+yvUnx4og=;
        b=BEh4u8y1m3o2O9/pxvmvr5pdNVD+MdQYuafGmuUDqTnK4TmRfDESCV7iwpTRV6lCRx
         BQ6BgsHTv8oqX8imxOgq9DbAyJES3AHUrew5WwQ7L4X6HEeObAWu1c1x25JKVrxVUZI4
         YpjhzlYSte1QoCb3boGtMmK/UR0IC5HXi5wBz/WLxKa47CtwdXt2nN+2S7zqcJAfWxEW
         /Kxvrs3cQCeN2lb5PrWGM6jGrNRuDNqaeKQWvPV5i/gpw+FAxaA65hj2D6zrGF7llj2x
         Wn6CcZA/wKBuA4CkRqCromNwyCx97QVvsrivmmD+gyeBZQI9HAlcWzvtqLOma7EV+6dX
         YIPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Jp3GDatYSVzTqhxaFEkT2i/+KEa55A9DJD+yvUnx4og=;
        b=n9RQfd5nGGCUFibok9qk5kx6arcnYwxT7VdKmpcPp3/t+LMCRmxxpncrmgyNIBAJ8G
         vA5Fuke8HpUOWndBNVOYdRu/PDMvMEI5AxVmFc43Lxhro+leEWtsoteFIs4qqyiRnUZB
         981F1jMDcFRUD+yacR4QmAdKIa4xQ2a/h/ntUu3UUwdMyHUxHgHWNHben+kCGSm62ERQ
         jLjHJvatyJKEjvpz1FP5cm3h3QtlEc6+svaTDotOsS9qCqD5a69daVCN2vT+r5a/K9bv
         F5v8udIJwKxPdfRKZQSkwq3o0coJ7CLkJdxaGegygtUz567hJQnMwo4uMHf/t8NrgXAI
         YynQ==
X-Gm-Message-State: AOAM530PVscspAOO47WrwlBcTZ83LBAKa/LM5R6A/gP9kUOydWJKEjxZ
	jGQ1xBDLRslRnX497gofX8AZ1kKwNmhpVbpgF20=
X-Google-Smtp-Source: ABdhPJzFH9CGH2m3ZS4h0hnrgVB6Vykxk+byNnzYMdfBLrtGhktuBqfsJb3FzB9ad6HYamz+kHje80IUhJkcj1+oSjo=
X-Received: by 2002:a05:6214:1244:: with SMTP id q4mr1087600qvv.50.1625165788255;
 Thu, 01 Jul 2021 11:56:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210701113815.1818733-1-costamagnagianfranco@yahoo.it>
In-Reply-To: <20210701113815.1818733-1-costamagnagianfranco@yahoo.it>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 1 Jul 2021 11:56:02 -0700
Message-ID: <CAMKF1spAC6KST7i30g5fOfbiY2DMeN1=UibBkaKwt9rNqmy07A@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] dlt-daemon: update from 2.18.6 to 2.18.7 - add an upstream proposed patch 317.patch to fix a build failure with enabled systemd binding
To: Gianfranco <costamagna.gianfranco@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	Gianfranco Costamagna <costamagnagianfranco@yahoo.it>, 
	Gianfranco Costamagna <locutusofborg@debian.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

this perhaps needs some work to get going when systemd is not used in
DISTRO_FEATURES I am seeing

00:02:27.216 NOTE: Resolving any missing task queue dependencies
00:02:28.129 ERROR: Nothing PROVIDES 'systemd' (but
/mnt/jenkins/workspace/Yocto-world-arm/sources/meta-openembedded/meta-oe/r=
ecipes-extended/dlt-daemon/dlt-daemon_2.18.7.bb
DEPENDS on or otherwise requires it)
00:02:28.129 systemd was skipped: missing required distro feature
'systemd' (not in DISTRO_FEATURES)
00:02:29.201 ERROR: Nothing RPROVIDES 'mosquitto' (but
/mnt/jenkins/workspace/Yocto-world-arm/sources/meta-openembedded/meta-netw=
orking/recipes-connectivity/mosquitto/mosquitto_2.0.11.bb
RDEPENDS on or otherwise requires it)
00:02:29.201 No eligible RPROVIDERs exist for 'mosquitto'
00:02:29.202 NOTE: Runtime target 'mosquitto' is unbuildable, removing...
00:02:29.202 Missing or unbuildable dependency chain was: ['mosquitto']
00:02:29.277 ERROR: Nothing RPROVIDES 'mosquitto-dev' (but
/mnt/jenkins/workspace/Yocto-world-arm/sources/meta-openembedded/meta-netw=
orking/recipes-connectivity/mosquitto/mosquitto_2.0.11.bb
RDEPENDS on or otherwise requires it)
00:02:29.277 No eligible RPROVIDERs exist for 'mosquitto-dev'
00:02:29.277 NOTE: Runtime target 'mosquitto-dev' is unbuildable, removing=
...
00:02:29.277 Missing or unbuildable dependency chain was: ['mosquitto-dev'=
]
00:02:29.451 NOTE: Multiple providers are available for runtime ssh
(dropbear, openssh)
00:02:29.451 Consider defining a PREFERRED_RPROVIDER entry to match ssh
00:02:31.616 ERROR: Nothing RPROVIDES 'dlt-daemon-dev' (but
/mnt/jenkins/workspace/Yocto-world-arm/sources/meta-openembedded/meta-oe/r=
ecipes-extended/dlt-daemon/dlt-daemon_2.18.7.bb
RDEPENDS on or otherwise requires it)
00:02:31.616 No eligible RPROVIDERs exist for 'dlt-daemon-dev'
00:02:31.616 NOTE: Runtime target 'dlt-daemon-dev' is unbuildable, removin=
g...
00:02:31.616 Missing or unbuildable dependency chain was: ['dlt-daemon-dev=
']
00:02:31.695 ERROR: Nothing RPROVIDES 'dlt-daemon' (but
/mnt/jenkins/workspace/Yocto-world-arm/sources/meta-openembedded/meta-oe/r=
ecipes-extended/dlt-daemon/dlt-daemon_2.18.7.bb
RDEPENDS on or otherwise requires it)
00:02:31.695 No eligible RPROVIDERs exist for 'dlt-daemon'
00:02:31.695 NOTE: Runtime target 'dlt-daemon' is unbuildable, removing...
00:02:31.695 Missing or unbuildable dependency chain was: ['dlt-daemon']
00:02:31.774 ERROR: Nothing RPROVIDES 'libsystemd' (but
/mnt/jenkins/workspace/Yocto-world-arm/sources/meta-openembedded/meta-oe/r=
ecipes-extended/dlt-daemon/dlt-daemon_2.18.7.bb
RDEPENDS on or otherwise requires it)
00:02:31.774 NOTE: Runtime target 'libsystemd' is unbuildable, removing...
00:02:31.774 Missing or unbuildable dependency chain was: ['libsystemd']
00:02:31.917 ERROR: Nothing RPROVIDES 'dlt-daemon-systemd' (but
/mnt/jenkins/workspace/Yocto-world-arm/sources/meta-openembedded/meta-oe/r=
ecipes-extended/dlt-daemon/dlt-daemon_2.18.7.bb
RDEPENDS on or otherwise requires it)
00:02:31.917 No eligible RPROVIDERs exist for 'dlt-daemon-systemd'
00:02:31.917 NOTE: Runtime target 'dlt-daemon-systemd' is unbuildable,
removing...
00:02:31.917 Missing or unbuildable dependency chain was: ['dlt-daemon-sys=
temd']
00:02:36.223

On Thu, Jul 1, 2021 at 4:38 AM Gianfranco
<costamagna.gianfranco@gmail.com> wrote:
>
> Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
> Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
> ---
>  .../dlt-daemon/dlt-daemon/317.patch           | 43 +++++++++++++++++++
>  ...-daemon_2.18.6.bb =3D> dlt-daemon_2.18.7.bb} |  9 ++--
>  2 files changed, 48 insertions(+), 4 deletions(-)
>  create mode 100644 meta-oe/recipes-extended/dlt-daemon/dlt-daemon/317.p=
atch
>  rename meta-oe/recipes-extended/dlt-daemon/{dlt-daemon_2.18.6.bb =3D> d=
lt-daemon_2.18.7.bb} (88%)
>
> diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/317.patch b/=
meta-oe/recipes-extended/dlt-daemon/dlt-daemon/317.patch
> new file mode 100644
> index 000000000..fe40334b6
> --- /dev/null
> +++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/317.patch
> @@ -0,0 +1,43 @@
> +Origin: https://github.com/GENIVI/dlt-daemon/pull/317
> +From 55d31216823841a1547fe261cdf8e3b1002d5f94 Mon Sep 17 00:00:00 2001
> +From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
> +Date: Thu, 1 Jul 2021 12:58:20 +0200
> +Subject: [PATCH] dlt-control-common.c: Fix build failure due to out-of-=
bound
> + write -Werror=3Dstringop-truncation
> +
> +cd /build/dlt-daemon-2.18.7/obj-x86_64-linux-gnu/src/console/logstorage=
 && /usr/bin/cc -DCONFIGURATION_FILES_DIR=3D\"/etc\" -DDLT_DAEMON_USE_FIFO_=
IPC -DDLT_LIB_USE_FIFO_IPC -DDLT_NETWORK_TRACE_ENABLE -DDLT_SYSTEMD_ENABLE =
-DDLT_SYSTEMD_JOURNAL_ENABLE -DDLT_UNIT_TESTS -DDLT_USER_IPC_PATH=3D\"/tmp\=
" -DDLT_USE_IPv6 -DEXTENDED_FILTERING -D_GNU_SOURCE -I/build/dlt-daemon-2.1=
8.7 -I/build/dlt-daemon-2.18.7/obj-x86_64-linux-gnu/include/dlt -I/build/dl=
t-daemon-2.18.7/include/dlt -I/build/dlt-daemon-2.18.7/src/shared -I/build/=
dlt-daemon-2.18.7/src/core_dump_handler -I/build/dlt-daemon-2.18.7/src/offl=
inelogstorage -I/build/dlt-daemon-2.18.7/src/lib -I/build/dlt-daemon-2.18.7=
/src/daemon -I/build/dlt-daemon-2.18.7/src/console -I/build/dlt-daemon-2.18=
.7/src/gateway -I/build/dlt-daemon-2.18.7/systemd/3rdparty -g -O2 -ffile-pr=
efix-map=3D/build/dlt-daemon-2.18.7=3D. -fstack-protector-strong -Wformat -=
Werror=3Dformat-security -Wdate-time -D_FORTIFY_SOURCE=3D2   -Werror -std=
=3Dgnu99 -Wall -Wextra -Wno-variadic-macros -Wno-strict-aliasing -o CMakeF=
iles/dlt-logstorage-ctrl.dir/__/dlt-control-common.c.o -c /build/dlt-daemon=
-2.18.7/src/console/dlt-control-common.c
> +make[3]: Leaving directory '/build/dlt-daemon-2.18.7/obj-x86_64-linux-g=
nu'
> +In file included from /usr/include/string.h:495,
> +                 from /build/dlt-daemon-2.18.7/src/console/dlt-control-=
common.c:56:
> +In function 'strncpy',
> +    inlined from 'dlt_json_filter_load' at /build/dlt-daemon-2.18.7/src=
/console/dlt-control-common.c:716:13:
> +/usr/include/x86_64-linux-gnu/bits/string_fortified.h:106:10: error: '_=
_builtin_strncpy' specified bound 4 equals destination size [-Werror=3Dstri=
ngop-truncation]
> +  106 |   return __builtin___strncpy_chk (__dest, __src, __len, __bos (=
__dest));
> +      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
> +In function 'strncpy',
> +    inlined from 'dlt_json_filter_load' at /build/dlt-daemon-2.18.7/src=
/console/dlt-control-common.c:721:13:
> +/usr/include/x86_64-linux-gnu/bits/string_fortified.h:106:10: error: '_=
_builtin_strncpy' specified bound 4 equals destination size [-Werror=3Dstri=
ngop-truncation]
> +  106 |   return __builtin___strncpy_chk (__dest, __src, __len, __bos (=
__dest));
> +      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
> +
> +Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
> +Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
> +---
> + src/console/dlt-control-common.c | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/src/console/dlt-control-common.c b/src/console/dlt-control=
-common.c
> +index 8a9d29f0..f58d8268 100644
> +--- a/src/console/dlt-control-common.c
> ++++ b/src/console/dlt-control-common.c
> +@@ -671,8 +671,8 @@ DltReturnValue dlt_json_filter_load(DltFilter *filt=
er, const char *filename, int
> +     struct json_object *j_payload_max;
> +     enum json_tokener_error jerr;
> +
> +-    char app_id[DLT_ID_SIZE] =3D "";
> +-    char context_id[DLT_ID_SIZE] =3D "";
> ++    char app_id[DLT_ID_SIZE + 1] =3D "";
> ++    char context_id[DLT_ID_SIZE + 1] =3D "";
> +     int32_t log_level =3D 0;
> +     int32_t payload_max =3D INT32_MAX;
> +     int32_t payload_min =3D 0;
> diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.6.bb b/=
meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.7.bb
> similarity index 88%
> rename from meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.6.bb
> rename to meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.7.bb
> index b3cfb4709..c4ad59381 100644
> --- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.6.bb
> +++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.7.bb
> @@ -12,18 +12,19 @@ SECTION =3D "console/utils"
>  LICENSE =3D "MPLv2"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D8184208060df880fe3137b93eb88=
aeea"
>
> -DEPENDS =3D "zlib gzip-native"
> +DEPENDS =3D "zlib gzip-native json-c"
>
>  SRC_URI =3D "git://github.com/GENIVI/${BPN}.git;protocol=3Dhttps \
>      file://0002-Don-t-execute-processes-as-a-specific-user.patch \
>      file://0004-Modify-systemd-config-directory.patch \
> +    file://317.patch \
>  "
> -SRCREV =3D "22715aeceaa81ace2c832312529bde3a42d0814f"
> +SRCREV =3D "24d197214bfdcec7430d31b42e5c87df27287aaf"
>
>  S =3D "${WORKDIR}/git"
>
>  PACKAGECONFIG ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', =
' systemd systemd-watchdog systemd-journal dlt-examples dlt-adaptor dlt-con=
sole ', '', d)} \
> - udp-connection dlt-system dlt-filetransfer "
> + udp-connection dlt-system dlt-filetransfer dlt-examples systemd system=
d-watchdog systemd-journal dlt-dbus udp-connection dlt-adaptor dlt-system d=
lt-filetransfer dlt-console "
>  # dlt-dbus
>
>  # General options
> @@ -44,7 +45,7 @@ PACKAGECONFIG[dlt-console] =3D "-DWITH_DLT_CONSOLE=3DO=
N,-DWITH_DLT_CONSOLE=3DOFF,,dlt-
>
>  inherit autotools gettext cmake systemd
>
> -EXTRA_OECMAKE +=3D "-DSYSTEMD_UNITDIR=3D${systemd_system_unitdir}"
> +EXTRA_OECMAKE +=3D "-DWITH_EXTENDED_FILTERING=3DON -DSYSTEMD_UNITDIR=3D=
${systemd_system_unitdir}"
>
>  PACKAGES +=3D "${PN}-systemd"
>  SYSTEMD_PACKAGES =3D "${PN} ${PN}-systemd"
> --
> 2.25.1
>
>
>=20
>
