Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DF49C4167B
	for <webhook@archiver.kernel.org>; Fri,  1 Dec 2023 01:06:13 +0000 (UTC)
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
 by mx.groups.io with SMTP id smtpd.web11.12238.1701392772780996251
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Nov 2023 17:06:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lee7D12S;
 spf=pass (domain: gmail.com, ip: 209.85.161.47, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-58d9a4e9464so816856eaf.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Nov 2023 17:06:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701392772; x=1701997572; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cqRmQeZqaE/70zYTUXzDQdUrWgPPCXC5OYD+So2pgDA=;
        b=lee7D12SHsgfPOqrz+7PZRrJS8sKUDgzhvz6Y6ZXi9L0WKHIu90pPrQZ8x9epN9GaA
         YpfKs3f2t+KkV+EC47mVReIht3qzRIAlATHKGsgtfJPx+yrGijR+LHX1LGiYD8O8QtWi
         /f9JB46Q/buRjGTlSw6mNZcPfKuBqr7taWjDr9Jb72ZBd95Wk3CBLDUwsSxA+vs9w9Hl
         SNSiBHBbKOvCRcpqPuivtAUo26vS8Mf3EjvDYAZVMEl3efP1mGq3Ny0OPYQoHwQjBGlX
         8X6QBisuKrailqyiYWzjCVxWZqVMrVqCdNskqNgSxX2UlOPNjIyWycEq5y1lpkXEGoy3
         LY3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701392772; x=1701997572;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cqRmQeZqaE/70zYTUXzDQdUrWgPPCXC5OYD+So2pgDA=;
        b=Hm8hluNcVfslYK30fC8V/o8OPRPZWpnLrwDyZFnQtLJ9zvJq1Bh/3bfNuH/mhQw7sk
         SaFRcShU86NEFhucVDJpA/kvhhB3cOwMiripXgfQyxHWLZ93W14VTt/yQAljiehdut6p
         6p3hodS/fQ1Bg7RqL0TjrLDWe6zp4nH2qFrgjdJfyzNbF+mNxS/ozQLWlLxOKC0fQOoN
         kyLd1XbjfrxT55svNAHKAuXQGmPU9XX/rq9xTBQWdd9fTYCGJEhaiAZmq5GhGMLrCX4N
         jUaSaLIMsOZG/LHzHobbzarFGRpzlEJCMPj0+oVvfmgf0lZmWMr3h6ylZClOfdUCNGMy
         H9Iw==
X-Gm-Message-State: AOJu0Yw1Zjf/lHrAkNwMvo6RQmR5oC9rj7Sl3Ee4FH9QCAbQRUBPR721
	4KdePXWbFAqJlatjQL5N3HzxfY+2vHW45yb3lmU=
X-Google-Smtp-Source: AGHT+IF9V0s2F7N0bXRw01oTOBKwLxGmXNUE0cRPd/1WozmiPvJ/BxE0bXuXAjM29fz9H2taIzjupz5HMgAAulclF44=
X-Received: by 2002:a05:6870:f14c:b0:1fa:a78b:cfd2 with SMTP id
 l12-20020a056870f14c00b001faa78bcfd2mr7846643oac.50.1701392771831; Thu, 30
 Nov 2023 17:06:11 -0800 (PST)
MIME-Version: 1.0
References: <20231130212143.3192153-1-alperyasinak1@gmail.com>
In-Reply-To: <20231130212143.3192153-1-alperyasinak1@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 30 Nov 2023 17:05:45 -0800
Message-ID: <CAMKF1spC5zOVEkhbk6fUqw33zeWTHVMXgMX5eY1wkx+eNYOPSQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] libpwquality: upgrade 1.4.4 -> 1.4.5
To: Alper Ak <alperyasinak1@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 01 Dec 2023 01:06:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107181

