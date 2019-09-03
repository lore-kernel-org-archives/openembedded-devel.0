Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
	[209.85.214.173])
	by mail.openembedded.org (Postfix) with ESMTP id 364127CED3
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Sep 2019 02:40:34 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id bd8so895054plb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Sep 2019 19:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-language;
	bh=otYwEKXRBeccKSimI+FVS59LPb7dW4CDm/Oal5AsbjY=;
	b=L11QUxXKAtC+7NUrCIRwTSnEvjxsuUEy5sbQf7BaMMuXfCG4xomkAw7sMzVIdK4ryq
	qicQmo41RfoixLZlg3v40pqxaaxBJ9d9x1WaEC7yrN82kpZFamzChu9e6lzBXDniO4en
	TP08cs7a+66d6PGf0LBwD3gbelDsuSYJI6zXLzmzDANEhz2wjcnbJ0jfal14O0iLKdc/
	cVuVCAf8fdHkblkdFTxfcaSUURMeiMbsB7qgyJNyhNMWYRx3qYb+UwrEjHz9V6DEh9dP
	HBqT3jBmmPhc78sN89GUA7BUA1NjvGj7Z4cyaDikdKA0ZZ3QDuolRYUPOT1+cSaMIeVG
	NIYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language;
	bh=otYwEKXRBeccKSimI+FVS59LPb7dW4CDm/Oal5AsbjY=;
	b=K6QIra6kIGSLrEtytJ266AsN1HX364QAVBDynGIy3t7zBj/+8I7IiUr6v2GVdofvK/
	PxbGrNrckrx46kYMCRLkOh2y26EIZiuaN2FJWKAzSBjxSJJWhQgoiloXdIVRak8mIQOa
	GVsvVHBq5HnzHdTOyHcU/L92ZbGeGMWs+FhVgLrijxsfSPSUzg5ZMUYLLmi1XxEcV22p
	WqJpG5TjLnZJJSddj0ABU+H83sbreZ4uov5VERqNok7ANWBBfowA1HgsJoOdc28Drf4K
	0EzAVvgcNwqlMO6sbg21qHicOYbodkAXP+LKFk+lEzxWnQR0FD6inVBqcF0vtpCMYcZ3
	OpBA==
X-Gm-Message-State: APjAAAWzXHGPizuUpCaIvjEnXwoXihhN2Udnsrul9ff4e1ibm6esh4O3
	j6WyT+58G/X+SnH6jY5wLyMBGyza
X-Google-Smtp-Source: APXvYqyeC4i3MRDt7GvpZT2eJKLAXUenHnBIxrMyWLCmP9swTmkOj2NU3HSZt95eMNKlyYUzDjSFdw==
X-Received: by 2002:a17:902:9a07:: with SMTP id
	v7mr33433306plp.245.1567478435167; 
	Mon, 02 Sep 2019 19:40:35 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:8d1e:9a6d:fc3a:2e51?
	([2601:202:4180:c33:8d1e:9a6d:fc3a:2e51])
	by smtp.gmail.com with ESMTPSA id
	a186sm17511680pge.0.2019.09.02.19.40.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 02 Sep 2019 19:40:34 -0700 (PDT)
To: Martin Jansa <martin.jansa@gmail.com>, Khem Raj <raj.khem@gmail.com>
References: <cover.1563719996.git.akuster808@gmail.com>
	<CAMKF1sqTednsK5Rvw+F-_wE_1x7GL=jP483T7HRsLNrwP6G-pQ@mail.gmail.com>
	<CA+chaQfCXcEy+Fy_KGLDMiyW-u6wAGcpZzA9MQS2t6uQ1M-cFw@mail.gmail.com>
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
Message-ID: <9ba822ab-0769-b4e2-ddbb-dac53dccd6a8@gmail.com>
Date: Mon, 2 Sep 2019 19:40:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQfCXcEy+Fy_KGLDMiyW-u6wAGcpZzA9MQS2t6uQ1M-cFw@mail.gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [warrior] 0/8] patch review
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
X-List-Received-Date: Tue, 03 Sep 2019 02:40:34 -0000
Content-Language: en-US
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

