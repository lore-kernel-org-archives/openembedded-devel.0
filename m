Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com [209.85.160.194])
 by mx.groups.io with SMTP id smtpd.web10.4943.1596351684335337723
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 02 Aug 2020 00:01:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=A9BmaEoz;
 spf=pass (domain: gmail.com, ip: 209.85.160.194, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f194.google.com with SMTP id t23so22992132qto.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 02 Aug 2020 00:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=41j8+e5/w/3gfyb1AKdTKnGPa5Hu1TzdnU7JmCbdbaA=;
        b=A9BmaEozThMUP0bIinh20wVJ7Xpb/cBkCa9wkrLDnlKWTmt30Wj0R8FdkdAF6hVlNP
         rhv5fnvzwrd6Odg3HjCj/zu8WA+Ff58CLU4aB8TEs/x+Mw93mWchnanZe8XHvNwo7kv0
         Bka4jsoJTP0n5OslylBxQ4NlXlGnbpcmSLiQ4I9jfPA62vJ3w3sk13YHJFGNfDbGXLDn
         6effSBtTTnrOUgZnOx0wAfZas969jb7pVBGUKWB4AB1r5Ah0D2MK/PoDpx+w9L+ML4gN
         rrpBTCG6lvz143nAvazzaUlfceQgU0jXZQC2YTN+8cDsEOBNNh0u+ukRSwr9gll93N+F
         fqWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=41j8+e5/w/3gfyb1AKdTKnGPa5Hu1TzdnU7JmCbdbaA=;
        b=W+ETfgOge1Jmti+vLuQBs7Jx2GVOpgrmVBpxj+QPclGJQKvy8MFJtaD2E0iRXJdVK0
         7aAegQEysau9rAPw9zanm4jzMo0Zcw+V8BqrD1n2VU/xTV9Up6OQOyOFaJo919t8Dl8I
         Cb2YPCRf2QhOrs+3aQ6SjhTf2fe93GyzF+GfID9XivLWcFCzbkdzi60MA8Fzh3rknmc3
         6HER+WpX+6ik8ZQlJC1zfqkseg+jscrXVKGdNujtUoeg45lUEpVpphU7AGLnJ/8Jv+Ao
         iH/GSVp3WBqppxD3ie80pBB2LJkJLaBe2r6J+uPYrRsZ9HLGSR7SgeqryPSTCCaF0WN8
         tAkw==
X-Gm-Message-State: AOAM5323sSwGKXYKqRux1mlxMLNjLXq2Yfo7WoxAqpGXPA2REYiCav6c
	4QistOExdbmDbPeTWBcWjbSv2xIU1DHuEstuqHWVRKwya+w=
X-Google-Smtp-Source: ABdhPJzaWBb1lMvvP0sPOeWEwSiJHH5l90tAXZ8dl/SoXtj+9P8xMQ9GUaV9OrY2qoJLYtgimT9K2d177xk1oBtOX84=
X-Received: by 2002:ac8:22ea:: with SMTP id g39mr11484483qta.146.1596351683297;
 Sun, 02 Aug 2020 00:01:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200731144302.7074-1-costamagnagianfranco@yahoo.it>
In-Reply-To: <20200731144302.7074-1-costamagnagianfranco@yahoo.it>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sun, 2 Aug 2020 00:00:57 -0700
Message-ID: <CAMKF1sozJDAOJFMOPGP8_yEB0z5RHsTqh_bEqYdcAWnB=5fkCw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/4] dlt-daemon: update to 2.18.5
To: Gianfranco <costamagna.gianfranco@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	Gianfranco Costamagna <costamagnagianfranco@yahoo.it>, 
	Gianfranco Costamagna <locutusofborg@debian.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This fails on musl

http://errors.yoctoproject.org/Errors/Details/427081/

