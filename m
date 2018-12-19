Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id D049D6BAAB
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Dec 2018 15:44:43 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id p8so9652014plo.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Dec 2018 07:44:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=W2VPMSbhurpZQz4Co4TxRRlWD1qZkblxG9SyXr39+Hc=;
	b=ADnsh5hoIdZgvFNb9WaX/Yyby5Neknw+Vfe8qNjHgXYEPPiLw/UnUq6LbY5l/xZFeu
	bSz0Zcv3kCEMb/zkb8fllLmWfGPcj7oUgDFmH5/hAH714VOD0NemQMT0o9E4uNAMhfG2
	aqKm3a0E4VElxxouzfctpmXMjATRZpnjcRZH+fxnyibDhRPAaC7Uwv5nfdhbpZGCgEqA
	5bjaCIOyCcvhLFHlCfNxC6pWT1A9dEkLyzLV3MNw63kUmyFMUmMjMjXt1YJEj28aPdtc
	grNSLNXwuxCWh8JV2gjEIONcpf7fxtza2y4TV2Lp/REyQlWUDMav9PLIMUcH1TAGKlJh
	M9cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=W2VPMSbhurpZQz4Co4TxRRlWD1qZkblxG9SyXr39+Hc=;
	b=lV0QYxnaZy/In2EF1RVZes/4RJYoyDtPqMx6+6W+puNPT6VKkccjrS3FIwtfyzonRw
	RUkDuWgkyO23nL7gW5sSWH3yasgJpWBybTdlsN+LN6j+8uyDe8EFGAQ6gaQBW6OZlVV1
	llf7u9ah7HGadWHbTLDexP/o4N+HoE22GTxN85ktoDYj4cliFDyis9elSWf5cFy9Z/c5
	rs/U1rBEFmgJkJncuHDW1PzzsS+p0D7ISr5D4Uq738bssU42MGjOHKyMdPulbDM54Z+v
	zWKke7AU+7koZuLQJiv5z6mF5AxFXx8UDYAwSpRvBRV9Ksz03SrQr2T7XJOvAfNAHTLC
	NsYw==
X-Gm-Message-State: AA+aEWb4AboSR0HKq5Vig7Ur0A1+vW6qslC2ktFLRPdhVh6+DruGYxlZ
	vLmXCcvV80XFN9IuQXcXWbvjLrvM
X-Google-Smtp-Source: AFSGD/X+j0sosO9KpwzvPtofewQTTSiLqNgpK1TMrpWfEC1jlM2aTvQOaDXG/hfXVPzm4Yj9AdSUXg==
X-Received: by 2002:a17:902:d01:: with SMTP id
	1mr21055880plu.127.1545234284629; 
	Wed, 19 Dec 2018 07:44:44 -0800 (PST)
Received: from ?IPv6:2601:202:4180:c33:a0ac:ef77:794d:67d9?
	([2601:202:4180:c33:a0ac:ef77:794d:67d9])
	by smtp.gmail.com with ESMTPSA id
	p77sm38628625pfi.85.2018.12.19.07.44.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Dec 2018 07:44:43 -0800 (PST)
To: Martin Jansa <martin.jansa@gmail.com>,
	openembedded-devel@lists.openembedded.org
