Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web11.14950.1603299217691830843
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2020 09:53:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=W9OK3ZCm;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id o18so3291396edq.4
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2020 09:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gZMNnsSGKbvLO6ine726xF04yL9MYpJ7r4WAn2g0r/c=;
        b=W9OK3ZCmmphVaoHOIwRSaw18sRxZEDjItP6LlT47l6bFcAesji1LCdIqMPZyYUSZ0I
         I+FKavYFvnQjbUCUaguRE9o16deCqhq2qJCygsUxR1ujI6Spy1Nt+xxPx2kjhiW4i1tJ
         Bg//X5m/8G5FMsdRbI97WaO1zVx7eCtdf4eBGp9zo/WX7sDJDpzxkYiG8b2DeoS7DHnS
         qoysW7SkqAJwreMNHu3+mF3FwsIxLjXLmdV/2FmtfYPSHH0i/wklKV7MXU5ZKf7R4PSQ
         zr0DMBLrg7IEveCPpnK8zACffWAKEu1y4Kfo1DQzn3WHIqiVoRnm4UPpBpWEZrnufCdj
         0eYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gZMNnsSGKbvLO6ine726xF04yL9MYpJ7r4WAn2g0r/c=;
        b=hPyFwpBEdmJHJ4MAE4fbOnmpf11bqCz8ZUowYgSCO48/T/JwwI+H6SDKL6J8DghU6z
         FyIcFhDtzw7VyPnZt166nird7JQgFhUXs5cQyivudNKPn6X/sX2vYY+rsi7YJPyoJIF2
         09i6rZofT296wSyUi0PWpRl7EBZSJVpHk5/4PwZbEazCYbfFMiEx8pF2h4SmeDCPA6gO
         lZNdQVhOCiwrr8Hyrwo0ZEnlP0rXNjs8aYwkR4FBk8Jr7G32h9zjYMG+K+UzDynkwlRN
         zEfeenV1KowN5U55WjK7JV0AiJKD0LjStO8bUmB1XovmEEbzLppA6StmaujTZ86IK930
         xNjQ==
X-Gm-Message-State: AOAM532b0fTipzQz9QGLZk4p1ou+kPho4nymG99jFnjbiofZ8y838ded
	vZFbhLlQmbjpc+c2SZZ9Giu2OpQKqMUOOYgVEXI=
X-Google-Smtp-Source: ABdhPJz3+0xVyTgDhurbycJcytRspjkcz/xGaTv5FZaypwiRy6GLS0q2KFaNC+9AWKCezVdjM9siQSarXljN7kHyV1E=
X-Received: by 2002:a50:d751:: with SMTP id i17mr4013900edj.337.1603299216133;
 Wed, 21 Oct 2020 09:53:36 -0700 (PDT)
MIME-Version: 1.0
References: <20201019102559.19491-1-andrej.valek@siemens.com> <20201019102559.19491-2-andrej.valek@siemens.com>
In-Reply-To: <20201019102559.19491-2-andrej.valek@siemens.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Wed, 21 Oct 2020 18:53:25 +0200
Message-ID: <CA+chaQeXy=YJPN0z-8MY1fEDPmHGb-Ow9hFs9PdA3Rb2m5W0tg@mail.gmail.com>
Subject: Re: [oe][meta-oe][PATCH 1/2] nss: upgrade 3.56 -> 3.57
To: Andrej Valek <andrej.valek@siemens.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>, andrej.kozemcak@siemens.com
Content-Type: multipart/alternative; boundary="0000000000003f139e05b23130bb"

--0000000000003f139e05b23130bb
Content-Type: text/plain; charset="UTF-8"

