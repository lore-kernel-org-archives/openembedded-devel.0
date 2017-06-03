Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 4054377DB3
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  3 Jun 2017 15:22:22 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id u26so15811931pfd.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 03 Jun 2017 08:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=pkGyPXx3u0E5EjqPho/GfbSSdyW2EycNT4DhVN23OzA=;
	b=afUwprSCCG1JkZ1R5/ad7xQF3yw7SbLkfKURkJv2FG+GRFu8+rQ28fqBpoGOGAX4Op
	T5uzclr9TDPi+qEtiSJiFdHroqjV2C0YKzJzDU+dCAuCRikDNYqhHIr1dHxtwUKF6yzl
	S0Xx0FLdNlsgRIMzy78dgk5DIXqb2/GP6l44IpLReQYnEyzPIyu3ALkW50PCbTMmvTVO
	0fCc8EHnhbaMvVk75ObQlXHCnrFTO/4Xtw4kBYYHpuVad1gpiB0LBsocCiTZR1/C/+kk
	OMzletY6RhPZ9BHyMzZEPVnq9SPJx/fTFCGIxRqIYjnh7DmVFeIjEvkjlISwOP3L8hwO
	rdYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=pkGyPXx3u0E5EjqPho/GfbSSdyW2EycNT4DhVN23OzA=;
	b=RtNXZzkhTX4HalBfapgTnj0Ys3ePgbI7+dLTzVyehyp8GnOCk2AUtBbsfJwJ0jr3jW
	7NHZQgpkv7JpIvFTBoT0JTCzAVSzpBWKILpH51n6z/EYEqd95eW5a9WA/IF0kWzxs5Yt
	U/COcuysdcyurucvwrOgP9THExSDhkHJyu6UT0kWvySCUHHUgCvMeU5OiuBwXni/E3DM
	uEkgB8jviXNuaYoR5iamXiatolh+VZswS1haLf+UBFR1ELgvY8vsQifENaf54p58GLOh
	kxqtGSWWw+aEivNrAFAaxm0IiZOvSxJJPmUjukde20H9N2GfDulGKpHDc1ehKDDEcsLA
	+TZg==
X-Gm-Message-State: AODbwcDVRoSB39zCaeKHB6J3aytKwLdsaW0FEciVgZ8hS6AUzl56ZFwY
	IxOPevOcnRsYwPe9N7o=
X-Received: by 10.99.109.73 with SMTP id i70mr12684941pgc.62.1496503343664;
	Sat, 03 Jun 2017 08:22:23 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:b844:8676:377:81ac?
	([2601:202:4001:9ea0:b844:8676:377:81ac])
	by smtp.gmail.com with ESMTPSA id
	r68sm46133545pfd.91.2017.06.03.08.22.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 03 Jun 2017 08:22:23 -0700 (PDT)
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
References: <20170603045833.8120-1-raj.khem@gmail.com>
	<20170603045833.8120-2-raj.khem@gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <4987dca7-1d4e-983e-acb7-6c398b9a0dda@gmail.com>
Date: Sat, 3 Jun 2017 08:22:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170603045833.8120-2-raj.khem@gmail.com>
Subject: Re: [meta-python][PATCH 2/4] python-numeric: Fix build with musl
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
X-List-Received-Date: Sat, 03 Jun 2017 15:22:23 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 06/02/2017 09:58 PM, Khem Raj wrote:
> Use gettimeofday() definition from system
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>   ...-define-this-function-differently-than-it.patch | 30 ++++++++++++++++++++++
>   .../recipes-devtools/python/python-numeric_24.2.bb |  4 ++-
>   2 files changed, 33 insertions(+), 1 deletion(-)
>   create mode 100644 meta-python/recipes-devtools/python/python-numeric/0001-it-tries-to-define-this-function-differently-than-it.patch
>
> diff --git a/meta-python/recipes-devtools/python/python-numeric/0001-it-tries-to-define-this-function-differently-than-it.patch b/meta-python/recipes-devtools/python/python-numeric/0001-it-tries-to-define-this-function-differently-than-it.patch
> new file mode 100644
> index 000000000..81ed744cb
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-numeric/0001-it-tries-to-define-this-function-differently-than-it.patch
> @@ -0,0 +1,30 @@
> +From 322e781c67d7a78fc2cfc3d377f50b825fc64abb Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Fri, 2 Jun 2017 20:21:01 -0700
> +Subject: [PATCH] it tries to define this function differently than it is
> + defined in sys/time.h.
> +
> +Use the definition from system
missing Upstream-Status

> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + Packages/RNG/Src/ranf.c | 3 ---
> + 1 file changed, 3 deletions(-)
> +
> +diff --git a/Packages/RNG/Src/ranf.c b/Packages/RNG/Src/ranf.c
> +index 5ca7dc5..e669fa8 100644
> +--- a/Packages/RNG/Src/ranf.c
> ++++ b/Packages/RNG/Src/ranf.c
> +@@ -149,9 +149,6 @@ void Mixranf(int *s,u32 s48[2])
> + #else
> + 	struct timeval tv;
> + 	struct timezone tz;
> +-#if !defined(__sgi)
> +-	int gettimeofday(struct timeval *, struct timezone *);
> +-#endif
> +
> + 	(void)gettimeofday(&tv,&tz);
> + 	s48[0] = (u32)tv.tv_sec;
> +--
> +2.13.0
> +
> diff --git a/meta-python/recipes-devtools/python/python-numeric_24.2.bb b/meta-python/recipes-devtools/python/python-numeric_24.2.bb
> index c0b04e144..c91d77c81 100644
> --- a/meta-python/recipes-devtools/python/python-numeric_24.2.bb
> +++ b/meta-python/recipes-devtools/python/python-numeric_24.2.bb
> @@ -5,7 +5,9 @@ LIC_FILES_CHKSUM = "file://Legal.htm;md5=e3ce75dedd4043918d15979ae43e312e"
>   
>   PR = "ml3"
>   
> -SRC_URI = "${SOURCEFORGE_MIRROR}/numpy/Numeric-${PV}.tar.gz"
> +SRC_URI = "${SOURCEFORGE_MIRROR}/numpy/Numeric-${PV}.tar.gz \
> +           file://0001-it-tries-to-define-this-function-differently-than-it.patch \
> +"
>   S = "${WORKDIR}/Numeric-${PV}"
>   
>   inherit distutils


