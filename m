Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 5C56777DAF
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  3 Jun 2017 15:21:36 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id w69so15829071pfk.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 03 Jun 2017 08:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=hQKEmA1XMXbODZrlAc4waUQOvFLF37HPdbt26978tU4=;
	b=nXoSfptWEogZciaRYhAlcrj/8VVQHGoY0Ct5x+J4lIkfZQFiBAC8DSjLt8U+y7+aog
	DjlAcuzQqDjcsjJjDau9p0pXJGANNv2Wq4J8LBuF8XXd32264E/66+1G35dQefZrWUd4
	8FpdGNhrRcKBPRC3UmGFoYSYLnX0NtUIQv4j0n1cIwGK5ukFxbaDp1pLaxXhAQP3sSKs
	fMw1PXgOumIKi49WVRBv3UfYg+Ddvi6lgEz08r/7ADB8UQLZtI/cCHnLbhlsmKGw5w4m
	52ROtTJ7pX0OTo/dfADuBbDtwS/crEPFGTUuyqmpQWB1rwf22pHvfB60pwjB6dN9Dv06
	fVsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=hQKEmA1XMXbODZrlAc4waUQOvFLF37HPdbt26978tU4=;
	b=KI0UmFDOlOmJekF8/ybktO5E6UPG+UKItzh8C/zxau9e6r/XxL0XXbORFCVqNWQkNQ
	lzu/YRaMWlJm1V/rKjkCT/1DLo6rRWf4PfjjXu0f/OkQg3xFtGgwOWo2NI092xU5S3oc
	Nbu1IGhtkHVSkiy50yxWH16rMcBFZI+9aiRZ3EaJp919M1r6del6h4+7HpBofJIqj6Vi
	caefXWTd7arDIa9C6RU/wBMFcaLO7PFhZM7ZKy4gqhzobVnD92SDVfp/gsm20yjy0yda
	UmxiF7+CCAE4i/99XluMdK8hKI9ocVJvU4GfOmWNRWoa9HoYHf5Phy8JagkweORvnQCy
	90bA==
X-Gm-Message-State: AODbwcCqmFluY3QTyp2PTYz5Cd5lIdr5AG+84WSbOZHNASET87x5lZhh
	g7biQB0ioUBrbBLvSHM=
X-Received: by 10.84.191.165 with SMTP id a34mr5538493pld.136.1496503297896;
	Sat, 03 Jun 2017 08:21:37 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:b844:8676:377:81ac?
	([2601:202:4001:9ea0:b844:8676:377:81ac])
	by smtp.gmail.com with ESMTPSA id
	v64sm48883052pfk.86.2017.06.03.08.21.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 03 Jun 2017 08:21:37 -0700 (PDT)
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
References: <20170603045833.8120-1-raj.khem@gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <762408a6-1bba-ceb4-a12c-16d9c4ee4ba8@gmail.com>
Date: Sat, 3 Jun 2017 08:21:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170603045833.8120-1-raj.khem@gmail.com>
Subject: Re: [meta-multimedia][PATCH 1/4] caps: Fix buld with -pie
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
X-List-Received-Date: Sat, 03 Jun 2017 15:21:36 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 06/02/2017 09:58 PM, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>   .../recipes-multimedia/caps/caps/append_ldflags.patch  | 18 ++++++++++++++++++
>   meta-multimedia/recipes-multimedia/caps/caps_0.9.24.bb |  1 +
>   2 files changed, 19 insertions(+)
>   create mode 100644 meta-multimedia/recipes-multimedia/caps/caps/append_ldflags.patch
>
> diff --git a/meta-multimedia/recipes-multimedia/caps/caps/append_ldflags.patch b/meta-multimedia/recipes-multimedia/caps/caps/append_ldflags.patch
> new file mode 100644
> index 000000000..3abd38189
> --- /dev/null
> +++ b/meta-multimedia/recipes-multimedia/caps/caps/append_ldflags.patch
> @@ -0,0 +1,18 @@
> +Change the order of linker flags such that -shared is appearig after -pie/-fpie
> +this helps in building the package when secuiry flags are enabled
> +
> +-Khem
Missing Upstream-Status and Signed-off-by

- armin
> +
> +Index: caps-0.9.24/Makefile
> +===================================================================
> +--- caps-0.9.24.orig/Makefile
> ++++ caps-0.9.24/Makefile
> +@@ -14,7 +14,7 @@ STRIP = strip
> + -include defines.make
> +
> + CFLAGS += $(OPTS) $(_CFLAGS)
> +-LDFLAGS += $(_LDFLAGS) $(CFLAGS)
> ++LDFLAGS += $(CFLAGS) $(_LDFLAGS)
> +
> + PLUG = caps
> +
> diff --git a/meta-multimedia/recipes-multimedia/caps/caps_0.9.24.bb b/meta-multimedia/recipes-multimedia/caps/caps_0.9.24.bb
> index 90a28360c..d7887635e 100644
> --- a/meta-multimedia/recipes-multimedia/caps/caps_0.9.24.bb
> +++ b/meta-multimedia/recipes-multimedia/caps/caps_0.9.24.bb
> @@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
>   SRC_URI = "http://quitte.de/dsp/${PN}_${PV}.tar.bz2 \
>              file://Avoid-ambiguity-in-div-invocation.patch \
>              file://0001-basic.h-Use-c99-supported-stdint-types.patch \
> +           file://append_ldflags.patch \
>              "
>   
>   SRC_URI[md5sum] = "c1d634038dcb54702306c0e30cb1c626"


