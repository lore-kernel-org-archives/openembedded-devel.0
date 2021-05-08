Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web10.8029.1620489828057157397
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 08 May 2021 09:03:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EN5updSH;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id g17so6340689qvl.9
        for <openembedded-devel@lists.openembedded.org>; Sat, 08 May 2021 09:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5VHYvthNL1Kzv64vmLEIh1uwPmeJTbDcphhOdkssRDY=;
        b=EN5updSHtTBYjBJqEJXXtwvg/8vKygG0aPjQqa3sZ0uXUCrZLQ6OpuWc8YPp8BIwoj
         fNWtrg1oACNtqVpyFc3IxVkmXakf1Exqid1kP5ObFKWKse8/00M7E5bCFbs1jZFTtG1P
         TSsnv2GaoKG9TJAGPIxYwznC3dMOvZje468bxE2aDh/YH+ITzPa3SnuxzB1i6Xk85oeA
         wYeRGQjbnEI+MibHTpuHCYIE7nVME8yZBS63ykQHXr/2/DAn+dLGB9mxnZy0THUkfW/B
         YMNbLiAbMhNAd9ZhdoUgeC88dIbSEDoYZ/3kMCcBZztz7Y+FDKh4KyTZ6Sf7pq+bsMyl
         Echg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5VHYvthNL1Kzv64vmLEIh1uwPmeJTbDcphhOdkssRDY=;
        b=D2y3sUbSLXOOxhM/u9KtiZVi+qPKt/0KuA2LXAARNeWSFUzjLlkST/njre5Wi7Gxgk
         WhPzADElF4jUJWrgFtiuoIYLsB+7fSXTlRbCXoZObazaAMc/G2wiANvnbS0TASaYi3L6
         l6ov8igriswo/5k/C4FTwTccWYXg7bD9SBlt6ykEl2wgiVzREh6eJ6fZWUF5h/MnHEXd
         mUMtmGICk/BeRZzFWpEqea/WUqQgI0c1xay6yN4zfAsoo3azryP0mtWqDHxitscrHCkY
         Q4Pgi/stUwC4JvvOxCy/2qmJ0eN2n3z19z2oIIFoKmq6k7vSWdcNQf4gXj8H2y576Ste
         tzhA==
X-Gm-Message-State: AOAM5333Tb/uNLiRlS01Uu2wSDDnAzYsN+00O5Ro2n0WGeUa3F63pP6y
	XRXKVG1OCN3pUvxKZO0yvBPvtKZRYq6sDSStDyF75jHzhPYFfA==
X-Google-Smtp-Source: ABdhPJzOjUtHXaB1rFhZCTEK+mAXjqiT3w4UMNkN7HFZ5sJHZQHh/y6VldAgTSRwRTdQ+oXFmGsIPKOUU78zquJ5V6k=
X-Received: by 2002:ad4:5f48:: with SMTP id p8mr12485231qvg.55.1620489827143;
 Sat, 08 May 2021 09:03:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210508142203.2098012-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20210508142203.2098012-1-richard.purdie@linuxfoundation.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sat, 8 May 2021 09:03:19 -0700
Message-ID: <CAMKF1soieaNs6q253hHKgNqW+oAQkUsmAZupppJh9Maq7=YdsQ@mail.gmail.com>
Subject: Re: [oe] [PATCH] [meta-python] python3-m2crypto: Improve multilib header workaround
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Thanks for the fix, However, I have found a different way to fix it
correctly [1]

[1] https://lists.openembedded.org/g/openembedded-devel/topic/meta_oe_patch_v2/82680640?p=,,,20,0,0,0::recentpostdate%2Fsticky,,,20,2,0,82680640

On Sat, May 8, 2021 at 7:22 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> The multilib header issues continue to cause problems for this recipe. Simplfy
> the workaround to something which resolves all the current issues and
> is much simpler to understand/maintain.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  .../python/python3-m2crypto_0.37.1.bb         | 25 ++++---------------
>  1 file changed, 5 insertions(+), 20 deletions(-)
>
> diff --git a/meta-python/recipes-devtools/python/python3-m2crypto_0.37.1.bb b/meta-python/recipes-devtools/python/python3-m2crypto_0.37.1.bb
> index 896d9d2cc..45abaac33 100644
> --- a/meta-python/recipes-devtools/python/python3-m2crypto_0.37.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-m2crypto_0.37.1.bb
> @@ -36,27 +36,12 @@ SWIG_FEATURES_x32 = "-D__ILP32__"
>  SWIG_FEATURES ?= "-D__${HOST_ARCH}__"
>  export SWIG_FEATURES
>
> -# Get around a problem with swig, but only if the
> -# multilib header file exists.
> -#
>  do_configure_prepend() {
> -    ${CPP} -dM - < /dev/null | grep -v '__\(STDC\|REGISTER_PREFIX\|GNUC\|STDC_HOSTED\)__' \
> -    | sed 's/^\(#define \([^ ]*\) .*\)$/#undef \2\n\1/' > ${S}/SWIG/gcc_macros.h
> -
> -    if [ "${SITEINFO_BITS}" = "64" ];then
> -        bit="64"
> -    else
> -        bit="32"
> -    fi
> -
> -    if [ -e ${STAGING_INCDIR}/openssl/opensslconf-${bit}.h ] ;then
> -        for i in SWIG/_ec.i SWIG/_evp.i; do
> -            sed -i -e "s/opensslconf.*\./opensslconf-${bit}\./" "${S}/$i"
> -        done
> -    elif [ -e ${STAGING_INCDIR}/openssl/opensslconf-n${bit}.h ] ;then
> -        for i in SWIG/_ec.i SWIG/_evp.i; do
> -            sed -i -e "s/opensslconf.*\./opensslconf-n${bit}\./" "${S}/$i"
> -        done
> +    # swig can't handle any multilib header redirection so just remove it for this build
> +    if [ -e ${STAGING_INCDIR}/openssl/opensslconf-64.h ] ;then
> +        cp ${STAGING_INCDIR}/openssl/opensslconf-64.h ${STAGING_INCDIR}/openssl/opensslconf.h
> +    elif [ -e ${STAGING_INCDIR}/openssl/opensslconf-32.h ] ;then
> +        cp ${STAGING_INCDIR}/openssl/opensslconf-32.h ${STAGING_INCDIR}/openssl/opensslconf.h
>      fi
>  }
>
> --
> 2.25.1
>
>
> 
>
