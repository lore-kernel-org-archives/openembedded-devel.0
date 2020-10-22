Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web10.7434.1603354968578510647
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Oct 2020 01:22:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gBcQDUJH;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id ce10so1007233ejc.5
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 Oct 2020 01:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eIEJSjKOqNw/aZCB4fmuaS/mhAenr4cdcl/AO7CbWfg=;
        b=gBcQDUJHLW8x3xuE1gS5K1szehGvXsi9SVuSoSR1+ShFv2jcjSComEOzhgFF6x44QZ
         HLKXAzv2gv+6osf4oGVaOmUzVTA19EPdVIn8cl+IP8HnkD5oxqgw1FRx+yCAwKNJJO3q
         7+oXWe038SG55D6KeiAqwe87SPoNIIWitWnmL5tRqmtzlXbclt9plPEnuT7lHVdBJgw0
         qVHcR7G3t8eMwvTB0maW5C4L24TgYDKz6fluXKAv1YShFBW24T/ACLzcM4JPb7egJfDJ
         qIVFn6xnXIshDTsLnh+o3YHj8ka8DCYHMq3lus8QE0i7quqosq7QlD0x+PGcD5N+nQvA
         1/pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eIEJSjKOqNw/aZCB4fmuaS/mhAenr4cdcl/AO7CbWfg=;
        b=JtMfd0eBhfN+RB+UrKnI/qViarBPPd31L6IBkVaburpEqunq2be2PWN3MvMV5GS14w
         Ho05JmkT6wYr1U7vSLDqhqs3EgUlg2SWBhDB+1mAV+oL6PikqAuv27F6lPg729tbKi2I
         tKK1BaNCv3gCDTgngJ51ZwZSUF2cRMRD401uNj2gOZZTt8ZdH4PKnqLLKJ3wntl/9a0+
         VMmFi62D62OHGYp7FYnkoSBGYV/6GR3uANqgfg1bHIlsBZ0ZJGC4CHZSUT7p9oWYQulV
         jRxeSYpS+Cj80ZohAHB1PnS8zm41SHLbzJUixuRFMtvdd752ckJgE2TJtSCGnDH2wWeO
         lHqA==
X-Gm-Message-State: AOAM5320x5D5WkPKOcutxi52t1m5lDHcaH3G//+OAKLlLwuA+lcD3bjs
	0xJUHGN4cVT1W4s0lmyCC6tTc+qP+p8DbZI8foA=
X-Google-Smtp-Source: ABdhPJwv4ZGaRsc+131/D6Fuqy9jgo3puAi5LtJGB5DCa7oS4q+PprtFuIrNzuKIRAvB5cIXw81OWDVXTEmr/wtM03k=
X-Received: by 2002:a17:906:2f97:: with SMTP id w23mr1257080eji.54.1603354966934;
 Thu, 22 Oct 2020 01:22:46 -0700 (PDT)
MIME-Version: 1.0
References: <20201019102559.19491-1-andrej.valek@siemens.com>
 <20201019102559.19491-2-andrej.valek@siemens.com> <CA+chaQeXy=YJPN0z-8MY1fEDPmHGb-Ow9hFs9PdA3Rb2m5W0tg@mail.gmail.com>
 <DB8PR10MB264979FDA47F993DC134D66FF81D0@DB8PR10MB2649.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <DB8PR10MB264979FDA47F993DC134D66FF81D0@DB8PR10MB2649.EURPRD10.PROD.OUTLOOK.COM>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Thu, 22 Oct 2020 10:22:35 +0200
Message-ID: <CA+chaQf8cThMggRPDd3nYx8tAD8cac4XgUDu43QqmfLRhwRS=Q@mail.gmail.com>
Subject: Re: [oe][meta-oe][PATCH 1/2] nss: upgrade 3.56 -> 3.57
To: "andrej.kozemcak@siemens.com" <andrej.kozemcak@siemens.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>, 
	"Valek, Andrej" <andrej.valek@siemens.com>
Content-Type: multipart/alternative; boundary="00000000000040ccbd05b23e2b94"

--00000000000040ccbd05b23e2b94
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I will need to reproduce it locally first myself, I've just seen it in
jenkins job with the workdir already wiped from tmpfs.

And even there it doesn't happen reliably, the next build was OK and local
incremental build as well as re-build from sstate was OK.

It could be some issue with populate_sysroot_setscene from
nss-native/nspr-native, because it was trying to install them in image RSS=
,
but failed:
WARNING: image-1.0-r0 do_rootfs: Manifest
tmp-glibc/sstate-control/manifest-x86_64-nss-native.populate_sysroot not
found in x86_64 (variant '')?
WARNING: image-1.0-r0 do_rootfs: Manifest
tmp-glibc/sstate-control/manifest-x86_64-nspr-native.populate_sysroot not
found in x86_64 (variant '')?

so I guess the actual error from postinst was about
missing shlibsign nss-native was supposed to provide.

In working build I see it correctly included in RSS:
image/1.0-r0/recipe-sysroot-native/installeddeps/nss-native.6778a35ca0b60f=
25f49907cc0411cd2d2592094452ed1a69010a8c2e6a6b920e
image/1.0-r0/recipe-sysroot-native/installeddeps/nss-native.complete
image/1.0-r0/recipe-sysroot-native/installeddeps/nss-native

in completely unrelated build error which also happens quite rarely I
sometimes see the installeddeps/foo-native.complete stamp of some native
dependency, but without
corresponding installeddeps/foo-native.<signature_hash> after the same
warning message about Manifest not found (even after
foo-native.populate_sysroot_setscene was executed according to cooker log)=
.

Cheers,

On Thu, Oct 22, 2020 at 9:24 AM andrej.kozemcak@siemens.com <
andrej.kozemcak@siemens.com> wrote:

