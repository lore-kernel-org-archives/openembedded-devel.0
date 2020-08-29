Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.7375.1598688075408855067
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 29 Aug 2020 01:01:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bezI5z0m;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id y8so1049479wma.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 29 Aug 2020 01:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=J8XffV1edaVpvU1HIOtfjxOqJK7ouMAQjkmvGabGyyk=;
        b=bezI5z0mjPKC6HmucIZi1UnG+MvW+WAufzwnG9fZLmUzPY3XSfKUzDWVieROOHCMp2
         SL+8AA18woIyFldtgL8QjtXLXSDf6SURvgzyaM8J5chzN14K3lTvFUeCyb5o/e/42OfW
         qA6U2HQ+iRpjOwDQBzEAsI/5jNKlcXmt5VZy7hATGJPU3o18iDBws2VoYWXSme6P9kQI
         XgFGnvb3qTxgAZJrVOjjRITkTFssT8AcPX5qogr0nvVHgdHKdx8aRXZvqhtRKBKhMaps
         XNBAOAGOxEmuE+INaszpWwcrREkA7cvPsb0CR6ONHGCu9yijPjM28LZqgXqxfIDg2El2
         b2qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=J8XffV1edaVpvU1HIOtfjxOqJK7ouMAQjkmvGabGyyk=;
        b=rgMMF1ZNCET5n4smVahvk7Z74hauG7DJgHMY228uQulwFwklryrKydrNBu+YPh0EZR
         WcOIZP5sbUNlXa/lWl9HJmpHBveCH+ROU1UiSeRggxUPlY5cw1UgQo5gIPWkk0I6Fbu1
         02h2EZR1yDE+u4MvbNtUp6xQE7WPu9IQdk9AQcAeNINLIxys7ighfVKupoZ3kLp7lOyM
         z2QIjBSs5vZWlzIZs5H82+vbMtsOwdZp23FkR+Vm5VmzunRtn4MOnBsfzR/vN6Siwvuq
         GX+YIhhQblXB09TLxZ+E7UWEJRTy/UXQ+PsavliNCB1VtgfrExFcX7u9OfQ/0Kv+63tj
         h70w==
X-Gm-Message-State: AOAM531mPk3sTWX6ET0YBRI/0RJsZFRNC6FB7O8s2zodqlC1AOSV3XXM
	kXqlcZLXhmYRXrwXUhBwAmEDpsHGGYm/KQcDhTI=
X-Google-Smtp-Source: ABdhPJwPyow2bewcQLbAAPTPaVUsekB/An+N/hbwI50ax12FE4sXCTS9Idflwh/pSS8OSOKyz/nu+oMN/pLCT21qGp8=
X-Received: by 2002:a1c:cc0d:: with SMTP id h13mr2184559wmb.44.1598688073818;
 Sat, 29 Aug 2020 01:01:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200829065445.1952-1-costamagnagianfranco@yahoo.it> <CAMKF1srt+f_aHLN7W6d5e2MokfXi-rbneOWY-y5vh5Kqq6SebA@mail.gmail.com>
In-Reply-To: <CAMKF1srt+f_aHLN7W6d5e2MokfXi-rbneOWY-y5vh5Kqq6SebA@mail.gmail.com>
From: "Gianfranco" <costamagna.gianfranco@gmail.com>
Date: Sat, 29 Aug 2020 10:01:01 +0200
Message-ID: <CAATN8PUvyq09_bs9-8DmBA2BbM3ihXuVW34=h7NcX23yFGczHw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] dlt-daemon: superseed upstream pr #238 patch with pr #245 due to unexpected behaviour
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	Gianfranco Costamagna <costamagnagianfranco@yahoo.it>, 
	Gianfranco Costamagna <locutusofborg@debian.org>
Content-Type: multipart/alternative; boundary="000000000000bf28f305adff923c"

--000000000000bf28f305adff923c
Content-Type: text/plain; charset="UTF-8"

Yes
I sent a new version.
Sorry

G.

On Sat, Aug 29, 2020, 09:59 Khem Raj <raj.khem@gmail.com> wrote:

