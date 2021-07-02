Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
 by mx.groups.io with SMTP id smtpd.web08.12506.1625245158110783522
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 02 Jul 2021 09:59:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sEUWuwdv;
 spf=pass (domain: gmail.com, ip: 209.85.217.41, mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-vs1-f41.google.com with SMTP id y25so6171452vsj.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 02 Jul 2021 09:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lu6HktmGQ3eYk2oIpirVEE2u2xoBuOYx0WjziNjrGLs=;
        b=sEUWuwdvRowTjh3bcrBWRpxDR81tt8i/cPphq4uNh50rxK52tZuLxYMocODIPYyqT5
         Y1ovMEZmJy/j5DKLUeMGbkDqOXDL2gtmkDYIvuDShMXCoO/3fXzBi6Sylbwsj4a4f4YW
         Uqnieix4XBhyQS3Bcrfdv6kPEPafnDIPBM7YTDKwyE3DRlJLEQJ3SuLm2S3V2Tj1ryGX
         Sp8H1SOB4+BmjiiFh+r4YHar1h404AVD4Ob4J6XPAIufmAF808LwRbLqD/9FH4mI0ufD
         OTnKz35q72MFGDsc3SFP3tE7ucWoF5CJBt9JmoOwbN493e9sxra8uJ2iGzsghnTf+WCT
         SfeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lu6HktmGQ3eYk2oIpirVEE2u2xoBuOYx0WjziNjrGLs=;
        b=JwCJXA9jOYbgBQXFGTXkpAhWjaBru+QtqgDJzlk7pPREZXqwmjIxnITMYKsVzHXq3v
         +5WWZ8uCANPKboMne5Z54qbNSjBDOFkLSTI5zRnoq+/cqMHvoq/UJRpj4+W3z2nKmgbr
         zfpfeF+Im/sb4P6jrvDP3YLnwpcxc9n2PryLrEtycMYoY+Iqs6z5eUv4Gu4fZXmYf7E9
         PJr5NB3tDKqndmB7aq0GnTzypRhz7/QrczGOVRCj9IRzKEFvvH7Iuh2hpTKYDBZU9akz
         GolUOK42Sbs13Bft7KRi2KT5JCVBBoW2CqvpaSHFhWVctAUj35dzSpLz3V1/XYSOsG5O
         qoMw==
X-Gm-Message-State: AOAM533k/nc0yl8lvC1Xl9SLPu2oxehR4rj9CIF6x4+AkgMTuIzol5VN
	a2moYwjqFyGylh5Hhyy3i+K8Aow5HQDDFDTNjik=
X-Google-Smtp-Source: ABdhPJyc0m2s7kA7CCnZq6u5mtpBwuproXG9QSUYMo6dHwqRW+S+Jzn/jCVm46lci62SFX630dWCIA/eGq4HEQEJF40=
X-Received: by 2002:a67:1642:: with SMTP id 63mr446076vsw.53.1625245157182;
 Fri, 02 Jul 2021 09:59:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210701113815.1818733-1-costamagnagianfranco@yahoo.it> <CAMKF1spAC6KST7i30g5fOfbiY2DMeN1=UibBkaKwt9rNqmy07A@mail.gmail.com>
In-Reply-To: <CAMKF1spAC6KST7i30g5fOfbiY2DMeN1=UibBkaKwt9rNqmy07A@mail.gmail.com>
From: "Gianfranco" <costamagna.gianfranco@gmail.com>
Date: Fri, 2 Jul 2021 18:59:05 +0200
Message-ID: <CAATN8PUFJ4SxUvWguEk+-27DYUTB6bKLDH=zVP+L9_kw5TkLrw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] dlt-daemon: update from 2.18.6 to 2.18.7 - add an upstream proposed patch 317.patch to fix a build failure with enabled systemd binding
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	Gianfranco Costamagna <costamagnagianfranco@yahoo.it>, 
	Gianfranco Costamagna <locutusofborg@debian.org>
Content-Type: multipart/alternative; boundary="000000000000444f8f05c626e054"

--000000000000444f8f05c626e054
Content-Type: text/plain; charset="UTF-8"

Hello, my bad sorry!
I did this change:
 PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '
systemd systemd-watchdog systemd-journal dlt-examples dlt-adaptor
dlt-console ', '', d)} \
- udp-connection dlt-system dlt-filetransfer "
+ udp-connection dlt-system dlt-filetransfer dlt-examples systemd
systemd-watchdog systemd-journal dlt-dbus udp-connection dlt-adaptor
dlt-system dlt-filetransfer dlt-console "

Just to test everything was "buildable" in a quick and dirty way, and my
bad I committed this change...
Resubmitted after removing that line

thanks

Gianfranco

Il giorno gio 1 lug 2021 alle ore 20:56 Khem Raj <raj.khem@gmail.com> ha
scritto:

