Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE53DCA0ED3
	for <webhook@archiver.kernel.org>; Mon,  2 Sep 2024 16:30:12 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web10.3178.1725294609592597327
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Sep 2024 09:30:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BSsKym3g;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-533488ffaf7so6003876e87.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 02 Sep 2024 09:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725294607; x=1725899407; darn=lists.openembedded.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dc8ZIXoKJBE1BZaTRAhEJUxS7POBCSVccwsB7IzFQI0=;
        b=BSsKym3g2oHhzvDP7g8GMRjTZHp4hvdRijbzmJH+ifv64jj5vojGCVuyg3v/vrcOfR
         8ng+teLF1NqgWOdtm5X/zHSwKmxYSNbdVwrEy8POaZR74HLILmPBlzTY3K7HF/NL2ZPg
         GxX6O5BFEfwjuVBf8rdb0pIf/RGW05/AWkEmgw1NkESqZX63AC2mREa5pBinKtu5us7M
         aTgERTtAuDkp3laE584TcOGTxIystC3GdaPkBn/cxpj8X0dAULDCEtEJXSko56+m62Av
         9VuCqKYdbu7/D8HYdsfjhJ+9kNzE8/4JFBvHQH401YatVxc7/Z558YYSaSnbMqPtbJlY
         Vuag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725294607; x=1725899407;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dc8ZIXoKJBE1BZaTRAhEJUxS7POBCSVccwsB7IzFQI0=;
        b=pGKSE9ol30aC8jejEXr5WkrfIWxOZsI4j2fFC8JRbrDsj6TwN000cW1i5fIybiG080
         yVJimrgOlh3KCPkKf0PdDE0dMLPrZa8BgjW4FYeSM1UPub/jGVMJqZo6vfQUtT2rvbim
         8lI9XjSd/ERB+vGmtYxAIM4Zn9Vfvo/8OGozv00g4C4qPGcrspaX7mstWCzohqTZfUso
         DRwIxuxK2rpYsaEG7HILzGb+p6r+vuoV+KNXE+cRUDuQYUb/v1a7wKFinxPj+IU//wnl
         a7fphAdAgvQ5TNFLe1s48Hh0N7WEe+XzQHl4jZ/NJvDQ1LJjHW7xfR+PJXRg4JSPA2eY
         uIFg==
X-Gm-Message-State: AOJu0YxeSVzGcki400t4y6LQRSnvXCrfdKxaFYd9iMg3LbwQlkwWEX5N
	PXJTBKlH8RNBsPzFwVutX38hC6UvsMMQUj8gKmp4rMshDtnzNxMmOURoryAiZnZfw+Jr3rvIVdI
	68pLkfhI0DhvXCbyyt465uTblsFX0RJCw
X-Google-Smtp-Source: AGHT+IGZbUQmAdlPNIVBDXQryHXqcD753xRP/kKunssejYtsG9rq9HnlO96e/OAaJK8WX+p6GcKRdepnzNXry5cljuc=
X-Received: by 2002:a05:6512:3ba5:b0:530:ad8b:de11 with SMTP id
 2adb3069b0e04-53546afd8dfmr6688191e87.9.1725294606330; Mon, 02 Sep 2024
 09:30:06 -0700 (PDT)
MIME-Version: 1.0
References: <20240902162710.1284914-1-martin.jansa@gmail.com>
In-Reply-To: <20240902162710.1284914-1-martin.jansa@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 2 Sep 2024 18:29:53 +0200
Message-ID: <CA+chaQehTjGcoLsZMoWe_fJ4=-d=1ptnJH=SzHmprbGHMzKhsg@mail.gmail.com>
Subject: Re: [meta-oe][PATCH] python3-matplotlib: add native RSS to
 -fmacro-prefix-map to fix buildpaths QA
To: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Sep 2024 16:30:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112075

This is related RFC patch just sent to oe-core ML:
https://lists.openembedded.org/g/openembedded-core/message/204110

