Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web12.6731.1596441971253578828
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Aug 2020 01:06:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=b8gUvL+l;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id r12so33223818wrj.13
        for <openembedded-devel@lists.openembedded.org>; Mon, 03 Aug 2020 01:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XvRzrhAZYePvebSemUoz6se7G7nuBPxZ+4mZQBdBIxE=;
        b=b8gUvL+lXJmxKEm1eJcLk1iWFCe3Z1hLHBDy8u5OnG2krMHg7awFX6KannQvVlqXWY
         8ZuBKJVJcp51KtX2A8tKL/EEKgCocsGhNhnE0CBy12SxFBkMe+M7jRhiuugoOEYSxsmw
         Yw44LtPeapfSrd+0zeQLWKY7cciI4/S80m7rlnOmaZmjtkOTsRVH/pVPJ9Pg/8JQzhuK
         b7rQ8gdJyVq2Elq3grX97nlxaxAs/HnEyzmhJcCOI6hg+ganuTjTGaRqJEFHO7l+7I9y
         Cn/+2+fXH+K0Nfl/n1D4ZXvEhhravbSe3jKhTvXWfksKMRKK6gL44k9SAHmPTwl2IErW
         Md5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XvRzrhAZYePvebSemUoz6se7G7nuBPxZ+4mZQBdBIxE=;
        b=nsCnDvhfWXwN+N/q0CrRp6TPda8iGdlFxaq3zkRolVeJUu8uQVqaYBDYtuvjW0yfpK
         H0oPGdZwAmOoWDNlSOQCR1FBUpJK9/2jJgLmTpW9Fgwiyj1UT9lwFKybznsnOV7kZ0Lu
         QBGZ27O8yE8pCLeDK0GxdVfjnRHnEuPfi9u/xtvEqo95U6wqIPzOkzLmD9LA0MLcPnyJ
         om+VlnnvH3Q4GrF5ukaqhuTXlrhKe7+jB3zRfQOq9hB2eCbd6INdhiEy7Po0xprxksPO
         K0wb8kzK64ZcgCwMz9kgZTkp+drv69Sx/tjhxITqoCca2W/GWdyqVKhgeBnbWDq+HJWO
         G1pw==
X-Gm-Message-State: AOAM530Xg8Fb/a8WGSeVRmfvcXGCc+UQD2mM/USVnxUbyoGIWQ1wB0tz
	f6uD4cZNf64e+x1TCH3cNl3mw9+NcZ9AJDQO2Ew=
X-Google-Smtp-Source: ABdhPJzvS3MC2utxgR1354mjNB0SEaB5UUr4nLFAMUamLodSe82/NGqQ2b8XqBiPRTtNisp5KF1N+TKUPLVg8MZBVzY=
X-Received: by 2002:a5d:484d:: with SMTP id n13mr14066011wrs.297.1596441969639;
 Mon, 03 Aug 2020 01:06:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200731144302.7074-1-costamagnagianfranco@yahoo.it>
 <CAMKF1sozJDAOJFMOPGP8_yEB0z5RHsTqh_bEqYdcAWnB=5fkCw@mail.gmail.com>
 <CAATN8PUJAjGiEL8SKKBTi58xrrDMGHagkEXs+Au509eHk76dWA@mail.gmail.com> <CAMKF1sqJb+QEqrbXyDNM_JDPwKMe7eCuiFX+35N-QfpKpffkgA@mail.gmail.com>
In-Reply-To: <CAMKF1sqJb+QEqrbXyDNM_JDPwKMe7eCuiFX+35N-QfpKpffkgA@mail.gmail.com>
From: "Gianfranco" <costamagna.gianfranco@gmail.com>
Date: Mon, 3 Aug 2020 10:05:58 +0200
Message-ID: <CAATN8PXgcM6sW6CmkMQnRvABTLewR_DFVuoyiSsmtPPfsg4Q0A@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/4] dlt-daemon: update to 2.18.5
To: Khem Raj <raj.khem@gmail.com>
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>, 
	Gianfranco Costamagna <locutusofborg@debian.org>, 
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000081460a05abf49cfb"

--00000000000081460a05abf49cfb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reproduced with systemd enabled.
Will craft a patch and resubmit next week also upstream

G.

On Mon, Aug 3, 2020, 04:00 Khem Raj <raj.khem@gmail.com> wrote:

