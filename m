Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 3706D79A70
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Oct 2018 21:19:29 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id v133-v6so6400275pgb.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Oct 2018 14:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=pkTZrPwFrCFBf7lAMsKI2UVNraSegyBxIyRIxJbiiDk=;
	b=mCD50EWb6d7Gd/iuBlOxjSqO7yM6IXv/68+tUaqai3kRENYD8CHWj90ljw6P2PUdMl
	pMJ71OTv060NhbyQUxe+bagxBiBDHpExZi+JpQeknV9jVEZIs71LNMSEmvKbO0EH1KmN
	gtEvBkRDin1mpXBTu3nQKyGBVbY3FTDs4Abnr/QKWSxTR5W3tzGZa4jEcvEtYdYXfWmd
	TKkgv/OLOkX178eUl1bNgdRnKTJ4KX9qaRORJr9C9210MPlaojFSlIodreyFTDgfZtX/
	3Af96kS4C58ErZ6ECMof/tHhTgrzBWokTE5aT+M4j3LjlwI1z+ljgZVv2hSr5b+bzyYK
	zyoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=pkTZrPwFrCFBf7lAMsKI2UVNraSegyBxIyRIxJbiiDk=;
	b=m2qTnF+M8pl+2LoIOt4U7z2TpRrD0rRZQH+u7qW9kEOZg8GkVGsKp8uwDFrNxjrIjD
	zIJ1YtW1owSmTCBZEnyqzPAGe21h6NZCTwUThfB+fVqfbeKyIWPIq453PR463TLpdq7g
	zpWfSq0RBOH7d7j6AbvfHO2YxDb/CqSgsGfOa9NN94qAtw5GHBsWGqH1qu3OXv2agPrK
	W2LzQxluBTsF9FiYSXaAqx/wlhsnymAB/TalwcZ4+cNhBetv7MqkcDKuGCS/zoF04HC+
	777B/nCUMhw0PVkZ/Lfuxn2rxRiSfQ0RBh2U4i2LSEzuZo23rg9rOAlexJQz4knVVzE8
	GdAw==
X-Gm-Message-State: ABuFfoiDXMgXk0N8cxx7Bp8/4YW28nNco4+e44471okRC0lh9Am+2WEW
	nmg+QBRcudpeXXHwVr++uKWEJ8Pm
X-Google-Smtp-Source: ACcGV62LfF/XHCoYNbCOnKUoWOZgpT1WanyUQdA1SeM99ivbblGmC4g/XNH9CmN6i7nqh//NLmlSTA==
X-Received: by 2002:a63:82c6:: with SMTP id
	w189-v6mr6896338pgd.211.1539379169920; 
	Fri, 12 Oct 2018 14:19:29 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:1074:2cb7:7274:2f54?
	([2601:202:4180:c33:1074:2cb7:7274:2f54])
	by smtp.gmail.com with ESMTPSA id
	a11-v6sm2618627pgw.54.2018.10.12.14.19.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 12 Oct 2018 14:19:29 -0700 (PDT)
To: =?UTF-8?B?VmVzYSBKw6TDpHNrZWzDpGluZW4=?= <dachaac@gmail.com>,
	openembedded-devel@lists.openembedded.org
References: <1539357981-3675-1-git-send-email-akuster808@gmail.com>
	<1539357981-3675-2-git-send-email-akuster808@gmail.com>
	<0256528b-d1aa-75f2-f660-b5e37fddecf3@gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
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
Message-ID: <dd9a8840-ec81-78ef-2739-4879d3ad539f@gmail.com>
Date: Fri, 12 Oct 2018 14:19:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <0256528b-d1aa-75f2-f660-b5e37fddecf3@gmail.com>
Subject: Re: [meta-oe][PATCH 1/5] directfb: add x11 to REQUIRED_DISTRO_FEATURES
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
X-List-Received-Date: Fri, 12 Oct 2018 21:19:29 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 10/12/2018 10:52 AM, Vesa Jääskeläinen wrote:
> On 12/10/2018 18.26, Armin Kuster wrote:
>
>> package has depends on vlc and gtk
>>
>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>> ---
>>   meta-oe/recipes-graphics/directfb/directfb.inc | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta-oe/recipes-graphics/directfb/directfb.inc
>> b/meta-oe/recipes-graphics/directfb/directfb.inc
>> index 96aa311..cf8f19a 100644
>> --- a/meta-oe/recipes-graphics/directfb/directfb.inc
>> +++ b/meta-oe/recipes-graphics/directfb/directfb.inc
>> @@ -32,7 +32,8 @@ LDFLAGS_append_arm =
>> "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -f
>>     BINCONFIG = "${bindir}/directfb-config"
>>   -inherit autotools binconfig-disabled pkgconfig
>> +inherit autotools binconfig-disabled pkgconfig distro_features_check
>> +REQUIRED_DISTRO_FEATURES = "x11"
>>   
> Wrong method?

How about sending a the "Correct method"?

- armin
>
> Quote from:
> https://github.com/DirectFB/directfb
>
> "Optionally, depending on the configuration you want:
>
>    FBDev
>      - Linux kernel 2.2.x or newer with working frame buffer device
>        (check /proc/fb) for the fbdev system.
>
>    SDL
>      - libSDL (Simple Direct Media Layer) for the sdl system.
>
>    X11
>      - libX11 (X11 client library) for the X11 system (libx11-dev and
> libxext-dev packages)."
>


