Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
 by mx.groups.io with SMTP id smtpd.web10.201.1587999422630748280
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Apr 2020 07:57:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qwaBL5gf;
 spf=pass (domain: gmail.com, ip: 209.85.214.195, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f195.google.com with SMTP id t4so7061230plq.12
        for <openembedded-devel@lists.openembedded.org>; Mon, 27 Apr 2020 07:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=VLQDmMjHTmSilK1GZZTG0PloJIZ5b0lnBQPnAt/CCW4=;
        b=qwaBL5gfAbN3AeVRVuyD9OYAbisi6nu/ZIWXRtclJGmeMYH9LZAfDYLvhEpfhsJ9na
         jeybyHPk6zibOATre0NLpLCn/gaWUxWw7Y+x4+spJq6PErHfdeOX/WwNFcBq+vgnqx1J
         BWJ6/oYCS1/Haswpm7MvH7luAEz1yBzzGsLmm1hn0tylF9neNtZ+AEc1p1dzY/82P+Or
         usjAiOGdkCMvhIjwS5yi/OF/2mPqtcXUio+eGXoWa+7s28LnXv6KESY5aZB+K+FYRwyg
         F56vIyDRUoSpWfuwnbu99eWw37nZ0yZyMYP2oJta0wkIDKQ7PmJJx26m7wXLjfMb9ugS
         7WXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=VLQDmMjHTmSilK1GZZTG0PloJIZ5b0lnBQPnAt/CCW4=;
        b=fGFhQodRq+gK/SvFuSN4MBq7XCqAimsnN9eiQzZlbyTUP7U2W3m/9kh8xDGqK9+cgX
         h/hov989VEjfQ2CeJdMeqABW6TEZwEO37bStOgN8APOtph9WBmMM3tECftp9TwT5vfok
         v+AdHnj0z6+h5HF975jMqtmBZwcn8SpgmyrfctT62NyLgg6PYvp0OPSMxGYXbS9W+7mD
         C3mYT2QCnQKfb1oH1O3/qv6dYWgviC07Rwu/lk3X0sDArfCdNmQ+jT5Vzj/KRNBFt4lr
         EwGBJFpH8LM3n6fPrHlbfmzddr+4eHnKnRVMlV1+Q6JmYJCVY9vUP6/PyS6XUXHPvBnJ
         uIkQ==
X-Gm-Message-State: AGi0PuZ2JvqEHE8/tV4VyOwds7PbkOxMgSvPOcu5u+aj4osCScBmUce2
	iTb8QTmzeBBIKRhVTLbnu9raXM/RLmc=
X-Google-Smtp-Source: APiQypLhKHEb9Xy/d9NOa4lKs9frmYt9ocGpFwgg9VRdnyKKzAp3TGMkQhJe5I15jCyVIclIXsUUVg==
X-Received: by 2002:a17:90a:d3cc:: with SMTP id d12mr24009405pjw.158.1587999421528;
        Mon, 27 Apr 2020 07:57:01 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0::e11c? ([2601:646:9200:4e0::e11c])
        by smtp.gmail.com with ESMTPSA id c1sm12359262pfo.152.2020.04.27.07.57.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2020 07:57:01 -0700 (PDT)
Subject: Re: [oe][meta-oe][PATCH v2] libwebsockets: upgrade 3.2.2 -> 4.0.1
To: Martin Balik <martin.balik@siemens.com>,
 openembedded-devel@lists.openembedded.org
References: <a1bd8357-97f7-f3cc-4b97-e63656c01452@gmail.com>
 <20200427115932.4479-1-martin.balik@siemens.com>
From: "Khem Raj" <raj.khem@gmail.com>
Autocrypt: addr=raj.khem@gmail.com; keydata=
 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
Message-ID: <186786a0-a65c-391b-8c1b-e9522f050c1f@gmail.com>
Date: Mon, 27 Apr 2020 07:57:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200427115932.4479-1-martin.balik@siemens.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

v1 has been applied to master, if there is delta in v2 w.r.t. v1 then
please rebase on latest master or master-next and send again please

On 4/27/20 4:59 AM, Martin Balik wrote:
> License changed from "LGPL-2.1" to "MIT"
> 
> Signed-off-by: Martin Balik <martin.balik@siemens.com>
> ---
>  .../{libwebsockets_3.2.2.bb => libwebsockets_4.0.1.bb}    | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>  rename meta-oe/recipes-connectivity/libwebsockets/{libwebsockets_3.2.2.bb => libwebsockets_4.0.1.bb} (86%)
> 
> diff --git a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_3.2.2.bb b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.0.1.bb
> similarity index 86%
> rename from meta-oe/recipes-connectivity/libwebsockets/libwebsockets_3.2.2.bb
> rename to meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.0.1.bb
> index 32ba51db0..0d1f57ab8 100644
> --- a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_3.2.2.bb
> +++ b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.0.1.bb
> @@ -1,13 +1,13 @@
>  SUMMARY = "Canonical libwebsockets.org websocket library"
>  HOMEPAGE = "https://libwebsockets.org/"
> -LICENSE = "LGPL-2.1"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=4ce87f3facb6f911c142c8bef9bfb380"
> +LICENSE = "MIT & Zlib & BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=8c47b078124308a4e1354e8d59f606b7"
>  
>  DEPENDS = "zlib"
>  
>  S = "${WORKDIR}/git"
> -SRCREV = "d880fe233020b74e058cbca95b5fb67823bbf258"
> -SRC_URI = "git://github.com/warmcat/libwebsockets.git;protocol=https;branch=v3.2-stable"
> +SRCREV = "6eb39388f43f6e2a27f0efcbf8cb2391e38824e9"
> +SRC_URI = "git://github.com/warmcat/libwebsockets.git;protocol=https;branch=v4.0-stable"
>  
>  UPSTREAM_CHECK_URI = "https://github.com/warmcat/${BPN}/releases"
>  UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
> 
> 
> 
> 
