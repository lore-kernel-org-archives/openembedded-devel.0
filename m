Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id 7C3816004D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 May 2019 21:06:55 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id p15so3364606pll.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 May 2019 14:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=3AwxuHzt/mn3Sxok+xsWJQmG8m3HCG4o9gI7BG13eEQ=;
	b=rkqsyCqUvf/wy9D0ZoE2sk4oCz0iQjgFRbadbUPyN+TFiPx+LBZlmmDn2ydnUCB9fX
	6iGSQwEuV4CwOJPguw2lI7/RhQWL9fEcPkpsN37drQwNG9OmQnqqMr5FCK3+hJsmBmOl
	DOmocUUvzIdXtMC7KVoqMdxTCnzAe7eDl4UP+cyA5nkYkaf9hLpNiBb2R5Z6b3BDeoBA
	SpsHnSNQv2MrSsOvLIOxpaPdcyTZITRFNJVwuuM+OLqzwBoMbtdHX6SQv5HAzZinwreo
	uc4rEMS/k/VreGF3/GKX5vjDYGyE01lAjoY0ovSuecH7Q3dybqhtVPcJbOfC5kGC+RYJ
	ujNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=3AwxuHzt/mn3Sxok+xsWJQmG8m3HCG4o9gI7BG13eEQ=;
	b=dCOpPcncKNO3Q4fxzh5o0Cc8qHXj9tPBuryu935sjaK1dNsnGCvLFimiEzAw3fHL2W
	hKW/aD652zMe13S3S4Wy+nw46/H0MKwZen21qm/J2qErEqgbbvjIKGSMSTC4foBXENbb
	QGqOD2TgTpPj6T/T0reC/Nf+JBWI3c5kV4tXDbPnIC17wCvwFglIAd4TXYGb5iI3IZV7
	f3j9tUcV42x+/LHndKNEtd8P8ZNgE+LRvXoHM57C6E9LovlQl2xKvChptgRzCrL69kuL
	PYP+KTLJhETmaaf5aFP7d29SOVxtbnC+Ja5rxRq+F3fRl336oM1I08neB0y0IxHRzbJV
	lSUQ==
X-Gm-Message-State: APjAAAU+dGXM9dIhtZvjOQGCCOZReL8U/o5NxVUBDaS9lJ3zpDhI+Lfp
	myFKecLQ7ctlaIK1v0gj0XK08NwcxcY=
X-Google-Smtp-Source: APXvYqzFJRcx0R2JOrjqORqyggz2XoRwcLDLRQyS0uyW9/ZbdxHJeB47+yjY8+ub5IAZBUSCBAKLLg==
X-Received: by 2002:a17:902:e30b:: with SMTP id
	cg11mr15455363plb.3.1557522416138; 
	Fri, 10 May 2019 14:06:56 -0700 (PDT)
Received: from hermes.local ([2601:646:8500:6bc6:6095:8839:3497:2f69])
	by smtp.gmail.com with ESMTPSA id
	k26sm7767146pfi.136.2019.05.10.14.06.54
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Fri, 10 May 2019 14:06:55 -0700 (PDT)
To: Adrian Bunk <bunk@stusta.de>, openembedded-devel@lists.openembedded.org
References: <20190510115515.19491-10-bunk@stusta.de>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <dd9ec01e-c6c6-532f-96da-f39d6eb82ffe@gmail.com>
Date: Fri, 10 May 2019 14:06:54 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:67.0)
	Gecko/20100101 Thunderbird/67.0
MIME-Version: 1.0
In-Reply-To: <20190510115515.19491-10-bunk@stusta.de>
Subject: Re: [meta-oe][PATCH] geos: Upgrade 3.4.2 -> 3.4.3
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 10 May 2019 21:06:55 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 5/10/19 4:55 AM, Adrian Bunk wrote:
> Remove patch applied upstream.
> 

I am also seeing license checksum mismatches

