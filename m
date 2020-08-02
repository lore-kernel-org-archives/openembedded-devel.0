Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.18650.1596405943404329951
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 02 Aug 2020 15:05:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VDKmJTmO;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id l2so21905357wrc.7
        for <openembedded-devel@lists.openembedded.org>; Sun, 02 Aug 2020 15:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YJrwDsAqP42Jboir1uipg11sbq0ufI4iAx6cLWw85mY=;
        b=VDKmJTmOqauDuEDcRNzir5SeOV39WKc52eZCHA1fz18GSO5k1Itms76VSChsyzXNzm
         1AbGJn0eA41JE0QbAQXoHnTOb+k+5meLztFLzOhSUFqU/fNFqbPqleCzs9ZDE6QlHD+L
         AQf77ItqoaY51RR2jcjZYjodOAo1M+iZGgaXa+6kl97/nHMpO3QsrgX5xigAAIH1pjjb
         wPzUGV/R8PJ1Iwf3pPm8wOKZ/TxITTThjSWrS3afdjWwCJAmaSAqKk7AAfgkliqkBLF0
         KQelccNxCoM4uRPggQRGE1VfPk0A59UAY7XDaxj7FmTGQAalFxstCJ6Qq6qIuHqgLuD7
         Z6dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YJrwDsAqP42Jboir1uipg11sbq0ufI4iAx6cLWw85mY=;
        b=aVOUHjpS7EPCibY31pvkyZfEO8JvhPVZiG3g27KjRn6+Jj9+YlnAwSWvWlj8hjDG/t
         GAKsoC9X7HPxQgphIk/8SZwEtUt2FjEepfSAfKiiIlvm8Xy7AwOZDFYoQdUAFtRAU0lZ
         2l3UUhL/F45hFBl15hIr+iFm8REG3vFWhOV0HPmrdU1sx1wtSXapt+2gNv1iyVlnvZl7
         pZjUBrIsZQacnq7ZDi/y0sl4BVssZSfeEo9Brtkpan4reOG4mILzhNIT+NexDA+JSznL
         1qUlr3vIAjycRoJu/l28p/BdsZgdEJE2Kr4QEcSK4FWhGt1avuyScceApySOuuTEAA7e
         ZltA==
X-Gm-Message-State: AOAM531BxDmL0PocOFlBKEkNmql3puLu0NrWfBaJKVaYxYk81YJFxi4A
	MxeuNqwCwwn5SmkcCQjVbUBKbLhxbrvg3Pt8tHs=
X-Google-Smtp-Source: ABdhPJwgQayqy8Bo6i5rqTx/0qWLiS2DfWMebR+kwfH17vQcorGwiZW4Rcq1rnefL+E5Q0QwShhriIFMo14yErbDwj0=
X-Received: by 2002:a5d:484d:: with SMTP id n13mr12442933wrs.297.1596405941832;
 Sun, 02 Aug 2020 15:05:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200731144302.7074-1-costamagnagianfranco@yahoo.it> <CAMKF1sozJDAOJFMOPGP8_yEB0z5RHsTqh_bEqYdcAWnB=5fkCw@mail.gmail.com>
In-Reply-To: <CAMKF1sozJDAOJFMOPGP8_yEB0z5RHsTqh_bEqYdcAWnB=5fkCw@mail.gmail.com>
From: "Gianfranco" <costamagna.gianfranco@gmail.com>
Date: Mon, 3 Aug 2020 00:05:29 +0200
Message-ID: <CAATN8PUJAjGiEL8SKKBTi58xrrDMGHagkEXs+Au509eHk76dWA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/4] dlt-daemon: update to 2.18.5
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	Gianfranco Costamagna <costamagnagianfranco@yahoo.it>, 
	Gianfranco Costamagna <locutusofborg@debian.org>
Content-Type: multipart/alternative; boundary="00000000000014911205abec3981"

--00000000000014911205abec3981
Content-Type: text/plain; charset="UTF-8"

Hello

I tried to reproduce by running everything on master (master-next for
meta-oe) and bitbake dlt-daemon with MACHINE set to raspberrypi4 or qemux86
and DISTRO=poky-tiny.
I also tried with and without systemd.

It builds just fine.
Do you have a way to share bblayers.conf and local.conf files please?