> On Fri, Aug 28, 2020 at 11:54 PM Gianfranco
> <costamagna.gianfranco@gmail.com> wrote:
> >
> > Upstream commented to use the second one
> >
> > Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
> > Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
> > ---
> >  .../wvdial/wvstreams/ftbfs-gcc-10.patch       | 27 ++++++++++
> >  .../wvdial/wvstreams_4.6.1.bb                 |  1 +
>
> is this spurious change ?
>
> >  .../dlt-daemon/{238.patch => 245.patch}       | 53 ++++++++++++++++---
> >  .../dlt-daemon/dlt-daemon_2.18.5.bb           |  2 +-
> >  4 files changed, 75 insertions(+), 8 deletions(-)
> >  create mode 100644
> meta-oe/recipes-connectivity/wvdial/wvstreams/ftbfs-gcc-10.patch
> >  rename meta-oe/recipes-extended/dlt-daemon/dlt-daemon/{238.patch =>
> 245.patch} (65%)
> >
> > diff --git
> a/meta-oe/recipes-connectivity/wvdial/wvstreams/ftbfs-gcc-10.patch
> b/meta-oe/recipes-connectivity/wvdial/wvstreams/ftbfs-gcc-10.patch
> > new file mode 100644
> > index 000000000..03d2889f1
> > --- /dev/null
> > +++ b/meta-oe/recipes-connectivity/wvdial/wvstreams/ftbfs-gcc-10.patch
> > @@ -0,0 +1,27 @@
> > +Description: Fix a build failure with gcc-10.
> > + version_major is declared as unsigned int, so "-1" value makes no
> sense here.
> > + Also, we don't want to change the variable to a public interface,
> better just ignore this
> > + debug use-case nobody probably ever used.
> > +Author: Gianfranco Costamagna <locutusofborg@debian.org>
> > +Bug-Debian: https://bugs.debian.org/957964
> > +Last-Update: 2020-08-15
> > +
> > +--- wvstreams-4.6.1.orig/xplc/moduleloader.cc
> > ++++ wvstreams-4.6.1/xplc/moduleloader.cc
> > +@@ -63,11 +63,11 @@ Module* Module::loadModule(const char* m
> > +   }
> > +
> > +   switch(moduleinfo->version_major) {
> > +-#ifdef UNSTABLE
> > +-  case -1:
> > +-    /* nothing to do */
> > +-    break;
> > +-#endif
> > ++//#ifdef UNSTABLE
> > ++//  case -1:
> > ++//    /* nothing to do */
> > ++//    break;
> > ++//#endif
> > +   default:
> > +     loaderClose(dlh);
> > +     return NULL;
> > diff --git a/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
> b/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
> > index 20becaf57..15c0a59ee 100644
> > --- a/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
> > +++ b/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
> > @@ -23,6 +23,7 @@ SRC_URI = "http://${BPN}.
> googlecode.com/files/${BP}.tar.gz
> <http://googlecode.com/files/$%7BBP%7D.tar.gz> \
> >             file://openssl-buildfix.patch \
> >             file://0001-Forward-port-to-OpenSSL-1.1.x.patch \
> >             file://0001-Fix-narrowing-conversion-error.patch \
> > +           file://ftbfs-gcc-10.patch \
> >             "
> >
> >  SRC_URI[md5sum] = "2760dac31a43d452a19a3147bfde571c"
> > diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/238.patch
> b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/245.patch
> > similarity index 65%
> > rename from meta-oe/recipes-extended/dlt-daemon/dlt-daemon/238.patch
> > rename to meta-oe/recipes-extended/dlt-daemon/dlt-daemon/245.patch
> > index 14c44e6ed..43057489c 100644
> > --- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/238.patch
> > +++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/245.patch
> > @@ -1,6 +1,6 @@
> > -From 214f8c71552fc096077f0b916dad75b31eefea3d Mon Sep 17 00:00:00 2001
> > +From 57fd61ea5c58a4f9fcd7140b53ac6cd6e971ef47 Mon Sep 17 00:00:00 2001
> >  From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
> > -Date: Fri, 31 Jul 2020 15:26:35 +0200
> > +Date: Fri, 31 Jul 2020 15:16:02 +0200
> >  Subject: [PATCH] dlt_offline: fix build failures with gcc-10
> >
> >  see bug report:
> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=957140
> > @@ -14,11 +14,26 @@ see bug report:
> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=957140
> >  /usr/bin/ld:
> CMakeFiles/dlt-daemon.dir/dlt_daemon_event_handler.c.o:./obj-x86_64-linux-gnu/src/daemon/./src/offlinelogstorage/dlt_offline_logstorage.h:116:
> multiple definition of `g_logstorage_cache_max';
> CMakeFiles/dlt-daemon.dir/dlt-daemon.c.o:./obj-x86_64-linux-gnu/src/daemon/./src/offlinelogstorage/dlt_offline_logstorage.h:116:
> first defined here
> >  /usr/bin/ld:
> CMakeFiles/dlt-daemon.dir/dlt_daemon_offline_logstorage.c.o:./obj-x86_64-linux-gnu/src/daemon/./src/offlinelogstorage/dlt_offline_logstorage.h:116:
> multiple definition of `g_logstorage_cache_max';
> CMakeFiles/dlt-daemon.dir/dlt-daemon.c.o:./obj-x86_64-linux-gnu/src/daemon/./src/offlinelogstorage/dlt_offline_logstorage.h:116:
> first defined here
> >  ---
> > - src/offlinelogstorage/dlt_offline_logstorage.h | 4 ++--
> > - 1 file changed, 2 insertions(+), 2 deletions(-)
> > + src/daemon/dlt_daemon_offline_logstorage.c              | 1 +
> > + src/offlinelogstorage/dlt_offline_logstorage.h          | 4 ++--
> > + src/offlinelogstorage/dlt_offline_logstorage_behavior.c | 1 +
> > + tests/gtest_dlt_daemon_offline_log.cpp                  | 1 +
> > + 4 files changed, 5 insertions(+), 2 deletions(-)
> >
> > +diff --git a/src/daemon/dlt_daemon_offline_logstorage.c
> b/src/daemon/dlt_daemon_offline_logstorage.c
> > +index 0b3c14f..db9637e 100644
> > +--- a/src/daemon/dlt_daemon_offline_logstorage.c
> > ++++ b/src/daemon/dlt_daemon_offline_logstorage.c
> > +@@ -56,6 +56,7 @@ DLT_STATIC DltReturnValue
> dlt_logstorage_split_ecuid(char *key,
> > +     return DLT_RETURN_OK;
> > + }
> > +
> > ++unsigned int g_logstorage_cache_max;
> > + /**
> > +  * dlt_logstorage_split_ctid
> > +  *
> >  diff --git a/src/offlinelogstorage/dlt_offline_logstorage.h
> b/src/offlinelogstorage/dlt_offline_logstorage.h
> > -index b58da70..8ad84b8 100644
> > +index b58da70..c9bc93b 100644
> >  --- a/src/offlinelogstorage/dlt_offline_logstorage.h
> >  +++ b/src/offlinelogstorage/dlt_offline_logstorage.h
> >  @@ -114,9 +114,9 @@
> > @@ -26,10 +41,34 @@ index b58da70..8ad84b8 100644
> >
> >   /* logstorage max cache */
> >  -unsigned int g_logstorage_cache_max;
> > -+static unsigned int g_logstorage_cache_max;
> > ++extern unsigned int g_logstorage_cache_max;
> >   /* current logstorage cache size */
> >  -unsigned int g_logstorage_cache_size;
> > -+static unsigned int g_logstorage_cache_size;
> > ++extern unsigned int g_logstorage_cache_size;
> >
> >   typedef struct
> >   {
> > +diff --git a/src/offlinelogstorage/dlt_offline_logstorage_behavior.c
> b/src/offlinelogstorage/dlt_offline_logstorage_behavior.c
> > +index afbf8c4..edef482 100644
> > +--- a/src/offlinelogstorage/dlt_offline_logstorage_behavior.c
> > ++++ b/src/offlinelogstorage/dlt_offline_logstorage_behavior.c
> > +@@ -32,6 +32,7 @@
> > + #include "dlt_offline_logstorage_behavior.h"
> > + #include "dlt_offline_logstorage_behavior_internal.h"
> > +
> > ++unsigned int g_logstorage_cache_size;
> > + /**
> > +  * dlt_logstorage_log_file_name
> > +  *
> > +diff --git a/tests/gtest_dlt_daemon_offline_log.cpp
> b/tests/gtest_dlt_daemon_offline_log.cpp
> > +index b8965de..0bd4d5e 100644
> > +--- a/tests/gtest_dlt_daemon_offline_log.cpp
> > ++++ b/tests/gtest_dlt_daemon_offline_log.cpp
> > +@@ -29,6 +29,7 @@ extern "C"
> > + #include <fcntl.h>
> > + }
> > +
> > ++unsigned int g_logstorage_cache_max;
> > + /* Begin Method: dlt_logstorage::t_dlt_logstorage_list_add*/
> > + TEST(t_dlt_logstorage_list_add, normal)
> > + {
> > diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.5.bb
> b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.5.bb
> > index 3a2b40515..f3fcee4d2 100644
> > --- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.5.bb
> > +++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.5.bb
> > @@ -17,8 +17,8 @@ DEPENDS = "zlib gzip-native"
> >  SRC_URI = "git://github.com/GENIVI/${BPN}.git;protocol=https
> <http://github.com/GENIVI/$%7BBPN%7D.git;protocol=https> \
> >      file://0002-Don-t-execute-processes-as-a-specific-user.patch \
> >      file://0004-Modify-systemd-config-directory.patch \
> > -    file://238.patch \
> >      file://241.patch \
> > +    file://245.patch \
> >  "
> >  SRCREV = "f1ac087c766827b1d0ed9c3a814b3cc052e948f2"
> >
> > --
> > 2.17.1
> >
> > 
>

--000000000000bf28f305adff923c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Yes<div dir=3D"auto">I sent a new version.=C2=A0</div><di=
v dir=3D"auto">Sorry</div><div dir=3D"auto"><br></div><div dir=3D"auto">G.=
=C2=A0</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">On Sat, Aug 29, 2020, 09:59 Khem Raj &lt;<a href=3D"mailto:raj=
.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pa=
dding-left:1ex">On Fri, Aug 28, 2020 at 11:54 PM Gianfranco<br>
&lt;<a href=3D"mailto:costamagna.gianfranco@gmail.com" target=3D"_blank" r=
el=3D"noreferrer">costamagna.gianfranco@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Upstream commented to use the second one<br>
&gt;<br>
&gt; Signed-off-by: Gianfranco Costamagna &lt;<a href=3D"mailto:costamagna=
gianfranco@yahoo.it" target=3D"_blank" rel=3D"noreferrer">costamagnagianfra=
nco@yahoo.it</a>&gt;<br>
&gt; Signed-off-by: Gianfranco Costamagna &lt;<a href=3D"mailto:locutusofb=
org@debian.org" target=3D"_blank" rel=3D"noreferrer">locutusofborg@debian.o=
rg</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../wvdial/wvstreams/ftbfs-gcc-10.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0| 27 ++++++++++<br>
&gt;=C2=A0 .../wvdial/<a href=3D"http://wvstreams_4.6.1.bb" rel=3D"norefer=
rer noreferrer" target=3D"_blank">wvstreams_4.6.1.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
<br>
is this spurious change ?<br>
<br>
&gt;=C2=A0 .../dlt-daemon/{238.patch =3D&gt; 245.patch}=C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 53 ++++++++++++++++---<br>
&gt;=C2=A0 .../dlt-daemon/<a href=3D"http://dlt-daemon_2.18.5.bb" rel=3D"n=
oreferrer noreferrer" target=3D"_blank">dlt-daemon_2.18.5.bb</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
&gt;=C2=A0 4 files changed, 75 insertions(+), 8 deletions(-)<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-connectivity/wvdial/wvstream=
s/ftbfs-gcc-10.patch<br>
&gt;=C2=A0 rename meta-oe/recipes-extended/dlt-daemon/dlt-daemon/{238.patc=
h =3D&gt; 245.patch} (65%)<br>
&gt;<br>
&gt; diff --git a/meta-oe/recipes-connectivity/wvdial/wvstreams/ftbfs-gcc-=
10.patch b/meta-oe/recipes-connectivity/wvdial/wvstreams/ftbfs-gcc-10.patch=
<br>
&gt; new file mode 100644<br>
&gt; index 000000000..03d2889f1<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-oe/recipes-connectivity/wvdial/wvstreams/ftbfs-gcc-10.patc=
h<br>
&gt; @@ -0,0 +1,27 @@<br>
&gt; +Description: Fix a build failure with gcc-10.<br>
&gt; + version_major is declared as unsigned int, so &quot;-1&quot; value =
makes no sense here.<br>
&gt; + Also, we don&#39;t want to change the variable to a public interfac=
e, better just ignore this<br>
&gt; + debug use-case nobody probably ever used.<br>
&gt; +Author: Gianfranco Costamagna &lt;<a href=3D"mailto:locutusofborg@de=
bian.org" target=3D"_blank" rel=3D"noreferrer">locutusofborg@debian.org</a>=
&gt;<br>
&gt; +Bug-Debian: <a href=3D"https://bugs.debian.org/957964" rel=3D"norefe=
rrer noreferrer" target=3D"_blank">https://bugs.debian.org/957964</a><br>
&gt; +Last-Update: 2020-08-15<br>
&gt; +<br>
&gt; +--- wvstreams-4.6.1.orig/xplc/moduleloader.cc<br>
&gt; ++++ wvstreams-4.6.1/xplc/moduleloader.cc<br>
&gt; +@@ -63,11 +63,11 @@ Module* Module::loadModule(const char* m<br>
&gt; +=C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0switch(moduleinfo-&gt;version_major) {<br>
&gt; +-#ifdef UNSTABLE<br>
&gt; +-=C2=A0 case -1:<br>
&gt; +-=C2=A0 =C2=A0 /* nothing to do */<br>
&gt; +-=C2=A0 =C2=A0 break;<br>
&gt; +-#endif<br>
&gt; ++//#ifdef UNSTABLE<br>
&gt; ++//=C2=A0 case -1:<br>
&gt; ++//=C2=A0 =C2=A0 /* nothing to do */<br>
&gt; ++//=C2=A0 =C2=A0 break;<br>
&gt; ++//#endif<br>
&gt; +=C2=A0 =C2=A0default:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0loaderClose(dlh);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return NULL;<br>
&gt; diff --git a/meta-oe/recipes-connectivity/wvdial/<a href=3D"http://wv=
streams_4.6.1.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">wvstreams=
_4.6.1.bb</a> b/meta-oe/recipes-connectivity/wvdial/<a href=3D"http://wvstr=
eams_4.6.1.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">wvstreams_4.=
6.1.bb</a><br>
&gt; index 20becaf57..15c0a59ee 100644<br>
&gt; --- a/meta-oe/recipes-connectivity/wvdial/<a href=3D"http://wvstreams=
_4.6.1.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">wvstreams_4.6.1.=
bb</a><br>
&gt; +++ b/meta-oe/recipes-connectivity/wvdial/<a href=3D"http://wvstreams=
_4.6.1.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">wvstreams_4.6.1.=
bb</a><br>
&gt; @@ -23,6 +23,7 @@ SRC_URI =3D &quot;http://${BPN}.<a href=3D"http://g=
ooglecode.com/files/$%7BBP%7D.tar.gz" rel=3D"noreferrer noreferrer" target=
=3D"_blank">googlecode.com/files/${BP}.tar.gz</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://openssl-buildfi=
x.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Forward-po=
rt-to-OpenSSL-1.1.x.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Fix-narrow=
ing-conversion-error.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://ftbfs-gcc-10.patch \=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;<br>
&gt;=C2=A0 SRC_URI[md5sum] =3D &quot;2760dac31a43d452a19a3147bfde571c&quot=
;<br>
&gt; diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/238.patch=
 b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/245.patch<br>
&gt; similarity index 65%<br>
&gt; rename from meta-oe/recipes-extended/dlt-daemon/dlt-daemon/238.patch<=
br>
&gt; rename to meta-oe/recipes-extended/dlt-daemon/dlt-daemon/245.patch<br=
>
&gt; index 14c44e6ed..43057489c 100644<br>
&gt; --- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/238.patch<br>
&gt; +++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/245.patch<br>
&gt; @@ -1,6 +1,6 @@<br>
&gt; -From 214f8c71552fc096077f0b916dad75b31eefea3d Mon Sep 17 00:00:00 20=
01<br>
&gt; +From 57fd61ea5c58a4f9fcd7140b53ac6cd6e971ef47 Mon Sep 17 00:00:00 20=
01<br>
&gt;=C2=A0 From: Gianfranco Costamagna &lt;<a href=3D"mailto:costamagnagia=
nfranco@yahoo.it" target=3D"_blank" rel=3D"noreferrer">costamagnagianfranco=
@yahoo.it</a>&gt;<br>
&gt; -Date: Fri, 31 Jul 2020 15:26:35 +0200<br>
&gt; +Date: Fri, 31 Jul 2020 15:16:02 +0200<br>
&gt;=C2=A0 Subject: [PATCH] dlt_offline: fix build failures with gcc-10<br=
>
&gt;<br>
&gt;=C2=A0 see bug report: <a href=3D"https://bugs.debian.org/cgi-bin/bugr=
eport.cgi?bug=3D957140" rel=3D"noreferrer noreferrer" target=3D"_blank">htt=
ps://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D957140</a><br>
&gt; @@ -14,11 +14,26 @@ see bug report: <a href=3D"https://bugs.debian.or=
g/cgi-bin/bugreport.cgi?bug=3D957140" rel=3D"noreferrer noreferrer" target=
=3D"_blank">https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D957140</a>=
<br>
&gt;=C2=A0 /usr/bin/ld: CMakeFiles/dlt-daemon.dir/dlt_daemon_event_handler=
.c.o:./obj-x86_64-linux-gnu/src/daemon/./src/offlinelogstorage/dlt_offline_=
logstorage.h:116: multiple definition of `g_logstorage_cache_max&#39;; CMak=
eFiles/dlt-daemon.dir/dlt-daemon.c.o:./obj-x86_64-linux-gnu/src/daemon/./sr=
c/offlinelogstorage/dlt_offline_logstorage.h:116: first defined here<br>
&gt;=C2=A0 /usr/bin/ld: CMakeFiles/dlt-daemon.dir/dlt_daemon_offline_logst=
orage.c.o:./obj-x86_64-linux-gnu/src/daemon/./src/offlinelogstorage/dlt_off=
line_logstorage.h:116: multiple definition of `g_logstorage_cache_max&#39;;=
 CMakeFiles/dlt-daemon.dir/dlt-daemon.c.o:./obj-x86_64-linux-gnu/src/daemon=
/./src/offlinelogstorage/dlt_offline_logstorage.h:116: first defined here<b=
r>
&gt;=C2=A0 ---<br>
&gt; - src/offlinelogstorage/dlt_offline_logstorage.h | 4 ++--<br>
&gt; - 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt; + src/daemon/dlt_daemon_offline_logstorage.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +<br>
&gt; + src/offlinelogstorage/dlt_offline_logstorage.h=C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 | 4 ++--<br>
&gt; + src/offlinelogstorage/dlt_offline_logstorage_behavior.c | 1 +<br>
&gt; + tests/gtest_dlt_daemon_offline_log.cpp=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +<br>
&gt; + 4 files changed, 5 insertions(+), 2 deletions(-)<br>
&gt;<br>
&gt; +diff --git a/src/daemon/dlt_daemon_offline_logstorage.c b/src/daemon=
/dlt_daemon_offline_logstorage.c<br>
&gt; +index 0b3c14f..db9637e 100644<br>
&gt; +--- a/src/daemon/dlt_daemon_offline_logstorage.c<br>
&gt; ++++ b/src/daemon/dlt_daemon_offline_logstorage.c<br>
&gt; +@@ -56,6 +56,7 @@ DLT_STATIC DltReturnValue dlt_logstorage_split_ecu=
id(char *key,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return DLT_RETURN_OK;<br>
&gt; + }<br>
&gt; +<br>
&gt; ++unsigned int g_logstorage_cache_max;<br>
&gt; + /**<br>
&gt; +=C2=A0 * dlt_logstorage_split_ctid<br>
&gt; +=C2=A0 *<br>
&gt;=C2=A0 diff --git a/src/offlinelogstorage/dlt_offline_logstorage.h b/s=
rc/offlinelogstorage/dlt_offline_logstorage.h<br>
&gt; -index b58da70..8ad84b8 100644<br>
&gt; +index b58da70..c9bc93b 100644<br>
&gt;=C2=A0 --- a/src/offlinelogstorage/dlt_offline_logstorage.h<br>
&gt;=C2=A0 +++ b/src/offlinelogstorage/dlt_offline_logstorage.h<br>
&gt;=C2=A0 @@ -114,9 +114,9 @@<br>
&gt; @@ -26,10 +41,34 @@ index b58da70..8ad84b8 100644<br>
&gt;<br>
&gt;=C2=A0 =C2=A0/* logstorage max cache */<br>
&gt;=C2=A0 -unsigned int g_logstorage_cache_max;<br>
&gt; -+static unsigned int g_logstorage_cache_max;<br>
&gt; ++extern unsigned int g_logstorage_cache_max;<br>
&gt;=C2=A0 =C2=A0/* current logstorage cache size */<br>
&gt;=C2=A0 -unsigned int g_logstorage_cache_size;<br>
&gt; -+static unsigned int g_logstorage_cache_size;<br>
&gt; ++extern unsigned int g_logstorage_cache_size;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0typedef struct<br>
&gt;=C2=A0 =C2=A0{<br>
&gt; +diff --git a/src/offlinelogstorage/dlt_offline_logstorage_behavior.c=
 b/src/offlinelogstorage/dlt_offline_logstorage_behavior.c<br>
&gt; +index afbf8c4..edef482 100644<br>
&gt; +--- a/src/offlinelogstorage/dlt_offline_logstorage_behavior.c<br>
&gt; ++++ b/src/offlinelogstorage/dlt_offline_logstorage_behavior.c<br>
&gt; +@@ -32,6 +32,7 @@<br>
&gt; + #include &quot;dlt_offline_logstorage_behavior.h&quot;<br>
&gt; + #include &quot;dlt_offline_logstorage_behavior_internal.h&quot;<br>
&gt; +<br>
&gt; ++unsigned int g_logstorage_cache_size;<br>
&gt; + /**<br>
&gt; +=C2=A0 * dlt_logstorage_log_file_name<br>
&gt; +=C2=A0 *<br>
&gt; +diff --git a/tests/gtest_dlt_daemon_offline_log.cpp b/tests/gtest_dl=
t_daemon_offline_log.cpp<br>
&gt; +index b8965de..0bd4d5e 100644<br>
&gt; +--- a/tests/gtest_dlt_daemon_offline_log.cpp<br>
&gt; ++++ b/tests/gtest_dlt_daemon_offline_log.cpp<br>
&gt; +@@ -29,6 +29,7 @@ extern &quot;C&quot;<br>
&gt; + #include &lt;fcntl.h&gt;<br>
&gt; + }<br>
&gt; +<br>
&gt; ++unsigned int g_logstorage_cache_max;<br>
&gt; + /* Begin Method: dlt_logstorage::t_dlt_logstorage_list_add*/<br>
&gt; + TEST(t_dlt_logstorage_list_add, normal)<br>
&gt; + {<br>
&gt; diff --git a/meta-oe/recipes-extended/dlt-daemon/<a href=3D"http://dl=
t-daemon_2.18.5.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">dlt-dae=
mon_2.18.5.bb</a> b/meta-oe/recipes-extended/dlt-daemon/<a href=3D"http://d=
lt-daemon_2.18.5.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">dlt-da=
emon_2.18.5.bb</a><br>
&gt; index 3a2b40515..f3fcee4d2 100644<br>
&gt; --- a/meta-oe/recipes-extended/dlt-daemon/<a href=3D"http://dlt-daemo=
n_2.18.5.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">dlt-daemon_2.1=
8.5.bb</a><br>
&gt; +++ b/meta-oe/recipes-extended/dlt-daemon/<a href=3D"http://dlt-daemo=
n_2.18.5.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">dlt-daemon_2.1=
8.5.bb</a><br>
&gt; @@ -17,8 +17,8 @@ DEPENDS =3D &quot;zlib gzip-native&quot;<br>
&gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://github.com/GENIVI/$%7=
BBPN%7D.git;protocol=3Dhttps" rel=3D"noreferrer noreferrer" target=3D"_blan=
k">github.com/GENIVI/${BPN}.git;protocol=3Dhttps</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 file://0002-Don-t-execute-processes-as-a-specific=
-user.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 file://0004-Modify-systemd-config-directory.patch=
 \<br>
&gt; -=C2=A0 =C2=A0 file://238.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 file://241.patch \<br>
&gt; +=C2=A0 =C2=A0 file://245.patch \<br>
&gt;=C2=A0 &quot;<br>
&gt;=C2=A0 SRCREV =3D &quot;f1ac087c766827b1d0ed9c3a814b3cc052e948f2&quot;=
<br>
&gt;<br>
&gt; --<br>
&gt; 2.17.1<br>
&gt;<br>
&gt; <br>
</blockquote></div>

--000000000000bf28f305adff923c--
