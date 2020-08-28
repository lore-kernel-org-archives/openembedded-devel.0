Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
 by mx.groups.io with SMTP id smtpd.web11.45219.1598627655932596308
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Aug 2020 08:14:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PdkX/PGB;
 spf=pass (domain: gmail.com, ip: 209.85.218.65, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f65.google.com with SMTP id j25so1973789ejk.9
        for <openembedded-devel@lists.openembedded.org>; Fri, 28 Aug 2020 08:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Jj7qyS6pOAQWAtNepl76rZBv1ITT6ustVz5Ykk0qw/s=;
        b=PdkX/PGBJAEPDrSwxt179GohK+oA4uirSiNbDKNljimnlpDAuuZjfrHs3LQJsNNNfA
         Zl1tkucyMD+sQOvZwPjIz+P2MBwRcaZljlI8Xa7d9FvtfQkrA65EIWKkfZ/8Mn+75ByS
         Gl0HN1Zu+xsORvSBvtkL08GRu9pCWq1Jxn/4hckoahrvx3ua6Gs4LnWGF6gnMs/JR4CU
         BI+Z52E5u8Jh1+KKMea1ph52u1/Mc/9capsdIIH+NOq+8F34vNJ4DPhCNPh3T8vIj3zx
         ZasRj1pTZPxfFZANagROOHViJjWkmIOqt8NnfEzRy8TfPIWnGdhmu/BbUTdZLZp7Rgkn
         kKLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Jj7qyS6pOAQWAtNepl76rZBv1ITT6ustVz5Ykk0qw/s=;
        b=sY9VlMzje+TZio3Jdpp6baikA+kU34wLcM9TfZWH/t1BJK62QhFB/wsITML3PhRcP2
         f1SE/5c+2W5EibtmhC7cAUEpj5f9gRBlxOqA+FIGl6Xqse/guA/6fhfDDkz1zVyd78PP
         NvdWvGx8OLHFtABEJCBmVZn/WB86BhEN1kGvn2x07pQxTSEXkuTl0393skmUhOIoqjJG
         xFc4j7vUKEAbuj+y4vwpMSiikkMjZeLFxcD1opeNM/K/pmCUeMAqkFSo7Zzon7SvX5PF
         x0eYo9NbbEZHUAlQHdh8NSvbqKeNpotR95/W8iZukj+M0USkhL7GfC/n+Ynalsc1skRP
         Kx7A==
X-Gm-Message-State: AOAM5300kt0zWV1gdjyjtzPlttxBw4JEUa0DN0RFjUOWTxTvUCDx5lG7
	EDMpL8sn9gOOUVQKtByHInlnum4BG97Ro5G4oqw=
X-Google-Smtp-Source: ABdhPJwRnpAgpxk5z1N3SOPCS1rZ6OvYdn8wmE6Pzw8CqNm4sVJu+dNHP+rMp46CeCU1oean9IjAYnFhs51Fwl2JdRo=
X-Received: by 2002:a17:906:80ce:: with SMTP id a14mr2388273ejx.470.1598627654278;
 Fri, 28 Aug 2020 08:14:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200828020411.1988431-1-raj.khem@gmail.com> <eca6954a-0a7d-8990-70ab-2b141c53ce69@gmail.com>
In-Reply-To: <eca6954a-0a7d-8990-70ab-2b141c53ce69@gmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Fri, 28 Aug 2020 17:14:03 +0200
Message-ID: <CA+chaQcn6Ep4YRRJDaXLbdRoTA791VzEsqBb29yWj_GT6K6U1g@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v2] nss: Upgrade to 3.56
To: akuster <akuster808@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000076221e05adf18187"

--00000000000076221e05adf18187
Content-Type: text/plain; charset="UTF-8"

I'm seeing this postinst issue already without Khem's nss changes, I guess
it is caused by:
31552510b1 nss: fix postinst script for nativesdk build

On Fri, Aug 28, 2020 at 4:43 PM akuster <akuster808@gmail.com> wrote:

