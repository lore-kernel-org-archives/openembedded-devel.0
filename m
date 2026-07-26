Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39D9AC531C9
	for <webhook@archiver.kernel.org>; Sun, 26 Jul 2026 20:53:04 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17597.1785099182155077996
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Jul 2026 13:53:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=YFPw4sUm;
 spf=pass (domain: gmail.com, ip: 209.85.128.170, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-81ec29f1d07so22898767b3.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 26 Jul 2026 13:53:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785099181; cv=none;
        d=google.com; s=arc-20260327;
        b=cEK8oX7n6Taz41lAjUxXhfU1B2mwdUOTsMdphJB2rM0mZ4E2PYAmLI7icNXff17lpM
         5FMSed38PHAPEkYB9ic0Xu5sLOcleFFOCBHQV83TK2jNpQWlY5S0AOoKUKP5qgHg3g1l
         MDnbIwlCYGhyAODcZkBj3xsXbKd9oGqkUGNt4xjKSnIpGKhNEdRBB3vGajhlkwUibkU8
         IIRbrblxNzLMbOHCLtnf/S1u+HVzCep+h5MhKrrT09zH0UA3wpGiML50bgx75YbeT1iP
         Ucmtb9mBgCFLo68Ojzvgh3dRiio3kvO9ZwSq/bG3aguhBblTyzRpRxBH6q6Rt46PZavT
         0UoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=6LASM4+O1vcbx10yraUbhQdsd8+YOXYXl670lSzH3zs=;
        fh=lOlbPsEtRoeH8pvp/fTdPROCg942iaLIPGb8YTSLrBM=;
        b=soHgtJzzAg1mzf51JRsDk2W30i5EUgRiw5phNAuO8ZgGs/uQe2DQQiQsVtdYL8/uyb
         uBeQi1FAzh23EPxZCGkNmtT8Dw19DHPe806Ry79TTN4+afyQLd1hPIUbH7Mq0eJv2Nb0
         m1QmKSggWhSy4TTAbuzFq0Ks6rsRiCD3jqlPqvVg/nWF6e7PBEJaFFltOxa6/+ZLryY8
         n99oPrhzMwKTy1jhb9+QX/BNa9zEEh1tqFFw8L5B5aRPI0UYTZyy9o95EJ4ned/Chl92
         9rCE7zeNsCtqv+8sgOSQQliRQoykPrnvtUNshXbYLeHk0ZKuHhQYru/0bsg0gKKN6JZT
         y9SQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785099181; x=1785703981; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6LASM4+O1vcbx10yraUbhQdsd8+YOXYXl670lSzH3zs=;
        b=YFPw4sUmjErxq+tuPcjFDX4szMh0pRrxtyi7NgtAbUaifVhLNdgOQfayPGEN+5N++y
         8hjFJ+uwhO5tO+Q8ufP+hmB+tuW9YHza+2YuRAUsQWPhVTAVFUydWg3XUcnaTvsxseIQ
         GdHNNlMNxR4bebctJ17/ED2LIvw9bV2AnNiL3vx1pF+Mw0BeFI6XDjBDd3gPtKv/qSqh
         pbC6OeXAsMRSmYv9/HLps04I5rwdUl/HpWEY/BlTBCvaxSJIseIPOBw9SoZZk4PXYBuW
         hgYTCvqL5ioJS4Ibh0035JTApCVlsb5gbdtQL+qxn5lrvDQWKOpurm0WsZO0gs5Vu/HY
         adNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785099181; x=1785703981;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6LASM4+O1vcbx10yraUbhQdsd8+YOXYXl670lSzH3zs=;
        b=XdBY/tGiiWjuegA4RrfVjDIcz3NQL+YKiS0ipSYIKkTgmswECMQijWGoguVT+ki2vX
         N3GEsm+J41YGzDX0yjlIRcPITHao2xK3XgujpugkYYTHGz8O2ZdCEvnQMzQRL6DF7UCa
         P/cUeUC67rc6h9rBGjq3TcHLXO5oCOF+Ep1xKeY3IkOAWZXifE2YPnq1+8xlyuQ7mXER
         B9+pcK1oWswK9fHujQRVIaFh79aY6gWIlJzTzrsPD7zE48Hs5HhTiTNbGCFlTt9lclzJ
         8r/G6Ua2x3q+/PBoDt7w5EcfxGhFsOAV98QMAysvqRUQZX8AoPGqH2CFwi8rmzm4jkX9
         hiWw==
X-Gm-Message-State: AOJu0Yx/aU9vC8b3ysjqkOtzClpI7GwaqUpMUcEMw3U8m22qTykSCuqY
	MUGn0lsj3ta1BPBItg3lNlbbWF4IfmUTM7jQeQXrOhzq9adV3/kt0GBUOTJIi1A/f5sn18eTqkp
	4vjftNuSa4xmgCSGl8QoTPkClw7umMeQ=
X-Gm-Gg: AR+sD129tANgIxRcbJzsSVuBP3A3VHGrMOu1DEzHHmQr+EE9sf9vp2a4AO/kq5r3f/d
	waQHsMLP7nTLQyb01Y1DeUkaL+1vXteH1P3PJYbUhAvVcIJRiETkHaknE9E1w1ZCG7/3FLszSPl
	qdkUwWMn43adJ6xiD/K5N34+bz40Dk6bLbRZOehNaAjBxTJz/d39N5mUYdEkenl21be2CVn6ofb
	4ydq01vFk1gcZk1A9i+7hFArqbkVE0Mg/qrOTzhYbrr9055WabWdFS7A0/HQHnJRw6E2/Vc8cfk
	YM4PECgDvuLQkdnwaRec6+fvAIH/6cxkSDUx0Veg8Ju9xYjg7Ev8Keba307w9cihpLu5gTgziMD
	q2P7/0DqY8C0rul7g5px6jWM+8JIkHaBzAHIqNtUuy7R+Ud1vPKN0NRzrryE=
X-Received: by 2002:a05:690c:d91:b0:7ff:8c8d:162a with SMTP id
 00721157ae682-81f69e2e967mr15341637b3.39.1785099180965; Sun, 26 Jul 2026
 13:53:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260726031333.1318399-1-festevam@gmail.com>
In-Reply-To: <20260726031333.1318399-1-festevam@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 26 Jul 2026 13:52:33 -0700
X-Gm-Features: AUfX_mwuApBT0EQdNiiofLtIiwjdFNnfDtv9rbiwg4UmJ7yR73X2-oZQpc4DhlU
Message-ID: <CAMKF1sq6O9i_jVG0r9w47k0Xvpn_Skbb9dnmr8c8K2LZZzgeXw@mail.gmail.com>
Subject: Re: [oe] [PATCH] imx-cst: upgrade 3.4.1 -> 4.0.1
To: festevam@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000920513065789cac0"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 26 Jul 2026 20:53:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128453

--000000000000920513065789cac0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Fabio

This fails to build with clang/qemuarm64 see -
https://errors.yoctoproject.org/Errors/Details/951465/

On Sat, Jul 25, 2026 at 8:13=E2=80=AFPM Fabio Estevam via lists.openembedde=
d.org
<festevam=3Dgmail.com@lists.openembedded.org> wrote:

> CST 4.0.1 replaces the custom Makefile build with CMake. Inherit the
> cmake class, use the source src directory, and switch the parser
> dependency from byacc to bison. Add json-c and point CMake at its staged
> headers.
>
> Disable installation of internal CST static libraries. Suppress line
> directives from flex and bison generated sources to avoid embedding build
> paths in the output.
>
> Refresh source and license checksums and account for json-c's MIT
> license. Drop the obsolete Makefile race fix.
>
> Import Debian's check_return_values.patch from its packaging repository:
>
> https://salsa.debian.org/collabora-team/imx-code-signing-tool
>
> It handles fgets() failures required by the warning-as-error build.
>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  .../0001-check-return-value-of-fgets.patch    | 101 ++++++++++++++++++
>  ...fix-missing-makefile-rule-dependency.patch |  45 --------
>  .../recipes-support/imx-cst/imx-cst_3.4.1.bb  |  42 --------
>  .../recipes-support/imx-cst/imx-cst_4.0.1.bb  |  36 +++++++
>  4 files changed, 137 insertions(+), 87 deletions(-)
>  create mode 100644
> meta-oe/recipes-support/imx-cst/imx-cst/0001-check-return-value-of-fgets.=
patch
>  delete mode 100644
> meta-oe/recipes-support/imx-cst/imx-cst/0001-fix-missing-makefile-rule-de=
pendency.patch
>  delete mode 100644 meta-oe/recipes-support/imx-cst/imx-cst_3.4.1.bb
>  create mode 100644 meta-oe/recipes-support/imx-cst/imx-cst_4.0.1.bb
>
> diff --git
> a/meta-oe/recipes-support/imx-cst/imx-cst/0001-check-return-value-of-fget=
s.patch
> b/meta-oe/recipes-support/imx-cst/imx-cst/0001-check-return-value-of-fget=
s.patch
> new file mode 100644
> index 000000000000..be3165f3d982
> --- /dev/null
> +++
> b/meta-oe/recipes-support/imx-cst/imx-cst/0001-check-return-value-of-fget=
s.patch
> @@ -0,0 +1,101 @@
> +From 8a0717cc07e78d1133cc10e62220770734181bee Mon Sep 17 00:00:00 2001
> +From: Tobias Deiminger <tobias.deiminger@linutronix.de>
> +Date: Fri, 30 Jan 2026 01:55:36 +0100
> +Subject: [PATCH] Check return value of fgets
> +
> +The cmake project has a reasonable default setting
> +CMAKE_COMPILE_WARNING_AS_ERROR=3DON in cmake/compiler_options.cmake. Wit=
h
> this
> +setting our build will fail on unchecked return values from fgets(). Thi=
s
> +patch fixes the issue by adding return value checks.
> +
> +This is not just to silence the errors. C99 defines for fgets: "If a rea=
d
> +error occurs during the operation, the array contents are indeterminate
> and a
> +null pointer is returned". We should actually check the return value to
> avoid
> +undefined behavior from processing indeterminate data.
> +
> +Let get_passcode_to_key_file return -1 on error, since it is used as
> callback
> +to OpenSSLs PEM_read_bio_PrivateKey_ex where documentation states "The
> +callback must return the number of characters in the passphrase or -1 if
> an
> +error occurred".
> +
> +Upstream-Status: Pending
> +---
> + src/lib/back_end/pkey.c            |  6 +++++-
> + src/tools/pki_tree/hab4_pki_tree.c | 25 +++++++++++++++++++++----
> + 2 files changed, 26 insertions(+), 5 deletions(-)
> +
> +diff --git a/src/lib/back_end/pkey.c b/src/lib/back_end/pkey.c
> +index 31b5c3d..d6e9784 100644
> +--- a/src/lib/back_end/pkey.c
> ++++ b/src/lib/back_end/pkey.c
> +@@ -102,8 +102,12 @@ int get_passcode_to_key_file(char *buf, int size,
> int rwflag, void *userdata)
> +         return 0;
> +     }
> +
> +-    fgets(buf, size, password_fp);
> ++    buf =3D fgets(buf, size, password_fp);
> +     fclose(password_fp);
> ++    if (buf =3D=3D NULL)
> ++    {
> ++        return -1;
> ++    }
> +     chomp(buf);
> +
> +     return strlen(buf);
> +diff --git a/src/tools/pki_tree/hab4_pki_tree.c
> b/src/tools/pki_tree/hab4_pki_tree.c
> +index 3c878e4..4ff15b2 100644
> +--- a/src/tools/pki_tree/hab4_pki_tree.c
> ++++ b/src/tools/pki_tree/hab4_pki_tree.c
> +@@ -118,6 +118,7 @@ int main(int argc, char **argv)
> +     int num_srk =3D 0;
> +     int val_period =3D 0;
> +     char *pass =3D NULL;
> ++    char *user_input =3D NULL;
> +     unsigned long serial =3D 0;
> +     char duration_str[10] =3D {0};
> +     char num_srk_str[10] =3D {0};
> +@@ -304,10 +305,18 @@ int main(int argc, char **argv)
> +         if (strcmp(existing_ca, "y") =3D=3D 0)
> +         {
> +             printf("Enter CA key name: ");
> +-            fgets(ca_key, sizeof(ca_key), stdin);
> ++            user_input =3D fgets(ca_key, sizeof(ca_key), stdin);
> ++            if (user_input =3D=3D NULL) {
> ++                fprintf(stderr, "Error while reading user input\n");
> ++                return 1;
> ++            }
> +             ca_key[strcspn(ca_key, "\n")] =3D '\0';
> +             printf("Enter CA certificate name: ");
> +-            fgets(ca_cert, sizeof(ca_cert), stdin);
> ++            user_input =3D fgets(ca_cert, sizeof(ca_cert), stdin);
> ++            if (user_input =3D=3D NULL) {
> ++                fprintf(stderr, "Error while reading user input\n");
> ++                return 1;
> ++            }
> +             ca_cert[strcspn(ca_cert, "\n")] =3D '\0';
> +         }
> +         printf("\nKey type options (confirm targeted device supports
> desired "
> +@@ -330,10 +339,18 @@ int main(int argc, char **argv)
> +                             ARRAY_SIZE(rsa_kl_values));
> +         }
> +         printf("Enter PKI tree duration (years): ");
> +-        fgets(duration_str, sizeof(duration_str), stdin);
> ++        user_input =3D fgets(duration_str, sizeof(duration_str), stdin)=
;
> ++        if (user_input =3D=3D NULL) {
> ++            fprintf(stderr, "Error while reading user input\n");
> ++            return 1;
> ++        }
> +         duration =3D atoi(duration_str);
> +         printf("How many Super Root Keys should be generated ? : ");
> +-        fgets(num_srk_str, sizeof(num_srk_str), stdin);
> ++        user_input =3D fgets(num_srk_str, sizeof(num_srk_str), stdin);
> ++        if (user_input =3D=3D NULL) {
> ++            fprintf(stderr, "Error while reading user input\n");
> ++            return 1;
> ++        }
> +         num_srk =3D atoi(num_srk_str);
> +         ask_until_valid(
> +             "Do you want the SRK certificates to have the CA flag set?
> (y/n) :",
> +--
> +2.47.3
> +
> diff --git
> a/meta-oe/recipes-support/imx-cst/imx-cst/0001-fix-missing-makefile-rule-=
dependency.patch
> b/meta-oe/recipes-support/imx-cst/imx-cst/0001-fix-missing-makefile-rule-=
dependency.patch
> deleted file mode 100644
> index ce7626ab31e5..000000000000
> ---
> a/meta-oe/recipes-support/imx-cst/imx-cst/0001-fix-missing-makefile-rule-=
dependency.patch
> +++ /dev/null
> @@ -1,45 +0,0 @@
> -From 73509cb22ffab827dc3e3ccda2781683b8e8296d Mon Sep 17 00:00:00 2001
> -From: =3D?UTF-8?q?K=3DC3=3DA9l=3DC3=3DA9fa=3D20San=3DC3=3DA9?=3D <kelefa=
.sane@smile.fr>
> -Date: Mon, 2 Jun 2025 11:07:08 +0200
> -Subject: [PATCH] fix missing makefile rule dependency
> -
> -During, the package build with an high CPU load we can face
> -a build failed issue, caused by the header file cst_parser.h not present
> -when compiling cst_lexer.c, which depend on cst_parser.h:
> -| x86_64-poky-linux-gcc  ... -c cst_lexer.c -o cst_lexer.d
> -| ../../code/front_end/src/cst_lexer.l:21:10: fatal error:
> -|cst_parser.h: No such file or directory
> -|    21 | #include "cst_parser.h"
> -|       |          ^~~~~~~~~~~~~~
> -| compilation terminated.
> -
> -The file cst_parser.h is generated during compilation
> -by a makefile rule which also generate cst_parser.c
> -
> -To fix the issue, makefile rule needed to be update
> -in order for compilation of cst_lexer.c to be done,
> -always after the generation of cst_parser.h and .c
> -
> -Upstream-Status: Submitted [
> https://community.nxp.com/t5/Other-NXP-Products/Package-imx-code-signing-=
tool-3-4-0-dfsg-2-build-issue/m-p/2108575#M28853
> ]
> -
> -Signed-off-by: Kelefa Sane <kelefa.sane@smile.fr>
> ----
> - code/build/make/rules.mk | 5 +++++
> - 1 file changed, 5 insertions(+)
> -
> -diff --git a/code/build/make/rules.mk b/code/build/make/rules.mk
> -index 7720e4b..239108b 100644
> ---- a/code/build/make/rules.mk
> -+++ b/code/build/make/rules.mk
> -@@ -35,6 +35,11 @@ LFLAGS  :=3D -t
> -       @echo "Link $@"
> -       $(LD) $^ $(LDFLAGS) -o $@
> -
> -+# Compilation of cst_lexer.c require cst_parser.h
> -+# (cst_lexer.c include cst_parser.h) which is generated
> -+# by the same makefile genrating cst_parser.c
> -+cst_lexer.o: cst_parser.c
> -+
> - %.o: %.c
> -       @echo "Compile $@"
> -       # generate dependency file
> diff --git a/meta-oe/recipes-support/imx-cst/imx-cst_3.4.1.bb
> b/meta-oe/recipes-support/imx-cst/imx-cst_3.4.1.bb
> deleted file mode 100644
> index c9e73a83b437..000000000000
> --- a/meta-oe/recipes-support/imx-cst/imx-cst_3.4.1.bb
> +++ /dev/null
> @@ -1,42 +0,0 @@
> -SUMMARY =3D "i.MX code signing tool"
> -DESCRIPTION =3D "Code signing support that integrates the HABv4 and AHAB
> library for i.MX processors"
> -LICENSE =3D "Apache-2.0 AND BSD-3-Clause"
> -
> -LIC_FILES_CHKSUM =3D "\
> -    file://LICENSE.bsd3;md5=3D14aba05f9fa6c25527297c8aac95fcf6 \
> -    file://LICENSE.hidapi;md5=3De0ea014f523f64f0adb13409055ee59e \
> -    file://LICENSE.openssl;md5=3D3441526b1df5cc01d812c7dfc218cea6 \
> -"
> -
> -DEPENDS =3D "byacc-native flex-native openssl"
> -
> -# debian: 3.4.0+dfsg-2
> -DEBIAN_PGK_NAME =3D "imx-code-signing-tool"
> -DEBIAN_PGK_VERSION =3D "${PV}+dfsg"
> -
> -SRC_URI =3D "\
> -
> ${DEBIAN_MIRROR}/main/i/${DEBIAN_PGK_NAME}/${DEBIAN_PGK_NAME}_${DEBIAN_PG=
K_VERSION}.orig.tar.xz
> \
> -    file://0001-fix-missing-makefile-rule-dependency.patch \
> -"
> -
> -SRC_URI[sha256sum] =3D
> "342c0c028658a4a859fe70578b58c3b07e17bee0c7e3a13d063d4791e82c2dee"
> -
> -S =3D "${UNPACKDIR}/${DEBIAN_PGK_NAME}-${DEBIAN_PGK_VERSION}"
> -
> -EXTRA_OEMAKE =3D 'CC=3D"${CC}" LD=3D"${CC}" AR=3D"${AR}" OBJCOPY=3D"${OB=
JCOPY}"'
> -
> -inherit siteinfo
> -
> -do_compile() {
> -    oe_runmake -C code/obj.linux${SITEINFO_BITS}
> OSTYPE=3Dlinux${SITEINFO_BITS} ENCRYPTION=3Dyes COPTIONS=3D"${CFLAGS}
> ${CPPFLAGS}" LDOPTIONS=3D"${LDFLAGS}"
> -    oe_runmake -C add-ons/hab_csf_parser COPTS=3D"${CFLAGS} ${CPPFLAGS}
> ${LDFLAGS}"
> -}
> -
> -do_install () {
> -    install -d ${D}${bindir}
> -    install -m 755 ${S}/code/obj.linux${SITEINFO_BITS}/cst ${D}${bindir}=
/
> -    install -m 755 ${S}/code/obj.linux${SITEINFO_BITS}/srktool
> ${D}${bindir}
> -    install -m 755 ${S}/add-ons/hab_csf_parser/csf_parser ${D}${bindir}
> -}
> -
> -BBCLASSEXTEND =3D "native nativesdk"
> diff --git a/meta-oe/recipes-support/imx-cst/imx-cst_4.0.1.bb
> b/meta-oe/recipes-support/imx-cst/imx-cst_4.0.1.bb
> new file mode 100644
> index 000000000000..826943fe09c3
> --- /dev/null
> +++ b/meta-oe/recipes-support/imx-cst/imx-cst_4.0.1.bb
> @@ -0,0 +1,36 @@
> +SUMMARY =3D "i.MX code signing tool"
> +DESCRIPTION =3D "Code signing support that integrates the HABv4 and AHAB
> library for i.MX processors"
> +LICENSE =3D "Apache-2.0 AND BSD-3-Clause AND MIT"
> +
> +LIC_FILES_CHKSUM =3D "\
> +    file://licenses/LICENSE.bsd3;md5=3D1ef4297097d818a9787ed775218c133f =
\
> +    file://licenses/LICENSE.json-c;md5=3Dde54b60fbbc35123ba193fea8ee216f=
2 \
> +    file://licenses/LICENSE.openssl;md5=3D3441526b1df5cc01d812c7dfc218ce=
a6 \
> +"
> +
> +DEPENDS =3D "bison-native flex-native json-c openssl"
> +
> +DEBIAN_PKG_NAME =3D "imx-code-signing-tool"
> +DEBIAN_PKG_VERSION =3D "${PV}+dfsg"
> +
> +SRC_URI =3D "\
> +
> ${DEBIAN_MIRROR}/main/i/${DEBIAN_PKG_NAME}/${DEBIAN_PKG_NAME}_${DEBIAN_PK=
G_VERSION}.orig.tar.xz
> \
> +    file://0001-check-return-value-of-fgets.patch \
> +"
> +SRC_URI[sha256sum] =3D
> "fd92a1a9faa10fb81bbf752c7ee1e257f17e1ec4c2964f8a47adf8a3eaa7df41"
> +
> +S =3D "${UNPACKDIR}/${DEBIAN_PKG_NAME}-${DEBIAN_PKG_VERSION}"
> +
> +OECMAKE_SOURCEPATH =3D "${S}/src"
> +
> +# CST_INSTALL only controls installation of internal static libraries,
> not tools.
> +EXTRA_OECMAKE =3D "\
> +    -DCST_INSTALL=3DOFF \
> +    -DFLEX_TARGET_ARG_COMPILE_FLAGS=3D--noline \
> +    -DBISON_TARGET_ARG_COMPILE_FLAGS=3D--no-lines \
> +    -DJSONC_INCLUDE_DIR=3D${STAGING_INCDIR} \
> +"
> +
> +inherit cmake
> +
> +BBCLASSEXTEND =3D "native nativesdk"
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#128450):
> https://lists.openembedded.org/g/openembedded-devel/message/128450
> Mute This Topic: https://lists.openembedded.org/mt/120448761/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000920513065789cac0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Fabio<div><br></div><div>This fails to build with clang/qe=
muarm64 see -=C2=A0<a href=3D"https://errors.yoctoproject.org/Errors/Detail=
s/951465/">https://errors.yoctoproject.org/Errors/Details/951465/</a></div>=
</div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr"=
 class=3D"gmail_attr">On Sat, Jul 25, 2026 at 8:13=E2=80=AFPM Fabio Estevam=
 via <a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &=
