Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id C1EA56BC44
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Nov 2019 22:53:46 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id q16so6389734plr.10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Nov 2019 14:53:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=AnBIB01av6vs5qoZvPKEhGfOS5tzK2bUDni2lAFzGmY=;
	b=VB//Z2ZUAWfGWZf+Sztx94pQDSIpIIZTDoDnTOBwbfGI3WgH3vQzfz23+F03n2EH/Q
	tNCUZ6NOqMX4kmiFWXNLH2764OBgo3JujHqDjde7d8Z2lQXnqRhAaHng0DwGhegJfVoM
	Jx+bbNmoKf/yJ+VEkUG6te8fh5d+Q9S2u8yJHlaNT5qCut5YwHgqKGg5YiKMf8DbrKKq
	/fEin0/2FoIkELYbtngf33BktT7uvPAU3ZyVkxVEbSQmux6T5hbSUUH8RQZ3swfliMse
	6oxm+y12FoMM56XhvV3TLnKaicngY4rj+/CRDb68hoJzqBlqUujLs8eYIoB8GPW5yW1H
	YUdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=AnBIB01av6vs5qoZvPKEhGfOS5tzK2bUDni2lAFzGmY=;
	b=fGCGTk/kdYGxWDF5OGoZ4jvRax60bljaHdTr80Uzk5al8OKPp/f325m1Jyo4nkzv8I
	Uk3/qaYJQVhRBYgIFjbMMswpbBLO/M/ld773kf4hvdUKbVUI9gbHr/tx81La07Ebpu0L
	sgNpfYA7Z3AFc/yOxphIp2zRDyQXOqrTL6NQaftkBZzeaH8y2T1EXHDXgGBDkb5Sn5XW
	aS3Vn+pCPXUlzYpzZKNa3d/nn9XA2WoD5MI6mht5U19QJmzwFe4LdGYnbYnzENacomoM
	40F3Lokn816WOoJyZnMytYOFyevYCbXME+mRx1bWy4T+bwEGGgVVlivthvHR69RJ15Ca
	x3uA==
X-Gm-Message-State: APjAAAU+Pyh/BaSVp1BgYPnW7cXUExQS1aLw1gtnoxzMD2h8D9/kP06i
	UDZkB9SqzlmXz6Bf4m/OcmlSrqug
X-Google-Smtp-Source: APXvYqx3WeO0IVRKniRxDxq/ggz/Sumzqg6c+pKLQfb4RI+Mo4M0nwrNj1TT+zpXeumrKyUZ1mlawg==
X-Received: by 2002:a17:902:7290:: with SMTP id
	d16mr6387209pll.340.1574895227450; 
	Wed, 27 Nov 2019 14:53:47 -0800 (PST)
Received: from ?IPv6:2601:202:4180:a5c0:88c1:6db9:7b72:a2e8?
	([2601:202:4180:a5c0:88c1:6db9:7b72:a2e8])
	by smtp.gmail.com with ESMTPSA id
	d8sm17433383pfo.47.2019.11.27.14.53.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 27 Nov 2019 14:53:47 -0800 (PST)
To: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@gmail.com>,
	openembedded-devel@lists.openembedded.org
References: <20191127144116.18751-1-schnitzeltony@gmail.com>
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
Message-ID: <4c895365-4d8a-ea0d-d56c-8d12f03d3241@gmail.com>
Date: Wed, 27 Nov 2019 14:53:45 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191127144116.18751-1-schnitzeltony@gmail.com>
Subject: Re: [zeus][PATCH 1/2] networkmanager: Upgrade 1.18.2 -> 1.18.4
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
X-List-Received-Date: Wed, 27 Nov 2019 22:53:46 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 11/27/19 6:41 AM, Andreas Müller wrote:
> From: Adrian Bunk <bunk@stusta.de>
>
> Signed-off-by: Adrian Bunk <bunk@stusta.de>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> (cherry picked from commit 1db745db41e31c61448743842104d92a61e7ddfb)

Why?

is this a bug fix only?

- armin
> ---
>  .../{networkmanager_1.18.2.bb => networkmanager_1.18.4.bb}    | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-networking/recipes-connectivity/networkmanager/{networkmanager_1.18.2.bb => networkmanager_1.18.4.bb} (97%)
>
> diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.18.2.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.18.4.bb
> similarity index 97%
> rename from meta-networking/recipes-connectivity/networkmanager/networkmanager_1.18.2.bb
> rename to meta-networking/recipes-connectivity/networkmanager/networkmanager_1.18.4.bb
> index 0d6e1a0b0..085807c4c 100644
> --- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.18.2.bb
> +++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.18.4.bb
> @@ -31,8 +31,8 @@ SRC_URI_append_libc-musl = " \
>      file://musl/0001-Fix-build-with-musl-systemd-specific.patch \
>      file://musl/0002-Fix-build-with-musl.patch \
>  "
> -SRC_URI[md5sum] = "ca1e6175c6ba97ca1adf65a67861ccd9"
> -SRC_URI[sha256sum] = "4dd97ca974cd1f97990746527258f551f4257cbf011fecd01d10b7d74a6fa5c3"
> +SRC_URI[md5sum] = "fc86588a3ae54e0d406b560a312d5a5d"
> +SRC_URI[sha256sum] = "a3bd07f695b6d3529ec6adbd9a1d6385b967e9c8ae90946f51d8852b320fd05e"
>  
>  S = "${WORKDIR}/NetworkManager-${PV}"
>  


