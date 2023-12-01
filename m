Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D833DC4167B
	for <webhook@archiver.kernel.org>; Fri,  1 Dec 2023 10:08:25 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web11.19393.1701425301385903668
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 01 Dec 2023 02:08:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LolLSLXR;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: alperyasinak1@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-53fa455cd94so256940a12.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 01 Dec 2023 02:08:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701425300; x=1702030100; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b7NxmmpwD/HIijUJQxenMqa3xYsuEwJO+7VTf2LtWto=;
        b=LolLSLXRo6PvW0lIBZ5IlYZSWk86xIEjWKqpQJMJ2bY1yw78ryxAKS5rCjwMWn17TF
         ouWZoj+XYoJJoA+OcHn3pKPrZ21GE4Me7p5uCCBU9IzgK6faFh8IN4Um/Y8teQ9TxH9v
         YE7RWD9mEYrJDaYJlo6G+kD1610Je49Eq1PK1IdvWJo4+XCAORnvABfVQq61Bv1+WVuD
         KWKivDWbnwYlCz+eioXujhDce+W4oimwtFjaFV93uZHgDLSC/p5/891XW0bD+xhXhsYd
         HjASsNz+WO3Guf60nDdjLVJIKCrouj2GRhYmzWXjOCmFW8eUBFslK6rPuBLrGGP9GCUi
         IaVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701425300; x=1702030100;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b7NxmmpwD/HIijUJQxenMqa3xYsuEwJO+7VTf2LtWto=;
        b=ocNWJjkKVMK7vQR0b4LaPTVcv/eP9PrSjMhQHG6jpKoKhWuY/B3cnhwVYPbRiZt8dW
         CK31ubBuDa3L1oYj150ikq0S54oRxcQkUU03jUcAO0Bh8xBD3luR0hwkmk9N5MXgydiO
         Ntv0tRkmI3PjmuT6y5tu6PI7t4ledjH5opSsNfEBlVQMdXl9UbQddNFnO17YMP3VgwGx
         Dok3wR+w/snKBua7pA0xTRLyCb3q0VqccagUm7OZv0gN1ASzAvlj68jGKDkHle4voCWr
         BVLs6MthmtqEG8foVDiiphDUqwYY+e0q2HqeMQdbX5oGbPAdpY6AJGLZUczLJ8PPTlxh
         HAFw==
X-Gm-Message-State: AOJu0YwXPdTgxZF24kLm/jzDVMmoZXEaqsSgHCI+o9vGxmqYeWWDKHA1
	nq0xzmdQ1Ekud+lsA668u210sTX9fmlWLcry0rY=
X-Google-Smtp-Source: AGHT+IGSaV5KWnMwuD7oxhdzX6A6GwsQSyRuNZ8dGQKkFTNhgtpDP/n2WXoTYz6r0CMUDlALviMAk6nUOrYlmcl5TDU=
X-Received: by 2002:a17:90b:38cd:b0:286:56de:3ff2 with SMTP id
 nn13-20020a17090b38cd00b0028656de3ff2mr1465191pjb.48.1701425300346; Fri, 01
 Dec 2023 02:08:20 -0800 (PST)
MIME-Version: 1.0
References: <20231130212143.3192153-1-alperyasinak1@gmail.com> <CAMKF1spC5zOVEkhbk6fUqw33zeWTHVMXgMX5eY1wkx+eNYOPSQ@mail.gmail.com>
In-Reply-To: <CAMKF1spC5zOVEkhbk6fUqw33zeWTHVMXgMX5eY1wkx+eNYOPSQ@mail.gmail.com>
From: alper ak <alperyasinak1@gmail.com>
Date: Fri, 1 Dec 2023 13:08:09 +0300
Message-ID: <CAGpma=4FFBa0hLYhxg3W3aPk-D5kO9ODSAHwtbFL0=rZOyEvsA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] libpwquality: upgrade 1.4.4 -> 1.4.5
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 01 Dec 2023 10:08:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107187

> I=E2=80=99d also try without -brokensep and seeing if it works now. If it=
 still doesn=E2=80=99t then filing a bug upstream would be sensible.

Tried without -brokensep but it didn't work -> https://pastebin.com/kSpMc1J=
9
It is looking for the "../src/pwquality.h" file in build directory but
can't find it. "pwquality.h" is located at source directory. B =3D
"../build", S =3D "../git" so if we do B =3D "${S}" (i.e. brokensep), I
interpreted that it solves the problem.