Thanks

Gianfranco

On Sun, Aug 2, 2020, 09:01 Khem Raj <raj.khem@gmail.com> wrote:

> This fails on musl
>
> http://errors.yoctoproject.org/Errors/Details/427081/
>
> On Fri, Jul 31, 2020 at 7:43 AM Gianfranco
> <costamagna.gianfranco@gmail.com> wrote:
> >
> >  - drop patch 204: upstream
> >  - add gcc-10 build fix proposed upstream 238.patch
> >
> > Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
> > Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
> > ---
> >  .../dlt-daemon/dlt-daemon/204.patch           | 148 ------------------
> >  .../dlt-daemon/dlt-daemon/238.patch           |  35 +++++
> >  ...-daemon_2.18.4.bb => dlt-daemon_2.18.5.bb} |   4 +-
> >  3 files changed, 37 insertions(+), 150 deletions(-)
> >  delete mode 100644
> meta-oe/recipes-extended/dlt-daemon/dlt-daemon/204.patch
> >  create mode 100644
> meta-oe/recipes-extended/dlt-daemon/dlt-daemon/238.patch
> >  rename meta-oe/recipes-extended/dlt-daemon/{dlt-daemon_2.18.4.bb =>
> dlt-daemon_2.18.5.bb} (97%)
> >
> > diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/204.patch
> b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/204.patch
> > deleted file mode 100644
> > index f0fc0bcb2..000000000
> > --- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/204.patch
> > +++ /dev/null
> > @@ -1,148 +0,0 @@
> > -Upstream-Status: Submitted [
> https://github.com/GENIVI/dlt-daemon/pull/204]
> > -From 92830aff6e91041f574753d78da758c62981d9a4 Mon Sep 17 00:00:00 2001
> > -From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
> > -Date: Sat, 25 Jan 2020 09:08:07 +0100
> > -Subject: [PATCH 1/3] dlt_user.h: fix build when musl is the libc
> > - implementation, by adding a missing include for pthread_t reference:
> > -
> > -see https://errors.yoctoproject.org/Errors/Details/308000/ for details
> > -
> > -Thanks Khem Raj <raj.khem@gmail.com> for the report
> > -
> > -Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
> > -Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
> > ----
> > - include/dlt/dlt_user.h | 1 +
> > - 1 file changed, 1 insertion(+)
> > -
> > -diff --git a/include/dlt/dlt_user.h b/include/dlt/dlt_user.h
> > -index 69cb854..766d349 100644
> > ---- a/include/dlt/dlt_user.h
> > -+++ b/include/dlt/dlt_user.h
> > -@@ -74,6 +74,7 @@
> > -  \{
> > -  */
> > - #   include <mqueue.h>
> > -+#   include <pthread.h>
> > -
> > - #   if !defined (__WIN32__)
> > - #      include <semaphore.h>
> > -
> > -From 5f67aba02c12b7446e63ccc86285c13bc5c7a432 Mon Sep 17 00:00:00 2001
> > -From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
> > -Date: Sat, 25 Jan 2020 09:16:14 +0100
> > -Subject: [PATCH 2/3] dlt-test-init-free: fix build failure with strict
> > - compiler flags, due to uint being undefined. This is actually an "int"
> type,
> > - looking at the test implementation
> > -
> > -Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
> > -Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
> > ----
> > - src/tests/dlt-test-init-free.c | 4 ++--
> > - 1 file changed, 2 insertions(+), 2 deletions(-)
> > -
> > -diff --git a/src/tests/dlt-test-init-free.c
> b/src/tests/dlt-test-init-free.c
> > -index 96b5245..35b8803 100644
> > ---- a/src/tests/dlt-test-init-free.c
> > -+++ b/src/tests/dlt-test-init-free.c
> > -@@ -32,7 +32,7 @@
> > -
> > - void exec(const char *cmd, char *buffer, size_t length);
> > - void printMemoryUsage();
> > --char *occupyMemory(uint size);
> > -+char *occupyMemory(int size);
> > - void do_example_test();
> > - void do_dlt_test();
> > -
> > -@@ -131,7 +131,7 @@ void printMemoryUsage()
> > -     printf("%s", result);
> > - }
> > -
> > --char *occupyMemory(uint size)
> > -+char *occupyMemory(int size)
> > - {
> > -     char *buf = (char *)malloc(size * sizeof(char));
> > -
> > -
> > -From c790d61fad382e5d3e648ee99904087eb9bc4a77 Mon Sep 17 00:00:00 2001
> > -From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
> > -Date: Sat, 25 Jan 2020 09:20:48 +0100
> > -Subject: [PATCH 3/3] sys/poll.h: deprecate old sys/poll.h include
> header, now
> > - glibc/musl wants poll.h being included directly. This fixes a build
> failure
> > - on musl systems with strict c hardening flags
> > -
> > -Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
> > -Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
> > ----
> > - src/console/logstorage/dlt-logstorage-ctrl.c | 2 +-
> > - src/daemon/dlt_daemon_event_handler.c        | 2 +-
> > - src/daemon/dlt_daemon_event_handler.h        | 2 +-
> > - src/daemon/dlt_daemon_event_handler_types.h  | 2 +-
> > - src/lib/dlt_user.c                           | 2 +-
> > - 5 files changed, 5 insertions(+), 5 deletions(-)
> > -
> > -diff --git a/src/console/logstorage/dlt-logstorage-ctrl.c
> b/src/console/logstorage/dlt-logstorage-ctrl.c
> > -index 525c137..6614f44 100644
> > ---- a/src/console/logstorage/dlt-logstorage-ctrl.c
> > -+++ b/src/console/logstorage/dlt-logstorage-ctrl.c
> > -@@ -61,7 +61,7 @@
> > - #include <string.h>
> > - #include <getopt.h>
> > -
> > --#include <sys/poll.h>
> > -+#include <poll.h>
> > -
> > - #if defined(__linux__)
> > - #   include "sd-daemon.h"
> > -diff --git a/src/daemon/dlt_daemon_event_handler.c
> b/src/daemon/dlt_daemon_event_handler.c
> > -index 1611f7b..0d463da 100644
> > ---- a/src/daemon/dlt_daemon_event_handler.c
> > -+++ b/src/daemon/dlt_daemon_event_handler.c
> > -@@ -30,7 +30,7 @@
> > - #include <string.h>
> > - #include <errno.h>
> > -
> > --#include <sys/poll.h>
> > -+#include <poll.h>
> > - #include <syslog.h>
> > -
> > - #include "dlt_common.h"
> > -diff --git a/src/daemon/dlt_daemon_event_handler.h
> b/src/daemon/dlt_daemon_event_handler.h
> > -index eb96101..bd550d3 100644
> > ---- a/src/daemon/dlt_daemon_event_handler.h
> > -+++ b/src/daemon/dlt_daemon_event_handler.h
> > -@@ -25,7 +25,7 @@
> > -  * \file dlt_daemon_event_handler.h
> > -  */
> > -
> > --#include <sys/poll.h>
> > -+#include <poll.h>
> > -
> > - #include "dlt_daemon_connection_types.h"
> > - #include "dlt_daemon_event_handler_types.h"
> > -diff --git a/src/daemon/dlt_daemon_event_handler_types.h
> b/src/daemon/dlt_daemon_event_handler_types.h
> > -index 370e503..0b16d08 100644
> > ---- a/src/daemon/dlt_daemon_event_handler_types.h
> > -+++ b/src/daemon/dlt_daemon_event_handler_types.h
> > -@@ -25,7 +25,7 @@
> > -  * \file dlt_daemon_event_handler_types.h
> > -  */
> > -
> > --#include <sys/poll.h>
> > -+#include <poll.h>
> > -
> > - #include "dlt_daemon_connection_types.h"
> > -
> > -#diff --git a/src/lib/dlt_user.c b/src/lib/dlt_user.c
> > -#index ffa9b09..511f991 100644
> > -#--- a/src/lib/dlt_user.c
> > -#+++ b/src/lib/dlt_user.c
> > -#@@ -43,7 +43,7 @@
> > -# #include <errno.h>
> > -#
> > -# #include <sys/uio.h> /* writev() */
> > -#-#include <sys/poll.h>
> > -#+#include <poll.h>
> > -#
> > -# #include <limits.h>
> > -# #ifdef linux
> > diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/238.patch
> b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/238.patch
> > new file mode 100644
> > index 000000000..14c44e6ed
> > --- /dev/null
> > +++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/238.patch
> > @@ -0,0 +1,35 @@
> > +From 214f8c71552fc096077f0b916dad75b31eefea3d Mon Sep 17 00:00:00 2001
> > +From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
> > +Date: Fri, 31 Jul 2020 15:26:35 +0200
> > +Subject: [PATCH] dlt_offline: fix build failures with gcc-10
> > +
> > +see bug report:
> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=957140
> > +
> > +/usr/bin/ld:
> CMakeFiles/dlt-daemon.dir/dlt_daemon_client.c.o:./obj-x86_64-linux-gnu/src/daemon/./src/offlinelogstorage/dlt_offline_logstorage.h:116:
> multiple definition of `g_logstorage_cache_max';
> CMakeFiles/dlt-daemon.dir/dlt-daemon.c.o:./obj-x86_64-linux-gnu/src/daemon/./src/offlinelogstorage/dlt_offline_logstorage.h:116:
> first defined here
> > +/usr/bin/ld:
> CMakeFiles/dlt-daemon.dir/dlt_daemon_common.c.o:./obj-x86_64-linux-gnu/src/daemon/./src/offlinelogstorage/dlt_offline_logstorage.h:118:
> multiple definition of `g_logstorage_cache_size';
> CMakeFiles/dlt-daemon.dir/dlt-daemon.c.o:./obj-x86_64-linux-gnu/src/daemon/./src/offlinelogstorage/dlt_offline_logstorage.h:118:
> first defined here
> > +/usr/bin/ld:
> CMakeFiles/dlt-daemon.dir/dlt_daemon_common.c.o:./obj-x86_64-linux-gnu/src/daemon/./src/offlinelogstorage/dlt_offline_logstorage.h:116:
> multiple definition of `g_logstorage_cache_max';
> CMakeFiles/dlt-daemon.dir/dlt-daemon.c.o:./obj-x86_64-linux-gnu/src/daemon/./src/offlinelogstorage/dlt_offline_logstorage.h:116:
> first defined here
> > +/usr/bin/ld:
> CMakeFiles/dlt-daemon.dir/dlt_daemon_connection.c.o:./obj-x86_64-linux-gnu/src/daemon/./src/offlinelogstorage/dlt_offline_logstorage.h:118:
> multiple definition of `g_logstorage_cache_size';
> CMakeFiles/dlt-daemon.dir/dlt-daemon.c.o:./obj-x86_64-linux-gnu/src/daemon/./src/offlinelogstorage/dlt_offline_logstorage.h:118:
> first defined here
> > +/usr/bin/ld:
> CMakeFiles/dlt-daemon.dir/dlt_daemon_connection.c.o:./obj-x86_64-linux-gnu/src/daemon/./src/offlinelogstorage/dlt_offline_logstorage.h:116:
> multiple definition of `g_logstorage_cache_max';
> CMakeFiles/dlt-daemon.dir/dlt-daemon.c.o:./obj-x86_64-linux-gnu/src/daemon/./src/offlinelogstorage/dlt_offline_logstorage.h:116:
> first defined here
> > +/usr/bin/ld:
> CMakeFiles/dlt-daemon.dir/dlt_daemon_event_handler.c.o:./obj-x86_64-linux-gnu/src/daemon/./src/offlinelogstorage/dlt_offline_logstorage.h:118:
> multiple definition of `g_logstorage_cache_size';
> CMakeFiles/dlt-daemon.dir/dlt-daemon.c.o:./obj-x86_64-linux-gnu/src/daemon/./src/offlinelogstorage/dlt_offline_logstorage.h:118:
> first defined here
> > +/usr/bin/ld:
> CMakeFiles/dlt-daemon.dir/dlt_daemon_event_handler.c.o:./obj-x86_64-linux-gnu/src/daemon/./src/offlinelogstorage/dlt_offline_logstorage.h:116:
> multiple definition of `g_logstorage_cache_max';
> CMakeFiles/dlt-daemon.dir/dlt-daemon.c.o:./obj-x86_64-linux-gnu/src/daemon/./src/offlinelogstorage/dlt_offline_logstorage.h:116:
> first defined here
> > +/usr/bin/ld:
> CMakeFiles/dlt-daemon.dir/dlt_daemon_offline_logstorage.c.o:./obj-x86_64-linux-gnu/src/daemon/./src/offlinelogstorage/dlt_offline_logstorage.h:116:
> multiple definition of `g_logstorage_cache_max';
> CMakeFiles/dlt-daemon.dir/dlt-daemon.c.o:./obj-x86_64-linux-gnu/src/daemon/./src/offlinelogstorage/dlt_offline_logstorage.h:116:
> first defined here
> > +---
> > + src/offlinelogstorage/dlt_offline_logstorage.h | 4 ++--
> > + 1 file changed, 2 insertions(+), 2 deletions(-)
> > +
> > +diff --git a/src/offlinelogstorage/dlt_offline_logstorage.h
> b/src/offlinelogstorage/dlt_offline_logstorage.h
> > +index b58da70..8ad84b8 100644
> > +--- a/src/offlinelogstorage/dlt_offline_logstorage.h
> > ++++ b/src/offlinelogstorage/dlt_offline_logstorage.h
> > +@@ -114,9 +114,9 @@
> > + #define DLT_OFFLINE_LOGSTORAGE_IS_STRATEGY_SET(S, s) ((S)&(s))
> > +
> > + /* logstorage max cache */
> > +-unsigned int g_logstorage_cache_max;
> > ++static unsigned int g_logstorage_cache_max;
> > + /* current logstorage cache size */
> > +-unsigned int g_logstorage_cache_size;
> > ++static unsigned int g_logstorage_cache_size;
> > +
> > + typedef struct
> > + {
> > diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.4.bb
> b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.5.bb
> > similarity index 97%
> > rename from meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.4.bb
> > rename to meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.5.bb
> > index 35c638bc7..3f5089672 100644
> > --- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.4.bb
> > +++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.5.bb
> > @@ -17,9 +17,9 @@ DEPENDS = "zlib gzip-native"
> >  SRC_URI = "git://github.com/GENIVI/${BPN}.git;protocol=https
> <http://github.com/GENIVI/$%7BBPN%7D.git;protocol=https> \
> >      file://0002-Don-t-execute-processes-as-a-specific-user.patch \
> >      file://0004-Modify-systemd-config-directory.patch \
> > -    file://204.patch \
> > +    file://238.patch \
> >  "
> > -SRCREV = "14ea971be7e808b9c5099c7f404ed3cf341873c4"
> > +SRCREV = "f1ac087c766827b1d0ed9c3a814b3cc052e948f2"
> >
> >  S = "${WORKDIR}/git"
> >
> > --
> > 2.17.1
> >
> > 
>

--00000000000014911205abec3981
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hello<div dir=3D"auto"><br></div><div dir=3D"auto">I trie=
d to reproduce by running everything on master (master-next for meta-oe) an=
d bitbake dlt-daemon with MACHINE set to raspberrypi4 or qemux86 and DISTRO=
=
=3Dpoky-tiny.</div><div dir=3D"auto">I also tried with and without systemd=
.=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto">It builds just f=
ine.=C2=A0</div><div dir=3D"auto">Do you have a way to share bblayers.conf =
and local.conf files please?=C2=A0</div><div dir=3D"auto"><br></div><div di=
r=3D"auto">Thanks</div><div dir=3D"auto"><br></div><div dir=3D"auto">Gianfr=
anco=C2=A0</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=
=3D"gmail_attr">On Sun, Aug 2, 2020, 09:01 Khem Raj &lt;<a href=3D"mailto:=
raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex">This fails on musl<br>
<br>
<a href=3D"http://errors.yoctoproject.org/Errors/Details/427081/" rel=3D"n=
oreferrer noreferrer" target=3D"_blank">http://errors.yoctoproject.org/Erro=
rs/Details/427081/</a><br>
<br>
On Fri, Jul 31, 2020 at 7:43 AM Gianfranco<br>
&lt;<a href=3D"mailto:costamagna.gianfranco@gmail.com" target=3D"_blank" r=
el=3D"noreferrer">costamagna.gianfranco@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt;=C2=A0 - drop patch 204: upstream<br>
&gt;=C2=A0 - add gcc-10 build fix proposed upstream 238.patch<br>
&gt;<br>
&gt; Signed-off-by: Gianfranco Costamagna &lt;<a href=3D"mailto:costamagna=
gianfranco@yahoo.it" target=3D"_blank" rel=3D"noreferrer">costamagnagianfra=
nco@yahoo.it</a>&gt;<br>
&gt; Signed-off-by: Gianfranco Costamagna &lt;<a href=3D"mailto:locutusofb=
org@debian.org" target=3D"_blank" rel=3D"noreferrer">locutusofborg@debian.o=
rg</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../dlt-daemon/dlt-daemon/204.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0| 148 ------------------<br>
&gt;=C2=A0 .../dlt-daemon/dlt-daemon/238.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0|=C2=A0 35 +++++<br>
&gt;=C2=A0 ...-<a href=3D"http://daemon_2.18.4.bb" rel=3D"noreferrer noref=
errer" target=3D"_blank">daemon_2.18.4.bb</a> =3D&gt; <a href=3D"http://dlt=
-daemon_2.18.5.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">dlt-daem=
on_2.18.5.bb</a>} |=C2=A0 =C2=A04 +-<br>
&gt;=C2=A0 3 files changed, 37 insertions(+), 150 deletions(-)<br>
&gt;=C2=A0 delete mode 100644 meta-oe/recipes-extended/dlt-daemon/dlt-daem=
on/204.patch<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-extended/dlt-daemon/dlt-daem=
on/238.patch<br>
&gt;=C2=A0 rename meta-oe/recipes-extended/dlt-daemon/{<a href=3D"http://d=
lt-daemon_2.18.4.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">dlt-da=
emon_2.18.4.bb</a> =3D&gt; <a href=3D"http://dlt-daemon_2.18.5.bb" rel=3D"n=
oreferrer noreferrer" target=3D"_blank">dlt-daemon_2.18.5.bb</a>} (97%)<br>
&gt;<br>
&gt; diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/204.patch=
 b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/204.patch<br>
&gt; deleted file mode 100644<br>
&gt; index f0fc0bcb2..000000000<br>
&gt; --- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/204.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,148 +0,0 @@<br>
&gt; -Upstream-Status: Submitted [<a href=3D"https://github.com/GENIVI/dlt=
-daemon/pull/204" rel=3D"noreferrer noreferrer" target=3D"_blank">https://g=
ithub.com/GENIVI/dlt-daemon/pull/204</a>]<br>
&gt; -From 92830aff6e91041f574753d78da758c62981d9a4 Mon Sep 17 00:00:00 20=
01<br>
&gt; -From: Gianfranco Costamagna &lt;<a href=3D"mailto:costamagnagianfran=
co@yahoo.it" target=3D"_blank" rel=3D"noreferrer">costamagnagianfranco@yaho=
o.it</a>&gt;<br>
&gt; -Date: Sat, 25 Jan 2020 09:08:07 +0100<br>
&gt; -Subject: [PATCH 1/3] dlt_user.h: fix build when musl is the libc<br>
&gt; - implementation, by adding a missing include for pthread_t reference=
:<br>
&gt; -<br>
&gt; -see <a href=3D"https://errors.yoctoproject.org/Errors/Details/308000=
/" rel=3D"noreferrer noreferrer" target=3D"_blank">https://errors.yoctoproj=
ect.org/Errors/Details/308000/</a> for details<br>
&gt; -<br>
&gt; -Thanks Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"=
_blank" rel=3D"noreferrer">raj.khem@gmail.com</a>&gt; for the report<br>
&gt; -<br>
&gt; -Signed-off-by: Gianfranco Costamagna &lt;<a href=3D"mailto:costamagn=
agianfranco@yahoo.it" target=3D"_blank" rel=3D"noreferrer">costamagnagianfr=
anco@yahoo.it</a>&gt;<br>
&gt; -Signed-off-by: Gianfranco Costamagna &lt;<a href=3D"mailto:locutusof=
borg@debian.org" target=3D"_blank" rel=3D"noreferrer">locutusofborg@debian.=
org</a>&gt;<br>
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
co@yahoo.it" target=3D"_blank" rel=3D"noreferrer">costamagnagianfranco@yaho=
o.it</a>&gt;<br>
&gt; -Date: Sat, 25 Jan 2020 09:16:14 +0100<br>
&gt; -Subject: [PATCH 2/3] dlt-test-init-free: fix build failure with stri=
ct<br>
&gt; - compiler flags, due to uint being undefined. This is actually an &q=
uot;int&quot; type,<br>
&gt; - looking at the test implementation<br>
&gt; -<br>
&gt; -Signed-off-by: Gianfranco Costamagna &lt;<a href=3D"mailto:costamagn=
agianfranco@yahoo.it" target=3D"_blank" rel=3D"noreferrer">costamagnagianfr=
anco@yahoo.it</a>&gt;<br>
&gt; -Signed-off-by: Gianfranco Costamagna &lt;<a href=3D"mailto:locutusof=
borg@debian.org" target=3D"_blank" rel=3D"noreferrer">locutusofborg@debian.=
org</a>&gt;<br>
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
co@yahoo.it" target=3D"_blank" rel=3D"noreferrer">costamagnagianfranco@yaho=
o.it</a>&gt;<br>
&gt; -Date: Sat, 25 Jan 2020 09:20:48 +0100<br>
&gt; -Subject: [PATCH 3/3] sys/poll.h: deprecate old sys/poll.h include he=
ader, now<br>
&gt; - glibc/musl wants poll.h being included directly. This fixes a build=
 failure<br>
&gt; - on musl systems with strict c hardening flags<br>
&gt; -<br>
&gt; -Signed-off-by: Gianfranco Costamagna &lt;<a href=3D"mailto:costamagn=
agianfranco@yahoo.it" target=3D"_blank" rel=3D"noreferrer">costamagnagianfr=
anco@yahoo.it</a>&gt;<br>
&gt; -Signed-off-by: Gianfranco Costamagna &lt;<a href=3D"mailto:locutusof=
borg@debian.org" target=3D"_blank" rel=3D"noreferrer">locutusofborg@debian.=
org</a>&gt;<br>
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
co@yahoo.it" target=3D"_blank" rel=3D"noreferrer">costamagnagianfranco@yaho=
o.it</a>&gt;<br>
&gt; +Date: Fri, 31 Jul 2020 15:26:35 +0200<br>
&gt; +Subject: [PATCH] dlt_offline: fix build failures with gcc-10<br>
&gt; +<br>
&gt; +see bug report: <a href=3D"https://bugs.debian.org/cgi-bin/bugreport=
.cgi?bug=3D957140" rel=3D"noreferrer noreferrer" target=3D"_blank">https://=
bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D957140</a><br>
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
t-daemon_2.18.4.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">dlt-dae=
mon_2.18.4.bb</a> b/meta-oe/recipes-extended/dlt-daemon/<a href=3D"http://d=
lt-daemon_2.18.5.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">dlt-da=
emon_2.18.5.bb</a><br>
&gt; similarity index 97%<br>
&gt; rename from meta-oe/recipes-extended/dlt-daemon/<a href=3D"http://dlt=
-daemon_2.18.4.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">dlt-daem=
on_2.18.4.bb</a><br>
&gt; rename to meta-oe/recipes-extended/dlt-daemon/<a href=3D"http://dlt-d=
aemon_2.18.5.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">dlt-daemon=
_2.18.5.bb</a><br>
&gt; index 35c638bc7..3f5089672 100644<br>
&gt; --- a/meta-oe/recipes-extended/dlt-daemon/<a href=3D"http://dlt-daemo=
n_2.18.4.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">dlt-daemon_2.1=
8.4.bb</a><br>
&gt; +++ b/meta-oe/recipes-extended/dlt-daemon/<a href=3D"http://dlt-daemo=
n_2.18.5.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">dlt-daemon_2.1=
8.5.bb</a><br>
&gt; @@ -17,9 +17,9 @@ DEPENDS =3D &quot;zlib gzip-native&quot;<br>
&gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://github.com/GENIVI/$%7=
BBPN%7D.git;protocol=3Dhttps" rel=3D"noreferrer noreferrer" target=3D"_blan=
k">github.com/GENIVI/${BPN}.git;protocol=3Dhttps</a> \<br>
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

--00000000000014911205abec3981--
