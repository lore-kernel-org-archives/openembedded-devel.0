Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web10.56.1631909458068400359
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Sep 2021 13:10:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iWTbObnh;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id i19so7695948pjv.4
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Sep 2021 13:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=xrPLA3DmLsmORXNSywLwNgzaJnR9JzMXOE9+EayKXHU=;
        b=iWTbObnh7kM/xsm7bhuxTz0+QkXizMYz0/TC/lkflczYPzwPpelCbx+gX5+8/i356j
         AM374jVCjMxu5xruKh9tf6ZXrTVxRdp3gjT8sjRqALF1lyXdHqSTqUjXpbkkQO9jF3mC
         LaJGIs62NV8uH2tVI3cIGf9vthhwJpdWWUFcy/k16GcuUsJjDE73hPeCjU0mH5ttTz07
         jeKEl9hTwq3cesvFSMPB0U/aKJ/yeWVAwuHy8N7ebJUlzWGatGtUqyWvBQT3aK7oQrw1
         FQUoqNctl5j6jLp55fABp4h47/RGMnM2D7VRd2l52f7q+huGhnxyneHPWIrPlgh/lWCd
         7YqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=xrPLA3DmLsmORXNSywLwNgzaJnR9JzMXOE9+EayKXHU=;
        b=DpqYPPT1SDG2Rnd6MaDCHxcKnYihKoRZ1GQTso0OBOq3THhl+/G3kW6ZIjj9wWyO1s
         +sGMC/kyQoTUwyFCm77oTyCr2GVNOMXl9xnQ4mPoulNVMVVy+li0qu46+EXNBVt9+ZtH
         QQ9GslRt3hi8sD2NOy6LNTLFLOMUz4FOUrjQ2S2ODzGNKX0bRC3o1RyH1Iylr66QFiO7
         Bvt4a3Vgfml+b2G7nTz08Gjv8drCXHGjQYO5Fkw37hevpwo2d0IEnYEC80AQvsLlnUNd
         aQI/zpO8EpWma8FHrsfSg1rvV4Vmf0sB45y+ayrrcH2nyVNMXrujWlgsz014sUf+8TNY
         Q26A==
X-Gm-Message-State: AOAM532SafT+q9WBsJsVNkix6P9u7fPnIIuwYhiDOb6FcofHjJBtHbCA
	0IUcI8fepEdd2mJl4lMiHBSP6n8RDDM=
X-Google-Smtp-Source: ABdhPJygbq12LaT5sKHczXh2PBK9JHVSGJIVA4JWArAc2p4LHT6F4+FoSARQMG9X7o8IeLSgOENb4g==
X-Received: by 2002:a17:90a:31cf:: with SMTP id j15mr14367073pjf.86.1631909457310;
        Fri, 17 Sep 2021 13:10:57 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:2b6e:6174:9286:e61b? ([2601:202:4180:a5c0:2b6e:6174:9286:e61b])
        by smtp.gmail.com with ESMTPSA id e11sm6567718pfv.201.2021.09.17.13.10.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Sep 2021 13:10:56 -0700 (PDT)
Subject: Re: [oe] [meta-oe][hardknott][PATCH] libiio: Make libiio-python3 depend on python3-core
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
 openembedded-devel@lists.openembedded.org
References: <20210917191140.19563-1-pkj@axis.com>
From: "Armin Kuster" <akuster808@gmail.com>
Message-ID: <4443f668-4da1-315e-3671-6447a7826479@gmail.com>
Date: Fri, 17 Sep 2021 13:10:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210917191140.19563-1-pkj@axis.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 9/17/21 12:11 PM, Peter Kjellerstedt wrote:
> Inheriting setuptools3 incorrectly adds the dependency on python3-core
> to libiio instead of to libiio-python3 where it belongs.
Doesn't this also affect Master?

-armin
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>  meta-oe/recipes-support/libiio/libiio_git.bb | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-support/libiio/libiio_git.bb b/meta-oe/recipes-support/libiio/libiio_git.bb
> index d7e4cc60a..cfd9746bd 100644
> --- a/meta-oe/recipes-support/libiio/libiio_git.bb
> +++ b/meta-oe/recipes-support/libiio/libiio_git.bb
> @@ -37,7 +37,10 @@ PACKAGECONFIG[libiio-python3] = "-DPYTHON_BINDINGS=ON,-DPYTHON_BINDINGS=OFF"
>  
>  PACKAGES =+ "${PN}-iiod ${PN}-tests ${PN}-${PYTHON_PN}"
>  
> -RDEPENDS_${PN}-${PYTHON_PN} = "${PN} ${PYTHON_PN}-ctypes ${PYTHON_PN}-stringold"
> +# Inheriting setuptools3 incorrectly adds the dependency on ${PYTHON_PN}-core
> +# to ${PN} instead of to ${PN}-${PYTHON_PN} where it belongs.
> +RDEPENDS_${PN}_remove = "${PYTHON_PN}-core"
> +RDEPENDS_${PN}-${PYTHON_PN} = "${PN} ${PYTHON_PN}-core ${PYTHON_PN}-ctypes ${PYTHON_PN}-stringold"
>  
>  FILES_${PN}-iiod = " \
>      ${sbindir}/iiod \
>
> 
>

