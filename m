Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id AE30B61572
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Feb 2020 08:15:30 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id y30so3336518pga.13
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Feb 2020 00:15:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:autocrypt:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=mlkHXaW5/XDPg0CSFcQeRd7RqtnYEzUZsgCrysEOn0U=;
	b=iGbkov0PhabQ3YZPYhZcXt2XmPz3doo06N/zwBVlEpSVtG3MJrDmey5JJQ9ciA1+D2
	TFsOVDCXctXuoLN3iUgN1l4Vp1Ujg0aQ8V2TvqOuhG8pEIJXyuz8vx7FfW5RcUz821DW
	HJqza2WsFX857PQAk7k/nFQI06AkVVKGuBGIZgudlym5PxXrK/OJNiWIgsvyhmfw2cxC
	e1rIB13AUp6Wexm4UbghKAnoX+5Xh8PQda2ZX9kHz4uXRgQ+8Pu3sdeRCoXk0qfxugW8
	dyOS86tvRK1D2O8l51fIlrYJksH9QJOwMxCu8cXzdyP8djxb51zdJmbz1qauRyJdk2/Q
	TjJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=mlkHXaW5/XDPg0CSFcQeRd7RqtnYEzUZsgCrysEOn0U=;
	b=QEBKLhzEMNVmN2GMgCbcRf/WN49xz74wMpVIeEWdJuDNQZSE3KFKpXSI0vAwc25YQv
	nzE/aq3yum2Rufrv2Op+Y3HFgWXN5Na3pnZzIyyGuik173HPnxp8kKeQzDwXmUn+Kws1
	0Xg0SNz7vurnWwCAyUg1yAgwMxB/MSO1dkM63S8OMnDaimdbYeaLR7JSu+vw1uCVcXjg
	IPGTOPQhnqm3B1ywN8+OfdGElmxuZuWlqJm/sqhj6F4zhKj9m4Byq+byorPFmbRv6sJ9
	P4cyIMS7DTg2qspK/VOklGCEagEZfgaQ15p7QLSwTHPTu0EnITo4j57AMI1ZfLmJKe+T
	5cuQ==
X-Gm-Message-State: APjAAAXZBX5NLXASP89dtwduIf3PYCqRLFJTgp6dbGMJzKMCh1DVMKBI
	YkViXMDtpvsuD54NJTuTR3fi5nKn4zc=
X-Google-Smtp-Source: APXvYqzy7dYX+f3XIBAU9aMsqMHFnnCzmVLHpRQdoe+eHsBKQSjiz2PcyQ9x1YpCoiA6/6XsFVHUOg==
X-Received: by 2002:a63:9358:: with SMTP id w24mr49086601pgm.207.1582445731133;
	Sun, 23 Feb 2020 00:15:31 -0800 (PST)
Received: from ?IPv6:2601:646:9200:4e0::13a9? ([2601:646:9200:4e0::13a9])
	by smtp.gmail.com with ESMTPSA id
	10sm8322827pfu.132.2020.02.23.00.15.30
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Sun, 23 Feb 2020 00:15:30 -0800 (PST)
To: "Jeremy A. Puhlman" <jpuhlman@mvista.com>,
	openembedded-devel@lists.openembedded.org
References: <20200222052935.19762-1-jpuhlman@mvista.com>
From: Khem Raj <raj.khem@gmail.com>
Autocrypt: addr=raj.khem@gmail.com; keydata=
	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
Message-ID: <55c135f4-f708-bacd-889f-23f7b1e7d889@gmail.com>
Date: Sun, 23 Feb 2020 00:15:29 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200222052935.19762-1-jpuhlman@mvista.com>
Subject: Re: [meta-oe][PATCH] ipmiutil: gzip man pages with out timestamp
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
X-List-Received-Date: Sun, 23 Feb 2020 08:15:30 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

fails with clang

https://errors.yoctoproject.org/Errors/Details/392235/

On 2/21/20 9:29 PM, Jeremy A. Puhlman wrote:
> From: Jeremy Puhlman <jpuhlman@mvista.com>
>
> A timestamp was getting encoded into the gzip header. This
> causes multilib conflicts when installed together, and would
> likely fail reproducablity tests.
> ---
>  ...ess-times-from-changing-resulting-gzip-md.patch | 25 ++++++++++++++++++++++
>  meta-oe/recipes-kernel/ipmiutil/ipmiutil_3.1.5.bb  |  1 +
>  2 files changed, 26 insertions(+)
>  create mode 100644 meta-oe/recipes-kernel/ipmiutil/ipmiutil/0001-Prevent-access-times-from-changing-resulting-gzip-md.patch
>
> diff --git a/meta-oe/recipes-kernel/ipmiutil/ipmiutil/0001-Prevent-access-times-from-changing-resulting-gzip-md.patch b/meta-oe/recipes-kernel/ipmiutil/ipmiutil/0001-Prevent-access-times-from-changing-resulting-gzip-md.patch
> new file mode 100644
> index 000000000..82d0e99d0
> --- /dev/null
> +++ b/meta-oe/recipes-kernel/ipmiutil/ipmiutil/0001-Prevent-access-times-from-changing-resulting-gzip-md.patch
> @@ -0,0 +1,25 @@
> +From da668e5bf1a721797361ab866d09913ee8e157c4 Mon Sep 17 00:00:00 2001
> +From: Jeremy Puhlman <jpuhlman@mvista.com>
> +Date: Sat, 22 Feb 2020 04:37:04 +0000
> +Subject: [PATCH] Prevent access times from changing resulting gzip md5sum
> +
> +Upstream-Status: Pending
> +https://sourceforge.net/p/ipmiutil/support-requests/40/attachment/0001-Prevent-access-times-from-changing-resulting-gzip-md.patch
> +---
> + doc/Makefile.am | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/doc/Makefile.am b/doc/Makefile.am
> +index b792762..2c52ce6 100644
> +--- a/doc/Makefile.am
> ++++ b/doc/Makefile.am
> +@@ -59,5 +59,5 @@ install:
> + 	${INSTALL_DATA_SH} iuser.8 	 ${manto}
> + 	${INSTALL_DATA_SH} iseltime.8 	 ${manto}
> + 	${INSTALL_DATA_SH} bmclanpet.mib ${datato}
> +-	cd ${manto}; gzip -f *.8
> ++	cd ${manto}; gzip -Tf *.8
> + 	
> +-- 
> +2.13.3
> +
> diff --git a/meta-oe/recipes-kernel/ipmiutil/ipmiutil_3.1.5.bb b/meta-oe/recipes-kernel/ipmiutil/ipmiutil_3.1.5.bb
> index 3e2634028..d0f3688a2 100644
> --- a/meta-oe/recipes-kernel/ipmiutil/ipmiutil_3.1.5.bb
> +++ b/meta-oe/recipes-kernel/ipmiutil/ipmiutil_3.1.5.bb
> @@ -21,6 +21,7 @@ PARALLEL_MAKE = ""
>  
>  SRC_URI = "${SOURCEFORGE_MIRROR}/ipmiutil/ipmiutil-${PV}.tar.gz \
>             file://fix_systemd_path.patch \
> +           file://0001-Prevent-access-times-from-changing-resulting-gzip-md.patch \
>            "
>  SRC_URI[md5sum] = "292d6df25cad678bb27e5c8cdc6748f9"
>  SRC_URI[sha256sum] = "58ccdbd5755d7dd72478756715af09e9c73330dfad2b91dbf03d2ac504b301a3"