>
>
> On Sun, Aug 2, 2020 at 3:05 PM Gianfranco Costamagna <
> costamagna.gianfranco@gmail.com> wrote:
>
>> Hello
>>
>> I tried to reproduce by running everything on master (master-next for
>> meta-oe) and bitbake dlt-daemon with MACHINE set to raspberrypi4 or qem=
ux86
>> and DISTRO=3Dpoky-tiny.
>> I also tried with and without systemd.
>>
>> It builds just fine.
>> Do you have a way to share bblayers.conf and local.conf files please?
>>
>
> It=E2=80=99s perhaps revealed with glibc upgrade patch that I have stage=
d in
> yoe/mut branch on yoe distro I will look a bit as well
>
>
>> Thanks
>>
>> Gianfranco
>>
>> On Sun, Aug 2, 2020, 09:01 Khem Raj <raj.khem@gmail.com> wrote:
>>
>>> This fails on musl
>>>
>>> http://errors.yoctoproject.org/Errors/Details/427081/
>>>
>>> On Fri, Jul 31, 2020 at 7:43 AM Gianfranco
>>> <costamagna.gianfranco@gmail.com> wrote:
>>> >
>>> >  - drop patch 204: upstream
>>> >  - add gcc-10 build fix proposed upstream 238.patch
>>> >
>>> > Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
>>> > Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
>>> > ---
>>> >  .../dlt-daemon/dlt-daemon/204.patch           | 148 ---------------=
---
>>> >  .../dlt-daemon/dlt-daemon/238.patch           |  35 +++++
>>> >  ...-daemon_2.18.4.bb =3D> dlt-daemon_2.18.5.bb} |   4 +-
>>> >  3 files changed, 37 insertions(+), 150 deletions(-)
>>> >  delete mode 100644
>>> meta-oe/recipes-extended/dlt-daemon/dlt-daemon/204.patch
>>> >  create mode 100644
>>> meta-oe/recipes-extended/dlt-daemon/dlt-daemon/238.patch
>>> >  rename meta-oe/recipes-extended/dlt-daemon/{dlt-daemon_2.18.4.bb =
=3D>
>>> dlt-daemon_2.18.5.bb} (97%)
>>> >
>>> > diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/204.patc=
h
>>> b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/204.patch
>>> > deleted file mode 100644
>>> > index f0fc0bcb2..000000000
>>> > --- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/204.patch
>>> > +++ /dev/null
>>> > @@ -1,148 +0,0 @@
>>> > -Upstream-Status: Submitted [
>>> https://github.com/GENIVI/dlt-daemon/pull/204]
>>> > -From 92830aff6e91041f574753d78da758c62981d9a4 Mon Sep 17 00:00:00 2=
001
>>> > -From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
>>> > -Date: Sat, 25 Jan 2020 09:08:07 +0100
>>> > -Subject: [PATCH 1/3] dlt_user.h: fix build when musl is the libc
>>> > - implementation, by adding a missing include for pthread_t referenc=
e:
>>> > -
>>> > -see https://errors.yoctoproject.org/Errors/Details/308000/ for
>>> details
>>> > -
>>> > -Thanks Khem Raj <raj.khem@gmail.com> for the report
>>> > -
>>> > -Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it=
>
>>> > -Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
>>> > ----
>>> > - include/dlt/dlt_user.h | 1 +
>>> > - 1 file changed, 1 insertion(+)
>>> > -
>>> > -diff --git a/include/dlt/dlt_user.h b/include/dlt/dlt_user.h
>>> > -index 69cb854..766d349 100644
>>> > ---- a/include/dlt/dlt_user.h
>>> > -+++ b/include/dlt/dlt_user.h
>>> > -@@ -74,6 +74,7 @@
>>> > -  \{
>>> > -  */
>>> > - #   include <mqueue.h>
>>> > -+#   include <pthread.h>
>>> > -
>>> > - #   if !defined (__WIN32__)
>>> > - #      include <semaphore.h>
>>> > -
>>> > -From 5f67aba02c12b7446e63ccc86285c13bc5c7a432 Mon Sep 17 00:00:00 2=
001
>>> > -From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
>>> > -Date: Sat, 25 Jan 2020 09:16:14 +0100
>>> > -Subject: [PATCH 2/3] dlt-test-init-free: fix build failure with str=
ict
>>> > - compiler flags, due to uint being undefined. This is actually an
>>> "int" type,
>>> > - looking at the test implementation
>>> > -
>>> > -Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it=
>
>>> > -Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
>>> > ----
>>> > - src/tests/dlt-test-init-free.c | 4 ++--
>>> > - 1 file changed, 2 insertions(+), 2 deletions(-)
>>> > -
>>> > -diff --git a/src/tests/dlt-test-init-free.c
>>> b/src/tests/dlt-test-init-free.c
>>> > -index 96b5245..35b8803 100644
>>> > ---- a/src/tests/dlt-test-init-free.c
>>> > -+++ b/src/tests/dlt-test-init-free.c
>>> > -@@ -32,7 +32,7 @@
>>> > -
>>> > - void exec(const char *cmd, char *buffer, size_t length);
>>> > - void printMemoryUsage();
>>> > --char *occupyMemory(uint size);
>>> > -+char *occupyMemory(int size);
>>> > - void do_example_test();
>>> > - void do_dlt_test();
>>> > -
>>> > -@@ -131,7 +131,7 @@ void printMemoryUsage()
>>> > -     printf("%s", result);
>>> > - }
>>> > -
>>> > --char *occupyMemory(uint size)
>>> > -+char *occupyMemory(int size)
>>> > - {
>>> > -     char *buf =3D (char *)malloc(size * sizeof(char));
>>> > -
>>> > -
>>> > -From c790d61fad382e5d3e648ee99904087eb9bc4a77 Mon Sep 17 00:00:00 2=
001
>>> > -From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
>>> > -Date: Sat, 25 Jan 2020 09:20:48 +0100
>>> > -Subject: [PATCH 3/3] sys/poll.h: deprecate old sys/poll.h include
>>> header, now
>>> > - glibc/musl wants poll.h being included directly. This fixes a buil=
d
>>> failure
>>> > - on musl systems with strict c hardening flags
>>> > -
>>> > -Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it=
>
>>> > -Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
>>> > ----
>>> > - src/console/logstorage/dlt-logstorage-ctrl.c | 2 +-
>>> > - src/daemon/dlt_daemon_event_handler.c        | 2 +-
>>> > - src/daemon/dlt_daemon_event_handler.h        | 2 +-
>>> > - src/daemon/dlt_daemon_event_handler_types.h  | 2 +-
>>> > - src/lib/dlt_user.c                           | 2 +-
>>> > - 5 files changed, 5 insertions(+), 5 deletions(-)
>>> > -
>>> > -diff --git a/src/console/logstorage/dlt-logstorage-ctrl.c
>>> b/src/console/logstorage/dlt-logstorage-ctrl.c
>>> > -index 525c137..6614f44 100644
>>> > ---- a/src/console/logstorage/dlt-logstorage-ctrl.c
>>> > -+++ b/src/console/logstorage/dlt-logstorage-ctrl.c
>>> > -@@ -61,7 +61,7 @@
>>> > - #include <string.h>
>>> > - #include <getopt.h>
>>> > -
>>> > --#include <sys/poll.h>
>>> > -+#include <poll.h>
>>> > -
>>> > - #if defined(__linux__)
>>> > - #   include "sd-daemon.h"
>>> > -diff --git a/src/daemon/dlt_daemon_event_handler.c
>>> b/src/daemon/dlt_daemon_event_handler.c
>>> > -index 1611f7b..0d463da 100644
>>> > ---- a/src/daemon/dlt_daemon_event_handler.c
>>> > -+++ b/src/daemon/dlt_daemon_event_handler.c
>>> > -@@ -30,7 +30,7 @@
>>> > - #include <string.h>
>>> > - #include <errno.h>
>>> > -
>>> > --#include <sys/poll.h>
>>> > -+#include <poll.h>
>>> > - #include <syslog.h>
>>> > -
>>> > - #include "dlt_common.h"
>>> > -diff --git a/src/daemon/dlt_daemon_event_handler.h
>>> b/src/daemon/dlt_daemon_event_handler.h
>>> > -index eb96101..bd550d3 100644
>>> > ---- a/src/daemon/dlt_daemon_event_handler.h
>>> > -+++ b/src/daemon/dlt_daemon_event_handler.h
>>> > -@@ -25,7 +25,7 @@
>>> > -  * \file dlt_daemon_event_handler.h
>>> > -  */
>>> > -
>>> > --#include <sys/poll.h>
>>> > -+#include <poll.h>
>>> > -
>>> > - #include "dlt_daemon_connection_types.h"
>>> > - #include "dlt_daemon_event_handler_types.h"
>>> > -diff --git a/src/daemon/dlt_daemon_event_handler_types.h
>>> b/src/daemon/dlt_daemon_event_handler_types.h
>>> > -index 370e503..0b16d08 100644
>>> > ---- a/src/daemon/dlt_daemon_event_handler_types.h
>>> > -+++ b/src/daemon/dlt_daemon_event_handler_types.h
>>> > -@@ -25,7 +25,7 @@
>>> > -  * \file dlt_daemon_event_handler_types.h
>>> > -  */
>>> > -
>>> > --#include <sys/poll.h>
>>> > -+#include <poll.h>
>>> > -
>>> > - #include "dlt_daemon_connection_types.h"
>>> > -
>>> > -#diff --git a/src/lib/dlt_user.c b/src/lib/dlt_user.c
>>> > -#index ffa9b09..511f991 100644
>>> > -#--- a/src/lib/dlt_user.c
>>> > -#+++ b/src/lib/dlt_user.c
>>> > -#@@ -43,7 +43,7 @@
>>> > -# #include <errno.h>
>>> > -#
>>> > -# #include <sys/uio.h> /* writev() */
>>> > -#-#include <sys/poll.h>
>>> > -#+#include <poll.h>
>>> > -#
>>> > -# #include <limits.h>
>>> > -# #ifdef linux
>>> > diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/238.patc=
h
>>> b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/238.patch
>>> > new file mode 100644
>>> > index 000000000..14c44e6ed
>>> > --- /dev/null
>>> > +++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/238.patch
>>> > @@ -0,0 +1,35 @@
>>> > +From 214f8c71552fc096077f0b916dad75b31eefea3d Mon Sep 17 00:00:00 2=
001
>>> > +From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
>>> > +Date: Fri, 31 Jul 2020 15:26:35 +0200
>>> > +Subject: [PATCH] dlt_offline: fix build failures with gcc-10
>>> > +
>>> > +see bug report:
>>> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D957140
>>> > +
>>> > +/usr/bin/ld:
>>> CMakeFiles/dlt-daemon.dir/dlt_daemon_client.c.o:./obj-x86_64-linux-gnu=
/src/daemon/./src/offlinelogstorage/dlt_offline_logstorage.h:116:
>>> multiple definition of `g_logstorage_cache_max';
>>> CMakeFiles/dlt-daemon.dir/dlt-daemon.c.o:./obj-x86_64-linux-gnu/src/da=
emon/./src/offlinelogstorage/dlt_offline_logstorage.h:116:
>>> first defined here
>>> > +/usr/bin/ld:
>>> CMakeFiles/dlt-daemon.dir/dlt_daemon_common.c.o:./obj-x86_64-linux-gnu=
/src/daemon/./src/offlinelogstorage/dlt_offline_logstorage.h:118:
>>> multiple definition of `g_logstorage_cache_size';
>>> CMakeFiles/dlt-daemon.dir/dlt-daemon.c.o:./obj-x86_64-linux-gnu/src/da=
emon/./src/offlinelogstorage/dlt_offline_logstorage.h:118:
>>> first defined here
>>> > +/usr/bin/ld:
>>> CMakeFiles/dlt-daemon.dir/dlt_daemon_common.c.o:./obj-x86_64-linux-gnu=
/src/daemon/./src/offlinelogstorage/dlt_offline_logstorage.h:116:
>>> multiple definition of `g_logstorage_cache_max';
>>> CMakeFiles/dlt-daemon.dir/dlt-daemon.c.o:./obj-x86_64-linux-gnu/src/da=
emon/./src/offlinelogstorage/dlt_offline_logstorage.h:116:
>>> first defined here
>>> > +/usr/bin/ld:
>>> CMakeFiles/dlt-daemon.dir/dlt_daemon_connection.c.o:./obj-x86_64-linux=
-gnu/src/daemon/./src/offlinelogstorage/dlt_offline_logstorage.h:118:
>>> multiple definition of `g_logstorage_cache_size';
>>> CMakeFiles/dlt-daemon.dir/dlt-daemon.c.o:./obj-x86_64-linux-gnu/src/da=
emon/./src/offlinelogstorage/dlt_offline_logstorage.h:118:
>>> first defined here
>>> > +/usr/bin/ld:
>>> CMakeFiles/dlt-daemon.dir/dlt_daemon_connection.c.o:./obj-x86_64-linux=
-gnu/src/daemon/./src/offlinelogstorage/dlt_offline_logstorage.h:116:
>>> multiple definition of `g_logstorage_cache_max';
>>> CMakeFiles/dlt-daemon.dir/dlt-daemon.c.o:./obj-x86_64-linux-gnu/src/da=
emon/./src/offlinelogstorage/dlt_offline_logstorage.h:116:
>>> first defined here
>>> > +/usr/bin/ld:
>>> CMakeFiles/dlt-daemon.dir/dlt_daemon_event_handler.c.o:./obj-x86_64-li=
nux-gnu/src/daemon/./src/offlinelogstorage/dlt_offline_logstorage.h:118:
>>> multiple definition of `g_logstorage_cache_size';
>>> CMakeFiles/dlt-daemon.dir/dlt-daemon.c.o:./obj-x86_64-linux-gnu/src/da=
emon/./src/offlinelogstorage/dlt_offline_logstorage.h:118:
>>> first defined here
>>> > +/usr/bin/ld:
>>> CMakeFiles/dlt-daemon.dir/dlt_daemon_event_handler.c.o:./obj-x86_64-li=
nux-gnu/src/daemon/./src/offlinelogstorage/dlt_offline_logstorage.h:116:
>>> multiple definition of `g_logstorage_cache_max';
>>> CMakeFiles/dlt-daemon.dir/dlt-daemon.c.o:./obj-x86_64-linux-gnu/src/da=
emon/./src/offlinelogstorage/dlt_offline_logstorage.h:116:
>>> first defined here
>>> > +/usr/bin/ld:
>>> CMakeFiles/dlt-daemon.dir/dlt_daemon_offline_logstorage.c.o:./obj-x86_=
64-linux-gnu/src/daemon/./src/offlinelogstorage/dlt_offline_logstorage.h:11=
6:
>>> multiple definition of `g_logstorage_cache_max';
>>> CMakeFiles/dlt-daemon.dir/dlt-daemon.c.o:./obj-x86_64-linux-gnu/src/da=
emon/./src/offlinelogstorage/dlt_offline_logstorage.h:116:
>>> first defined here
>>> > +---
>>> > + src/offlinelogstorage/dlt_offline_logstorage.h | 4 ++--
>>> > + 1 file changed, 2 insertions(+), 2 deletions(-)
>>> > +
>>> > +diff --git a/src/offlinelogstorage/dlt_offline_logstorage.h
>>> b/src/offlinelogstorage/dlt_offline_logstorage.h
>>> > +index b58da70..8ad84b8 100644
>>> > +--- a/src/offlinelogstorage/dlt_offline_logstorage.h
>>> > ++++ b/src/offlinelogstorage/dlt_offline_logstorage.h
>>> > +@@ -114,9 +114,9 @@
>>> > + #define DLT_OFFLINE_LOGSTORAGE_IS_STRATEGY_SET(S, s) ((S)&(s))
>>> > +
>>> > + /* logstorage max cache */
>>> > +-unsigned int g_logstorage_cache_max;
>>> > ++static unsigned int g_logstorage_cache_max;
>>> > + /* current logstorage cache size */
>>> > +-unsigned int g_logstorage_cache_size;
>>> > ++static unsigned int g_logstorage_cache_size;
>>> > +
>>> > + typedef struct
>>> > + {
>>> > diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.4.b=
b
>>> b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.5.bb
>>> > similarity index 97%
>>> > rename from meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.4.bb
>>> > rename to meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.5.bb
>>> > index 35c638bc7..3f5089672 100644
>>> > --- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.4.bb
>>> > +++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.5.bb
>>> > @@ -17,9 +17,9 @@ DEPENDS =3D "zlib gzip-native"
>>> >  SRC_URI =3D "git://github.com/GENIVI/${BPN}.git;protocol=3Dhttps
>>> <http://github.com/GENIVI/$%7BBPN%7D.git;protocol=3Dhttps> \
>>> >      file://0002-Don-t-execute-processes-as-a-specific-user.patch \
>>> >      file://0004-Modify-systemd-config-directory.patch \
>>> > -    file://204.patch \
>>> > +    file://238.patch \
>>> >  "
>>> > -SRCREV =3D "14ea971be7e808b9c5099c7f404ed3cf341873c4"
>>> > +SRCREV =3D "f1ac087c766827b1d0ed9c3a814b3cc052e948f2"
>>> >
>>> >  S =3D "${WORKDIR}/git"
>>> >
>>> > --
>>> > 2.17.1
>>> >
>>> >=20
>>>
>>

--00000000000081460a05abf49cfb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Reproduced with systemd enabled.<div dir=3D"auto">Will cr=
aft a patch and resubmit next week also upstream</div><div dir=3D"auto"><br=
></div><div dir=3D"auto">G.=C2=A0</div></div><br><div class=3D"gmail_quote"=
><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Aug 3, 2020, 04:00 Khem Raj =
&lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex"><div><br></div><div><br><div class=
=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Aug 2, 2020=
 at 3:05 PM Gianfranco Costamagna &lt;<a href=3D"mailto:costamagna.gianfran=
co@gmail.com" target=3D"_blank" rel=3D"noreferrer">costamagna.gianfranco@gm=
ail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"=
auto">Hello<div dir=3D"auto"><br></div><div dir=3D"auto">I tried to reprodu=
ce by running everything on master (master-next for meta-oe) and bitbake dl=
t-daemon with MACHINE set to raspberrypi4 or qemux86 and DISTRO=3Dpoky-tiny=
.</div><div dir=3D"auto">I also tried with and without systemd.=C2=A0</div>=
<div dir=3D"auto"><br></div><div dir=3D"auto">It builds just fine.=C2=A0</d=
iv><div dir=3D"auto">Do you have a way to share bblayers.conf and local.con=
f files please?=C2=A0</div></div></blockquote><div dir=3D"auto"><br></div><=
div dir=3D"auto">It=E2=80=99s perhaps revealed with glibc upgrade patch tha=
t I have staged in yoe/mut branch on yoe distro I will look a bit as well</=
div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"=
auto"><div dir=3D"auto"></div><div dir=3D"auto"><br></div><div dir=3D"auto"=
>Thanks</div></div><div dir=3D"auto"><div dir=3D"auto"><br></div><div dir=
=3D"auto">Gianfranco=C2=A0</div></div><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">On Sun, Aug 2, 2020, 09:01 Khem Raj &lt;<a=
 href=3D"mailto:raj.khem@gmail.com" target=3D"_blank" rel=3D"noreferrer">ra=
j.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Thi=
s fails on musl<br>
<br>
<a href=3D"http://errors.yoctoproject.org/Errors/Details/427081/" rel=3D"n=
oreferrer noreferrer noreferrer" target=3D"_blank">http://errors.yoctoproje=
ct.org/Errors/Details/427081/</a><br>
<br>
On Fri, Jul 31, 2020 at 7:43 AM Gianfranco<br>
&lt;<a href=3D"mailto:costamagna.gianfranco@gmail.com" rel=3D"noreferrer n=
oreferrer" target=3D"_blank">costamagna.gianfranco@gmail.com</a>&gt; wrote:=
<br>
&gt;<br>
&gt;=C2=A0 - drop patch 204: upstream<br>
&gt;=C2=A0 - add gcc-10 build fix proposed upstream 238.patch<br>
&gt;<br>
&gt; Signed-off-by: Gianfranco Costamagna &lt;<a href=3D"mailto:costamagna=
gianfranco@yahoo.it" rel=3D"noreferrer noreferrer" target=3D"_blank">costam=
agnagianfranco@yahoo.it</a>&gt;<br>
&gt; Signed-off-by: Gianfranco Costamagna &lt;<a href=3D"mailto:locutusofb=
org@debian.org" rel=3D"noreferrer noreferrer" target=3D"_blank">locutusofbo=
rg@debian.org</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../dlt-daemon/dlt-daemon/204.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0| 148 ------------------<br>
&gt;=C2=A0 .../dlt-daemon/dlt-daemon/238.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0|=C2=A0 35 +++++<br>
&gt;=C2=A0 ...-<a href=3D"http://daemon_2.18.4.bb" rel=3D"noreferrer noref=
errer noreferrer" target=3D"_blank">daemon_2.18.4.bb</a> =3D&gt; <a href=3D=
"http://dlt-daemon_2.18.5.bb" rel=3D"noreferrer noreferrer noreferrer" targ=
et=3D"_blank">dlt-daemon_2.18.5.bb</a>} |=C2=A0 =C2=A04 +-<br>
&gt;=C2=A0 3 files changed, 37 insertions(+), 150 deletions(-)<br>
&gt;=C2=A0 delete mode 100644 meta-oe/recipes-extended/dlt-daemon/dlt-daem=
on/204.patch<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-extended/dlt-daemon/dlt-daem=
on/238.patch<br>
&gt;=C2=A0 rename meta-oe/recipes-extended/dlt-daemon/{<a href=3D"http://d=
lt-daemon_2.18.4.bb" rel=3D"noreferrer noreferrer noreferrer" target=3D"_bl=
ank">dlt-daemon_2.18.4.bb</a> =3D&gt; <a href=3D"http://dlt-daemon_2.18.5.b=
b" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">dlt-daemon_2.=
18.5.bb</a>} (97%)<br>
&gt;<br>
&gt; diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/204.patch=
 b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/204.patch<br>
&gt; deleted file mode 100644<br>
&gt; index f0fc0bcb2..000000000<br>
&gt; --- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/204.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,148 +0,0 @@<br>
&gt; -Upstream-Status: Submitted [<a href=3D"https://github.com/GENIVI/dlt=
-daemon/pull/204" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank=
">https://github.com/GENIVI/dlt-daemon/pull/204</a>]<br>
&gt; -From 92830aff6e91041f574753d78da758c62981d9a4 Mon Sep 17 00:00:00 20=
01<br>
&gt; -From: Gianfranco Costamagna &lt;<a href=3D"mailto:costamagnagianfran=
co@yahoo.it" rel=3D"noreferrer noreferrer" target=3D"_blank">costamagnagian=
franco@yahoo.it</a>&gt;<br>
&gt; -Date: Sat, 25 Jan 2020 09:08:07 +0100<br>
&gt; -Subject: [PATCH 1/3] dlt_user.h: fix build when musl is the libc<br>
&gt; - implementation, by adding a missing include for pthread_t reference=
:<br>
&gt; -<br>
&gt; -see <a href=3D"https://errors.yoctoproject.org/Errors/Details/308000=
/" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">https://error=
s.yoctoproject.org/Errors/Details/308000/</a> for details<br>
&gt; -<br>
&gt; -Thanks Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" rel=3D"nor=
eferrer noreferrer" target=3D"_blank">raj.khem@gmail.com</a>&gt; for the re=
port<br>
&gt; -<br>
&gt; -Signed-off-by: Gianfranco Costamagna &lt;<a href=3D"mailto:costamagn=
agianfranco@yahoo.it" rel=3D"noreferrer noreferrer" target=3D"_blank">costa=
magnagianfranco@yahoo.it</a>&gt;<br>
&gt; -Signed-off-by: Gianfranco Costamagna &lt;<a href=3D"mailto:locutusof=
borg@debian.org" rel=3D"noreferrer noreferrer" target=3D"_blank">locutusofb=
org@debian.org</a>&gt;<br>
&gt; ----<br>
&gt; - include/dlt/dlt_user.h | 1 +<br>
&gt; - 1 file changed, 1 insertion(+)<br>
&gt; -<br>
&gt; -diff --git a/include/dlt/dlt_user.h b/include/dlt/dlt_user.h<br>
&gt; -index 69cb854..766d349 100644<br>
&gt; ---- a/include/dlt/dlt_user.h<br>
&gt; -+++ b/include/dlt/dlt_user.h<br>
&gt; -@@ -74,6 +74,7 @@<br>
&gt; -=C2=A0 \{<br>
&gt; -=C2=A0 */<br>
&gt; - #=C2=A0 =C2=A0include &lt;mqueue.h&gt;<br>
&gt; -+#=C2=A0 =C2=A0include &lt;pthread.h&gt;<br>
&gt; -<br>
&gt; - #=C2=A0 =C2=A0if !defined (__WIN32__)<br>
&gt; - #=C2=A0 =C2=A0 =C2=A0 include &lt;semaphore.h&gt;<br>
&gt; -<br>
&gt; -From 5f67aba02c12b7446e63ccc86285c13bc5c7a432 Mon Sep 17 00:00:00 20=
01<br>
&gt; -From: Gianfranco Costamagna &lt;<a href=3D"mailto:costamagnagianfran=
co@yahoo.it" rel=3D"noreferrer noreferrer" target=3D"_blank">costamagnagian=
franco@yahoo.it</a>&gt;<br>
&gt; -Date: Sat, 25 Jan 2020 09:16:14 +0100<br>
&gt; -Subject: [PATCH 2/3] dlt-test-init-free: fix build failure with stri=
ct<br>
&gt; - compiler flags, due to uint being undefined. This is actually an &q=
uot;int&quot; type,<br>
&gt; - looking at the test implementation<br>
&gt; -<br>
&gt; -Signed-off-by: Gianfranco Costamagna &lt;<a href=3D"mailto:costamagn=
agianfranco@yahoo.it" rel=3D"noreferrer noreferrer" target=3D"_blank">costa=
magnagianfranco@yahoo.it</a>&gt;<br>
&gt; -Signed-off-by: Gianfranco Costamagna &lt;<a href=3D"mailto:locutusof=
borg@debian.org" rel=3D"noreferrer noreferrer" target=3D"_blank">locutusofb=
org@debian.org</a>&gt;<br>
&gt; ----<br>
&gt; - src/tests/dlt-test-init-free.c | 4 ++--<br>
&gt; - 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt; -<br>
&gt; -diff --git a/src/tests/dlt-test-init-free.c b/src/tests/dlt-test-ini=
t-free.c<br>
&gt; -index 96b5245..35b8803 100644<br>
&gt; ---- a/src/tests/dlt-test-init-free.c<br>
&gt; -+++ b/src/tests/dlt-test-init-free.c<br>
&gt; -@@ -32,7 +32,7 @@<br>
&gt; -<br>
&gt; - void exec(const char *cmd, char *buffer, size_t length);<br>
&gt; - void printMemoryUsage();<br>
&gt; --char *occupyMemory(uint size);<br>
&gt; -+char *occupyMemory(int size);<br>
&gt; - void do_example_test();<br>
&gt; - void do_dlt_test();<br>
&gt; -<br>
&gt; -@@ -131,7 +131,7 @@ void printMemoryUsage()<br>
&gt; -=C2=A0 =C2=A0 =C2=A0printf(&quot;%s&quot;, result);<br>
&gt; - }<br>
&gt; -<br>
&gt; --char *occupyMemory(uint size)<br>
&gt; -+char *occupyMemory(int size)<br>
&gt; - {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0char *buf =3D (char *)malloc(size * sizeof(char)=
);<br>
&gt; -<br>
&gt; -<br>
&gt; -From c790d61fad382e5d3e648ee99904087eb9bc4a77 Mon Sep 17 00:00:00 20=
01<br>
&gt; -From: Gianfranco Costamagna &lt;<a href=3D"mailto:costamagnagianfran=
co@yahoo.it" rel=3D"noreferrer noreferrer" target=3D"_blank">costamagnagian=
franco@yahoo.it</a>&gt;<br>
&gt; -Date: Sat, 25 Jan 2020 09:20:48 +0100<br>
&gt; -Subject: [PATCH 3/3] sys/poll.h: deprecate old sys/poll.h include he=
ader, now<br>
&gt; - glibc/musl wants poll.h being included directly. This fixes a build=
 failure<br>
&gt; - on musl systems with strict c hardening flags<br>
&gt; -<br>
&gt; -Signed-off-by: Gianfranco Costamagna &lt;<a href=3D"mailto:costamagn=
agianfranco@yahoo.it" rel=3D"noreferrer noreferrer" target=3D"_blank">costa=
magnagianfranco@yahoo.it</a>&gt;<br>
&gt; -Signed-off-by: Gianfranco Costamagna &lt;<a href=3D"mailto:locutusof=
borg@debian.org" rel=3D"noreferrer noreferrer" target=3D"_blank">locutusofb=
org@debian.org</a>&gt;<br>
&gt; ----<br>
&gt; - src/console/logstorage/dlt-logstorage-ctrl.c | 2 +-<br>
&gt; - src/daemon/dlt_daemon_event_handler.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 | =
2 +-<br>
&gt; - src/daemon/dlt_daemon_event_handler.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 | =
2 +-<br>
&gt; - src/daemon/dlt_daemon_event_handler_types.h=C2=A0 | 2 +-<br>
&gt; - src/lib/dlt_user.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt; - 5 files changed, 5 insertions(+), 5 deletions(-)<br>
&gt; -<br>
&gt; -diff --git a/src/console/logstorage/dlt-logstorage-ctrl.c b/src/cons=
ole/logstorage/dlt-logstorage-ctrl.c<br>
&gt; -index 525c137..6614f44 100644<br>
&gt; ---- a/src/console/logstorage/dlt-logstorage-ctrl.c<br>
&gt; -+++ b/src/console/logstorage/dlt-logstorage-ctrl.c<br>
&gt; -@@ -61,7 +61,7 @@<br>
&gt; - #include &lt;string.h&gt;<br>
&gt; - #include &lt;getopt.h&gt;<br>
&gt; -<br>
&gt; --#include &lt;sys/poll.h&gt;<br>
&gt; -+#include &lt;poll.h&gt;<br>
&gt; -<br>
&gt; - #if defined(__linux__)<br>
&gt; - #=C2=A0 =C2=A0include &quot;sd-daemon.h&quot;<br>
&gt; -diff --git a/src/daemon/dlt_daemon_event_handler.c b/src/daemon/dlt_=
daemon_event_handler.c<br>
&gt; -index 1611f7b..0d463da 100644<br>
&gt; ---- a/src/daemon/dlt_daemon_event_handler.c<br>
&gt; -+++ b/src/daemon/dlt_daemon_event_handler.c<br>
&gt; -@@ -30,7 +30,7 @@<br>
&gt; - #include &lt;string.h&gt;<br>
&gt; - #include &lt;errno.h&gt;<br>
&gt; -<br>
&gt; --#include &lt;sys/poll.h&gt;<br>
&gt; -+#include &lt;poll.h&gt;<br>
&gt; - #include &lt;syslog.h&gt;<br>
&gt; -<br>
&gt; - #include &quot;dlt_common.h&quot;<br>
&gt; -diff --git a/src/daemon/dlt_daemon_event_handler.h b/src/daemon/dlt_=
daemon_event_handler.h<br>
&gt; -index eb96101..bd550d3 100644<br>
&gt; ---- a/src/daemon/dlt_daemon_event_handler.h<br>
&gt; -+++ b/src/daemon/dlt_daemon_event_handler.h<br>
&gt; -@@ -25,7 +25,7 @@<br>
&gt; -=C2=A0 * \file dlt_daemon_event_handler.h<br>
&gt; -=C2=A0 */<br>
&gt; -<br>
&gt; --#include &lt;sys/poll.h&gt;<br>
&gt; -+#include &lt;poll.h&gt;<br>
&gt; -<br>
&gt; - #include &quot;dlt_daemon_connection_types.h&quot;<br>
&gt; - #include &quot;dlt_daemon_event_handler_types.h&quot;<br>
&gt; -diff --git a/src/daemon/dlt_daemon_event_handler_types.h b/src/daemo=
n/dlt_daemon_event_handler_types.h<br>
&gt; -index 370e503..0b16d08 100644<br>
&gt; ---- a/src/daemon/dlt_daemon_event_handler_types.h<br>
&gt; -+++ b/src/daemon/dlt_daemon_event_handler_types.h<br>
&gt; -@@ -25,7 +25,7 @@<br>
&gt; -=C2=A0 * \file dlt_daemon_event_handler_types.h<br>
&gt; -=C2=A0 */<br>
&gt; -<br>
&gt; --#include &lt;sys/poll.h&gt;<br>
&gt; -+#include &lt;poll.h&gt;<br>
&gt; -<br>
&gt; - #include &quot;dlt_daemon_connection_types.h&quot;<br>
&gt; -<br>
&gt; -#diff --git a/src/lib/dlt_user.c b/src/lib/dlt_user.c<br>
&gt; -#index ffa9b09..511f991 100644<br>
&gt; -#--- a/src/lib/dlt_user.c<br>
&gt; -#+++ b/src/lib/dlt_user.c<br>
&gt; -#@@ -43,7 +43,7 @@<br>
&gt; -# #include &lt;errno.h&gt;<br>
&gt; -#<br>
&gt; -# #include &lt;sys/uio.h&gt; /* writev() */<br>
&gt; -#-#include &lt;sys/poll.h&gt;<br>
&gt; -#+#include &lt;poll.h&gt;<br>
&gt; -#<br>
&gt; -# #include &lt;limits.h&gt;<br>
&gt; -# #ifdef linux<br>
&gt; diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/238.patch=
 b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/238.patch<br>
&gt; new file mode 100644<br>
&gt; index 000000000..14c44e6ed<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/238.patch<br>
&gt; @@ -0,0 +1,35 @@<br>
&gt; +From 214f8c71552fc096077f0b916dad75b31eefea3d Mon Sep 17 00:00:00 20=
01<br>
&gt; +From: Gianfranco Costamagna &lt;<a href=3D"mailto:costamagnagianfran=
co@yahoo.it" rel=3D"noreferrer noreferrer" target=3D"_blank">costamagnagian=
franco@yahoo.it</a>&gt;<br>
&gt; +Date: Fri, 31 Jul 2020 15:26:35 +0200<br>
&gt; +Subject: [PATCH] dlt_offline: fix build failures with gcc-10<br>
&gt; +<br>
&gt; +see bug report: <a href=3D"https://bugs.debian.org/cgi-bin/bugreport=
.cgi?bug=3D957140" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blan=
k">https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D957140</a><br>
&gt; +<br>
&gt; +/usr/bin/ld: CMakeFiles/dlt-daemon.dir/dlt_daemon_client.c.o:./obj-x=
86_64-linux-gnu/src/daemon/./src/offlinelogstorage/dlt_offline_logstorage.h=
:116: multiple definition of `g_logstorage_cache_max&#39;; CMakeFiles/dlt-d=
aemon.dir/dlt-daemon.c.o:./obj-x86_64-linux-gnu/src/daemon/./src/offlinelog=
storage/dlt_offline_logstorage.h:116: first defined here<br>
&gt; +/usr/bin/ld: CMakeFiles/dlt-daemon.dir/dlt_daemon_common.c.o:./obj-x=
86_64-linux-gnu/src/daemon/./src/offlinelogstorage/dlt_offline_logstorage.h=
:118: multiple definition of `g_logstorage_cache_size&#39;; CMakeFiles/dlt-=
daemon.dir/dlt-daemon.c.o:./obj-x86_64-linux-gnu/src/daemon/./src/offlinelo=
gstorage/dlt_offline_logstorage.h:118: first defined here<br>
&gt; +/usr/bin/ld: CMakeFiles/dlt-daemon.dir/dlt_daemon_common.c.o:./obj-x=
86_64-linux-gnu/src/daemon/./src/offlinelogstorage/dlt_offline_logstorage.h=
:116: multiple definition of `g_logstorage_cache_max&#39;; CMakeFiles/dlt-d=
aemon.dir/dlt-daemon.c.o:./obj-x86_64-linux-gnu/src/daemon/./src/offlinelog=
storage/dlt_offline_logstorage.h:116: first defined here<br>
&gt; +/usr/bin/ld: CMakeFiles/dlt-daemon.dir/dlt_daemon_connection.c.o:./o=
bj-x86_64-linux-gnu/src/daemon/./src/offlinelogstorage/dlt_offline_logstora=
ge.h:118: multiple definition of `g_logstorage_cache_size&#39;; CMakeFiles/=
dlt-daemon.dir/dlt-daemon.c.o:./obj-x86_64-linux-gnu/src/daemon/./src/offli=
nelogstorage/dlt_offline_logstorage.h:118: first defined here<br>
&gt; +/usr/bin/ld: CMakeFiles/dlt-daemon.dir/dlt_daemon_connection.c.o:./o=
bj-x86_64-linux-gnu/src/daemon/./src/offlinelogstorage/dlt_offline_logstora=
ge.h:116: multiple definition of `g_logstorage_cache_max&#39;; CMakeFiles/d=
lt-daemon.dir/dlt-daemon.c.o:./obj-x86_64-linux-gnu/src/daemon/./src/offlin=
elogstorage/dlt_offline_logstorage.h:116: first defined here<br>
&gt; +/usr/bin/ld: CMakeFiles/dlt-daemon.dir/dlt_daemon_event_handler.c.o:=
./obj-x86_64-linux-gnu/src/daemon/./src/offlinelogstorage/dlt_offline_logst=
orage.h:118: multiple definition of `g_logstorage_cache_size&#39;; CMakeFil=
es/dlt-daemon.dir/dlt-daemon.c.o:./obj-x86_64-linux-gnu/src/daemon/./src/of=
flinelogstorage/dlt_offline_logstorage.h:118: first defined here<br>
&gt; +/usr/bin/ld: CMakeFiles/dlt-daemon.dir/dlt_daemon_event_handler.c.o:=
./obj-x86_64-linux-gnu/src/daemon/./src/offlinelogstorage/dlt_offline_logst=
orage.h:116: multiple definition of `g_logstorage_cache_max&#39;; CMakeFile=
s/dlt-daemon.dir/dlt-daemon.c.o:./obj-x86_64-linux-gnu/src/daemon/./src/off=
linelogstorage/dlt_offline_logstorage.h:116: first defined here<br>
&gt; +/usr/bin/ld: CMakeFiles/dlt-daemon.dir/dlt_daemon_offline_logstorage=
.c.o:./obj-x86_64-linux-gnu/src/daemon/./src/offlinelogstorage/dlt_offline_=
logstorage.h:116: multiple definition of `g_logstorage_cache_max&#39;; CMak=
eFiles/dlt-daemon.dir/dlt-daemon.c.o:./obj-x86_64-linux-gnu/src/daemon/./sr=
c/offlinelogstorage/dlt_offline_logstorage.h:116: first defined here<br>
&gt; +---<br>
&gt; + src/offlinelogstorage/dlt_offline_logstorage.h | 4 ++--<br>
&gt; + 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/src/offlinelogstorage/dlt_offline_logstorage.h b/src/of=
flinelogstorage/dlt_offline_logstorage.h<br>
&gt; +index b58da70..8ad84b8 100644<br>
&gt; +--- a/src/offlinelogstorage/dlt_offline_logstorage.h<br>
&gt; ++++ b/src/offlinelogstorage/dlt_offline_logstorage.h<br>
&gt; +@@ -114,9 +114,9 @@<br>
&gt; + #define DLT_OFFLINE_LOGSTORAGE_IS_STRATEGY_SET(S, s) ((S)&amp;(s))<=
br>
&gt; +<br>
&gt; + /* logstorage max cache */<br>
&gt; +-unsigned int g_logstorage_cache_max;<br>
&gt; ++static unsigned int g_logstorage_cache_max;<br>
&gt; + /* current logstorage cache size */<br>
&gt; +-unsigned int g_logstorage_cache_size;<br>
&gt; ++static unsigned int g_logstorage_cache_size;<br>
&gt; +<br>
&gt; + typedef struct<br>
&gt; + {<br>
&gt; diff --git a/meta-oe/recipes-extended/dlt-daemon/<a href=3D"http://dl=
t-daemon_2.18.4.bb" rel=3D"noreferrer noreferrer noreferrer" target=3D"_bla=
nk">dlt-daemon_2.18.4.bb</a> b/meta-oe/recipes-extended/dlt-daemon/<a href=
=3D"http://dlt-daemon_2.18.5.bb" rel=3D"noreferrer noreferrer noreferrer" =
target=3D"_blank">dlt-daemon_2.18.5.bb</a><br>
&gt; similarity index 97%<br>
&gt; rename from meta-oe/recipes-extended/dlt-daemon/<a href=3D"http://dlt=
-daemon_2.18.4.bb" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blan=
k">dlt-daemon_2.18.4.bb</a><br>
&gt; rename to meta-oe/recipes-extended/dlt-daemon/<a href=3D"http://dlt-d=
aemon_2.18.5.bb" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank"=
>dlt-daemon_2.18.5.bb</a><br>
&gt; index 35c638bc7..3f5089672 100644<br>
&gt; --- a/meta-oe/recipes-extended/dlt-daemon/<a href=3D"http://dlt-daemo=
n_2.18.4.bb" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">dlt=
-daemon_2.18.4.bb</a><br>
&gt; +++ b/meta-oe/recipes-extended/dlt-daemon/<a href=3D"http://dlt-daemo=
n_2.18.5.bb" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">dlt=
-daemon_2.18.5.bb</a><br>
&gt; @@ -17,9 +17,9 @@ DEPENDS =3D &quot;zlib gzip-native&quot;<br>
&gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://github.com/GENIVI/$%7=
BBPN%7D.git;protocol=3Dhttps" rel=3D"noreferrer noreferrer noreferrer" targ=
et=3D"_blank">github.com/GENIVI/${BPN}.git;protocol=3Dhttps</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 file://0002-Don-t-execute-processes-as-a-specific=
-user.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 file://0004-Modify-systemd-config-directory.patch=
 \<br>
&gt; -=C2=A0 =C2=A0 file://204.patch \<br>
&gt; +=C2=A0 =C2=A0 file://238.patch \<br>
&gt;=C2=A0 &quot;<br>
&gt; -SRCREV =3D &quot;14ea971be7e808b9c5099c7f404ed3cf341873c4&quot;<br>
&gt; +SRCREV =3D &quot;f1ac087c766827b1d0ed9c3a814b3cc052e948f2&quot;<br>
&gt;<br>
&gt;=C2=A0 S =3D &quot;${WORKDIR}/git&quot;<br>
&gt;<br>
&gt; --<br>
&gt; 2.17.1<br>
&gt;<br>
&gt; <br>
</blockquote></div>
</blockquote></div></div>
</blockquote></div>

--00000000000081460a05abf49cfb--
