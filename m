Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id BE1F57D1E9
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Jul 2019 02:42:53 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id y15so6837226pfn.5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 07 Jul 2019 19:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=WhaJumdG3gJBCTbMQVg0pqjsXNf+FfaIZlPqo/uLo58=;
	b=p87VgRhiwsM2VxtrNkW2IxftPzLS/XMnx3baFQxX65KNx/MGi4smfHWOMSvN8lUtLT
	vW7ZOhndJC2xDABPNxOLknhaBdRDh6ZYyYXEGkAi1cxM9JjPqyqGLwvrTjx2bLNkzrIn
	mAhp+nuxq9mOgD04Jaq69h/Tyl5BcbUvaxP9QxDG0Mw1S1SGwbjAvyVAW+IwDdUgeXWN
	9VHKZJrWexjJMCm0EpJqeFdL7m5oq7rV7vcBNjtuBReliPHewuwp4mZUe0L9ThbE0C/2
	ZCtlJQTWHEmwbNn8ijb4WM1Sb81OWXcn3g/N4Qtce8NVMo8xP0a6iKLubjy1hUwPqQOh
	R8Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=WhaJumdG3gJBCTbMQVg0pqjsXNf+FfaIZlPqo/uLo58=;
	b=ImQxMj4u8D28MSj/SOuJjsMejAi04D/8UZ4cdFUwnbzsx0QtSgk8g39n/6SGs3UIXs
	VU5XqLLYrhPow2L5HLEi4cm6xYjEyeR/z9HCSycw2Qbnz/+X5awV+NfWgOytlJmpJxUQ
	tDIJOovysFwSelDeq3O6oBsxqCF0v39QCIDAJSkTt3UcdaYC4i819Anuhdmu2iHGO3K7
	JrZsCef6uT3PEoymP3tK6yHFWlJu2lygLcqpoTQn0/A2WRlUUHNTlHeMz7oYXwHyJODz
	3j50FdJLRtJTQGcMYddjWD96eWoLrq73fJvDgDzDOeEY3ocnZ8NSlH7+xHHc71hIc8YV
	cuJg==
X-Gm-Message-State: APjAAAUGxoEcuAZLO8JR+Poy1NPNKXYbcSi+35ihCT5R4SidEuLpgqck
	WWQDzXkujENDrO45mepr4WYrr+d6L4A=
X-Google-Smtp-Source: APXvYqwIeftDJVZdIjSmhpzxqcMyIbsm2k4T4pm49coK3QvlnV/zbO+mwCJADqOFSIqbRWawN3JB/w==
X-Received: by 2002:a65:6294:: with SMTP id f20mr10906083pgv.349.1562553774706;
	Sun, 07 Jul 2019 19:42:54 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:c2e:f46a:e59c:dae7?
	([2601:202:4180:c33:c2e:f46a:e59c:dae7])
	by smtp.gmail.com with ESMTPSA id
	y12sm19547563pfn.187.2019.07.07.19.42.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 07 Jul 2019 19:42:54 -0700 (PDT)
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>,
	openembedded-devel@lists.openembedded.org
References: <20190708004749.11268-1-open.source@oleksandr-kravchuk.com>
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
Message-ID: <33ea17ac-1dc1-c16e-8040-f9c90e20921d@gmail.com>
Date: Sun, 7 Jul 2019 19:42:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190708004749.11268-1-open.source@oleksandr-kravchuk.com>
Subject: Re: [PATCH][meta-networking] uftp: update to 4.9.11
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
X-List-Received-Date: Mon, 08 Jul 2019 02:42:53 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 7/7/19 5:47 PM, Oleksandr Kravchuk wrote:
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>  .../recipes-support/tnftp/tnftp_20190602.bb   | 39 +++++++++++++++++++
>  .../uftp/{uftp_4.9.9.bb => uftp_4.9.11.bb}    |  4 +-
>  2 files changed, 41 insertions(+), 2 deletions(-)
>  create mode 100644 meta-networking/recipes-support/tnftp/tnftp_20190602.bb
>  rename meta-networking/recipes-support/uftp/{uftp_4.9.9.bb => uftp_4.9.11.bb} (77%)

