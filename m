Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web09.5473.1618964425625361172
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Apr 2021 17:20:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hmV5Bo84;
 spf=pass (domain: gmail.com, ip: 209.85.160.174, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f174.google.com with SMTP id q4so1734048qtn.5
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 Apr 2021 17:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ycAdJYzt1E6YSsDqJisDFRR2Ne0SBtoT7xDAr6ztYxM=;
        b=hmV5Bo84r8zIquLTt2sZwJCNtXWv/9cyLDm0dsTq81UsfuxfuMokBh1OVXILR2cKs/
         5Sr/175+Sa5EY7VtkSBnOxADyQMOFKw7/3aJ/tKU7MOmXWFNJPnmBEXS78FVtuh1Q0mN
         t8MpWf7D732a7uFBt/Eh0w01E8MjA7mXpwiBixqlmKbLWwqSq2imCVEsE2Lrp6E8PvYo
         5CMTnm1yXPlcmNyOoacWqL24R/YZ6f+lSouD+xkBHCE50XE/I80OFxY0s0qQawuvUzU+
         h1tCV6d8V4LZ0NBtVmvsvMNG0b5HcXnbhJL90zKd5xi7S/hDyMkrfqNrX9oViq8kjj+S
         ok5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ycAdJYzt1E6YSsDqJisDFRR2Ne0SBtoT7xDAr6ztYxM=;
        b=K5RxX0/33fZEJ3O6eTgU6Q97mj6xsJii820VBbvESHDaw85Yw9EWOq6+i4Eh4zQ9Vq
         ZUI0wlSFXsIP50PoNDfWDIHiUsM9Arpn6E+wdQssTuU/2O3YXrtRU4YdyzdTuVukLTh4
         /YF08Emkekc40iRlCGjx/1V5jDHf2nmVdnv/LsTaztwBdLiUUpRsFaycMCoHcVu1rVK/
         HFyhiJzVavy73gPlJoTaBdD61H7eyKuRI/XjZ1iu8XXOH1zkiDjfnFYAB7WmRqP3OYkQ
         5qIPiBQ9qGyHm7hk9ZTDC5ZMPLAa2mWpT1D7s+1NhvftgcBW1ubezdzW8emWxa9I4kKm
         weUA==
X-Gm-Message-State: AOAM530O37PHXXfSj1xPeA9v8/IjvQVp9rexLyrs4sj3TL8z6Y0vKQIS
	wSOgmAgj6qWYy0tU+a0GYSud1vpImI4xxDXNRxg=
X-Google-Smtp-Source: ABdhPJz4cPtZU2Zfq1mrnJkTDqQf27QIt0BN8Dpmc9hV8v1k7NGGer1ybZuzBZ9fhyMJxve1aXW+pocmwBXEJeEAUnc=
X-Received: by 2002:ac8:5a46:: with SMTP id o6mr19351971qta.289.1618964424667;
 Tue, 20 Apr 2021 17:20:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210420101359.32550-1-andrej.kozemcak@siemens.com>
In-Reply-To: <20210420101359.32550-1-andrej.kozemcak@siemens.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 20 Apr 2021 17:19:58 -0700
Message-ID: <CAMKF1sr-T08kYCsSrWoD7RnA1_pvXYNJ8f5ZbYEzxBNk+2n8qA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v2] proftpd: Update to 1.3.7a release
To: Andrej Kozemcak <andrej.kozemcak@siemens.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Seeing this on mips/glibc

https://errors.yoctoproject.org/Errors/Details/577131/

TOPDIR/build/tmp/work/mips32r2-yoe-linux/proftpd/1.3.7a-r0/recipe-sysroot-=
native/usr/bin/mips-yoe-linux/../../libexec/mips-yoe-linux/gcc/mips-yoe-lin=
ux/11.0.1/ar:
pr_fnmatch.o: No such file or directory

