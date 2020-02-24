Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id 3382A6173C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Feb 2020 00:48:32 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id d9so4231196pgu.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Feb 2020 16:48:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:autocrypt:organization:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=TFRGwGnyT8ZRyl1nINHL8HiyAtNZA42f/p9L/ogs+dA=;
	b=Men/CcxnzY4+59y8HcnCRigEgDmZ9Awqlh1tFL1K33cHJt3qvJ2VTQ4KBIw88dNkXe
	bdVnGf19OgFxCwOo/9ccJ8bNt10TC1QZXIFB9SbU3sWCTKVlMFqisaGb9TEmraoj40/b
	AxKR59fHnufxVaCnORFSzi3AHqPdEW5D20hO3qFXFLQfw1kW8sK2bZTfqTjw9SV6zaBj
	D3ROSShmO3bBq8T8J6XrX3aWdccMPwdX8hywC7VFfKmOeXTCAjBzs1/bN4tVOTd+/Eix
	upNITl6HwObcg8/k7CB1MO69WoL4RIdg96cNjK42qUSoAoM5GveHteLXOCd3ISOO1iI3
	uZVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:autocrypt
	:organization:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=TFRGwGnyT8ZRyl1nINHL8HiyAtNZA42f/p9L/ogs+dA=;
	b=CbDBjMHQZ2K2JuZAahUqSJh7qe8smWd2TJ8JB9t+gt5w32k0+hVUMqqUZoMZSSXpSh
	zBe7634E14kuyhrckG2aamv4Cf6897mEl2/FyfhDxPf/RMxuUjFGB0Q/Dg0P3Gp5HM1T
	It2RLMGYVFcMDaZ5lBIxKiy/KDJywXE1CMXykD3W0UjNOjqK6gBKunaEobkwy2rtCf/J
	YqX+H7gFg4ZsUB5VgJu/vMah4G1EZD7CdAihkNWtwMsIv9dVLhOEmBWgMBP3H2yGg7Tr
	enCgfQvrCPnUlXUcV54MKDjG8I5aCbUZ9bOq7qL9U5MovauKYFLRjmy8KAP1dP85o7Mg
	Km9A==
X-Gm-Message-State: APjAAAX+PWmRKs2meEGcG1hOU6A+icmGHrUXlI5HjUENzXg7F60Sjoyp
	OR5+8Wz5trBIviwK7rhwqew=
X-Google-Smtp-Source: APXvYqy0uOR+oM1c/Ws1yZAsmnayGYJtxO+KD+iY1EMpF6KzfSZGy5cEhJ2Q+zjt5JBuytXGG4MPzQ==
X-Received: by 2002:a63:8541:: with SMTP id u62mr3339589pgd.84.1582505313831; 
	Sun, 23 Feb 2020 16:48:33 -0800 (PST)
Received: from ?IPv6:2601:646:9200:4e0::13a9? ([2601:646:9200:4e0::13a9])
	by smtp.gmail.com with ESMTPSA id
	fz21sm10166466pjb.15.2020.02.23.16.48.33
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Sun, 23 Feb 2020 16:48:33 -0800 (PST)
To: Leo Yan <leo.yan@linaro.org>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Sumit Garg <sumit.garg@linaro.org>,
	Daniel Thompson <daniel.thompson@linaro.org>,
	Loic Poulain <loic.poulain@linaro.org>
References: <20200223053549.7056-1-leo.yan@linaro.org>
From: Khem Raj <raj.khem@gmail.com>
Autocrypt: addr=raj.khem@gmail.com; keydata=
	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
Organization: HIMVIS LLC
Message-ID: <3e126d8b-ed9e-3e5b-5fa7-61e043c10355@gmail.com>
Date: Sun, 23 Feb 2020 16:48:32 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200223053549.7056-1-leo.yan@linaro.org>
Subject: Re: [meta-oe][PATCH v2] luajit: Upgrade to 2.1.0-beta3
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
X-List-Received-Date: Mon, 24 Feb 2020 00:48:33 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 2/22/20 9:35 PM, Leo Yan wrote:
> Since luajit 2.1.0-beta3 can support architecture aarch64 and the old
> misses to support aarch64, the patch upgrades to luajit 2.1.0-beta3.
> 
> Signed-off-by: Leo Yan <leo.yan@linaro.org>
> ---
>  .../luajit/{luajit_2.0.5.bb => luajit_git.bb}        | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
>  rename meta-oe/recipes-devtools/luajit/{luajit_2.0.5.bb => luajit_git.bb} (88%)
> 
> diff --git a/meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb b/meta-oe/recipes-devtools/luajit/luajit_git.bb
> similarity index 88%
> rename from meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb
> rename to meta-oe/recipes-devtools/luajit/luajit_git.bb
> index 93128dda8..afa60dba7 100644
> --- a/meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb
> +++ b/meta-oe/recipes-devtools/luajit/luajit_git.bb
> @@ -3,12 +3,9 @@ LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=10a96c93403affcc34765f4c2612bc22"
>  HOMEPAGE = "http://luajit.org"
>  
> -PV .= "+git${SRCPV}"
> -SRCREV = "02b521981a1ab919ff2cd4d9bcaee80baf77dce2"
> -SRC_URI = "git://luajit.org/git/luajit-2.0.git;protocol=http \
> -           file://0001-Do-not-strip-automatically-this-leaves-the-stripping.patch \
> -           file://clang.patch \
> -"
> +PV = "2.1.0+${SRCPV}"

I think we will endup in trouble when 2.1.0 releases, so perhaps we
should leave room for  sorting 2.1.0 higher than whatever we do now
perhaps PV = ""2.0.5+2.1.0-beta3" would be workable.

> +SRCREV = "8271c643c21d1b2f344e339f559f2de6f3663191"
> +SRC_URI = "git://luajit.org/git/luajit-2.0.git;protocol=http;branch=v2.1"
>  
>  S = "${WORKDIR}/git"
>  
> @@ -90,8 +87,7 @@ FILES_${PN}-dev += "${libdir}/libluajit-5.1.a \
>  "
>  FILES_luajit-common = "${datadir}/${BPN}-${PV}"
>  
> -# Aarch64/mips64/ppc/ppc64/riscv64 is not supported in this release
> -COMPATIBLE_HOST_aarch64 = "null"
> +# mips64/ppc/ppc64/riscv64 is not supported in this release
>  COMPATIBLE_HOST_mipsarchn32 = "null"
>  COMPATIBLE_HOST_mipsarchn64 = "null"
>  COMPATIBLE_HOST_powerpc = "null"
> 