There is a new recipe here too. please submit independently.

- armin
>
> diff --git a/meta-networking/recipes-support/tnftp/tnftp_20190602.bb b/meta-networking/recipes-support/tnftp/tnftp_20190602.bb
> new file mode 100644
> index 000000000..83ad11b0e
> --- /dev/null
> +++ b/meta-networking/recipes-support/tnftp/tnftp_20190602.bb
> @@ -0,0 +1,39 @@
> +SUMMARY = "Enhanced NetBSD ftp client"
> +DESCRIPTION = "tnftp (formerly known as lukemftp) is a port of the NetBSD FTP client \
> +to other systems. It offers many enhancements over the traditional \
> +BSD FTP client, including command-line editing, command-line fetches \
> +of FTP and HTTP URLs (including via proxies), command-line uploads of \
> +FTP URLs, context-sensitive word completion, dynamic progress bar, \
> +IPv6 support, modification time preservation, paging of local and \
> +remote files, passive mode support (with fallback to active mode), \
> +SOCKS support, TIS FWTK gate-ftp server support, and transfer rate \
> +throttling."
> +
> +SECTION = "net"
> +LICENSE = "BSD-4-Clause"
> +
> +DEPENDS = "ncurses"
> +
> +SRC_URI = "ftp://ftp.netbsd.org/pub/NetBSD/misc/tnftp/${BPN}-${PV}.tar.gz \
> +    file://tnftp-autotools.patch \
> +"
> +
> +inherit autotools update-alternatives pkgconfig
> +
> +ALTERNATIVE_PRIORITY = "100"
> +
> +ALTERNATIVE_${PN} = "ftp"
> +ALTERNATIVE_LINK_NAME_${PN} = "${bindir}/ftp"
> +ALTERNATIVE_TARGET_${PN}  = "${bindir}/tnftp"
> +
> +FILES_${PN} = "${bindir}/tnftp"
> +
> +LIC_FILES_CHKSUM = "file://COPYING;md5=6d6796cb166a9bb050958241dad9479e"
> +SRC_URI[md5sum] = "a49fbe752318d5a7893f900046ea00d5"
> +SRC_URI[sha256sum] = "c94a8a49d3f4aec1965feea831d4d5bf6f90c65fd8381ee0863d11a5029a43a0"
> +
> +PACKAGECONFIG ?= "openssl \
> +    ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} \
> +"
> +PACKAGECONFIG[openssl] = "--enable-ssl, --disable-ssl --with-ssl=no, openssl"
> +PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
> diff --git a/meta-networking/recipes-support/uftp/uftp_4.9.9.bb b/meta-networking/recipes-support/uftp/uftp_4.9.11.bb
> similarity index 77%
> rename from meta-networking/recipes-support/uftp/uftp_4.9.9.bb
> rename to meta-networking/recipes-support/uftp/uftp_4.9.11.bb
> index a64d081cf..8b47bd16f 100644
> --- a/meta-networking/recipes-support/uftp/uftp_4.9.9.bb
> +++ b/meta-networking/recipes-support/uftp/uftp_4.9.11.bb
> @@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=d32239bcb673463ab874e80d47fae504"
>  UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/uftp-multicast/files/source-tar/"
>  
>  SRC_URI = "${SOURCEFORGE_MIRROR}/uftp-multicast/source-tar/uftp-${PV}.tar.gz"
> -SRC_URI[md5sum] = "154e2c82a33fd4999040f8836e2dca2c"
> -SRC_URI[sha256sum] = "c04bc75a88fc3d57504269f260be4d0b1bc440508b5a5ca587df6c16b771aa48"
> +SRC_URI[md5sum] = "c0bc86b3067825a3866de9ef80c7451a"
> +SRC_URI[sha256sum] = "2ddc835a35f669d55df27ab6883ba19bb00bc8e4b66897ceaedb160b02246b1a"
>  
>  DEPENDS = "openssl"
>  


