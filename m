Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id 505B46D409
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Mar 2019 21:19:53 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id u9so1780943pgo.7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Mar 2019 14:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=zeWR6nq3SPIdRngEb1uKlTlBXhdeTBqSk4+Gy7HMelY=;
	b=MtZHFg06lXLfZzVJv5EhXL1Ny7LMnrLTeXspQOMa6Zo1AeKjHZSPuv9NiUhv0pr//S
	ZMe24XLH9FVf6nITqvHejXd29nrACuOEVYXNwIKvAQUG2yIP1PiDYQA+F987VG0sm3cH
	6aG9AiGGQPtAS1Crw07iXL+HnB8kgvLTHI7TgnGOBDR0KENY78veZcKmC2eda8uaFJeu
	9zcKMSZ5m1BQjyuY7MLA6GZUVclvoFkfX1u6Yx8RXDLQnlH1y34O6QjnX59rPPPP12A3
	k8wuFP3IRKnmDEciKfkeQ18uzVhq4UY9M9Cozs65hE+viO39KfNAmgsHhDSByPW9oeJ1
	7v+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=zeWR6nq3SPIdRngEb1uKlTlBXhdeTBqSk4+Gy7HMelY=;
	b=M4YkgIktiCeknXoao5vMmNm3zrvIj2p/EI5JjBi0BKXqV3T5XL72hPpxbAmbPwTo9D
	U1Qyt+r2+RPlMk2IwkxtbLEiOEz/+mb9scvaS+mxbzS/ocapS+eKrHbTGtPuSjksD+6i
	npUV7UvCyUs671v0UzK8PyPL0Xh3+ncy+Rsl1yDzQWXoEIHxDgWlpOZE9njCBr0nJQru
	wbII3HFtJeVrbKT6H6jcDr9+lNV5pOWMusDt0FUa60/0rNLfcX65LmoB9G5S+jdw8d3I
	G/Qs9pglHAYmKWlAffT2W0LDrqNsrQi7DyiJ/iLgwWrne5IYpcsR72FHAqulmjELKDv/
	9/3A==
X-Gm-Message-State: APjAAAWuX2/a/0fFOf992nofLhELYPLj1gPNKXV+p21svkfJgAcqldke
	EwZ32aSzeMqwNtSMqzNay1HivXU5
X-Google-Smtp-Source: APXvYqyG55hk3FSdw3Y2Rtl3ZEewnfh/KJsS5FOCZa5+1jtTFSvE0w7Pbts9MF2M1CaJEIMOAAAi/g==
X-Received: by 2002:aa7:8c84:: with SMTP id p4mr10776345pfd.164.1553894394094; 
	Fri, 29 Mar 2019 14:19:54 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:e49f:a080:8dd:cb67?
	([2601:202:4180:c33:e49f:a080:8dd:cb67])
	by smtp.gmail.com with ESMTPSA id
	u13sm7922309pfa.169.2019.03.29.14.19.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 29 Mar 2019 14:19:53 -0700 (PDT)
To: Randy MacLeod <randy.macleod@windriver.com>,
	openembedded-devel@lists.openembedded.org
References: <20190329204710.22747-1-Randy.MacLeod@windriver.com>
	<fc7da65f-74b3-5f54-36ca-16b8c86958a6@windriver.com>
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
Message-ID: <d69338e6-d9ea-8f8d-6a3f-0726340a4028@gmail.com>
Date: Fri, 29 Mar 2019 14:19:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <fc7da65f-74b3-5f54-36ca-16b8c86958a6@windriver.com>
Subject: Re: [PATCH] wolfssl: update to 3.15.8 and use github SRC_URI
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
X-List-Received-Date: Fri, 29 Mar 2019 21:19:53 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 3/29/19 2:15 PM, Randy MacLeod wrote:
> On 3/29/19 4:47 PM, Randy MacLeod wrote:
>> The previous SRC_URI did not work for the new version and
>> when looking at the site, users are required to navigate
>> through a click-through license agreement.
>>
>> Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
>> ---
>>   .../wolfssl/{wolfssl_3.15.7.bb => wolfssl_3.15.8.bb}         | 5 +++--
>
> 4.0 is available but I suspect that's best delayed until
> the 2.8 cycle starts.
>
why?  meta-openembedded  tends to follow a different cutoff

we can always make it not the default.

- armin
> https://www.wolfssl.com/docs/wolfssl-changelog/
>


