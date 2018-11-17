Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 5ED476B512
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Nov 2018 22:49:45 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id t13so3496848pgr.11
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Nov 2018 14:49:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=ZMw1GXLOR3jqoOgsbRwC4RB9YWaHkHx71BQG/ZTGlfc=;
	b=vIal3e4XtRxOEzLv60CKJrw1UMqrK/IYvcLbCFhInYJOubDLIpdAA3d8REjmDm7w0s
	/IQ4Pn2A12Fqnlasun79CChWGnv3JrSi7MPUGq3/NR4Zchrz6cKcOkdIj+u9kb+2RXIW
	2REVswrbGTBW2CBv7h+sqwxXCjPjl9Rs9Ir0oDnJRQZr9f1JUeY6Kdrasi71FyACQg58
	JCQ7KWyifJsLrA7UV8kNeOyJ++w4laNwYLdqmiPb/1X1s6Cjr1locjkOA8/Hth4U1E6j
	oRPRD4vNBOIu56kK2c3v4c7G1QpaEjp8ZKToP69HUU9pO65th62Iq+4ZXZd4ykkX69rF
	Q39Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=ZMw1GXLOR3jqoOgsbRwC4RB9YWaHkHx71BQG/ZTGlfc=;
	b=d7W0rGcXSvIopug7hBqHYDdePZi75UdGTSQk05Bm2ojhyfuCFa2vaPu2Awqf/BZpwG
	hr98EJrpoJc1J2nnKFuTjZ6dX4Z8osOmC/y+SIeqQidxi8YR4Av6V+EQRgajsYXO6YZw
	BAupKWF/CdS3oIuANCCAiR+racQ1xw4gUYs3AsIIqXkhckVdG7sn9bxuDYxtjvR0PlTr
	nZRtAS7z0TwXC6YJAYzNzoAFFyGVfZijDeKa/NZp725H+HfIW/5ixOSJzwAH0/TNFLCj
	MmEac9pdGbG7RYUvPuxr4UiYYLdEdZvAl4W26jWBLNUbysQUpviiSjiA1s9aGsuBgw2S
	qdCA==
X-Gm-Message-State: AGRZ1gIpClXCCkmwFPtNSlK8iqBws1xeEJO8PPFQ6gjwNqeNY2Udjw1Q
	SiCp8/MeLfbmb7hZ1t81XpuFsJDR
X-Google-Smtp-Source: AJdET5ccF4SB5trwSdA7IzN/orbX95w+GByNevCK4G/xI9UoLjYodWAzQqIF3IkNf0E2IGXudeb0DQ==
X-Received: by 2002:aa7:868f:: with SMTP id d15mr7205929pfo.225.1542494985870; 
	Sat, 17 Nov 2018 14:49:45 -0800 (PST)
Received: from ?IPv6:2601:202:4180:c33:c4dc:5c13:84a7:f038?
	([2601:202:4180:c33:c4dc:5c13:84a7:f038])
	by smtp.gmail.com with ESMTPSA id
	e86sm15250548pfb.6.2018.11.17.14.49.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 17 Nov 2018 14:49:45 -0800 (PST)
To: Khem Raj <raj.khem@gmail.com>
References: <1541991419-8898-1-git-send-email-akuster808@gmail.com>
	<1541991419-8898-2-git-send-email-akuster808@gmail.com>
	<CAMKF1sqb0b3ZSyEJqjHzneihiWbbCFyX_McZj6uoJoA_NQbhfw@mail.gmail.com>
	<514c9243-43ba-c695-aa5b-3ee83e7a49e5@gmail.com>
	<CAMKF1srVsLWYVr5JoLJ_u1=g7vgLo4ex6tdyayjeD0EX3FP-hw@mail.gmail.com>
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
Message-ID: <51dc2ff8-7289-4e1c-6c05-819c9bdc5b91@gmail.com>
Date: Sat, 17 Nov 2018 14:49:43 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1srVsLWYVr5JoLJ_u1=g7vgLo4ex6tdyayjeD0EX3FP-hw@mail.gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] ptest: add addition packagegroups and image for ptests
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
X-List-Received-Date: Sat, 17 Nov 2018 22:49:45 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US



On 11/17/18 1:08 PM, Khem Raj wrote:
> On Sat, Nov 17, 2018 at 12:45 PM akuster808 <akuster808@gmail.com> wrot=
e:
>>
>>
>> On 11/17/18 8:15 AM, Khem Raj wrote:
>>> Armin
>>>
>>> This patch is causing problems for musl based world builds (parse)
>> ok. thanks so many combinations.
>>
> looking a bit more this seems to be placed wrongly.
> It sort of creates/expects dependencies on other sub-layers
> to be in bblayers.conf for meta-oe to work. meta-oe
> actually just needs oe-core to work. May be this should
> be redone, by dividing it into independent recipes per
> layer.
err, this should only contain meta-oe recipes.=C2=A0 I built with glibc a=
rm64
which cleaned out all the x86 only packages and then I built x86 to
double check. What I did not do is musl so if there is a glibc only
packages, i would expect that to have issues.

If there are dependencies on other layers than we have a different
problem.=C2=A0 I honestly don't recall if I had the other layers
included/exclude as part of my testing. I only have low power build
systems at home so these build matrices take time to flush out.

Let me double check things.

