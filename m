Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id EF7E37C0E0
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Feb 2019 16:00:18 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id gn14so107648plb.10
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Feb 2019 08:00:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=tdlZNDE8L3kskfCMi/c1OQlMzzPCbhNpylYDL0slWs8=;
	b=gGlVheSmDQ9hMLQ8+dPP/RXHbGznYA1JW6Uw7MzglDqIhxu6wtcYUMppYQpOj+/R6F
	FFi3ks73aeFyruvVECbqIN4fnkkqCRN9Wui8LLm6rfw7v+mBG66fZ3uLFy506E9VicuN
	x5CQ3TQ+GpCoRmhSYdVT6hqIYqKVroVwG+nXG0LDccq6jG1iHJXh0aP5FelS5pSFbVdc
	fQgEOoJw5V6fz04Bz0WoZdU9+rIE2T/+hOdyodDtChK67wlDGgLyIm8kKC44hEDkRFLh
	RnmLA+OZbUHVqhzlFerHRL6sb8sNDkvSs/mL1N+K1FlQajlTigYMcsa8+QSmOk9oIleI
	6FeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=tdlZNDE8L3kskfCMi/c1OQlMzzPCbhNpylYDL0slWs8=;
	b=rsR1ouh+sEhKahkgofLbuGeCIfNDnlZwsTxRmrP77JIshbm4T7vw0S0Hsi48dkDeRw
	9tzet3r8bohYlD4zNzMvVt2l0zqbShsNEW9QjkNyUEhMjYUA5Sua7z0Go15F7ZlZkGdG
	mpgu4eerdH8nYdXpfo+9OytoTtZPIOzpY3VqkQ0B4Y23XrA287UW3Tfe/1/oSFAa0GiP
	GgtMZfNYQ2NKeNdaRLCuedt1q2H4oRas9zzcuWBLqfpjE5TYesnZjRJP8Aa3fRdueiNx
	VDbiyL2SoZB+MzxGZhVKZbgIHQ0tKo7H/dVvFObLZXI5ZkhkNfkYRjbbcjZ4YrP5GMt4
	p3UQ==
X-Gm-Message-State: AHQUAuaLRVvHGrdeFmv6ztnYlNd/lTmkPqzciGb6AUbhc1gfE3a03FTK
	MS31rWcGraf6qlG7tiAXqtxKD0H7MtY=
X-Google-Smtp-Source: AHgI3IbML+ji2HMgdfmFwkPMn1XVRt2Kw2m7XkJYNWBa1xgnca1bpB7JYOqQt34UUljqLkErZIR42w==
X-Received: by 2002:a17:902:12e:: with SMTP id 43mr55665plb.31.1549296019523; 
	Mon, 04 Feb 2019 08:00:19 -0800 (PST)
Received: from ?IPv6:2601:202:4180:c33:40c2:82ac:4641:f878?
	([2601:202:4180:c33:40c2:82ac:4641:f878])
	by smtp.gmail.com with ESMTPSA id f64sm1501823pfh.0.2019.02.04.08.00.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Feb 2019 08:00:18 -0800 (PST)
To: Adrian Bunk <bunk@stusta.de>, openembedded-devel@lists.openembedded.org
References: <20190204150204.18007-2-bunk@stusta.de>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <e8244752-a10d-1ae1-5b9b-2854532e4a24@gmail.com>
Date: Mon, 4 Feb 2019 08:00:18 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190204150204.18007-2-bunk@stusta.de>
Subject: Re: [meta-networking][thud][PATCH] wireless-regdb: update 2018.05.31 -> 2018.10.24
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
X-List-Received-Date: Mon, 04 Feb 2019 16:00:19 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 2/4/19 7:02 AM, Adrian Bunk wrote:
> Signed-off-by: Adrian Bunk <bunk@stusta.de>

This is a big jump. Is this a bug fix only update ?

- armin
> ---
>  .../{wireless-regdb_2018.05.31.bb => wireless-regdb_2018.10.24.bb}    | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-networking/recipes-connectivity/wireless-regdb/{wireless-regdb_2018.05.31.bb => wireless-regdb_2018.10.24.bb} (91%)
>
> diff --git a/meta-networking/recipes-connectivity/wireless-regdb/wireless-regdb_2018.05.31.bb b/meta-networking/recipes-connectivity/wireless-regdb/wireless-regdb_2018.10.24.bb
> similarity index 91%
> rename from meta-networking/recipes-connectivity/wireless-regdb/wireless-regdb_2018.05.31.bb
> rename to meta-networking/recipes-connectivity/wireless-regdb/wireless-regdb_2018.10.24.bb
> index 2b990db3c..e1aa9a517 100644
> --- a/meta-networking/recipes-connectivity/wireless-regdb/wireless-regdb_2018.05.31.bb
> +++ b/meta-networking/recipes-connectivity/wireless-regdb/wireless-regdb_2018.10.24.bb
> @@ -5,8 +5,8 @@ LICENSE = "ISC"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
>  
>  SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz"
> -SRC_URI[md5sum] = "0cbbdc21186c76cf58aba01b03f3dc5b"
> -SRC_URI[sha256sum] = "e1dfbc3b97771373077f430c3c05082fae883145b37db5b2cfd12c56676fbe7b"
> +SRC_URI[md5sum] = "b81bd1f6525a4806a707881aa3dda63f"
> +SRC_URI[sha256sum] = "0d3e845ac77d21aac9b88642c3dd043a83e3920d706b63d5e5c31dffdbec9116"
>  
>  inherit bin_package allarch
>  


