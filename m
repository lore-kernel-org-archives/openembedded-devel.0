Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
 by mx.groups.io with SMTP id smtpd.web11.2191.1596580775021663547
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Aug 2020 15:39:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=oO8Yq/GQ;
 spf=pass (domain: gmail.com, ip: 209.85.222.193, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f193.google.com with SMTP id h7so39988192qkk.7
        for <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2020 15:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=YwrBV9ZVXM2NF+7jmU5jFRT8NfR//Ty/7ZJSYIvidWk=;
        b=oO8Yq/GQCEubSUtgey0iTaX9nxlEEAK9fTrVV42sWMZ9iyNRlXg8IUzrV9LbRF89j4
         uvlwwEYbc0Npn6qNBTFAHoRWudl49iD7y9zKAUeDwUATsnygS2mjWBmYVGBMTGiQilbE
         PLjrPchpwkjDKHIJGqdbkGDu9BzjUf2WCwOXLFMUbfvAzY4R+oyNUvs+fTHp+9It+Fsy
         bjlA0ZkKTvrO0Nq5nnzOk0tWnH38X8KdYb9IJ1S925qsodtilwQGWND/MXqS1FgmZHnp
         KchhHIdP0sol27xR528Fb8l2wbZzy9iZPUqVF+k/tWSIImfPR3H4fr2u14tzlATPkx1l
         VEKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=YwrBV9ZVXM2NF+7jmU5jFRT8NfR//Ty/7ZJSYIvidWk=;
        b=uV7aSxdgw67kS8S+9K/zHHnZjE7HPxtgE0uDes+tZBxQD/gA3qddbQPKXkFlqrjDxV
         ps+cybBeSPT6SFlnVhhqQ0wxKf2D/Ueb76IRpk4x1tK/8QaGtbDc16W+PSORN07Svuye
         NkPCQ8Y4UhIqnizKm9kbUHwrP9NE8wUBE9zoZrAILP/KaS4RTa0SI7J0vePcHx/MRWfE
         CNUoAkKP68Gt8l3zQfZWRb3NxOqb+2ttAfTvrC2jsFCunwu/SNDj1+eoWzsQfbaTVuVr
         VCuy12xRwkOV+1SzBxWDW4dbQC86ENC0tUznDuMva0XwipFZKvNXAPbT1BSel35xLkDk
         PwFA==
X-Gm-Message-State: AOAM532nyM513UKnqOtrjOr5i8E74jHhbpJ6du1D8ffNff5D5NgklqWL
	39xV4VKamVYhbmvkPuUNzXVpmUxovs2BuvC7YRs=
X-Google-Smtp-Source: ABdhPJyaEjnOFL57g3N7KZXulIxfklZFO/z0cYuI0GTHZAs2IY94xopDfQzAOCc2R6dgHMSGLN7FRwxEy56SCcqdhCg=
X-Received: by 2002:a37:9d0d:: with SMTP id g13mr494735qke.165.1596580773929;
 Tue, 04 Aug 2020 15:39:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200731144302.7074-1-costamagnagianfranco@yahoo.it>
 <CAMKF1sozJDAOJFMOPGP8_yEB0z5RHsTqh_bEqYdcAWnB=5fkCw@mail.gmail.com>
 <CAATN8PUJAjGiEL8SKKBTi58xrrDMGHagkEXs+Au509eHk76dWA@mail.gmail.com>
 <CAMKF1sqJb+QEqrbXyDNM_JDPwKMe7eCuiFX+35N-QfpKpffkgA@mail.gmail.com> <CAATN8PXgcM6sW6CmkMQnRvABTLewR_DFVuoyiSsmtPPfsg4Q0A@mail.gmail.com>
In-Reply-To: <CAATN8PXgcM6sW6CmkMQnRvABTLewR_DFVuoyiSsmtPPfsg4Q0A@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 4 Aug 2020 15:39:08 -0700
Message-ID: <CAMKF1srnn92KxMLtv4AHu5dELSEEqapYMib2+VHWhDim2vfkyA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/4] dlt-daemon: update to 2.18.5
To: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>, 
	Gianfranco Costamagna <locutusofborg@debian.org>, 
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

btw. there is also a build error with musl
http://errors.yoctoproject.org/Errors/Details/428487/

you can reproduce it with TCLIBC=3Dmusl MACHINE=3Dqemuarm bitbake dlt-daem=
on

