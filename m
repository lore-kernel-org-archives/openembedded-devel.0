Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id 126CE7DBDD
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Apr 2019 14:57:46 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id o5so5179696pls.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Apr 2019 07:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=pUVsYFkBEflfKj0Xzt8mWhENZFiCVI5qdoJh8NAMxok=;
	b=g0ans0aMqe8YEidTEjoUXPhZS0SSArQfZyyo+WMh8ag1WuwG513MNBseD76qG5p/2u
	Eo4o+tlWga3584m3Troy6RTCe+6h0+UiGCs7KNCyAbr4SBfmTmU0oOxruVzZTPhWPt3C
	uXEBR7irb3cYBX6RdmQJttJZdkF4NHUgDw8kzJ+zejkTFBs/qu4x+VoEAWq0W0LaND2A
	ytDY26g85MtJjN3eBUkZwo3WyEzmFwPtcgroFGyNv/mnx8k9sHfHv2+egIL0g4WtWGZE
	CwatGpJYAUu1KCcCr25X4jRRWBamIpH1EYMXuIDqATOu4T2u7l8kj4QJc9I0Qii/V6h/
	2P6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=pUVsYFkBEflfKj0Xzt8mWhENZFiCVI5qdoJh8NAMxok=;
	b=PU3Dcd7PqTd/Wdf0t74zZazCUiLaLzO8W9OFWUOnovXPwLtn7i6DVXsU2nr6CfnlML
	Z7kWuAvPfvSgkOKa1mJXdVP+MiVfYY9PkW0AtrioxCw29KfNISy76GzwaTCcpRf09QcR
	h+P2r3HunOM1GgzW589fwcDbyhwI9ziEbXVYE9HkcV4DsHhSOAdb8tOhGJmZGtaX3LNq
	2b9sJgXAYXnfGsi/xjfKO/sI80GJx6nxeZqahgax6He3Lz/4jLe+F+QZpYBj2wHeFzN4
	tLNXJHKmjth+ftXKy0MRkV/Vgvd7vlZIdyb1uLJveUxN0lZLLuh6azoOz6dXomdEk/Pb
	N/Jg==
X-Gm-Message-State: APjAAAV/zbgQLhrG6iCV5ZtlHjPpIw9OU4+L+UETtTg9K0/PMoSP6pq/
	A5do5YjnWd8C1dEOyEWNAIlTgqA9
X-Google-Smtp-Source: APXvYqy/K521Sz4gFq/kygVs/U+K5lhoBXB5/iOVLW6ZTaIjpOpgn10wqWPpoNNcKt/Woq8wKXjZuw==
X-Received: by 2002:a17:902:6949:: with SMTP id
	k9mr4873992plt.59.1556549867831; 
	Mon, 29 Apr 2019 07:57:47 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:9822:f4b8:acd7:c3a3?
	([2601:202:4180:c33:9822:f4b8:acd7:c3a3])
	by smtp.gmail.com with ESMTPSA id
	l9sm14097290pgq.48.2019.04.29.07.57.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 Apr 2019 07:57:47 -0700 (PDT)
To: Sean Nyekjaer <sean@geanix.com>, openembedded-devel@lists.openembedded.org
References: <20190429131914.123617-1-sean@geanix.com>
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
Message-ID: <32ba7bfc-2556-0707-fd27-51d44338aa52@gmail.com>
Date: Mon, 29 Apr 2019 07:57:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190429131914.123617-1-sean@geanix.com>
Subject: Re: [PATCH] cannelloni: new package, CAN to ethernet proxy
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
X-List-Received-Date: Mon, 29 Apr 2019 14:57:47 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 4/29/19 6:19 AM, Sean Nyekjaer via Openembedded-devel wrote:
> Tool for sending SocketCAN messages
> over Ethernet tunnel.
>
> Signed-off-by: Sean Nyekjaer <sean@geanix.com>

Thanks for the patch. One question is what version is this for?

Version by hash is not optimal. Can you add PV or change the recipe name
to include the version?

- armin
> ---
>  .../cannelloni/cannelloni_git.bb                  | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>  create mode 100644 meta-oe/recipes-connectivity/cannelloni/cannelloni_git.bb
>
> diff --git a/meta-oe/recipes-connectivity/cannelloni/cannelloni_git.bb b/meta-oe/recipes-connectivity/cannelloni/cannelloni_git.bb
> new file mode 100644
> index 000000000..43c04ef34
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/cannelloni/cannelloni_git.bb
> @@ -0,0 +1,15 @@
> +SUMMARY = "a SocketCAN over Ethernet tunnel"
> +HOMEPAGE = "https://github.com/mguentner/cannelloni"
> +LICENSE = "GPLv2"
> +
> +SRC_URI = "git://github.com/mguentner/cannelloni.git;protocol=https"
> +SRCREV = "44080bb021d1a143e6906f2ec4610513c4e1cece"
> +
> +LIC_FILES_CHKSUM = "file://gpl-2.0.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> +
> +inherit cmake
> +
> +S = "${WORKDIR}/git"
> +
> +PACKAGECONFIG ??= "lksctp-tools"
> +PACKAGECONFIG[lksctp-tools] = "-DSCTP_SUPPORT=true, -DSCTP_SUPPORT=false, lksctp-tools"