On Tue, Apr 20, 2021 at 3:14 AM Andrej Kozemcak
<andrej.kozemcak@siemens.com> wrote:
>
> Signed-off-by: Andrej Kozemcak <andrej.kozemcak@siemens.com>
> ---
>  .../proftpd/files/build_fixup.patch           | 69 ++++++++-----------
>  .../proftpd/files/contrib.patch               | 29 ++++----
>  .../{proftpd_1.3.6.bb =3D> proftpd_1.3.7a.bb}   |  9 ++-
>  3 files changed, 47 insertions(+), 60 deletions(-)
>  rename meta-networking/recipes-daemons/proftpd/{proftpd_1.3.6.bb =3D> p=
roftpd_1.3.7a.bb} (96%)
>
> diff --git a/meta-networking/recipes-daemons/proftpd/files/build_fixup.p=
atch b/meta-networking/recipes-daemons/proftpd/files/build_fixup.patch
> index 9816d4d22..d888dd826 100644
> --- a/meta-networking/recipes-daemons/proftpd/files/build_fixup.patch
> +++ b/meta-networking/recipes-daemons/proftpd/files/build_fixup.patch
> @@ -9,10 +9,10 @@ redefine PR_RUN_DIR as ${localstatedir}/run
>  Signed-off-By: Armin Kuster <akuster808@gmail.com>
>
>
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
> @@ -26,11 +26,11 @@ Index: proftpd-1.3.6/Make.rules.in
>
>   RM=3Drm -f
>   SHELL=3D@CONFIG_SHELL@
> -Index: proftpd-1.3.6/Makefile.in
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- proftpd-1.3.6.orig/Makefile.in
> -+++ proftpd-1.3.6/Makefile.in
> -@@ -105,7 +105,6 @@ check: proftpd$(EXEEXT)
> +diff --git a/Makefile.in b/Makefile.in
> +index 9434cbd..13f2e16 100644
> +--- a/Makefile.in
> ++++ b/Makefile.in
> +@@ -123,7 +123,6 @@ check: proftpd$(EXEEXT)
>   $(DESTDIR)$(localedir) $(DESTDIR)$(includedir) $(DESTDIR)$(includedir)=
/proftpd $(DESTDIR)$(libdir) $(DESTDIR)$(pkgconfigdir) $(DESTDIR)$(libdir)/=
proftpd $(DESTDIR)$(libexecdir) $(DESTDIR)$(localstatedir) $(DESTDIR)$(sysc=
onfdir) $(DESTDIR)$(bindir) $(DESTDIR)$(sbindir) $(DESTDIR)$(mandir) $(DEST=
DIR)$(mandir)/man1 $(DESTDIR)$(mandir)/man5 $(DESTDIR)$(mandir)/man8:
>         @if [ ! -d $@ ]; then \
>                 mkdir -p $@; \
> @@ -38,20 +38,20 @@ Index: proftpd-1.3.6/Makefile.in
>                 chmod 0755 $@; \
>         fi
>
> -@@ -115,7 +114,6 @@ install-proftpd: proftpd $(DESTDIR)$(inc
> +@@ -133,7 +132,6 @@ install-proftpd: proftpd$(EXEEXT) $(DESTDIR)$(inclu=
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
> -+      $(INSTALL) -m 0755 src/prxs $(DESTDIR)$(bindir)/prxs
> +@@ -170,11 +168,11 @@ install-utils: $(DESTDIR)$(sbindir) $(DESTDIR)$(b=
indir)
> +       $(INSTALL_SBIN) $(top_builddir)/ftpshut  $(DESTDIR)$(sbindir)/ft=
pshut
> +       $(INSTALL_BIN)  $(top_builddir)/ftptop   $(DESTDIR)$(bindir)/ftp=
top
> +       $(INSTALL_BIN)  $(top_builddir)/ftpwho   $(DESTDIR)$(bindir)/ftp=
who
> +-      $(INSTALL) -o $(INSTALL_USER) -g $(INSTALL_GROUP) -m 0755 $(top_=
builddir)/src/prxs $(DESTDIR)$(bindir)/prxs
> ++      $(INSTALL) -m 0755 $(top_builddir)/src/prxs $(DESTDIR)$(bindir)/=
prxs
>
>   install-conf: $(DESTDIR)$(sysconfdir)
>         if [ ! -f $(DESTDIR)$(sysconfdir)/proftpd.conf ] ; then \
> @@ -60,11 +60,11 @@ Index: proftpd-1.3.6/Makefile.in
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
> +index 0a51670..69fa130 100755
> +--- a/configure
> ++++ b/configure
> +@@ -25116,7 +25116,7 @@ _ACEOF
>
>
>   cat >>confdefs.h <<_ACEOF
> @@ -73,7 +73,7 @@ Index: proftpd-1.3.6/configure
>   _ACEOF
>
>
> -@@ -41787,7 +41787,7 @@ _ACEOF
> +@@ -25126,7 +25126,7 @@ _ACEOF
>
>
>   cat >>confdefs.h <<_ACEOF
> @@ -82,11 +82,11 @@ Index: proftpd-1.3.6/configure
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
> +index 50561de..93cad3f 100644
> +--- a/configure.in
> ++++ b/configure.in
> +@@ -4059,8 +4059,8 @@ locale_dir=3D"`eval echo ${locale_dir}`"
>   AC_DEFINE_UNQUOTED(PR_LOCALE_DIR, "`eval echo "${locale_dir}"`", [Defi=
ne the locale directory])
>
>   AC_DEFINE_UNQUOTED(PR_RUN_DIR, "`eval echo "${localstatedir}"`", [Defi=
ne the run directory])
> @@ -97,16 +97,3 @@ Index: proftpd-1.3.6/configure.in
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
> diff --git a/meta-networking/recipes-daemons/proftpd/files/contrib.patch=
 b/meta-networking/recipes-daemons/proftpd/files/contrib.patch
> index 7e2a8e3ce..96c237d38 100644
> --- a/meta-networking/recipes-daemons/proftpd/files/contrib.patch
> +++ b/meta-networking/recipes-daemons/proftpd/files/contrib.patch
> @@ -11,32 +11,29 @@ Signed-off-by: Kevin Strasser <kevin.strasser@linux.=
intel.com>
>   2 files changed, 4 insertions(+), 4 deletions(-)
>
>  diff --git a/Makefile.in b/Makefile.in
> -index 5b2e683..ee72fe1 100644
> +index 9434cbd..8da7d1f 100644
>  --- a/Makefile.in
>  +++ b/Makefile.in
> -@@ -120,7 +120,7 @@ install-modules: $(DESTDIR)$(libexecdir) $(DESTDIR)=
$(sysconfdir)
> +@@ -163,7 +163,7 @@ install-modules: $(DESTDIR)$(libexecdir) $(DESTDIR)=
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
> +index d1a31af..65d2abc 100644
>  --- a/contrib/Makefile.in
>  +++ b/contrib/Makefile.in
> -@@ -18,6 +18,6 @@ Makefile: Makefile.in ../config.status
> +@@ -17,6 +17,6 @@ Makefile: Makefile.in ../config.status
>         cd ../ && ./config.status
>
>   install-utils:
> --      $(INSTALL) -o $(INSTALL_USER) -g $(INSTALL_GROUP) -m 0755 ftpass=
wd $(DESTDIR)$(bindir)/ftpasswd
> --      $(INSTALL) -o $(INSTALL_USER) -g $(INSTALL_GROUP) -m 0755 ftpmai=
l $(DESTDIR)$(bindir)/ftpmail
> --      $(INSTALL) -o $(INSTALL_USER) -g $(INSTALL_GROUP) -m 0755 ftpquo=
ta $(DESTDIR)$(bindir)/ftpquota
> -+      $(INSTALL) -m 0755 ftpasswd $(DESTDIR)$(bindir)/ftpasswd
> -+      $(INSTALL) -m 0755 ftpmail $(DESTDIR)$(bindir)/ftpmail
> -+      $(INSTALL) -m 0755 ftpquota $(DESTDIR)$(bindir)/ftpquota
> ---
> -1.7.9.5
> -
> +-      $(INSTALL) -o $(INSTALL_USER) -g $(INSTALL_GROUP) -m 0755 $(srcd=
ir)/ftpasswd $(DESTDIR)$(bindir)/ftpasswd
> +-      $(INSTALL) -o $(INSTALL_USER) -g $(INSTALL_GROUP) -m 0755 $(srcd=
ir)/ftpmail $(DESTDIR)$(bindir)/ftpmail
> +-      $(INSTALL) -o $(INSTALL_USER) -g $(INSTALL_GROUP) -m 0755 $(srcd=
ir)/ftpquota $(DESTDIR)$(bindir)/ftpquota
> ++      $(INSTALL) -m 0755 $(srcdir)/ftpasswd $(DESTDIR)$(bindir)/ftpass=
wd
> ++      $(INSTALL) -m 0755 $(srcdir)/ftpmail $(DESTDIR)$(bindir)/ftpmail
> ++      $(INSTALL) -m 0755 $(srcdir)/ftpquota $(DESTDIR)$(bindir)/ftpquo=
ta
> diff --git a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.6.bb b/=
meta-networking/recipes-daemons/proftpd/proftpd_1.3.7a.bb
> similarity index 96%
> rename from meta-networking/recipes-daemons/proftpd/proftpd_1.3.6.bb
> rename to meta-networking/recipes-daemons/proftpd/proftpd_1.3.7a.bb
> index 1e4697a63..9f1e47d6c 100644
> --- a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.6.bb
> +++ b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.7a.bb
> @@ -4,7 +4,10 @@ HOMEPAGE =3D "http://www.proftpd.org"
>  LICENSE =3D "GPLv2+"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dfb0d1484d11915fa88a6a7702f1d=
c184"
>
> -SRC_URI =3D "ftp://ftp.proftpd.org/distrib/source/${BPN}-${PV}.tar.gz \
> +SRCREV =3D "715eadc1aa4f6b07d69f9d09558e9cb471e51d87"
> +BRANCH =3D "1.3.7"
> +
> +SRC_URI =3D "git://github.com/proftpd/proftpd.git;branch=3D${BRANCH} \
>             file://basic.conf.patch \
>             file://proftpd-basic.init \
>             file://default \
> @@ -13,8 +16,8 @@ SRC_URI =3D "ftp://ftp.proftpd.org/distrib/source/${BP=
N}-${PV}.tar.gz \
>             file://build_fixup.patch \
>             file://proftpd.service \
>             "
> -SRC_URI[md5sum] =3D "13270911c42aac842435f18205546a1b"
> -SRC_URI[sha256sum] =3D "91ef74b143495d5ff97c4d4770c6804072a8c8eb1ad1ecc=
8cc541b40e152ecaf"
> +
> +S =3D "${WORKDIR}/git"
>
>  inherit autotools-brokensep useradd update-rc.d systemd multilib_script
>
> --
> 2.20.1
>
>
>=20
>