On Mon, Aug 3, 2020 at 1:06 AM Gianfranco Costamagna
<costamagna.gianfranco@gmail.com> wrote:
>
> Reproduced with systemd enabled.
> Will craft a patch and resubmit next week also upstream
>
> G.
>
> On Mon, Aug 3, 2020, 04:00 Khem Raj <raj.khem@gmail.com> wrote:
>>
>>
>>
>> On Sun, Aug 2, 2020 at 3:05 PM Gianfranco Costamagna <costamagna.gianfr=
anco@gmail.com> wrote:
>>>
>>> Hello
>>>
>>> I tried to reproduce by running everything on master (master-next for =
meta-oe) and bitbake dlt-daemon with MACHINE set to raspberrypi4 or qemux86=
 and DISTRO=3Dpoky-tiny.
>>> I also tried with and without systemd.
>>>
>>> It builds just fine.
>>> Do you have a way to share bblayers.conf and local.conf files please?
>>
>>
>> It=E2=80=99s perhaps revealed with glibc upgrade patch that I have stag=
ed in yoe/mut branch on yoe distro I will look a bit as well
>>
>>>
>>> Thanks
>>>
>>> Gianfranco
>>>
>>> On Sun, Aug 2, 2020, 09:01 Khem Raj <raj.khem@gmail.com> wrote:
>>>>
>>>> This fails on musl
>>>>
>>>> http://errors.yoctoproject.org/Errors/Details/427081/
>>>>
>>>> On Fri, Jul 31, 2020 at 7:43 AM Gianfranco
>>>> <costamagna.gianfranco@gmail.com> wrote:
>>>> >
>>>> >  - drop patch 204: upstream
>>>> >  - add gcc-10 build fix proposed upstream 238.patch
>>>> >
>>>> > Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it=
>
>>>> > Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
>>>> > ---
>>>> >  .../dlt-daemon/dlt-daemon/204.patch           | 148 --------------=
----
>>>> >  .../dlt-daemon/dlt-daemon/238.patch           |  35 +++++
>>>> >  ...-daemon_2.18.4.bb =3D> dlt-daemon_2.18.5.bb} |   4 +-
>>>> >  3 files changed, 37 insertions(+), 150 deletions(-)
>>>> >  delete mode 100644 meta-oe/recipes-extended/dlt-daemon/dlt-daemon/=
204.patch
>>>> >  create mode 100644 meta-oe/recipes-extended/dlt-daemon/dlt-daemon/=
238.patch
>>>> >  rename meta-oe/recipes-extended/dlt-daemon/{dlt-daemon_2.18.4.bb =
=3D> dlt-daemon_2.18.5.bb} (97%)
>>>> >
>>>> > diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/204.pat=
ch b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/204.patch
>>>> > deleted file mode 100644
>>>> > index f0fc0bcb2..000000000
>>>> > --- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/204.patch
>>>> > +++ /dev/null
>>>> > @@ -1,148 +0,0 @@
>>>> > -Upstream-Status: Submitted [https://github.com/GENIVI/dlt-daemon/p=
ull/204]
>>>> > -From 92830aff6e91041f574753d78da758c62981d9a4 Mon Sep 17 00:00:00 =
2001
>>>> > -From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
>>>> > -Date: Sat, 25 Jan 2020 09:08:07 +0100
>>>> > -Subject: [PATCH 1/3] dlt_user.h: fix build when musl is the libc
>>>> > - implementation, by adding a missing include for pthread_t referen=
ce:
>>>> > -
>>>> > -see https://errors.yoctoproject.org/Errors/Details/308000/ for det=
ails
>>>> > -
>>>> > -Thanks Khem Raj <raj.khem@gmail.com> for the report
>>>> > -
>>>> > -Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.i=
t>
>>>> > -Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
>>>> > ----
>>>> > - include/dlt/dlt_user.h | 1 +
>>>> > - 1 file changed, 1 insertion(+)
>>>> > -
>>>> > -diff --git a/include/dlt/dlt_user.h b/include/dlt/dlt_user.h
>>>> > -index 69cb854..766d349 100644
>>>> > ---- a/include/dlt/dlt_user.h
>>>> > -+++ b/include/dlt/dlt_user.h
>>>> > -@@ -74,6 +74,7 @@
>>>> > -  \{
>>>> > -  */
>>>> > - #   include <mqueue.h>
>>>> > -+#   include <pthread.h>
>>>> > -
>>>> > - #   if !defined (__WIN32__)
>>>> > - #      include <semaphore.h>
>>>> > -
>>>> > -From 5f67aba02c12b7446e63ccc86285c13bc5c7a432 Mon Sep 17 00:00:00 =
2001
>>>> > -From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
>>>> > -Date: Sat, 25 Jan 2020 09:16:14 +0100
>>>> > -Subject: [PATCH 2/3] dlt-test-init-free: fix build failure with st=
rict
>>>> > - compiler flags, due to uint being undefined. This is actually an =
"int" type,
>>>> > - looking at the test implementation
>>>> > -
>>>> > -Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.i=
t>
>>>> > -Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
>>>> > ----
>>>> > - src/tests/dlt-test-init-free.c | 4 ++--
>>>> > - 1 file changed, 2 insertions(+), 2 deletions(-)
>>>> > -
>>>> > -diff --git a/src/tests/dlt-test-init-free.c b/src/tests/dlt-test-i=
nit-free.c
>>>> > -index 96b5245..35b8803 100644
>>>> > ---- a/src/tests/dlt-test-init-free.c
>>>> > -+++ b/src/tests/dlt-test-init-free.c
>>>> > -@@ -32,7 +32,7 @@
>>>> > -
>>>> > - void exec(const char *cmd, char *buffer, size_t length);
>>>> > - void printMemoryUsage();
>>>> > --char *occupyMemory(uint size);
>>>> > -+char *occupyMemory(int size);
>>>> > - void do_example_test();
>>>> > - void do_dlt_test();
>>>> > -
>>>> > -@@ -131,7 +131,7 @@ void printMemoryUsage()
>>>> > -     printf("%s", result);
>>>> > - }
>>>> > -
>>>> > --char *occupyMemory(uint size)
>>>> > -+char *occupyMemory(int size)
>>>> > - {
>>>> > -     char *buf =3D (char *)malloc(size * sizeof(char));
>>>> > -
>>>> > -
>>>> > -From c790d61fad382e5d3e648ee99904087eb9bc4a77 Mon Sep 17 00:00:00 =
2001
>>>> > -From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
>>>> > -Date: Sat, 25 Jan 2020 09:20:48 +0100
>>>> > -Subject: [PATCH 3/3] sys/poll.h: deprecate old sys/poll.h include =
header, now
>>>> > - glibc/musl wants poll.h being included directly. This fixes a bui=
ld failure
>>>> > - on musl systems with strict c hardening flags
>>>> > -
>>>> > -Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.i=
t>
>>>> > -Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
>>>> > ----
>>>> > - src/console/logstorage/dlt-logstorage-ctrl.c | 2 +-
>>>> > - src/daemon/dlt_daemon_event_handler.c        | 2 +-
>>>> > - src/daemon/dlt_daemon_event_handler.h        | 2 +-
>>>> > - src/daemon/dlt_daemon_event_handler_types.h  | 2 +-
>>>> > - src/lib/dlt_user.c                           | 2 +-
>>>> > - 5 files changed, 5 insertions(+), 5 deletions(-)
>>>> > -
>>>> > -diff --git a/src/console/logstorage/dlt-logstorage-ctrl.c b/src/co=
nsole/logstorage/dlt-logstorage-ctrl.c
>>>> > -index 525c137..6614f44 100644
>>>> > ---- a/src/console/logstorage/dlt-logstorage-ctrl.c
>>>> > -+++ b/src/console/logstorage/dlt-logstorage-ctrl.c
>>>> > -@@ -61,7 +61,7 @@
>>>> > - #include <string.h>
>>>> > - #include <getopt.h>
>>>> > -
>>>> > --#include <sys/poll.h>
>>>> > -+#include <poll.h>
>>>> > -
>>>> > - #if defined(__linux__)
>>>> > - #   include "sd-daemon.h"
>>>> > -diff --git a/src/daemon/dlt_daemon_event_handler.c b/src/daemon/dl=
t_daemon_event_handler.c
>>>> > -index 1611f7b..0d463da 100644
>>>> > ---- a/src/daemon/dlt_daemon_event_handler.c
>>>> > -+++ b/src/daemon/dlt_daemon_event_handler.c
>>>> > -@@ -30,7 +30,7 @@
>>>> > - #include <string.h>
>>>> > - #include <errno.h>
>>>> > -
>>>> > --#include <sys/poll.h>
>>>> > -+#include <poll.h>
>>>> > - #include <syslog.h>
>>>> > -
>>>> > - #include "dlt_common.h"
>>>> > -diff --git a/src/daemon/dlt_daemon_event_handler.h b/src/daemon/dl=
t_daemon_event_handler.h
>>>> > -index eb96101..bd550d3 100644
>>>> > ---- a/src/daemon/dlt_daemon_event_handler.h
>>>> > -+++ b/src/daemon/dlt_daemon_event_handler.h
>>>> > -@@ -25,7 +25,7 @@
>>>> > -  * \file dlt_daemon_event_handler.h
>>>> > -  */
>>>> > -
>>>> > --#include <sys/poll.h>
>>>> > -+#include <poll.h>
>>>> > -
>>>> > - #include "dlt_daemon_connection_types.h"
>>>> > - #include "dlt_daemon_event_handler_types.h"
>>>> > -diff --git a/src/daemon/dlt_daemon_event_handler_types.h b/src/dae=
mon/dlt_daemon_event_handler_types.h
>>>> > -index 370e503..0b16d08 100644
>>>> > ---- a/src/daemon/dlt_daemon_event_handler_types.h
>>>> > -+++ b/src/daemon/dlt_daemon_event_handler_types.h
>>>> > -@@ -25,7 +25,7 @@
>>>> > -  * \file dlt_daemon_event_handler_types.h
>>>> > -  */
>>>> > -
>>>> > --#include <sys/poll.h>
>>>> > -+#include <poll.h>
>>>> > -
>>>> > - #include "dlt_daemon_connection_types.h"
>>>> > -
>>>> > -#diff --git a/src/lib/dlt_user.c b/src/lib/dlt_user.c
>>>> > -#index ffa9b09..511f991 100644
>>>> > -#--- a/src/lib/dlt_user.c
>>>> > -#+++ b/src/lib/dlt_user.c
>>>> > -#@@ -43,7 +43,7 @@
>>>> > -# #include <errno.h>
>>>> > -#
>>>> > -# #include <sys/uio.h> /* writev() */
>>>> > -#-#include <sys/poll.h>
>>>> > -#+#include <poll.h>
>>>> > -#
>>>> > -# #include <limits.h>
>>>> > -# #ifdef linux
>>>> > diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/238.pat=
ch b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/238.patch
>>>> > new file mode 100644
>>>> > index 000000000..14c44e6ed
>>>> > --- /dev/null
>>>> > +++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/238.patch
>>>> > @@ -0,0 +1,35 @@
>>>> > +From 214f8c71552fc096077f0b916dad75b31eefea3d Mon Sep 17 00:00:00 =
2001
>>>> > +From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
>>>> > +Date: Fri, 31 Jul 2020 15:26:35 +0200
>>>> > +Subject: [PATCH] dlt_offline: fix build failures with gcc-10
>>>> > +
>>>> > +see bug report: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=
=3D957140
>>>> > +
>>>> > +/usr/bin/ld: CMakeFiles/dlt-daemon.dir/dlt_daemon_client.c.o:./obj=
-x86_64-linux-gnu/src/daemon/./src/offlinelogstorage/dlt_offline_logstorage=
.h:116: multiple definition of `g_logstorage_cache_max'; CMakeFiles/dlt-dae=
mon.dir/dlt-daemon.c.o:./obj-x86_64-linux-gnu/src/daemon/./src/offlinelogst=
orage/dlt_offline_logstorage.h:116: first defined here
>>>> > +/usr/bin/ld: CMakeFiles/dlt-daemon.dir/dlt_daemon_common.c.o:./obj=
-x86_64-linux-gnu/src/daemon/./src/offlinelogstorage/dlt_offline_logstorage=
.h:118: multiple definition of `g_logstorage_cache_size'; CMakeFiles/dlt-da=
emon.dir/dlt-daemon.c.o:./obj-x86_64-linux-gnu/src/daemon/./src/offlinelogs=
torage/dlt_offline_logstorage.h:118: first defined here
>>>> > +/usr/bin/ld: CMakeFiles/dlt-daemon.dir/dlt_daemon_common.c.o:./obj=
-x86_64-linux-gnu/src/daemon/./src/offlinelogstorage/dlt_offline_logstorage=
.h:116: multiple definition of `g_logstorage_cache_max'; CMakeFiles/dlt-dae=
mon.dir/dlt-daemon.c.o:./obj-x86_64-linux-gnu/src/daemon/./src/offlinelogst=
orage/dlt_offline_logstorage.h:116: first defined here
>>>> > +/usr/bin/ld: CMakeFiles/dlt-daemon.dir/dlt_daemon_connection.c.o:.=
/obj-x86_64-linux-gnu/src/daemon/./src/offlinelogstorage/dlt_offline_logsto=
rage.h:118: multiple definition of `g_logstorage_cache_size'; CMakeFiles/dl=
t-daemon.dir/dlt-daemon.c.o:./obj-x86_64-linux-gnu/src/daemon/./src/offline=
logstorage/dlt_offline_logstorage.h:118: first defined here
>>>> > +/usr/bin/ld: CMakeFiles/dlt-daemon.dir/dlt_daemon_connection.c.o:.=
/obj-x86_64-linux-gnu/src/daemon/./src/offlinelogstorage/dlt_offline_logsto=
rage.h:116: multiple definition of `g_logstorage_cache_max'; CMakeFiles/dlt=
-daemon.dir/dlt-daemon.c.o:./obj-x86_64-linux-gnu/src/daemon/./src/offlinel=
ogstorage/dlt_offline_logstorage.h:116: first defined here
>>>> > +/usr/bin/ld: CMakeFiles/dlt-daemon.dir/dlt_daemon_event_handler.c.=
o:./obj-x86_64-linux-gnu/src/daemon/./src/offlinelogstorage/dlt_offline_log=
storage.h:118: multiple definition of `g_logstorage_cache_size'; CMakeFiles=
/dlt-daemon.dir/dlt-daemon.c.o:./obj-x86_64-linux-gnu/src/daemon/./src/offl=
inelogstorage/dlt_offline_logstorage.h:118: first defined here
>>>> > +/usr/bin/ld: CMakeFiles/dlt-daemon.dir/dlt_daemon_event_handler.c.=
o:./obj-x86_64-linux-gnu/src/daemon/./src/offlinelogstorage/dlt_offline_log=
storage.h:116: multiple definition of `g_logstorage_cache_max'; CMakeFiles/=
dlt-daemon.dir/dlt-daemon.c.o:./obj-x86_64-linux-gnu/src/daemon/./src/offli=
nelogstorage/dlt_offline_logstorage.h:116: first defined here
>>>> > +/usr/bin/ld: CMakeFiles/dlt-daemon.dir/dlt_daemon_offline_logstora=
ge.c.o:./obj-x86_64-linux-gnu/src/daemon/./src/offlinelogstorage/dlt_offlin=
e_logstorage.h:116: multiple definition of `g_logstorage_cache_max'; CMakeF=
iles/dlt-daemon.dir/dlt-daemon.c.o:./obj-x86_64-linux-gnu/src/daemon/./src/=
offlinelogstorage/dlt_offline_logstorage.h:116: first defined here
>>>> > +---
>>>> > + src/offlinelogstorage/dlt_offline_logstorage.h | 4 ++--
>>>> > + 1 file changed, 2 insertions(+), 2 deletions(-)
>>>> > +
>>>> > +diff --git a/src/offlinelogstorage/dlt_offline_logstorage.h b/src/=
offlinelogstorage/dlt_offline_logstorage.h
>>>> > +index b58da70..8ad84b8 100644
>>>> > +--- a/src/offlinelogstorage/dlt_offline_logstorage.h
>>>> > ++++ b/src/offlinelogstorage/dlt_offline_logstorage.h
>>>> > +@@ -114,9 +114,9 @@
>>>> > + #define DLT_OFFLINE_LOGSTORAGE_IS_STRATEGY_SET(S, s) ((S)&(s))
>>>> > +
>>>> > + /* logstorage max cache */
>>>> > +-unsigned int g_logstorage_cache_max;
>>>> > ++static unsigned int g_logstorage_cache_max;
>>>> > + /* current logstorage cache size */
>>>> > +-unsigned int g_logstorage_cache_size;
>>>> > ++static unsigned int g_logstorage_cache_size;
>>>> > +
>>>> > + typedef struct
>>>> > + {
>>>> > diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.4.=
bb b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.5.bb
>>>> > similarity index 97%
>>>> > rename from meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.4.b=
b
>>>> > rename to meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.5.bb
>>>> > index 35c638bc7..3f5089672 100644
>>>> > --- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.4.bb
>>>> > +++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.5.bb
>>>> > @@ -17,9 +17,9 @@ DEPENDS =3D "zlib gzip-native"
>>>> >  SRC_URI =3D "git://github.com/GENIVI/${BPN}.git;protocol=3Dhttps \
>>>> >      file://0002-Don-t-execute-processes-as-a-specific-user.patch \
>>>> >      file://0004-Modify-systemd-config-directory.patch \
>>>> > -    file://204.patch \
>>>> > +    file://238.patch \
>>>> >  "
>>>> > -SRCREV =3D "14ea971be7e808b9c5099c7f404ed3cf341873c4"
>>>> > +SRCREV =3D "f1ac087c766827b1d0ed9c3a814b3cc052e948f2"
>>>> >
>>>> >  S =3D "${WORKDIR}/git"
>>>> >
>>>> > --
>>>> > 2.17.1
>>>> >
>>>> >=20