merged.

On 9/2/19 4:47 AM, Martin Jansa wrote:
> This PR is still only in warrior-next, can this be merged to warrior
> before the current PR gets merged to warrior-next (or warrior)?
>
> On Sun, Jul 21, 2019 at 4:48 PM Khem Raj <raj.khem@gmail.com
> <mailto:raj.khem@gmail.com>> wrote:
>
>     On Sun, Jul 21, 2019 at 7:41 AM Armin Kuster <akuster808@gmail.com
>     <mailto:akuster808@gmail.com>> wrote:
>     >
>     > Patch comments window closes on Wednesday.
>     >
>
>     series looks fine to me
>
>     > The following changes since commit
>     8d5dcd6522e9d15e68637b6d7dda0401f9bb91d0:
>     >
>     >   turbostat: copy bits.h from kernel to turbostat (2019-06-16
>     08:15:44 -0700)
>     >
>     > are available in the git repository at:
>     >
>     >   https://git.openembedded.org/meta-openembedded-contrib
>     stable/warrior-nmut
>     >   http://cgit.openembedded.org//log/?h=stable/warrior-nmut
>     >
>     > Adrian Bunk (2):
>     >   ndctl: Remove the unnecessary dependency on virtual/kernel
>     >   wireless-regdb: Upgrade 2019.03.01 -> 2019.06.03
>     >
>     > Andreas Müller (2):
>     >   gnome-desktop3: set correct meson gtk doc option
>     >   evince: add patch to fix build with recent gobject-introspection
>     >
>     > Martin Jansa (4):
>     >   ndctl: make MACHINE_ARCH and ignore from libblockdev
>     >   oprofile: make MACHINE_ARCH
>     >   oprofile: drop virtual/kernel dependency and switch back to
>     >     TUNE_PKGARCH
>     >   SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS add lsb, busybox and
>     util-linux for
>     >     phoronix-test-suite
>     >
>     >  ...ove-EvDocumentModel-get-type-function-dec.patch | 33
>     ++++++++++++++++++++++
>     >  meta-gnome/recipes-gnome/evince/evince_3.28.2.bb
>     <http://evince_3.28.2.bb>   | 12 ++++----
>     >  .../gnome-desktop/gnome-desktop3_3.32.0.bb
>     <http://gnome-desktop3_3.32.0.bb>         |  1 +
>     >  ..._2019.03.01.bb <http://2019.03.01.bb> =>
>     wireless-regdb_2019.06.03.bb
>     <http://wireless-regdb_2019.06.03.bb>} |  4 +--
>     >  meta-oe/conf/layer.conf                            |  3 ++
>     >  meta-oe/recipes-core/ndctl/ndctl_v63.bb <http://ndctl_v63.bb> 
>               |  2 +-
>     >  meta-oe/recipes-kernel/oprofile/oprofile_1.3.0.bb
>     <http://oprofile_1.3.0.bb>  |  1 -
>     >  7 files changed, 47 insertions(+), 9 deletions(-)
>     >  create mode 100644
>     meta-gnome/recipes-gnome/evince/evince/0001-libview-Remove-EvDocumentModel-get-type-function-dec.patch
>     >  rename
>     meta-networking/recipes-connectivity/wireless-regdb/{wireless-regdb_2019.03.01.bb
>     <http://wireless-regdb_2019.03.01.bb> =>
>     wireless-regdb_2019.06.03.bb
>     <http://wireless-regdb_2019.06.03.bb>} (91%)
>     >
>     > --
>     > 2.7.4
>     >
>     > --
>     > _______________________________________________
>     > Openembedded-devel mailing list
>     > Openembedded-devel@lists.openembedded.org
>     <mailto:Openembedded-devel@lists.openembedded.org>
>     > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>     -- 
>     _______________________________________________
>     Openembedded-devel mailing list
>     Openembedded-devel@lists.openembedded.org
>     <mailto:Openembedded-devel@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>