Not sure what changed here (I didn't get the logs from this yet), but it
seems to be failing in postinst now:

WARNING: image-1.0-r0 do_rootfs: Manifest
tmp-glibc/sstate-control/manifest-x86_64-nss-native.populate_sysroot not
found in x86_64 (variant '')?
WARNING: image-1.0-r0 do_rootfs: Manifest
tmp-glibc/sstate-control/manifest-x86_64-nspr-native.populate_sysroot not
found in x86_64 (variant '')?
WARNING: image-1.0-r0 do_rootfs: nss.postinst returned 127, marking as
unpacked only, configuration required on target.
ERROR: image-1.0-r0 do_rootfs: Postinstall scriptlets of ['nss'] have
failed. If the intention is to defer them to first boot,
then please place them into pkg_postinst_ontarget_${PN} ().
Deferring to first boot via 'exit 1' is no longer supported.

Anyone seen this as well?

On Mon, Oct 19, 2020 at 12:29 PM Andrej Valek <andrej.valek@siemens.com>
wrote:

> - Refresh freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch
> - Drop pkix-Do-not-use-NULL-where-0-is-needed.patch
>
> Signed-off-by: Andrej Kozemcak <andrej.kozemcak@siemens.com>
> Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> ---
>  ...a-configure-option-to-disable-ARM-HW-cryp.patch | 36 +++++++++++------
>  ...01-pkix-Do-not-use-NULL-where-0-is-needed.patch | 46
> ----------------------
>  .../nss/{nss_3.56.bb => nss_3.57.bb}               |  3 +-
>  3 files changed, 24 insertions(+), 61 deletions(-)
>  delete mode 100644
> meta-oe/recipes-support/nss/nss/0001-pkix-Do-not-use-NULL-where-0-is-needed.patch
>  rename meta-oe/recipes-support/nss/{nss_3.56.bb => nss_3.57.bb} (98%)
>
> diff --git
> a/meta-oe/recipes-support/nss/nss/0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch
> b/meta-oe/recipes-support/nss/nss/0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch
> index bfc375e83..65e1500ae 100644
> ---
> a/meta-oe/recipes-support/nss/nss/0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch
> +++
> b/meta-oe/recipes-support/nss/nss/0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch
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
> +         DEFINES += -DNSS_X86
>   endif
>   endif
> - ifdef NS_USE_GCC
>  +ifdef NSS_USE_ARM_HW_CRYPTO
>  +    DEFINES += -DNSS_USE_ARM_HW_CRYPTO
>   ifeq ($(CPU_ARCH),aarch64)
> -     DEFINES += -DUSE_HW_AES -DUSE_HW_SHA1 -DUSE_HW_SHA2
> -     EXTRA_SRCS += aes-armv8.c gcm-aarch64.c sha1-armv8.c sha256-armv8.c
> -@@ -150,6 +152,7 @@ endif
> +     ifdef CC_IS_CLANG
> +         DEFINES += -DUSE_HW_AES -DUSE_HW_SHA1 -DUSE_HW_SHA2
> +@@ -166,6 +168,7 @@ endif
>           endif
>       endif
>   endif
> @@ -33,15 +35,23 @@ Signed-off-by: Alexander Kanavin <
> alex.kanavin@gmail.com>
>
>   ifeq ($(OS_TARGET),OSF1)
>       DEFINES += -DMP_ASSEMBLY_MULTIPLY -DMP_NO_MP_WORD
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
>   /* We don't test on big endian platform, so disable this on big endian.
> */
> + #define USE_ARM_GCM
> + #endif
> ++#endif
> +
> + /* Forward declarations */
> + SECStatus gcm_HashInit_hw(gcmHashContext *ghash);
> diff --git
> a/meta-oe/recipes-support/nss/nss/0001-pkix-Do-not-use-NULL-where-0-is-needed.patch
> b/meta-oe/recipes-support/nss/nss/0001-pkix-Do-not-use-NULL-where-0-is-needed.patch
> deleted file mode 100644
> index 432312da2..000000000
> ---
> a/meta-oe/recipes-support/nss/nss/0001-pkix-Do-not-use-NULL-where-0-is-needed.patch
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
> -        logger->logComponent = (PKIX_ERRORCLASS)NULL;
> -                               ^~~~~~~~~~~~~~~~~~~~~
> -pkix_logger.c:617:32: error: cast to smaller integer type
> 'PKIX_ERRORCLASS' from 'void *' [-Werror,-Wvoid-pointer-to-enum-cast]
> -        logger->logComponent = (PKIX_ERRORCLASS)NULL;
> -                               ^~~~~~~~~~~~~~~~~~~~~
> -2 errors generated.
> -
> -Upstream-Status: Submitted [
> https://bugzilla.mozilla.org/show_bug.cgi?id=1661378]
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
> -         logger->callback = NULL;
> -         PKIX_DECREF(logger->context);
> --        logger->logComponent = (PKIX_ERRORCLASS)NULL;
> -+        logger->logComponent = (PKIX_ERRORCLASS)0;
> -
> - cleanup:
> -
> -@@ -614,7 +614,7 @@ PKIX_Logger_Create(
> -
> -         logger->callback = callback;
> -         logger->maxLevel = 0;
> --        logger->logComponent = (PKIX_ERRORCLASS)NULL;
> -+        logger->logComponent = (PKIX_ERRORCLASS)0;
> -
> -         PKIX_INCREF(loggerContext);
> -         logger->context = loggerContext;
> ---
> -2.28.0
> -
> diff --git a/meta-oe/recipes-support/nss/nss_3.56.bb
> b/meta-oe/recipes-support/nss/nss_3.57.bb
> similarity index 98%
> rename from meta-oe/recipes-support/nss/nss_3.56.bb
> rename to meta-oe/recipes-support/nss/nss_3.57.bb
> index 997f8950f..5d9318a92 100644
> --- a/meta-oe/recipes-support/nss/nss_3.56.bb
> +++ b/meta-oe/recipes-support/nss/nss_3.57.bb
> @@ -31,9 +31,8 @@ SRC_URI = "
> http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/${VERSIO
>             file://system-pkcs11.txt \
>             file://nss-fix-nsinstall-build.patch \
>
> file://0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch \
> -           file://0001-pkix-Do-not-use-NULL-where-0-is-needed.patch \
>             "
> -SRC_URI[sha256sum] =
> "f875e0e8ed3b5ce92d675be4a55aa25a8c1199789a4a01f69b5f2327e2048e9c"
> +SRC_URI[sha256sum] =
> "55a86c01be860381d64bb4e5b94eb198df9b0f098a8af0e58c014df398bdc382"
>
>  UPSTREAM_CHECK_URI = "
> https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_Releases
> "
>  UPSTREAM_CHECK_REGEX = "NSS_(?P<pver>.+)_release_notes"
> --
> 2.11.0
>
>
> 
>
>

--0000000000003f139e05b23130bb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Not sure what changed here (I didn&#39;t get the logs=
 from this yet), but it seems to be failing in postinst now:</div><div><br>=
</div>WARNING: image-1.0-r0 do_rootfs: Manifest tmp-glibc/sstate-control/ma=
nifest-x86_64-nss-native.populate_sysroot not found in x86_64 (variant &#39=
;&#39;)?<br>WARNING: image-1.0-r0 do_rootfs: Manifest tmp-glibc/sstate-cont=
rol/manifest-x86_64-nspr-native.populate_sysroot not found in x86_64 (varia=
nt &#39;&#39;)?<br>WARNING: image-1.0-r0 do_rootfs: nss.postinst returned 1=
27, marking as unpacked only, configuration required on target.<br>ERROR: i=
mage-1.0-r0 do_rootfs: Postinstall scriptlets of [&#39;nss&#39;] have faile=
d. If the intention is to defer them to first boot,<div>then please place t=
hem into pkg_postinst_ontarget_${PN} ().<br>Deferring to first boot via &#3=
9;exit 1&#39; is no longer supported.<br></div><div><br></div><div>Anyone s=
een this as well?</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr=
" class=3D"gmail_attr">On Mon, Oct 19, 2020 at 12:29 PM Andrej Valek &lt;<a=
 href=3D"mailto:andrej.valek@siemens.com">andrej.valek@siemens.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">- Refresh=
 freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch<br>
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
=C2=A0.../nss/{<a href=3D"http://nss_3.56.bb" rel=3D"noreferrer" target=3D=
"_blank">nss_3.56.bb</a> =3D&gt; <a href=3D"http://nss_3.57.bb" rel=3D"nore=
ferrer" target=3D"_blank">nss_3.57.bb</a>}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 3 +-<br>
=C2=A03 files changed, 24 insertions(+), 61 deletions(-)<br>
=C2=A0delete mode 100644 meta-oe/recipes-support/nss/nss/0001-pkix-Do-not-=
use-NULL-where-0-is-needed.patch<br>
=C2=A0rename meta-oe/recipes-support/nss/{<a href=3D"http://nss_3.56.bb" r=
el=3D"noreferrer" target=3D"_blank">nss_3.56.bb</a> =3D&gt; <a href=3D"http=
://nss_3.57.bb" rel=3D"noreferrer" target=3D"_blank">nss_3.57.bb</a>} (98%)=
<br>
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
-Upstream-Status: Submitted [<a href=3D"https://bugzilla.mozilla.org/show_=
bug.cgi?id=3D1661378" rel=3D"noreferrer" target=3D"_blank">https://bugzilla=
.mozilla.org/show_bug.cgi?id=3D1661378</a>]<br>
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
diff --git a/meta-oe/recipes-support/nss/<a href=3D"http://nss_3.56.bb" re=
l=3D"noreferrer" target=3D"_blank">nss_3.56.bb</a> b/meta-oe/recipes-suppor=
t/nss/<a href=3D"http://nss_3.57.bb" rel=3D"noreferrer" target=3D"_blank">n=
ss_3.57.bb</a><br>
similarity index 98%<br>
rename from meta-oe/recipes-support/nss/<a href=3D"http://nss_3.56.bb" rel=
=
=3D"noreferrer" target=3D"_blank">nss_3.56.bb</a><br>
rename to meta-oe/recipes-support/nss/<a href=3D"http://nss_3.57.bb" rel=
=3D"noreferrer" target=3D"_blank">nss_3.57.bb</a><br>
index 997f8950f..5d9318a92 100644<br>
--- a/meta-oe/recipes-support/nss/<a href=3D"http://nss_3.56.bb" rel=3D"no=
referrer" target=3D"_blank">nss_3.56.bb</a><br>
+++ b/meta-oe/recipes-support/nss/<a href=3D"http://nss_3.57.bb" rel=3D"no=
referrer" target=3D"_blank">nss_3.57.bb</a><br>
@@ -31,9 +31,8 @@ SRC_URI =3D &quot;<a href=3D"http://ftp.mozilla.org/pub/=
mozilla.org/security/nss/releases/$%7BVERSIO" rel=3D"noreferrer" target=3D"=
_blank">http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/${VERS=
IO</a><br>
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
=C2=A0UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://developer.mozilla.or=
g/en-US/docs/Mozilla/Projects/NSS/NSS_Releases" rel=3D"noreferrer" target=
=3D"_blank">https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/=
NSS_Releases</a>&quot;<br>
=C2=A0UPSTREAM_CHECK_REGEX =3D &quot;NSS_(?P&lt;pver&gt;.+)_release_notes&=
quot;<br>
-- <br>
2.11.0<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--0000000000003f139e05b23130bb--
