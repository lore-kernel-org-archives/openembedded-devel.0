Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
	[209.85.216.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8362760665
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jan 2020 17:34:01 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id d5so3138039pjz.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jan 2020 09:34:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:autocrypt:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=oFQrGkMvEf+cmePDiUy2QzMJWAT6YJi/NpbNa8mXflg=;
	b=k8CEV6WmvW9SmwYkdvxzkIsIdFwvU+/KEulQxXixRXQt581XJPNqIyY/O/ytMhXfJm
	UJQyeFHmL9wPWHSlEflNE1lDAAfYyLof/3mA4QoIqRaOUFeZkzLzUyLfWPqV9a52lPe6
	zAiBwtYHpiY70Hig5dx3zsE47MVXg6dqEJHbtktMhEoOAJf+FqwjDC8RUgfSLlu9pqRZ
	TIbgc+2M5IuUpkz1Sv+Kag7DnJAWdcNz60+ui5+OJuW6xZoLWZvSP4AycCbXplHiqO1k
	MCC4GBBOqnTe2KlUrieodjotZg9NKaVzxXC8MYBGr0+ITi/79+z6trp9IY3p7k4uS5u1
	ckdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=oFQrGkMvEf+cmePDiUy2QzMJWAT6YJi/NpbNa8mXflg=;
	b=ND7rDso3FxVhnInVD+FYH6YHrNVqWTkoCKFJ1OvC71lr2h4UJBbpJrTkLGq/nozBQI
	qpqS+LcDaL+FVSSQhP6JhJVrwaWV/Joy9myhovkkVBf8Qr8E/q0m3frDZTL2j8jDWZ7q
	f8pHYQvUhKDg8/kdGpnrr4+kOzYonABHr1PC9UN0Ye8sRTwM2Dh0Ngug63z0weu1e9LK
	RzJMN46NM3y90DygjWe1YYWIwGeTMNw4aqBRwkL7wA0tHmj186DgPjzopnBANEGbOI6k
	87B/f/6Y4l3btPAX+SEGKtNrVIPI8uZOqOnacYqhjOGIASvCY8vG5UVi+DObTmRbMN14
	bEKg==
X-Gm-Message-State: APjAAAXrQKEIh7X314TBx+zUfttA3dUDLVJksJZFdYfR9qjxOFmdvMbP
	9dexIzu4wJ0k2Fv+Vx5CieUOwZd+
X-Google-Smtp-Source: APXvYqzK+0iaHMgaD1jb3OdQgcAq2Gs79pjD3HRbJ3UnKeWwRtGsgHWJBpBDRW2enYjEpEiGNC/HXg==
X-Received: by 2002:a17:902:8f91:: with SMTP id
	z17mr11208207plo.234.1580492042504; 
	Fri, 31 Jan 2020 09:34:02 -0800 (PST)
Received: from ?IPv6:2601:202:4180:a5c0:9979:cdb6:7624:d076?
	([2601:202:4180:a5c0:9979:cdb6:7624:d076])
	by smtp.gmail.com with ESMTPSA id u2sm10722855pgj.7.2020.01.31.09.34.01
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Fri, 31 Jan 2020 09:34:02 -0800 (PST)
To: Peter Kjellerstedt <pkj@axis.com>,
	openembedded-devel@lists.openembedded.org
References: <20200130210409.29802-1-pkj@axis.com>
From: akuster808 <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	xsFNBFnlUP4BEADpKf+FQdLykenQXKk8i6xJNxDow+ypFeVAy8iFJp7Dsev+BtwUFo8VG7hx
	Jmd71vHMw+coBetWC3lk+IKjX815Ox0puYXQVRRtI+yMCgd6ib3oGxoQ8tCMwhf9c9/aKjaz
	mP97lWgGHbiEVsDpjzmMZGlJ6pDVZzxykkJExKaosE46AcA8KvfhRQg5zRyYBtinzs8Zu8AP
	aquZVHNXxPwjKPaSEEYqQjFeiNgFTavV+AhM2dmPmGUWCX9RZisrqA4slGwEB0srMdFf12Zg
	mD35Y9jZ80qpu5LPtJCFcsaAlebqR+dg36pIpiRR+olhN1wmC6LYP1vw6uMEYBjkTa2Rnb6+
	C4FDzCJD4UCrUvLMNeTW810DY0bjMMj3SfmSGSfQUssaaaTXCVlLGuGxyCr/kza1rHaXMKum
	Ek4EFj1fyn7AfkSLEHfJfY4sO1tpgigvs4eD/4ZSQEXSu/TjVvyKx4EvUbhlGMRyH2CPwD/H
	7DFF8tcVtJvCwUUW+zKtjxjSSLrhniNMXAOQJZ6CdaqCe4OyJQT5aRdr+FWbBRjpaRCCf5nf
	dTc88NMU9PrBT3vu0QJ5WNPO6MJpnb+d8iMNLZAz8tv8JMm2l+sMcNKSJ6lhX8peoBsfMVqc
	FgiykEO0fUt7DCbUYR5tLjM/3E5tHvTjMooVJyOxoufVLYtTtQARAQABzSFha3VzdGVyODA4
	IDxha3VzdGVyODA4QGdtYWlsLmNvbT7CwX0EEwEIACcFAlnlUP4CGyMFCQlmAYAFCwkIBwIG
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
	oRoyDxDOwU0EWeVQ/gEQALNHwj5VSPdnvXy1RXUuH+rclMx4x8zaqDyY0YqHfA7b/d8Y0VAt
	Y6YpzDeFTwD8A0Wfb7kZ2mlDIE6ODCB71uT/E3C6b+FiiN+lgzslznjUW+9l8ddDhRrC8HMG
	37vrXF5h++PTXUKEKUlkDib1w093tu3mlJXUvIAzl8CEHkptF6Br0L9XxFwuWoNUfjT9IorQ
	0SVIhvq5PhVAITXUD5fD7/N8B4TYegmHFRo1UaaKSnSHwlJJkzKpeWOH8QTYrP0RHxX86Obv
	IZuwbAo3F3oojcvLJt9NxWnbEmEALkleklLZnukgu7q5Wp1VDwhUbMFTLb6qmnBa/Xi30uOk
	0l1TMHDbeQswvQDOZBAMukSRqyBetKxQ3iTfZ/3z1ubQRcVDbVlMDScSHQq0LK3F9yMOMM/6
	0QPqJjl13xn/+Bn7WJiAIXXwzAV7uo6i0khFfjDtCDQ40aeffqOLxp1yMLkc3EKJGcQ5F6O2
	ycEf4QXCYUbMXjxB0EJB8y7z+xOi5Mmd/pPlVmZ2gQK84NAL90p7n7jRlyf3gOUY+JOl4c5e
	UFiIhOzmuqNrvPOiZ02GXh6SGUU5y7IgSoIKvXSFgHAn2OG/tcspBmkyv6IuNVpmbmEgYn4I
	Rnt40UXVQkxTh0dENFhk2cjunMYozV/OqYCgmZLFSeJd8kAo4yn+yOtNABEBAAHCwWUEGAEI
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
Message-ID: <ea500f22-d505-d82b-b0c8-c264945f6354@gmail.com>
Date: Fri, 31 Jan 2020 09:34:00 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200130210409.29802-1-pkj@axis.com>
Subject: Re: [meta-oe][zeus][PATCH 1/2] libldb: Do not require the "pam" distro feature to be enabled
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
X-List-Received-Date: Fri, 31 Jan 2020 17:34:01 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 1/30/20 1:04 PM, Peter Kjellerstedt wrote:
> From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
>
> It was only added because samba was a dependency, but was not removed
> again when the dependency on samba was removed in commit 6207331f.
>
> This effectively reverts commit a190c2e3.
I have an update to this package staged. I apply this on top of that.

https://git.openembedded.org/meta-openembedded-contrib/commit/?h=stable/zeus-nut&id=f64c2d691ea597aa6221e3d7706a4d022e07bfea

- armin
>
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-networking/recipes-support/libldb/libldb_1.5.5.bb | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/meta-networking/recipes-support/libldb/libldb_1.5.5.bb b/meta-networking/recipes-support/libldb/libldb_1.5.5.bb
> index b19c964d8..9a93e66b6 100644
> --- a/meta-networking/recipes-support/libldb/libldb_1.5.5.bb
> +++ b/meta-networking/recipes-support/libldb/libldb_1.5.5.bb
> @@ -36,8 +36,7 @@ LIC_FILES_CHKSUM = "file://pyldb.h;endline=24;md5=dfbd238cecad76957f7f860fbe9ada
>  SRC_URI[md5sum] = "339a41ac9efaec680e6d1469dd9aa35b"
>  SRC_URI[sha256sum] = "199f5861aa863f538ec66d5fa95ecc13254a2030c53daf0e47363fa9ba235c68"
>  
> -inherit waf-samba distro_features_check
> -REQUIRED_DISTRO_FEATURES = "pam"
> +inherit waf-samba
>  
>  S = "${WORKDIR}/ldb-${PV}"
>  


