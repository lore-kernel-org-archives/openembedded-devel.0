Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.web10.13245.1591936753580851714
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Jun 2020 21:39:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KkHT/y3/;
 spf=pass (domain: gmail.com, ip: 209.85.222.194, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f194.google.com with SMTP id v79so7861517qkb.10
        for <openembedded-devel@lists.openembedded.org>; Thu, 11 Jun 2020 21:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=31N+ME6nCADBOjOnTXhvE2xj6sfsmyRb4o6NHnPd6tU=;
        b=KkHT/y3/3m9L5ER+YZgr4I0KYpVNdE2ZwVyVTphRpiLJ47iPZeovy5ovA+l9DwulgM
         YyxsT+zMt3ksGEANP2n5xLP7ZPOrv80R4av1wRZ9GFRVWMHPE2co80yvV1XpPwbVLk0A
         q2dId3gCMhYkA3zMazrFxkfkCkDt69qlPuU/7RNpSFPNPLt5oBrN0QLNf3I1VYiqisvl
         Dqk4tcNZVTmtSC+8TDlty0l1VEr6IFF17bvqacBA8hReBxeSrJgYGxZEwgVyEgrHwnur
         w0L3NnT8qXA4iaVV3UmDKTP8+Jbzo4ZKxyyIT+J6xXvYEuAiLQ3RNvt/BVbb895PSYCN
         8C+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=31N+ME6nCADBOjOnTXhvE2xj6sfsmyRb4o6NHnPd6tU=;
        b=K68O+1H8TnaI4wIN/fIJa/kHw7i200SOzco2YMPduId28nvK6wYlIwWNavcqFVfAte
         ErOJ9RDAgKla1xU/AUcLyrdj9pnTJ33tabOwJIUafyIo/CAMMhnZbGJ+IkVS0XEVJXT0
         ALHwO9xLUJ8T03bOIw/GCejHIxXOLfxkzXgmsmzlAQhgC5FiXlSpEKmga7VNy5aI+5pf
         bxyyOQ2cRcWXcEoTIoHc417SJQ8VfUKqn6tPhFbaR1RFgPwr3xN+uhLOk3zM6vJGX28o
         m0TRde77GXhLzxHj11zX1HRRSIRdVk4YcMJ3HOS4taj5Cgn7K910Ft/3j6BmFWoskS6p
         XgHw==
X-Gm-Message-State: AOAM530EUNHOITqvDBPSrYb/4uPEC6lftafenfTyyK+O7aT/NUF4MmxR
	ZtILqY91VuKLsJ3KZJTE3t2X+IjEFQ07ae4tmjPDHjug
X-Google-Smtp-Source: ABdhPJxrh6Kd/uyJHX3aCNb80cCeSztbtatCUu+sxrmJpoI9RHqXYs75Bnt6FLfQfaL0P/pz57/Mfo4b0mTH82KIqs0=
X-Received: by 2002:a05:620a:2050:: with SMTP id d16mr1309509qka.215.1591936752226;
 Thu, 11 Jun 2020 21:39:12 -0700 (PDT)
MIME-Version: 1.0
References: <1591915305-19739-1-git-send-email-denis@denix.org>
 <CAMKF1srcQ_JGBAe31FAHPgteH7sFD13EbiDy5gxbVEEJcXFbnw@mail.gmail.com>
 <20200611232117.GD17660@denix.org> <CAMKF1spjpBnHcxxR8npTT1-HUGUMuQAKGQ=a9kG3RYuQESVd+A@mail.gmail.com>
 <20200612013035.GE17660@denix.org>
In-Reply-To: <20200612013035.GE17660@denix.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 11 Jun 2020 21:38:59 -0700
Message-ID: <CAMKF1sr2AxW=pqfvdU7M-fKz2xD2+xMtZXaK-9_CL7Js+BpFKA@mail.gmail.com>
Subject: Re: [oe] [PATCH] serialcheck: switch to a fork and update to the latest
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000009f15d705a7dba8e3"

--0000000000009f15d705a7dba8e3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 11, 2020 at 6:30 PM Denys Dmytriyenko <denis@denix.org> wrote:

> On Thu, Jun 11, 2020 at 04:26:51PM -0700, Khem Raj wrote:
> > On Thu, Jun 11, 2020 at 4:21 PM Denys Dmytriyenko <denis@denix.org>
> wrote:
> > >
> > > On Thu, Jun 11, 2020 at 04:14:19PM -0700, Khem Raj wrote:
> > > > On Thu, Jun 11, 2020 at 3:41 PM Denys Dmytriyenko <denis@denix.org>
> wrote:
> > > > >
> > > > > From: Denys Dmytriyenko <denys@ti.com>
> > > > >
> > > > > Original serialcheck at
> https://git.breakpoint.cc/cgit/bigeasy/serialcheck.git/
> > > > > hasn't been updated since early 2015 and has been forked and
> continued at
> > > > > https://github.com/nsekhar/serialcheck
> > > > >
> > > > > Switch to the fork and update to the latest, while dropping merge=
d
> and unneeded
> > > > > patches.
> > > > >
> > > > > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > > > > ---
> > > > >  ...01-Add-option-to-enable-internal-loopback.patch | 81
> ----------------------
> > > > >  .../0001-Makefile-Change-order-of-link-flags.patch | 34 --------=
-
> > > > >  .../0002-Restore-original-loopback-config.patch    | 49
> -------------
> > > > >  .../serialcheck/serialcheck_1.0.0.bb               | 25 +++----
> > > > >  4 files changed, 11 insertions(+), 178 deletions(-)
> > > > >  delete mode 100644
> meta-oe/recipes-devtools/serialcheck/serialcheck/0001-Add-option-to-enabl=
e-internal-loopback.patch
> > > > >  delete mode 100644
> meta-oe/recipes-devtools/serialcheck/serialcheck/0001-Makefile-Change-ord=
er-of-link-flags.patch
> > > > >  delete mode 100644
> meta-oe/recipes-devtools/serialcheck/serialcheck/0002-Restore-original-lo=
opback-config.patch
> > > > >
> > > > > diff --git
> a/meta-oe/recipes-devtools/serialcheck/serialcheck/0001-Add-option-to-ena=
ble-internal-loopback.patch
> b/meta-oe/recipes-devtools/serialcheck/serialcheck/0001-Add-option-to-ena=
ble-internal-loopback.patch
> > > > > deleted file mode 100644
> > > > > index f69254a..0000000
> > > > > ---
> a/meta-oe/recipes-devtools/serialcheck/serialcheck/0001-Add-option-to-ena=
ble-internal-loopback.patch
> > > > > +++ /dev/null
> > > > > @@ -1,81 +0,0 @@
> > > > > -From 059d5512e840fe68e2bb37add6c9208fa9c34d15 Mon Sep 17 00:00:0=
0
> 2001
> > > > > -From: Sekhar Nori <nsekhar@ti.com>
> > > > > -Date: Tue, 24 Feb 2015 22:16:37 +0530
> > > > > -Subject: [PATCH 1/2] Add option to enable internal loopback
> > > > > -
> > > > > -Upstream-status: Pending
> > > > > ----
> > > > > - serialcheck.c | 23 +++++++++++++++++++++++
> > > > > - 1 file changed, 23 insertions(+)
> > > > > -
> > > > > -diff --git a/serialcheck.c b/serialcheck.c
> > > > > -index 4f5b747..4100c37 100644
> > > > > ---- a/serialcheck.c
> > > > > -+++ b/serialcheck.c
> > > > > -@@ -12,6 +12,8 @@
> > > > > - #include <sys/ioctl.h>
> > > > > - #include <linux/serial.h>
> > > > > -
> > > > > -+#define TIOCM_LOOP    0x8000
> > > > > -+
> > > > > - #define __same_type(a, b)
>  __builtin_types_compatible_p(typeof(a), typeof(b))
> > > > > - #define BUILD_BUG_ON_ZERO(e)  (sizeof(struct { int:-!!(e); }))
> > > > > - #define __must_be_array(a)    BUILD_BUG_ON_ZERO(__same_type((a)=
,
> &(a)[0]))
> > > > > -@@ -40,6 +42,7 @@ struct g_opt {
> > > > > -       unsigned char hflow;
> > > > > -       unsigned char do_termios;
> > > > > -       unsigned char *cmp_buff;
> > > > > -+      unsigned char loopback;
> > > > > - };
> > > > > -
> > > > > - /* name, key, arg, flags, doc, group */
> > > > > -@@ -51,6 +54,7 @@ static struct argp_option options[] =3D {
> > > > > -       {"mode",        'm', "M",    0, "transfer mode (d =3D
> duplex, t =3D send r =3D receive)", 0},
> > > > > -       {"loops",       'l', "NUM",  0, "loops to perform (0 =3D>
> wait fot CTRL-C", 0},
> > > > > -       {"no-termios",  'n', NULL,   0, "No termios change (baud
> rate etc. remains unchanged)", 0},
> > > > > -+      {"loopback",    'k', NULL,   0, "loopback mode", 0},
> > > > > -       {NULL, 0, NULL, 0, NULL, 0}
> > > > > - };
> > > > > -
> > > > > -@@ -67,6 +71,7 @@ static error_t parse_opt(int key, char *arg,
> struct argp_state *state)
> > > > > -               go->baudrate =3D 115200;
> > > > > -               go->loops =3D UINT_MAX;
> > > > > -               go->do_termios =3D 1;
> > > > > -+              go->loopback =3D 0;
> > > > > -               break;
> > > > > -       case ARGP_KEY_ARG:
> > > > > -               ret =3D  ARGP_ERR_UNKNOWN;
> > > > > -@@ -113,6 +118,9 @@ static error_t parse_opt(int key, char *arg,
> struct argp_state *state)
> > > > > -               } else
> > > > > -                       go->loops =3D num;
> > > > > -               break;
> > > > > -+      case 'k':
> > > > > -+              go->loopback =3D 1;
> > > > > -+              break;
> > > > > -       default:
> > > > > -               ret =3D ARGP_ERR_UNKNOWN;
> > > > > -       }
> > > > > -@@ -487,6 +495,21 @@ int main(int argc, char *argv[])
> > > > > -                       die("tcflush failed: %m\n");
> > > > > -       }
> > > > > -
> > > > > -+      if (opts.loopback) {
> > > > > -+              unsigned int mcr;
> > > > > -+
> > > > > -+              ret =3D ioctl(fd, TIOCMGET, &mcr);
> > > > > -+              if (ret < 0)
> > > > > -+                      die("mcr get failed: %m\n");
> > > > > -+
> > > > > -+              mcr |=3D TIOCM_LOOP;
> > > > > -+
> > > > > -+              ret =3D ioctl(fd, TIOCMSET, &mcr);
> > > > > -+              if (ret < 0)
> > > > > -+                      die ("mcr set failed: %m\n");
> > > > > -+
> > > > > -+      }
> > > > > -+
> > > > > -       ret =3D fcntl(fd, F_SETFL, 0);
> > > > > -       if (ret)
> > > > > -               printf("Failed to remove nonblock mode\n");
> > > > > ---
> > > > > -1.9.1
> > > > > diff --git
> a/meta-oe/recipes-devtools/serialcheck/serialcheck/0001-Makefile-Change-o=
rder-of-link-flags.patch
> b/meta-oe/recipes-devtools/serialcheck/serialcheck/0001-Makefile-Change-o=
rder-of-link-flags.patch
> > > > > deleted file mode 100644
> > > > > index 2ab4834..0000000
> > > > > ---
> a/meta-oe/recipes-devtools/serialcheck/serialcheck/0001-Makefile-Change-o=
rder-of-link-flags.patch
> > > > > +++ /dev/null
> > > > > @@ -1,34 +0,0 @@
> > > > > -From efc8a4e717ba919c869c2da1c7de2d08bc976926 Mon Sep 17 00:00:0=
0
> 2001
> > > > > -From: Khem Raj <raj.khem@gmail.com>
> > > > > -Date: Wed, 24 Feb 2016 18:48:07 +0000
> > > > > -Subject: [PATCH] Makefile: Change order of link flags
> > > > > -
> > > > > -This helps in injectcting LDFLAGS from env to take effect
> > > > > -as it appears last on cmdline now
> > > > > -
> > > > > -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > > > ----
> > > > > -Upstream-Status: Pending
> > > > > -
> > > > > - Makefile | 10 ++++++++--
> > > > > - 1 file changed, 8 insertions(+), 2 deletions(-)
> > > > > -
> > > > > -diff --git a/Makefile b/Makefile
> > > > > -index ba2bfbb..6d13e68 100644
> > > > > ---- a/Makefile
> > > > > -+++ b/Makefile
> > > > > -@@ -1,3 +1,9 @@
> > > > > --CFLAGS=3D-O2 -Wall -Wextra -g -Wno-sign-compare -Wno-pointer-si=
gn
> > > > > --CC=3Dgcc
> > > > > -+CFLAGS?=3D-O2 -Wall -Wextra -g -Wno-sign-compare -Wno-pointer-s=
ign
> > > > > -+CC?=3Dgcc
> > > > > - all: serialcheck
> > > > > -+serialcheck : serialcheck.o
> > > > > -+      $(CC) -o serialcheck serialcheck.o $(CFLAGS) $(LDFLAGS)
> > > > > -+
> > > > > -+%.o : %.c
> > > > > -+      $(CC) -c $(CFLAGS) $(CPPFLAGS) $< -o $@
> > > > > -+
> > > > > ---
> > > > > -1.9.1
> > > > > -
> > > > > diff --git
> a/meta-oe/recipes-devtools/serialcheck/serialcheck/0002-Restore-original-=
loopback-config.patch
> b/meta-oe/recipes-devtools/serialcheck/serialcheck/0002-Restore-original-=
loopback-config.patch
> > > > > deleted file mode 100644
> > > > > index 1b8c95b..0000000
> > > > > ---
> a/meta-oe/recipes-devtools/serialcheck/serialcheck/0002-Restore-original-=
loopback-config.patch
> > > > > +++ /dev/null
> > > > > @@ -1,49 +0,0 @@
> > > > > -From a6e5813d2f8402bf3a311c8bcda02623bfb76882 Mon Sep 17 00:00:0=
0
> 2001
> > > > > -From: Carlos Hernandez <ceh@ti.com>
> > > > > -Date: Tue, 24 Feb 2015 16:00:34 -0500
> > > > > -Subject: [PATCH 2/2] Restore original loopback config
> > > > > -
> > > > > -If loopback option is enabled, disable it at the end of the test=
.
> > > > > -
> > > > > -Signed-off-by: Carlos Hernandez <ceh@ti.com>
> > > > > -Upstream-status: Pending
> > > > > ----
> > > > > - serialcheck.c | 9 +++++++--
> > > > > - 1 file changed, 7 insertions(+), 2 deletions(-)
> > > > > -
> > > > > -diff --git a/serialcheck.c b/serialcheck.c
> > > > > -index 4100c37..06470f7 100644
> > > > > ---- a/serialcheck.c
> > > > > -+++ b/serialcheck.c
> > > > > -@@ -427,6 +427,7 @@ int main(int argc, char *argv[])
> > > > > -       unsigned char *data;
> > > > > -       unsigned int open_mode;
> > > > > -       off_t data_len;
> > > > > -+      unsigned int mcr;
> > > > > -
> > > > > -       argp_parse(&argp, argc, argv, 0, NULL, &opts);
> > > > > -       if (!opts.file_trans)
> > > > > -@@ -496,8 +497,6 @@ int main(int argc, char *argv[])
> > > > > -       }
> > > > > -
> > > > > -       if (opts.loopback) {
> > > > > --              unsigned int mcr;
> > > > > --
> > > > > -               ret =3D ioctl(fd, TIOCMGET, &mcr);
> > > > > -               if (ret < 0)
> > > > > -                       die("mcr get failed: %m\n");
> > > > > -@@ -535,6 +534,12 @@ int main(int argc, char *argv[])
> > > > > -       ret =3D tcsetattr(fd, TCSAFLUSH, &old_term);
> > > > > -       if (ret)
> > > > > -               printf("tcsetattr() of old ones failed: %m\n");
> > > > > -+      if (opts.loopback) {
> > > > > -+              mcr &=3D ~(TIOCM_LOOP);
> > > > > -+              ret =3D ioctl(fd, TIOCMSET, &mcr);
> > > > > -+      }
> > > > > -+      if (ret)
> > > > > -+              printf("disabling loopback failed: %m\n");
> > > > > -
> > > > > -       close(fd);
> > > > > -       return status;
> > > > > ---
> > > > > -1.9.1
> > > > > diff --git a/meta-oe/recipes-devtools/serialcheck/
> serialcheck_1.0.0.bb b/meta-oe/recipes-devtools/serialcheck/
> serialcheck_1.0.0.bb
> > > > > index cd5e0a4..0ec96ab 100644
> > > > > --- a/meta-oe/recipes-devtools/serialcheck/serialcheck_1.0.0.bb
> > > > > +++ b/meta-oe/recipes-devtools/serialcheck/serialcheck_1.0.0.bb
> > > > > @@ -1,30 +1,27 @@
> > > > >  SUMMARY =3D "Application to verify operation of serial ports"
> > > > > -HOMEPAGE =3D "
> http://git.breakpoint.cc/cgit/bigeasy/serialcheck.git/"
> > > > > +HOMEPAGE =3D "https://github.com/nsekhar/serialcheck"
> > > > >  LICENSE =3D "GPLv2"
> > > > >  LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263"
> > > > >
> > > > > -SRC_URI =3D "git://git.breakpoint.cc/bigeasy/serialcheck.git \
> > > > > -
>  file://0001-Add-option-to-enable-internal-loopback.patch \
> > > > > -           file://0002-Restore-original-loopback-config.patch \
> > > > > -           file://0001-Makefile-Change-order-of-link-flags.patch=
 \
> > > > > -           "
> > > > > +SRC_URI =3D " \
> > > > > +    git://github.com/nsekhar/serialcheck.git \
> > > > > +"
> > > > >
> > > > > -SRCREV =3D "63854a2d0c0129efab132ec328a75279e013fb84"
> > > > > +SRCREV =3D "45eb2ffa5378396e85432872833890b0a1cba872"
> > > > >
> > > > >  S =3D "${WORKDIR}/git"
> > > > >
> > > > > -DEPENDS_append_libc-musl =3D " argp-standalone"
> > > > > -EXTRA_OEMAKE =3D "-e MAKEFLAGS=3D"
> > > > > +inherit autotools
> > > > >
> > > > > -CFLAGS_prepend =3D "-Wall -Wextra -Wno-sign-compare
> -Wno-pointer-sign "
> > > > > -LDFLAGS_append_libc-musl =3D " -largp"
> > > > > +DEPENDS_append_libc-musl =3D " argp-standalone"
> > > > > +EXTRA_OEMAKE_append_libc-musl =3D " LIBS=3D'-largp'"
> > > > >
> > > > >  do_install() {
> > > > >      install -d ${D}${bindir}
> > > > > -    install ${S}/serialcheck ${D}${bindir}
> > > > > +    install ${B}/serialcheck ${D}${bindir}
> > > > > +    install ${B}/serialstats ${D}${bindir}
> > > >
> > > > should this be packaged into a package of its own ?
> > >
> > > I don't see why - do you have any specific reason in mind?
> >
> > for size reasons,  we have seen that size with upgrades grow and if we
> > can keep a check
> > on while it happens will help end users. So this sounded like an
> > additional binary which perhaps
> > could live on its own.
>
> ARMv7 builds:
> glibc sizes - serialcheck is 10 KB, serialstats is 5 KB
> musl sizes - serialcheck is 26 KB, serialstats is 22 KB
>
> musl is larger because of static argp library


Perhaps it=E2=80=99s small enough to be ignored I see

>
>

--0000000000009f15d705a7dba8e3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Jun 11, 2020 at 6:30 PM Denys Dmytriyenko &lt;<a hr=
ef=3D"mailto:denis@denix.org">denis@denix.org</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-=
width:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(20=
4,204,204)">On Thu, Jun 11, 2020 at 04:26:51PM -0700, Khem Raj wrote:<br>
&gt; On Thu, Jun 11, 2020 at 4:21 PM Denys Dmytriyenko &lt;<a href=3D"mailt=
o:denis@denix.org" target=3D"_blank">denis@denix.org</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; On Thu, Jun 11, 2020 at 04:14:19PM -0700, Khem Raj wrote:<br>
&gt; &gt; &gt; On Thu, Jun 11, 2020 at 3:41 PM Denys Dmytriyenko &lt;<a hre=
f=3D"mailto:denis@denix.org" target=3D"_blank">denis@denix.org</a>&gt; wrot=
e:<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; From: Denys Dmytriyenko &lt;<a href=3D"mailto:denys@ti.=
com" target=3D"_blank">denys@ti.com</a>&gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Original serialcheck at <a href=3D"https://git.breakpoi=
nt.cc/cgit/bigeasy/serialcheck.git/" rel=3D"noreferrer" target=3D"_blank">h=
ttps://git.breakpoint.cc/cgit/bigeasy/serialcheck.git/</a><br>
&gt; &gt; &gt; &gt; hasn&#39;t been updated since early 2015 and has been f=
orked and continued at<br>
&gt; &gt; &gt; &gt; <a href=3D"https://github.com/nsekhar/serialcheck" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/nsekhar/serialcheck</a=
><br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Switch to the fork and update to the latest, while drop=
ping merged and unneeded<br>
&gt; &gt; &gt; &gt; patches.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Signed-off-by: Denys Dmytriyenko &lt;<a href=3D"mailto:=
denys@ti.com" target=3D"_blank">denys@ti.com</a>&gt;<br>
&gt; &gt; &gt; &gt; ---<br>
&gt; &gt; &gt; &gt;=C2=A0 ...01-Add-option-to-enable-internal-loopback.patc=
h | 81 ----------------------<br>
&gt; &gt; &gt; &gt;=C2=A0 .../0001-Makefile-Change-order-of-link-flags.patc=
h | 34 ---------<br>
&gt; &gt; &gt; &gt;=C2=A0 .../0002-Restore-original-loopback-config.patch=
=C2=A0 =C2=A0 | 49 -------------<br>
&gt; &gt; &gt; &gt;=C2=A0 .../serialcheck/<a href=3D"http://serialcheck_1.0=
.0.bb" rel=3D"noreferrer" target=3D"_blank">serialcheck_1.0.0.bb</a>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 25 +++----<br>
&gt; &gt; &gt; &gt;=C2=A0 4 files changed, 11 insertions(+), 178 deletions(=
-)<br>
&gt; &gt; &gt; &gt;=C2=A0 delete mode 100644 meta-oe/recipes-devtools/seria=
lcheck/serialcheck/0001-Add-option-to-enable-internal-loopback.patch<br>
&gt; &gt; &gt; &gt;=C2=A0 delete mode 100644 meta-oe/recipes-devtools/seria=
lcheck/serialcheck/0001-Makefile-Change-order-of-link-flags.patch<br>
&gt; &gt; &gt; &gt;=C2=A0 delete mode 100644 meta-oe/recipes-devtools/seria=
lcheck/serialcheck/0002-Restore-original-loopback-config.patch<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; diff --git a/meta-oe/recipes-devtools/serialcheck/seria=
lcheck/0001-Add-option-to-enable-internal-loopback.patch b/meta-oe/recipes-=
devtools/serialcheck/serialcheck/0001-Add-option-to-enable-internal-loopbac=
k.patch<br>
&gt; &gt; &gt; &gt; deleted file mode 100644<br>
&gt; &gt; &gt; &gt; index f69254a..0000000<br>
&gt; &gt; &gt; &gt; --- a/meta-oe/recipes-devtools/serialcheck/serialcheck/=
0001-Add-option-to-enable-internal-loopback.patch<br>
&gt; &gt; &gt; &gt; +++ /dev/null<br>
&gt; &gt; &gt; &gt; @@ -1,81 +0,0 @@<br>
&gt; &gt; &gt; &gt; -From 059d5512e840fe68e2bb37add6c9208fa9c34d15 Mon Sep =
17 00:00:00 2001<br>
&gt; &gt; &gt; &gt; -From: Sekhar Nori &lt;<a href=3D"mailto:nsekhar@ti.com=
" target=3D"_blank">nsekhar@ti.com</a>&gt;<br>
&gt; &gt; &gt; &gt; -Date: Tue, 24 Feb 2015 22:16:37 +0530<br>
&gt; &gt; &gt; &gt; -Subject: [PATCH 1/2] Add option to enable internal loo=
pback<br>
&gt; &gt; &gt; &gt; -<br>
&gt; &gt; &gt; &gt; -Upstream-status: Pending<br>
&gt; &gt; &gt; &gt; ----<br>
&gt; &gt; &gt; &gt; - serialcheck.c | 23 +++++++++++++++++++++++<br>
&gt; &gt; &gt; &gt; - 1 file changed, 23 insertions(+)<br>
&gt; &gt; &gt; &gt; -<br>
&gt; &gt; &gt; &gt; -diff --git a/serialcheck.c b/serialcheck.c<br>
&gt; &gt; &gt; &gt; -index 4f5b747..4100c37 100644<br>
&gt; &gt; &gt; &gt; ---- a/serialcheck.c<br>
&gt; &gt; &gt; &gt; -+++ b/serialcheck.c<br>
&gt; &gt; &gt; &gt; -@@ -12,6 +12,8 @@<br>
&gt; &gt; &gt; &gt; - #include &lt;sys/ioctl.h&gt;<br>
&gt; &gt; &gt; &gt; - #include &lt;linux/serial.h&gt;<br>
&gt; &gt; &gt; &gt; -<br>
&gt; &gt; &gt; &gt; -+#define TIOCM_LOOP=C2=A0 =C2=A0 0x8000<br>
&gt; &gt; &gt; &gt; -+<br>
&gt; &gt; &gt; &gt; - #define __same_type(a, b)=C2=A0 =C2=A0 =C2=A0__builti=
n_types_compatible_p(typeof(a), typeof(b))<br>
&gt; &gt; &gt; &gt; - #define BUILD_BUG_ON_ZERO(e)=C2=A0 (sizeof(struct { i=
nt:-!!(e); }))<br>
&gt; &gt; &gt; &gt; - #define __must_be_array(a)=C2=A0 =C2=A0 BUILD_BUG_ON_=
ZERO(__same_type((a), &amp;(a)[0]))<br>
&gt; &gt; &gt; &gt; -@@ -40,6 +42,7 @@ struct g_opt {<br>
&gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned char hflow;<br>
&gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned char do_termios;<b=
r>
&gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned char *cmp_buff;<br=
>
&gt; &gt; &gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 unsigned char loopback;<br>
&gt; &gt; &gt; &gt; - };<br>
&gt; &gt; &gt; &gt; -<br>
&gt; &gt; &gt; &gt; - /* name, key, arg, flags, doc, group */<br>
&gt; &gt; &gt; &gt; -@@ -51,6 +54,7 @@ static struct argp_option options[] =
=3D {<br>
&gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;mode&quot;,=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 &#39;m&#39;, &quot;M&quot;,=C2=A0 =C2=A0 0, &quot;tran=
sfer mode (d =3D duplex, t =3D send r =3D receive)&quot;, 0},<br>
&gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;loops&quot;,=C2=A0 =
=C2=A0 =C2=A0 =C2=A0&#39;l&#39;, &quot;NUM&quot;,=C2=A0 0, &quot;loops to p=
erform (0 =3D&gt; wait fot CTRL-C&quot;, 0},<br>
&gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;no-termios&quot;,=C2=
=A0 &#39;n&#39;, NULL,=C2=A0 =C2=A00, &quot;No termios change (baud rate et=
c. remains unchanged)&quot;, 0},<br>
&gt; &gt; &gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 {&quot;loopback&quot;,=C2=A0 =C2=
=A0 &#39;k&#39;, NULL,=C2=A0 =C2=A00, &quot;loopback mode&quot;, 0},<br>
&gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0{NULL, 0, NULL, 0, NULL, 0}=
<br>
&gt; &gt; &gt; &gt; - };<br>
&gt; &gt; &gt; &gt; -<br>
&gt; &gt; &gt; &gt; -@@ -67,6 +71,7 @@ static error_t parse_opt(int key, ch=
ar *arg, struct argp_state *state)<br>
&gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0go-&gt;baudrate =3D 115200;<br>
&gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0go-&gt;loops =3D UINT_MAX;<br>
&gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0go-&gt;do_termios =3D 1;<br>
&gt; &gt; &gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 go-&=
gt;loopback =3D 0;<br>
&gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0break;<br>
&gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0case ARGP_KEY_ARG:<br>
&gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0ret =3D=C2=A0 ARGP_ERR_UNKNOWN;<br>
&gt; &gt; &gt; &gt; -@@ -113,6 +118,9 @@ static error_t parse_opt(int key, =
char *arg, struct argp_state *state)<br>
&gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0} else<br>
&gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0go-&gt;loops =3D num;<br>
&gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0break;<br>
&gt; &gt; &gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 case &#39;k&#39;:<br>
&gt; &gt; &gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 go-&=
gt;loopback =3D 1;<br>
&gt; &gt; &gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 brea=
k;<br>
&gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
&gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0ret =3D ARGP_ERR_UNKNOWN;<br>
&gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; &gt; &gt; -@@ -487,6 +495,21 @@ int main(int argc, char *argv[])<=
br>
&gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0die(&quot;tcflush failed: %m\n&quot;);<br>
&gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; &gt; &gt; -<br>
&gt; &gt; &gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 if (opts.loopback) {<br>
&gt; &gt; &gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsi=
gned int mcr;<br>
&gt; &gt; &gt; &gt; -+<br>
&gt; &gt; &gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =
=3D ioctl(fd, TIOCMGET, &amp;mcr);<br>
&gt; &gt; &gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (=
ret &lt; 0)<br>
&gt; &gt; &gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 die(&quot;mcr get failed: %m\n&quot;);<br>
&gt; &gt; &gt; &gt; -+<br>
&gt; &gt; &gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mcr =
|=3D TIOCM_LOOP;<br>
&gt; &gt; &gt; &gt; -+<br>
&gt; &gt; &gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =
=3D ioctl(fd, TIOCMSET, &amp;mcr);<br>
&gt; &gt; &gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (=
ret &lt; 0)<br>
&gt; &gt; &gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 die (&quot;mcr set failed: %m\n&quot;);<br>
&gt; &gt; &gt; &gt; -+<br>
&gt; &gt; &gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; &gt; &gt; -+<br>
&gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D fcntl(fd, F_SETFL, =
0);<br>
&gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
&gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0printf(&quot;Failed to remove nonblock mode\n&quot;);<br>
&gt; &gt; &gt; &gt; ---<br>
&gt; &gt; &gt; &gt; -1.9.1<br>
&gt; &gt; &gt; &gt; diff --git a/meta-oe/recipes-devtools/serialcheck/seria=
lcheck/0001-Makefile-Change-order-of-link-flags.patch b/meta-oe/recipes-dev=
tools/serialcheck/serialcheck/0001-Makefile-Change-order-of-link-flags.patc=
h<br>
&gt; &gt; &gt; &gt; deleted file mode 100644<br>
&gt; &gt; &gt; &gt; index 2ab4834..0000000<br>
&gt; &gt; &gt; &gt; --- a/meta-oe/recipes-devtools/serialcheck/serialcheck/=
0001-Makefile-Change-order-of-link-flags.patch<br>
&gt; &gt; &gt; &gt; +++ /dev/null<br>
&gt; &gt; &gt; &gt; @@ -1,34 +0,0 @@<br>
&gt; &gt; &gt; &gt; -From efc8a4e717ba919c869c2da1c7de2d08bc976926 Mon Sep =
17 00:00:00 2001<br>
&gt; &gt; &gt; &gt; -From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.co=
m" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; &gt; &gt; &gt; -Date: Wed, 24 Feb 2016 18:48:07 +0000<br>
&gt; &gt; &gt; &gt; -Subject: [PATCH] Makefile: Change order of link flags<=
br>
&gt; &gt; &gt; &gt; -<br>
&gt; &gt; &gt; &gt; -This helps in injectcting LDFLAGS from env to take eff=
ect<br>
&gt; &gt; &gt; &gt; -as it appears last on cmdline now<br>
&gt; &gt; &gt; &gt; -<br>
&gt; &gt; &gt; &gt; -Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem=
@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; &gt; &gt; &gt; ----<br>
&gt; &gt; &gt; &gt; -Upstream-Status: Pending<br>
&gt; &gt; &gt; &gt; -<br>
&gt; &gt; &gt; &gt; - Makefile | 10 ++++++++--<br>
&gt; &gt; &gt; &gt; - 1 file changed, 8 insertions(+), 2 deletions(-)<br>
&gt; &gt; &gt; &gt; -<br>
&gt; &gt; &gt; &gt; -diff --git a/Makefile b/Makefile<br>
&gt; &gt; &gt; &gt; -index ba2bfbb..6d13e68 100644<br>
&gt; &gt; &gt; &gt; ---- a/Makefile<br>
&gt; &gt; &gt; &gt; -+++ b/Makefile<br>
&gt; &gt; &gt; &gt; -@@ -1,3 +1,9 @@<br>
&gt; &gt; &gt; &gt; --CFLAGS=3D-O2 -Wall -Wextra -g -Wno-sign-compare -Wno-=
pointer-sign<br>
&gt; &gt; &gt; &gt; --CC=3Dgcc<br>
&gt; &gt; &gt; &gt; -+CFLAGS?=3D-O2 -Wall -Wextra -g -Wno-sign-compare -Wno=
-pointer-sign<br>
&gt; &gt; &gt; &gt; -+CC?=3Dgcc<br>
&gt; &gt; &gt; &gt; - all: serialcheck<br>
&gt; &gt; &gt; &gt; -+serialcheck : serialcheck.o<br>
&gt; &gt; &gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 $(CC) -o serialcheck serialcheck=
.o $(CFLAGS) $(LDFLAGS)<br>
&gt; &gt; &gt; &gt; -+<br>
&gt; &gt; &gt; &gt; -+%.o : %.c<br>
&gt; &gt; &gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 $(CC) -c $(CFLAGS) $(CPPFLAGS) $=
&lt; -o $@<br>
&gt; &gt; &gt; &gt; -+<br>
&gt; &gt; &gt; &gt; ---<br>
&gt; &gt; &gt; &gt; -1.9.1<br>
&gt; &gt; &gt; &gt; -<br>
&gt; &gt; &gt; &gt; diff --git a/meta-oe/recipes-devtools/serialcheck/seria=
lcheck/0002-Restore-original-loopback-config.patch b/meta-oe/recipes-devtoo=
ls/serialcheck/serialcheck/0002-Restore-original-loopback-config.patch<br>
&gt; &gt; &gt; &gt; deleted file mode 100644<br>
&gt; &gt; &gt; &gt; index 1b8c95b..0000000<br>
&gt; &gt; &gt; &gt; --- a/meta-oe/recipes-devtools/serialcheck/serialcheck/=
0002-Restore-original-loopback-config.patch<br>
&gt; &gt; &gt; &gt; +++ /dev/null<br>
&gt; &gt; &gt; &gt; @@ -1,49 +0,0 @@<br>
&gt; &gt; &gt; &gt; -From a6e5813d2f8402bf3a311c8bcda02623bfb76882 Mon Sep =
17 00:00:00 2001<br>
&gt; &gt; &gt; &gt; -From: Carlos Hernandez &lt;<a href=3D"mailto:ceh@ti.co=
m" target=3D"_blank">ceh@ti.com</a>&gt;<br>
&gt; &gt; &gt; &gt; -Date: Tue, 24 Feb 2015 16:00:34 -0500<br>
&gt; &gt; &gt; &gt; -Subject: [PATCH 2/2] Restore original loopback config<=
br>
&gt; &gt; &gt; &gt; -<br>
&gt; &gt; &gt; &gt; -If loopback option is enabled, disable it at the end o=
f the test.<br>
&gt; &gt; &gt; &gt; -<br>
&gt; &gt; &gt; &gt; -Signed-off-by: Carlos Hernandez &lt;<a href=3D"mailto:=
ceh@ti.com" target=3D"_blank">ceh@ti.com</a>&gt;<br>
&gt; &gt; &gt; &gt; -Upstream-status: Pending<br>
&gt; &gt; &gt; &gt; ----<br>
&gt; &gt; &gt; &gt; - serialcheck.c | 9 +++++++--<br>
&gt; &gt; &gt; &gt; - 1 file changed, 7 insertions(+), 2 deletions(-)<br>
&gt; &gt; &gt; &gt; -<br>
&gt; &gt; &gt; &gt; -diff --git a/serialcheck.c b/serialcheck.c<br>
&gt; &gt; &gt; &gt; -index 4100c37..06470f7 100644<br>
&gt; &gt; &gt; &gt; ---- a/serialcheck.c<br>
&gt; &gt; &gt; &gt; -+++ b/serialcheck.c<br>
&gt; &gt; &gt; &gt; -@@ -427,6 +427,7 @@ int main(int argc, char *argv[])<b=
r>
&gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned char *data;<br>
&gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int open_mode;<br>
&gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0off_t data_len;<br>
&gt; &gt; &gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 unsigned int mcr;<br>
&gt; &gt; &gt; &gt; -<br>
&gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0argp_parse(&amp;argp, argc,=
 argv, 0, NULL, &amp;opts);<br>
&gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!opts.file_trans)<br>
&gt; &gt; &gt; &gt; -@@ -496,8 +497,6 @@ int main(int argc, char *argv[])<b=
r>
&gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; &gt; &gt; -<br>
&gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (opts.loopback) {<br>
&gt; &gt; &gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsi=
gned int mcr;<br>
&gt; &gt; &gt; &gt; --<br>
&gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0ret =3D ioctl(fd, TIOCMGET, &amp;mcr);<br>
&gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0if (ret &lt; 0)<br>
&gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0die(&quot;mcr get failed: %m\n&quot;);<br>
&gt; &gt; &gt; &gt; -@@ -535,6 +534,12 @@ int main(int argc, char *argv[])<=
br>
&gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D tcsetattr(fd, TCSAF=
LUSH, &amp;old_term);<br>
&gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
&gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0printf(&quot;tcsetattr() of old ones failed: %m\n&quot;);<br>
&gt; &gt; &gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 if (opts.loopback) {<br>
&gt; &gt; &gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mcr =
&amp;=3D ~(TIOCM_LOOP);<br>
&gt; &gt; &gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =
=3D ioctl(fd, TIOCMSET, &amp;mcr);<br>
&gt; &gt; &gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; &gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 if (ret)<br>
&gt; &gt; &gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prin=
tf(&quot;disabling loopback failed: %m\n&quot;);<br>
&gt; &gt; &gt; &gt; -<br>
&gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0close(fd);<br>
&gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return status;<br>
&gt; &gt; &gt; &gt; ---<br>
&gt; &gt; &gt; &gt; -1.9.1<br>
&gt; &gt; &gt; &gt; diff --git a/meta-oe/recipes-devtools/serialcheck/<a hr=
ef=3D"http://serialcheck_1.0.0.bb" rel=3D"noreferrer" target=3D"_blank">ser=
ialcheck_1.0.0.bb</a> b/meta-oe/recipes-devtools/serialcheck/<a href=3D"htt=
p://serialcheck_1.0.0.bb" rel=3D"noreferrer" target=3D"_blank">serialcheck_=
1.0.0.bb</a><br>
&gt; &gt; &gt; &gt; index cd5e0a4..0ec96ab 100644<br>
&gt; &gt; &gt; &gt; --- a/meta-oe/recipes-devtools/serialcheck/<a href=3D"h=
ttp://serialcheck_1.0.0.bb" rel=3D"noreferrer" target=3D"_blank">serialchec=
k_1.0.0.bb</a><br>
&gt; &gt; &gt; &gt; +++ b/meta-oe/recipes-devtools/serialcheck/<a href=3D"h=
ttp://serialcheck_1.0.0.bb" rel=3D"noreferrer" target=3D"_blank">serialchec=
k_1.0.0.bb</a><br>
&gt; &gt; &gt; &gt; @@ -1,30 +1,27 @@<br>
&gt; &gt; &gt; &gt;=C2=A0 SUMMARY =3D &quot;Application to verify operation=
 of serial ports&quot;<br>
&gt; &gt; &gt; &gt; -HOMEPAGE =3D &quot;<a href=3D"http://git.breakpoint.cc=
/cgit/bigeasy/serialcheck.git/" rel=3D"noreferrer" target=3D"_blank">http:/=
/git.breakpoint.cc/cgit/bigeasy/serialcheck.git/</a>&quot;<br>
&gt; &gt; &gt; &gt; +HOMEPAGE =3D &quot;<a href=3D"https://github.com/nsekh=
ar/serialcheck" rel=3D"noreferrer" target=3D"_blank">https://github.com/nse=
khar/serialcheck</a>&quot;<br>
&gt; &gt; &gt; &gt;=C2=A0 LICENSE =3D &quot;GPLv2&quot;<br>
&gt; &gt; &gt; &gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Db=
234ee4d69f5fce4486a80fdaf4a4263&quot;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; -SRC_URI =3D &quot;git://<a href=3D"http://git.breakpoi=
nt.cc/bigeasy/serialcheck.git" rel=3D"noreferrer" target=3D"_blank">git.bre=
akpoint.cc/bigeasy/serialcheck.git</a> \<br>
&gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-A=
dd-option-to-enable-internal-loopback.patch \<br>
&gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-R=
estore-original-loopback-config.patch \<br>
&gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-M=
akefile-Change-order-of-link-flags.patch \<br>
&gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt; &gt; &gt; &gt; +SRC_URI =3D &quot; \<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 git://<a href=3D"http://github.com/nsekh=
ar/serialcheck.git" rel=3D"noreferrer" target=3D"_blank">github.com/nsekhar=
/serialcheck.git</a> \<br>
&gt; &gt; &gt; &gt; +&quot;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; -SRCREV =3D &quot;63854a2d0c0129efab132ec328a75279e013f=
b84&quot;<br>
&gt; &gt; &gt; &gt; +SRCREV =3D &quot;45eb2ffa5378396e85432872833890b0a1cba=
872&quot;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;=C2=A0 S =3D &quot;${WORKDIR}/git&quot;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; -DEPENDS_append_libc-musl =3D &quot; argp-standalone&qu=
ot;<br>
&gt; &gt; &gt; &gt; -EXTRA_OEMAKE =3D &quot;-e MAKEFLAGS=3D&quot;<br>
&gt; &gt; &gt; &gt; +inherit autotools<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; -CFLAGS_prepend =3D &quot;-Wall -Wextra -Wno-sign-compa=
re -Wno-pointer-sign &quot;<br>
&gt; &gt; &gt; &gt; -LDFLAGS_append_libc-musl =3D &quot; -largp&quot;<br>
&gt; &gt; &gt; &gt; +DEPENDS_append_libc-musl =3D &quot; argp-standalone&qu=
ot;<br>
&gt; &gt; &gt; &gt; +EXTRA_OEMAKE_append_libc-musl =3D &quot; LIBS=3D&#39;-=
largp&#39;&quot;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;=C2=A0 do_install() {<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 install -d ${D}${bindir}<br>
&gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 install ${S}/serialcheck ${D}${bindir}<b=
r>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 install ${B}/serialcheck ${D}${bindir}<b=
r>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 install ${B}/serialstats ${D}${bindir}<b=
r>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; should this be packaged into a package of its own ?<br>
&gt; &gt;<br>
&gt; &gt; I don&#39;t see why - do you have any specific reason in mind?<br=
>
&gt; <br>
&gt; for size reasons,=C2=A0 we have seen that size with upgrades grow and =
if we<br>
&gt; can keep a check<br>
&gt; on while it happens will help end users. So this sounded like an<br>
&gt; additional binary which perhaps<br>
&gt; could live on its own.<br>
<br>
ARMv7 builds:<br>
glibc sizes - serialcheck is 10 KB, serialstats is 5 KB<br>
musl sizes - serialcheck is 26 KB, serialstats is 22 KB<br>
<br>
musl is larger because of static argp library</blockquote><div dir=3D"auto"=
><br></div><div dir=3D"auto">Perhaps it=E2=80=99s small enough to be ignore=
d I see=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;=
border-left-color:rgb(204,204,204)"><br>
</blockquote></div></div>

--0000000000009f15d705a7dba8e3--
