Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5558CCCFA0D
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 15:26:47 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12200.1762356403083338574
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Nov 2025 07:26:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LlnBAwt+;
 spf=pass (domain: gmail.com, ip: 209.85.128.170, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-7869deffb47so17323597b3.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 05 Nov 2025 07:26:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762356402; x=1762961202; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=v6kN4K0lwMfS5EAge5Irn/r3LWRtgW+erKX2YYN6ZyI=;
        b=LlnBAwt+FalGFCGoMDenJL1goKzauMaoEtPCiv+qTdxWw5U89rQR9GvN6loTNX6d4U
         MBQ/7u72LApKLiNoIzIBAE5VtWe+niq7Tv+gHekaNec3/Z4aYmYbOMeFtsJD3I87yLvf
         CBO18+gDixik+G6ie/IsIeH2vHdS+4ZOKYUiCsiKcbMz+ioIQiQ84A5qtr7PJFQ+0Ea3
         77VLNDYZ31mNFYw8Z4Z4j4LQz+14F3vlmb1XRKJfh5ODz+W6tmKGX6D/rDMCj/ygjcoy
         EziFUI2S0tcKMqsE3m70c23lyrImaIH7mBulfw/Uk+v9agZ15umckqrxaQ/0mW23+Ef/
         I1Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762356402; x=1762961202;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v6kN4K0lwMfS5EAge5Irn/r3LWRtgW+erKX2YYN6ZyI=;
        b=Xf7g0rv275wKmXl/Yc8wDawAxNGFbGUmBJc4PatbxpfhwlUoKLujH3x2N+aJ/ic6fQ
         Puy+FqHNeNjhj0n6S2N8Br4YT+aEVJI+x6XnNdfI86VPIt0+JThPaHIlqzPtAnUa0aza
         rqMeQoGkl0fh1QfnkjOj/wgNlN/foeKucWEukL3F6kb1gOak5huLvQ/litPEV7H8V0qP
         uAbvozKqR8GeljYmhIEhjPaQWSoHGgupZI5aOX1BmV1H/GxDHoYYtjKvl4X05yEeUSIC
         b7AopUs/rANbvU1eJPpQTklHcOOozXp/Rcp/wPdKe9m2xvB+wCPoHuEKtHHEwgNH8wUa
         4A8g==
X-Forwarded-Encrypted: i=1; AJvYcCU4YArvKBCAaropgscZ6/yJWXZQC0HCProAIF1lDTOPcN831n1L5ewo05ECYoKyj0rvMWP+uSIC83S2HxRYTR9aYWk=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yzys3Bb943wqmEp32/4AJrComQzTJhIfSQIXILNwwzkYvViewCi
	UUckGbWWaZciONXLebqWvrIpXusE3/I/grbT7hHXGh7EM1TWHqGkdc+g5ZmwDjgf3C9TiSvJyAU
	KWZjwF6jJPpbuZdNgH2NB17VXza0heoI=
X-Gm-Gg: ASbGncuYGNWh4xle2TvQyoGMsHsqG3JEOvm9ecFwjl3XDcCxkL456H5tssbZaH0tUGG
	oM3DDLkdzKLzRNq0R3wO3R9nqyuhsiiou7hVThdQGgwPLDDBy90m3xLG/8e77LXQheLsThfAaDS
	PLmvD1nlvMg89fN/QB4jDGlspwT8HzAa53CssA/D7mIMrBj/sDc1d5svIwIvNF8rvvtERvZUqHf
	GSnZJnZVfsQylhCj2dvyCZOFUUCCkN6fdHzgwY7bjm61n9t0fV+dJe6jAHXGTsv7FQ/TPDbhVDd
	bX+rR17vz3TpspSLZElZz/PljA0iWpL6RN8Yjip3zLw7Vg==
X-Google-Smtp-Source: AGHT+IE1iDL6d0o3mnDcI+pB9FT2K5S10u9JaAlZfFSFDl2kp8s73Y1bTUnQnNhmmrHA3HCZpB3FEIVeGJFx80esLaU=
X-Received: by 2002:a05:690c:fd6:b0:786:a3fa:cb92 with SMTP id
 00721157ae682-786a40fc6camr31019387b3.9.1762356402023; Wed, 05 Nov 2025
 07:26:42 -0800 (PST)
MIME-Version: 1.0
References: <20251103051945.1615774-1-ashishkumar.mishra@bmwtechworks.in> <2636ab70-4d47-49ce-a35d-60556a154f9c@gmail.com>
In-Reply-To: <2636ab70-4d47-49ce-a35d-60556a154f9c@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 5 Nov 2025 07:26:15 -0800
X-Gm-Features: AWmQ_blPCBwE1WNJbGQFcAG5AXzxGd0mnTktTIsmqigHfwFPrA4w9ICajRchym4
Message-ID: <CAMKF1soMk==acguwu05qDLWLXq_MwEHaHDfYj7BVnKFvr-99OQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][master][PATCH] imagemagick: adds ptest for
 imagemagick recipe