References: <20181219144155.31236-1-Martin.Jansa@gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	mQINBFnlUP4BEADpKf+FQdLykenQXKk8i6xJNxDow+ypFeVAy8iFJp7Dsev+BtwUFo8VG7hx
	Jmd71vHMw+coBetWC3lk+IKjX815Ox0puYXQVRRtI+yMCgd6ib3oGxoQ8tCMwhf9c9/aKjaz
	mP97lWgGHbiEVsDpjzmMZGlJ6pDVZzxykkJExKaosE46AcA8KvfhRQg5zRyYBtinzs8Zu8AP
	aquZVHNXxPwjKPaSEEYqQjFeiNgFTavV+AhM2dmPmGUWCX9RZisrqA4slGwEB0srMdFf12Zg
	mD35Y9jZ80qpu5LPtJCFcsaAlebqR+dg36pIpiRR+olhN1wmC6LYP1vw6uMEYBjkTa2Rnb6+
	C4FDzCJD4UCrUvLMNeTW810DY0bjMMj3SfmSGSfQUssaaaTXCVlLGuGxyCr/kza1rHaXMKum
	Ek4EFj1fyn7AfkSLEHfJfY4sO1tpgigvs4eD/4ZSQEXSu/TjVvyKx4EvUbhlGMRyH2CPwD/H
	7DFF8tcVtJvCwUUW+zKtjxjSSLrhniNMXAOQJZ6CdaqCe4OyJQT5aRdr+FWbBRjpaRCCf5nf
	dTc88NMU9PrBT3vu0QJ5WNPO6MJpnb+d8iMNLZAz8tv8JMm2l+sMcNKSJ6lhX8peoBsfMVqc
	FgiykEO0fUt7DCbUYR5tLjM/3E5tHvTjMooVJyOxoufVLYtTtQARAQABtCFha3VzdGVyODA4
	IDxha3VzdGVyODA4QGdtYWlsLmNvbT6JAj0EEwEIACcFAlnlUP4CGyMFCQlmAYAFCwkIBwIG
	FQgJCgsCBBYCAwECHgECF4AACgkQ7ou0mfRW5/kuhRAAlR2FTq5572jrX5nnPR7AqI2bvSVb
	vqGLlvv739WhghvagbC+tu05QguopAhWW1/DcHK2+QtfIoC9UZrSW4RaO0CCo5sPjqK7l1KT
	ngWX/rGjF6xTF2QN0U/btcpMyVN2CNtVLwsDF9e+GHKoUcnFkP+JP8vHGokN9k6E/c97hLaL
	IJPeKl8LZXc2Efk+MaW1NXkfDJdcp/p+voajbihSQO6OZ/o+x9d2I3ZybKfTZ71+ek5Hxzjz
	g6KkMOI7KJjlmBlrQFAtVbS+CFAKrwkYznE6ggkcmGv3N7DeUBTUR78hf+EZEAM+ajeLMtrG
	rXE00pIb+gLGYPZxba5pCdQ+qWUW38qi9UnIRPm6fq7Ypx1r6XwJvbgCOkhbxo3D4YUdyC0b
	FE9lgrg8htbc9in4j2+hVI6ALswNjLprzXdzdKrd+T3Egx36o3Z/qrYsW2o5/A5sVvvASVKi
	wRPuEKhEhfmiHUPLvuKqhMoymHaz3fg5D2Q8G0gSDkLgeEpAjiWqf4+AGLx+MSDai7DSOsmI
	t61kWxs7cFTB32UrB/TDoVNn3Fm88ZFQpA/bngikE9jgEm045mSY86fNlbFj2mcCd0Ha1i1n
	aYc97RpgfjNMWyHDVHOGrNg/hJjkGa5RsAXkfyBwltHRw0Hj4urUQ3rr8um8PLe43SezPwXA
	oRoyDxC5Ag0EWeVQ/gEQALNHwj5VSPdnvXy1RXUuH+rclMx4x8zaqDyY0YqHfA7b/d8Y0VAt
	Y6YpzDeFTwD8A0Wfb7kZ2mlDIE6ODCB71uT/E3C6b+FiiN+lgzslznjUW+9l8ddDhRrC8HMG
	37vrXF5h++PTXUKEKUlkDib1w093tu3mlJXUvIAzl8CEHkptF6Br0L9XxFwuWoNUfjT9IorQ
	0SVIhvq5PhVAITXUD5fD7/N8B4TYegmHFRo1UaaKSnSHwlJJkzKpeWOH8QTYrP0RHxX86Obv
	IZuwbAo3F3oojcvLJt9NxWnbEmEALkleklLZnukgu7q5Wp1VDwhUbMFTLb6qmnBa/Xi30uOk
	0l1TMHDbeQswvQDOZBAMukSRqyBetKxQ3iTfZ/3z1ubQRcVDbVlMDScSHQq0LK3F9yMOMM/6
	0QPqJjl13xn/+Bn7WJiAIXXwzAV7uo6i0khFfjDtCDQ40aeffqOLxp1yMLkc3EKJGcQ5F6O2
	ycEf4QXCYUbMXjxB0EJB8y7z+xOi5Mmd/pPlVmZ2gQK84NAL90p7n7jRlyf3gOUY+JOl4c5e
	UFiIhOzmuqNrvPOiZ02GXh6SGUU5y7IgSoIKvXSFgHAn2OG/tcspBmkyv6IuNVpmbmEgYn4I
	Rnt40UXVQkxTh0dENFhk2cjunMYozV/OqYCgmZLFSeJd8kAo4yn+yOtNABEBAAGJAiUEGAEI
	AA8FAlnlUP4CGwwFCQlmAYAACgkQ7ou0mfRW5/nNcg//R63cbOS6zLtvdnPub3Ssp1Ft8Wmv
	mni+kccuNApuDV7d63QckYxjAfUv2zYMLpbh87gVbLyCq9ASn552EbfRhTvHdk44CgbHBVcI
	ZBEdZWgRR5ViJakQSYHpP2e5AGNFnx9gSIuRTaa5rvZM+4xeoZ2vJiq93TtaYPr7UFNfK+c4
	vv4C66lkt9l95/I10eSc3RqbOKZW47emlg4X3ygEoB9k2lPrpspyf6sUuSEi0WrlSxoLAr6p
	JG8rTUErYNeXe6JCdL31odDx1Dh5sdKIj2RicUYZNilxu9f1M7jZwf2ra1FGAlKj2ybqmgpZ
	EFteaiCinEYsvDyZyOiWHjAFI+RZIPQQL3AnVp4l7wYD3r9hnqYPww0slyMDcb9262RoFkHq
	dDwxPYarrNjWUpOzxB6bFxOgNRdCTgvQl8Ftk8a/yXB6vHeUSm1vPFCBxQPZytyfOLhEWm0J
	/mkVL0Z6iRK3p1LKnpLYCS4/esL2u7RrhPyCs2SsL58YcQF/g+PpeT9geZ+oyZ/4IQ+TWJoU
	PNHndk8VBTpzrmOaJxrebNL/W6C8JCmbLM11TAUMmHYi9JDytN8Au78hWpDbIdKwg1LeSxpw
	ZZD/OqOc0DBvHOpQhzkSrtR1lVlDV/+9E8J1T4uDhrGmZwYV+4xQetypHax8aAHisYbjXdVa
	8CS2NxU=
