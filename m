Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
 by mx.groups.io with SMTP id smtpd.web10.47924.1598635136531398004
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Aug 2020 10:18:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=i8fzvmJE;
 spf=pass (domain: gmail.com, ip: 209.85.218.67, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f67.google.com with SMTP id l2so154573eji.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 28 Aug 2020 10:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UW8/mwgW/E1wpZd2r5SZ5WCHLfKuyMmxxjf+c55AOFw=;
        b=i8fzvmJE66kdMxtp7VxzmGZ9EfXE2TGtw/QFp+jo9+GX3l4cFTkjM5UeZXtjqZKrlG
         weiknQaBh/H0KuVUhBtZsAn++D9O4xjXRf22euzEyFfnt2dGDna/qhpQhlJypn0ZQsaR
         q48pL2NIt/XyYgISacRvZqQdqZATgk9WjhZRdRmo+GLbW+TqZx6u0SbANFATnJaTmNvH
         PCJ7Coj40DWUTKiBeRuU89pmYOL53zvZ2OOPnNMQVa3Fd9nfEAly/2BmrseTYGB0wTxw
         YI0SzMX+Vr7j7aTMkY3Cb/FlEpkA40+TqKWNl4rkPq6FdhWJvj+ve2NFnwMmxulyZSs2
         BIHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UW8/mwgW/E1wpZd2r5SZ5WCHLfKuyMmxxjf+c55AOFw=;
        b=c5Bbbk0Ul3eWUAd09N88A7Ni9F2PtMgrkvu3R5AGZ4crsW+WEwi55sXl3HOY+4q6X0
         cfM9SnUgoThDCiaGLWFWYcAgJuGGipKbkXFfE9QO80ciO4btVp1AF2fKNTPSL/iGhGge
         cvJkIZe27Fz5Jqr9Ow13xMXg0y/Rp3KoMITI3bk827hA2PR5zmgKbR/A9YK7ZT1JhDoT
         1sdxTOxRSKuM5vbeAIpQ21ymLH3jwnUYff+WofvRwRbfAs8tBW7dsOMBPWh+D7jXN/r9
         3SnIBe5XwMO+Mlq8CKWKvB6M1To7e3RN9QNFIbRJQQ10zS9I+aK1qx8uW4GVJYjBVf/w
         2lJA==
X-Gm-Message-State: AOAM5309CQUeDx8c08a9nNRjRH5BwEPCvuFUXj8B2UIhB1SGpyZaPtaW
	cmdVECZRIUv3SzZJiEGTupxtJRZ+rJlYZ9ab2XQ=
X-Google-Smtp-Source: ABdhPJwnYt5yAAXBnujdamDa3jpi+xihxWFLk8QRtLVlB/x76eMkS2xu+25MDA8b+/FnmH1l/PvJfcRIGzZjpoC8OM4=
X-Received: by 2002:a17:907:363:: with SMTP id rs3mr849039ejb.54.1598635134859;
 Fri, 28 Aug 2020 10:18:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200828020411.1988431-1-raj.khem@gmail.com> <eca6954a-0a7d-8990-70ab-2b141c53ce69@gmail.com>
 <CA+chaQcn6Ep4YRRJDaXLbdRoTA791VzEsqBb29yWj_GT6K6U1g@mail.gmail.com> <1460d060-bcec-4e42-d34a-0d3d336e96ef@gmail.com>
In-Reply-To: <1460d060-bcec-4e42-d34a-0d3d336e96ef@gmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Fri, 28 Aug 2020 19:18:43 +0200
Message-ID: <CA+chaQdAeq_g1a7bOE_WWPvTreG2=DEFa9at8M5Kc51qKMV9Kw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v2] nss: Upgrade to 3.56
To: Khem Raj <raj.khem@gmail.com>
Cc: akuster <akuster808@gmail.com>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>, 
	Mikko Rapeli <mikko.rapeli@bmw.de>
Content-Type: multipart/alternative; boundary="00000000000056bfa305adf33f70"

--00000000000056bfa305adf33f70
Content-Type: text/plain; charset="UTF-8"

I'm testing a fix for target, would be nice if Mikko can confirm nativesdk
works with it - will send it later today.

