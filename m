Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
 by mx.groups.io with SMTP id smtpd.web12.7500.1598687965430526085
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 29 Aug 2020 00:59:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HgKdwXIJ;
 spf=pass (domain: gmail.com, ip: 209.85.222.193, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f193.google.com with SMTP id g72so1284163qke.8
        for <openembedded-devel@lists.openembedded.org>; Sat, 29 Aug 2020 00:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=2Ee/1pVqMhreq1awOrq6WmNGee1Ntns3AOkzWPQfWmA=;
        b=HgKdwXIJDn3lPsUl6uMIPt/M9pPW9RZU2ggYvViMQvPOXdiRCc5qzt9KjTT/3hzz7/
         9pdnchXYPLck/BV2LfDuTcLjD7BCJdbziCOZuikBSaKO3UiLI/MWUVami9btg80XxS0z
         Twa/dz4M53aTcI/GqWHo/+LeTk80WmTS858xtFlYeVM+wRV1UJ97oWt+JTZ7rxobiK6G
         3zwjqvqP8ApfvoV0R+dWpjyrUY6UYUqkZH5X1lA1LrgfTrdxeOwm0BJFGTiv1kVCuCr3
         tIskG93phisRWoRLGwcp6VJ5gd0YUII2955zHR53oBhV/e5tAdBD8okclm3KAEf2mqqo
         Rz/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=2Ee/1pVqMhreq1awOrq6WmNGee1Ntns3AOkzWPQfWmA=;
        b=GYcA7crW2+M2pFxCGqdDCzTYlsSFxXF5sSvczPmFAX8e5pI/Kc/W54duDTzpGFOiDv
         Tq8h/Cx79OpoOzociGSrpWzARR8lPqi86NGUUIUnlRVaqcRFbH7TE0aolOxeMULwIyQV
         C4/5G6QflbNsp4tLmT461W+eEsTUjXnLl3G5lopYq0P0n/7GzPGTbLg+6CtzZGQMSpoj
         EqFHSOpTlQjcL0JE7SRtlkMrnE9sTTX5mKoZEnW+KsEYG7KAWERNi142Ssv0EZRxtSOy
         et4Segt0KcZlPVasghd/C7LkYSx7Use0eoKSXLA0ODsFawDUDOtHTUVMhdbY8rQ4MWHI
         rZ6w==
X-Gm-Message-State: AOAM53207rA9jzV1+8+GEJVhuW7XwY1w2uqQ5ShCeNbZiwGY64qXYRGe
	HclCJLMgvqxsLm1ODaA6kSl/sY9r6yPKVKHfp7w=
X-Google-Smtp-Source: ABdhPJwCVMtEV+K/Cf7CD3Y6J5Okq7NuOmWZMxAHjpAnD3r1PRCMW3JkV0sJDRLlKgw/6EguwP6WUjirHoIzZlEBSgo=
X-Received: by 2002:a37:6f43:: with SMTP id k64mr2626602qkc.212.1598687964365;
 Sat, 29 Aug 2020 00:59:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200829065445.1952-1-costamagnagianfranco@yahoo.it>
In-Reply-To: <20200829065445.1952-1-costamagnagianfranco@yahoo.it>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sat, 29 Aug 2020 00:58:58 -0700
Message-ID: <CAMKF1srt+f_aHLN7W6d5e2MokfXi-rbneOWY-y5vh5Kqq6SebA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] dlt-daemon: superseed upstream pr #238 patch with pr #245 due to unexpected behaviour
To: Gianfranco <costamagna.gianfranco@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	Gianfranco Costamagna <costamagnagianfranco@yahoo.it>, 
	Gianfranco Costamagna <locutusofborg@debian.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2020 at 11:54 PM Gianfranco
<costamagna.gianfranco@gmail.com> wrote:
>
> Upstream commented to use the second one
>
> Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
> Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
> ---
>  .../wvdial/wvstreams/ftbfs-gcc-10.patch       | 27 ++++++++++
>  .../wvdial/wvstreams_4.6.1.bb                 |  1 +

is this spurious change ?