Message-ID: <7ecb1c69-dfc4-1e08-391f-78c48bd43bea@gmail.com>
Date: Wed, 19 Dec 2018 07:44:42 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181219144155.31236-1-Martin.Jansa@gmail.com>
Subject: Re: [sumo][meta-oe][PATCH 1/6] geoip: upgrade 1.6.11 -> 1.6.12
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
X-List-Received-Date: Wed, 19 Dec 2018 15:44:44 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 12/19/18 6:41 AM, Martin Jansa wrote:
> From: Changqing Li <changqing.li@windriver.com>
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
Do you want me to add your signoff?

is this a bugfix only update?

- armin
> ---
>  .../recipes-support/geoip/{geoip_1.6.11.bb => geoip_1.6.12.bb}  | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-networking/recipes-support/geoip/{geoip_1.6.11.bb => geoip_1.6.12.bb} (98%)
>
> diff --git a/meta-networking/recipes-support/geoip/geoip_1.6.11.bb b/meta-networking/recipes-support/geoip/geoip_1.6.12.bb
> similarity index 98%
> rename from meta-networking/recipes-support/geoip/geoip_1.6.11.bb
> rename to meta-networking/recipes-support/geoip/geoip_1.6.12.bb
> index 3527d0cba7..4e717e4b95 100644
> --- a/meta-networking/recipes-support/geoip/geoip_1.6.11.bb
> +++ b/meta-networking/recipes-support/geoip/geoip_1.6.12.bb
> @@ -15,7 +15,7 @@ SRC_URI = "git://github.com/maxmind/geoip-api-c.git \
>             http://geolite.maxmind.com/download/geoip/database/GeoLiteCityv6-beta/GeoLiteCityv6.dat.gz;apply=no;name=GeoLiteCityv6-dat \
>             file://run-ptest \
>  "
> -SRCREV = "3169a8a88808c8df862e0b0355f99c738cce9f7e"
> +SRCREV = "4b526e7331ca1d692b74a0509ddcc725622ed31a"
>  
>  SRC_URI[GeoIP-dat.md5sum] = "37c84ead332dda0362a5ac7b049b72d4"
>  SRC_URI[GeoIP-dat.sha256sum] = "79ff1099e96c2dc1c2539c9a18aaa13a9afd085cae477df60d95f1644d42bc07"