lt;festevam=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.com=
@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">CST 4.0.1 replaces the custom Makefile build with CM=
ake. Inherit the<br>
cmake class, use the source src directory, and switch the parser<br>
dependency from byacc to bison. Add json-c and point CMake at its staged<br=
>
headers.<br>
<br>
Disable installation of internal CST static libraries. Suppress line<br>
directives from flex and bison generated sources to avoid embedding build<b=
r>
paths in the output.<br>
<br>
Refresh source and license checksums and account for json-c&#39;s MIT<br>
license. Drop the obsolete Makefile race fix.<br>
<br>
Import Debian&#39;s check_return_values.patch from its packaging repository=
:<br>
<br>
<a href=3D"https://salsa.debian.org/collabora-team/imx-code-signing-tool" r=
el=3D"noreferrer" target=3D"_blank">https://salsa.debian.org/collabora-team=
/imx-code-signing-tool</a><br>
<br>
It handles fgets() failures required by the warning-as-error build.<br>
<br>
Signed-off-by: Fabio Estevam &lt;<a href=3D"mailto:festevam@gmail.com" targ=
et=3D"_blank">festevam@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../0001-check-return-value-of-fgets.patch=C2=A0 =C2=A0 | 101 +++++++=
+++++++++++<br>
=C2=A0...fix-missing-makefile-rule-dependency.patch |=C2=A0 45 --------<br>
=C2=A0.../recipes-support/imx-cst/<a href=3D"http://imx-cst_3.4.1.bb" rel=
=3D"noreferrer" target=3D"_blank">imx-cst_3.4.1.bb</a>=C2=A0 |=C2=A0 42 ---=
-----<br>
=C2=A0.../recipes-support/imx-cst/<a href=3D"http://imx-cst_4.0.1.bb" rel=
=3D"noreferrer" target=3D"_blank">imx-cst_4.0.1.bb</a>=C2=A0 |=C2=A0 36 +++=
++++<br>
=C2=A04 files changed, 137 insertions(+), 87 deletions(-)<br>
=C2=A0create mode 100644 meta-oe/recipes-support/imx-cst/imx-cst/0001-check=
-return-value-of-fgets.patch<br>
=C2=A0delete mode 100644 meta-oe/recipes-support/imx-cst/imx-cst/0001-fix-m=
issing-makefile-rule-dependency.patch<br>
=C2=A0delete mode 100644 meta-oe/recipes-support/imx-cst/<a href=3D"http://=
imx-cst_3.4.1.bb" rel=3D"noreferrer" target=3D"_blank">imx-cst_3.4.1.bb</a>=
<br>
=C2=A0create mode 100644 meta-oe/recipes-support/imx-cst/<a href=3D"http://=
imx-cst_4.0.1.bb" rel=3D"noreferrer" target=3D"_blank">imx-cst_4.0.1.bb</a>=
<br>
<br>
diff --git a/meta-oe/recipes-support/imx-cst/imx-cst/0001-check-return-valu=
e-of-fgets.patch b/meta-oe/recipes-support/imx-cst/imx-cst/0001-check-retur=
n-value-of-fgets.patch<br>
new file mode 100644<br>
index 000000000000..be3165f3d982<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-support/imx-cst/imx-cst/0001-check-return-value-of-fg=
ets.patch<br>
@@ -0,0 +1,101 @@<br>
+From 8a0717cc07e78d1133cc10e62220770734181bee Mon Sep 17 00:00:00 2001<br>
+From: Tobias Deiminger &lt;<a href=3D"mailto:tobias.deiminger@linutronix.d=
e" target=3D"_blank">tobias.deiminger@linutronix.de</a>&gt;<br>
+Date: Fri, 30 Jan 2026 01:55:36 +0100<br>
+Subject: [PATCH] Check return value of fgets<br>
+<br>
+The cmake project has a reasonable default setting<br>
+CMAKE_COMPILE_WARNING_AS_ERROR=3DON in cmake/compiler_options.cmake. With =
this<br>
+setting our build will fail on unchecked return values from fgets(). This<=
br>
+patch fixes the issue by adding return value checks.<br>
+<br>
+This is not just to silence the errors. C99 defines for fgets: &quot;If a =
read<br>
+error occurs during the operation, the array contents are indeterminate an=
d a<br>
+null pointer is returned&quot;. We should actually check the return value =
to avoid<br>
+undefined behavior from processing indeterminate data.<br>
+<br>
+Let get_passcode_to_key_file return -1 on error, since it is used as callb=
ack<br>
+to OpenSSLs PEM_read_bio_PrivateKey_ex where documentation states &quot;Th=
e<br>
+callback must return the number of characters in the passphrase or -1 if a=
n<br>
+error occurred&quot;.<br>
+<br>
+Upstream-Status: Pending<br>
+---<br>
+ src/lib/back_end/pkey.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
6 +++++-<br>
+ src/tools/pki_tree/hab4_pki_tree.c | 25 +++++++++++++++++++++----<br>
+ 2 files changed, 26 insertions(+), 5 deletions(-)<br>
+<br>
+diff --git a/src/lib/back_end/pkey.c b/src/lib/back_end/pkey.c<br>
+index 31b5c3d..d6e9784 100644<br>
+--- a/src/lib/back_end/pkey.c<br>
++++ b/src/lib/back_end/pkey.c<br>
+@@ -102,8 +102,12 @@ int get_passcode_to_key_file(char *buf, int size, int=
 rwflag, void *userdata)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+-=C2=A0 =C2=A0 fgets(buf, size, password_fp);<br>