To: skandigraun@gmail.com
Cc: ashishkumar.mishra@bmwtechworks.in, 
	openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000004f71580642da93c6"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Nov 2025 15:26:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121327

--0000000000004f71580642da93c6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 5, 2025 at 2:33=E2=80=AFAM Gyorgy Sarvari via lists.openembedde=
d.org
<skandigraun=3Dgmail.com@lists.openembedded.org> wrote:

> Khem,
>
> Did this patch fell through the cracks accidentally, or do you think it
> needs some corrections first?
>
>
Thanks for bumping this up, I was dealing with another patch doing the
upgrade for this recipe and wanted to serialize them
but did not reply back. Please rebase it on the latest master/master-next
and I will queue it up.


> On 11/3/25 06:19, AshishKumar Mishra via lists.openembedded.org wrote:
> > The logic used is :
> > - We check if the required tools are present or not
> > - We used magick to create an raw RGB file
> > - The created RGB is then converted to PNG using convert
> > - We re-gerenate RGB from PNG and compare the original and re-generated
> RGB
> > - Enabled the ptest in ptest-packagelists-meta-oe.inc as
> >   suggested by Gyorgy Sarvari and incorporated logging suggestion
> > - This was done as standard imagemagick test like drawtest requires
> manual
> >   internetion to verify the file.
> > ---
> >  .../include/ptest-packagelists-meta-oe.inc    |   1 +
> >  .../imagemagick/imagemagick-ptest.sh          | 132 ++++++++++++++++++
> >  .../imagemagick/imagemagick/run-ptest         |  43 ++++++
> >  .../imagemagick/imagemagick_7.1.2-5.bb        |  13 +-
> >  4 files changed, 187 insertions(+), 2 deletions(-)
> >  create mode 100755
> meta-oe/recipes-support/imagemagick/imagemagick/imagemagick-ptest.sh
> >  create mode 100644
> meta-oe/recipes-support/imagemagick/imagemagick/run-ptest
> >
> > diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
> b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
> > index 825747d522..bd6db35c5b 100644
> > --- a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
> > +++ b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
> > @@ -16,6 +16,7 @@ PTESTS_FAST_META_OE =3D "\
> >      function2 \
> >      fwupd \
> >      gcab \
> > +    imagemagick \
> >      jemalloc \
> >      jq \
> >      leveldb \
> > diff --git
> a/meta-oe/recipes-support/imagemagick/imagemagick/imagemagick-ptest.sh
> b/meta-oe/recipes-support/imagemagick/imagemagick/imagemagick-ptest.sh
> > new file mode 100755
> > index 0000000000..08595837d6
> > --- /dev/null
> > +++
> b/meta-oe/recipes-support/imagemagick/imagemagick/imagemagick-ptest.sh
> > @@ -0,0 +1,132 @@
> > +#!/bin/sh
> > +#
> > +# ImageMagick ptest:
> > +# We ceate an BASERGB file for our usage using "magick"
> > +# We convert this RGB file to BASEPNG
> > +# Using BASEPNG we recreate RGB named REGENERATEDRGB
> > +#
> > +# BASERGB to BASEPNG to REGENERATEDRGB
> > +# - Then compare  BASERGB with REGENERATEDRGB
> > +#
> > +# 0) The convert command is deprecated in IMv7
> > +#    used "magick" instead of "convert"
> > +# 1) We are checking if the binaries are present in RFS or not
> > +# 2) We Created an RBG of size : WIDTH x HEIGHT pixels
> > +# 3) Return value is captured after every major actio to capture the
> status
> > +# 4) cmp -s is used to compare binary byte by byte data and
> > +#    capture only exit status
> > +# 5) Important parametsrs used are :
> > +#    -depth                     : How many bits for each colour pixel
> > +#    -alpha off              : Don't consider transparency
> > +#    -define png:color-type=3D2   : Make PNG work with truecolour RGB
> > +#    -strip                  : Remove all non-pixel metadata og PNG
> > +#                                 so file is reproducible
> > +#    -set gamma 1.0             : No PNG brightness correction
> > +#     gradient:red-blue         : Data moves liberly from RED to Blue
> vertically
> > +
> > +
> > +WIDTH=3D16
> > +HEIGHT=3D16
> > +BASERGB=3Dbase.rgb
> > +BASEPNG=3Dbase.png
> > +REGENERATEDRGB=3Droundtrip.rgb
> > +
> > +echo "[DEBUG] Starting ImageMagick Ptest with ${WIDTH}x${HEIGHT} pixel=
s
> "
> > +
> > +# Verify required binaries
> > +for bin in magick cmp wc rm; do
> > +    if [ -z "$(command -v "$bin" 2>/dev/null)" ]; then
> > +        echo "[ERROR] Required binary '$bin' not found $PATH"
> > +        exit 127
> > +    fi
> > +done
> > +
> > +
> > +# Generate raw RGB
> > +magick -size ${WIDTH}x${HEIGHT} gradient:red-blue \
> > +    -depth 8 -type TrueColor \
> > +    -alpha off -define png:color-type=3D2 \
> > +    -strip -set gamma 1.0 \
> > +    rgb:${BASERGB}
> > +
> > +returnvalue=3D$?
> > +if [ "$returnvalue" -ne 0 ]; then
> > +    echo "[FAIL] Failed to generate RGB pattern "
> > +    exit 1
> > +else
> > +    echo "[DEBUG] ${BASERGB} generated from gradient"
> > +fi
> > +
> > +
> > +# Convert raw RGB to PNG
> > +magick -depth 8 -size ${WIDTH}x${HEIGHT} rgb:${BASERGB} \
> > +    -type TrueColor -alpha off \
> > +    -define png:color-type=3D2 -strip -set gamma 1.0 \
> > +    ${BASEPNG}
> > +
> > +returnvalue=3D$?
> > +if [ $returnvalue -ne 0 ]; then
> > +    echo "[FAIL] Failed to convert RGB to PNG"
> > +    rm -f ${BASERGB}
> > +    exit 1
> > +else
> > +    echo "[DEBUG] ${BASEPNG} generated from ${BASERGB}"
> > +fi
> > +
> > +
> > +
> > +# Regenerate raw RGB from PNG
> > +magick ${BASEPNG} \
> > +    -size ${WIDTH}x${HEIGHT} -depth 8 -type TrueColor \
> > +    -alpha off -define png:color-type=3D2 \
> > +    -strip -set gamma 1.0 \
> > +    rgb:${REGENERATEDRGB}
> > +
> > +returnvalue=3D$?
> > +if [ $returnvalue -ne 0 ]; then
> > +    echo "[FAIL] Failed to regenerate RGB from PNG"
> > +    rm -f ${BASERGB} ${BASEPNG}
> > +    exit 1
> > +else
> > +    echo "[DEBUG] ${REGENERATEDRGB} generated from ${BASEPNG}"
> > +fi
> > +
> > +
> > +
> > +# Compare original and recreated RGB
> > +if cmp -s ${BASERGB} ${REGENERATEDRGB}; then
> > +    echo "[PASS] RGB data identical after PNG round-trip"
> > +    RESULT=3D0
> > +else
> > +    echo "[FAIL] RGB mismatch detected, printing their size "
> > +    echo "[INFO] Base RGB size: $(wc -c < ${BASERGB}) bytes"
> > +    echo "[INFO] Round-trip RGB size: $(wc -c < ${REGENERATEDRGB})
> bytes"
> > +    RESULT=3D1
> > +fi
> > +
> > +
> > +
> > +# Checking the identify tool from imagemagick to get the PNG metadata
> > +# True is added in end to ensure that test script doesnt fail even if
> > +# identify fails for any reason
> > +echo "[DEBUG] PNG file info:"
> > +identify -verbose ${BASEPNG} | grep -E "Depth|Type|Colorspace" || true
> > +
> > +
> > +
> > +# Cleanup of files create by test code
> > +echo "[DEBUG] Cleaning up temporary files"
> > +rm -f ${BASERGB} ${BASEPNG} ${REGENERATEDRGB}
> > +returnvalue=3D$?
> > +echo "[DEBUG] Cleanup exit=3D$returnvalue"
> > +
> > +
> > +# Logging the final result
> > +if [ ${RESULT} -eq 0 ]; then
> > +    echo "[DEBUG]: imagemagick-ptest.sh sucessfull "
> > +else
> > +    echo "[DEBUG]: imagemagick-ptest.sh failed "
> > +fi
> > +
> > +
> > +exit ${RESULT}
> > diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/run-ptest
> b/meta-oe/recipes-support/imagemagick/imagemagick/run-ptest
> > new file mode 100644
> > index 0000000000..75251a803f
> > --- /dev/null
> > +++ b/meta-oe/recipes-support/imagemagick/imagemagick/run-ptest
> > @@ -0,0 +1,43 @@
> > +#!/bin/sh
> > +#
> > +# run-ptest =E2=80=94 ImageMagick ptest harness
> > +# POSIX-safe and BusyBox compatible
> > +
> > +PTDIR=3D$(dirname "$0")
> > +TESTDIR=3D"$PTDIR"
> > +PASSCOUNT=3D0
> > +FAILCOUNT=3D0
> > +TOTAL=3D0
> > +
> > +echo "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D"
> > +echo "ImageMagick ptest: Runtime Validation"
> > +echo "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D"
> > +
> > +for t in "$TESTDIR"/*.sh; do
> > +    [ -x "$t" ] || chmod +x "$t"
> > +    TOTAL=3D$((TOTAL + 1))
> > +    echo
> > +    echo "[DEBUG] Launching test script $t"
> > +
> > +    if sh "$t" 2>&1; then
> > +        echo "PASS: $(basename "$t")"
> > +        PASSCOUNT=3D$((PASSCOUNT + 1))
> > +    else
> > +        rc=3D$?
> > +        if [ "$rc" -eq 77 ]; then
> > +            echo "SKIP: $(basename "$t")"
> > +        else
> > +            echo "FAIL: $(basename "$t")"
> > +            FAILCOUNT=3D$((FAILCOUNT + 1))
> > +        fi
> > +    fi
> > +
> > +done
> > +
> > +echo
> > +echo "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D"
> > +echo "[SUMMARY] Total: $TOTAL | PASS: $PASSCOUNT | FAIL: $FAILCOUNT"
> > +echo "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D"
> > +echo
> > +[ "$FAILCOUNT" -eq 0 ]
> > +
> > diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-5.bb
> b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-5.bb
> > index 8ba14261ae..9da9d7df58 100644
> > --- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-5.bb
> > +++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-5.bb
> > @@ -12,11 +12,14 @@ DEPENDS =3D "lcms bzip2 jpeg libpng tiff zlib fftw
> freetype libtool"
> >  BASE_PV =3D "${@d.getVar('PV').split('-')[0]}"
> >  UPSTREAM_CHECK_GITTAGREGEX =3D "(?P<pver>([0-9][\.|_|-]?)+)"
> >
> > -SRC_URI =3D "git://
> github.com/ImageMagick/ImageMagick.git;branch=3Dmain;protocol=3Dhttps;tag=
=3D${PV}
> <http://github.com/ImageMagick/ImageMagick.git;branch=3Dmain;protocol=3Dh=
ttps;tag=3D$%7BPV%7D>
> "
> > +SRC_URI =3D "git://
> github.com/ImageMagick/ImageMagick.git;branch=3Dmain;protocol=3Dhttps;tag=
=3D${PV}
> <http://github.com/ImageMagick/ImageMagick.git;branch=3Dmain;protocol=3Dh=
ttps;tag=3D$%7BPV%7D>
> \
> > +           file://run-ptest \
> > +           file://imagemagick-ptest.sh \
> > +"
> >  SRCREV =3D "4a620c2a89a7481e83cb4a0ff32db0ccbb3afcd2"
> >
> >
> > -inherit autotools pkgconfig update-alternatives
> > +inherit autotools pkgconfig update-alternatives ptest
> >  export ac_cv_sys_file_offset_bits =3D "64"
> >
> >  EXTRA_OECONF =3D "--program-prefix=3D --program-suffix=3D.im7 --withou=
t-perl
> --enable-largefile"
> > @@ -55,6 +58,12 @@ do_install:append:class-target() {
> >      fi
> >  }
> >
> > +do_install_ptest() {
> > +    install -d ${D}${PTEST_PATH}
> > +    install -m 0755 ${UNPACKDIR}/run-ptest ${D}${PTEST_PATH}/
> > +    install -m 0755 ${UNPACKDIR}/imagemagick-ptest.sh ${D}${PTEST_PATH=
}/
> > +}
> > +
> >  FILES:${PN} +=3D "${libdir}/ImageMagick-${BASE_PV}/config-Q16* \
> >                  ${datadir}/ImageMagick-7"
> >
> >
> >
> >
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#121325):
> https://lists.openembedded.org/g/openembedded-devel/message/121325
> Mute This Topic: https://lists.openembedded.org/mt/116093375/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000004f71580642da93c6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Nov 5, =
2025 at 2:33=E2=80=AFAM Gyorgy Sarvari via <a href=3D"http://lists.openembe=
dded.org">lists.openembedded.org</a> &lt;skandigraun=3D<a href=3D"mailto:gm=
ail.com@lists.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Khem,<br>
<br>
Did this patch fell through the cracks accidentally, or do you think it<br>
needs some corrections first?<br>
<br></blockquote><div><br></div><div>Thanks for bumping this up, I was deal=
ing with another patch doing the upgrade for this recipe and wanted to seri=
alize them</div><div>but did not reply back. Please rebase it on the latest=
 master/master-next and I will queue it up.=C2=A0</div><div>=C2=A0</div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">
On 11/3/25 06:19, AshishKumar Mishra via <a href=3D"http://lists.openembedd=
ed.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> wro=
te:<br>
&gt; The logic used is :<br>
&gt; - We check if the required tools are present or not<br>
&gt; - We used magick to create an raw RGB file<br>
&gt; - The created RGB is then converted to PNG using convert<br>
&gt; - We re-gerenate RGB from PNG and compare the original and re-generate=
d RGB<br>
&gt; - Enabled the ptest in ptest-packagelists-meta-oe.inc as<br>
&gt;=C2=A0 =C2=A0suggested by Gyorgy Sarvari and incorporated logging sugge=
stion<br>
&gt; - This was done as standard imagemagick test like drawtest requires ma=
nual<br>
&gt;=C2=A0 =C2=A0internetion to verify the file.<br>
&gt; ---<br>
&gt;=C2=A0 .../include/ptest-packagelists-meta-oe.inc=C2=A0 =C2=A0 |=C2=A0 =
=C2=A01 +<br>
&gt;=C2=A0 .../imagemagick/imagemagick-ptest.sh=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 132 ++++++++++++++++++<br>
&gt;=C2=A0 .../imagemagick/imagemagick/run-ptest=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 43 ++++++<br>
&gt;=C2=A0 .../imagemagick/<a href=3D"http://imagemagick_7.1.2-5.bb" rel=3D=
"noreferrer" target=3D"_blank">imagemagick_7.1.2-5.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 13 +-<br>
&gt;=C2=A0 4 files changed, 187 insertions(+), 2 deletions(-)<br>
&gt;=C2=A0 create mode 100755 meta-oe/recipes-support/imagemagick/imagemagi=
ck/imagemagick-ptest.sh<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagi=
ck/run-ptest<br>
&gt;<br>
&gt; diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc b/met=
a-oe/conf/include/ptest-packagelists-meta-oe.inc<br>
&gt; index 825747d522..bd6db35c5b 100644<br>
&gt; --- a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc<br>
&gt; +++ b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc<br>
&gt; @@ -16,6 +16,7 @@ PTESTS_FAST_META_OE =3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 function2 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 fwupd \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 gcab \<br>
&gt; +=C2=A0 =C2=A0 imagemagick \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 jemalloc \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 jq \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 leveldb \<br>
&gt; diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/imagemagi=
ck-ptest.sh b/meta-oe/recipes-support/imagemagick/imagemagick/imagemagick-p=
test.sh<br>
&gt; new file mode 100755<br>
&gt; index 0000000000..08595837d6<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-oe/recipes-support/imagemagick/imagemagick/imagemagick-ptes=
t.sh<br>
&gt; @@ -0,0 +1,132 @@<br>
&gt; +#!/bin/sh<br>
&gt; +#<br>
&gt; +# ImageMagick ptest:<br>
&gt; +# We ceate an BASERGB file for our usage using &quot;magick&quot;<br>
&gt; +# We convert this RGB file to BASEPNG<br>
&gt; +# Using BASEPNG we recreate RGB named REGENERATEDRGB<br>
&gt; +#<br>
&gt; +# BASERGB to BASEPNG to REGENERATEDRGB<br>
&gt; +# - Then compare=C2=A0 BASERGB with REGENERATEDRGB<br>
&gt; +#<br>
&gt; +# 0) The convert command is deprecated in IMv7<br>
&gt; +#=C2=A0 =C2=A0 used &quot;magick&quot; instead of &quot;convert&quot;=
<br>
&gt; +# 1) We are checking if the binaries are present in RFS or not<br>
&gt; +# 2) We Created an RBG of size : WIDTH x HEIGHT pixels<br>
&gt; +# 3) Return value is captured after every major actio to capture the =
status<br>
&gt; +# 4) cmp -s is used to compare binary byte by byte data and<br>
&gt; +#=C2=A0 =C2=A0 capture only exit status<br>
&gt; +# 5) Important parametsrs used are :<br>
&gt; +#=C2=A0 =C2=A0 -depth=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0: How many bits for each colour pixel<br>
&gt; +#=C2=A0 =C2=A0 -alpha off=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 : Don&#39;t consider transparency<br>
&gt; +#=C2=A0 =C2=A0 -define png:color-type=3D2=C2=A0 =C2=A0: Make PNG work=
 with truecolour RGB<br>
&gt; +#=C2=A0 =C2=A0 -strip=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 : Remove all non-pixel metadata og PNG<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0so file is reproducible=
<br>
&gt; +#=C2=A0 =C2=A0 -set gamma 1.0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0: No PNG brightness correction<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0gradient:red-blue=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0: Data moves liberly from RED to Blue vertically<br>
&gt; +<br>
&gt; +<br>
&gt; +WIDTH=3D16<br>
&gt; +HEIGHT=3D16<br>
&gt; +BASERGB=3Dbase.rgb<br>
&gt; +BASEPNG=3Dbase.png<br>
&gt; +REGENERATEDRGB=3Droundtrip.rgb<br>
&gt; +<br>
&gt; +echo &quot;[DEBUG] Starting ImageMagick Ptest with ${WIDTH}x${HEIGHT}=
 pixels &quot;<br>
&gt; +<br>
&gt; +# Verify required binaries<br>
&gt; +for bin in magick cmp wc rm; do<br>
&gt; +=C2=A0 =C2=A0 if [ -z &quot;$(command -v &quot;$bin&quot; 2&gt;/dev/n=
ull)&quot; ]; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;[ERROR] Required binary &#39;$=
bin&#39; not found $PATH&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 exit 127<br>
&gt; +=C2=A0 =C2=A0 fi<br>
&gt; +done<br>
&gt; +<br>
&gt; +<br>
&gt; +# Generate raw RGB<br>
&gt; +magick -size ${WIDTH}x${HEIGHT} gradient:red-blue \<br>
&gt; +=C2=A0 =C2=A0 -depth 8 -type TrueColor \<br>
&gt; +=C2=A0 =C2=A0 -alpha off -define png:color-type=3D2 \<br>
&gt; +=C2=A0 =C2=A0 -strip -set gamma 1.0 \<br>
&gt; +=C2=A0 =C2=A0 rgb:${BASERGB}<br>
&gt; +<br>
&gt; +returnvalue=3D$?<br>
&gt; +if [ &quot;$returnvalue&quot; -ne 0 ]; then<br>
&gt; +=C2=A0 =C2=A0 echo &quot;[FAIL] Failed to generate RGB pattern &quot;=
<br>
&gt; +=C2=A0 =C2=A0 exit 1<br>
&gt; +else<br>
&gt; +=C2=A0 =C2=A0 echo &quot;[DEBUG] ${BASERGB} generated from gradient&q=
uot;<br>
&gt; +fi<br>
&gt; +<br>
&gt; +<br>
&gt; +# Convert raw RGB to PNG<br>
&gt; +magick -depth 8 -size ${WIDTH}x${HEIGHT} rgb:${BASERGB} \<br>
&gt; +=C2=A0 =C2=A0 -type TrueColor -alpha off \<br>
&gt; +=C2=A0 =C2=A0 -define png:color-type=3D2 -strip -set gamma 1.0 \<br>
&gt; +=C2=A0 =C2=A0 ${BASEPNG}<br>
&gt; +<br>
&gt; +returnvalue=3D$?<br>
&gt; +if [ $returnvalue -ne 0 ]; then<br>
&gt; +=C2=A0 =C2=A0 echo &quot;[FAIL] Failed to convert RGB to PNG&quot;<br=
>
&gt; +=C2=A0 =C2=A0 rm -f ${BASERGB}<br>
&gt; +=C2=A0 =C2=A0 exit 1<br>
&gt; +else<br>
&gt; +=C2=A0 =C2=A0 echo &quot;[DEBUG] ${BASEPNG} generated from ${BASERGB}=
&quot;<br>
&gt; +fi<br>
&gt; +<br>
&gt; +<br>
&gt; +<br>
&gt; +# Regenerate raw RGB from PNG<br>
&gt; +magick ${BASEPNG} \<br>
&gt; +=C2=A0 =C2=A0 -size ${WIDTH}x${HEIGHT} -depth 8 -type TrueColor \<br>
&gt; +=C2=A0 =C2=A0 -alpha off -define png:color-type=3D2 \<br>
&gt; +=C2=A0 =C2=A0 -strip -set gamma 1.0 \<br>
&gt; +=C2=A0 =C2=A0 rgb:${REGENERATEDRGB}<br>
&gt; +<br>
&gt; +returnvalue=3D$?<br>
&gt; +if [ $returnvalue -ne 0 ]; then<br>
&gt; +=C2=A0 =C2=A0 echo &quot;[FAIL] Failed to regenerate RGB from PNG&quo=
t;<br>
&gt; +=C2=A0 =C2=A0 rm -f ${BASERGB} ${BASEPNG}<br>
&gt; +=C2=A0 =C2=A0 exit 1<br>
&gt; +else<br>
&gt; +=C2=A0 =C2=A0 echo &quot;[DEBUG] ${REGENERATEDRGB} generated from ${B=
ASEPNG}&quot;<br>
&gt; +fi<br>
&gt; +<br>
&gt; +<br>
&gt; +<br>
&gt; +# Compare original and recreated RGB<br>
&gt; +if cmp -s ${BASERGB} ${REGENERATEDRGB}; then<br>
&gt; +=C2=A0 =C2=A0 echo &quot;[PASS] RGB data identical after PNG round-tr=
ip&quot;<br>
&gt; +=C2=A0 =C2=A0 RESULT=3D0<br>
&gt; +else<br>
&gt; +=C2=A0 =C2=A0 echo &quot;[FAIL] RGB mismatch detected, printing their=
 size &quot;<br>
&gt; +=C2=A0 =C2=A0 echo &quot;[INFO] Base RGB size: $(wc -c &lt; ${BASERGB=
}) bytes&quot;<br>
&gt; +=C2=A0 =C2=A0 echo &quot;[INFO] Round-trip RGB size: $(wc -c &lt; ${R=
EGENERATEDRGB}) bytes&quot;<br>
&gt; +=C2=A0 =C2=A0 RESULT=3D1<br>
&gt; +fi<br>
&gt; +<br>
&gt; +<br>
&gt; +<br>
&gt; +# Checking the identify tool from imagemagick to get the PNG metadata=
<br>
&gt; +# True is added in end to ensure that test script doesnt fail even if=
<br>
&gt; +# identify fails for any reason<br>
&gt; +echo &quot;[DEBUG] PNG file info:&quot;<br>
&gt; +identify -verbose ${BASEPNG} | grep -E &quot;Depth|Type|Colorspace&qu=
ot; || true<br>
&gt; +<br>
&gt; +<br>
&gt; +<br>
&gt; +# Cleanup of files create by test code<br>
&gt; +echo &quot;[DEBUG] Cleaning up temporary files&quot;<br>
&gt; +rm -f ${BASERGB} ${BASEPNG} ${REGENERATEDRGB}<br>
&gt; +returnvalue=3D$?<br>
&gt; +echo &quot;[DEBUG] Cleanup exit=3D$returnvalue&quot;<br>
&gt; +<br>
&gt; +<br>
&gt; +# Logging the final result<br>
&gt; +if [ ${RESULT} -eq 0 ]; then<br>
&gt; +=C2=A0 =C2=A0 echo &quot;[DEBUG]: imagemagick-ptest.sh sucessfull &qu=
ot;<br>
&gt; +else<br>
&gt; +=C2=A0 =C2=A0 echo &quot;[DEBUG]: imagemagick-ptest.sh failed &quot;<=
br>
&gt; +fi<br>
&gt; +<br>
&gt; +<br>
&gt; +exit ${RESULT}<br>
&gt; diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/run-ptest=
 b/meta-oe/recipes-support/imagemagick/imagemagick/run-ptest<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..75251a803f<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-oe/recipes-support/imagemagick/imagemagick/run-ptest<br>
&gt; @@ -0,0 +1,43 @@<br>
&gt; +#!/bin/sh<br>
&gt; +#<br>
&gt; +# run-ptest =E2=80=94 ImageMagick ptest harness<br>
&gt; +# POSIX-safe and BusyBox compatible<br>
&gt; +<br>
&gt; +PTDIR=3D$(dirname &quot;$0&quot;)<br>
&gt; +TESTDIR=3D&quot;$PTDIR&quot;<br>
&gt; +PASSCOUNT=3D0<br>
&gt; +FAILCOUNT=3D0<br>
&gt; +TOTAL=3D0<br>
&gt; +<br>
&gt; +echo &quot;=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D&quot;<br>
&gt; +echo &quot;ImageMagick ptest: Runtime Validation&quot;<br>
&gt; +echo &quot;=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D&quot;<br>
&gt; +<br>
&gt; +for t in &quot;$TESTDIR&quot;/*.sh; do<br>
&gt; +=C2=A0 =C2=A0 [ -x &quot;$t&quot; ] || chmod +x &quot;$t&quot;<br>
&gt; +=C2=A0 =C2=A0 TOTAL=3D$((TOTAL + 1))<br>
&gt; +=C2=A0 =C2=A0 echo<br>
&gt; +=C2=A0 =C2=A0 echo &quot;[DEBUG] Launching test script $t&quot;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if sh &quot;$t&quot; 2&gt;&amp;1; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;PASS: $(basename &quot;$t&quot=
;)&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 PASSCOUNT=3D$((PASSCOUNT + 1))<br>
&gt; +=C2=A0 =C2=A0 else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 rc=3D$?<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ &quot;$rc&quot; -eq 77 ]; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;SKIP: $(basename=
 &quot;$t&quot;)&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;FAIL: $(basename=
 &quot;$t&quot;)&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 FAILCOUNT=3D$((FAILCOUNT + =
1))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +=C2=A0 =C2=A0 fi<br>
&gt; +<br>
&gt; +done<br>
&gt; +<br>
&gt; +echo<br>
&gt; +echo &quot;=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D&quot;<br>
&gt; +echo &quot;[SUMMARY] Total: $TOTAL | PASS: $PASSCOUNT | FAIL: $FAILCO=
UNT&quot;<br>
&gt; +echo &quot;=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D&quot;<br>
&gt; +echo<br>
&gt; +[ &quot;$FAILCOUNT&quot; -eq 0 ]<br>
&gt; +<br>
&gt; diff --git a/meta-oe/recipes-support/imagemagick/<a href=3D"http://ima=
gemagick_7.1.2-5.bb" rel=3D"noreferrer" target=3D"_blank">imagemagick_7.1.2=
-5.bb</a> b/meta-oe/recipes-support/imagemagick/<a href=3D"http://imagemagi=
ck_7.1.2-5.bb" rel=3D"noreferrer" target=3D"_blank">imagemagick_7.1.2-5.bb<=
/a><br>
&gt; index 8ba14261ae..9da9d7df58 100644<br>
&gt; --- a/meta-oe/recipes-support/imagemagick/<a href=3D"http://imagemagic=
k_7.1.2-5.bb" rel=3D"noreferrer" target=3D"_blank">imagemagick_7.1.2-5.bb</=
a><br>
&gt; +++ b/meta-oe/recipes-support/imagemagick/<a href=3D"http://imagemagic=
k_7.1.2-5.bb" rel=3D"noreferrer" target=3D"_blank">imagemagick_7.1.2-5.bb</=
a><br>
&gt; @@ -12,11 +12,14 @@ DEPENDS =3D &quot;lcms bzip2 jpeg libpng tiff zlib=
 fftw freetype libtool&quot;<br>
&gt;=C2=A0 BASE_PV =3D &quot;${@d.getVar(&#39;PV&#39;).split(&#39;-&#39;)[0=
]}&quot;<br>
&gt;=C2=A0 UPSTREAM_CHECK_GITTAGREGEX =3D &quot;(?P&lt;pver&gt;([0-9][\.|_|=
-]?)+)&quot;<br>
&gt;=C2=A0 <br>
&gt; -SRC_URI =3D &quot;git://<a href=3D"http://github.com/ImageMagick/Imag=
eMagick.git;branch=3Dmain;protocol=3Dhttps;tag=3D$%7BPV%7D" rel=3D"noreferr=
er" target=3D"_blank">github.com/ImageMagick/ImageMagick.git;branch=3Dmain;=
protocol=3Dhttps;tag=3D${PV}</a>&quot;<br>
&gt; +SRC_URI =3D &quot;git://<a href=3D"http://github.com/ImageMagick/Imag=
eMagick.git;branch=3Dmain;protocol=3Dhttps;tag=3D$%7BPV%7D" rel=3D"noreferr=
er" target=3D"_blank">github.com/ImageMagick/ImageMagick.git;branch=3Dmain;=
protocol=3Dhttps;tag=3D${PV}</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://run-ptest \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://imagemagick-ptest.sh =
\<br>
&gt; +&quot;<br>
&gt;=C2=A0 SRCREV =3D &quot;4a620c2a89a7481e83cb4a0ff32db0ccbb3afcd2&quot;<=
br>
&gt;=C2=A0 <br>
&gt;=C2=A0 <br>
&gt; -inherit autotools pkgconfig update-alternatives<br>
&gt; +inherit autotools pkgconfig update-alternatives ptest<br>
&gt;=C2=A0 export ac_cv_sys_file_offset_bits =3D &quot;64&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 EXTRA_OECONF =3D &quot;--program-prefix=3D --program-suffix=3D.i=
m7 --without-perl --enable-largefile&quot;<br>
&gt; @@ -55,6 +58,12 @@ do_install:append:class-target() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 fi<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; +do_install_ptest() {<br>
&gt; +=C2=A0 =C2=A0 install -d ${D}${PTEST_PATH}<br>
&gt; +=C2=A0 =C2=A0 install -m 0755 ${UNPACKDIR}/run-ptest ${D}${PTEST_PATH=
}/<br>
&gt; +=C2=A0 =C2=A0 install -m 0755 ${UNPACKDIR}/imagemagick-ptest.sh ${D}$=
{PTEST_PATH}/<br>
&gt; +}<br>
&gt; +<br>
&gt;=C2=A0 FILES:${PN} +=3D &quot;${libdir}/ImageMagick-${BASE_PV}/config-Q=
16* \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${datadi=
r}/ImageMagick-7&quot;<br>
&gt;=C2=A0 <br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#121325): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/121325" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/121325</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/116093375/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/116093375/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000004f71580642da93c6--

