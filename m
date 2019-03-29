Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 5FBA37D006
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Mar 2019 22:09:57 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id c8so1661934pfd.10
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Mar 2019 15:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=DmcQSD85lML9XUowBQF/kAyOf/P7pNAPIrBisvv/C7M=;
	b=oUkX/QtOXMUHSLhtAPvKv5qjZHeaEtuHqQG3WjoF1z30Yu4jrYazuzpJiLpwj5Cviz
	sKp4/AN8ocq5naDIS4zky2vkJNMtGkJcV3odWlUf2VAF1wPhayatMoyajN6lbfsvUdYk
	Y7Fddbe9ECuomKe5/NIdOLFPDDV53FdSoR9iaIBvSkbWHY5BDoG1mTa9IStfp+8wMcYe
	fiiL8a0sGbVLuDT4GEX8/IdvmEkHgKNuDp4oFfA7vJbL6ZbSVCVLWFpWyAYOn0eZ2T4o
	36lquIKhQXd1ekzwKDgpjiZDi/bMaSpliGKI3Hnv2bqGKBQwRk3aPnySXchIyMOmAHj8
	I/oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=DmcQSD85lML9XUowBQF/kAyOf/P7pNAPIrBisvv/C7M=;
	b=izy5XQdxcDhQOKEYN/4n5DqbtRLexraCsiImuMO9ksn9kLvGSeivIHdYwkXgTm/VmD
	+Rae7CaRRbnDV4HKhCo29GnDXKpv/UVYvDPG0n9JE6W6Nuij6iocs51pTmhsj+keyPdy
	uwMdve5aCjX1SHMDt86o27nl+6fSm0YUbRCaEOONuAC+gXn9VCwzPJ8isgGblHGjXkx/
	xxhOJS5BD1RTbA4lZdLrzoDXVhzK7je2A4PptF2zDCq/DhY31Bi1RMV8NQLUy2HUHNxP
	pQ3FjBT/xYAz+3NXPd0E0UsGCrMyW36pEYZ4Hd+2cTgoelMX2y1pJKiab96rxbfnkjeP
	WPJQ==
X-Gm-Message-State: APjAAAVBfSfbbbOzkNujCfSe4nFVedKWrNQg+ptFl5HXJbgFws6/TY4C
	fpsZUw1vNbo7O32mYtoFSv/ugtSp
X-Google-Smtp-Source: APXvYqw44FlAdJ4ZcpIqbpVk1PBWz0vRAMqY3m4SbHQ/b4Kzwj6Cj9H1LBFIpa2W4EhubXLmXBdvsw==
X-Received: by 2002:a62:5e46:: with SMTP id s67mr49953649pfb.126.1553897398205;
	Fri, 29 Mar 2019 15:09:58 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:e49f:a080:8dd:cb67?
	([2601:202:4180:c33:e49f:a080:8dd:cb67])
	by smtp.gmail.com with ESMTPSA id
	h19sm4935042pfd.130.2019.03.29.15.09.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 29 Mar 2019 15:09:57 -0700 (PDT)
To: Joe Slater <joe.slater@windriver.com>,
	openembedded-devel@lists.openembedded.org
References: <20190329220230.101196-1-joe.slater@windriver.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <5c9fea9b-309a-2bbc-b106-c8df9c470aaa@gmail.com>
Date: Fri, 29 Mar 2019 15:09:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190329220230.101196-1-joe.slater@windriver.com>
Subject: Re: [meta-oe][PATCH 1/1] libssh2: move to version 1.8.2
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
X-List-Received-Date: Fri, 29 Mar 2019 22:09:57 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 3/29/19 3:02 PM, Joe Slater wrote:
> Includes fixes for CVE-2019-3858, -3859, -3860, -3861, and -3862.
thinks for this additional info

- armin
>
> Signed-off-by: Joe Slater <joe.slater@windriver.com>
> ---
>  .../recipes-support/libssh2/{libssh2_1.8.0.bb => libssh2_1.8.2.bb}   | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-support/libssh2/{libssh2_1.8.0.bb => libssh2_1.8.2.bb} (84%)
>
> diff --git a/meta-oe/recipes-support/libssh2/libssh2_1.8.0.bb b/meta-oe/recipes-support/libssh2/libssh2_1.8.2.bb
> similarity index 84%
> rename from meta-oe/recipes-support/libssh2/libssh2_1.8.0.bb
> rename to meta-oe/recipes-support/libssh2/libssh2_1.8.2.bb
> index 94bfb8f..fe853cd 100644
> --- a/meta-oe/recipes-support/libssh2/libssh2_1.8.0.bb
> +++ b/meta-oe/recipes-support/libssh2/libssh2_1.8.2.bb
> @@ -8,8 +8,9 @@ LICENSE = "BSD"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=c5cf34fc0acb44b082ef50ef5e4354ca"
>  
>  SRC_URI = "http://www.libssh2.org/download/${BP}.tar.gz"
> -SRC_URI[md5sum] = "3d1147cae66e2959ea5441b183de1b1c"
> -SRC_URI[sha256sum] = "39f34e2f6835f4b992cafe8625073a88e5a28ba78f83e8099610a7b3af4676d4"
> +
> +SRC_URI[md5sum] = "616efd99af3d9ef731a26bed6cee9593"
> +SRC_URI[sha256sum] = "088307d9f6b6c4b8c13f34602e8ff65d21c2dc4d55284dfe15d502c4ee190d67"
>  
>  inherit autotools pkgconfig
>  


