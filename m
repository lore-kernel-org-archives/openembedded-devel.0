Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id 39AA57899C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Mar 2018 14:51:50 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id b7-v6so3254398plr.8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Mar 2018 07:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=TGlvFClu5b1ipQ9wfrnQw3v7Yrlq3tg02O9O9HgqrDc=;
	b=scyzFQNtD23vwOCOmabc3xR1KE+Uh3IJ7OpDK6OMwLj2fnU1gULrYl4LO9n7I2FII5
	0PTzx+6bnWzCOwFdDCO3FOr7wUNFr/8LpxSdYGtvHR3aJ+iPuh3+Oat99vXpxCPwOgXV
	V5Mzs1lr441ohSpEEC1pqWxy9VTEgGBR75eOERsirFmf72726MnYmpsQVZYFKvwL/BA0
	Iqbn1kicA94YB8x+CioOuTSljTh5JH4znK8t/dsXX3Fdt/3mr5QA+wls7aLNz/qX2skI
	Fbtt4mdlsjopVgPaufd0y+1/DW7Kk2/hu3ay+5TnXwLMT5PKbm+wd87axk1p0kMiFxbE
	KNag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=TGlvFClu5b1ipQ9wfrnQw3v7Yrlq3tg02O9O9HgqrDc=;
	b=W/LgR3qco7bGJ4G69RDxIWI33dXmSjqtQKNt6LGa9zz8PIgkIcIUu/goikDAZRy+ba
	/vrSgdkqeqs0oTP/QE1b9qDEsE86d6Jm92OTtbqV5rOwODsOYLAm+9ML/p4S+Kkk2iDJ
	isKInIimv7vwAfQ0OzQIywgD+HmioFiHSZM+KTrF4buycuLS1YiUaHoTZMsVQNEILDVn
	NclBGEgpAOjjaN4kButcGGDT1m5y+8F090Y3fSZ0uS3pcjCvF9COCRlMWeK2q7r2oYma
	R+OFpeG+OZwqmYs9jYd6GI9FYoKf4RmDgGBRnXLHFOwSxgNJLCUMqBlPd6476bJGwlt4
	dx2w==
X-Gm-Message-State: AElRT7GW7VB7qrK8DdgipaXN9IR7cMdf6z7flU4Wn9UxY0KOVcHFwV0e
	Yx88Flk8TikdAtai+0ROoDhlJg==
X-Google-Smtp-Source: AG47ELu/ASJWxNDEjbUiyHeSQeTOI0OKiEUE7Ss1yHELMQoThWpBr2Fg6ZcxelboFUi4PLqOMhNmsw==
X-Received: by 2002:a17:902:7401:: with SMTP id
	g1-v6mr21322981pll.4.1521643912204; 
	Wed, 21 Mar 2018 07:51:52 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1184:a1c1:eb3f:f249:aed1?
	([2601:202:4000:1184:a1c1:eb3f:f249:aed1])
	by smtp.gmail.com with ESMTPSA id
	e62sm9914967pfl.117.2018.03.21.07.51.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 21 Mar 2018 07:51:51 -0700 (PDT)
To: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>,
	openembedded-devel@lists.openembedded.org
References: <1521603377-34881-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
	<1521603377-34881-8-git-send-email-huangqy.fnst@cn.fujitsu.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <aa2cefaa-74cf-2b09-7b00-e6329d9b66e9@gmail.com>
Date: Wed, 21 Mar 2018 07:51:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1521603377-34881-8-git-send-email-huangqy.fnst@cn.fujitsu.com>
Subject: Re: [meta-python][PATCH] python-cython: 0.27.3 -> 0.28.1
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
X-List-Received-Date: Wed, 21 Mar 2018 14:51:51 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 03/20/2018 08:36 PM, Huang Qiyu wrote:
> Upgrade python-cython from 0.27.3 to 0.28.1.

I have a 0.28.0 update in stagging/master-next. please wait for merge to
master-next to rebase.

- armin
>
> Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
> ---
>  meta-python/recipes-devtools/python/python-cython.inc                 | 4 ++--
>  .../python/{python-cython_0.27.3.bb => python-cython_0.28.1.bb}       | 0
>  2 files changed, 2 insertions(+), 2 deletions(-)
>  rename meta-python/recipes-devtools/python/{python-cython_0.27.3.bb => python-cython_0.28.1.bb} (100%)
>
> diff --git a/meta-python/recipes-devtools/python/python-cython.inc b/meta-python/recipes-devtools/python/python-cython.inc
> index dee647e..5a69cd0 100644
> --- a/meta-python/recipes-devtools/python/python-cython.inc
> +++ b/meta-python/recipes-devtools/python/python-cython.inc
> @@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e23fadd6ceef8c618fc1c65191d846fa"
>  PYPI_PACKAGE = "Cython"
>  BBCLASSEXTEND = "native nativesdk"
>  
> -SRC_URI[md5sum] = "6149238287d662bd5d5e572482252493"
> -SRC_URI[sha256sum] = "6a00512de1f2e3ce66ba35c5420babaef1fe2d9c43a8faab4080b0dbcc26bc64"
> +SRC_URI[md5sum] = "c549effadb52d90bdcb1affc1e5dbb97"
> +SRC_URI[sha256sum] = "152ee5f345012ca3bb7cc71da2d3736ee20f52cd8476e4d49e5e25c5a4102b12"
>  
>  inherit pypi
>  
> diff --git a/meta-python/recipes-devtools/python/python-cython_0.27.3.bb b/meta-python/recipes-devtools/python/python-cython_0.28.1.bb
> similarity index 100%
> rename from meta-python/recipes-devtools/python/python-cython_0.27.3.bb
> rename to meta-python/recipes-devtools/python/python-cython_0.28.1.bb


