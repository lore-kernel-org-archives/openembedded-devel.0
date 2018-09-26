Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id D41FA6007A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Sep 2018 05:20:06 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id q19-v6so12378410pgn.10
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Sep 2018 22:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=qmWY9RTmq2mNutXToIeMMUkbsH0l2+7Vy0qTjURDXww=;
	b=fYqbKvMv/ydmQDO8ZMLfFCNf8X+bC5UdyQLcDx8Yoecy/nja4qF4vPqT26GGF30Exu
	eUmqBs3qRRqEMIwyv6AQs/g6rgDuubDsxme7jhTwwGB9bfUDNRQWvEV662kT0MAUnQ2C
	cuzMqH8EfVu7Nbsm7CJDWnfiyBLb7R4QVaicNQ3jzsKlgF4eE1tsnirAtdZct92WG5cS
	3rlxnskdh46vxqZPY9Se0zhUSGGFBHd3NppXFUB8AlpS9K+OriOyRBOr1CvUGtojeAyW
	2gjx6fZM0ThORIRDWXn9F8jK2wlznmDzC+V+fubHI3rL9YVGmAFl9a5iDawCTp2mL8Dr
	1qPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=qmWY9RTmq2mNutXToIeMMUkbsH0l2+7Vy0qTjURDXww=;
	b=nn6uNV0Ro48oxLGEOtYquoCxJwwKyh6Ix7UXgflJZZQQDPN0gmYpBTz8fpwUUkAY+h
	ggBDABlbvBPY6ZFZBzfFXwtoh96dW9FTMYn8kjC0JihIsiOgprqKCoCC/mbCcqktwj45
	fv99NH2V1PjabfPLJ3RbpBzCrH6BNTvigGEX5eg0AU39EVfdnSsBa0BOIN4P6U/qxo55
	lxqOqd9+1l2zFfuLNKo/q1GPvvQ3Yk6rLcvmcWgkR6dhG1Q3sYUWePreLzyUFhFMhHbb
	r+0rrCTRHwrsVptgCBYbuoumUhiQhHz/jnsGIUPXIEyXtJRoEFYfQCsw0fk9DXQEgBIj
	d3Hg==
X-Gm-Message-State: ABuFfoiXaJSxZlV5zFDvs+MBqDBgE5RW2ba5GJqdKmS7uEYTTY+sM4A7
	G3vsTtFUrnQkzN9sobR1QA0=
X-Google-Smtp-Source: ACcGV63XP8gfy7owrk2VPahNB9yXn0m1xWaR9JxpV41zy+SVUfsRbKQaGVZyDfuI3iE49sql3gXmug==
X-Received: by 2002:a62:7043:: with SMTP id
	l64-v6mr4394863pfc.65.1537939207788; 
	Tue, 25 Sep 2018 22:20:07 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:48c:9f78:37fc:8835?
	([2601:202:4180:c33:48c:9f78:37fc:8835])
	by smtp.gmail.com with ESMTPSA id
	l185-v6sm9949574pga.5.2018.09.25.22.20.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 25 Sep 2018 22:20:06 -0700 (PDT)
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
References: <20180926041449.40951-1-raj.khem@gmail.com>
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
Message-ID: <61f68a4a-8bf5-c382-e91e-b709305c722b@gmail.com>
Date: Tue, 25 Sep 2018 22:20:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180926041449.40951-1-raj.khem@gmail.com>
Cc: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@googlemail.com>
Subject: Re: [PATCH] layers: Update layer compatibility to thud
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
X-List-Received-Date: Wed, 26 Sep 2018 05:20:07 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 09/25/2018 09:14 PM, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Andreas Müller <schnitzeltony@googlemail.com>
> Cc: Derek Straka <derek@asterius.io>
> Cc: Tim Orling <TicoTimo@gmail.com>
> Cc: Hongxu Jia <hongxu.jia@windriver.com>
> Cc: Armin Kuster <akuster808@gmail.com>
> Cc: Joe MacDonald <joe_macdonald@mentor.com>
> Cc: Andrea Adami <andrea.adami@gmail.com>
> ---
>  meta-filesystems/conf/layer.conf                       | 2 +-
>  meta-gnome/conf/layer.conf                             | 2 +-
>  meta-initramfs/conf/layer.conf                         | 2 +-
>  meta-multimedia/conf/layer.conf                        | 2 +-
>  meta-networking/conf/layer.conf                        | 2 +-
>  meta-networking/recipes-support/netperf/netperf_git.bb | 2 +-
>  meta-oe/conf/layer.conf                                | 2 +-
>  meta-oe/recipes-dbs/mongodb/mongodb_git.bb             | 7 +++----
Hang on, the mongodb nor the netperf have anything to do 'thud'.

what are those changes for?