++=C2=A0 =C2=A0 buf =3D fgets(buf, size, password_fp);<br>
+=C2=A0 =C2=A0 =C2=A0fclose(password_fp);<br>
++=C2=A0 =C2=A0 if (buf =3D=3D NULL)<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
++=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0chomp(buf);<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0return strlen(buf);<br>
+diff --git a/src/tools/pki_tree/hab4_pki_tree.c b/src/tools/pki_tree/hab4_=
pki_tree.c<br>
+index 3c878e4..4ff15b2 100644<br>
+--- a/src/tools/pki_tree/hab4_pki_tree.c<br>
++++ b/src/tools/pki_tree/hab4_pki_tree.c<br>
+@@ -118,6 +118,7 @@ int main(int argc, char **argv)<br>
+=C2=A0 =C2=A0 =C2=A0int num_srk =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0int val_period =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0char *pass =3D NULL;<br>
++=C2=A0 =C2=A0 char *user_input =3D NULL;<br>
+=C2=A0 =C2=A0 =C2=A0unsigned long serial =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0char duration_str[10] =3D {0};<br>
+=C2=A0 =C2=A0 =C2=A0char num_srk_str[10] =3D {0};<br>
+@@ -304,10 +305,18 @@ int main(int argc, char **argv)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (strcmp(existing_ca, &quot;y&quot;) =
=3D=3D 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0printf(&quot;Enter CA key =
name: &quot;);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fgets(ca_key, sizeof(ca_key), s=
tdin);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 user_input =3D fgets(ca_key, si=
zeof(ca_key), stdin);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (user_input =3D=3D NULL) {<b=
r>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &=
quot;Error while reading user input\n&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 1;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ca_key[strcspn(ca_key, &qu=
ot;\n&quot;)] =3D &#39;\0&#39;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0printf(&quot;Enter CA cert=
ificate name: &quot;);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fgets(ca_cert, sizeof(ca_cert),=
 stdin);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 user_input =3D fgets(ca_cert, s=
izeof(ca_cert), stdin);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (user_input =3D=3D NULL) {<b=
r>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &=
quot;Error while reading user input\n&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 1;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ca_cert[strcspn(ca_cert, &=
quot;\n&quot;)] =3D &#39;\0&#39;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0printf(&quot;\nKey type options (confirm=
 targeted device supports desired &quot;<br>
+@@ -330,10 +339,18 @@ int main(int argc, char **argv)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ARRAY_SIZE(rsa_kl_values));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0printf(&quot;Enter PKI tree duration (ye=
ars): &quot;);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 fgets(duration_str, sizeof(duration_str), std=
in);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 user_input =3D fgets(duration_str, sizeof(dur=
ation_str), stdin);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (user_input =3D=3D NULL) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &quot;Error whi=
le reading user input\n&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 1;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0duration =3D atoi(duration_str);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0printf(&quot;How many Super Root Keys sh=
ould be generated ? : &quot;);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 fgets(num_srk_str, sizeof(num_srk_str), stdin=
);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 user_input =3D fgets(num_srk_str, sizeof(num_=
srk_str), stdin);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (user_input =3D=3D NULL) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &quot;Error whi=
le reading user input\n&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 1;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0num_srk =3D atoi(num_srk_str);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ask_until_valid(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Do you want the SRK =
certificates to have the CA flag set? (y/n) :&quot;,<br>
+-- <br>
+2.47.3<br>
+<br>
diff --git a/meta-oe/recipes-support/imx-cst/imx-cst/0001-fix-missing-makef=
ile-rule-dependency.patch b/meta-oe/recipes-support/imx-cst/imx-cst/0001-fi=
x-missing-makefile-rule-dependency.patch<br>
deleted file mode 100644<br>
index ce7626ab31e5..000000000000<br>
--- a/meta-oe/recipes-support/imx-cst/imx-cst/0001-fix-missing-makefile-rul=
e-dependency.patch<br>
+++ /dev/null<br>
@@ -1,45 +0,0 @@<br>
-From 73509cb22ffab827dc3e3ccda2781683b8e8296d Mon Sep 17 00:00:00 2001<br>
-From: =3D?UTF-8?q?K=3DC3=3DA9l=3DC3=3DA9fa=3D20San=3DC3=3DA9?=3D &lt;<a hr=
ef=3D"mailto:kelefa.sane@smile.fr" target=3D"_blank">kelefa.sane@smile.fr</=
a>&gt;<br>
-Date: Mon, 2 Jun 2025 11:07:08 +0200<br>
-Subject: [PATCH] fix missing makefile rule dependency<br>
-<br>
-During, the package build with an high CPU load we can face<br>
-a build failed issue, caused by the header file cst_parser.h not present<b=
r>
-when compiling cst_lexer.c, which depend on cst_parser.h:<br>
-| x86_64-poky-linux-gcc=C2=A0 ... -c cst_lexer.c -o cst_lexer.d<br>
-| ../../code/front_end/src/cst_lexer.l:21:10: fatal error:<br>
-|cst_parser.h: No such file or directory<br>
-|=C2=A0 =C2=A0 21 | #include &quot;cst_parser.h&quot;<br>
-|=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~~=
~~~~<br>
-| compilation terminated.<br>
-<br>
-The file cst_parser.h is generated during compilation<br>
-by a makefile rule which also generate cst_parser.c<br>
-<br>
-To fix the issue, makefile rule needed to be update<br>
-in order for compilation of cst_lexer.c to be done,<br>
-always after the generation of cst_parser.h and .c<br>
-<br>
-Upstream-Status: Submitted [<a href=3D"https://community.nxp.com/t5/Other-=
NXP-Products/Package-imx-code-signing-tool-3-4-0-dfsg-2-build-issue/m-p/210=
8575#M28853" rel=3D"noreferrer" target=3D"_blank">https://community.nxp.com=
/t5/Other-NXP-Products/Package-imx-code-signing-tool-3-4-0-dfsg-2-build-iss=
ue/m-p/2108575#M28853</a>]<br>
-<br>
-Signed-off-by: Kelefa Sane &lt;<a href=3D"mailto:kelefa.sane@smile.fr" tar=
get=3D"_blank">kelefa.sane@smile.fr</a>&gt;<br>
----<br>
- code/build/make/<a href=3D"http://rules.mk" rel=3D"noreferrer" target=3D"=
_blank">rules.mk</a> | 5 +++++<br>
- 1 file changed, 5 insertions(+)<br>
-<br>
-diff --git a/code/build/make/<a href=3D"http://rules.mk" rel=3D"noreferrer=
" target=3D"_blank">rules.mk</a> b/code/build/make/<a href=3D"http://rules.=
mk" rel=3D"noreferrer" target=3D"_blank">rules.mk</a><br>
-index 7720e4b..239108b 100644<br>
---- a/code/build/make/<a href=3D"http://rules.mk" rel=3D"noreferrer" targe=
t=3D"_blank">rules.mk</a><br>
-+++ b/code/build/make/<a href=3D"http://rules.mk" rel=3D"noreferrer" targe=
t=3D"_blank">rules.mk</a><br>
-@@ -35,6 +35,11 @@ LFLAGS=C2=A0 :=3D -t<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0@echo &quot;Link $@&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(LD) $^ $(LDFLAGS) -o $@<br>
- <br>
-+# Compilation of cst_lexer.c require cst_parser.h <br>
-+# (cst_lexer.c include cst_parser.h) which is generated<br>
-+# by the same makefile genrating cst_parser.c<br>
-+cst_lexer.o: cst_parser.c<br>
-+<br>
- %.o: %.c<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0@echo &quot;Compile $@&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# generate dependency file<br>
diff --git a/meta-oe/recipes-support/imx-cst/<a href=3D"http://imx-cst_3.4.=
1.bb" rel=3D"noreferrer" target=3D"_blank">imx-cst_3.4.1.bb</a> b/meta-oe/r=
ecipes-support/imx-cst/<a href=3D"http://imx-cst_3.4.1.bb" rel=3D"noreferre=
r" target=3D"_blank">imx-cst_3.4.1.bb</a><br>
deleted file mode 100644<br>
index c9e73a83b437..000000000000<br>
--- a/meta-oe/recipes-support/imx-cst/<a href=3D"http://imx-cst_3.4.1.bb" r=
el=3D"noreferrer" target=3D"_blank">imx-cst_3.4.1.bb</a><br>
+++ /dev/null<br>
@@ -1,42 +0,0 @@<br>
-SUMMARY =3D &quot;i.MX code signing tool&quot;<br>
-DESCRIPTION =3D &quot;Code signing support that integrates the HABv4 and A=
HAB library for i.MX processors&quot;<br>
-LICENSE =3D &quot;Apache-2.0 AND BSD-3-Clause&quot;<br>
-<br>
-LIC_FILES_CHKSUM =3D &quot;\<br>
-=C2=A0 =C2=A0 file://LICENSE.bsd3;md5=3D14aba05f9fa6c25527297c8aac95fcf6 \=
<br>
-=C2=A0 =C2=A0 file://LICENSE.hidapi;md5=3De0ea014f523f64f0adb13409055ee59e=
 \<br>
-=C2=A0 =C2=A0 file://LICENSE.openssl;md5=3D3441526b1df5cc01d812c7dfc218cea=
6 \<br>
-&quot;<br>
-<br>
-DEPENDS =3D &quot;byacc-native flex-native openssl&quot;<br>
-<br>
-# debian: 3.4.0+dfsg-2<br>
-DEBIAN_PGK_NAME =3D &quot;imx-code-signing-tool&quot;<br>
-DEBIAN_PGK_VERSION =3D &quot;${PV}+dfsg&quot;<br>
-<br>
-SRC_URI =3D &quot;\<br>
-=C2=A0 =C2=A0 ${DEBIAN_MIRROR}/main/i/${DEBIAN_PGK_NAME}/${DEBIAN_PGK_NAME=
}_${DEBIAN_PGK_VERSION}.orig.tar.xz \<br>
-=C2=A0 =C2=A0 file://0001-fix-missing-makefile-rule-dependency.patch \<br>
-&quot;<br>
-<br>
-SRC_URI[sha256sum] =3D &quot;342c0c028658a4a859fe70578b58c3b07e17bee0c7e3a=
13d063d4791e82c2dee&quot;<br>
-<br>
-S =3D &quot;${UNPACKDIR}/${DEBIAN_PGK_NAME}-${DEBIAN_PGK_VERSION}&quot;<br=
>
-<br>
-EXTRA_OEMAKE =3D &#39;CC=3D&quot;${CC}&quot; LD=3D&quot;${CC}&quot; AR=3D&=
quot;${AR}&quot; OBJCOPY=3D&quot;${OBJCOPY}&quot;&#39;<br>
-<br>
-inherit siteinfo<br>
-<br>
-do_compile() {<br>
-=C2=A0 =C2=A0 oe_runmake -C code/obj.linux${SITEINFO_BITS} OSTYPE=3Dlinux$=
{SITEINFO_BITS} ENCRYPTION=3Dyes COPTIONS=3D&quot;${CFLAGS} ${CPPFLAGS}&quo=
t; LDOPTIONS=3D&quot;${LDFLAGS}&quot;<br>
-=C2=A0 =C2=A0 oe_runmake -C add-ons/hab_csf_parser COPTS=3D&quot;${CFLAGS}=
 ${CPPFLAGS} ${LDFLAGS}&quot;<br>
-}<br>
-<br>
-do_install () {<br>
-=C2=A0 =C2=A0 install -d ${D}${bindir}<br>
-=C2=A0 =C2=A0 install -m 755 ${S}/code/obj.linux${SITEINFO_BITS}/cst ${D}$=
{bindir}/<br>
-=C2=A0 =C2=A0 install -m 755 ${S}/code/obj.linux${SITEINFO_BITS}/srktool $=
{D}${bindir}<br>
-=C2=A0 =C2=A0 install -m 755 ${S}/add-ons/hab_csf_parser/csf_parser ${D}${=
bindir}<br>
-}<br>
-<br>
-BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
diff --git a/meta-oe/recipes-support/imx-cst/<a href=3D"http://imx-cst_4.0.=
1.bb" rel=3D"noreferrer" target=3D"_blank">imx-cst_4.0.1.bb</a> b/meta-oe/r=
ecipes-support/imx-cst/<a href=3D"http://imx-cst_4.0.1.bb" rel=3D"noreferre=
r" target=3D"_blank">imx-cst_4.0.1.bb</a><br>
new file mode 100644<br>
index 000000000000..826943fe09c3<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-support/imx-cst/<a href=3D"http://imx-cst_4.0.1.bb" r=
el=3D"noreferrer" target=3D"_blank">imx-cst_4.0.1.bb</a><br>
@@ -0,0 +1,36 @@<br>
+SUMMARY =3D &quot;i.MX code signing tool&quot;<br>
+DESCRIPTION =3D &quot;Code signing support that integrates the HABv4 and A=
HAB library for i.MX processors&quot;<br>
+LICENSE =3D &quot;Apache-2.0 AND BSD-3-Clause AND MIT&quot;<br>
+<br>
+LIC_FILES_CHKSUM =3D &quot;\<br>
+=C2=A0 =C2=A0 file://licenses/LICENSE.bsd3;md5=3D1ef4297097d818a9787ed7752=
18c133f \<br>
+=C2=A0 =C2=A0 file://licenses/LICENSE.json-c;md5=3Dde54b60fbbc35123ba193fe=
a8ee216f2 \<br>
+=C2=A0 =C2=A0 file://licenses/LICENSE.openssl;md5=3D3441526b1df5cc01d812c7=
dfc218cea6 \<br>
+&quot;<br>
+<br>
+DEPENDS =3D &quot;bison-native flex-native json-c openssl&quot;<br>
+<br>
+DEBIAN_PKG_NAME =3D &quot;imx-code-signing-tool&quot;<br>
+DEBIAN_PKG_VERSION =3D &quot;${PV}+dfsg&quot;<br>
+<br>
+SRC_URI =3D &quot;\<br>
+=C2=A0 =C2=A0 ${DEBIAN_MIRROR}/main/i/${DEBIAN_PKG_NAME}/${DEBIAN_PKG_NAME=
}_${DEBIAN_PKG_VERSION}.orig.tar.xz \<br>
+=C2=A0 =C2=A0 file://0001-check-return-value-of-fgets.patch \<br>
+&quot;<br>
+SRC_URI[sha256sum] =3D &quot;fd92a1a9faa10fb81bbf752c7ee1e257f17e1ec4c2964=
f8a47adf8a3eaa7df41&quot;<br>
+<br>
+S =3D &quot;${UNPACKDIR}/${DEBIAN_PKG_NAME}-${DEBIAN_PKG_VERSION}&quot;<br=
>
+<br>
+OECMAKE_SOURCEPATH =3D &quot;${S}/src&quot;<br>
+<br>
+# CST_INSTALL only controls installation of internal static libraries, not=
 tools.<br>
+EXTRA_OECMAKE =3D &quot;\<br>
+=C2=A0 =C2=A0 -DCST_INSTALL=3DOFF \<br>
+=C2=A0 =C2=A0 -DFLEX_TARGET_ARG_COMPILE_FLAGS=3D--noline \<br>
+=C2=A0 =C2=A0 -DBISON_TARGET_ARG_COMPILE_FLAGS=3D--no-lines \<br>
+=C2=A0 =C2=A0 -DJSONC_INCLUDE_DIR=3D${STAGING_INCDIR} \<br>
+&quot;<br>
+<br>
+inherit cmake<br>
+<br>
+BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#128450): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/128450" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/128450</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/120448761/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/120448761/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000920513065789cac0--

