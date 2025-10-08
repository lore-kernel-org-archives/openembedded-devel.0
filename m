Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1B27CCA476
	for <webhook@archiver.kernel.org>; Wed,  8 Oct 2025 00:34:10 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.web10.5179.1759883645101903523
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Oct 2025 17:34:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Gd2xMY6g;
 spf=pass (domain: gmail.com, ip: 209.85.128.180, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-77fac63ba26so47403987b3.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 07 Oct 2025 17:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759883644; x=1760488444; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A0bEnRAKTituyGU+cRKSYf+lCowd/7UeZf5Jv6B38SA=;
        b=Gd2xMY6gssd49X/4IAthAzwPKowCacJOAjYcgXiUynd52AR22M9zJhdfo8etrvYreW
         cUbVs+K0ShdSp89eKDA7L/wZeuvOFF1UFeiqVd+jDPusXEDyqCVYWVQj09z41CTyVdSN
         nH5varJwR2HM48UtLepSjIE03jgx4vqleScqvicnLq4oAgRUkvvPn9f8hgXkOzMSDRr8
         3H32Ss8h9wEnh6zxPrveiBP7wlqmHAC8VhnaFOw6BeoMtEiKdKHG8KT+s/WjFGFhFRud
         TlCPGupkMJ7Az/sy1xzPazMB6v9ow069vHF/Z3VmvloFqrLSb4rq0HZH29B6tS7pLjiy
         /ekQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759883644; x=1760488444;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A0bEnRAKTituyGU+cRKSYf+lCowd/7UeZf5Jv6B38SA=;
        b=SE8z0BzYOy2/ZRNavtBQx8twgmwQbMyizPZuIjOZAFEVpdcHETraPTTY5xM+k/iqcf
         rmtcbyxywKavJElbynHi2s7ocoroXcMljzsBvQUoQhVY/O1DmVzmWoI9m627QFB0+hPZ
         IwVao0MyGPiqYphwfAHMD53gegx14Z/+KZotZ86NETWQOU6oe8LrILM/VPxNvoVEI0u0
         3rEJs+iGuSnotVNujt/AcIjRy9RXlMTcYSc8hKecSUmmLxQh9C8zK+wBmvwoVODmJsvm
         OP5eQG6clzeaadQjyO/SDcm1zdj3U4Up8iJoQIMBN5KspPQF3ocDV11Q4zg2Y+cFUB6b
         NRFg==
X-Gm-Message-State: AOJu0YyBMOMVtbQdo0U8j0vAiP3pF4S+k5nT+YQOPIjLHq4snN4I5s5S
	x83a+b5IxhaFFb1X3aiw9/RVJrcspzrV3iGmjVNuDiL3t1xIctmJZGz9JJgeD52uSIT4dCbNYPo
	xb/Wk17NE1ILGeZqUoAcrSGhgoPUDCfY=
X-Gm-Gg: ASbGncsV6bySTYdrr8SdcNYcRfQ8zaomUd5ojVSsxvwkE/pTnTv/KpfM4pUK/1SWkZt
	H7/34pJEx91CiaRP5ej5TcmC+nGqbeCuxZg7O+8w0OUPJa/zkxvxqu1aYLbq6hgs/UhWyVi5plG
	iXGulXikfTu1Zfl7hU7WN7+sSw8G7nRxlhMaaoX1tVNIDvV/9eogN0TIDsQj/7n+CnHt2gKAha3
	XbD50hh6/+3rvsmK1f8fhwvs+JheQwcQxsyK8rAx6uMFYNU1Pi1rAUkEOt/3QacCLXDm/ACtTUg
	sbVkB1IyyNsFNrpzG1csvaWuEVuELu7ikr/ECxuPmU1CUeJQT0oUad5rAREtBOSc2gTIa9nmcGc
	MGqAPgidpAOVgy0Vu
X-Google-Smtp-Source: AGHT+IFBZnXMjGLpTORpKV+UFSiDZO/M4+U7lPH7ZMtJB7Xf2SwfTGJuO6hU2FeE3aRt6Ca5prSNW/rOLiJYXNUT6Z0=
X-Received: by 2002:a53:b6cd:0:b0:636:d4ab:a507 with SMTP id
 956f58d0204a3-63ccb85e07emr1176411d50.16.1759883643909; Tue, 07 Oct 2025
 17:34:03 -0700 (PDT)
MIME-Version: 1.0
References: <20251005184547.1851183-1-skandigraun@gmail.com>
In-Reply-To: <20251005184547.1851183-1-skandigraun@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 7 Oct 2025 17:33:37 -0700
X-Gm-Features: AS18NWBrByi0n8mmDFHzbxll1X8ZrBMed2vtnB3__uaQNNA3sKQ__Oai2ioRIh4
Message-ID: <CAMKF1spc0u3pkgnA80QxKuW+kzi+EZmVphhkJ0o3P6Sm2o4A9w@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] emacs: upgrade 29.1 -> 30.2
To: skandigraun@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Oct 2025 00:34:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120353

