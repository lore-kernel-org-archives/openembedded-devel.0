Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9034EB64DE
	for <webhook@archiver.kernel.org>; Sun,  8 Sep 2024 07:35:53 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web11.25663.1725780947470857723
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Sep 2024 00:35:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=R8sc6AmC;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2f762de00e5so4312711fa.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 08 Sep 2024 00:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725780945; x=1726385745; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ANqz8GPLz9PTzV86iDKKGfg7MK8+/4fRN2sfdvg5I0Q=;
        b=R8sc6AmCsJqRALa2g9elj2aJ0PCh9md324ydMFcfLORNM+adAarHvhs8qcjmZ7zwIj
         /rcvV4DJTomlAcTL7EeqwaeptoK1sNgnwY5RQbZw2vRDgH1zvxAhENeAHu9/CP9sAYen
         KpxzFdnvHnoNCYTXCo9d8uKetTLIro4N81yXuFdxBY1Nkj1w22VwqWgUkZn4JhDEr49u
         b6zSNl1vbdGC9duDbyRYyurrWP5neUHKgbpSGK4KyHbprpT19Af9fQgqytCrnx1/CQgS
         Tk/t+uZRNDkmeMgEj+NAh+RTbRDphvl2NO3Mzmmea7SZZKsdrwp3/NxoTo6jpAd7FAFj
         N7tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725780945; x=1726385745;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ANqz8GPLz9PTzV86iDKKGfg7MK8+/4fRN2sfdvg5I0Q=;
        b=aJMBG3rFF708W96oHRZFsHDTDrGML20C4IKbsz5ySjOdIPqpo3Gj+OKIy1Aa077IIF
         eO2QJSjf1Xc6vD3tMeKVDzZV2nbTdiGqmoZnL4tiM4KGuICXtr7ZyhCDxgQH/kuWJOT2
         hwRAtEYom+AHbUyI/vOan3/x7UGLnsT3TN7UP0tWlVLWQd4BiWGK6N34brF8vdk2m/UM
         3ezmGIO6UynLscBnQfBFynjuD53kfFU/NjwVra2jt5iIVrNlL9G3nAnihEm+F7ifo766
         Uwk2u7gAQ6gDFGBkDioVLzT3eHw0us2RlFG3pgYYfg0Cu8AlA86rUmvr4XapuUAQafWn
         Mcxg==
X-Gm-Message-State: AOJu0YyittfNBnGz0UC1xDjtdkx4nTsrB4q4yidhgudNFvDwUSCQLZ0q
	iah22JWdD/KRC1IGL561nGNQ/bG+Pd5KW1QDf8hUy7DnYEKrWMyEvuf3jDvi50sXhBhu4crbcos
	eChS5TFeL97+tqcuekpv5WuhWFV8=
X-Google-Smtp-Source: AGHT+IEwzTlVL6tMw+zNtL6OvPo6MWA/oe4iYb+MHPtaeuz4949bdrYH6Q6vZGhZGHv7y4i6NyYkCdgOM8bqd0CkCuM=
X-Received: by 2002:a05:6512:2388:b0:536:55ef:69e8 with SMTP id
 2adb3069b0e04-5365856ca37mr4783911e87.0.1725780944387; Sun, 08 Sep 2024
 00:35:44 -0700 (PDT)
MIME-Version: 1.0
References: <20240902162710.1284914-1-martin.jansa@gmail.com> <17F17A4E8C380788.17352@lists.openembedded.org>
In-Reply-To: <17F17A4E8C380788.17352@lists.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 8 Sep 2024 09:35:32 +0200
Message-ID: <CA+chaQcOfZrNWvVF5q+1otfTfif8k0Tie_2V-0wcsshBNBfB8A@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] python3-matplotlib: add native RSS to
 -fmacro-prefix-map to fix buildpaths QA
To: martin.jansa@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Sep 2024 07:35:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112124

Khem: please drop this one from master-next

It was added in the default DEBUG_PREFIX_MAP in oe-core now.

