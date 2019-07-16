Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id 023CF7ECCF
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Jul 2019 14:54:33 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id i189so9235532pfg.10
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Jul 2019 07:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=6Gu5p0RgreGRAZKNBViT8Y2uGuw5+uW2EwYqF7gF67w=;
	b=eCuIJf4jbXpKRFe4ZMZSvNB4rWiHnHPRkeRbi/Of7shjByF2FrA8jP7D8ewCiim7OM
	SW7wtoRimjaiYVivIz6aTJlyxisaD8d1jK8iMg1GfVceKXeM5l8l652wl622RmlQsNuf
	aPlyl0ZEbSpC2URR0yZmYdw3l82mIV6OoXsTe+vQonokF/vZ0w1P48I2PPerAQZ2kxtM
	xxZABvWu7y8KF1wTYEIIAB6vIzfKQhs4y65zCrx59KAuSWKSiiDlXbN3Hhokpugg8xAI
	e7fIyqX9xwiLRYlNahZwB1qVLMoPIEfj5vZs350jtS+R6goeE8G9D/XhpwDcmIUVQupU
	lroA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=6Gu5p0RgreGRAZKNBViT8Y2uGuw5+uW2EwYqF7gF67w=;
	b=KhDzUnbINDxiOFzqQK6Jm23n3ouhOb3iVa08/L1xbGZKkzBTBorQNcl/UC7A9QxDEP
	Ivg2QzIYdGgkauFNQtuJ4A9BJ79emmVPlGPNOQOU4/XT+SsJau5fpoxRyJ1oroDOR9/m
	jB92nSOcO/XQlYXGfH1Q6Yh3SZElU6TmGPD2tasAtANybgoQ0LSwcg75844LQZ1lTwdQ
	BWKRYDPbDYuG0+n42MC8hz9aweau6dZBKhkEEGzf1u9LZT2mUlp4C0tD6RzKk8uPtBrz
	Bs/P/yrb7OlvMK/CdaBU3j62N+5gvrHn12w+4RvAbEBS8bNjnIYn/Z9+osU8CmVz92qP
	lAfQ==
X-Gm-Message-State: APjAAAX2TBESwUzh+Eu+UskVJTYMNnZDh9QW9eXRfQcrWkXBgEOVLq3F
	dI4aNddTNq3qoXXH95TNz0Xj8dtq
X-Google-Smtp-Source: APXvYqxMcivLQEJyVrwA3W71q3ShhuZCYuioEOnCq1NXfs5R8l4Wtq1c3mYMM0clHG5deMNY69oSCg==
X-Received: by 2002:a63:6149:: with SMTP id v70mr33078332pgb.64.1563288874510; 
	Tue, 16 Jul 2019 07:54:34 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:60a4:b905:b5f:2007?
	([2601:202:4180:c33:60a4:b905:b5f:2007])
	by smtp.gmail.com with ESMTPSA id
	l4sm20553878pff.50.2019.07.16.07.54.33
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 16 Jul 2019 07:54:33 -0700 (PDT)
To: openembedded-devel@lists.openembedded.org
References: <20190715144901.25305-1-luca@lucaceresoli.net>
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
Message-ID: <dcbe6593-85d8-c238-3e55-6e3a027a8cf9@gmail.com>
Date: Tue, 16 Jul 2019 07:54:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190715144901.25305-1-luca@lucaceresoli.net>
Subject: Re: [meta-filesystems][PATCH 1/4] fuse-exfat: moved to github
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
X-List-Received-Date: Tue, 16 Jul 2019 14:54:34 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 7/15/19 7:48 AM, Luca Ceresoli wrote:
> fuse-exfat has been moved long ago to github. Update URLs.
>
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> ---
>  .../recipes-filesystems/fuse-exfat/fuse-exfat_1.2.3.bb      | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.2.3.bb b/meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.2.3.bb
> index 18fc9cd6f13d..a70653f607f6 100644
> --- a/meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.2.3.bb
> +++ b/meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.2.3.bb
> @@ -3,12 +3,12 @@ DESCRIPTION = "fuse-exfat is a read and write driver implementing the \
>  extended file allocation table as a filesystem in userspace. A mounthelper \
>  is provided under the name mount.exfat-fuse. \
>  "
> -HOMEPAGE = "http://code.google.com/p/exfat/"
> +HOMEPAGE = "https://github.com/relan/exfat"
>  SECTION = "universe/otherosfs"
>  LICENSE = "GPLv2+"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> -SRC_URI = "${DEBIAN_MIRROR}/main/f/fuse-exfat/fuse-exfat_${PV}.orig.tar.gz \
> -"
> +SRC_URI = "https://github.com/relan/exfat/releases/download/v${PV}/${BP}.tar.gz"

IIRC, the tarball are regenerated on github so it has not been a source
we can trust. Using the clone method is recommended in these cases.

- armin
> +
>  DEPENDS = "fuse virtual/libc"
>  RRECOMMENDS_${PN} = "util-linux-mount"
>  