On Fri, Jul 31, 2020 at 7:43 AM Gianfranco
<costamagna.gianfranco@gmail.com> wrote:
>
>  - drop patch 204: upstream
>  - add gcc-10 build fix proposed upstream 238.patch
>
> Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
> Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
> ---
>  .../dlt-daemon/dlt-daemon/204.patch           | 148 ------------------
>  .../dlt-daemon/dlt-daemon/238.patch           |  35 +++++
>  ...-daemon_2.18.4.bb =3D> dlt-daemon_2.18.5.bb} |   4 +-
>  3 files changed, 37 insertions(+), 150 deletions(-)
>  delete mode 100644 meta-oe/recipes-extended/dlt-daemon/dlt-daemon/204.p=
atch
>  create mode 100644 meta-oe/recipes-extended/dlt-daemon/dlt-daemon/238.p=
atch
>  rename meta-oe/recipes-extended/dlt-daemon/{dlt-daemon_2.18.4.bb =3D> d=
lt-daemon_2.18.5.bb} (97%)
>
> diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/204.patch b/=
meta-oe/recipes-extended/dlt-daemon/dlt-daemon/204.patch
> deleted file mode 100644
> index f0fc0bcb2..000000000
> --- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/204.patch
> +++ /dev/null
> @@ -1,148 +0,0 @@
> -Upstream-Status: Submitted [https://github.com/GENIVI/dlt-daemon/pull/2=
04]
> -From 92830aff6e91041f574753d78da758c62981d9a4 Mon Sep 17 00:00:00 2001
> -From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
> -Date: Sat, 25 Jan 2020 09:08:07 +0100
> -Subject: [PATCH 1/3] dlt_user.h: fix build when musl is the libc
> - implementation, by adding a missing include for pthread_t reference:
> -
> -see https://errors.yoctoproject.org/Errors/Details/308000/ for details
> -
> -Thanks Khem Raj <raj.khem@gmail.com> for the report
> -
> -Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
> -Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
> ----
> - include/dlt/dlt_user.h | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/include/dlt/dlt_user.h b/include/dlt/dlt_user.h
> -index 69cb854..766d349 100644
> ---- a/include/dlt/dlt_user.h
> -+++ b/include/dlt/dlt_user.h
> -@@ -74,6 +74,7 @@
> -  \{
> -  */
> - #   include <mqueue.h>
> -+#   include <pthread.h>
> -
> - #   if !defined (__WIN32__)
> - #      include <semaphore.h>
> -
> -From 5f67aba02c12b7446e63ccc86285c13bc5c7a432 Mon Sep 17 00:00:00 2001
> -From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
> -Date: Sat, 25 Jan 2020 09:16:14 +0100
> -Subject: [PATCH 2/3] dlt-test-init-free: fix build failure with strict
> - compiler flags, due to uint being undefined. This is actually an "int"=
 type,
> - looking at the test implementation
> -
> -Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
> -Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
> ----
> - src/tests/dlt-test-init-free.c | 4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/src/tests/dlt-test-init-free.c b/src/tests/dlt-test-init-f=
ree.c
> -index 96b5245..35b8803 100644
> ---- a/src/tests/dlt-test-init-free.c
> -+++ b/src/tests/dlt-test-init-free.c
> -@@ -32,7 +32,7 @@
> -
> - void exec(const char *cmd, char *buffer, size_t length);
> - void printMemoryUsage();
> --char *occupyMemory(uint size);
> -+char *occupyMemory(int size);
> - void do_example_test();
> - void do_dlt_test();
> -
> -@@ -131,7 +131,7 @@ void printMemoryUsage()
> -     printf("%s", result);
> - }
> -
> --char *occupyMemory(uint size)
> -+char *occupyMemory(int size)
> - {
> -     char *buf =3D (char *)malloc(size * sizeof(char));
> -
> -
> -From c790d61fad382e5d3e648ee99904087eb9bc4a77 Mon Sep 17 00:00:00 2001
> -From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
> -Date: Sat, 25 Jan 2020 09:20:48 +0100
> -Subject: [PATCH 3/3] sys/poll.h: deprecate old sys/poll.h include heade=
r, now
> - glibc/musl wants poll.h being included directly. This fixes a build fa=
ilure
> - on musl systems with strict c hardening flags
> -
> -Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
> -Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
> ----
> - src/console/logstorage/dlt-logstorage-ctrl.c | 2 +-
> - src/daemon/dlt_daemon_event_handler.c        | 2 +-
> - src/daemon/dlt_daemon_event_handler.h        | 2 +-
> - src/daemon/dlt_daemon_event_handler_types.h  | 2 +-
> - src/lib/dlt_user.c                           | 2 +-
> - 5 files changed, 5 insertions(+), 5 deletions(-)
> -
> -diff --git a/src/console/logstorage/dlt-logstorage-ctrl.c b/src/console=
/logstorage/dlt-logstorage-ctrl.c
> -index 525c137..6614f44 100644
> ---- a/src/console/logstorage/dlt-logstorage-ctrl.c
> -+++ b/src/console/logstorage/dlt-logstorage-ctrl.c
> -@@ -61,7 +61,7 @@
> - #include <string.h>
> - #include <getopt.h>
> -
> --#include <sys/poll.h>
> -+#include <poll.h>
> -
> - #if defined(__linux__)
> - #   include "sd-daemon.h"
> -diff --git a/src/daemon/dlt_daemon_event_handler.c b/src/daemon/dlt_dae=
mon_event_handler.c
> -index 1611f7b..0d463da 100644
> ---- a/src/daemon/dlt_daemon_event_handler.c
> -+++ b/src/daemon/dlt_daemon_event_handler.c
> -@@ -30,7 +30,7 @@
> - #include <string.h>
> - #include <errno.h>
> -
> --#include <sys/poll.h>
> -+#include <poll.h>
> - #include <syslog.h>
> -
> - #include "dlt_common.h"
> -diff --git a/src/daemon/dlt_daemon_event_handler.h b/src/daemon/dlt_dae=
mon_event_handler.h
> -index eb96101..bd550d3 100644
> ---- a/src/daemon/dlt_daemon_event_handler.h
> -+++ b/src/daemon/dlt_daemon_event_handler.h
> -@@ -25,7 +25,7 @@
> -  * \file dlt_daemon_event_handler.h
> -  */
> -
> --#include <sys/poll.h>
> -+#include <poll.h>
> -
> - #include "dlt_daemon_connection_types.h"
> - #include "dlt_daemon_event_handler_types.h"
> -diff --git a/src/daemon/dlt_daemon_event_handler_types.h b/src/daemon/d=
lt_daemon_event_handler_types.h
> -index 370e503..0b16d08 100644
> ---- a/src/daemon/dlt_daemon_event_handler_types.h
> -+++ b/src/daemon/dlt_daemon_event_handler_types.h
> -@@ -25,7 +25,7 @@
> -  * \file dlt_daemon_event_handler_types.h
> -  */
> -
> --#include <sys/poll.h>
> -+#include <poll.h>
> -
> - #include "dlt_daemon_connection_types.h"
> -
> -#diff --git a/src/lib/dlt_user.c b/src/lib/dlt_user.c
> -#index ffa9b09..511f991 100644
> -#--- a/src/lib/dlt_user.c
> -#+++ b/src/lib/dlt_user.c
> -#@@ -43,7 +43,7 @@
> -# #include <errno.h>
> -#
> -# #include <sys/uio.h> /* writev() */
> -#-#include <sys/poll.h>
> -#+#include <poll.h>
> -#
> -# #include <limits.h>
> -# #ifdef linux
> diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/238.patch b/=
meta-oe/recipes-extended/dlt-daemon/dlt-daemon/238.patch
> new file mode 100644
> index 000000000..14c44e6ed
> --- /dev/null
> +++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/238.patch
> @@ -0,0 +1,35 @@
> +From 214f8c71552fc096077f0b916dad75b31eefea3d Mon Sep 17 00:00:00 2001
> +From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
> +Date: Fri, 31 Jul 2020 15:26:35 +0200
> +Subject: [PATCH] dlt_offline: fix build failures with gcc-10
> +
> +see bug report: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D957=
140
> +
> +/usr/bin/ld: CMakeFiles/dlt-daemon.dir/dlt_daemon_client.c.o:./obj-x86_=
64-linux-gnu/src/daemon/./src/offlinelogstorage/dlt_offline_logstorage.h:11=
6: multiple definition of `g_logstorage_cache_max'; CMakeFiles/dlt-daemon.d=
ir/dlt-daemon.c.o:./obj-x86_64-linux-gnu/src/daemon/./src/offlinelogstorage=
/dlt_offline_logstorage.h:116: first defined here
> +/usr/bin/ld: CMakeFiles/dlt-daemon.dir/dlt_daemon_common.c.o:./obj-x86_=
64-linux-gnu/src/daemon/./src/offlinelogstorage/dlt_offline_logstorage.h:11=
8: multiple definition of `g_logstorage_cache_size'; CMakeFiles/dlt-daemon.=
dir/dlt-daemon.c.o:./obj-x86_64-linux-gnu/src/daemon/./src/offlinelogstorag=
e/dlt_offline_logstorage.h:118: first defined here
> +/usr/bin/ld: CMakeFiles/dlt-daemon.dir/dlt_daemon_common.c.o:./obj-x86_=
64-linux-gnu/src/daemon/./src/offlinelogstorage/dlt_offline_logstorage.h:11=
6: multiple definition of `g_logstorage_cache_max'; CMakeFiles/dlt-daemon.d=
ir/dlt-daemon.c.o:./obj-x86_64-linux-gnu/src/daemon/./src/offlinelogstorage=
/dlt_offline_logstorage.h:116: first defined here
> +/usr/bin/ld: CMakeFiles/dlt-daemon.dir/dlt_daemon_connection.c.o:./obj-=
x86_64-linux-gnu/src/daemon/./src/offlinelogstorage/dlt_offline_logstorage.=
h:118: multiple definition of `g_logstorage_cache_size'; CMakeFiles/dlt-dae=
mon.dir/dlt-daemon.c.o:./obj-x86_64-linux-gnu/src/daemon/./src/offlinelogst=
orage/dlt_offline_logstorage.h:118: first defined here
> +/usr/bin/ld: CMakeFiles/dlt-daemon.dir/dlt_daemon_connection.c.o:./obj-=
x86_64-linux-gnu/src/daemon/./src/offlinelogstorage/dlt_offline_logstorage.=
h:116: multiple definition of `g_logstorage_cache_max'; CMakeFiles/dlt-daem=
on.dir/dlt-daemon.c.o:./obj-x86_64-linux-gnu/src/daemon/./src/offlinelogsto=
rage/dlt_offline_logstorage.h:116: first defined here
> +/usr/bin/ld: CMakeFiles/dlt-daemon.dir/dlt_daemon_event_handler.c.o:./o=
bj-x86_64-linux-gnu/src/daemon/./src/offlinelogstorage/dlt_offline_logstora=
ge.h:118: multiple definition of `g_logstorage_cache_size'; CMakeFiles/dlt-=
daemon.dir/dlt-daemon.c.o:./obj-x86_64-linux-gnu/src/daemon/./src/offlinelo=
gstorage/dlt_offline_logstorage.h:118: first defined here
> +/usr/bin/ld: CMakeFiles/dlt-daemon.dir/dlt_daemon_event_handler.c.o:./o=
bj-x86_64-linux-gnu/src/daemon/./src/offlinelogstorage/dlt_offline_logstora=
ge.h:116: multiple definition of `g_logstorage_cache_max'; CMakeFiles/dlt-d=
aemon.dir/dlt-daemon.c.o:./obj-x86_64-linux-gnu/src/daemon/./src/offlinelog=
storage/dlt_offline_logstorage.h:116: first defined here
> +/usr/bin/ld: CMakeFiles/dlt-daemon.dir/dlt_daemon_offline_logstorage.c.=
o:./obj-x86_64-linux-gnu/src/daemon/./src/offlinelogstorage/dlt_offline_log=
storage.h:116: multiple definition of `g_logstorage_cache_max'; CMakeFiles/=
dlt-daemon.dir/dlt-daemon.c.o:./obj-x86_64-linux-gnu/src/daemon/./src/offli=
nelogstorage/dlt_offline_logstorage.h:116: first defined here
> +---
> + src/offlinelogstorage/dlt_offline_logstorage.h | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/src/offlinelogstorage/dlt_offline_logstorage.h b/src/offli=
nelogstorage/dlt_offline_logstorage.h
> +index b58da70..8ad84b8 100644
> +--- a/src/offlinelogstorage/dlt_offline_logstorage.h
> ++++ b/src/offlinelogstorage/dlt_offline_logstorage.h
> +@@ -114,9 +114,9 @@
> + #define DLT_OFFLINE_LOGSTORAGE_IS_STRATEGY_SET(S, s) ((S)&(s))
> +
> + /* logstorage max cache */
> +-unsigned int g_logstorage_cache_max;
> ++static unsigned int g_logstorage_cache_max;
> + /* current logstorage cache size */
> +-unsigned int g_logstorage_cache_size;
> ++static unsigned int g_logstorage_cache_size;
> +
> + typedef struct
> + {
> diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.4.bb b/=
meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.5.bb
> similarity index 97%
> rename from meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.4.bb
> rename to meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.5.bb
> index 35c638bc7..3f5089672 100644
> --- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.4.bb
> +++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.5.bb
> @@ -17,9 +17,9 @@ DEPENDS =3D "zlib gzip-native"
>  SRC_URI =3D "git://github.com/GENIVI/${BPN}.git;protocol=3Dhttps \
>      file://0002-Don-t-execute-processes-as-a-specific-user.patch \
>      file://0004-Modify-systemd-config-directory.patch \
> -    file://204.patch \
> +    file://238.patch \
>  "
> -SRCREV =3D "14ea971be7e808b9c5099c7f404ed3cf341873c4"
> +SRCREV =3D "f1ac087c766827b1d0ed9c3a814b3cc052e948f2"
>
>  S =3D "${WORKDIR}/git"
>
> --
> 2.17.1
>
>=20