On Mon, Sep 2, 2024 at 6:27=E2=80=AFPM Martin Jansa <martin.jansa@gmail.com=
> wrote:
>
> * fixes:
>   ERROR: lib32-python3-matplotlib-3.7.2-r0 do_package_qa: QA Issue: File =
/usr/lib/python3.12/site-packages/matplotlib/_tri.cpython-312-i386-linux-gn=
u.so in package lib32-python3-matplotlib contains reference to TMPDIR [buil=
dpaths]
>
> * there is native RSS already but only in -fdebug-prefix-map
>
> * it fails only with multilib where target RSS isn't substring of native =
RSS
>
> * comparing _tri.cpython-312-*-linux-gnu.so cmdline for regular x86-64 an=
d lib32-python3-matplotlib i586 build shows:
>
> --fmacro-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/=
python3-matplotlib/3.7.2/matplotlib-3.7.2=3D/usr/src/debug/python3-matplotl=
ib/3.7.2 \
> --fdebug-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/=
python3-matplotlib/3.7.2/matplotlib-3.7.2=3D/usr/src/debug/python3-matplotl=
ib/3.7.2 \
> --fmacro-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/=
python3-matplotlib/3.7.2/matplotlib-3.7.2=3D/usr/src/debug/python3-matplotl=
ib/3.7.2 \
> --fdebug-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/=
python3-matplotlib/3.7.2/matplotlib-3.7.2=3D/usr/src/debug/python3-matplotl=
ib/3.7.2 \
> --fdebug-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/=
python3-matplotlib/3.7.2/recipe-sysroot=3D \
> --fmacro-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/=
python3-matplotlib/3.7.2/recipe-sysroot=3D \
> --fdebug-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/=
python3-matplotlib/3.7.2/recipe-sysroot-native=3D \
> +-fmacro-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/i586-oemllib32-lin=
ux/lib32-python3-matplotlib/3.7.2/matplotlib-3.7.2=3D/usr/src/debug/lib32-p=
ython3-matplotlib/3.7.2 \
> +-fdebug-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/i586-oemllib32-lin=
ux/lib32-python3-matplotlib/3.7.2/matplotlib-3.7.2=3D/usr/src/debug/lib32-p=
ython3-matplotlib/3.7.2 \
> +-fmacro-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/i586-oemllib32-lin=
ux/lib32-python3-matplotlib/3.7.2/matplotlib-3.7.2=3D/usr/src/debug/lib32-p=
ython3-matplotlib/3.7.2 \
> +-fdebug-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/i586-oemllib32-lin=
ux/lib32-python3-matplotlib/3.7.2/matplotlib-3.7.2=3D/usr/src/debug/lib32-p=
ython3-matplotlib/3.7.2 \
> +-fdebug-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/i586-oemllib32-lin=
ux/lib32-python3-matplotlib/3.7.2/lib32-recipe-sysroot=3D \
> +-fmacro-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/i586-oemllib32-lin=
ux/lib32-python3-matplotlib/3.7.2/lib32-recipe-sysroot=3D \
> +-fdebug-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/i586-oemllib32-lin=
ux/lib32-python3-matplotlib/3.7.2/recipe-sysroot-native=3D \
>
> * the buildpaths are header files from native pybind11 (Pybind11Extension=
)
>   https://github.com/pybind/pybind11/blob/master/pybind11/setup_helpers.p=
y#L89
>
> $ strings package/usr/lib/python3.12/site-packages/matplotlib/_tri.cpytho=
n-312-i386-linux-gnu.so | grep oemllib32
> /OE/build/oe-core/tmp-glibc/work/i586-oemllib32-linux/lib32-python3-matpl=
otlib/3.7.2/recipe-sysroot-native/usr/lib/python3.12/site-packages/pybind11=
/include/pybind11/detail/../detail/common.h
> /OE/build/oe-core/tmp-glibc/work/i586-oemllib32-linux/lib32-python3-matpl=
otlib/3.7.2/recipe-sysroot-native/usr/lib/python3.12/site-packages/pybind11=
/include/pybind11/detail/../detail/../pytypes.h
> /OE/build/oe-core/tmp-glibc/work/i586-oemllib32-linux/lib32-python3-matpl=
otlib/3.7.2/recipe-sysroot-native/usr/lib/python3.12/site-packages/pybind11=
/include/pybind11/detail/class.h
> /OE/build/oe-core/tmp-glibc/work/i586-oemllib32-linux/lib32-python3-matpl=
otlib/3.7.2/recipe-sysroot-native/usr/lib/python3.12/site-packages/pybind11=
/include/pybind11/detail/../detail/type_caster_base.h
> /OE/build/oe-core/tmp-glibc/work/i586-oemllib32-linux/lib32-python3-matpl=
otlib/3.7.2/recipe-sysroot-native/usr/lib/python3.12/site-packages/pybind11=
/include/pybind11/pybind11.h
> /OE/build/oe-core/tmp-glibc/work/i586-oemllib32-linux/lib32-python3-matpl=
otlib/3.7.2/recipe-sysroot-native/usr/lib/python3.12/site-packages/pybind11=
/include/pybind11/gil.h
> /OE/build/oe-core/tmp-glibc/work/i586-oemllib32-linux/lib32-python3-matpl=
otlib/3.7.2/recipe-sysroot-native/usr/lib/python3.12/site-packages/pybind11=
/include/pybind11/gil_safe_call_once.h
>
> * I'm not familiar enough with pybind11 to find a way how to configure it=
 to