> Hi,
>
>
>
> Here is a log from our build system:
>
> *Installing nss (3.57) on root.*
>
> *Downloading file:
> ../image/1.0-r0/oe-rootfs-repo/cortexa15t2hf-neon/nss_3.57-r0_cortexa15t=
2hf-neon.ipk.*
>
> *Configuring nss.*
>
> *nss-dbg: unsatisfied recommendation for libsqlite3-dbg*
>
> *Installing nss-dbg (3.57) on root.*
>
> *Downloading file:
> ../image/1.0-r0/oe-rootfs-repo/cortexa15t2hf-neon/nss-dbg_3.57-r0_cortex=
a15t2hf-neon.ipk.*
>
> *Package nss-dbg (3.57-r0) installed in root is up to date.*
>
> *Configuring nss-dbg.*
>
> *DEBUG: Fetching packagedata for nss*
>
>
>
> In our target platform (pxm), we don=E2=80=99t have this error.
>
>
>
> Please, could you send us your build commands so we can reproduce this
> error or more logs?
>
>
>
> Thank you,
>
> Best Regards,
>
> Andrej
>
>
>
> *From:* Martin Jansa <martin.jansa@gmail.com>
> *Sent:* Wednesday, October 21, 2020 6:53 PM
> *To:* Valek, Andrej (ADV D EU SK SI-BP1) <andrej.valek@siemens.com>
> *Cc:* openembedded-devel <openembedded-devel@lists.openembedded.org>;
> Kozemcak, Andrej (ADV D EU SK SI-BP1) <andrej.kozemcak@siemens.com>
> *Subject:* Re: [oe][meta-oe][PATCH 1/2] nss: upgrade 3.56 -> 3.57
>
>
>
> Not sure what changed here (I didn't get the logs from this yet), but it
> seems to be failing in postinst now:
>
>
>
> WARNING: image-1.0-r0 do_rootfs: Manifest
> tmp-glibc/sstate-control/manifest-x86_64-nss-native.populate_sysroot not
> found in x86_64 (variant '')?
> WARNING: image-1.0-r0 do_rootfs: Manifest
> tmp-glibc/sstate-control/manifest-x86_64-nspr-native.populate_sysroot no=
t
> found in x86_64 (variant '')?
> WARNING: image-1.0-r0 do_rootfs: nss.postinst returned 127, marking as
> unpacked only, configuration required on target.
> ERROR: image-1.0-r0 do_rootfs: Postinstall scriptlets of ['nss'] have
> failed. If the intention is to defer them to first boot,
>
> then please place them into pkg_postinst_ontarget_${PN} ().
> Deferring to first boot via 'exit 1' is no longer supported.
>
>
>
> Anyone seen this as well?
>
>
>
> On Mon, Oct 19, 2020 at 12:29 PM Andrej Valek <andrej.valek@siemens.com>
> wrote:
>
> - Refresh freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch
> - Drop pkix-Do-not-use-NULL-where-0-is-needed.patch
>
> Signed-off-by: Andrej Kozemcak <andrej.kozemcak@siemens.com>
> Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> ---
>  ...a-configure-option-to-disable-ARM-HW-cryp.patch | 36 +++++++++++----=
--
>  ...01-pkix-Do-not-use-NULL-where-0-is-needed.patch | 46
> ----------------------
>  .../nss/{nss_3.56.bb
> <https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fnss_=
3.56.bb%2F&data=3D02%7C01%7Candrej.kozemcak%40siemens.com%7C48ce57d42382495=
832d408d875e1dc6f%7C38ae3bcd95794fd4addab42e1495d55a%7C1%7C0%7C637388960206=
924185&sdata=3DyJOzN%2FlrD5Tcv4TOiz7zvCIxnVBRNO2ksmQn%2B%2FDxdn4%3D&reserve=
d=3D0>
> =3D> nss_3.57.bb
> <https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fnss_=
3.57.bb%2F&data=3D02%7C01%7Candrej.kozemcak%40siemens.com%7C48ce57d42382495=
832d408d875e1dc6f%7C38ae3bcd95794fd4addab42e1495d55a%7C1%7C0%7C637388960206=
934139&sdata=3De0W1Tx1GcSOSJULhZzqmz%2BAO7WE0xCpVWU9iQjjDx78%3D&reserved=3D=
0>}
>              |  3 +-
>  3 files changed, 24 insertions(+), 61 deletions(-)
>  delete mode 100644
> meta-oe/recipes-support/nss/nss/0001-pkix-Do-not-use-NULL-where-0-is-nee=
ded.patch
>  rename meta-oe/recipes-support/nss/{nss_3.56.bb
> <https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fnss_=
3.56.bb%2F&data=3D02%7C01%7Candrej.kozemcak%40siemens.com%7C48ce57d42382495=
832d408d875e1dc6f%7C38ae3bcd95794fd4addab42e1495d55a%7C1%7C0%7C637388960206=
934139&sdata=3DdQHRE%2BSsK0i68vrvzXHjcUpr42Hx6r225oN9CZAGy%2F4%3D&reserved=
=3D0>
> =3D> nss_3.57.bb
> <https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fnss_=
3.57.bb%2F&data=3D02%7C01%7Candrej.kozemcak%40siemens.com%7C48ce57d42382495=
832d408d875e1dc6f%7C38ae3bcd95794fd4addab42e1495d55a%7C1%7C0%7C637388960206=
944100&sdata=3D%2FS8185rsNQNODkhBW9UW6exSzGd%2FkBOpw0xTQvMEJHo%3D&reserved=
=3D0>}
> (98%)
>
> diff --git
> a/meta-oe/recipes-support/nss/nss/0001-freebl-add-a-configure-option-to-=
disable-ARM-HW-cryp.patch
> b/meta-oe/recipes-support/nss/nss/0001-freebl-add-a-configure-option-to-=
disable-ARM-HW-cryp.patch
> index bfc375e83..65e1500ae 100644
> ---
> a/meta-oe/recipes-support/nss/nss/0001-freebl-add-a-configure-option-to-=
disable-ARM-HW-cryp.patch
> +++
> b/meta-oe/recipes-support/nss/nss/0001-freebl-add-a-configure-option-to-=
disable-ARM-HW-cryp.patch
> @@ -10,22 +10,24 @@ Upstream-Status: Pending
>  Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>
>  ---
> - nss/lib/freebl/Makefile | 4 ++++
> + nss/lib/freebl/Makefile | 3 +++
>   nss/lib/freebl/gcm.c    | 2 ++
> - 2 files changed, 6 insertions(+)
> + 2 files changed, 5 insertions(+)
>
> +diff --git a/nss/lib/freebl/Makefile b/nss/lib/freebl/Makefile
> +index fe8c526..922f67c 100644
>  --- a/nss/lib/freebl/Makefile
>  +++ b/nss/lib/freebl/Makefile
> -@@ -126,6 +126,8 @@ else
> +@@ -125,6 +125,8 @@ else
> +         DEFINES +=3D -DNSS_X86
>   endif
>   endif
> - ifdef NS_USE_GCC
>  +ifdef NSS_USE_ARM_HW_CRYPTO
>  +    DEFINES +=3D -DNSS_USE_ARM_HW_CRYPTO
>   ifeq ($(CPU_ARCH),aarch64)
> -     DEFINES +=3D -DUSE_HW_AES -DUSE_HW_SHA1 -DUSE_HW_SHA2
> -     EXTRA_SRCS +=3D aes-armv8.c gcm-aarch64.c sha1-armv8.c sha256-armv=
8.c
> -@@ -150,6 +152,7 @@ endif
> +     ifdef CC_IS_CLANG
> +         DEFINES +=3D -DUSE_HW_AES -DUSE_HW_SHA1 -DUSE_HW_SHA2
> +@@ -166,6 +168,7 @@ endif
>           endif
>       endif
>   endif
> @@ -33,15 +35,23 @@ Signed-off-by: Alexander Kanavin <
> alex.kanavin@gmail.com>
>
>   ifeq ($(OS_TARGET),OSF1)
>       DEFINES +=3D -DMP_ASSEMBLY_MULTIPLY -DMP_NO_MP_WORD
> +diff --git a/nss/lib/freebl/gcm.c b/nss/lib/freebl/gcm.c
> +index c2cc18d..b77f573 100644
>  --- a/nss/lib/freebl/gcm.c
>  +++ b/nss/lib/freebl/gcm.c
> -@@ -21,7 +21,9 @@
> +@@ -18,6 +18,7 @@
> +
> + #include <limits.h>
> +
> ++#ifdef NSS_USE_ARM_HW_CRYPTO
>   /* old gcc doesn't support some poly64x2_t intrinsic */
>   #if defined(__aarch64__) && defined(IS_LITTLE_ENDIAN) && \
>       (defined(__clang__) || defined(__GNUC__) && __GNUC__ > 6)
> -+# ifdef NSS_USE_ARM_HW_CRYPTO
> - #define USE_ARM_GCM
> -+# endif
> - #elif defined(__arm__) && defined(IS_LITTLE_ENDIAN) && \
> -     !defined(NSS_DISABLE_ARM32_NEON)
> +@@ -27,6 +28,7 @@
>   /* We don't test on big endian platform, so disable this on big endian=
.
> */
> + #define USE_ARM_GCM
> + #endif
> ++#endif
> +
> + /* Forward declarations */
> + SECStatus gcm_HashInit_hw(gcmHashContext *ghash);
> diff --git
> a/meta-oe/recipes-support/nss/nss/0001-pkix-Do-not-use-NULL-where-0-is-n=
eeded.patch
> b/meta-oe/recipes-support/nss/nss/0001-pkix-Do-not-use-NULL-where-0-is-n=
eeded.patch
> deleted file mode 100644
> index 432312da2..000000000
> ---
> a/meta-oe/recipes-support/nss/nss/0001-pkix-Do-not-use-NULL-where-0-is-n=
eeded.patch
> +++ /dev/null
> @@ -1,46 +0,0 @@
> -From 1136cad77c2dc7d8e1daa317877676733e805f29 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Wed, 26 Aug 2020 17:30:40 -0700
> -Subject: [PATCH] pkix: Do not use NULL where 0 is needed
> -
> -Clang finds this error
> -
> -pkix_logger.c:316:32: error: cast to smaller integer type
> 'PKIX_ERRORCLASS' from 'void *' [-Werror,-Wvoid-pointer-to-enum-cast]
> -        logger->logComponent =3D (PKIX_ERRORCLASS)NULL;
> -                               ^~~~~~~~~~~~~~~~~~~~~
> -pkix_logger.c:617:32: error: cast to smaller integer type
> 'PKIX_ERRORCLASS' from 'void *' [-Werror,-Wvoid-pointer-to-enum-cast]
> -        logger->logComponent =3D (PKIX_ERRORCLASS)NULL;
> -                               ^~~~~~~~~~~~~~~~~~~~~
> -2 errors generated.
> -
> -Upstream-Status: Submitted [
> https://bugzilla.mozilla.org/show_bug.cgi?id=3D1661378
> <https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fbug=
zilla.mozilla.org%2Fshow_bug.cgi%3Fid%3D1661378&data=3D02%7C01%7Candrej.koz=
emcak%40siemens.com%7C48ce57d42382495832d408d875e1dc6f%7C38ae3bcd95794fd4ad=
dab42e1495d55a%7C1%7C0%7C637388960206944100&sdata=3DHRz0vTKoBgEgpIJhPwghGL2=
KLNcQWvAf%2BlxI9u0TaqI%3D&reserved=3D0>
> ]
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - nss/lib/libpkix/pkix/util/pkix_logger.c | 4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/nss/lib/libpkix/pkix/util/pkix_logger.c
> b/nss/lib/libpkix/pkix/util/pkix_logger.c
> -index a916e6e..10f537a 100644
> ---- a/nss/lib/libpkix/pkix/util/pkix_logger.c
> -+++ b/nss/lib/libpkix/pkix/util/pkix_logger.c
> -@@ -313,7 +313,7 @@ pkix_Logger_Destroy(
> -
> -         logger->callback =3D NULL;
> -         PKIX_DECREF(logger->context);
> --        logger->logComponent =3D (PKIX_ERRORCLASS)NULL;
> -+        logger->logComponent =3D (PKIX_ERRORCLASS)0;
> -
> - cleanup:
> -
> -@@ -614,7 +614,7 @@ PKIX_Logger_Create(
> -
> -         logger->callback =3D callback;
> -         logger->maxLevel =3D 0;
> --        logger->logComponent =3D (PKIX_ERRORCLASS)NULL;
> -+        logger->logComponent =3D (PKIX_ERRORCLASS)0;
> -
> -         PKIX_INCREF(loggerContext);
> -         logger->context =3D loggerContext;
> ---
> -2.28.0
> -
> diff --git a/meta-oe/recipes-support/nss/nss_3.56.bb
> <https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fnss_=
3.56.bb%2F&data=3D02%7C01%7Candrej.kozemcak%40siemens.com%7C48ce57d42382495=
832d408d875e1dc6f%7C38ae3bcd95794fd4addab42e1495d55a%7C1%7C0%7C637388960206=
944100&sdata=3DdK%2F85JSbyMEBQYqp6jb7r38qDSmv3NlSfZRHm64z8E8%3D&reserved=3D=
0>
> b/meta-oe/recipes-support/nss/nss_3.57.bb
> <https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fnss_=
3.57.bb%2F&data=3D02%7C01%7Candrej.kozemcak%40siemens.com%7C48ce57d42382495=
832d408d875e1dc6f%7C38ae3bcd95794fd4addab42e1495d55a%7C1%7C0%7C637388960206=
954055&sdata=3Dz%2FC25v6UwHiy0Q4qQhU1MYAi9l0XvoOY84%2F%2FcErYM%2BE%3D&reser=
ved=3D0>
> similarity index 98%
> rename from meta-oe/recipes-support/nss/nss_3.56.bb
> <https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fnss_=
3.56.bb%2F&data=3D02%7C01%7Candrej.kozemcak%40siemens.com%7C48ce57d42382495=
832d408d875e1dc6f%7C38ae3bcd95794fd4addab42e1495d55a%7C1%7C0%7C637388960206=
954055&sdata=3DVDA7dTmbohN5axMKbg7EDj7Z5FDeR5q2Z0cUVh4FKxE%3D&reserved=3D0>
> rename to meta-oe/recipes-support/nss/nss_3.57.bb
> <https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fnss_=
3.57.bb%2F&data=3D02%7C01%7Candrej.kozemcak%40siemens.com%7C48ce57d42382495=
832d408d875e1dc6f%7C38ae3bcd95794fd4addab42e1495d55a%7C1%7C0%7C637388960206=
954055&sdata=3Dz%2FC25v6UwHiy0Q4qQhU1MYAi9l0XvoOY84%2F%2FcErYM%2BE%3D&reser=
ved=3D0>
> index 997f8950f..5d9318a92 100644
> --- a/meta-oe/recipes-support/nss/nss_3.56.bb
> <https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fnss_=
3.56.bb%2F&data=3D02%7C01%7Candrej.kozemcak%40siemens.com%7C48ce57d42382495=
832d408d875e1dc6f%7C38ae3bcd95794fd4addab42e1495d55a%7C1%7C0%7C637388960206=
964011&sdata=3DJqpHNPH3LltUZ6A5Yu%2FutU6LSRmaZexU64wWna5fVQA%3D&reserved=3D=
0>
> +++ b/meta-oe/recipes-support/nss/nss_3.57.bb
> <https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fnss_=
3.57.bb%2F&data=3D02%7C01%7Candrej.kozemcak%40siemens.com%7C48ce57d42382495=
832d408d875e1dc6f%7C38ae3bcd95794fd4addab42e1495d55a%7C1%7C0%7C637388960206=
964011&sdata=3DZ9ON7GPjFSUBoA2Jk8VIwYFjzfcMKgMEKwmAt%2FbDQ50%3D&reserved=3D=
0>
> @@ -31,9 +31,8 @@ SRC_URI =3D "
> http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/${VERSIO
> <https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fftp.=
mozilla.org%2Fpub%2Fmozilla.org%2Fsecurity%2Fnss%2Freleases%2F%24%257BVERSI=
O&data=3D02%7C01%7Candrej.kozemcak%40siemens.com%7C48ce57d42382495832d408d8=
75e1dc6f%7C38ae3bcd95794fd4addab42e1495d55a%7C1%7C0%7C637388960206973967&sd=
ata=3D8usOI6rSXTvYTSJfwFgPEhtR2mT0XGROmhQ3479nF3E%3D&reserved=3D0>
>             file://system-pkcs11.txt \
>             file://nss-fix-nsinstall-build.patch \
>
> file://0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch \
> -           file://0001-pkix-Do-not-use-NULL-where-0-is-needed.patch \
>             "
> -SRC_URI[sha256sum] =3D
> "f875e0e8ed3b5ce92d675be4a55aa25a8c1199789a4a01f69b5f2327e2048e9c"
> +SRC_URI[sha256sum] =3D
> "55a86c01be860381d64bb4e5b94eb198df9b0f098a8af0e58c014df398bdc382"
>
>  UPSTREAM_CHECK_URI =3D "
> https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_Releas=
es
> <https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fdev=
eloper.mozilla.org%2Fen-US%2Fdocs%2FMozilla%2FProjects%2FNSS%2FNSS_Releases=
&data=3D02%7C01%7Candrej.kozemcak%40siemens.com%7C48ce57d42382495832d408d87=
5e1dc6f%7C38ae3bcd95794fd4addab42e1495d55a%7C1%7C0%7C637388960206973967&sda=
ta=3DdRLQlxeP4xzCqFvF5dXDxg1x%2Fbvq0yJPW%2BiafpDIbpU%3D&reserved=3D0>
> "
>  UPSTREAM_CHECK_REGEX =3D "NSS_(?P<pver>.+)_release_notes"
> --
> 2.11.0
>
>
>=20
>
>

--00000000000040ccbd05b23e2b94
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I will need to reproduce it locally first myself, I&#39;ve=
 just seen it in jenkins job with the workdir already wiped from tmpfs.<div=
><br></div><div>And even there it doesn&#39;t happen reliably, the next bui=
ld was OK and local incremental build as well as re-build from sstate=C2=A0=
was OK.</div><div><br></div><div>It could be some issue with populate_sysro=
ot_setscene from nss-native/nspr-native, because it was trying to install t=
hem in image RSS, but failed:</div><div>WARNING: image-1.0-r0 do_rootfs: Ma=
nifest tmp-glibc/sstate-control/manifest-x86_64-nss-native.populate_sysroot=
 not found in x86_64 (variant &#39;&#39;)?<br>WARNING: image-1.0-r0 do_root=
fs: Manifest tmp-glibc/sstate-control/manifest-x86_64-nspr-native.populate_=
sysroot not found in x86_64 (variant &#39;&#39;)?<br></div><div><br></div><=
div>so I guess the actual error from postinst was about missing=C2=A0shlibs=
ign=C2=A0nss-native was supposed to provide.</div><div><br></div><div>In wo=
rking build I see it correctly included in RSS:</div><div>image/1.0-r0/reci=
pe-sysroot-native/installeddeps/nss-native.6778a35ca0b60f25f49907cc0411cd2d=
2592094452ed1a69010a8c2e6a6b920e<br>image/1.0-r0/recipe-sysroot-native/inst=
alleddeps/nss-native.complete<br>image/1.0-r0/recipe-sysroot-native/install=
eddeps/nss-native<br></div><div><br></div><div>in completely unrelated buil=
d error which also happens quite rarely I sometimes see the installeddeps/f=
oo-native.complete stamp of some native dependency, but without correspondi=
ng=C2=A0installeddeps/foo-native.&lt;signature_hash&gt; after the same warn=
ing message about Manifest not found (even after foo-native.populate_sysroo=
t_setscene was executed according to cooker log).</div><div><br></div><div>=
Cheers,</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">On Thu, Oct 22, 2020 at 9:24 AM <a href=3D"mailto:andrej.kozem=
cak@siemens.com">andrej.kozemcak@siemens.com</a> &lt;<a href=3D"mailto:andr=
ej.kozemcak@siemens.com">andrej.kozemcak@siemens.com</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">





<div lang=3D"SK">
<div class=3D"gmail-m_2427833527832326904WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi,<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Here is a=C2=A0log from our bu=
ild system:<u></u><u></u></span></p>
<p class=3D"MsoNormal"><i><span lang=3D"EN-US">Installing nss (3.57) on ro=
ot.<u></u><u></u></span></i></p>
<p class=3D"MsoNormal"><i><span lang=3D"EN-US">Downloading file: ../image/=
1.0-r0/oe-rootfs-repo/cortexa15t2hf-neon/nss_3.57-r0_cortexa15t2hf-neon.ipk=
.<u></u><u></u></span></i></p>
<p class=3D"MsoNormal"><i><span lang=3D"EN-US">Configuring nss.<u></u><u><=
/u></span></i></p>
<p class=3D"MsoNormal"><i><span lang=3D"EN-US">nss-dbg: unsatisfied recomm=
endation for libsqlite3-dbg<u></u><u></u></span></i></p>
<p class=3D"MsoNormal"><i><span lang=3D"EN-US">Installing nss-dbg (3.57) o=
n root.<u></u><u></u></span></i></p>
<p class=3D"MsoNormal"><i><span lang=3D"EN-US">Downloading file: ../image/=
1.0-r0/oe-rootfs-repo/cortexa15t2hf-neon/nss-dbg_3.57-r0_cortexa15t2hf-neon=
.ipk.<u></u><u></u></span></i></p>
<p class=3D"MsoNormal"><i><span lang=3D"EN-US">Package nss-dbg (3.57-r0) i=
nstalled in root is up to date.<u></u><u></u></span></i></p>
<p class=3D"MsoNormal"><i><span lang=3D"EN-US">Configuring nss-dbg.<u></u>=
<u></u></span></i></p>
<p class=3D"MsoNormal"><i><span lang=3D"EN-US">DEBUG: Fetching packagedata=
 for nss<u></u><u></u></span></i></p>
<p class=3D"MsoNormal"><i><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span>=
</i></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">In our target platform (pxm), =
we don=E2=80=99t have this error.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Please, could you send us your=
 build commands so we can reproduce this error or more logs?<u></u><u></u><=
/span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Thank you,<u></u><u></u></span=
></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Best Regards,<u></u><u></u></s=
pan></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Andrej<u></u><u></u></span></p=
>
<p class=3D"MsoNormal"><span><u></u>=C2=A0<u></u></span></p>
<div style=3D"border-right:none;border-bottom:none;border-left:none;border=
-top:1pt solid rgb(225,225,225);padding:3pt 0cm 0cm">
<p class=3D"MsoNormal"><b><span lang=3D"EN-US">From:</span></b><span lang=
=3D"EN-US"> Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com" tar=
get=3D"_blank">martin.jansa@gmail.com</a>&gt;
<br>
<b>Sent:</b> Wednesday, October 21, 2020 6:53 PM<br>
<b>To:</b> Valek, Andrej (ADV D EU SK SI-BP1) &lt;<a href=3D"mailto:andrej=
.valek@siemens.com" target=3D"_blank">andrej.valek@siemens.com</a>&gt;<br>
<b>Cc:</b> openembedded-devel &lt;<a href=3D"mailto:openembedded-devel@lis=
ts.openembedded.org" target=3D"_blank">openembedded-devel@lists.openembedde=
d.org</a>&gt;; Kozemcak, Andrej (ADV D EU SK SI-BP1) &lt;<a href=3D"mailto:=
andrej.kozemcak@siemens.com" target=3D"_blank">andrej.kozemcak@siemens.com<=
/a>&gt;<br>
<b>Subject:</b> Re: [oe][meta-oe][PATCH 1/2] nss: upgrade 3.56 -&gt; 3.57<=
u></u><u></u></span></p>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div>
<p class=3D"MsoNormal">Not sure what changed here (I didn&#39;t get the lo=
gs from this yet), but it seems to be failing in postinst now:<u></u><u></u=
></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<p class=3D"MsoNormal">WARNING: image-1.0-r0 do_rootfs: Manifest tmp-glibc=
/sstate-control/manifest-x86_64-nss-native.populate_sysroot not found in x8=
6_64 (variant &#39;&#39;)?<br>
WARNING: image-1.0-r0 do_rootfs: Manifest tmp-glibc/sstate-control/manifes=
t-x86_64-nspr-native.populate_sysroot not found in x86_64 (variant &#39;&#3=
9;)?<br>
WARNING: image-1.0-r0 do_rootfs: nss.postinst returned 127, marking as unp=
acked only, configuration required on target.<br>
ERROR: image-1.0-r0 do_rootfs: Postinstall scriptlets of [&#39;nss&#39;] h=
ave failed. If the intention is to defer them to first boot,<u></u><u></u><=
/p>
<div>
<p class=3D"MsoNormal">then please place them into pkg_postinst_ontarget_$=
{PN} ().<br>
Deferring to first boot via &#39;exit 1&#39; is no longer supported.<u></u=
><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Anyone seen this as well?<u></u><u></u></p>
</div>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div>
<p class=3D"MsoNormal">On Mon, Oct 19, 2020 at 12:29 PM Andrej Valek &lt;<=
a href=3D"mailto:andrej.valek@siemens.com" target=3D"_blank">andrej.valek@s=
iemens.com</a>&gt; wrote:<u></u><u></u></p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;=
border-left:1pt solid rgb(204,204,204);padding:0cm 0cm 0cm 6pt;margin-left:=
4.8pt;margin-right:0cm">
<p class=3D"MsoNormal" style=3D"margin-bottom:12pt">- Refresh freebl-add-a=
-configure-option-to-disable-ARM-HW-cryp.patch<br>
- Drop pkix-Do-not-use-NULL-where-0-is-needed.patch<br>
<br>
Signed-off-by: Andrej Kozemcak &lt;<a href=3D"mailto:andrej.kozemcak@sieme=
ns.com" target=3D"_blank">andrej.kozemcak@siemens.com</a>&gt;<br>
Signed-off-by: Andrej Valek &lt;<a href=3D"mailto:andrej.valek@siemens.com=
" target=3D"_blank">andrej.valek@siemens.com</a>&gt;<br>
---<br>
=C2=A0...a-configure-option-to-disable-ARM-HW-cryp.patch | 36 +++++++++++-=
-----<br>
=C2=A0...01-pkix-Do-not-use-NULL-where-0-is-needed.patch | 46 ------------=
----------<br>
=C2=A0.../nss/{<a href=3D"https://eur01.safelinks.protection.outlook.com/?=
url=3Dhttp%3A%2F%2Fnss_3.56.bb%2F&amp;data=3D02%7C01%7Candrej.kozemcak%40si=
emens.com%7C48ce57d42382495832d408d875e1dc6f%7C38ae3bcd95794fd4addab42e1495=
d55a%7C1%7C0%7C637388960206924185&amp;sdata=3DyJOzN%2FlrD5Tcv4TOiz7zvCIxnVB=
RNO2ksmQn%2B%2FDxdn4%3D&amp;reserved=3D0" target=3D"_blank">nss_3.56.bb</a>
 =3D&gt; <a href=3D"https://eur01.safelinks.protection.outlook.com/?url=3D=
http%3A%2F%2Fnss_3.57.bb%2F&amp;data=3D02%7C01%7Candrej.kozemcak%40siemens.=
com%7C48ce57d42382495832d408d875e1dc6f%7C38ae3bcd95794fd4addab42e1495d55a%7=
C1%7C0%7C637388960206934139&amp;sdata=3De0W1Tx1GcSOSJULhZzqmz%2BAO7WE0xCpVW=
U9iQjjDx78%3D&amp;reserved=3D0" target=3D"_blank">
nss_3.57.bb</a>}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 3 +-<br>
=C2=A03 files changed, 24 insertions(+), 61 deletions(-)<br>
=C2=A0delete mode 100644 meta-oe/recipes-support/nss/nss/0001-pkix-Do-not-=
use-NULL-where-0-is-needed.patch<br>
=C2=A0rename meta-oe/recipes-support/nss/{<a href=3D"https://eur01.safelin=
ks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fnss_3.56.bb%2F&amp;data=3D02%=
7C01%7Candrej.kozemcak%40siemens.com%7C48ce57d42382495832d408d875e1dc6f%7C3=
8ae3bcd95794fd4addab42e1495d55a%7C1%7C0%7C637388960206934139&amp;sdata=3DdQ=
HRE%2BSsK0i68vrvzXHjcUpr42Hx6r225oN9CZAGy%2F4%3D&amp;reserved=3D0" target=
=3D"_blank">nss_3.56.bb</a>
 =3D&gt; <a href=3D"https://eur01.safelinks.protection.outlook.com/?url=3D=
http%3A%2F%2Fnss_3.57.bb%2F&amp;data=3D02%7C01%7Candrej.kozemcak%40siemens.=
com%7C48ce57d42382495832d408d875e1dc6f%7C38ae3bcd95794fd4addab42e1495d55a%7=
C1%7C0%7C637388960206944100&amp;sdata=3D%2FS8185rsNQNODkhBW9UW6exSzGd%2FkBO=
pw0xTQvMEJHo%3D&amp;reserved=3D0" target=3D"_blank">
nss_3.57.bb</a>} (98%)<br>
<br>
diff --git a/meta-oe/recipes-support/nss/nss/0001-freebl-add-a-configure-o=
ption-to-disable-ARM-HW-cryp.patch b/meta-oe/recipes-support/nss/nss/0001-f=
reebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch<br>
index bfc375e83..65e1500ae 100644<br>
--- a/meta-oe/recipes-support/nss/nss/0001-freebl-add-a-configure-option-t=
o-disable-ARM-HW-cryp.patch<br>
+++ b/meta-oe/recipes-support/nss/nss/0001-freebl-add-a-configure-option-t=
o-disable-ARM-HW-cryp.patch<br>
@@ -10,22 +10,24 @@ Upstream-Status: Pending<br>
=C2=A0Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@=
gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
<br>
=C2=A0---<br>
- nss/lib/freebl/Makefile | 4 ++++<br>
+ nss/lib/freebl/Makefile | 3 +++<br>
=C2=A0 nss/lib/freebl/gcm.c=C2=A0 =C2=A0 | 2 ++<br>
- 2 files changed, 6 insertions(+)<br>
+ 2 files changed, 5 insertions(+)<br>
<br>
+diff --git a/nss/lib/freebl/Makefile b/nss/lib/freebl/Makefile<br>
+index fe8c526..922f67c 100644<br>
=C2=A0--- a/nss/lib/freebl/Makefile<br>
=C2=A0+++ b/nss/lib/freebl/Makefile<br>
-@@ -126,6 +126,8 @@ else<br>
+@@ -125,6 +125,8 @@ else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DEFINES +=3D -DNSS_X86<br>
=C2=A0 endif<br>
=C2=A0 endif<br>
- ifdef NS_USE_GCC<br>
=C2=A0+ifdef NSS_USE_ARM_HW_CRYPTO<br>
=C2=A0+=C2=A0 =C2=A0 DEFINES +=3D -DNSS_USE_ARM_HW_CRYPTO<br>
=C2=A0 ifeq ($(CPU_ARCH),aarch64)<br>
-=C2=A0 =C2=A0 =C2=A0DEFINES +=3D -DUSE_HW_AES -DUSE_HW_SHA1 -DUSE_HW_SHA2=
<br>
-=C2=A0 =C2=A0 =C2=A0EXTRA_SRCS +=3D aes-armv8.c gcm-aarch64.c sha1-armv8.=
c sha256-armv8.c<br>
-@@ -150,6 +152,7 @@ endif<br>
+=C2=A0 =C2=A0 =C2=A0ifdef CC_IS_CLANG<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DEFINES +=3D -DUSE_HW_AES -DUSE_HW_SHA1=
 -DUSE_HW_SHA2<br>
+@@ -166,6 +168,7 @@ endif<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 endif<br>
=C2=A0 =C2=A0 =C2=A0 endif<br>
=C2=A0 endif<br>
@@ -33,15 +35,23 @@ Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto=
:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<b=
r>
<br>
=C2=A0 ifeq ($(OS_TARGET),OSF1)<br>
=C2=A0 =C2=A0 =C2=A0 DEFINES +=3D -DMP_ASSEMBLY_MULTIPLY -DMP_NO_MP_WORD<b=
r>
+diff --git a/nss/lib/freebl/gcm.c b/nss/lib/freebl/gcm.c<br>
+index c2cc18d..b77f573 100644<br>
=C2=A0--- a/nss/lib/freebl/gcm.c<br>
=C2=A0+++ b/nss/lib/freebl/gcm.c<br>
-@@ -21,7 +21,9 @@<br>
+@@ -18,6 +18,7 @@<br>
+ <br>
+ #include &lt;limits.h&gt;<br>
+ <br>
++#ifdef NSS_USE_ARM_HW_CRYPTO<br>
=C2=A0 /* old gcc doesn&#39;t support some poly64x2_t intrinsic */<br>
=C2=A0 #if defined(__aarch64__) &amp;&amp; defined(IS_LITTLE_ENDIAN) &amp;=
&amp; \<br>
=C2=A0 =C2=A0 =C2=A0 (defined(__clang__) || defined(__GNUC__) &amp;&amp; _=
_GNUC__ &gt; 6)<br>
-+# ifdef NSS_USE_ARM_HW_CRYPTO<br>
- #define USE_ARM_GCM<br>
-+# endif<br>
- #elif defined(__arm__) &amp;&amp; defined(IS_LITTLE_ENDIAN) &amp;&amp; \=
<br>
-=C2=A0 =C2=A0 =C2=A0!defined(NSS_DISABLE_ARM32_NEON)<br>
+@@ -27,6 +28,7 @@<br>
=C2=A0 /* We don&#39;t test on big endian platform, so disable this on big=
 endian. */<br>
+ #define USE_ARM_GCM<br>
+ #endif<br>
++#endif<br>
+ <br>
+ /* Forward declarations */<br>
+ SECStatus gcm_HashInit_hw(gcmHashContext *ghash);<br>
diff --git a/meta-oe/recipes-support/nss/nss/0001-pkix-Do-not-use-NULL-whe=
re-0-is-needed.patch b/meta-oe/recipes-support/nss/nss/0001-pkix-Do-not-use=
-NULL-where-0-is-needed.patch<br>
deleted file mode 100644<br>
index 432312da2..000000000<br>
--- a/meta-oe/recipes-support/nss/nss/0001-pkix-Do-not-use-NULL-where-0-is=
-needed.patch<br>
+++ /dev/null<br>
@@ -1,46 +0,0 @@<br>
-From 1136cad77c2dc7d8e1daa317877676733e805f29 Mon Sep 17 00:00:00 2001<br=
>
-From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank=
">raj.khem@gmail.com</a>&gt;<br>
-Date: Wed, 26 Aug 2020 17:30:40 -0700<br>
-Subject: [PATCH] pkix: Do not use NULL where 0 is needed<br>
-<br>
-Clang finds this error<br>
-<br>
-pkix_logger.c:316:32: error: cast to smaller integer type &#39;PKIX_ERROR=
CLASS&#39; from &#39;void *&#39; [-Werror,-Wvoid-pointer-to-enum-cast]<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 logger-&gt;logComponent =3D (PKIX_ERRORCLASS)=
NULL;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~~~~~~~~~~~~~~~~<br>
-pkix_logger.c:617:32: error: cast to smaller integer type &#39;PKIX_ERROR=
CLASS&#39; from &#39;void *&#39; [-Werror,-Wvoid-pointer-to-enum-cast]<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 logger-&gt;logComponent =3D (PKIX_ERRORCLASS)=
NULL;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~~~~~~~~~~~~~~~~<br>
-2 errors generated.<br>
-<br>
-Upstream-Status: Submitted [<a href=3D"https://eur01.safelinks.protection=
.outlook.com/?url=3Dhttps%3A%2F%2Fbugzilla.mozilla.org%2Fshow_bug.cgi%3Fid%=
3D1661378&amp;data=3D02%7C01%7Candrej.kozemcak%40siemens.com%7C48ce57d42382=
495832d408d875e1dc6f%7C38ae3bcd95794fd4addab42e1495d55a%7C1%7C0%7C637388960=
206944100&amp;sdata=3DHRz0vTKoBgEgpIJhPwghGL2KLNcQWvAf%2BlxI9u0TaqI%3D&amp;=
reserved=3D0" target=3D"_blank">https://bugzilla.mozilla.org/show_bug.cgi?i=
d=3D1661378</a>]<br>
-Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
----<br>
- nss/lib/libpkix/pkix/util/pkix_logger.c | 4 ++--<br>
- 1 file changed, 2 insertions(+), 2 deletions(-)<br>
-<br>
-diff --git a/nss/lib/libpkix/pkix/util/pkix_logger.c b/nss/lib/libpkix/pk=
ix/util/pkix_logger.c<br>
-index a916e6e..10f537a 100644<br>
---- a/nss/lib/libpkix/pkix/util/pkix_logger.c<br>
-+++ b/nss/lib/libpkix/pkix/util/pkix_logger.c<br>
-@@ -313,7 +313,7 @@ pkix_Logger_Destroy(<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0logger-&gt;callback =3D NULL;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PKIX_DECREF(logger-&gt;context);<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 logger-&gt;logComponent =3D (PKIX_ERRORCLASS=
)NULL;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 logger-&gt;logComponent =3D (PKIX_ERRORCLASS=
)0;<br>
- <br>
- cleanup:<br>
- <br>
-@@ -614,7 +614,7 @@ PKIX_Logger_Create(<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0logger-&gt;callback =3D callback;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0logger-&gt;maxLevel =3D 0;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 logger-&gt;logComponent =3D (PKIX_ERRORCLASS=
)NULL;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 logger-&gt;logComponent =3D (PKIX_ERRORCLASS=
)0;<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PKIX_INCREF(loggerContext);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0logger-&gt;context =3D loggerContext;<b=
r>
--- <br>
-2.28.0<br>
-<br>
diff --git a/meta-oe/recipes-support/nss/<a href=3D"https://eur01.safelink=
s.protection.outlook.com/?url=3Dhttp%3A%2F%2Fnss_3.56.bb%2F&amp;data=3D02%7=
C01%7Candrej.kozemcak%40siemens.com%7C48ce57d42382495832d408d875e1dc6f%7C38=
ae3bcd95794fd4addab42e1495d55a%7C1%7C0%7C637388960206944100&amp;sdata=3DdK%=
2F85JSbyMEBQYqp6jb7r38qDSmv3NlSfZRHm64z8E8%3D&amp;reserved=3D0" target=3D"_=
blank">nss_3.56.bb</a>
 b/meta-oe/recipes-support/nss/<a href=3D"https://eur01.safelinks.protecti=
on.outlook.com/?url=3Dhttp%3A%2F%2Fnss_3.57.bb%2F&amp;data=3D02%7C01%7Candr=
ej.kozemcak%40siemens.com%7C48ce57d42382495832d408d875e1dc6f%7C38ae3bcd9579=
4fd4addab42e1495d55a%7C1%7C0%7C637388960206954055&amp;sdata=3Dz%2FC25v6UwHi=
y0Q4qQhU1MYAi9l0XvoOY84%2F%2FcErYM%2BE%3D&amp;reserved=3D0" target=3D"_blan=
k">nss_3.57.bb</a><br>
similarity index 98%<br>
rename from meta-oe/recipes-support/nss/<a href=3D"https://eur01.safelinks=
.protection.outlook.com/?url=3Dhttp%3A%2F%2Fnss_3.56.bb%2F&amp;data=3D02%7C=
01%7Candrej.kozemcak%40siemens.com%7C48ce57d42382495832d408d875e1dc6f%7C38a=
e3bcd95794fd4addab42e1495d55a%7C1%7C0%7C637388960206954055&amp;sdata=3DVDA7=
dTmbohN5axMKbg7EDj7Z5FDeR5q2Z0cUVh4FKxE%3D&amp;reserved=3D0" target=3D"_bla=
nk">nss_3.56.bb</a><br>
rename to meta-oe/recipes-support/nss/<a href=3D"https://eur01.safelinks.p=
rotection.outlook.com/?url=3Dhttp%3A%2F%2Fnss_3.57.bb%2F&amp;data=3D02%7C01=
%7Candrej.kozemcak%40siemens.com%7C48ce57d42382495832d408d875e1dc6f%7C38ae3=
bcd95794fd4addab42e1495d55a%7C1%7C0%7C637388960206954055&amp;sdata=3Dz%2FC2=
5v6UwHiy0Q4qQhU1MYAi9l0XvoOY84%2F%2FcErYM%2BE%3D&amp;reserved=3D0" target=
=3D"_blank">nss_3.57.bb</a><br>
index 997f8950f..5d9318a92 100644<br>
--- a/meta-oe/recipes-support/nss/<a href=3D"https://eur01.safelinks.prote=
ction.outlook.com/?url=3Dhttp%3A%2F%2Fnss_3.56.bb%2F&amp;data=3D02%7C01%7Ca=
ndrej.kozemcak%40siemens.com%7C48ce57d42382495832d408d875e1dc6f%7C38ae3bcd9=
5794fd4addab42e1495d55a%7C1%7C0%7C637388960206964011&amp;sdata=3DJqpHNPH3Ll=
tUZ6A5Yu%2FutU6LSRmaZexU64wWna5fVQA%3D&amp;reserved=3D0" target=3D"_blank">=
nss_3.56.bb</a><br>
+++ b/meta-oe/recipes-support/nss/<a href=3D"https://eur01.safelinks.prote=
ction.outlook.com/?url=3Dhttp%3A%2F%2Fnss_3.57.bb%2F&amp;data=3D02%7C01%7Ca=
ndrej.kozemcak%40siemens.com%7C48ce57d42382495832d408d875e1dc6f%7C38ae3bcd9=
5794fd4addab42e1495d55a%7C1%7C0%7C637388960206964011&amp;sdata=3DZ9ON7GPjFS=
UBoA2Jk8VIwYFjzfcMKgMEKwmAt%2FbDQ50%3D&amp;reserved=3D0" target=3D"_blank">=
nss_3.57.bb</a><br>
@@ -31,9 +31,8 @@ SRC_URI =3D &quot;<a href=3D"https://eur01.safelinks.pro=
tection.outlook.com/?url=3Dhttp%3A%2F%2Fftp.mozilla.org%2Fpub%2Fmozilla.org=
%2Fsecurity%2Fnss%2Freleases%2F%24%257BVERSIO&amp;data=3D02%7C01%7Candrej.k=
ozemcak%40siemens.com%7C48ce57d42382495832d408d875e1dc6f%7C38ae3bcd95794fd4=
addab42e1495d55a%7C1%7C0%7C637388960206973967&amp;sdata=3D8usOI6rSXTvYTSJfw=
FgPEhtR2mT0XGROmhQ3479nF3E%3D&amp;reserved=3D0" target=3D"_blank">http://ft=
p.mozilla.org/pub/mozilla.org/security/nss/releases/${VERSIO</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://system-pkcs11.txt \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://nss-fix-nsinstall-build.p=
atch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-freebl-add-a-configu=
re-option-to-disable-ARM-HW-cryp.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-pkix-Do-not-use-NULL=
-where-0-is-needed.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
-SRC_URI[sha256sum] =3D &quot;f875e0e8ed3b5ce92d675be4a55aa25a8c1199789a4a=
01f69b5f2327e2048e9c&quot;<br>
+SRC_URI[sha256sum] =3D &quot;55a86c01be860381d64bb4e5b94eb198df9b0f098a8a=
f0e58c014df398bdc382&quot;<br>
<br>
=C2=A0UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://eur01.safelinks.prot=
ection.outlook.com/?url=3Dhttps%3A%2F%2Fdeveloper.mozilla.org%2Fen-US%2Fdoc=
s%2FMozilla%2FProjects%2FNSS%2FNSS_Releases&amp;data=3D02%7C01%7Candrej.koz=
emcak%40siemens.com%7C48ce57d42382495832d408d875e1dc6f%7C38ae3bcd95794fd4ad=
dab42e1495d55a%7C1%7C0%7C637388960206973967&amp;sdata=3DdRLQlxeP4xzCqFvF5dX=
Dxg1x%2Fbvq0yJPW%2BiafpDIbpU%3D&amp;reserved=3D0" target=3D"_blank">https:/=
/developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_Releases</a>&quo=
t;<br>
=C2=A0UPSTREAM_CHECK_REGEX =3D &quot;NSS_(?P&lt;pver&gt;.+)_release_notes&=
quot;<br>
-- <br>
2.11.0<br>
<br>
<br>
<u></u><u></u></p>
</blockquote>
</div>
</div>
</div>

</blockquote></div>

--00000000000040ccbd05b23e2b94--