> will you take care of this?
its my patch we are talking about. I have the problem.

would it be wrong for meta-oe to have dynamic layers ?

- armi
>
>> - armin
>>> RROR: Nothing RPROVIDES 'fwts' (but
>>> /mnt/a/yoe/sources/meta-openembedded/meta-oe/recipes-core/packagegrou=
ps/packagegroup-meta-oe.bb
>>> RDEPENDS on or otherwise requires it)
>>> fwts was skipped: incompatible with host arm-yoe-linux-musleabi (not
>>> in COMPATIBLE_HOST)
>>> NOTE: Runtime target 'fwts' is unbuildable, removing...
>>> Missing or unbuildable dependency chain was: ['fwts']
>>> NOTE: Runtime target 'packagegroup-meta-oe-graphics' is unbuildable, =
removing...
>>> Missing or unbuildable dependency chain was:
>>> ['packagegroup-meta-oe-graphics', 'fwts']
>>> ERROR: Nothing RPROVIDES 'packagegroup-meta-oe-connectivity' (but
>>> /mnt/a/yoe/sources/meta-openembedded/meta-oe/recipes-core/packagegrou=
ps/packagegroup-meta-oe.bb
>>> RDEPENDS on or otherwise requires it)
>>> No eligible RPROVIDERs exist for 'packagegroup-meta-oe-connectivity'
>>> NOTE: Runtime target 'packagegroup-meta-oe-connectivity' is
>>> unbuildable, removing...
>>> Missing or unbuildable dependency chain was:
>>> ['packagegroup-meta-oe-connectivity']
>>> ERROR: Nothing RPROVIDES 'packagegroup-meta-oe-kernel' (but
>>> /mnt/a/yoe/sources/meta-openembedded/meta-oe/recipes-core/packagegrou=
ps/packagegroup-meta-oe.bb
>>> RDEPENDS on or otherwise requires it)
>>> No eligible RPROVIDERs exist for 'packagegroup-meta-oe-kernel'
>>> NOTE: Runtime target 'packagegroup-meta-oe-kernel' is unbuildable, re=
moving...
>>> Missing or unbuildable dependency chain was: ['packagegroup-meta-oe-k=
ernel']
>>> ERROR: Nothing RPROVIDES 'soci-ptest' (but
>>> /mnt/a/yoe/sources/meta-openembedded/meta-oe/recipes-core/packagegrou=
ps/packagegroup-meta-oe.bb
>>> RDEPENDS on or otherwise requires it)
>>> NOTE: Runtime target 'soci-ptest' is unbuildable, removing...
>>> Missing or unbuildable dependency chain was: ['soci-ptest']
>>> ERROR: Nothing RPROVIDES 'openldap-ptest' (but
>>> /mnt/a/yoe/sources/meta-openembedded/meta-oe/recipes-core/packagegrou=
ps/packagegroup-meta-oe.bb
>>> RDEPENDS on or otherwise requires it)
>>> NOTE: Runtime target 'openldap-ptest' is unbuildable, removing...
>>> Missing or unbuildable dependency chain was: ['openldap-ptest']
>>> ERROR: Nothing RPROVIDES 'packagegroup-meta-oe-benchmarks' (but
>>> /mnt/a/yoe/sources/meta-openembedded/meta-oe/recipes-core/packagegrou=
ps/packagegroup-meta-oe.bb
>>> RDEPENDS on or otherwise requires it)
>>> No eligible RPROVIDERs exist for 'packagegroup-meta-oe-benchmarks'
>>> NOTE: Runtime target 'packagegroup-meta-oe-benchmarks' is unbuildable=
,
>>> removing...
>>> Missing or unbuildable dependency chain was: ['packagegroup-meta-oe-b=
enchmarks']
>>> ERROR: Nothing RPROVIDES 'packagegroup-meta-oe-support' (but
>>> /mnt/a/yoe/sources/meta-openembedded/meta-oe/recipes-core/packagegrou=
ps/packagegroup-meta-oe.bb
>>> RDEPENDS on or otherwise requires it)
>>> No eligible RPROVIDERs exist for 'packagegroup-meta-oe-support'
>>> NOTE: Runtime target 'packagegroup-meta-oe-support' is unbuildable, r=
emoving...
>>> Missing or unbuildable dependency chain was: ['packagegroup-meta-oe-s=
upport']
>>> ERROR: Nothing RPROVIDES 'packagegroup-meta-oe-gnome' (but
>>> /mnt/a/yoe/sources/meta-openembedded/meta-oe/recipes-core/packagegrou=
ps/packagegroup-meta-oe.bb
>>> RDEPENDS on or otherwise requires it)
>>> No eligible RPROVIDERs exist for 'packagegroup-meta-oe-gnome'
>>> NOTE: Runtime target 'packagegroup-meta-oe-gnome' is unbuildable, rem=
oving...
>>> Missing or unbuildable dependency chain was: ['packagegroup-meta-oe-g=
nome']
>>> ERROR: Nothing RPROVIDES 'packagegroup-meta-oe-dbs' (but
>>> /mnt/a/yoe/sources/meta-openembedded/meta-oe/recipes-core/packagegrou=
ps/packagegroup-meta-oe.bb
>>> RDEPENDS on or otherwise requires it)
>>> No eligible RPROVIDERs exist for 'packagegroup-meta-oe-dbs'
>>> NOTE: Runtime target 'packagegroup-meta-oe-dbs' is unbuildable, remov=
ing...
>>> Missing or unbuildable dependency chain was: ['packagegroup-meta-oe-d=
bs']
>>> ERROR: Nothing RPROVIDES 'numactl' (but
>>> /mnt/a/yoe/sources/meta-openembedded/meta-oe/recipes-core/packagegrou=
ps/packagegroup-meta-oe.bb
>>> RDEPENDS on or otherwise requires it)
>>> numactl was skipped: incompatible with host arm-yoe-linux-musleabi
>>> (not in COMPATIBLE_HOST)
>>> NOTE: Runtime target 'numactl' is unbuildable, removing...
>>> Missing or unbuildable dependency chain was: ['numactl']
>>> ERROR: Nothing RPROVIDES 'lcdproc' (but
>>> /mnt/a/yoe/sources/meta-openembedded/meta-oe/recipes-core/packagegrou=
ps/packagegroup-meta-oe.bb
>>> RDEPENDS on or otherwise requires it)
>>> lcdproc was skipped: incompatible with host arm-yoe-linux-musleabi
>>> (not in COMPATIBLE_HOST)
>>> NOTE: Runtime target 'lcdproc' is unbuildable, removing...
>>> Missing or unbuildable dependency chain was: ['lcdproc']
>>> ERROR: Nothing RPROVIDES 'packagegroup-meta-oe-ptest' (but
>>> /mnt/a/yoe/sources/meta-openembedded/meta-oe/recipes-core/packagegrou=
ps/packagegroup-meta-oe.bb
>>> RDEPENDS on or otherwise requires it)
>>> No eligible RPROVIDERs exist for 'packagegroup-meta-oe-ptest'
>>> NOTE: Runtime target 'packagegroup-meta-oe-ptest' is unbuildable, rem=
oving...
>>> Missing or unbuildable dependency chain was: ['packagegroup-meta-oe-p=
test']
>>> ERROR: Nothing RPROVIDES 'packagegroup-meta-oe' (but
>>> /mnt/a/yoe/sources/meta-openembedded/meta-oe/recipes-core/packagegrou=
ps/packagegroup-meta-oe.bb
>>> RDEPENDS on or otherwise requires it)
>>> No eligible RPROVIDERs exist for 'packagegroup-meta-oe'
>>> NOTE: Runtime target 'packagegroup-meta-oe' is unbuildable, removing.=
=2E.
>>> Missing or unbuildable dependency chain was: ['packagegroup-meta-oe']=

>>> ERROR: Nothing RPROVIDES 'mcelog-ptest' (but
>>> /mnt/a/yoe/sources/meta-openembedded/meta-oe/recipes-core/packagegrou=
ps/packagegroup-meta-oe.bb
>>> RDEPENDS on or otherwise requires it)
>>> NOTE: Runtime target 'mcelog-ptest' is unbuildable, removing...
>>> Missing or unbuildable dependency chain was: ['mcelog-ptest']
>>> ERROR: Nothing RPROVIDES 'numactl-ptest' (but
>>> /mnt/a/yoe/sources/meta-openembedded/meta-oe/recipes-core/packagegrou=
ps/packagegroup-meta-oe.bb
>>> RDEPENDS on or otherwise requires it)
>>> NOTE: Runtime target 'numactl-ptest' is unbuildable, removing...
>>> Missing or unbuildable dependency chain was: ['numactl-ptest']
>>> ERROR: Nothing RPROVIDES 'packagegroup-meta-oe-navigation' (but
>>> /mnt/a/yoe/sources/meta-openembedded/meta-oe/recipes-core/packagegrou=
ps/packagegroup-meta-oe.bb
>>> RDEPENDS on or otherwise requires it)
>>> No eligible RPROVIDERs exist for 'packagegroup-meta-oe-navigation'
>>> NOTE: Runtime target 'packagegroup-meta-oe-navigation' is unbuildable=
,
>>> removing...
>>> Missing or unbuildable dependency chain was: ['packagegroup-meta-oe-n=
avigation']
>>> ERROR: Nothing RPROVIDES 'packagegroup-meta-oe-core' (but
>>> /mnt/a/yoe/sources/meta-openembedded/meta-oe/recipes-core/packagegrou=
ps/packagegroup-meta-oe.bb
>>> RDEPENDS on or otherwise requires it)
>>> No eligible RPROVIDERs exist for 'packagegroup-meta-oe-core'
>>> NOTE: Runtime target 'packagegroup-meta-oe-core' is unbuildable, remo=
ving...
>>> Missing or unbuildable dependency chain was: ['packagegroup-meta-oe-c=
ore']
>>> ERROR: Nothing RPROVIDES 'packagegroup-meta-oe-multimedia' (but
>>> /mnt/a/yoe/sources/meta-openembedded/meta-oe/recipes-core/packagegrou=
ps/packagegroup-meta-oe.bb
>>> RDEPENDS on or otherwise requires it)
>>> No eligible RPROVIDERs exist for 'packagegroup-meta-oe-multimedia'
>>> NOTE: Runtime target 'packagegroup-meta-oe-multimedia' is unbuildable=
,
>>> removing...
>>> Missing or unbuildable dependency chain was: ['packagegroup-meta-oe-m=
ultimedia']
>>> ERROR: Nothing RPROVIDES 'packagegroup-meta-oe-bsp' (but
>>> /mnt/a/yoe/sources/meta-openembedded/meta-oe/recipes-core/packagegrou=
ps/packagegroup-meta-oe.bb
>>> RDEPENDS on or otherwise requires it)
>>> No eligible RPROVIDERs exist for 'packagegroup-meta-oe-bsp'
>>> NOTE: Runtime target 'packagegroup-meta-oe-bsp' is unbuildable, remov=
ing...
>>> Missing or unbuildable dependency chain was: ['packagegroup-meta-oe-b=
sp']
>>> ERROR: Nothing RPROVIDES 'packagegroup-meta-oe-security' (but
>>> /mnt/a/yoe/sources/meta-openembedded/meta-oe/recipes-core/packagegrou=
ps/packagegroup-meta-oe.bb
>>> RDEPENDS on or otherwise requires it)
>>> No eligible RPROVIDERs exist for 'packagegroup-meta-oe-security'
>>> NOTE: Runtime target 'packagegroup-meta-oe-security' is unbuildable, =
removing...
>>> Missing or unbuildable dependency chain was: ['packagegroup-meta-oe-s=
ecurity']
>>> ERROR: Nothing RPROVIDES 'packagegroup-meta-oe-extended' (but
>>> /mnt/a/yoe/sources/meta-openembedded/meta-oe/recipes-core/packagegrou=
ps/packagegroup-meta-oe.bb
>>> RDEPENDS on or otherwise requires it)
>>> No eligible RPROVIDERs exist for 'packagegroup-meta-oe-extended'
>>> NOTE: Runtime target 'packagegroup-meta-oe-extended' is unbuildable, =
removing...
>>> Missing or unbuildable dependency chain was: ['packagegroup-meta-oe-e=
xtended']
>>> ERROR: Nothing RPROVIDES 'packagegroup-meta-oe-test' (but
>>> /mnt/a/yoe/sources/meta-openembedded/meta-oe/recipes-core/packagegrou=
ps/packagegroup-meta-oe.bb
>>> RDEPENDS on or otherwise requires it)
>>> No eligible RPROVIDERs exist for 'packagegroup-meta-oe-test'
>>> NOTE: Runtime target 'packagegroup-meta-oe-test' is unbuildable, remo=
ving...
>>> Missing or unbuildable dependency chain was: ['packagegroup-meta-oe-t=
est']
>>> ERROR: Nothing RPROVIDES 'packagegroup-meta-oe-crypto' (but
>>> /mnt/a/yoe/sources/meta-openembedded/meta-oe/recipes-core/packagegrou=
ps/packagegroup-meta-oe.bb
>>> RDEPENDS on or otherwise requires it)
>>> No eligible RPROVIDERs exist for 'packagegroup-meta-oe-crypto'
>>> NOTE: Runtime target 'packagegroup-meta-oe-crypto' is unbuildable, re=
moving...
>>> Missing or unbuildable dependency chain was: ['packagegroup-meta-oe-c=
rypto']
>>> ERROR: Nothing RPROVIDES 'packagegroup-meta-oe-devtools' (but
>>> /mnt/a/yoe/sources/meta-openembedded/meta-oe/recipes-core/packagegrou=
ps/packagegroup-meta-oe.bb
>>> RDEPENDS on or otherwise requires it)
>>> No eligible RPROVIDERs exist for 'packagegroup-meta-oe-devtools'
>>> NOTE: Runtime target 'packagegroup-meta-oe-devtools' is unbuildable, =
removing...
>>> Missing or unbuildable dependency chain was: ['packagegroup-meta-oe-d=
evtools']
>>> ERROR: Nothing RPROVIDES 'libxml-ptest' (but
>>> /mnt/a/yoe/sources/meta-openembedded/meta-oe/recipes-core/packagegrou=
ps/packagegroup-meta-oe.bb
>>> RDEPENDS on or otherwise requires it)
>>> NOTE: Runtime target 'libxml-ptest' is unbuildable, removing...
>>> Missing or unbuildable dependency chain was: ['libxml-ptest']
>>> ERROR: Nothing RPROVIDES 'libdbi-ptest' (but
>>> /mnt/a/yoe/sources/meta-openembedded/meta-oe/recipes-core/packagegrou=
ps/packagegroup-meta-oe.bb
>>> RDEPENDS on or otherwise requires it)
>>> NOTE: Runtime target 'libdbi-ptest' is unbuildable, removing...
>>> Missing or unbuildable dependency chain was: ['libdbi-ptest']
>>> On Sun, Nov 11, 2018 at 6:57 PM Armin Kuster <akuster808@gmail.com> w=
rote:
>>>> Need a method to run ptests in meta-oe and to build test
>>>> tasks not done via a world build
>>>>
>>>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>>>> ---
>>>>  meta-oe/conf/layer.conf                            |   2 +
>>>>  meta-oe/recipes-core/images/meta-oe-image-base.bb  |   7 +
>>>>  meta-oe/recipes-core/images/meta-oe-image.bb       |   5 +
>>>>  meta-oe/recipes-core/images/meta-oe-ptest-image.bb |   5 +
>>>>  .../packagegroups/packagegroup-meta-oe.bb          | 251 ++++++++++=
+++++++++++
>>>>  5 files changed, 270 insertions(+)
>>>>  create mode 100644 meta-oe/recipes-core/images/meta-oe-image-base.b=
b
>>>>  create mode 100644 meta-oe/recipes-core/images/meta-oe-image.bb
>>>>  create mode 100644 meta-oe/recipes-core/images/meta-oe-ptest-image.=
bb
>>>>  create mode 100644 meta-oe/recipes-core/packagegroups/packagegroup-=
meta-oe.bb
>>>>
>>>> diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
>>>> index 64c888d..23c10ce 100644
>>>> --- a/meta-oe/conf/layer.conf
>>>> +++ b/meta-oe/conf/layer.conf
>>>> @@ -77,3 +77,5 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS +=3D " \
>>>>    source-han-sans-kr-fonts->fontconfig \
>>>>    source-han-sans-tw-fonts->fontconfig \
>>>>  "
>>>> +
>>>> +DEFAULT_TEST_SUITES_pn-meta-oe-ptest-image =3D " ${PTESTTESTSUITE}"=

>>>> diff --git a/meta-oe/recipes-core/images/meta-oe-image-base.bb b/met=
a-oe/recipes-core/images/meta-oe-image-base.bb
>>>> new file mode 100644
>>>> index 0000000..df92f16
>>>> --- /dev/null
>>>> +++ b/meta-oe/recipes-core/images/meta-oe-image-base.bb
>>>> @@ -0,0 +1,7 @@
>>>> +SUMMARY =3D "meta-oe build test image"
>>>> +
>>>> +IMAGE_INSTALL =3D "packagegroup-core-boot"
>>>> +
>>>> +LICENSE =3D "MIT"
>>>> +
>>>> +inherit core-image
>>>> diff --git a/meta-oe/recipes-core/images/meta-oe-image.bb b/meta-oe/=
recipes-core/images/meta-oe-image.bb
>>>> new file mode 100644
>>>> index 0000000..1565549
>>>> --- /dev/null
>>>> +++ b/meta-oe/recipes-core/images/meta-oe-image.bb
>>>> @@ -0,0 +1,5 @@
>>>> +require  meta-oe-image-base.bb
>>>> +
>>>> +SUMMARY =3D "meta-oe build test image"
>>>> +
>>>> +IMAGE_INSTALL +=3D "packagegroup-meta-oe"
>>>> diff --git a/meta-oe/recipes-core/images/meta-oe-ptest-image.bb b/me=
ta-oe/recipes-core/images/meta-oe-ptest-image.bb
>>>> new file mode 100644
>>>> index 0000000..0166b9c
>>>> --- /dev/null
>>>> +++ b/meta-oe/recipes-core/images/meta-oe-ptest-image.bb
>>>> @@ -0,0 +1,5 @@
>>>> +require  meta-oe-image-base.bb
>>>> +
>>>> +SUMMARY =3D "meta-oe ptest test image"
>>>> +
>>>> +IMAGE_INSTALL +=3D "packagegroup-meta-oe"
>>>> diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe=
=2Ebb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
>>>> new file mode 100644
>>>> index 0000000..4526e99
>>>> --- /dev/null
>>>> +++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
>>>> @@ -0,0 +1,251 @@
>>>> +SUMMARY =3D "Meta-oe ptest packagegroups"
>>>> +
>>>> +inherit packagegroup
>>>> +
>>>> +PROVIDES =3D "${PACKAGES}"
>>>> +PACKAGES =3D ' \
>>>> +    packagegroup-meta-oe \
>>>> +    packagegroup-meta-oe-benchmarks \
>>>> +    packagegroup-meta-oe-connectivity \
>>>> +    packagegroup-meta-oe-core \
>>>> +    packagegroup-meta-oe-crypto \
>>>> +    packagegroup-meta-oe-bsp \
>>>> +    packagegroup-meta-oe-dbs \
>>>> +    packagegroup-meta-oe-devtools \
>>>> +    packagegroup-meta-oe-extended \
>>>> +    packagegroup-meta-oe-kernel \
>>>> +    packagegroup-meta-oe-multimedia \
>>>> +    packagegroup-meta-oe-navigation \
>>>> +    packagegroup-meta-oe-security \
>>>> +    packagegroup-meta-oe-support \
>>>> +    packagegroup-meta-oe-test \
>>>> +    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "packagegroup-me=
ta-oe-gnome", "", d)} \
>>>> +    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "packagegroup-me=
ta-oe-graphics", "", d)} \
>>>> +    ${@bb.utils.contains("DISTRO_FEATURES", "ptest", "packagegroup-=
meta-oe-ptest", "", d)} \
>>>> +'
>>>> +
>>>> +RDEPENDS_packagegroup-meta-oe =3D "\
>>>> +    packagegroup-meta-oe-benchmarks \
>>>> +    packagegroup-meta-oe-connectivity \
>>>> +    packagegroup-meta-oe-core \
>>>> +    packagegroup-meta-oe-crypto \
>>>> +    packagegroup-meta-oe-bsp \
>>>> +    packagegroup-meta-oe-dbs \
>>>> +    packagegroup-meta-oe-devtools \
>>>> +    packagegroup-meta-oe-extended \
>>>> +    packagegroup-meta-oe-kernel \
>>>> +    packagegroup-meta-oe-multimedia \
>>>> +    packagegroup-meta-oe-navigation \
>>>> +    packagegroup-meta-oe-security \
>>>> +    packagegroup-meta-oe-support \
>>>> +    packagegroup-meta-oe-test \
>>>> +    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "packagegroup-me=
ta-oe-gnome", "", d)} \
>>>> +    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "packagegroup-me=
ta-oe-graphics", "", d)} \
>>>> +    ${@bb.utils.contains("DISTRO_FEATURES", "ptest", "packagegroup-=
meta-oe-ptest", "", d)} \
>>>> +"
>>>> +
>>>> +RDEPENDS_packagegroup-meta-oe-benchmarks =3D "\
>>>> +    analyze-suspend dhrystone iperf2 linpack phoronix-test-suite \
>>>> +    tiobench bonnie++ fio iperf2 iperf3 lmbench s-suite whetstone \=

>>>> +    libc-bench memtester sysbench dbench iozone3 libhugetlbfs \
>>>> +    nbench-byte tinymembench \
>>>> +    ${@bb.utils.contains("DISTRO_FEATURES", "x11 wayland opengl", "=
glmark2", "", d)} \
>>>> +"
>>>> +
>>>> +RDEPENDS_packagegroup-meta-oe-connectivity =3D"\
>>>> +    gammu hostapd irssi krb5 libev libimobiledevice \
>>>> +    libmbim libmtp libndp libqmi libtorrent \
>>>> +    libuv libwebsockets linuxptp lirc loudmouth \
>>>> +    modemmanager mosh  \
>>>> +    paho-mqtt-c phonet-utils rabbitmq-c rfkill rtorrent \
>>>> +    ser2net smstools3 telepathy-glib telepathy-idle thrift \
>>>> +    usbmuxd wvstreams zabbix zeromq \
>>>> +    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "obex-data-serve=
r", "", d)} \
>>>> +    ${@bb.utils.contains("DISTRO_FEATURES", "pulseadio bluez4", "li=
bmikmod", "", d)} \
>>>> +    ${@bb.utils.contains("DISTRO_FEATURES", "bluez4", "obexftp open=
obex libnet wvdial", "", d)} \
>>>> +    "
>>>> +
>>>> +# dracut needs dracut
>>>> +RDEPENDS_packagegroup-meta-oe-core =3D"\
>>>> +    dbus-daemon-proxy libdbus-c++ eggdbus \
>>>> +    ell glibmm libsigc++-2.0 libxml++ distro-feed-configs \
>>>> +    mm-common opencl-headers opencl-icd-loader \
>>>> +    proxy-libintl usleep \
>>>> +    ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "dbus-broker=
 ndctl", "", d)} \
>>>> +    "
>>>> +
>>>> +RDEPENDS_packagegroup-meta-oe-crypto =3D"\
>>>> +    botan cryptsetup libkcapi libmcrypt \
>>>> +    libsodium pkcs11-helper \
>>>> +    "
>>>> +RDEPENDS_packagegroup-meta-oe-bsp =3D"\
>>>> +    acpitool cpufrequtils edac-utils efibootmgr \
>>>> +    efivar flashrom lmsensors lmsensors-config \
>>>> +    lsscsi nvme-cli pcmciautils pointercal \
>>>> +    "
>>>> +RDEPENDS_packagegroup-meta-oe-dbs =3D"\
>>>> +    leveldb libdbi mariadb mariadb-native \
>>>> +    mysql-python postgresql psqlodbc rocksdb soci \
>>>> +    sqlite \
>>>> +    ${@bb.utils.contains("DISTRO_FEATURES", "bluez4", "mongodb", ""=
, d)} \
>>>> +    "
>>>> +
>>>> +RDEPENDS_packagegroup-meta-oe-devtools =3D"\
>>>> +    android-tools android-tools-conf bootchart breakpad \
>>>> +    capnproto cgdb cscope ctags \
>>>> +    debootstrap dejagnu dmalloc flatbuffers \
>>>> +    giflib icon-slicer iptraf-ng jq jsoncpp jsonrpc json-spirit \
>>>> +    kconfig-frontends lemon libedit libgee libsombok3 \
>>>> +    libubox log4cplus lshw ltrace lua mcpp memstat mercurial \
>>>> +    mpich msgpack-c nlohmann-json nodejs openocd pax-utils \
>>>> +    ipc-run libdbd-mysql-perl libdbi-perl libio-pty-perl php \
>>>> +    protobuf protobuf-c python3-distutils-extra \
>>>> +    python-cpuset python-distutils-extra python-futures python-pygo=
bject \
>>>> +    rapidjson serialcheck sip3 sip tclap uftrace uw-imap valijson \=

>>>> +    xmlrpc-c yajl yasm \
>>>> +    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "geany geany-plu=
gins glade tk", "", d)} \
>>>> +    "
>>>> +
>>>> +RDEPENDS_packagegroup-meta-oe-extended =3D"\
>>>> +    byacc cfengine cfengine-masterfiles cmpi-bindings \
>>>> +    ddrescue dialog dumb-init enscript fluentbit \
>>>> +    haveged hexedit hiredis hplip hwloc indent iotop isomd5sum \
>>>> +    jansson konkretcmpi lcdproc libblockdev libcec libconfig \
>>>> +    libdivecomputer libplist libusbmuxd \
>>>> +    liblockfile liblogging liblognorm libmodbus libmodbus \
>>>> +    libpwquality libqb libuio \
>>>> +    lockfile-progs logwatch lprng mailx md5deep \
>>>> +    mozjs mraa nana nicstat \
>>>> +    p7zip p8platform libfile-fnmatch-perl polkit \
>>>> +    polkit-group-rule-datetime polkit-group-rule-network \
>>>> +    rarpd redis rrdtool libfastjson librelp rsyslog sanlock \
>>>> +    sblim-cmpi-devel sblim-sfc-common sblim-sfcc \
>>>> +    scsirastools sgpio smartmontools snappy can-isotp \
>>>> +    can-utils libsocketcan tipcutils tiptop \
>>>> +    tmux uml-utilities upm vlock volume-key wipe zlog zram \
>>>> +    ${@bb.utils.contains("DISTRO_FEATURES", "x11 wayland opengl", "=
boinc-client", "", d)} \
>>>> +    ${@bb.utils.contains("DISTRO_FEATURES", "x11", " libgxim t1lib =
gnuplot libwmf gtkmathview", "", d)} \
>>>> +    ${@bb.utils.contains("DISTRO_FEATURES", "bluez", "collectd", ""=
, d)} \
>>>> +    ${@bb.utils.contains("DISTRO_FEATURES", "pam", "pam-plugin-ccre=
ds pam-plugin-ldapdb", "", d)} \
>>>> +    ${@bb.utils.contains("DISTRO_FEATURES", "pam", "pam-ssh-agent-a=
uth openwsman sblim-sfcb ", "", d)} \
>>>> +    ${@bb.utils.contains("BBPATH", "meta-python", "openlmi-tools", =
"", d)} \
>>>> +    "
>>>> +
>>>> +RDEPENDS_packagegroup-meta-oe-gnome =3D"\
>>>> +    atkmm gnome-common gnome-doc-utils-stub gtkmm \
>>>> +    gtkmm3 pyxdg vte9 \
>>>> +    "
>>>> +
>>>> +RDEPENDS_packagegroup-meta-oe-graphics =3D"\
>>>> +    babl cairomm dietsplash directfb directfb-examples dnfdragora \=

>>>> +    fbgrab fbida fontforge freeglut fvwm gegl gimp glm gphoto2 libg=
photo2 \
>>>> +    gtkperf jasper leptonica libmng libsdl2-image libsdl2-mixer lib=
sdl2-net \
>>>> +    libsdl2-ttf libsdl-gfx libsdl-image libsdl-mixer libsdl-net lib=
sdl-ttf \
>>>> +    libvncserver libyui libyui-ncurses lxdm numlockx openbox openjp=
eg \
>>>> +    packagegroup-fonts-truetype pangomm qrencode takao-fonts termin=
us-font \
>>>> +    tesseract tesseract-lang tigervnc tslib source-han-sans-cn-font=
s \
>>>> +    source-han-sans-jp-fonts source-han-sans-kr-fonts source-han-sa=
ns-tw-fonts ttf-abyssinica \
>>>> +    libvdpau x11vnc xcursorgen xdotool \
>>>> +    bdftopcf iceauth sessreg setxkbmap twm xclock xfontsel xgamma x=
kbevd xkbprint xkbutils \
>>>> +    xlsatoms xlsclients xlsfonts xmag xmessage xrdb xrefresh xsetmo=
de xsetroot xstdcmap \
>>>> +    xterm xwd xwud xbitmaps xorg-sgml-doctools \
>>>> +    font-adobe-100dpi font-adobe-utopia-100dpi \
>>>> +    font-bh-100dpi font-bh-lucidatypewriter-100dpi font-bitstream-1=
00dpi font-cursor-misc \
>>>> +    font-misc-misc xorg-fonts-100dpi liblbxutil libxaw libxkbui lib=
xpresent xserver-common \
>>>> +    "
>>>> +
>>>> +RDEPENDS_packagegroup-meta-oe-kernel =3D"\
>>>> +    agent-proxy bpftool broadcom-bt-firmware cpupower \
>>>> +    crash ipmitool minicoredumper oprofile \
>>>> +    "
>>>> +
>>>> +RDEPENDS_packagegroup-meta-oe-multimedia =3D"\
>>>> +    alsa-oss audiofile cdrkit esound faad2 id3lib \
>>>> +    a2jmidid jack libass libburn libcdio libcdio-paranoia \
>>>> +    libdvdread libmad libmms libmodplug libopus live555 \
>>>> +    mplayer-common opus-tools \
>>>> +    sound-theme-freedesktop v4l-utils yavta wavpack libvpx \
>>>> +    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "xpext pavucontr=
ol mpv xsp", "", d)} \
>>>> +    ${@bb.utils.contains("DISTRO_FEATURES", "pulseadio bluez4", "li=
bmikmod", "", d)} \
>>>> +    "
>>>> +
>>>> +RDEPENDS_packagegroup-meta-oe-navigation =3D"\
>>>> +    geoclue geos libspatialite proj \
>>>> +    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "orrery", "", d)=
} \
>>>> +    ${@bb.utils.contains("DISTRO_FEATURES", "bluz4", "gpsd gpsd-mac=
hine-conf", "", d)} \
>>>> +    "
>>>> +
>>>> +RDEPENDS_packagegroup-meta-oe-security =3D"\
>>>> +    tomoyo-tools \
>>>> +    ${@bb.utils.contains("DISTRO_FEATURES", "pam", "passwdqc", "", =
d)} \
>>>> +    ${@bb.utils.contains("DISTRO_FEATURES", "bluz5", "nmap", "", d)=
} \
>>>> +    "
>>>> +
>>>> +RDEPENDS_packagegroup-meta-oe-shells =3D"\
>>>> +    dash tcsh zsh \
>>>> +    "
>>>> +
>>>> +NE10 =3D ""
>>>> +NE10_aarch64 =3D "ne10"
>>>> +NE10_arm7 =3D "ne10"
>>>> +
>>>> +RDEPENDS_packagegroup-meta-oe-support =3D"\
>>>> +    anthy asio atop augeas avro-c bdwgc frame grail \
>>>> +    ccid ceres-solver ckermit cpprest ctapi-common daemonize \
>>>> +    daemontools debsums devmem2 dfu-util dfu-util-native digitemp \=

>>>> +    dstat eject enca epeg espeak espeak-data fbset fbset-modes \
>>>> +    fftw fltk-native gd gflags glog gnulib gperftools \
>>>> +    gpm gradm gsl gsoap hddtemp hidapi htop hunspell hwdata iksemel=
 \
>>>> +    libinih inotify-tools joe lcms lcov libatasmart libbytesize \
>>>> +    libcereal libcyusbserial libee libeigen libestr libftdi libgit2=
 \
>>>> +    libgpiod libiio libjs-jquery libjs-sizzle liblinebreak libmicro=
httpd \
>>>> +    libmxml libnih liboauth libol liboop libp11 libraw1394 libsmi l=
ibsoc libssh2 \
>>>> +    libssh libtar libteam libtinyxml2 libtinyxml libusbg libusb-com=
pat libutempter \
>>>> +    links lio-utils lockdev log4c log4cpp logwarn libdevmapper lvm2=
 \
>>>> +    mailcap mbuffer mg minini \
>>>> +    multipath-tools nano neon nmon numactl onig openct openldap \
>>>> +    opensc wbxml2 p910nd pcsc-lite picocom libotr pidgin \
>>>> +    pngcheck poco poppler poppler-data portaudio-v19 pps-tools \
>>>> +    pv pxaregs raptor2 rdfind read-edid rsnapshot s3c24xx-gpio s3c6=
4xx-gpio \
>>>> +    sjf2410-linux-native satyr sdparm pty-forward-native serial-for=
ward \
>>>> +    sg3-utils sharutils smem spitools srecord ssiapi start-stop-dae=
mon stm32flash \
>>>> +    syslog-ng system-config-keyboard tbb thin-provisioning-tools to=
kyocabinet \
>>>> +    tree udisks udisks2 uhubctl unixodbc upower uriparser usb-modes=
witch \
>>>> +    usb-modeswitch-data usbpath uthash utouch-evemu utouch-frame \
>>>> +    vim vim-tiny websocketpp wmiconfig xdelta3 xdg-user-dirs xmlsta=
rlet \
>>>> +    zbar zile \
>>>> +    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "geis toscoterm =
uim synergy utouch-mtview links-x11 fltk pidgin-otr", "", d)} \
>>>> +    ${@bb.utils.contains("DISTRO_FEATURES", "pulseadio bluez4", "li=
bcanberra", "", d)} \
>>>> +    ${@bb.utils.contains("DISTRO_FEATURES", "x11 pam", "xorgxrdp xr=
dp", "", d)} \
>>>> +    ${@bb.utils.contains("DISTRO_FEATURES", "bluez4", "procmail", "=
", d)} \
>>>> +    ${NE10} \
>>>> +    "
>>>> +
>>>> +RDEPENDS_packagegroup-meta-oe-support-egl =3D"\
>>>> +    freerdp libnice opencv \
>>>> +    "
>>>> +
>>>> +RDEPENDS_packagegroup-meta-oe-test =3D"\
>>>> +    catch2 cppunit cunit cxxtest evtest fb-test \
>>>> +    fwts gtest pm-qa stress-ng testfloat \
>>>> +    "
>>>> +
>>>> +RDEPENDS_packagegroup-meta-oe-ptest =3D "\
>>>> +    zeromq-ptest \
>>>> +    libxml-ptest \
>>>> +    soci-ptest \
>>>> +    leveldb-ptest \
>>>> +    psqlodbc-ptest \
>>>> +    lua-ptest \
>>>> +    protobuf-ptest \
>>>> +    libdbi-ptest \
>>>> +    rsyslog-ptest \
>>>> +    oprofile-ptest \
>>>> +    libteam-ptest \
>>>> +    uthash-ptest \
>>>> +    mcelog-ptest \
>>>> +    openldap-ptest \
>>>> +    libee-ptest \
>>>> +    numactl-ptest \
>>>> +    poco-ptest \
>>>> +    "
>>>> --
>>>> 2.7.4
>>>>
>>>> --
>>>> _______________________________________________
>>>> Openembedded-devel mailing list
>>>> Openembedded-devel@lists.openembedded.org
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel



