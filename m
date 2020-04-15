Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com [209.85.160.194])
 by mx.groups.io with SMTP id smtpd.web12.7199.1586917642027203111
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Apr 2020 19:27:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Egd94Gn2;
 spf=pass (domain: gmail.com, ip: 209.85.160.194, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f194.google.com with SMTP id w29so11689024qtv.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2020 19:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=oIFPtSvXK3QJMDZ6UUHGL/Gcc6ON8AEzdNa28yqBBGg=;
        b=Egd94Gn2tdIm3sHcUs0y3L5LGzaqjdItfbCBtKPbIgcu9wv3ZMtohUjGVmQl/+gp5P
         taqo6RTjlxR6TeXaWFI6reaQP+qOC8UVyQM/ba2i8uvFHSp7yJR4nBCUTv7nbRsGHGQz
         LQsgv2E7Foh4FpjgcWI1HeBDaDTN2srZZFQTgAHsKR3UgV5vgqp2XgKpQNi5RcjrlF4c
         UiJdOPiGxfTTZwG2vNnR9lRP0qKfcWQYa4zCty8nUGHkcLuOwsoCca3khzcJnaCJe4+k
         9Qvy7q70aEpDzx9v7n2VTdLKYDVudE1a50AxTUcS8LyBA8XbAlRFVgUNu6pO2Rno+79I
         NTZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=oIFPtSvXK3QJMDZ6UUHGL/Gcc6ON8AEzdNa28yqBBGg=;
        b=f2xMPW6RIr6+gDNRwJuPeNRWDvYQ5W04kFc2W8G7JWB1QhG9DubRKjCEdeXw9rnAxk
         Mhd3YuIuxIKJAggpLHVjOdI3XjMYG4aVFNfKH4XTJLi5H+hA4cFkHEImi9fF3IlffCqK
         sDHgP8s0Dn19JfjJn6cNA1WBxH3/WoEiuOtmKrj8hQUxo80ysv2CX9tM105VmQBsK+mA
         lcnJ1aATcSKnC+8A4FRNWxSvpdcV8Nrn0Ta+48O6wEtIMy6GbA7UlwfQn9pfEmUrpxwZ
         8r6KAmr4fjZdy4Di6Hrdos4h0dQypVGSoZetds3hl2ZvPRHmVATGuUKLlCxHYjnrKK8X
         l4Zg==
X-Gm-Message-State: AGi0PubE9QDGfqE0VvT6zRqP+gQHMW+l1pQtOr4vZZN5SPUr8m0B9Dnx
	UMYe2IqEe0Z5+EKVManW5S5MaczV33nJsvbW1Lg=
X-Google-Smtp-Source: APiQypIwtPAks6nimIirxf77sosB91BC34sfFQENHdemHBC0L+X3XRhQimziUFxqujQ0BfF6a+KYbnKY3ZWjsShwrFI=
X-Received: by 2002:ac8:4e92:: with SMTP id 18mr12586079qtp.316.1586917640824;
 Tue, 14 Apr 2020 19:27:20 -0700 (PDT)
MIME-Version: 1.0
References: <1586939501-29659-1-git-send-email-wangmy@cn.fujitsu.com>
In-Reply-To: <1586939501-29659-1-git-send-email-wangmy@cn.fujitsu.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 14 Apr 2020 19:26:54 -0700
Message-ID: <CAMKF1srAggnr8G5k2CvOfEYekBKmvtFiiSkC3gFGJORSDLPKNQ@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH] proftpd: upgrade 1.3.6 -> 1.3.7rc3
To: Wang Mingyu <wangmy@cn.fujitsu.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 14, 2020 at 6:50 PM Wang Mingyu <wangmy@cn.fujitsu.com> wrote:
>
> refresh the following patches:
> build_fixup.patch
> contrib.patch
>

I am a bit reluctant to take RC versions. Can you justify why we
should upgrade to RC in this case ?

> Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
> ---
>  .../proftpd/files/build_fixup.patch           | 75 +++++++++----------
>  .../proftpd/files/contrib.patch               | 29 +++----
>  .../{proftpd_1.3.6.bb =3D> proftpd_1.3.7rc3.bb} |  4 +-
>  3 files changed, 52 insertions(+), 56 deletions(-)
>  rename meta-networking/recipes-daemons/proftpd/{proftpd_1.3.6.bb =3D> p=
roftpd_1.3.7rc3.bb} (97%)
>
> diff --git a/meta-networking/recipes-daemons/proftpd/files/build_fixup.p=
atch b/meta-networking/recipes-daemons/proftpd/files/build_fixup.patch
> index 9816d4d22..9f45a1c2f 100644
> --- a/meta-networking/recipes-daemons/proftpd/files/build_fixup.patch
> +++ b/meta-networking/recipes-daemons/proftpd/files/build_fixup.patch
> @@ -7,12 +7,17 @@ move pidfile to /var/run
>  redefine PR_RUN_DIR as ${localstatedir}/run
>
>  Signed-off-By: Armin Kuster <akuster808@gmail.com>
> +---
> + Make.rules.in | 6 +++---
> + Makefile.in   | 6 ++----
> + configure     | 4 ++--
> + configure.in  | 4 ++--
> + 4 files changed, 9 insertions(+), 11 deletions(-)
>
> -
> -Index: proftpd-1.3.6/Make.rules.in
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- proftpd-1.3.6.orig/Make.rules.in
> -+++ proftpd-1.3.6/Make.rules.in
> +diff --git a/Make.rules.in b/Make.rules.in
> +index a5028ac..ccd7807 100644
> +--- a/Make.rules.in
> ++++ b/Make.rules.in
>  @@ -30,9 +30,9 @@ INSTALL=3D@INSTALL@
>   INSTALL_STRIP=3D@INSTALL_STRIP@
>   INSTALL_USER=3D@install_user@
> @@ -26,10 +31,10 @@ Index: proftpd-1.3.6/Make.rules.in
>
>   RM=3Drm -f
>   SHELL=3D@CONFIG_SHELL@
> -Index: proftpd-1.3.6/Makefile.in
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- proftpd-1.3.6.orig/Makefile.in
> -+++ proftpd-1.3.6/Makefile.in
> +diff --git a/Makefile.in b/Makefile.in
> +index abacc9f..be22353 100644
> +--- a/Makefile.in
> ++++ b/Makefile.in
>  @@ -105,7 +105,6 @@ check: proftpd$(EXEEXT)
>   $(DESTDIR)$(localedir) $(DESTDIR)$(includedir) $(DESTDIR)$(includedir)=
/proftpd $(DESTDIR)$(libdir) $(DESTDIR)$(pkgconfigdir) $(DESTDIR)$(libdir)/=
proftpd $(DESTDIR)$(libexecdir) $(DESTDIR)$(localstatedir) $(DESTDIR)$(sysc=
onfdir) $(DESTDIR)$(bindir) $(DESTDIR)$(sbindir) $(DESTDIR)$(mandir) $(DEST=
DIR)$(mandir)/man1 $(DESTDIR)$(mandir)/man5 $(DESTDIR)$(mandir)/man8:
>         @if [ ! -d $@ ]; then \
> @@ -38,19 +43,19 @@ Index: proftpd-1.3.6/Makefile.in
>                 chmod 0755 $@; \
>         fi
>
> -@@ -115,7 +114,6 @@ install-proftpd: proftpd $(DESTDIR)$(inc
> +@@ -115,7 +114,6 @@ install-proftpd: proftpd$(EXEEXT) $(DESTDIR)$(inclu=
dedir) $(DESTDIR)$(localstate
>                 rm -f $(DESTDIR)$(sbindir)/in.proftpd ; \
>         fi
> -       ln -s proftpd $(DESTDIR)$(sbindir)/in.proftpd
> +       ln -s $(top_builddir)/proftpd $(DESTDIR)$(sbindir)/in.proftpd
>  -      -chown -h $(INSTALL_USER):$(INSTALL_GROUP) $(DESTDIR)$(sbindir)/=
in.proftpd
>
>   install-libs: $(DESTDIR)$(libdir)/proftpd
>         cd lib/ && $(MAKE) install
> -@@ -152,11 +150,11 @@ install-utils: $(DESTDIR)$(sbindir) $(DE
> -       $(INSTALL_SBIN) ftpshut  $(DESTDIR)$(sbindir)/ftpshut
> -       $(INSTALL_BIN)  ftptop   $(DESTDIR)$(bindir)/ftptop
> -       $(INSTALL_BIN)  ftpwho   $(DESTDIR)$(bindir)/ftpwho
> --      $(INSTALL) -o $(INSTALL_USER) -g $(INSTALL_GROUP) -m 0755 src/pr=
xs $(DESTDIR)$(bindir)/prxs
> +@@ -152,11 +150,11 @@ install-utils: $(DESTDIR)$(sbindir) $(DESTDIR)$(b=
indir)
> +       $(INSTALL_SBIN) $(top_builddir)/ftpshut  $(DESTDIR)$(sbindir)/ft=
pshut
> +       $(INSTALL_BIN)  $(top_builddir)/ftptop   $(DESTDIR)$(bindir)/ftp=
top
> +       $(INSTALL_BIN)  $(top_builddir)/ftpwho   $(DESTDIR)$(bindir)/ftp=
who
> +-      $(INSTALL) -o $(INSTALL_USER) -g $(INSTALL_GROUP) -m 0755 $(top_=
builddir)/src/prxs $(DESTDIR)$(bindir)/prxs
>  +      $(INSTALL) -m 0755 src/prxs $(DESTDIR)$(bindir)/prxs
>
>   install-conf: $(DESTDIR)$(sysconfdir)
> @@ -60,11 +65,11 @@ Index: proftpd-1.3.6/Makefile.in
>                            $(top_srcdir)/sample-configurations/basic.con=
f \
>                            $(DESTDIR)$(sysconfdir)/proftpd.conf ; \
>         fi
> -Index: proftpd-1.3.6/configure
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- proftpd-1.3.6.orig/configure
> -+++ proftpd-1.3.6/configure
> -@@ -41777,7 +41777,7 @@ _ACEOF
> +diff --git a/configure b/configure
> +index 033f12f..242d18b 100755
> +--- a/configure
> ++++ b/configure
> +@@ -42308,7 +42308,7 @@ _ACEOF
>
>
>   cat >>confdefs.h <<_ACEOF
> @@ -73,7 +78,7 @@ Index: proftpd-1.3.6/configure
>   _ACEOF
>
>
> -@@ -41787,7 +41787,7 @@ _ACEOF
> +@@ -42318,7 +42318,7 @@ _ACEOF
>
>
>   cat >>confdefs.h <<_ACEOF
> @@ -82,11 +87,11 @@ Index: proftpd-1.3.6/configure
>   _ACEOF
>
>
> -Index: proftpd-1.3.6/configure.in
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- proftpd-1.3.6.orig/configure.in
> -+++ proftpd-1.3.6/configure.in
> -@@ -3833,8 +3833,8 @@ locale_dir=3D"`eval echo ${locale_dir}`"
> +diff --git a/configure.in b/configure.in
> +index a4affa9..5449060 100644
> +--- a/configure.in
> ++++ b/configure.in
> +@@ -3956,8 +3956,8 @@ locale_dir=3D"`eval echo ${locale_dir}`"
>   AC_DEFINE_UNQUOTED(PR_LOCALE_DIR, "`eval echo "${locale_dir}"`", [Defi=
ne the locale directory])
>
>   AC_DEFINE_UNQUOTED(PR_RUN_DIR, "`eval echo "${localstatedir}"`", [Defi=
ne the run directory])
> @@ -97,16 +102,6 @@ Index: proftpd-1.3.6/configure.in
>
>   prefix=3D"$pr_saved_prefix"
>   exec_prefix=3D"$pr_saved_exec_prefix"
> -Index: proftpd-1.3.6/lib/libcap/Makefile
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- proftpd-1.3.6.orig/lib/libcap/Makefile
> -+++ proftpd-1.3.6/lib/libcap/Makefile
> -@@ -26,7 +26,7 @@ OBJS=3D$(addsuffix .o, $(FILES))
> - all: $(LIBNAME)
> -
> - _makenames: _makenames.c cap_names.sed
> --      $(CC) $(CFLAGS) $(LDFLAGS) $< -o $@
> -+      $(BUILD_CC) $(CFLAGS) $(LDFLAGS) $< -o $@
> -
> - cap_names.h: _makenames
> -       ./_makenames > cap_names.h
> +--
> +2.17.1
> +
> diff --git a/meta-networking/recipes-daemons/proftpd/files/contrib.patch=
 b/meta-networking/recipes-daemons/proftpd/files/contrib.patch
> index 7e2a8e3ce..e4ff539de 100644
> --- a/meta-networking/recipes-daemons/proftpd/files/contrib.patch
> +++ b/meta-networking/recipes-daemons/proftpd/files/contrib.patch
> @@ -6,37 +6,38 @@ Upstream-Status: Pending
>
>  Signed-off-by: Kevin Strasser <kevin.strasser@linux.intel.com>
>  ---
> - Makefile.in         |    2 +-
> - contrib/Makefile.in |    6 +++---
> - 2 files changed, 4 insertions(+), 4 deletions(-)
> + Makefile.in         | 2 +-
> + contrib/Makefile.in | 7 ++++---
> + 2 files changed, 5 insertions(+), 4 deletions(-)
>
>  diff --git a/Makefile.in b/Makefile.in
> -index 5b2e683..ee72fe1 100644
> +index 3f325e5..abacc9f 100644
>  --- a/Makefile.in
>  +++ b/Makefile.in
> -@@ -120,7 +120,7 @@ install-modules: $(DESTDIR)$(libexecdir) $(DESTDIR)=
$(sysconfdir)
> +@@ -145,7 +145,7 @@ install-modules: $(DESTDIR)$(libexecdir) $(DESTDIR)=
$(sysconfdir)
>         test -z "$(SHARED_MODULE_OBJS)" -a -z "$(SHARED_MODULE_DIRS)" -a=
 -z "$(STATIC_MODULE_DIRS)" || (cd modules/ && $(MAKE) install)
>
>   install-utils: $(DESTDIR)$(sbindir) $(DESTDIR)$(bindir)
>  -      cd contrib/ && $(MAKE) install-utils
>  +      cd contrib/ && $(MAKE) DESTDIR=3D${DESTDIR} install-utils
> -       $(INSTALL_BIN)  ftpcount $(DESTDIR)$(bindir)/ftpcount
> -       $(INSTALL_BIN)  ftpdctl  $(DESTDIR)$(bindir)/ftpdctl
> -       $(INSTALL_SBIN) ftpscrub $(DESTDIR)$(sbindir)/ftpscrub
> +       $(INSTALL_BIN)  $(top_builddir)/ftpcount $(DESTDIR)$(bindir)/ftp=
count
> +       $(INSTALL_BIN)  $(top_builddir)/ftpdctl  $(DESTDIR)$(bindir)/ftp=
dctl
> +       $(INSTALL_SBIN) $(top_builddir)/ftpscrub $(DESTDIR)$(sbindir)/ft=
pscrub
>  diff --git a/contrib/Makefile.in b/contrib/Makefile.in
> -index 5bcc038..51d248c 100644
> +index d1a31af..865a6ff 100644
>  --- a/contrib/Makefile.in
>  +++ b/contrib/Makefile.in
> -@@ -18,6 +18,6 @@ Makefile: Makefile.in ../config.status
> +@@ -17,6 +17,7 @@ Makefile: Makefile.in ../config.status
>         cd ../ && ./config.status
>
>   install-utils:
> --      $(INSTALL) -o $(INSTALL_USER) -g $(INSTALL_GROUP) -m 0755 ftpass=
wd $(DESTDIR)$(bindir)/ftpasswd
> --      $(INSTALL) -o $(INSTALL_USER) -g $(INSTALL_GROUP) -m 0755 ftpmai=
l $(DESTDIR)$(bindir)/ftpmail
> --      $(INSTALL) -o $(INSTALL_USER) -g $(INSTALL_GROUP) -m 0755 ftpquo=
ta $(DESTDIR)$(bindir)/ftpquota
> +-      $(INSTALL) -o $(INSTALL_USER) -g $(INSTALL_GROUP) -m 0755 $(srcd=
ir)/ftpasswd $(DESTDIR)$(bindir)/ftpasswd
> +-      $(INSTALL) -o $(INSTALL_USER) -g $(INSTALL_GROUP) -m 0755 $(srcd=
ir)/ftpmail $(DESTDIR)$(bindir)/ftpmail
> +-      $(INSTALL) -o $(INSTALL_USER) -g $(INSTALL_GROUP) -m 0755 $(srcd=
ir)/ftpquota $(DESTDIR)$(bindir)/ftpquota
>  +      $(INSTALL) -m 0755 ftpasswd $(DESTDIR)$(bindir)/ftpasswd
>  +      $(INSTALL) -m 0755 ftpmail $(DESTDIR)$(bindir)/ftpmail
>  +      $(INSTALL) -m 0755 ftpquota $(DESTDIR)$(bindir)/ftpquota
> ++
>  --
> -1.7.9.5
> +2.17.1
>
> diff --git a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.6.bb b/=
meta-networking/recipes-daemons/proftpd/proftpd_1.3.7rc3.bb
> similarity index 97%
> rename from meta-networking/recipes-daemons/proftpd/proftpd_1.3.6.bb
> rename to meta-networking/recipes-daemons/proftpd/proftpd_1.3.7rc3.bb
> index d5bbdd374..10a9219d1 100644
> --- a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.6.bb
> +++ b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.7rc3.bb
> @@ -13,8 +13,8 @@ SRC_URI =3D "ftp://ftp.proftpd.org/distrib/source/${BP=
N}-${PV}.tar.gz \
>             file://build_fixup.patch \
>             file://proftpd.service \
>             "
> -iSRC_URI[md5sum] =3D "13270911c42aac842435f18205546a1b"
> -SRC_URI[sha256sum] =3D "91ef74b143495d5ff97c4d4770c6804072a8c8eb1ad1ecc=
8cc541b40e152ecaf"
> +SRC_URI[md5sum] =3D "2492bed101f2dd798453b389370dadb1"
> +SRC_URI[sha256sum] =3D "ae06a9da10165407cc525966cf4704b3b54295957fe42a2=
34af52944815dc9ee"
>
>  inherit autotools-brokensep useradd update-rc.d systemd multilib_script
>
> --
> 2.17.1
>
>
>
>=20
