Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8F8AC636FF
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:08 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web11.8791.1650466430733407374
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Apr 2022 07:53:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UJZV/rqu;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id
 n11-20020a17090a73cb00b001d1d3a7116bso3922958pjk.0
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Apr 2022 07:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:organization:in-reply-to:content-transfer-encoding;
        bh=CmzR85cIhwvj+rDWzPoHIoi+Y8O0NeWf9SY+dmKSXSE=;
        b=UJZV/rqu8FnwD4ZaHmO/EFgRSdEALiRM+Znus6MzDn3msnqRbIljJ03oVW58RIG9aS
         BkgWl3TZBYG/MygmKf5U8Gk1KCTYTmHKdQmc2DtJ9XrM+SgK3r5ZyhAPjCQBSJagvLar
         LMkKdYXIWGimpz0D/ffEd4WfOf3Brw1Tv5VtNhQofrMcOVji+uj4xdxPLdaxIMVcCcER
         o9LB1gsry+w0ORq2k5wX6m/LbMw8YjmLpEhPqQF/SeggBPWmXmYyK0lOv084NIsUO7Xj
         OlRVqWm0reKsVBMFB6F8SFlY3z6RHNMkVZ1N2TYh0EjBG55Jhlfo2JqmMiT5Pn4zsFDQ
         /BAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=CmzR85cIhwvj+rDWzPoHIoi+Y8O0NeWf9SY+dmKSXSE=;
        b=yqZw/raStFAfCF6+nGroKx1Hsv3ycRLSlKAro1jZxcaU4eizRyyeIpTg3B0aahs1wO
         5AqAgKNE55MZAs8qVCmkWXpuxbQhFNVojsX+cTO7wHocxQ4fEtiADltc1xer+ScaMDK+
         +5zDF4PgmtVKbv9hyHKAF4vswFG1ovfmfqMEa3/41sJwgCseo7h2uQMTRbqBXwjDbCkv
         qIVZPsoHSDlV08LGralm4SM2fWQagbx4HL7MLVgpWI8vc6ubkPKMdABMaE9X7du01X4V
         AogMh4vHOQDsav+7Um1W3GPBUkBcJLCZ58kV15eiiKoqSy6vlaZFrBzOqkot0FuzHcr4
         SJXg==
X-Gm-Message-State: AOAM532f36q05yyRLEABiZQ+COv7o6XOOkvmwXh+QusIKiWEXJ/lm0tD
	TuAH1QoslwWnvIMnmDnKKbU=
X-Google-Smtp-Source: 
 ABdhPJzXbxxACaZFXBYrGlV9p8I0r0FnkbfJZWiis/APvasF+KLdBatMAPkltrESbehbJTvhsnDNPA==
X-Received: by 2002:a17:902:c215:b0:153:8d90:a108 with SMTP id
 21-20020a170902c21500b001538d90a108mr21538481pll.172.1650466430046;
        Wed, 20 Apr 2022 07:53:50 -0700 (PDT)
Received: from ?IPV6:2601:646:9200:a0f0::309e? ([2601:646:9200:a0f0::309e])
        by smtp.gmail.com with ESMTPSA id
 23-20020a621917000000b0050ab87c15e7sm3801374pfz.53.2022.04.20.07.53.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Apr 2022 07:53:49 -0700 (PDT)
Message-ID: <97a9dad0-fb8a-3bf0-8ee7-f45494e37cf4@gmail.com>
Date: Wed, 20 Apr 2022 07:53:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [oe] [meta-oe][PATCH] gpsd: split python utils from gps-utils
Content-Language: en-US
To: Dmitry Baryshkov <dbaryshkov@gmail.com>,
 openembedded-devel@lists.openembedded.org
References: <20220420094227.2826875-1-dmitry.baryshkov@linaro.org>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <20220420094227.2826875-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96714

It does not apply on top of master-next, can you rebase
and resend please.

On 4/20/22 02:42, Dmitry Baryshkov wrote:
> Neither gpsd nor significant part of gps-utils depend on python. However
> installing gps-utils package would require installing python, which adds
> about 17 MB to the image size. Split away gps-utils-python to allow
> using gpsd/gps-utils in the systems with limited resources (or in the
> initramfs).
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   .../recipes-navigation/gpsd/gpsd_3.23.1.bb    | 23 +++++++++++--------
>   1 file changed, 14 insertions(+), 9 deletions(-)
> 
> diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.23.1.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.23.1.bb
> index c11d4c76d64e..9ed94f7487e0 100644
> --- a/meta-oe/recipes-navigation/gpsd/gpsd_3.23.1.bb
> +++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.23.1.bb
> @@ -77,7 +77,7 @@ do_install:append() {
>       install -m 755 ${D}${libdir}/gps/*.py ${D}${PYTHON_SITEPACKAGES_DIR}/gps
>   }
>   
> -PACKAGES =+ "libgps python3-pygps gpsd-udev gpsd-conf gpsd-gpsctl gps-utils"
> +PACKAGES =+ "libgps python3-pygps gpsd-udev gpsd-conf gpsd-gpsctl gps-utils gps-utils-python"
>   
>   RPROVIDES:${PN}-dbg += "python-pygps-dbg"
>   
> @@ -106,31 +106,36 @@ SUMMARY:gps-utils = "Utils used for simulating, monitoring,... a GPS"
>   # Python files are required for gps/fake, required for gpsfake.
>   FILES:gps-utils = "\
>       ${bindir}/cgps         \
> -    ${bindir}/gegps        \
>       ${bindir}/gps2udp      \
> -    ${bindir}/gpscat       \
> -    ${bindir}/gpscsv       \
>       ${bindir}/gpsctl       \
>       ${bindir}/gpsdebuginfo \
>       ${bindir}/gpsdecode    \
> -    ${bindir}/gpsfake      \
>       ${bindir}/gpsmon       \
>       ${bindir}/gpspipe      \
> -    ${bindir}/gpsplot      \
> -    ${bindir}/gpsprof      \
>       ${bindir}/gpsrinex     \
>       ${bindir}/gpssnmp      \
> -    ${bindir}/gpssubframe  \
>       ${bindir}/gpxlogger    \
>       ${bindir}/lcdgps       \
>       ${bindir}/ntpshmmon    \
>       ${bindir}/ppscheck     \
>       ${bindir}/ubxtool      \
> +"
> +RRECOMMENDS:gps-utils = "gps-utils-python"
> +
> +SUMMARY:gps-utils-python = "Python utils used for simulating, monitoring,... a GPS"
> +FILES:gps-utils-python = "\
> +    ${bindir}/gegps        \
> +    ${bindir}/gpscat       \
> +    ${bindir}/gpscsv       \
> +    ${bindir}/gpsfake      \
> +    ${bindir}/gpsplot      \
> +    ${bindir}/gpsprof      \
> +    ${bindir}/gpssubframe  \
>       ${bindir}/xgps         \
>       ${bindir}/xgpsspeed    \
>       ${bindir}/zerk         \
>   "
> -RDEPENDS:gps-utils = "python3-pygps"
> +RDEPENDS:gps-utils-python = "python3-pygps"
>   
>   SUMMARY:python3-pygps = "Python bindings to gpsd"
>   FILES:python3-pygps = "${PYTHON_SITEPACKAGES_DIR}/* ${libdir}/gps/*.py ${libdir}/*.egg-info"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#96713): https://lists.openembedded.org/g/openembedded-devel/message/96713
> Mute This Topic: https://lists.openembedded.org/mt/90580511/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