On Fri, Aug 28, 2020 at 7:03 PM Khem Raj <raj.khem@gmail.com> wrote:

>
>
> On 8/28/20 8:14 AM, Martin Jansa wrote:
> > I'm seeing this postinst issue already without Khem's nss changes, I
> > guess it is caused by:
> > 31552510b1 nss: fix postinst script for nativesdk build
> >
>
> seems so. Although my upgrade patch had compile issues during build
> which are fixed now.
>
> perhaps we should revert 31552510b1 unless there is a better fix Mikko
> any ideas ?
>
> > On Fri, Aug 28, 2020 at 4:43 PM akuster <akuster808@gmail.com
> > <mailto:akuster808@gmail.com>> wrote:
> >
> >
> >
> >     On 8/27/20 7:04 PM, Khem Raj wrote:
> >      > Forward port
> >     0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch
> >      >
> >      > Signed-off-by: Khem Raj <raj.khem@gmail.com
> >     <mailto:raj.khem@gmail.com>>
> >      > ---
> >      > v2: Update armv8 hw crypto patch to work on arm32
> >
> >     Did you add this to an image?
> >
> >     I am seeing new error when nss is appended to an image.
> >
> >     WARNING: security-build-image-1.0-r0 do_rootfs: nss.postinst
> >     returned 127, marking as unpacked only, configuration required on
> >     target.
> >     2020-08-28 02:07:33 - ERROR    - ERROR: security-build-image-1.0-r0
> >     do_rootfs: Postinstall scriptlets of ['nss'] have failed. If the
> >     intention is to defer them to first boot,
> >     2020-08-28 02:07:33 - ERROR    - then please place them into
> >     pkg_postinst_ontarget_${PN} ().
> >     2020-08-28 02:07:33 - ERROR    - Deferring to first boot via 'exit
> >     1' is no longer supported.
> >
> >     - Armin
> >
> >      >
> >      >  ...figure-option-to-disable-ARM-HW-cryp.patch | 32
> >     ++++++-------------
> >      >  .../nss/{nss_3.54.bb <http://nss_3.54.bb> => nss_3.56.bb
> >     <http://nss_3.56.bb>}          |  3 +-
> >      >  2 files changed, 11 insertions(+), 24 deletions(-)
> >      >  rename meta-oe/recipes-support/nss/{nss_3.54.bb
> >     <http://nss_3.54.bb> => nss_3.56.bb <http://nss_3.56.bb>} (99%)
> >      >
> >      > diff --git
> >
>  a/meta-oe/recipes-support/nss/nss/0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch
> >
>  b/meta-oe/recipes-support/nss/nss/0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch
> >      > index 1a87a0577f..f1f76bd1b7 100644
> >      > ---
> >
>  a/meta-oe/recipes-support/nss/nss/0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch
> >      > +++
> >
>  b/meta-oe/recipes-support/nss/nss/0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch
> >      > @@ -14,21 +14,18 @@ Signed-off-by: Alexander Kanavin
> >     <alex.kanavin@gmail.com <mailto:alex.kanavin@gmail.com>>
> >      >   nss/lib/freebl/gcm.c    | 2 ++
> >      >   2 files changed, 6 insertions(+)
> >      >
> >      > -diff --git a/nss/lib/freebl/Makefile b/nss/lib/freebl/Makefile
> >      > -index f99f769..b0ec81b 100644
> >      >  --- a/nss/lib/freebl/Makefile
> >      >  +++ b/nss/lib/freebl/Makefile
> >      > -@@ -125,6 +125,9 @@ else
> >      > -         DEFINES += -DNSS_X86
> >      > +@@ -126,6 +126,8 @@ else
> >      >   endif
> >      >   endif
> >      > -+
> >      > + ifdef NS_USE_GCC
> >      >  +ifdef NSS_USE_ARM_HW_CRYPTO
> >      >  +    DEFINES += -DNSS_USE_ARM_HW_CRYPTO
> >      >   ifeq ($(CPU_ARCH),aarch64)
> >      > -     DEFINES += -DUSE_HW_AES -DUSE_HW_SHA2
> >      > -     EXTRA_SRCS += aes-armv8.c gcm-aarch64.c sha256-armv8.c
> >      > -@@ -148,6 +151,7 @@ endif
> >      > +     DEFINES += -DUSE_HW_AES -DUSE_HW_SHA1 -DUSE_HW_SHA2
> >      > +     EXTRA_SRCS += aes-armv8.c gcm-aarch64.c sha1-armv8.c
> >     sha256-armv8.c
> >      > +@@ -150,6 +152,7 @@ endif
> >      >           endif
> >      >       endif
> >      >   endif
> >      > @@ -36,23 +33,14 @@ index f99f769..b0ec81b 100644
> >      >
> >      >   ifeq ($(OS_TARGET),OSF1)
> >      >       DEFINES += -DMP_ASSEMBLY_MULTIPLY -DMP_NO_MP_WORD
> >      > -diff --git a/nss/lib/freebl/gcm.c b/nss/lib/freebl/gcm.c
> >      > -index c2cc18d..b77f573 100644
> >      >  --- a/nss/lib/freebl/gcm.c
> >      >  +++ b/nss/lib/freebl/gcm.c
> >      > -@@ -18,6 +18,7 @@
> >      > +@@ -20,7 +20,7 @@
> >      >
> >      > - #include <limits.h>
> >      > -
> >      > -+#ifdef NSS_USE_ARM_HW_CRYPTO
> >      >   /* old gcc doesn't support some poly64x2_t intrinsic */
> >      >   #if defined(__aarch64__) && defined(IS_LITTLE_ENDIAN) && \
> >      > -     (defined(__clang__) || defined(__GNUC__) && __GNUC__ > 6)
> >      > -@@ -27,6 +28,7 @@
> >      > - /* We don't test on big endian platform, so disable this on big
> >     endian. */
> >      > +-    (defined(__clang__) || defined(__GNUC__) && __GNUC__ > 6)
> >      > ++    (defined(__clang__) && defined(NSS_USE_ARM_HW_CRYPTO) ||
> >     defined(__GNUC__) && __GNUC__ > 6)
> >      >   #define USE_ARM_GCM
> >      > - #endif
> >      > -+#endif
> >      > -
> >      > - /* Forward declarations */
> >      > - SECStatus gcm_HashInit_hw(gcmHashContext *ghash);
> >      > + #elif defined(__arm__) && defined(IS_LITTLE_ENDIAN) && \
> >      > +     !defined(NSS_DISABLE_ARM32_NEON)
> >      > diff --git a/meta-oe/recipes-support/nss/nss_3.54.bb
> >     <http://nss_3.54.bb> b/meta-oe/recipes-support/nss/nss_3.56.bb
> >     <http://nss_3.56.bb>
> >      > similarity index 99%
> >      > rename from meta-oe/recipes-support/nss/nss_3.54.bb
> >     <http://nss_3.54.bb>
> >      > rename to meta-oe/recipes-support/nss/nss_3.56.bb
> >     <http://nss_3.56.bb>
> >      > index 1cc94735bb..4aa5d29ec2 100644
> >      > --- a/meta-oe/recipes-support/nss/nss_3.54.bb <http://nss_3.54.bb
> >
> >      > +++ b/meta-oe/recipes-support/nss/nss_3.56.bb <http://nss_3.56.bb
> >
> >      > @@ -34,8 +34,7 @@ SRC_URI =
> >     "
> http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/${VERSIO
> >     <
> http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/$%7BVERSIO>
> >      >
> >
>  file://0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch \
> >      >
> >       file://0001-pkix-Do-not-use-NULL-where-0-is-needed.patch \
> >      >             "
> >      > -
> >      > -SRC_URI[sha256sum] =
> >     "dab18bbfcf5e347934cda664df75ce9fd912a5772686c40d3c805e53c08d6e43"
> >      > +SRC_URI[sha256sum] =
> >     "f875e0e8ed3b5ce92d675be4a55aa25a8c1199789a4a01f69b5f2327e2048e9c"
> >      >
> >      >  UPSTREAM_CHECK_URI =
> >     "
> https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_Releases
> "
> >      >  UPSTREAM_CHECK_REGEX = "NSS_(?P<pver>.+)_release_notes"
> >      >
> >      >
> >
> >     
> >
>

--00000000000056bfa305adf33f70
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;m testing a fix for target, would be nice if Mikko c=
an confirm nativesdk works with it - will send it later today.</div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Aug 2=
8, 2020 at 7:03 PM Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.k=
hem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex"><br>
<br>
On 8/28/20 8:14 AM, Martin Jansa wrote:<br>
&gt; I&#39;m seeing this postinst issue already without Khem&#39;s nss cha=
nges, I <br>
&gt; guess it is caused by:<br>
&gt; 31552510b1 nss: fix postinst script for nativesdk build<br>
&gt; <br>
<br>
seems so. Although my upgrade patch had compile issues during build <br>
which are fixed now.<br>
<br>
perhaps we should revert 31552510b1 unless there is a better fix Mikko <br=
>
any ideas ?<br>
<br>
&gt; On Fri, Aug 28, 2020 at 4:43 PM akuster &lt;<a href=3D"mailto:akuster=
808@gmail.com" target=3D"_blank">akuster808@gmail.com</a> <br>
&gt; &lt;mailto:<a href=3D"mailto:akuster808@gmail.com" target=3D"_blank">=
akuster808@gmail.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On 8/27/20 7:04 PM, Khem Raj wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Forward port<br>
&gt;=C2=A0 =C2=A0 =C2=A00001-freebl-add-a-configure-option-to-disable-ARM-=
HW-cryp.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailt=
o:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:raj.khem@gmail.com" t=
arget=3D"_blank">raj.khem@gmail.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; ---<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; v2: Update armv8 hw crypto patch to work on =
arm32<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Did you add this to an image?<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0I am seeing new error when nss is appended to an i=
mage.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0WARNING: security-build-image-1.0-r0 do_rootfs: ns=
s.postinst<br>
&gt;=C2=A0 =C2=A0 =C2=A0returned 127, marking as unpacked only, configurat=
ion required on<br>
&gt;=C2=A0 =C2=A0 =C2=A0target.<br>
&gt;=C2=A0 =C2=A0 =C2=A02020-08-28 02:07:33 - ERROR=C2=A0 =C2=A0 - ERROR: =
security-build-image-1.0-r0<br>
&gt;=C2=A0 =C2=A0 =C2=A0do_rootfs: Postinstall scriptlets of [&#39;nss&#39=
;] have failed. If the<br>
&gt;=C2=A0 =C2=A0 =C2=A0intention is to defer them to first boot,<br>
&gt;=C2=A0 =C2=A0 =C2=A02020-08-28 02:07:33 - ERROR=C2=A0 =C2=A0 - then pl=
ease place them into<br>
&gt;=C2=A0 =C2=A0 =C2=A0pkg_postinst_ontarget_${PN} ().<br>
&gt;=C2=A0 =C2=A0 =C2=A02020-08-28 02:07:33 - ERROR=C2=A0 =C2=A0 - Deferri=
ng to first boot via &#39;exit<br>
&gt;=C2=A0 =C2=A0 =C2=A01&#39; is no longer supported.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0- Armin<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 ...figure-option-to-disable-ARM-HW-cry=
p.patch | 32<br>
&gt;=C2=A0 =C2=A0 =C2=A0++++++-------------<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 .../nss/{<a href=3D"http://nss_3.54.bb=
" rel=3D"noreferrer" target=3D"_blank">nss_3.54.bb</a> &lt;<a href=3D"http:=
//nss_3.54.bb" rel=3D"noreferrer" target=3D"_blank">http://nss_3.54.bb</a>&=
gt; =3D&gt; <a href=3D"http://nss_3.56.bb" rel=3D"noreferrer" target=3D"_bl=
ank">nss_3.56.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://nss_3.56.bb" rel=3D"noreferr=
er" target=3D"_blank">http://nss_3.56.bb</a>&gt;}=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 3 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 2 files changed, 11 insertions(+), 24 =
deletions(-)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 rename meta-oe/recipes-support/nss/{<a=
 href=3D"http://nss_3.54.bb" rel=3D"noreferrer" target=3D"_blank">nss_3.54.=
bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://nss_3.54.bb" rel=3D"noreferr=
er" target=3D"_blank">http://nss_3.54.bb</a>&gt; =3D&gt; <a href=3D"http://=
nss_3.56.bb" rel=3D"noreferrer" target=3D"_blank">nss_3.56.bb</a> &lt;<a hr=
ef=3D"http://nss_3.56.bb" rel=3D"noreferrer" target=3D"_blank">http://nss_3=
.56.bb</a>&gt;} (99%)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; diff --git<br>
&gt;=C2=A0 =C2=A0 =C2=A0a/meta-oe/recipes-support/nss/nss/0001-freebl-add-=
a-configure-option-to-disable-ARM-HW-cryp.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/meta-oe/recipes-support/nss/nss/0001-freebl-add-=
a-configure-option-to-disable-ARM-HW-cryp.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; index 1a87a0577f..f1f76bd1b7 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; ---<br>
&gt;=C2=A0 =C2=A0 =C2=A0a/meta-oe/recipes-support/nss/nss/0001-freebl-add-=
a-configure-option-to-disable-ARM-HW-cryp.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +++<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/meta-oe/recipes-support/nss/nss/0001-freebl-add-=
a-configure-option-to-disable-ARM-HW-cryp.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; @@ -14,21 +14,18 @@ Signed-off-by: Alexander=
 Kanavin<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"mailto:alex.kanavin@gmail.com" targ=
et=3D"_blank">alex.kanavin@gmail.com</a> &lt;mailto:<a href=3D"mailto:alex.=
kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0nss/lib/freebl/gcm.c=C2=A0 =C2=
=A0 | 2 ++<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A02 files changed, 6 insertions(+)=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -diff --git a/nss/lib/freebl/Makefile b/nss/=
lib/freebl/Makefile<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -index f99f769..b0ec81b 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 --- a/nss/lib/freebl/Makefile<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 +++ b/nss/lib/freebl/Makefile<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -@@ -125,6 +125,9 @@ else<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DEFINES +=
=
=3D -DNSS_X86<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +@@ -126,6 +126,8 @@ else<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0endif<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0endif<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -+<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; + ifdef NS_USE_GCC<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 +ifdef NSS_USE_ARM_HW_CRYPTO<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 +=C2=A0 =C2=A0 DEFINES +=3D -DNSS_USE_=
ARM_HW_CRYPTO<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0ifeq ($(CPU_ARCH),aarch64)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 =C2=A0 =C2=A0DEFINES +=3D -DUSE_HW_A=
ES -DUSE_HW_SHA2<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 =C2=A0 =C2=A0EXTRA_SRCS +=3D aes-arm=
v8.c gcm-aarch64.c sha256-armv8.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -@@ -148,6 +151,7 @@ endif<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0DEFINES +=3D -DUSE_HW_A=
ES -DUSE_HW_SHA1 -DUSE_HW_SHA2<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0EXTRA_SRCS +=3D aes-arm=
v8.c gcm-aarch64.c sha1-armv8.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0sha256-armv8.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +@@ -150,6 +152,7 @@ endif<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0endi=
f<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0endif<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0endif<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; @@ -36,23 +33,14 @@ index f99f769..b0ec81b 1=
00644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0ifeq ($(OS_TARGET),OSF1)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0DEFINES +=3D -DMP_=
ASSEMBLY_MULTIPLY -DMP_NO_MP_WORD<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -diff --git a/nss/lib/freebl/gcm.c b/nss/lib=
/freebl/gcm.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -index c2cc18d..b77f573 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 --- a/nss/lib/freebl/gcm.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 +++ b/nss/lib/freebl/gcm.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -@@ -18,6 +18,7 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +@@ -20,7 +20,7 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; - #include &lt;limits.h&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -+#ifdef NSS_USE_ARM_HW_CRYPTO<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0/* old gcc doesn&#39;t support s=
ome poly64x2_t intrinsic */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0#if defined(__aarch64__) &amp;&a=
mp; defined(IS_LITTLE_ENDIAN) &amp;&amp; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 =C2=A0 =C2=A0(defined(__clang__) || =
defined(__GNUC__) &amp;&amp; __GNUC__ &gt; 6)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -@@ -27,6 +28,7 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; - /* We don&#39;t test on big endian platfor=
m, so disable this on big<br>
&gt;=C2=A0 =C2=A0 =C2=A0endian. */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +-=C2=A0 =C2=A0 (defined(__clang__) || defin=
ed(__GNUC__) &amp;&amp; __GNUC__ &gt; 6)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; ++=C2=A0 =C2=A0 (defined(__clang__) &amp;&am=
p; defined(NSS_USE_ARM_HW_CRYPTO) ||<br>
&gt;=C2=A0 =C2=A0 =C2=A0defined(__GNUC__) &amp;&amp; __GNUC__ &gt; 6)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0#define USE_ARM_GCM<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; - #endif<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -+#endif<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; - /* Forward declarations */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; - SECStatus gcm_HashInit_hw(gcmHashContext *=
ghash);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; + #elif defined(__arm__) &amp;&amp; defined(=
IS_LITTLE_ENDIAN) &amp;&amp; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0!defined(NSS_DISABLE_AR=
M32_NEON)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; diff --git a/meta-oe/recipes-support/nss/<a =
href=3D"http://nss_3.54.bb" rel=3D"noreferrer" target=3D"_blank">nss_3.54.b=
b</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://nss_3.54.bb" rel=3D"noreferr=
er" target=3D"_blank">http://nss_3.54.bb</a>&gt; b/meta-oe/recipes-support/=
nss/<a href=3D"http://nss_3.56.bb" rel=3D"noreferrer" target=3D"_blank">nss=
_3.56.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://nss_3.56.bb" rel=3D"noreferr=
er" target=3D"_blank">http://nss_3.56.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; similarity index 99%<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; rename from meta-oe/recipes-support/nss/<a h=
ref=3D"http://nss_3.54.bb" rel=3D"noreferrer" target=3D"_blank">nss_3.54.bb=
</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://nss_3.54.bb" rel=3D"noreferr=
er" target=3D"_blank">http://nss_3.54.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; rename to meta-oe/recipes-support/nss/<a hre=
f=3D"http://nss_3.56.bb" rel=3D"noreferrer" target=3D"_blank">nss_3.56.bb</=
a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://nss_3.56.bb" rel=3D"noreferr=
er" target=3D"_blank">http://nss_3.56.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; index 1cc94735bb..4aa5d29ec2 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; --- a/meta-oe/recipes-support/nss/<a href=3D=
"http://nss_3.54.bb" rel=3D"noreferrer" target=3D"_blank">nss_3.54.bb</a> &=
lt;<a href=3D"http://nss_3.54.bb" rel=3D"noreferrer" target=3D"_blank">http=
://nss_3.54.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +++ b/meta-oe/recipes-support/nss/<a href=3D=
"http://nss_3.56.bb" rel=3D"noreferrer" target=3D"_blank">nss_3.56.bb</a> &=
lt;<a href=3D"http://nss_3.56.bb" rel=3D"noreferrer" target=3D"_blank">http=
://nss_3.56.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; @@ -34,8 +34,7 @@ SRC_URI =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;<a href=3D"http://ftp.mozilla.org/pub/mozill=
a.org/security/nss/releases/$%7BVERSIO" rel=3D"noreferrer" target=3D"_blank=
">http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/${VERSIO</a>=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://ftp.mozilla.org/pub/mozilla.=
org/security/nss/releases/$%7BVERSIO" rel=3D"noreferrer" target=3D"_blank">=
http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/$%7BVERSIO</a>=
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-freebl-add-a-configure-option-t=
o-disable-ARM-HW-cryp.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-pkix-Do-not-use-NULL-where-0-is=
-needed.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -SRC_URI[sha256sum] =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;dab18bbfcf5e347934cda664df75ce9fd912a5772686=
c40d3c805e53c08d6e43&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +SRC_URI[sha256sum] =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;f875e0e8ed3b5ce92d675be4a55aa25a8c1199789a4a=
01f69b5f2327e2048e9c&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 UPSTREAM_CHECK_URI =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;<a href=3D"https://developer.mozilla.org/en-=
US/docs/Mozilla/Projects/NSS/NSS_Releases" rel=3D"noreferrer" target=3D"_bl=
ank">https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_Rele=
ases</a>&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 UPSTREAM_CHECK_REGEX =3D &quot;NSS_(?P=
&lt;pver&gt;.+)_release_notes&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0<br>
&gt; <br>
</blockquote></div>

--00000000000056bfa305adf33f70--