>  meta-perl/conf/layer.conf                              | 2 +-
>  meta-python/conf/layer.conf                            | 2 +-
>  meta-webserver/conf/layer.conf                         | 2 +-
>  meta-xfce/conf/layer.conf                              | 2 +-
>  12 files changed, 14 insertions(+), 15 deletions(-)
>
> diff --git a/meta-filesystems/conf/layer.conf b/meta-filesystems/conf/layer.conf
> index dbcff42d44..002f099760 100644
> --- a/meta-filesystems/conf/layer.conf
> +++ b/meta-filesystems/conf/layer.conf
> @@ -15,4 +15,4 @@ LAYERVERSION_filesystems-layer = "1"
>  
>  LAYERDEPENDS_filesystems-layer = "core openembedded-layer"
>  
> -LAYERSERIES_COMPAT_filesystems-layer = "sumo"
> +LAYERSERIES_COMPAT_filesystems-layer = "thud"
> diff --git a/meta-gnome/conf/layer.conf b/meta-gnome/conf/layer.conf
> index e6e9532b41..e9d0785b1d 100644
> --- a/meta-gnome/conf/layer.conf
> +++ b/meta-gnome/conf/layer.conf
> @@ -14,7 +14,7 @@ LAYERVERSION_gnome-layer = "1"
>  
>  LAYERDEPENDS_gnome-layer = "core openembedded-layer networking-layer"
>  
> -LAYERSERIES_COMPAT_gnome-layer = "sumo"
> +LAYERSERIES_COMPAT_gnome-layer = "thud"
>  
>  # Sanity check for meta-gnome layer.
>  # Setting SKIP_META_GNOME_SANITY_CHECK to "1" would skip the bbappend files check.
> diff --git a/meta-initramfs/conf/layer.conf b/meta-initramfs/conf/layer.conf
> index 97afc9374e..bd92ddfbc2 100644
> --- a/meta-initramfs/conf/layer.conf
> +++ b/meta-initramfs/conf/layer.conf
> @@ -16,7 +16,7 @@ BBFILE_PATTERN_meta-initramfs := "^${LAYERDIR}/"
>  BBFILE_PRIORITY_meta-initramfs = "8"
>  LAYERDEPENDS_meta-initramfs = "core"
>  
> -LAYERSERIES_COMPAT_meta-initramfs = "sumo"
> +LAYERSERIES_COMPAT_meta-initramfs = "thud"
>  
>  SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
>    dracut->virtual/kernel \
> diff --git a/meta-multimedia/conf/layer.conf b/meta-multimedia/conf/layer.conf
> index cfedf2f6b6..e2a7701c33 100644
> --- a/meta-multimedia/conf/layer.conf
> +++ b/meta-multimedia/conf/layer.conf
> @@ -29,4 +29,4 @@ LAYERVERSION_multimedia-layer = "1"
>  
>  LAYERDEPENDS_multimedia-layer = "core"
>  
> -LAYERSERIES_COMPAT_multimedia-layer = "sumo"
> +LAYERSERIES_COMPAT_multimedia-layer = "thud"
> diff --git a/meta-networking/conf/layer.conf b/meta-networking/conf/layer.conf
> index e594b7b957..d36ff5bf95 100644
> --- a/meta-networking/conf/layer.conf
> +++ b/meta-networking/conf/layer.conf
> @@ -17,7 +17,7 @@ LAYERDEPENDS_networking-layer = "core"
>  LAYERDEPENDS_networking-layer += "openembedded-layer"
>  LAYERDEPENDS_networking-layer += "meta-python"
>  
> -LAYERSERIES_COMPAT_networking-layer = "sumo"
> +LAYERSERIES_COMPAT_networking-layer = "thud"
>  
>  LICENSE_PATH += "${LAYERDIR}/licenses"
>  
> diff --git a/meta-networking/recipes-support/netperf/netperf_git.bb b/meta-networking/recipes-support/netperf/netperf_git.bb
> index f0e0f9cf1f..b6c8027b87 100644
> --- a/meta-networking/recipes-support/netperf/netperf_git.bb
> +++ b/meta-networking/recipes-support/netperf/netperf_git.bb
> @@ -13,7 +13,7 @@ SRC_URI="git://github.com/HewlettPackard/netperf.git \
>           file://vfork.patch \
>           file://init"
>  
> -SRCREV = "f482bab49fcedee46fc5b755da127f608325cd13"
> +SRCREV = "bcb868bde7f0203bbab69609f65d4088ba7398db"
>  
>  S = "${WORKDIR}/git"
>  
> diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
> index 1a43575304..64c888d51d 100644
> --- a/meta-oe/conf/layer.conf
> +++ b/meta-oe/conf/layer.conf
> @@ -29,7 +29,7 @@ LAYERVERSION_openembedded-layer = "1"
>  
>  LAYERDEPENDS_openembedded-layer = "core"
>  
> -LAYERSERIES_COMPAT_openembedded-layer = "sumo"
> +LAYERSERIES_COMPAT_openembedded-layer = "thud"
>  
>  LICENSE_PATH += "${LAYERDIR}/licenses"
>  
> diff --git a/meta-oe/recipes-dbs/mongodb/mongodb_git.bb b/meta-oe/recipes-dbs/mongodb/mongodb_git.bb
> index bcb15e6c5b..dae1125265 100644
> --- a/meta-oe/recipes-dbs/mongodb/mongodb_git.bb
> +++ b/meta-oe/recipes-dbs/mongodb/mongodb_git.bb
> @@ -10,9 +10,9 @@ DEPENDS = "openssl libpcre libpcap zlib boost curl python \
>  
>  inherit scons dos2unix siteinfo pythonnative
>  
> -PV = "4.0.1+git${SRCPV}"
> -#v4.0.1
> -SRCREV = "54f1582fc6eb01de4d4c42f26fc133e623f065fb"
> +PV = "4.0.2+git${SRCPV}"
> +#v4.0.2
> +SRCREV = "fc1573ba18aee42f97a3bb13b67af7d837826b47"
>  SRC_URI = "git://github.com/mongodb/mongo.git;branch=v4.0 \
>             file://0001-Tell-scons-to-use-build-settings-from-environment-va.patch \
>             file://0001-Use-long-long-instead-of-int64_t.patch \
> @@ -20,7 +20,6 @@ SRC_URI = "git://github.com/mongodb/mongo.git;branch=v4.0 \
>             file://0002-Add-a-definition-for-the-macro-__ELF_NATIVE_CLASS.patch \
>             file://arm64-support.patch \
>             file://0001-IntelRDFPMathLib20U1-Check-for-__DEFINED_wchar_t.patch \
> -           file://disable-hw-crc32-on-arm64-s390x.patch \
>             file://0001-Support-deprecated-resolver-functions.patch \
>             "
>  SRC_URI_append_libc-musl ="\
> diff --git a/meta-perl/conf/layer.conf b/meta-perl/conf/layer.conf
> index ece6dd05eb..b2bb379105 100644
> --- a/meta-perl/conf/layer.conf
> +++ b/meta-perl/conf/layer.conf
> @@ -15,4 +15,4 @@ LAYERVERSION_perl-layer = "1"
>  
>  LAYERDEPENDS_perl-layer = "core openembedded-layer"
>  
> -LAYERSERIES_COMPAT_perl-layer = "sumo"
> +LAYERSERIES_COMPAT_perl-layer = "thud"
> diff --git a/meta-python/conf/layer.conf b/meta-python/conf/layer.conf
> index 7089071faf..321d51bee7 100644
> --- a/meta-python/conf/layer.conf
> +++ b/meta-python/conf/layer.conf
> @@ -14,6 +14,6 @@ LAYERVERSION_meta-python = "1"
>  
>  LAYERDEPENDS_meta-python = "core openembedded-layer"
>  
> -LAYERSERIES_COMPAT_meta-python = "sumo"
> +LAYERSERIES_COMPAT_meta-python = "thud"
>  
>  LICENSE_PATH += "${LAYERDIR}/licenses"
> diff --git a/meta-webserver/conf/layer.conf b/meta-webserver/conf/layer.conf
> index f205ef23b1..aaa3a95c4f 100644
> --- a/meta-webserver/conf/layer.conf
> +++ b/meta-webserver/conf/layer.conf
> @@ -17,7 +17,7 @@ LAYERVERSION_webserver = "1"
>  
>  LAYERDEPENDS_webserver = "core openembedded-layer"
>  
> -LAYERSERIES_COMPAT_webserver = "sumo"
> +LAYERSERIES_COMPAT_webserver = "thud"
>  
>  LICENSE_PATH += "${LAYERDIR}/licenses"
>  
> diff --git a/meta-xfce/conf/layer.conf b/meta-xfce/conf/layer.conf
> index bee8e70441..f5f44d64bc 100644
> --- a/meta-xfce/conf/layer.conf
> +++ b/meta-xfce/conf/layer.conf
> @@ -18,7 +18,7 @@ LAYERDEPENDS_xfce-layer += "gnome-layer"
>  LAYERDEPENDS_xfce-layer += "multimedia-layer"
>  LAYERDEPENDS_xfce-layer += "meta-python"
>  
> -LAYERSERIES_COMPAT_xfce-layer = "sumo"
> +LAYERSERIES_COMPAT_xfce-layer = "thud"
>  
>  SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
>    xfce4-session->machine-host \