https://errors.yoctoproject.org/Errors/Details/240048/


> Signed-off-by: Adrian Bunk <bunk@stusta.de>
> ---
>   .../geos/files/fix-gcc6-isnan.patch           | 22 -------------------
>   meta-oe/recipes-navigation/geos/geos_3.4.2.bb |  7 ------
>   meta-oe/recipes-navigation/geos/geos_3.4.3.bb |  7 ++++++
>   3 files changed, 7 insertions(+), 29 deletions(-)
>   delete mode 100644 meta-oe/recipes-navigation/geos/files/fix-gcc6-isnan.patch
>   delete mode 100644 meta-oe/recipes-navigation/geos/geos_3.4.2.bb
>   create mode 100644 meta-oe/recipes-navigation/geos/geos_3.4.3.bb
> 
> diff --git a/meta-oe/recipes-navigation/geos/files/fix-gcc6-isnan.patch b/meta-oe/recipes-navigation/geos/files/fix-gcc6-isnan.patch
> deleted file mode 100644
> index 5c5fbd1d9..000000000
> --- a/meta-oe/recipes-navigation/geos/files/fix-gcc6-isnan.patch
> +++ /dev/null
> @@ -1,22 +0,0 @@
> ---- geos-3.4.2/configure.in.orig	2016-06-08 17:46:43.002250304 +0000
> -+++ geos-3.4.2/configure.in	2016-06-08 17:57:36.342241606 +0000
> -@@ -197,7 +197,7 @@
> - AC_LANG_PUSH([C++])
> - AC_CACHE_CHECK([for isnan], ac_cv_isnan,
> -  [AC_TRY_LINK([#include <cmath>],
> -- [double x; int y; y = isnan(x);],
> -+ [double x; int y; y = std::isnan(x);],
> -  ac_cv_isnan=yes,
> -  ac_cv_isnan=no
> - )])
> ---- geos-3.4.2/include/geos/platform.h.in.orig	2016-06-08 14:06:53.910234182 -0400
> -+++ geos-3.4.2/include/geos/platform.h.in	2016-06-08 14:07:19.298233844 -0400
> -@@ -84,7 +84,7 @@
> - #endif
> -
> - #if defined(HAVE_ISNAN)
> --# define ISNAN(x) (isnan(x))
> -+# define ISNAN(x) (std::isnan(x))
> - #else
> - # if defined(_MSC_VER)
> - #  define ISNAN(x) _isnan(x)
> diff --git a/meta-oe/recipes-navigation/geos/geos_3.4.2.bb b/meta-oe/recipes-navigation/geos/geos_3.4.2.bb
> deleted file mode 100644
> index 7193f8fb5..000000000
> --- a/meta-oe/recipes-navigation/geos/geos_3.4.2.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -require geos.inc
> -
> -SRC_URI += "file://geos-config-Add-includedir-variable.patch \
> -            file://fix-gcc6-isnan.patch"
> -
> -SRC_URI[md5sum] = "fc5df2d926eb7e67f988a43a92683bae"
> -SRC_URI[sha256sum] = "15e8bfdf7e29087a957b56ac543ea9a80321481cef4d4f63a7b268953ad26c53"
> diff --git a/meta-oe/recipes-navigation/geos/geos_3.4.3.bb b/meta-oe/recipes-navigation/geos/geos_3.4.3.bb
> new file mode 100644
> index 000000000..538456cc2
> --- /dev/null
> +++ b/meta-oe/recipes-navigation/geos/geos_3.4.3.bb
> @@ -0,0 +1,7 @@
> +require geos.inc
> +
> +SRC_URI += "file://geos-config-Add-includedir-variable.patch \
> +"
> +
> +SRC_URI[md5sum] = "77f2c2cca1e9f49bc1bece9037ac7a7a"
> +SRC_URI[sha256sum] = "cfbf68079117c1c2b76411636444ff41d73c31093c4cab9dcc9a8c1bbe7e3897"
> 