>  .../dlt-daemon/{238.patch =3D> 245.patch}       | 53 ++++++++++++++++--=
-
>  .../dlt-daemon/dlt-daemon_2.18.5.bb           |  2 +-
>  4 files changed, 75 insertions(+), 8 deletions(-)
>  create mode 100644 meta-oe/recipes-connectivity/wvdial/wvstreams/ftbfs-=
gcc-10.patch
>  rename meta-oe/recipes-extended/dlt-daemon/dlt-daemon/{238.patch =3D> 2=
45.patch} (65%)
>
> diff --git a/meta-oe/recipes-connectivity/wvdial/wvstreams/ftbfs-gcc-10.=
patch b/meta-oe/recipes-connectivity/wvdial/wvstreams/ftbfs-gcc-10.patch
> new file mode 100644
> index 000000000..03d2889f1
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/wvdial/wvstreams/ftbfs-gcc-10.patch
> @@ -0,0 +1,27 @@
> +Description: Fix a build failure with gcc-10.
> + version_major is declared as unsigned int, so "-1" value makes no sens=
e here.
> + Also, we don't want to change the variable to a public interface, bett=
er just ignore this
> + debug use-case nobody probably ever used.
> +Author: Gianfranco Costamagna <locutusofborg@debian.org>
> +Bug-Debian: https://bugs.debian.org/957964
> +Last-Update: 2020-08-15
> +
> +--- wvstreams-4.6.1.orig/xplc/moduleloader.cc
> ++++ wvstreams-4.6.1/xplc/moduleloader.cc
> +@@ -63,11 +63,11 @@ Module* Module::loadModule(const char* m
> +   }
> +
> +   switch(moduleinfo->version_major) {
> +-#ifdef UNSTABLE
> +-  case -1:
> +-    /* nothing to do */
> +-    break;
> +-#endif
> ++//#ifdef UNSTABLE
> ++//  case -1:
> ++//    /* nothing to do */
> ++//    break;
> ++//#endif
> +   default:
> +     loaderClose(dlh);
> +     return NULL;
> diff --git a/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb b/me=
ta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
> index 20becaf57..15c0a59ee 100644
> --- a/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
> +++ b/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
> @@ -23,6 +23,7 @@ SRC_URI =3D "http://${BPN}.googlecode.com/files/${BP}.=
tar.gz \
>             file://openssl-buildfix.patch \
>             file://0001-Forward-port-to-OpenSSL-1.1.x.patch \
>             file://0001-Fix-narrowing-conversion-error.patch \
> +           file://ftbfs-gcc-10.patch \
>             "
>
>  SRC_URI[md5sum] =3D "2760dac31a43d452a19a3147bfde571c"
> diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/238.patch b/=
meta-oe/recipes-extended/dlt-daemon/dlt-daemon/245.patch
> similarity index 65%
> rename from meta-oe/recipes-extended/dlt-daemon/dlt-daemon/238.patch
> rename to meta-oe/recipes-extended/dlt-daemon/dlt-daemon/245.patch
> index 14c44e6ed..43057489c 100644
> --- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/238.patch
> +++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/245.patch
> @@ -1,6 +1,6 @@
> -From 214f8c71552fc096077f0b916dad75b31eefea3d Mon Sep 17 00:00:00 2001
> +From 57fd61ea5c58a4f9fcd7140b53ac6cd6e971ef47 Mon Sep 17 00:00:00 2001
>  From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
> -Date: Fri, 31 Jul 2020 15:26:35 +0200
> +Date: Fri, 31 Jul 2020 15:16:02 +0200
>  Subject: [PATCH] dlt_offline: fix build failures with gcc-10
>
>  see bug report: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D957=
140
> @@ -14,11 +14,26 @@ see bug report: https://bugs.debian.org/cgi-bin/bugr=
eport.cgi?bug=3D957140
>  /usr/bin/ld: CMakeFiles/dlt-daemon.dir/dlt_daemon_event_handler.c.o:./o=
bj-x86_64-linux-gnu/src/daemon/./src/offlinelogstorage/dlt_offline_logstora=
ge.h:116: multiple definition of `g_logstorage_cache_max'; CMakeFiles/dlt-d=
aemon.dir/dlt-daemon.c.o:./obj-x86_64-linux-gnu/src/daemon/./src/offlinelog=
storage/dlt_offline_logstorage.h:116: first defined here
>  /usr/bin/ld: CMakeFiles/dlt-daemon.dir/dlt_daemon_offline_logstorage.c.=
o:./obj-x86_64-linux-gnu/src/daemon/./src/offlinelogstorage/dlt_offline_log=
storage.h:116: multiple definition of `g_logstorage_cache_max'; CMakeFiles/=
dlt-daemon.dir/dlt-daemon.c.o:./obj-x86_64-linux-gnu/src/daemon/./src/offli=
nelogstorage/dlt_offline_logstorage.h:116: first defined here
>  ---
> - src/offlinelogstorage/dlt_offline_logstorage.h | 4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> + src/daemon/dlt_daemon_offline_logstorage.c              | 1 +
> + src/offlinelogstorage/dlt_offline_logstorage.h          | 4 ++--
> + src/offlinelogstorage/dlt_offline_logstorage_behavior.c | 1 +
> + tests/gtest_dlt_daemon_offline_log.cpp                  | 1 +
> + 4 files changed, 5 insertions(+), 2 deletions(-)
>
> +diff --git a/src/daemon/dlt_daemon_offline_logstorage.c b/src/daemon/dl=
t_daemon_offline_logstorage.c
> +index 0b3c14f..db9637e 100644
> +--- a/src/daemon/dlt_daemon_offline_logstorage.c
> ++++ b/src/daemon/dlt_daemon_offline_logstorage.c
> +@@ -56,6 +56,7 @@ DLT_STATIC DltReturnValue dlt_logstorage_split_ecuid(=
char *key,
> +     return DLT_RETURN_OK;
> + }
> +
> ++unsigned int g_logstorage_cache_max;
> + /**
> +  * dlt_logstorage_split_ctid
> +  *
>  diff --git a/src/offlinelogstorage/dlt_offline_logstorage.h b/src/offli=
nelogstorage/dlt_offline_logstorage.h
> -index b58da70..8ad84b8 100644
> +index b58da70..c9bc93b 100644
>  --- a/src/offlinelogstorage/dlt_offline_logstorage.h
>  +++ b/src/offlinelogstorage/dlt_offline_logstorage.h
>  @@ -114,9 +114,9 @@
> @@ -26,10 +41,34 @@ index b58da70..8ad84b8 100644
>
>   /* logstorage max cache */
>  -unsigned int g_logstorage_cache_max;
> -+static unsigned int g_logstorage_cache_max;
> ++extern unsigned int g_logstorage_cache_max;
>   /* current logstorage cache size */
>  -unsigned int g_logstorage_cache_size;
> -+static unsigned int g_logstorage_cache_size;
> ++extern unsigned int g_logstorage_cache_size;
>
>   typedef struct
>   {
> +diff --git a/src/offlinelogstorage/dlt_offline_logstorage_behavior.c b/=
src/offlinelogstorage/dlt_offline_logstorage_behavior.c
> +index afbf8c4..edef482 100644
> +--- a/src/offlinelogstorage/dlt_offline_logstorage_behavior.c
> ++++ b/src/offlinelogstorage/dlt_offline_logstorage_behavior.c
> +@@ -32,6 +32,7 @@
> + #include "dlt_offline_logstorage_behavior.h"
> + #include "dlt_offline_logstorage_behavior_internal.h"
> +
> ++unsigned int g_logstorage_cache_size;
> + /**
> +  * dlt_logstorage_log_file_name
> +  *
> +diff --git a/tests/gtest_dlt_daemon_offline_log.cpp b/tests/gtest_dlt_d=
aemon_offline_log.cpp
> +index b8965de..0bd4d5e 100644
> +--- a/tests/gtest_dlt_daemon_offline_log.cpp
> ++++ b/tests/gtest_dlt_daemon_offline_log.cpp
> +@@ -29,6 +29,7 @@ extern "C"
> + #include <fcntl.h>
> + }
> +
> ++unsigned int g_logstorage_cache_max;
> + /* Begin Method: dlt_logstorage::t_dlt_logstorage_list_add*/
> + TEST(t_dlt_logstorage_list_add, normal)
> + {
> diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.5.bb b/=
meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.5.bb
> index 3a2b40515..f3fcee4d2 100644
> --- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.5.bb
> +++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.5.bb
> @@ -17,8 +17,8 @@ DEPENDS =3D "zlib gzip-native"
>  SRC_URI =3D "git://github.com/GENIVI/${BPN}.git;protocol=3Dhttps \
>      file://0002-Don-t-execute-processes-as-a-specific-user.patch \
>      file://0004-Modify-systemd-config-directory.patch \
> -    file://238.patch \
>      file://241.patch \
> +    file://245.patch \
>  "
>  SRCREV =3D "f1ac087c766827b1d0ed9c3a814b3cc052e948f2"
>
> --
> 2.17.1
>
>=20