Khem Raj <raj.khem@gmail.com>, 1 Ara 2023 Cum, 04:06 tarihinde =C5=9Funu ya=
zd=C4=B1:
>
> On Thu, Nov 30, 2023 at 1:22=E2=80=AFPM Alper Ak <alperyasinak1@gmail.com=
> wrote:
> >
> > * 0001-fix-musl-build.patch removed because fixed in the new version. -=
> https://github.com/libpwquality/libpwquality/pull/53
> > * Created ABOUT-NLS file because of following error -> error: required =
file './ABOUT-NLS' not found
> >
> > Changelog:
> >
> > * Translation updates
> > * Minor bug fixes and documentation enhancements
> >
> > Signed-off-by: alperak <alperyasinak1@gmail.com>
> > ---
> > ABOUT-NLS should have installed via gettext.
> > I couldn't find an answer and asked Ross Burton, he suggested I could s=
olve it this way.
> >
> >  .../files/0001-fix-musl-build.patch           | 72 -------------------
> >  ...quality_1.4.4.bb =3D> libpwquality_1.4.5.bb} | 27 ++++---
> >  2 files changed, 12 insertions(+), 87 deletions(-)
> >  delete mode 100644 meta-oe/recipes-extended/libpwquality/files/0001-fi=
x-musl-build.patch
> >  rename meta-oe/recipes-extended/libpwquality/{libpwquality_1.4.4.bb =
=3D> libpwquality_1.4.5.bb} (61%)
> >
> > diff --git a/meta-oe/recipes-extended/libpwquality/files/0001-fix-musl-=
build.patch b/meta-oe/recipes-extended/libpwquality/files/0001-fix-musl-bui=
ld.patch
> > deleted file mode 100644
> > index 2cbdd6c74..000000000
> > --- a/meta-oe/recipes-extended/libpwquality/files/0001-fix-musl-build.p=
atch
> > +++ /dev/null
> > @@ -1,72 +0,0 @@
> > -Do not use fgetpwent_r
> > -
> > -fgetpwent_r does not exist on musl
> > -
> > -Source: https://git.alpinelinux.org/aports/tree/community/libpwquality=
/0001-fix-musl-build.patch
> > -Upstream-Status: Pending
> > -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---- a/src/pam_pwquality.c
> > -+++ b/src/pam_pwquality.c
> > -@@ -19,6 +19,7 @@
> > - #include <stdio.h>
> > - #include <pwd.h>
> > - #include <errno.h>
> > -+#include <security/pam_modutil.h>
> > - #include "pwquality.h"
> > -
> > - /*
> > -@@ -43,8 +44,6 @@ struct module_options {
> > -
> > - #define CO_RETRY_TIMES  1
> > -
> > --#define PATH_PASSWD "/etc/passwd"
> > --
> > - static int
> > - _pam_parse (pam_handle_t *pamh, struct module_options *opt,
> > -             int argc, const char **argv)
> > -@@ -98,44 +97,7 @@ static int
> > - check_local_user (pam_handle_t *pamh,
> > -                   const char *user)
> > - {
> > --        struct passwd pw, *pwp;
> > --        char buf[4096];
> > --        int found =3D 0;
> > --        FILE *fp;
> > --        int errn;
> > --
> > --        fp =3D fopen(PATH_PASSWD, "r");
> > --        if (fp =3D=3D NULL) {
> > --                pam_syslog(pamh, LOG_ERR, "unable to open %s: %s",
> > --                           PATH_PASSWD, pam_strerror(pamh, errno));
> > --                return -1;
> > --        }
> > --
> > --        for (;;) {
> > --                errn =3D fgetpwent_r(fp, &pw, buf, sizeof (buf), &pwp=
);
> > --                if (errn =3D=3D ERANGE) {
> > --                        pam_syslog(pamh, LOG_WARNING, "%s contains ve=
ry long lines; corrupted?",
> > --                                   PATH_PASSWD);
> > --                        /* we can continue here as next call will rea=
d further */
> > --                        continue;
> > --                }
> > --                if (errn !=3D 0)
> > --                        break;
> > --                if (strcmp(pwp->pw_name, user) =3D=3D 0) {
> > --                        found =3D 1;
> > --                        break;
> > --                }
> > --        }
> > --
> > --        fclose (fp);
> > --
> > --        if (errn !=3D 0 && errn !=3D ENOENT) {
> > --                pam_syslog(pamh, LOG_ERR, "unable to enumerate local =
accounts: %s",
> > --                           pam_strerror(pamh, errn));
> > --                return -1;
> > --        } else {
> > --                return found;
> > --        }
> > -+      return pam_modutil_check_user_in_passwd(pamh, user, NULL) =3D=
=3D PAM_SUCCESS;
> > - }
> > -
> > - PAM_EXTERN int
> > diff --git a/meta-oe/recipes-extended/libpwquality/libpwquality_1.4.4.b=
b b/meta-oe/recipes-extended/libpwquality/libpwquality_1.4.5.bb
> > similarity index 61%
> > rename from meta-oe/recipes-extended/libpwquality/libpwquality_1.4.4.bb
> > rename to meta-oe/recipes-extended/libpwquality/libpwquality_1.4.5.bb
> > index b50c0f7de..787543637 100644
> > --- a/meta-oe/recipes-extended/libpwquality/libpwquality_1.4.4.bb
> > +++ b/meta-oe/recipes-extended/libpwquality/libpwquality_1.4.5.bb
> > @@ -1,27 +1,24 @@
> >  DESCRIPTION =3D "Library for password quality checking and generating =
random passwords"
> >  HOMEPAGE =3D "https://github.com/libpwquality/libpwquality"
> >  SECTION =3D "devel/lib"
> > -LICENSE =3D "GPL-2.0-only"
> > +
> > +LICENSE =3D "GPL-2.0-or-later"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6bd2f1386df813a459a0c34fde6=
76fc2"
> >
> > -SRCNAME =3D "libpwquality"
> > -SRC_URI =3D "https://github.com/${SRCNAME}/${SRCNAME}/releases/downloa=
d/${SRCNAME}-${PV}/${SRCNAME}-${PV}.tar.bz2 \
> > +DEPENDS =3D "cracklib"
> > +
> > +SRC_URI =3D "git://github.com/libpwquality/libpwquality;branch=3Dmaste=
r;protocol=3Dhttps \
> >             file://add-missing-python-include-dir-for-cross.patch \
> >  "
> > -SRC_URI:append:libc-musl =3D " file://0001-fix-musl-build.patch "
> > -
> > -SRC_URI[md5sum] =3D "1fe43f6641dbf1e1766e2a02cf68a9c3"
> > -SRC_URI[sha256sum] =3D "d43baf23dc6887fe8f8e9b75cabaabc5f4bbbaa0f9eff4=
4278d276141752a545"
> > -
> > -UPSTREAM_CHECK_URI =3D "https://github.com/libpwquality/libpwquality/r=
eleases"
> > -
> > -S =3D "${WORKDIR}/${SRCNAME}-${PV}"
> > +SRCREV =3D "5490e96a3dd6ed7371435ca5b3ccef98bdb48b5a"
> >
> > -DEPENDS =3D "cracklib virtual/gettext"
> > +S =3D "${WORKDIR}/git"
> >
> > -inherit autotools setuptools3-base gettext
> > +inherit autotools-brokensep gettext setuptools3-base
> >
> > -B =3D "${S}"
> > +do_configure:prepend() {
> > +    touch ${S}/ABOUT-NLS
>
> Building from sources is good old maintainer-mode in autotools speak
> and it does need additional steps
> gettextize would have produced this file properly. but we do not run
> it as part of autotools bbclass's autoreconf step.
> instead of creating an empty file maybe copy it from native sysroot's
> gettext manually
>
> cp ${STAGING_DATADIR_NATIVE}/gettext/ABOUT-NLS ${AUTOTOOLS_AUXDIR}/
>
> would be nicer.
>
> > +}
> >
> >  export PYTHON_DIR
> >  export BUILD_SYS
> > @@ -35,7 +32,7 @@ EXTRA_OECONF +=3D "--with-python-rev=3D${PYTHON_BASEV=
ERSION} \
> >  "
> >
> >  PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'p=
am', '', d)}"
> > -PACKAGECONFIG[pam] =3D "--enable-pam, --disable-pam, libpam"
> > +PACKAGECONFIG[pam] =3D "--enable-pam,--disable-pam,libpam"
> >
> >  FILES:${PN} +=3D "${base_libdir}/security/pam_pwquality.so"
> >  FILES:${PN}-dbg +=3D "${base_libdir}/security/.debug"
> > --
> > 2.25.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#107178): https://lists.openembedded.org/g/openembed=
ded-devel/message/107178
> > Mute This Topic: https://lists.openembedded.org/mt/102903271/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