On Mon, Sep 2, 2024 at 6:30=E2=80=AFPM Martin Jansa via lists.openembedded.=
org
<martin.jansa=3Dgmail.com@lists.openembedded.org> wrote:
>
> This is related RFC patch just sent to oe-core ML:
> https://lists.openembedded.org/g/openembedded-core/message/204110
>
> On Mon, Sep 2, 2024 at 6:27=E2=80=AFPM Martin Jansa <martin.jansa@gmail.c=
om> wrote:
> >
> > * fixes:
> >   ERROR: lib32-python3-matplotlib-3.7.2-r0 do_package_qa: QA Issue: Fil=
e /usr/lib/python3.12/site-packages/matplotlib/_tri.cpython-312-i386-linux-=
gnu.so in package lib32-python3-matplotlib contains reference to TMPDIR [bu=
ildpaths]
> >
> > * there is native RSS already but only in -fdebug-prefix-map
> >
> > * it fails only with multilib where target RSS isn't substring of nativ=
e RSS
> >
> > * comparing _tri.cpython-312-*-linux-gnu.so cmdline for regular x86-64 =
and lib32-python3-matplotlib i586 build shows:
> >
> > --fmacro-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linu=
x/python3-matplotlib/3.7.2/matplotlib-3.7.2=3D/usr/src/debug/python3-matplo=
tlib/3.7.2 \
> > --fdebug-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linu=
x/python3-matplotlib/3.7.2/matplotlib-3.7.2=3D/usr/src/debug/python3-matplo=
tlib/3.7.2 \
> > --fmacro-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linu=
x/python3-matplotlib/3.7.2/matplotlib-3.7.2=3D/usr/src/debug/python3-matplo=
tlib/3.7.2 \
> > --fdebug-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linu=
x/python3-matplotlib/3.7.2/matplotlib-3.7.2=3D/usr/src/debug/python3-matplo=
tlib/3.7.2 \
> > --fdebug-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linu=
x/python3-matplotlib/3.7.2/recipe-sysroot=3D \
> > --fmacro-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linu=
x/python3-matplotlib/3.7.2/recipe-sysroot=3D \
> > --fdebug-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linu=
x/python3-matplotlib/3.7.2/recipe-sysroot-native=3D \
> > +-fmacro-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/i586-oemllib32-l=
inux/lib32-python3-matplotlib/3.7.2/matplotlib-3.7.2=3D/usr/src/debug/lib32=
-python3-matplotlib/3.7.2 \
> > +-fdebug-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/i586-oemllib32-l=
inux/lib32-python3-matplotlib/3.7.2/matplotlib-3.7.2=3D/usr/src/debug/lib32=
-python3-matplotlib/3.7.2 \
> > +-fmacro-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/i586-oemllib32-l=
inux/lib32-python3-matplotlib/3.7.2/matplotlib-3.7.2=3D/usr/src/debug/lib32=
-python3-matplotlib/3.7.2 \
> > +-fdebug-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/i586-oemllib32-l=
inux/lib32-python3-matplotlib/3.7.2/matplotlib-3.7.2=3D/usr/src/debug/lib32=
-python3-matplotlib/3.7.2 \
> > +-fdebug-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/i586-oemllib32-l=
inux/lib32-python3-matplotlib/3.7.2/lib32-recipe-sysroot=3D \
> > +-fmacro-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/i586-oemllib32-l=
inux/lib32-python3-matplotlib/3.7.2/lib32-recipe-sysroot=3D \
> > +-fdebug-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/i586-oemllib32-l=
inux/lib32-python3-matplotlib/3.7.2/recipe-sysroot-native=3D \
> >
> > * the buildpaths are header files from native pybind11 (Pybind11Extensi=
on)
> >   https://github.com/pybind/pybind11/blob/master/pybind11/setup_helpers=
.py#L89
> >
> > $ strings package/usr/lib/python3.12/site-packages/matplotlib/_tri.cpyt=
hon-312-i386-linux-gnu.so | grep oemllib32
> > /OE/build/oe-core/tmp-glibc/work/i586-oemllib32-linux/lib32-python3-mat=
plotlib/3.7.2/recipe-sysroot-native/usr/lib/python3.12/site-packages/pybind=
11/include/pybind11/detail/../detail/common.h
> > /OE/build/oe-core/tmp-glibc/work/i586-oemllib32-linux/lib32-python3-mat=
plotlib/3.7.2/recipe-sysroot-native/usr/lib/python3.12/site-packages/pybind=
11/include/pybind11/detail/../detail/../pytypes.h
> > /OE/build/oe-core/tmp-glibc/work/i586-oemllib32-linux/lib32-python3-mat=
plotlib/3.7.2/recipe-sysroot-native/usr/lib/python3.12/site-packages/pybind=
11/include/pybind11/detail/class.h
> > /OE/build/oe-core/tmp-glibc/work/i586-oemllib32-linux/lib32-python3-mat=
plotlib/3.7.2/recipe-sysroot-native/usr/lib/python3.12/site-packages/pybind=
11/include/pybind11/detail/../detail/type_caster_base.h
> > /OE/build/oe-core/tmp-glibc/work/i586-oemllib32-linux/lib32-python3-mat=
plotlib/3.7.2/recipe-sysroot-native/usr/lib/python3.12/site-packages/pybind=
11/include/pybind11/pybind11.h
> > /OE/build/oe-core/tmp-glibc/work/i586-oemllib32-linux/lib32-python3-mat=
plotlib/3.7.2/recipe-sysroot-native/usr/lib/python3.12/site-packages/pybind=
11/include/pybind11/gil.h
> > /OE/build/oe-core/tmp-glibc/work/i586-oemllib32-linux/lib32-python3-mat=
plotlib/3.7.2/recipe-sysroot-native/usr/lib/python3.12/site-packages/pybind=
11/include/pybind11/gil_safe_call_once.h
> >
> > * I'm not familiar enough with pybind11 to find a way how to configure =
it to
> >   use correct include dir, the issue already exists in regular x86-64 d=
ir, but
> >   not caught by buildpaths, because, the:
> >   -fmacro-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/core2-64-oe-lin=
ux/python3-matplotlib/3.7.2/recipe-sysroot=3D
> >   is enought to mangle the hardcoded paths (leaving only '-native') lik=
e this:
> >
> > strings ../3.7.2-x86-64/package/usr/lib64/python3.12/site-packages/matp=
lotlib/_tri.cpython-312-x86_64-linux-gnu.so | grep pybind11/include/pybind1=
1
> > -native/usr/lib/python3.12/site-packages/pybind11/include/pybind11/deta=
il/common.h
> > -native/usr/lib/python3.12/site-packages/pybind11/include/pybind11/pyty=
pes.h
> > -native/usr/lib/python3.12/site-packages/pybind11/include/pybind11/deta=
il/class.h
> > -native/usr/lib/python3.12/site-packages/pybind11/include/pybind11/deta=
il/type_caster_base.h
> > -native/usr/lib/python3.12/site-packages/pybind11/include/pybind11/pybi=
nd11.h
> > -native/usr/lib/python3.12/site-packages/pybind11/include/pybind11/gil.=
h
> > -native/usr/lib/python3.12/site-packages/pybind11/include/pybind11/gil_=
safe_call_once.h
> >
> > * there is also:
> >   WARNING: lib32-python3-matplotlib-3.7.2-r0 do_check_backend: QA Issue=
: inherits setuptools3 but has pyproject.toml with setuptools.build_meta, u=
se the correct class [pep517-backend]
> >   but just changing the inherit doesn't work in this case, I'll leave t=
hat
> >   to someone actually using python3-matplotlib
> >
> > Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> > ---
> >  .../recipes-devtools/python/python3-matplotlib_3.7.2.bb      | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/meta-python/recipes-devtools/python/python3-matplotlib_3.7=
.2.bb b/meta-python/recipes-devtools/python/python3-matplotlib_3.7.2.bb
> > index 72c369100a..2886060a9e 100644
> > --- a/meta-python/recipes-devtools/python/python3-matplotlib_3.7.2.bb
> > +++ b/meta-python/recipes-devtools/python/python3-matplotlib_3.7.2.bb
> > @@ -68,3 +68,8 @@ do_compile:prepend() {
> >  }
> >
> >  BBCLASSEXTEND =3D "native"
> > +
> > +# otherwise pybind11 paths from STAGING_DIR_NATIVE end in _tri.cpython=
-312-i386-linux-gnu.so
> > +# when STAGING_DIR_NATIVE doesn't start with STAGING_DIR_HOST (e.g. fo=
r lib32-python3-matplotlib)
> > +# http://errors.yoctoproject.org/Errors/Details/801217/
> > +DEBUG_PREFIX_MAP:append =3D " -fmacro-prefix-map=3D${STAGING_DIR_NATIV=
E}=3D"
> > --
> > 2.46.0
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#112075): https://lists.openembedded.org/g/openembedde=
d-devel/message/112075
> Mute This Topic: https://lists.openembedded.org/mt/108229723/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [m=
artin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