On Thu, Nov 30, 2023 at 1:22=E2=80=AFPM Alper Ak <alperyasinak1@gmail.com> =
wrote:
>
> * 0001-fix-musl-build.patch removed because fixed in the new version. -> =
https://github.com/libpwquality/libpwquality/pull/53
> * Created ABOUT-NLS file because of following error -> error: required fi=
le './ABOUT-NLS' not found
>
> Changelog:
>
> * Translation updates
> * Minor bug fixes and documentation enhancements
>
> Signed-off-by: alperak <alperyasinak1@gmail.com>
> ---
> ABOUT-NLS should have installed via gettext.
> I couldn't find an answer and asked Ross Burton, he suggested I could sol=
ve it this way.
>
>  .../files/0001-fix-musl-build.patch           | 72 -------------------
>  ...quality_1.4.4.bb =3D> libpwquality_1.4.5.bb} | 27 ++++---
>  2 files changed, 12 insertions(+), 87 deletions(-)
>  delete mode 100644 meta-oe/recipes-extended/libpwquality/files/0001-fix-=
musl-build.patch
>  rename meta-oe/recipes-extended/libpwquality/{libpwquality_1.4.4.bb =3D>=
 libpwquality_1.4.5.bb} (61%)
>
> diff --git a/meta-oe/recipes-extended/libpwquality/files/0001-fix-musl-bu=
ild.patch b/meta-oe/recipes-extended/libpwquality/files/0001-fix-musl-build=
.patch
> deleted file mode 100644
> index 2cbdd6c74..000000000
> --- a/meta-oe/recipes-extended/libpwquality/files/0001-fix-musl-build.pat=
ch
> +++ /dev/null
> @@ -1,72 +0,0 @@
> -Do not use fgetpwent_r
> -
> -fgetpwent_r does not exist on musl
> -
> -Source: https://git.alpinelinux.org/aports/tree/community/libpwquality/0=
001-fix-musl-build.patch
> -Upstream-Status: Pending
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---- a/src/pam_pwquality.c
> -+++ b/src/pam_pwquality.c
> -@@ -19,6 +19,7 @@
> - #include <stdio.h>
> - #include <pwd.h>
> - #include <errno.h>
> -+#include <security/pam_modutil.h>
> - #include "pwquality.h"
> -
> - /*
> -@@ -43,8 +44,6 @@ struct module_options {
> -
> - #define CO_RETRY_TIMES  1
> -
> --#define PATH_PASSWD "/etc/passwd"
> --
> - static int
> - _pam_parse (pam_handle_t *pamh, struct module_options *opt,
> -             int argc, const char **argv)
> -@@ -98,44 +97,7 @@ static int
> - check_local_user (pam_handle_t *pamh,
> -                   const char *user)
> - {
> --        struct passwd pw, *pwp;
> --        char buf[4096];
> --        int found =3D 0;
> --        FILE *fp;
> --        int errn;
> --
> --        fp =3D fopen(PATH_PASSWD, "r");
> --        if (fp =3D=3D NULL) {
> --                pam_syslog(pamh, LOG_ERR, "unable to open %s: %s",
> --                           PATH_PASSWD, pam_strerror(pamh, errno));
> --                return -1;
> --        }
> --
> --        for (;;) {
> --                errn =3D fgetpwent_r(fp, &pw, buf, sizeof (buf), &pwp);
> --                if (errn =3D=3D ERANGE) {
> --                        pam_syslog(pamh, LOG_WARNING, "%s contains very=
 long lines; corrupted?",
> --                                   PATH_PASSWD);
> --                        /* we can continue here as next call will read =
further */
> --                        continue;
> --                }
> --                if (errn !=3D 0)
> --                        break;
> --                if (strcmp(pwp->pw_name, user) =3D=3D 0) {
> --                        found =3D 1;
> --                        break;
> --                }
> --        }
> --
> --        fclose (fp);
> --
> --        if (errn !=3D 0 && errn !=3D ENOENT) {
> --                pam_syslog(pamh, LOG_ERR, "unable to enumerate local ac=
counts: %s",
> --                           pam_strerror(pamh, errn));
> --                return -1;
> --        } else {
> --                return found;
> --        }
> -+      return pam_modutil_check_user_in_passwd(pamh, user, NULL) =3D=3D =
PAM_SUCCESS;
> - }
> -
> - PAM_EXTERN int
> diff --git a/meta-oe/recipes-extended/libpwquality/libpwquality_1.4.4.bb =
b/meta-oe/recipes-extended/libpwquality/libpwquality_1.4.5.bb
> similarity index 61%
> rename from meta-oe/recipes-extended/libpwquality/libpwquality_1.4.4.bb
> rename to meta-oe/recipes-extended/libpwquality/libpwquality_1.4.5.bb
> index b50c0f7de..787543637 100644
> --- a/meta-oe/recipes-extended/libpwquality/libpwquality_1.4.4.bb
> +++ b/meta-oe/recipes-extended/libpwquality/libpwquality_1.4.5.bb
> @@ -1,27 +1,24 @@
>  DESCRIPTION =3D "Library for password quality checking and generating ra=
ndom passwords"
>  HOMEPAGE =3D "https://github.com/libpwquality/libpwquality"
>  SECTION =3D "devel/lib"
> -LICENSE =3D "GPL-2.0-only"
> +
> +LICENSE =3D "GPL-2.0-or-later"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6bd2f1386df813a459a0c34fde676=
fc2"
>
> -SRCNAME =3D "libpwquality"
> -SRC_URI =3D "https://github.com/${SRCNAME}/${SRCNAME}/releases/download/=
${SRCNAME}-${PV}/${SRCNAME}-${PV}.tar.bz2 \
> +DEPENDS =3D "cracklib"
> +
> +SRC_URI =3D "git://github.com/libpwquality/libpwquality;branch=3Dmaster;=
protocol=3Dhttps \
>             file://add-missing-python-include-dir-for-cross.patch \
>  "
> -SRC_URI:append:libc-musl =3D " file://0001-fix-musl-build.patch "
> -
> -SRC_URI[md5sum] =3D "1fe43f6641dbf1e1766e2a02cf68a9c3"
> -SRC_URI[sha256sum] =3D "d43baf23dc6887fe8f8e9b75cabaabc5f4bbbaa0f9eff442=
78d276141752a545"
> -
> -UPSTREAM_CHECK_URI =3D "https://github.com/libpwquality/libpwquality/rel=
eases"
> -
> -S =3D "${WORKDIR}/${SRCNAME}-${PV}"
> +SRCREV =3D "5490e96a3dd6ed7371435ca5b3ccef98bdb48b5a"
>
> -DEPENDS =3D "cracklib virtual/gettext"
> +S =3D "${WORKDIR}/git"
>
> -inherit autotools setuptools3-base gettext
> +inherit autotools-brokensep gettext setuptools3-base
>
> -B =3D "${S}"
> +do_configure:prepend() {
> +    touch ${S}/ABOUT-NLS

Building from sources is good old maintainer-mode in autotools speak
and it does need additional steps
gettextize would have produced this file properly. but we do not run
it as part of autotools bbclass's autoreconf step.
instead of creating an empty file maybe copy it from native sysroot's
gettext manually

cp ${STAGING_DATADIR_NATIVE}/gettext/ABOUT-NLS ${AUTOTOOLS_AUXDIR}/

would be nicer.

> +}
>
>  export PYTHON_DIR
>  export BUILD_SYS
> @@ -35,7 +32,7 @@ EXTRA_OECONF +=3D "--with-python-rev=3D${PYTHON_BASEVER=
SION} \
>  "
>
>  PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam=
', '', d)}"
> -PACKAGECONFIG[pam] =3D "--enable-pam, --disable-pam, libpam"
> +PACKAGECONFIG[pam] =3D "--enable-pam,--disable-pam,libpam"
>
>  FILES:${PN} +=3D "${base_libdir}/security/pam_pwquality.so"
>  FILES:${PN}-dbg +=3D "${base_libdir}/security/.debug"
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#107178): https://lists.openembedded.org/g/openembedde=
d-devel/message/107178
> Mute This Topic: https://lists.openembedded.org/mt/102903271/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