I am seeing some fetching issues on Autobuilders -
https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/3761119/raw_inlin=
e
Is there a mirror we need ?

On Sun, Oct 5, 2025 at 11:45=E2=80=AFAM Gyorgy Sarvari via
lists.openembedded.org <skandigraun=3Dgmail.com@lists.openembedded.org>
wrote:
>
> Added a new patch to avoid unexporting some environment variables that ar=
e set
> by the recipe explicitly, to avoid the following build error:
>
> | Loading env...
> | 'bootstrap-emacs' -batch --no-site-file --no-site-lisp -batch -l ja-dic=
-cnv \
> |   -f batch-skkdic-convert -dir "../../sources/emacs-29.2/leim/../lisp/l=
eim/ja-dic" --no-reduction "../../sources/emacs-29.2/leim/SKK-DIC/SKK-JISYO=
.L"
> <...>
> | Error: <RECIP_SYSROOT_NATIVE>/usr/share/emacs/29.2/etc/charsets: No suc=
h file or directory
>
> Changelogs:
> 29.2 - 29.4: https://github.com/emacs-mirror/emacs/blob/master/etc/NEWS.2=
9
> 30.1 - 30.2: https://github.com/emacs-mirror/emacs/blob/master/etc/NEWS.3=
0
>
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ---
>  .../emacs/{emacs_29.1.bb =3D> emacs_30.2.bb}    |  3 ++-
>  ...oid-running-host-binaries-for-sanity.patch |  7 ++++---
>  .../files/leim_dont-unexport-EMACSDATA.patch  | 19 +++++++++++++++++++
>  ...acs-native-tools-for-cross-compiling.patch | 19 +++++++------------
>  4 files changed, 32 insertions(+), 16 deletions(-)
>  rename meta-oe/recipes-support/emacs/{emacs_29.1.bb =3D> emacs_30.2.bb} =
(99%)
>  create mode 100644 meta-oe/recipes-support/emacs/files/leim_dont-unexpor=
t-EMACSDATA.patch
>
> diff --git a/meta-oe/recipes-support/emacs/emacs_29.1.bb b/meta-oe/recipe=
s-support/emacs/emacs_30.2.bb
> similarity index 99%
> rename from meta-oe/recipes-support/emacs/emacs_29.1.bb
> rename to meta-oe/recipes-support/emacs/emacs_30.2.bb
> index 5cbe4551c0..6f9b8a485c 100644
> --- a/meta-oe/recipes-support/emacs/emacs_29.1.bb
> +++ b/meta-oe/recipes-support/emacs/emacs_30.2.bb
> @@ -9,9 +9,10 @@ SRC_URI =3D "https://ftp.gnu.org/pub/gnu/emacs/emacs-${P=
V}.tar.xz \
>  SRC_URI:append:class-target =3D " \
>      file://use-emacs-native-tools-for-cross-compiling.patch \
>      file://avoid-running-host-binaries-for-sanity.patch \
> +    file://leim_dont-unexport-EMACSDATA.patch \
>  "
>
> -SRC_URI[sha256sum] =3D "d2f881a5cc231e2f5a03e86f4584b0438f83edd7598a09d2=
4a21bd8d003e2e01"
> +SRC_URI[sha256sum] =3D "b3f36f18a6dd2715713370166257de2fae01f9d38cfe878c=
ed9b1e6ded5befd9"
>
>  CVE_STATUS[CVE-2007-6109] =3D "fixed-version: The CPE in the NVD databas=
e doesn't reflect correctly the vulnerable versions."
>
> diff --git a/meta-oe/recipes-support/emacs/files/avoid-running-host-binar=
ies-for-sanity.patch b/meta-oe/recipes-support/emacs/files/avoid-running-ho=
st-binaries-for-sanity.patch
> index 719ee4bce9..bd23358f2a 100644
> --- a/meta-oe/recipes-support/emacs/files/avoid-running-host-binaries-for=
-sanity.patch
> +++ b/meta-oe/recipes-support/emacs/files/avoid-running-host-binaries-for=
-sanity.patch
> @@ -12,14 +12,14 @@ Index: emacs-29.1/Makefile.in
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>  --- emacs-29.1.orig/Makefile.in
>  +++ emacs-29.1/Makefile.in
> -@@ -416,19 +416,10 @@ advice-on-failure:
> +@@ -420,19 +420,11 @@
>         @exit ${exit-status}
>
>   sanity-check:
>  -      @[ -f .no-advice-on-failure ] && exit 0; true
> --      @v=3D$$(src/emacs${EXEEXT} --batch --eval \
> +-      @v=3D`src/emacs${EXEEXT} --batch -Q --eval \
>  -        '(progn (defun f (n) (if (=3D 0 n) 1 (* n (f (- n 1))))) (princ=
 (f 10)))' \
> --        2> /dev/null); \
> +-        2> /dev/null`; \
>  -      [ "X$$v" =3D "X3628800" ] && exit 0; \
>  -      echo >&2 '***'; \
>  -      echo >&2 '*** '"\"make ${make-target}\" succeeded, but Emacs is n=
ot functional."; \
> @@ -33,6 +33,7 @@ Index: emacs-29.1/Makefile.in
>  +# this is not going to work since it was (probably) built for a differe=
nt architecture.
>  +# Avoid calling target binaries from the host and simply assume our bui=
ld artifacts work.
>  +      exit 0
> ++
>
>   .PHONY: all ${SUBDIR} blessmail epaths-force epaths-force-w32 epaths-fo=
rce-ns-self-contained etc-emacsver
>
> diff --git a/meta-oe/recipes-support/emacs/files/leim_dont-unexport-EMACS=
DATA.patch b/meta-oe/recipes-support/emacs/files/leim_dont-unexport-EMACSDA=
TA.patch
> new file mode 100644
> index 0000000000..81dd2bde40
> --- /dev/null
> +++ b/meta-oe/recipes-support/emacs/files/leim_dont-unexport-EMACSDATA.pa=
tch
> @@ -0,0 +1,19 @@
> +Upstream unexports some environment variables to avoid contamination,
> +however OE sets these variables specifically to help the build in the
> +recipe, and they should not be unexported.
> +
> +Upstream-Status: Inappropriate [oe-specific]
> +
> +Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> +
> +--- ./leim/Makefile.in.orig    2025-10-05 20:22:56.062508393 +0200
> ++++ ./leim/Makefile.in 2025-10-05 20:23:05.581046818 +0200
> +@@ -42,7 +42,7 @@
> + -include ${top_builddir}/src/verbose.mk
> +
> + # Prevent any settings in the user environment causing problems.
> +-unexport EMACSDATA EMACSDOC EMACSLOADPATH EMACSPATH
> ++# unexport EMACSDATA EMACSDOC EMACSLOADPATH EMACSPATH
> +
> + # Which Emacs to use to convert TIT files to Emacs Lisp files,
> + # and generate the file leim-list.el.
> diff --git a/meta-oe/recipes-support/emacs/files/use-emacs-native-tools-f=
or-cross-compiling.patch b/meta-oe/recipes-support/emacs/files/use-emacs-na=
tive-tools-for-cross-compiling.patch
> index df5e4bd258..a1b6ea6ddf 100644
> --- a/meta-oe/recipes-support/emacs/files/use-emacs-native-tools-for-cros=
s-compiling.patch
> +++ b/meta-oe/recipes-support/emacs/files/use-emacs-native-tools-for-cros=
s-compiling.patch
> @@ -18,12 +18,7 @@ Index: emacs-29.1/src/Makefile.in
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>  --- emacs-29.1.orig/src/Makefile.in
>  +++ emacs-29.1/src/Makefile.in
> -@@ -1,3 +1,4 @@
> -+
> - ### @configure_input@
> -
> - # Copyright (C) 1985, 1987-1988, 1993-1995, 1999-2023 Free Software
> -@@ -508,7 +509,7 @@ ifeq ($(CHECK_STRUCTS),true)
> +@@ -542,7 +542,7 @@ ifeq ($(CHECK_STRUCTS),true)
>   pdumper.o: dmpstruct.h
>   endif
>   dmpstruct.h: $(srcdir)/dmpstruct.awk
> @@ -32,17 +27,17 @@ Index: emacs-29.1/src/Makefile.in
>         $(AM_V_GEN)POSIXLY_CORRECT=3D1 awk -f $(srcdir)/dmpstruct.awk \
>                 $(dmpstruct_headers) > $@
>
> -@@ -610,8 +611,7 @@ SYSTEM_TYPE =3D @SYSTEM_TYPE@
> +@@ -651,8 +651,7 @@
>   ## Strictly speaking, emacs does not depend directly on all of $lisp,
>   ## since not all pieces are used on all platforms.  But DOC depends
>   ## on all of $lisp, and emacs depends on DOC, so it is ok to use $lisp =
here.
>  -emacs$(EXEEXT): temacs$(EXEEXT) \
> --                lisp.mk $(etc)/DOC $(lisp) \
> -+emacs$(EXEEXT): lisp.mk $(etc)/DOC $(lisp) \
> +-                $(abs_top_builddir)/src/lisp.mk $(etc)/DOC $(lisp) \
> ++emacs$(EXEEXT): $(abs_top_builddir)/src/lisp.mk $(etc)/DOC $(lisp) \
>                   $(lispsource)/international/charprop.el ${charsets}
>   ifeq ($(SYSTEM_TYPE),cygwin)
>         find ${top_builddir} -name '*.eln' | rebase -v -O -T -
> -@@ -654,7 +654,7 @@ endif
> +@@ -695,7 +695,7 @@ endif
>   $(etc)/DOC: $(libsrc)/make-docfile$(EXEEXT) $(doc_obj)
>         $(AM_V_GEN)$(MKDIR_P) $(etc)
>         $(AM_V_at)rm -f $(etc)/DOC
> @@ -51,7 +46,7 @@ Index: emacs-29.1/src/Makefile.in
>           $(SOME_MACHINE_OBJECTS) $(doc_obj) > $(etc)/DOC
>
>   $(libsrc)/make-docfile$(EXEEXT) $(libsrc)/make-fingerprint$(EXEEXT): \
> -@@ -671,7 +671,7 @@ buildobj.h: Makefile
> +@@ -712,7 +712,7 @@ buildobj.h: Makefile
>   GLOBAL_SOURCES =3D $(base_obj:.o=3D.c) $(NS_OBJC_OBJ:.o=3D.m)
>
>   gl-stamp: $(libsrc)/make-docfile$(EXEEXT) $(GLOBAL_SOURCES)
> @@ -60,7 +55,7 @@ Index: emacs-29.1/src/Makefile.in
>         $(AM_V_at)$(top_srcdir)/build-aux/move-if-change globals.tmp glob=
als.h
>         $(AM_V_at)echo timestamp > $@
>
> -@@ -685,7 +685,7 @@ $(LIBEGNU_ARCHIVE): $(config_h)
> +@@ -726,7 +726,7 @@ $(LIBEGNU_ARCHIVE): $(config_h)
>         $(MAKE) -C $(dir $@) all
>
>   ifeq ($(HAVE_PDUMPER),yes)
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#120256): https://lists.openembedded.org/g/openembedde=
d-devel/message/120256
> Mute This Topic: https://lists.openembedded.org/mt/115605456/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