>   use correct include dir, the issue already exists in regular x86-64 dir=
, but
>   not caught by buildpaths, because, the:
>   -fmacro-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux=
/python3-matplotlib/3.7.2/recipe-sysroot=3D
>   is enought to mangle the hardcoded paths (leaving only '-native') like =
this:
>
> strings ../3.7.2-x86-64/package/usr/lib64/python3.12/site-packages/matplo=
tlib/_tri.cpython-312-x86_64-linux-gnu.so | grep pybind11/include/pybind11
> -native/usr/lib/python3.12/site-packages/pybind11/include/pybind11/detail=
/common.h
> -native/usr/lib/python3.12/site-packages/pybind11/include/pybind11/pytype=
s.h
> -native/usr/lib/python3.12/site-packages/pybind11/include/pybind11/detail=
/class.h
> -native/usr/lib/python3.12/site-packages/pybind11/include/pybind11/detail=
/type_caster_base.h
> -native/usr/lib/python3.12/site-packages/pybind11/include/pybind11/pybind=
11.h
> -native/usr/lib/python3.12/site-packages/pybind11/include/pybind11/gil.h
> -native/usr/lib/python3.12/site-packages/pybind11/include/pybind11/gil_sa=
fe_call_once.h
>
> * there is also:
>   WARNING: lib32-python3-matplotlib-3.7.2-r0 do_check_backend: QA Issue: =
inherits setuptools3 but has pyproject.toml with setuptools.build_meta, use=
 the correct class [pep517-backend]
>   but just changing the inherit doesn't work in this case, I'll leave tha=
t
>   to someone actually using python3-matplotlib
>
> Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> ---
>  .../recipes-devtools/python/python3-matplotlib_3.7.2.bb      | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/meta-python/recipes-devtools/python/python3-matplotlib_3.7.2=
.bb b/meta-python/recipes-devtools/python/python3-matplotlib_3.7.2.bb
> index 72c369100a..2886060a9e 100644
> --- a/meta-python/recipes-devtools/python/python3-matplotlib_3.7.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-matplotlib_3.7.2.bb
> @@ -68,3 +68,8 @@ do_compile:prepend() {
>  }
>
>  BBCLASSEXTEND =3D "native"
> +
> +# otherwise pybind11 paths from STAGING_DIR_NATIVE end in _tri.cpython-3=
12-i386-linux-gnu.so
> +# when STAGING_DIR_NATIVE doesn't start with STAGING_DIR_HOST (e.g. for =
lib32-python3-matplotlib)
> +# http://errors.yoctoproject.org/Errors/Details/801217/
> +DEBUG_PREFIX_MAP:append =3D " -fmacro-prefix-map=3D${STAGING_DIR_NATIVE}=
=3D"
> --
> 2.46.0
>