>
>
> On 8/27/20 7:04 PM, Khem Raj wrote:
> > Forward port
> 0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> > v2: Update armv8 hw crypto patch to work on arm32
>
> Did you add this to an image?
>
> I am seeing new error when nss is appended to an image.
>
> WARNING: security-build-image-1.0-r0 do_rootfs: nss.postinst returned 127,
> marking as unpacked only, configuration required on target.
> 2020-08-28 02:07:33 - ERROR    - ERROR: security-build-image-1.0-r0
> do_rootfs: Postinstall scriptlets of ['nss'] have failed. If the intention
> is to defer them to first boot,
> 2020-08-28 02:07:33 - ERROR    - then please place them into
> pkg_postinst_ontarget_${PN} ().
> 2020-08-28 02:07:33 - ERROR    - Deferring to first boot via 'exit 1' is
> no longer supported.
>
> - Armin
>
> >
> >  ...figure-option-to-disable-ARM-HW-cryp.patch | 32 ++++++-------------
> >  .../nss/{nss_3.54.bb => nss_3.56.bb}          |  3 +-
> >  2 files changed, 11 insertions(+), 24 deletions(-)
> >  rename meta-oe/recipes-support/nss/{nss_3.54.bb => nss_3.56.bb} (99%)
> >
> > diff --git
> a/meta-oe/recipes-support/nss/nss/0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch
> b/meta-oe/recipes-support/nss/nss/0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch
> > index 1a87a0577f..f1f76bd1b7 100644
> > ---
> a/meta-oe/recipes-support/nss/nss/0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch
> > +++
> b/meta-oe/recipes-support/nss/nss/0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch
> > @@ -14,21 +14,18 @@ Signed-off-by: Alexander Kanavin <
> alex.kanavin@gmail.com>
> >   nss/lib/freebl/gcm.c    | 2 ++
> >   2 files changed, 6 insertions(+)
> >
> > -diff --git a/nss/lib/freebl/Makefile b/nss/lib/freebl/Makefile
> > -index f99f769..b0ec81b 100644
> >  --- a/nss/lib/freebl/Makefile
> >  +++ b/nss/lib/freebl/Makefile
> > -@@ -125,6 +125,9 @@ else
> > -         DEFINES += -DNSS_X86
> > +@@ -126,6 +126,8 @@ else
> >   endif
> >   endif
> > -+
> > + ifdef NS_USE_GCC
> >  +ifdef NSS_USE_ARM_HW_CRYPTO
> >  +    DEFINES += -DNSS_USE_ARM_HW_CRYPTO
> >   ifeq ($(CPU_ARCH),aarch64)
> > -     DEFINES += -DUSE_HW_AES -DUSE_HW_SHA2
> > -     EXTRA_SRCS += aes-armv8.c gcm-aarch64.c sha256-armv8.c
> > -@@ -148,6 +151,7 @@ endif
> > +     DEFINES += -DUSE_HW_AES -DUSE_HW_SHA1 -DUSE_HW_SHA2
> > +     EXTRA_SRCS += aes-armv8.c gcm-aarch64.c sha1-armv8.c sha256-armv8.c
> > +@@ -150,6 +152,7 @@ endif
> >           endif
> >       endif
> >   endif
> > @@ -36,23 +33,14 @@ index f99f769..b0ec81b 100644
> >
> >   ifeq ($(OS_TARGET),OSF1)
> >       DEFINES += -DMP_ASSEMBLY_MULTIPLY -DMP_NO_MP_WORD
> > -diff --git a/nss/lib/freebl/gcm.c b/nss/lib/freebl/gcm.c
> > -index c2cc18d..b77f573 100644
> >  --- a/nss/lib/freebl/gcm.c
> >  +++ b/nss/lib/freebl/gcm.c
> > -@@ -18,6 +18,7 @@
> > +@@ -20,7 +20,7 @@
> >
> > - #include <limits.h>
> > -
> > -+#ifdef NSS_USE_ARM_HW_CRYPTO
> >   /* old gcc doesn't support some poly64x2_t intrinsic */
> >   #if defined(__aarch64__) && defined(IS_LITTLE_ENDIAN) && \
> > -     (defined(__clang__) || defined(__GNUC__) && __GNUC__ > 6)
> > -@@ -27,6 +28,7 @@
> > - /* We don't test on big endian platform, so disable this on big
> endian. */
> > +-    (defined(__clang__) || defined(__GNUC__) && __GNUC__ > 6)
> > ++    (defined(__clang__) && defined(NSS_USE_ARM_HW_CRYPTO) ||
> defined(__GNUC__) && __GNUC__ > 6)
> >   #define USE_ARM_GCM
> > - #endif
> > -+#endif
> > -
> > - /* Forward declarations */
> > - SECStatus gcm_HashInit_hw(gcmHashContext *ghash);
> > + #elif defined(__arm__) && defined(IS_LITTLE_ENDIAN) && \
> > +     !defined(NSS_DISABLE_ARM32_NEON)
> > diff --git a/meta-oe/recipes-support/nss/nss_3.54.bb
> b/meta-oe/recipes-support/nss/nss_3.56.bb
> > similarity index 99%
> > rename from meta-oe/recipes-support/nss/nss_3.54.bb
> > rename to meta-oe/recipes-support/nss/nss_3.56.bb
> > index 1cc94735bb..4aa5d29ec2 100644
> > --- a/meta-oe/recipes-support/nss/nss_3.54.bb
> > +++ b/meta-oe/recipes-support/nss/nss_3.56.bb
> > @@ -34,8 +34,7 @@ SRC_URI = "
> http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/${VERSIO
> >
>  file://0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch \
> >             file://0001-pkix-Do-not-use-NULL-where-0-is-needed.patch \
> >             "
> > -
> > -SRC_URI[sha256sum] =
> "dab18bbfcf5e347934cda664df75ce9fd912a5772686c40d3c805e53c08d6e43"
> > +SRC_URI[sha256sum] =
> "f875e0e8ed3b5ce92d675be4a55aa25a8c1199789a4a01f69b5f2327e2048e9c"
> >
> >  UPSTREAM_CHECK_URI = "
> https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_Releases
> "
> >  UPSTREAM_CHECK_REGEX = "NSS_(?P<pver>.+)_release_notes"
> >
> >
>
> 
>

--00000000000076221e05adf18187
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;m seeing this postinst issue already without Khem&#3=
9;s nss changes, I guess it is caused by:<div>31552510b1 nss: fix postinst =
script for nativesdk build<br></div></div><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Fri, Aug 28, 2020 at 4:43 PM akuster=
 &lt;<a href=3D"mailto:akuster808@gmail.com">akuster808@gmail.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
On 8/27/20 7:04 PM, Khem Raj wrote:<br>
&gt; Forward port 0001-freebl-add-a-configure-option-to-disable-ARM-HW-cry=
p.patch<br>
&gt;<br>
&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" tar=
get=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; v2: Update armv8 hw crypto patch to work on arm32<br>
<br>
Did you add this to an image?<br>
<br>
I am seeing new error when nss is appended to an image.<br>
<br>
WARNING: security-build-image-1.0-r0 do_rootfs: nss.postinst returned 127,=
 marking as unpacked only, configuration required on target.<br>
2020-08-28 02:07:33 - ERROR=C2=A0 =C2=A0 - ERROR: security-build-image-1.0=
-r0 do_rootfs: Postinstall scriptlets of [&#39;nss&#39;] have failed. If th=
e intention is to defer them to first boot,<br>
2020-08-28 02:07:33 - ERROR=C2=A0 =C2=A0 - then please place them into pkg=
_postinst_ontarget_${PN} ().<br>
2020-08-28 02:07:33 - ERROR=C2=A0 =C2=A0 - Deferring to first boot via &#3=
9;exit 1&#39; is no longer supported.<br>
<br>
- Armin<br>
<br>
&gt;<br>
&gt;=C2=A0 ...figure-option-to-disable-ARM-HW-cryp.patch | 32 ++++++------=
-------<br>
&gt;=C2=A0 .../nss/{<a href=3D"http://nss_3.54.bb" rel=3D"noreferrer" targ=
et=3D"_blank">nss_3.54.bb</a> =3D&gt; <a href=3D"http://nss_3.56.bb" rel=3D=
"noreferrer" target=3D"_blank">nss_3.56.bb</a>}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 |=C2=A0 3 +-<br>
&gt;=C2=A0 2 files changed, 11 insertions(+), 24 deletions(-)<br>
&gt;=C2=A0 rename meta-oe/recipes-support/nss/{<a href=3D"http://nss_3.54.=
bb" rel=3D"noreferrer" target=3D"_blank">nss_3.54.bb</a> =3D&gt; <a href=3D=
"http://nss_3.56.bb" rel=3D"noreferrer" target=3D"_blank">nss_3.56.bb</a>} =
(99%)<br>
&gt;<br>
&gt; diff --git a/meta-oe/recipes-support/nss/nss/0001-freebl-add-a-config=
ure-option-to-disable-ARM-HW-cryp.patch b/meta-oe/recipes-support/nss/nss/0=
001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch<br>
&gt; index 1a87a0577f..f1f76bd1b7 100644<br>
&gt; --- a/meta-oe/recipes-support/nss/nss/0001-freebl-add-a-configure-opt=
ion-to-disable-ARM-HW-cryp.patch<br>
&gt; +++ b/meta-oe/recipes-support/nss/nss/0001-freebl-add-a-configure-opt=
ion-to-disable-ARM-HW-cryp.patch<br>
&gt; @@ -14,21 +14,18 @@ Signed-off-by: Alexander Kanavin &lt;<a href=3D"m=
ailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&=
gt;<br>
&gt;=C2=A0 =C2=A0nss/lib/freebl/gcm.c=C2=A0 =C2=A0 | 2 ++<br>
&gt;=C2=A0 =C2=A02 files changed, 6 insertions(+)<br>
&gt;=C2=A0 <br>
&gt; -diff --git a/nss/lib/freebl/Makefile b/nss/lib/freebl/Makefile<br>
&gt; -index f99f769..b0ec81b 100644<br>
&gt;=C2=A0 --- a/nss/lib/freebl/Makefile<br>
&gt;=C2=A0 +++ b/nss/lib/freebl/Makefile<br>
&gt; -@@ -125,6 +125,9 @@ else<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DEFINES +=3D -DNSS_X86<br>
&gt; +@@ -126,6 +126,8 @@ else<br>
&gt;=C2=A0 =C2=A0endif<br>
&gt;=C2=A0 =C2=A0endif<br>
&gt; -+<br>
&gt; + ifdef NS_USE_GCC<br>
&gt;=C2=A0 +ifdef NSS_USE_ARM_HW_CRYPTO<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 DEFINES +=3D -DNSS_USE_ARM_HW_CRYPTO<br>
&gt;=C2=A0 =C2=A0ifeq ($(CPU_ARCH),aarch64)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0DEFINES +=3D -DUSE_HW_AES -DUSE_HW_SHA2<br>
&gt; -=C2=A0 =C2=A0 =C2=A0EXTRA_SRCS +=3D aes-armv8.c gcm-aarch64.c sha256=
-armv8.c<br>
&gt; -@@ -148,6 +151,7 @@ endif<br>
&gt; +=C2=A0 =C2=A0 =C2=A0DEFINES +=3D -DUSE_HW_AES -DUSE_HW_SHA1 -DUSE_HW=
_SHA2<br>
&gt; +=C2=A0 =C2=A0 =C2=A0EXTRA_SRCS +=3D aes-armv8.c gcm-aarch64.c sha1-a=
rmv8.c sha256-armv8.c<br>
&gt; +@@ -150,6 +152,7 @@ endif<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0endif<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0endif<br>
&gt;=C2=A0 =C2=A0endif<br>
&gt; @@ -36,23 +33,14 @@ index f99f769..b0ec81b 100644<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0ifeq ($(OS_TARGET),OSF1)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0DEFINES +=3D -DMP_ASSEMBLY_MULTIPLY -DMP_NO=
_MP_WORD<br>
&gt; -diff --git a/nss/lib/freebl/gcm.c b/nss/lib/freebl/gcm.c<br>
&gt; -index c2cc18d..b77f573 100644<br>
&gt;=C2=A0 --- a/nss/lib/freebl/gcm.c<br>
&gt;=C2=A0 +++ b/nss/lib/freebl/gcm.c<br>
&gt; -@@ -18,6 +18,7 @@<br>
&gt; +@@ -20,7 +20,7 @@<br>
&gt;=C2=A0 =C2=A0<br>
&gt; - #include &lt;limits.h&gt;<br>
&gt; - <br>
&gt; -+#ifdef NSS_USE_ARM_HW_CRYPTO<br>
&gt;=C2=A0 =C2=A0/* old gcc doesn&#39;t support some poly64x2_t intrinsic =
*/<br>
&gt;=C2=A0 =C2=A0#if defined(__aarch64__) &amp;&amp; defined(IS_LITTLE_END=
IAN) &amp;&amp; \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0(defined(__clang__) || defined(__GNUC__) &amp;&a=
mp; __GNUC__ &gt; 6)<br>
&gt; -@@ -27,6 +28,7 @@<br>
&gt; - /* We don&#39;t test on big endian platform, so disable this on big=
 endian. */<br>
&gt; +-=C2=A0 =C2=A0 (defined(__clang__) || defined(__GNUC__) &amp;&amp; _=
_GNUC__ &gt; 6)<br>
&gt; ++=C2=A0 =C2=A0 (defined(__clang__) &amp;&amp; defined(NSS_USE_ARM_HW=
_CRYPTO) || defined(__GNUC__) &amp;&amp; __GNUC__ &gt; 6)<br>
&gt;=C2=A0 =C2=A0#define USE_ARM_GCM<br>
&gt; - #endif<br>
&gt; -+#endif<br>
&gt; - <br>
&gt; - /* Forward declarations */<br>
&gt; - SECStatus gcm_HashInit_hw(gcmHashContext *ghash);<br>
&gt; + #elif defined(__arm__) &amp;&amp; defined(IS_LITTLE_ENDIAN) &amp;&a=
mp; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0!defined(NSS_DISABLE_ARM32_NEON)<br>
&gt; diff --git a/meta-oe/recipes-support/nss/<a href=3D"http://nss_3.54.b=
b" rel=3D"noreferrer" target=3D"_blank">nss_3.54.bb</a> b/meta-oe/recipes-s=
upport/nss/<a href=3D"http://nss_3.56.bb" rel=3D"noreferrer" target=3D"_bla=
nk">nss_3.56.bb</a><br>
&gt; similarity index 99%<br>
&gt; rename from meta-oe/recipes-support/nss/<a href=3D"http://nss_3.54.bb=
" rel=3D"noreferrer" target=3D"_blank">nss_3.54.bb</a><br>
&gt; rename to meta-oe/recipes-support/nss/<a href=3D"http://nss_3.56.bb" =
rel=3D"noreferrer" target=3D"_blank">nss_3.56.bb</a><br>
&gt; index 1cc94735bb..4aa5d29ec2 100644<br>
&gt; --- a/meta-oe/recipes-support/nss/<a href=3D"http://nss_3.54.bb" rel=
=3D"noreferrer" target=3D"_blank">nss_3.54.bb</a><br>
&gt; +++ b/meta-oe/recipes-support/nss/<a href=3D"http://nss_3.56.bb" rel=
=3D"noreferrer" target=3D"_blank">nss_3.56.bb</a><br>
&gt; @@ -34,8 +34,7 @@ SRC_URI =3D &quot;<a href=3D"http://ftp.mozilla.org=
/pub/mozilla.org/security/nss/releases/$%7BVERSIO" rel=3D"noreferrer" targe=
t=3D"_blank">http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/$=
{VERSIO</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-freebl-add=
-a-configure-option-to-disable-ARM-HW-cryp.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-pkix-Do-no=
t-use-NULL-where-0-is-needed.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt; -<br>
&gt; -SRC_URI[sha256sum] =3D &quot;dab18bbfcf5e347934cda664df75ce9fd912a57=
72686c40d3c805e53c08d6e43&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;f875e0e8ed3b5ce92d675be4a55aa25a8c11997=
89a4a01f69b5f2327e2048e9c&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://developer.mozil=
la.org/en-US/docs/Mozilla/Projects/NSS/NSS_Releases" rel=3D"noreferrer" tar=
get=3D"_blank">https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NS=
S/NSS_Releases</a>&quot;<br>
&gt;=C2=A0 UPSTREAM_CHECK_REGEX =3D &quot;NSS_(?P&lt;pver&gt;.+)_release_n=
otes&quot;<br>
&gt;<br>
&gt; <br>
<br>
<br>
</blockquote></div>

--00000000000076221e05adf18187--
