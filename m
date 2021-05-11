Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web10.678.1620756241608221760
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 May 2021 11:04:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rIbbbih8;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id g24so12109237pji.4
        for <openembedded-devel@lists.openembedded.org>; Tue, 11 May 2021 11:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=D7XiKeAMcVBRmV/+oMWPi6Kn2RIHdP2i518wnIjZn+A=;
        b=rIbbbih8U2gQ7wfjPgvCbNd1sfXOS6i7b691jhdrXPkTM2eH1V5yZTiFD7lAdjRbvh
         tOBGFkWweJ5FzBN+kjGrnzFHuBCrmoCraViKG5E5Pe0svBwY0ht0bWRI3OgT/YHJlk91
         154EcrGH/4KcTXqQZ6LSqTjJky7iPrlUpaf3Q8jNSG3HZV6/fSN48qOL657JJ1rUT+6e
         EJTNyv+GjBpIozmCug+wCc48JdKp4QMSnjnLK6CK8QRI7jweJFDQvvEIrSlIoWU78YtM
         E0HaX87u25R7IPXX0Vv7xW45NsxA8tL6a8VKQjvVKZ81vp7Ht8PjcVfT9luEsqPbfjfD
         fvSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=D7XiKeAMcVBRmV/+oMWPi6Kn2RIHdP2i518wnIjZn+A=;
        b=Yzq2P1D8rgQwRARYsKOSneef8cML/PQ57z2TyQFcRcm+Ozi6WgnkFnNJSH60srPDhh
         yr2Xdo8bsIYYnhmr3I3YCqkkX0yA7c802cgDsPFYEGHgEtk6F0zXwoysiVQ5pyQZpL+B
         xgKIR9ieHdTlbcf0n/QfWFUrdDf1Qwl5glze34pl2xfn/L8g2iF9IYzs70mTxss1aXGI
         kRSQ+ISxOVdpg5iVRwHBvhEdunXZ6WpkP7UThPK90Jb99HSNvFMIO2DwPAOQ1oLr+8KU
         NmQSaULMMLrThc3sZCGfsTYYx8pqfyMBbKmU0taS1qcf0jonLMpEb8RcoWCentZchdF8
         3cvw==
X-Gm-Message-State: AOAM533K1HGS/7Uyqy7bZkWlmcjOFL+EAhNUh/BuqEVQyScP3Mi+6MW1
	g4sWP1jVeVNT8cjVGuHCUnrT+TmlYXh6oQ==
X-Google-Smtp-Source: ABdhPJwV4TqFXIz61eHncN63chNkPd4AX0KGrkIgm7MNcouKe4rywgqAFyDt6k38VibI+BM5LcAYLA==
X-Received: by 2002:a17:90b:194:: with SMTP id t20mr35282104pjs.83.1620756240784;
        Tue, 11 May 2021 11:04:00 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:4c51:e82a:7ea3:9a08? ([2601:646:9200:a0f0:4c51:e82a:7ea3:9a08])
        by smtp.gmail.com with ESMTPSA id x6sm13947269pfu.120.2021.05.11.11.04.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 May 2021 11:04:00 -0700 (PDT)
Subject: Re: [meta-python][PATCH] python3-pycocotools: new package
To: Bartosz Golaszewski <brgl@bgdev.pl>, Armin Kuster <akuster808@gmail.com>,
 Tim moto-timo Orling <TicoTimo@gmail.com>, Derek Straka <derek@asterius.io>,
 Trevor Gamblin <trevor.gamblin@windriver.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20210511171359.4534-1-brgl@bgdev.pl>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <e16a45e1-34cd-b2b4-b427-ec59c0216533@gmail.com>
Date: Tue, 11 May 2021 11:03:59 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210511171359.4534-1-brgl@bgdev.pl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

add it to test packagegroup as well in a followup please.

On 5/11/21 10:13 AM, Bartosz Golaszewski wrote:
> Add a recipe for building pycocotools - a Python wrapper for cocapi.
> 
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> ---
>   .../python/python3-pycocotools_2.0.2.bb           | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python3-pycocotools_2.0.2.bb
> 
> diff --git a/meta-python/recipes-devtools/python/python3-pycocotools_2.0.2.bb b/meta-python/recipes-devtools/python/python3-pycocotools_2.0.2.bb
> new file mode 100644
> index 000000000..4821c313e
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-pycocotools_2.0.2.bb
> @@ -0,0 +1,15 @@
> +SUMMARY = "COCO is a large image dataset designed for object detection, segmentation, \
> +           person keypoints detection, stuff segmentation, and caption generation."
> +LICENSE = "BSD-2-Clause"
> +LIC_FILES_CHKSUM = "file://pycocotools/coco.py;beginline=45;endline=45;md5=12cb539683cf245df8b6ce782d78f647"
> +
> +inherit setuptools3 pypi
> +
> +SRC_URI[md5sum] = "33858f23c8b99ce8116b70c32f6b6dd9"
> +SRC_URI[sha256sum] = "24717a12799b4471c2e54aa210d642e6cd4028826a1d49fcc2b0e3497e041f1a"
> +
> +DEPENDS = "python3-cython-native \
> +           python3-numpy-native \
> +           libxcrypt"
> +
> +RDEPENDS_${PN} = "python3-matplotlib python3-pillow python3-profile"
> 