> this perhaps needs some work to get going when systemd is not used in
> DISTRO_FEATURES I am seeing
>
> 00:02:27.216 NOTE: Resolving any missing task queue dependencies
> 00:02:28.129 ERROR: Nothing PROVIDES 'systemd' (but
>
> /mnt/jenkins/workspace/Yocto-world-arm/sources/meta-openembedded/meta-oe/recipes-extended/dlt-daemon/
> dlt-daemon_2.18.7.bb
> DEPENDS on or otherwise requires it)
> 00:02:28.129 systemd was skipped: missing required distro feature
> 'systemd' (not in DISTRO_FEATURES)
> 00:02:29.201 ERROR: Nothing RPROVIDES 'mosquitto' (but
>
> /mnt/jenkins/workspace/Yocto-world-arm/sources/meta-openembedded/meta-networking/recipes-connectivity/mosquitto/
> mosquitto_2.0.11.bb
> RDEPENDS on or otherwise requires it)
> 00:02:29.201 No eligible RPROVIDERs exist for 'mosquitto'
> 00:02:29.202 NOTE: Runtime target 'mosquitto' is unbuildable, removing...
> 00:02:29.202 Missing or unbuildable dependency chain was: ['mosquitto']
> 00:02:29.277 ERROR: Nothing RPROVIDES 'mosquitto-dev' (but
>
> /mnt/jenkins/workspace/Yocto-world-arm/sources/meta-openembedded/meta-networking/recipes-connectivity/mosquitto/
> mosquitto_2.0.11.bb
> RDEPENDS on or otherwise requires it)
> 00:02:29.277 No eligible RPROVIDERs exist for 'mosquitto-dev'
> 00:02:29.277 NOTE: Runtime target 'mosquitto-dev' is unbuildable,
> removing...
> 00:02:29.277 Missing or unbuildable dependency chain was: ['mosquitto-dev']
> 00:02:29.451 NOTE: Multiple providers are available for runtime ssh
> (dropbear, openssh)
> 00:02:29.451 Consider defining a PREFERRED_RPROVIDER entry to match ssh
> 00:02:31.616 ERROR: Nothing RPROVIDES 'dlt-daemon-dev' (but
>
> /mnt/jenkins/workspace/Yocto-world-arm/sources/meta-openembedded/meta-oe/recipes-extended/dlt-daemon/
> dlt-daemon_2.18.7.bb
> RDEPENDS on or otherwise requires it)
> 00:02:31.616 No eligible RPROVIDERs exist for 'dlt-daemon-dev'
> 00:02:31.616 NOTE: Runtime target 'dlt-daemon-dev' is unbuildable,
> removing...
> 00:02:31.616 Missing or unbuildable dependency chain was:
> ['dlt-daemon-dev']
> 00:02:31.695 ERROR: Nothing RPROVIDES 'dlt-daemon' (but
>
> /mnt/jenkins/workspace/Yocto-world-arm/sources/meta-openembedded/meta-oe/recipes-extended/dlt-daemon/
> dlt-daemon_2.18.7.bb
> RDEPENDS on or otherwise requires it)
> 00:02:31.695 No eligible RPROVIDERs exist for 'dlt-daemon'
> 00:02:31.695 NOTE: Runtime target 'dlt-daemon' is unbuildable, removing...
> 00:02:31.695 Missing or unbuildable dependency chain was: ['dlt-daemon']
> 00:02:31.774 ERROR: Nothing RPROVIDES 'libsystemd' (but
>
> /mnt/jenkins/workspace/Yocto-world-arm/sources/meta-openembedded/meta-oe/recipes-extended/dlt-daemon/
> dlt-daemon_2.18.7.bb
> RDEPENDS on or otherwise requires it)
> 00:02:31.774 NOTE: Runtime target 'libsystemd' is unbuildable, removing...
> 00:02:31.774 Missing or unbuildable dependency chain was: ['libsystemd']
> 00:02:31.917 ERROR: Nothing RPROVIDES 'dlt-daemon-systemd' (but
>
> /mnt/jenkins/workspace/Yocto-world-arm/sources/meta-openembedded/meta-oe/recipes-extended/dlt-daemon/
> dlt-daemon_2.18.7.bb
> RDEPENDS on or otherwise requires it)
> 00:02:31.917 No eligible RPROVIDERs exist for 'dlt-daemon-systemd'
> 00:02:31.917 NOTE: Runtime target 'dlt-daemon-systemd' is unbuildable,
> removing...
> 00:02:31.917 Missing or unbuildable dependency chain was:
> ['dlt-daemon-systemd']
> 00:02:36.223
>
> On Thu, Jul 1, 2021 at 4:38 AM Gianfranco
> <costamagna.gianfranco@gmail.com> wrote:
> >
> > Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
> > Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
> > ---
> >  .../dlt-daemon/dlt-daemon/317.patch           | 43 +++++++++++++++++++
> >  ...-daemon_2.18.6.bb => dlt-daemon_2.18.7.bb} |  9 ++--
> >  2 files changed, 48 insertions(+), 4 deletions(-)
> >  create mode 100644
> meta-oe/recipes-extended/dlt-daemon/dlt-daemon/317.patch
> >  rename meta-oe/recipes-extended/dlt-daemon/{dlt-daemon_2.18.6.bb =>
> dlt-daemon_2.18.7.bb} (88%)
> >
> > diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/317.patch
> b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/317.patch
> > new file mode 100644
> > index 000000000..fe40334b6
> > --- /dev/null
> > +++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/317.patch
> > @@ -0,0 +1,43 @@
> > +Origin: https://github.com/GENIVI/dlt-daemon/pull/317
> > +From 55d31216823841a1547fe261cdf8e3b1002d5f94 Mon Sep 17 00:00:00 2001
> > +From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
> > +Date: Thu, 1 Jul 2021 12:58:20 +0200
> > +Subject: [PATCH] dlt-control-common.c: Fix build failure due to
> out-of-bound
> > + write -Werror=stringop-truncation
> > +
> > +cd /build/dlt-daemon-2.18.7/obj-x86_64-linux-gnu/src/console/logstorage
> && /usr/bin/cc -DCONFIGURATION_FILES_DIR=\"/etc\" -DDLT_DAEMON_USE_FIFO_IPC
> -DDLT_LIB_USE_FIFO_IPC -DDLT_NETWORK_TRACE_ENABLE -DDLT_SYSTEMD_ENABLE
> -DDLT_SYSTEMD_JOURNAL_ENABLE -DDLT_UNIT_TESTS -DDLT_USER_IPC_PATH=\"/tmp\"
> -DDLT_USE_IPv6 -DEXTENDED_FILTERING -D_GNU_SOURCE
> -I/build/dlt-daemon-2.18.7
> -I/build/dlt-daemon-2.18.7/obj-x86_64-linux-gnu/include/dlt
> -I/build/dlt-daemon-2.18.7/include/dlt
> -I/build/dlt-daemon-2.18.7/src/shared
> -I/build/dlt-daemon-2.18.7/src/core_dump_handler
> -I/build/dlt-daemon-2.18.7/src/offlinelogstorage
> -I/build/dlt-daemon-2.18.7/src/lib -I/build/dlt-daemon-2.18.7/src/daemon
> -I/build/dlt-daemon-2.18.7/src/console
> -I/build/dlt-daemon-2.18.7/src/gateway
> -I/build/dlt-daemon-2.18.7/systemd/3rdparty -g -O2
> -ffile-prefix-map=/build/dlt-daemon-2.18.7=. -fstack-protector-strong
> -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2   -Werror
> -std=gnu99 -Wall -Wextra -Wno-variadic-macros -Wno-strict-aliasing -o
> CMakeFiles/dlt-logstorage-ctrl.dir/__/dlt-control-common.c.o -c
> /build/dlt-daemon-2.18.7/src/console/dlt-control-common.c
> > +make[3]: Leaving directory
> '/build/dlt-daemon-2.18.7/obj-x86_64-linux-gnu'
> > +In file included from /usr/include/string.h:495,
> > +                 from
> /build/dlt-daemon-2.18.7/src/console/dlt-control-common.c:56:
> > +In function 'strncpy',
> > +    inlined from 'dlt_json_filter_load' at
> /build/dlt-daemon-2.18.7/src/console/dlt-control-common.c:716:13:
> > +/usr/include/x86_64-linux-gnu/bits/string_fortified.h:106:10: error:
> '__builtin_strncpy' specified bound 4 equals destination size
> [-Werror=stringop-truncation]
> > +  106 |   return __builtin___strncpy_chk (__dest, __src, __len, __bos
> (__dest));
> > +      |
> ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > +In function 'strncpy',
> > +    inlined from 'dlt_json_filter_load' at
> /build/dlt-daemon-2.18.7/src/console/dlt-control-common.c:721:13:
> > +/usr/include/x86_64-linux-gnu/bits/string_fortified.h:106:10: error:
> '__builtin_strncpy' specified bound 4 equals destination size
> [-Werror=stringop-truncation]
> > +  106 |   return __builtin___strncpy_chk (__dest, __src, __len, __bos
> (__dest));
> > +      |
> ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > +
> > +Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
> > +Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
> > +---
> > + src/console/dlt-control-common.c | 4 ++--
> > + 1 file changed, 2 insertions(+), 2 deletions(-)
> > +
> > +diff --git a/src/console/dlt-control-common.c
> b/src/console/dlt-control-common.c
> > +index 8a9d29f0..f58d8268 100644
> > +--- a/src/console/dlt-control-common.c
> > ++++ b/src/console/dlt-control-common.c
> > +@@ -671,8 +671,8 @@ DltReturnValue dlt_json_filter_load(DltFilter
> *filter, const char *filename, int
> > +     struct json_object *j_payload_max;
> > +     enum json_tokener_error jerr;
> > +
> > +-    char app_id[DLT_ID_SIZE] = "";
> > +-    char context_id[DLT_ID_SIZE] = "";
> > ++    char app_id[DLT_ID_SIZE + 1] = "";
> > ++    char context_id[DLT_ID_SIZE + 1] = "";
> > +     int32_t log_level = 0;
> > +     int32_t payload_max = INT32_MAX;
> > +     int32_t payload_min = 0;
> > diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.6.bb
> b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.7.bb
> > similarity index 88%
> > rename from meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.6.bb
> > rename to meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.7.bb
> > index b3cfb4709..c4ad59381 100644
> > --- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.6.bb
> > +++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.7.bb
> > @@ -12,18 +12,19 @@ SECTION = "console/utils"
> >  LICENSE = "MPLv2"
> >  LIC_FILES_CHKSUM = "file://LICENSE;md5=8184208060df880fe3137b93eb88aeea"
> >
> > -DEPENDS = "zlib gzip-native"
> > +DEPENDS = "zlib gzip-native json-c"
> >
> >  SRC_URI = "git://github.com/GENIVI/${BPN}.git;protocol=https
> <http://github.com/GENIVI/$%7BBPN%7D.git;protocol=https> \
> >      file://0002-Don-t-execute-processes-as-a-specific-user.patch \
> >      file://0004-Modify-systemd-config-directory.patch \
> > +    file://317.patch \
> >  "
> > -SRCREV = "22715aeceaa81ace2c832312529bde3a42d0814f"
> > +SRCREV = "24d197214bfdcec7430d31b42e5c87df27287aaf"
> >
> >  S = "${WORKDIR}/git"
> >
> >  PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '
> systemd systemd-watchdog systemd-journal dlt-examples dlt-adaptor
> dlt-console ', '', d)} \
> > - udp-connection dlt-system dlt-filetransfer "
> > + udp-connection dlt-system dlt-filetransfer dlt-examples systemd
> systemd-watchdog systemd-journal dlt-dbus udp-connection dlt-adaptor
> dlt-system dlt-filetransfer dlt-console "
> >  # dlt-dbus
> >
> >  # General options
> > @@ -44,7 +45,7 @@ PACKAGECONFIG[dlt-console] =
> "-DWITH_DLT_CONSOLE=ON,-DWITH_DLT_CONSOLE=OFF,,dlt-
> >
> >  inherit autotools gettext cmake systemd
> >
> > -EXTRA_OECMAKE += "-DSYSTEMD_UNITDIR=${systemd_system_unitdir}"
> > +EXTRA_OECMAKE += "-DWITH_EXTENDED_FILTERING=ON
> -DSYSTEMD_UNITDIR=${systemd_system_unitdir}"
> >
> >  PACKAGES += "${PN}-systemd"
> >  SYSTEMD_PACKAGES = "${PN} ${PN}-systemd"
> > --
> > 2.25.1
> >
> >
> > 
> >
>

--000000000000444f8f05c626e054
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello, my bad sorry!</div><div>I did this change:</di=
v><div>=C2=A0PACKAGECONFIG ?=3D &quot;${@bb.utils.contains(&#39;DISTRO_FEAT=
URES&#39;, &#39;systemd&#39;, &#39; systemd systemd-watchdog systemd-journa=
l dlt-examples dlt-adaptor dlt-console &#39;, &#39;&#39;, d)} \<br>- udp-co=
nnection dlt-system dlt-filetransfer &quot;<br>+ udp-connection dlt-system =
dlt-filetransfer dlt-examples systemd systemd-watchdog systemd-journal dlt-=
dbus udp-connection dlt-adaptor dlt-system dlt-filetransfer dlt-console &qu=
ot;</div><div><br></div><div>Just to test everything was &quot;buildable&qu=
ot; in a quick and dirty way, and my bad I committed this change...</div><d=
iv>Resubmitted after removing that line</div><div><br></div><div>thanks</di=
v><div><br></div><div>Gianfranco<br></div></div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">Il giorno gio 1 lug 2021 alle ore=
 20:56 Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.co=
m</a>&gt; ha scritto:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">this perhaps needs some work to get going when systemd is not used in=
<br>
DISTRO_FEATURES I am seeing<br>
<br>
00:02:27.216 NOTE: Resolving any missing task queue dependencies<br>
00:02:28.129 ERROR: Nothing PROVIDES &#39;systemd&#39; (but<br>
/mnt/jenkins/workspace/Yocto-world-arm/sources/meta-openembedded/meta-oe/r=
ecipes-extended/dlt-daemon/<a href=3D"http://dlt-daemon_2.18.7.bb" rel=3D"n=
oreferrer" target=3D"_blank">dlt-daemon_2.18.7.bb</a><br>
DEPENDS on or otherwise requires it)<br>
00:02:28.129 systemd was skipped: missing required distro feature<br>
&#39;systemd&#39; (not in DISTRO_FEATURES)<br>
00:02:29.201 ERROR: Nothing RPROVIDES &#39;mosquitto&#39; (but<br>
/mnt/jenkins/workspace/Yocto-world-arm/sources/meta-openembedded/meta-netw=
orking/recipes-connectivity/mosquitto/<a href=3D"http://mosquitto_2.0.11.bb=
" rel=3D"noreferrer" target=3D"_blank">mosquitto_2.0.11.bb</a><br>
RDEPENDS on or otherwise requires it)<br>
00:02:29.201 No eligible RPROVIDERs exist for &#39;mosquitto&#39;<br>
00:02:29.202 NOTE: Runtime target &#39;mosquitto&#39; is unbuildable, remo=
ving...<br>
00:02:29.202 Missing or unbuildable dependency chain was: [&#39;mosquitto&=
#39;]<br>
00:02:29.277 ERROR: Nothing RPROVIDES &#39;mosquitto-dev&#39; (but<br>
/mnt/jenkins/workspace/Yocto-world-arm/sources/meta-openembedded/meta-netw=
orking/recipes-connectivity/mosquitto/<a href=3D"http://mosquitto_2.0.11.bb=
" rel=3D"noreferrer" target=3D"_blank">mosquitto_2.0.11.bb</a><br>
RDEPENDS on or otherwise requires it)<br>
00:02:29.277 No eligible RPROVIDERs exist for &#39;mosquitto-dev&#39;<br>
00:02:29.277 NOTE: Runtime target &#39;mosquitto-dev&#39; is unbuildable, =
removing...<br>
00:02:29.277 Missing or unbuildable dependency chain was: [&#39;mosquitto-=
dev&#39;]<br>
00:02:29.451 NOTE: Multiple providers are available for runtime ssh<br>
(dropbear, openssh)<br>
00:02:29.451 Consider defining a PREFERRED_RPROVIDER entry to match ssh<br=
>
00:02:31.616 ERROR: Nothing RPROVIDES &#39;dlt-daemon-dev&#39; (but<br>
/mnt/jenkins/workspace/Yocto-world-arm/sources/meta-openembedded/meta-oe/r=
ecipes-extended/dlt-daemon/<a href=3D"http://dlt-daemon_2.18.7.bb" rel=3D"n=
oreferrer" target=3D"_blank">dlt-daemon_2.18.7.bb</a><br>
RDEPENDS on or otherwise requires it)<br>
00:02:31.616 No eligible RPROVIDERs exist for &#39;dlt-daemon-dev&#39;<br>
00:02:31.616 NOTE: Runtime target &#39;dlt-daemon-dev&#39; is unbuildable,=
 removing...<br>
00:02:31.616 Missing or unbuildable dependency chain was: [&#39;dlt-daemon=
-dev&#39;]<br>
00:02:31.695 ERROR: Nothing RPROVIDES &#39;dlt-daemon&#39; (but<br>
/mnt/jenkins/workspace/Yocto-world-arm/sources/meta-openembedded/meta-oe/r=
ecipes-extended/dlt-daemon/<a href=3D"http://dlt-daemon_2.18.7.bb" rel=3D"n=
oreferrer" target=3D"_blank">dlt-daemon_2.18.7.bb</a><br>
RDEPENDS on or otherwise requires it)<br>
00:02:31.695 No eligible RPROVIDERs exist for &#39;dlt-daemon&#39;<br>
00:02:31.695 NOTE: Runtime target &#39;dlt-daemon&#39; is unbuildable, rem=
oving...<br>
00:02:31.695 Missing or unbuildable dependency chain was: [&#39;dlt-daemon=
&#39;]<br>
00:02:31.774 ERROR: Nothing RPROVIDES &#39;libsystemd&#39; (but<br>
/mnt/jenkins/workspace/Yocto-world-arm/sources/meta-openembedded/meta-oe/r=
ecipes-extended/dlt-daemon/<a href=3D"http://dlt-daemon_2.18.7.bb" rel=3D"n=
oreferrer" target=3D"_blank">dlt-daemon_2.18.7.bb</a><br>
RDEPENDS on or otherwise requires it)<br>
00:02:31.774 NOTE: Runtime target &#39;libsystemd&#39; is unbuildable, rem=
oving...<br>
00:02:31.774 Missing or unbuildable dependency chain was: [&#39;libsystemd=
&#39;]<br>
00:02:31.917 ERROR: Nothing RPROVIDES &#39;dlt-daemon-systemd&#39; (but<br=
>
/mnt/jenkins/workspace/Yocto-world-arm/sources/meta-openembedded/meta-oe/r=
ecipes-extended/dlt-daemon/<a href=3D"http://dlt-daemon_2.18.7.bb" rel=3D"n=
oreferrer" target=3D"_blank">dlt-daemon_2.18.7.bb</a><br>
RDEPENDS on or otherwise requires it)<br>
00:02:31.917 No eligible RPROVIDERs exist for &#39;dlt-daemon-systemd&#39;=
<br>
00:02:31.917 NOTE: Runtime target &#39;dlt-daemon-systemd&#39; is unbuilda=
ble,<br>
removing...<br>
00:02:31.917 Missing or unbuildable dependency chain was: [&#39;dlt-daemon=
-systemd&#39;]<br>
00:02:36.223<br>
<br>
On Thu, Jul 1, 2021 at 4:38 AM Gianfranco<br>
&lt;<a href=3D"mailto:costamagna.gianfranco@gmail.com" target=3D"_blank">c=
ostamagna.gianfranco@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Signed-off-by: Gianfranco Costamagna &lt;<a href=3D"mailto:costamagna=
gianfranco@yahoo.it" target=3D"_blank">costamagnagianfranco@yahoo.it</a>&gt=
;<br>
&gt; Signed-off-by: Gianfranco Costamagna &lt;<a href=3D"mailto:locutusofb=
org@debian.org" target=3D"_blank">locutusofborg@debian.org</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../dlt-daemon/dlt-daemon/317.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0| 43 +++++++++++++++++++<br>
&gt;=C2=A0 ...-<a href=3D"http://daemon_2.18.6.bb" rel=3D"noreferrer" targ=
et=3D"_blank">daemon_2.18.6.bb</a> =3D&gt; <a href=3D"http://dlt-daemon_2.1=
8.7.bb" rel=3D"noreferrer" target=3D"_blank">dlt-daemon_2.18.7.bb</a>} |=C2=
=
=A0 9 ++--<br>
&gt;=C2=A0 2 files changed, 48 insertions(+), 4 deletions(-)<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-extended/dlt-daemon/dlt-daem=
on/317.patch<br>
&gt;=C2=A0 rename meta-oe/recipes-extended/dlt-daemon/{<a href=3D"http://d=
lt-daemon_2.18.6.bb" rel=3D"noreferrer" target=3D"_blank">dlt-daemon_2.18.6=
.bb</a> =3D&gt; <a href=3D"http://dlt-daemon_2.18.7.bb" rel=3D"noreferrer" =
target=3D"_blank">dlt-daemon_2.18.7.bb</a>} (88%)<br>
&gt;<br>
&gt; diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/317.patch=
 b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/317.patch<br>
&gt; new file mode 100644<br>
&gt; index 000000000..fe40334b6<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/317.patch<br>
&gt; @@ -0,0 +1,43 @@<br>
&gt; +Origin: <a href=3D"https://github.com/GENIVI/dlt-daemon/pull/317" re=
l=3D"noreferrer" target=3D"_blank">https://github.com/GENIVI/dlt-daemon/pul=
l/317</a><br>
&gt; +From 55d31216823841a1547fe261cdf8e3b1002d5f94 Mon Sep 17 00:00:00 20=
01<br>
&gt; +From: Gianfranco Costamagna &lt;<a href=3D"mailto:costamagnagianfran=
co@yahoo.it" target=3D"_blank">costamagnagianfranco@yahoo.it</a>&gt;<br>
&gt; +Date: Thu, 1 Jul 2021 12:58:20 +0200<br>
&gt; +Subject: [PATCH] dlt-control-common.c: Fix build failure due to out-=
of-bound<br>
&gt; + write -Werror=3Dstringop-truncation<br>
&gt; +<br>
&gt; +cd /build/dlt-daemon-2.18.7/obj-x86_64-linux-gnu/src/console/logstor=
age &amp;&amp; /usr/bin/cc -DCONFIGURATION_FILES_DIR=3D\&quot;/etc\&quot; -=
DDLT_DAEMON_USE_FIFO_IPC -DDLT_LIB_USE_FIFO_IPC -DDLT_NETWORK_TRACE_ENABLE =
-DDLT_SYSTEMD_ENABLE -DDLT_SYSTEMD_JOURNAL_ENABLE -DDLT_UNIT_TESTS -DDLT_US=
ER_IPC_PATH=3D\&quot;/tmp\&quot; -DDLT_USE_IPv6 -DEXTENDED_FILTERING -D_GNU=
_SOURCE -I/build/dlt-daemon-2.18.7 -I/build/dlt-daemon-2.18.7/obj-x86_64-li=
nux-gnu/include/dlt -I/build/dlt-daemon-2.18.7/include/dlt -I/build/dlt-dae=
mon-2.18.7/src/shared -I/build/dlt-daemon-2.18.7/src/core_dump_handler -I/b=
uild/dlt-daemon-2.18.7/src/offlinelogstorage -I/build/dlt-daemon-2.18.7/src=
/lib -I/build/dlt-daemon-2.18.7/src/daemon -I/build/dlt-daemon-2.18.7/src/c=
onsole -I/build/dlt-daemon-2.18.7/src/gateway -I/build/dlt-daemon-2.18.7/sy=
stemd/3rdparty -g -O2 -ffile-prefix-map=3D/build/dlt-daemon-2.18.7=3D. -fst=
ack-protector-strong -Wformat -Werror=3Dformat-security -Wdate-time -D_FORT=
IFY_SOURCE=3D2=C2=A0 =C2=A0-Werror -std=3Dgnu99 -Wall -Wextra -Wno-variadic=
-macros -Wno-strict-aliasing -o CMakeFiles/dlt-logstorage-ctrl.dir/__/dlt-c=
ontrol-common.c.o -c /build/dlt-daemon-2.18.7/src/console/dlt-control-commo=
n.c<br>
&gt; +make[3]: Leaving directory &#39;/build/dlt-daemon-2.18.7/obj-x86_64-=
linux-gnu&#39;<br>
&gt; +In file included from /usr/include/string.h:495,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from /=
build/dlt-daemon-2.18.7/src/console/dlt-control-common.c:56:<br>
&gt; +In function &#39;strncpy&#39;,<br>
&gt; +=C2=A0 =C2=A0 inlined from &#39;dlt_json_filter_load&#39; at /build/=
dlt-daemon-2.18.7/src/console/dlt-control-common.c:716:13:<br>
&gt; +/usr/include/x86_64-linux-gnu/bits/string_fortified.h:106:10: error:=
 &#39;__builtin_strncpy&#39; specified bound 4 equals destination size [-We=
rror=3Dstringop-truncation]<br>
&gt; +=C2=A0 106 |=C2=A0 =C2=A0return __builtin___strncpy_chk (__dest, __s=
rc, __len, __bos (__dest));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~<br>
&gt; +In function &#39;strncpy&#39;,<br>
&gt; +=C2=A0 =C2=A0 inlined from &#39;dlt_json_filter_load&#39; at /build/=
dlt-daemon-2.18.7/src/console/dlt-control-common.c:721:13:<br>
&gt; +/usr/include/x86_64-linux-gnu/bits/string_fortified.h:106:10: error:=
 &#39;__builtin_strncpy&#39; specified bound 4 equals destination size [-We=
rror=3Dstringop-truncation]<br>
&gt; +=C2=A0 106 |=C2=A0 =C2=A0return __builtin___strncpy_chk (__dest, __s=
rc, __len, __bos (__dest));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~<br>
&gt; +<br>
&gt; +Signed-off-by: Gianfranco Costamagna &lt;<a href=3D"mailto:costamagn=
agianfranco@yahoo.it" target=3D"_blank">costamagnagianfranco@yahoo.it</a>&g=
t;<br>
&gt; +Signed-off-by: Gianfranco Costamagna &lt;<a href=3D"mailto:locutusof=
borg@debian.org" target=3D"_blank">locutusofborg@debian.org</a>&gt;<br>
&gt; +---<br>
&gt; + src/console/dlt-control-common.c | 4 ++--<br>
&gt; + 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/src/console/dlt-control-common.c b/src/console/dlt-cont=
rol-common.c<br>
&gt; +index 8a9d29f0..f58d8268 100644<br>
&gt; +--- a/src/console/dlt-control-common.c<br>
&gt; ++++ b/src/console/dlt-control-common.c<br>
&gt; +@@ -671,8 +671,8 @@ DltReturnValue dlt_json_filter_load(DltFilter *f=
ilter, const char *filename, int<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct json_object *j_payload_max;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0enum json_tokener_error jerr;<br>
&gt; +<br>
&gt; +-=C2=A0 =C2=A0 char app_id[DLT_ID_SIZE] =3D &quot;&quot;;<br>
&gt; +-=C2=A0 =C2=A0 char context_id[DLT_ID_SIZE] =3D &quot;&quot;;<br>
&gt; ++=C2=A0 =C2=A0 char app_id[DLT_ID_SIZE + 1] =3D &quot;&quot;;<br>
&gt; ++=C2=A0 =C2=A0 char context_id[DLT_ID_SIZE + 1] =3D &quot;&quot;;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0int32_t log_level =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int32_t payload_max =3D INT32_MAX;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int32_t payload_min =3D 0;<br>
&gt; diff --git a/meta-oe/recipes-extended/dlt-daemon/<a href=3D"http://dl=
t-daemon_2.18.6.bb" rel=3D"noreferrer" target=3D"_blank">dlt-daemon_2.18.6.=
bb</a> b/meta-oe/recipes-extended/dlt-daemon/<a href=3D"http://dlt-daemon_2=
.18.7.bb" rel=3D"noreferrer" target=3D"_blank">dlt-daemon_2.18.7.bb</a><br>
&gt; similarity index 88%<br>
&gt; rename from meta-oe/recipes-extended/dlt-daemon/<a href=3D"http://dlt=
-daemon_2.18.6.bb" rel=3D"noreferrer" target=3D"_blank">dlt-daemon_2.18.6.b=
b</a><br>
&gt; rename to meta-oe/recipes-extended/dlt-daemon/<a href=3D"http://dlt-d=
aemon_2.18.7.bb" rel=3D"noreferrer" target=3D"_blank">dlt-daemon_2.18.7.bb<=
/a><br>
&gt; index b3cfb4709..c4ad59381 100644<br>
&gt; --- a/meta-oe/recipes-extended/dlt-daemon/<a href=3D"http://dlt-daemo=
n_2.18.6.bb" rel=3D"noreferrer" target=3D"_blank">dlt-daemon_2.18.6.bb</a><=
br>
&gt; +++ b/meta-oe/recipes-extended/dlt-daemon/<a href=3D"http://dlt-daemo=
n_2.18.7.bb" rel=3D"noreferrer" target=3D"_blank">dlt-daemon_2.18.7.bb</a><=
br>
&gt; @@ -12,18 +12,19 @@ SECTION =3D &quot;console/utils&quot;<br>
&gt;=C2=A0 LICENSE =3D &quot;MPLv2&quot;<br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D8184208060df880=
fe3137b93eb88aeea&quot;<br>
&gt;<br>
&gt; -DEPENDS =3D &quot;zlib gzip-native&quot;<br>
&gt; +DEPENDS =3D &quot;zlib gzip-native json-c&quot;<br>
&gt;<br>
&gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://github.com/GENIVI/$%7=
BBPN%7D.git;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">github.c=
om/GENIVI/${BPN}.git;protocol=3Dhttps</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 file://0002-Don-t-execute-processes-as-a-specific=
-user.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 file://0004-Modify-systemd-config-directory.patch=
 \<br>
&gt; +=C2=A0 =C2=A0 file://317.patch \<br>
&gt;=C2=A0 &quot;<br>
&gt; -SRCREV =3D &quot;22715aeceaa81ace2c832312529bde3a42d0814f&quot;<br>
&gt; +SRCREV =3D &quot;24d197214bfdcec7430d31b42e5c87df27287aaf&quot;<br>
&gt;<br>
&gt;=C2=A0 S =3D &quot;${WORKDIR}/git&quot;<br>
&gt;<br>
&gt;=C2=A0 PACKAGECONFIG ?=3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATU=
RES&#39;, &#39;systemd&#39;, &#39; systemd systemd-watchdog systemd-journal=
 dlt-examples dlt-adaptor dlt-console &#39;, &#39;&#39;, d)} \<br>
&gt; - udp-connection dlt-system dlt-filetransfer &quot;<br>
&gt; + udp-connection dlt-system dlt-filetransfer dlt-examples systemd sys=
temd-watchdog systemd-journal dlt-dbus udp-connection dlt-adaptor dlt-syste=
m dlt-filetransfer dlt-console &quot;<br>
&gt;=C2=A0 # dlt-dbus<br>
&gt;<br>
&gt;=C2=A0 # General options<br>
&gt; @@ -44,7 +45,7 @@ PACKAGECONFIG[dlt-console] =3D &quot;-DWITH_DLT_CON=
SOLE=3DON,-DWITH_DLT_CONSOLE=3DOFF,,dlt-<br>
&gt;<br>
&gt;=C2=A0 inherit autotools gettext cmake systemd<br>
&gt;<br>
&gt; -EXTRA_OECMAKE +=3D &quot;-DSYSTEMD_UNITDIR=3D${systemd_system_unitdi=
r}&quot;<br>
&gt; +EXTRA_OECMAKE +=3D &quot;-DWITH_EXTENDED_FILTERING=3DON -DSYSTEMD_UN=
ITDIR=3D${systemd_system_unitdir}&quot;<br>
&gt;<br>
&gt;=C2=A0 PACKAGES +=3D &quot;${PN}-systemd&quot;<br>
&gt;=C2=A0 SYSTEMD_PACKAGES =3D &quot;${PN} ${PN}-systemd&quot;<br>
&gt; --<br>
&gt; 2.25.1<br>
&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
</blockquote></div>

--000000000000444f8f05c626e054--
