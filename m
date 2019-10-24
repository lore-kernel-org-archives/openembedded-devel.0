Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id B10587F998
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 18:24:09 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id v4so15647718pff.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 11:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=HTxavJ9nXOgNw7GqaITtRkbCsffuRhYACS8gudB423Q=;
	b=Yw0hZOHlPTb09ZG8TjFJwGxU+QnQrFJ6Ql5Dd7bJ6HEiOL+ElqSIoLZRmCCgaUmKu7
	v+8WPPhvP7eaclDy2IgTgX3O2YTg1QjHOyt+Uq90Ol20oa20PQ1UjEMR6x99Pp/ciPT2
	F+VZ24ltNHAH5rcdzIVlxePDFV2UAfSn7cdGRcBuuJMzFAXkNxgIj4FispY3ICFNWDHg
	ZL/ADpP7NGqy8UO80RqlRyfOcN5Reu/OBandDbFxv6BKU0VXr2j254ymXhe0z6bwFvQC
	IwRqFNvNyubCLP64ZudHqRX5SP0rnblZdA+VXyBvs+e3WdsjpEkYl+o4d0lCatxqU0Ab
	LRPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=HTxavJ9nXOgNw7GqaITtRkbCsffuRhYACS8gudB423Q=;
	b=EEjTtW+DMiyWiAoKAM72g+f4cVLIMiDApQaE2Dbqcg4EJJPiu7OSgSsVsDg97rQJRI
	VmRxfVLSR1b7jfHz94IzPYnaN9TX2YaTIqS7XjrWrLPTsytO994ZETyK3p6eHzruO3RG
	DgXhlqaqrsHEyq/tbtSFVPtjklG7YXTvBE+Pmyqpm3bYMw4f9r9ArZAYao44sWMXJiK1
	/ZAQW6qkUIZproap3rcZYM/5m/0rOoO4Tr7Iu+QR2LdDxr6eoekS6eFDl83QWCvDXtRJ
	Q8sFoWRWU0Gyb8Vh71YEOwIhnn0c1vdtE3cxz+iAZfMFzKxX8URvDWNm5s4H6P3oypKr
	cQTw==
X-Gm-Message-State: APjAAAVlnkkLtsLxodP7JsOI7WQPMWwWIrBprCOn70t0JDTQPd9lgj4P
	EeTTh1/+xoShRkhVORiK+/y3paqK
X-Google-Smtp-Source: APXvYqyE8UqrEKv2OksWSFI/sKwKDqBbXCWa7dbC41cm5zG1mIyJuDQtBENKFiNl7CFew3GWAQOpnw==
X-Received: by 2002:a63:1f57:: with SMTP id q23mr18054946pgm.391.1571941450156;
	Thu, 24 Oct 2019 11:24:10 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:a5c0:f44c:1fc7:d2e8:7fe1?
	([2601:202:4180:a5c0:f44c:1fc7:d2e8:7fe1])
	by smtp.gmail.com with ESMTPSA id
	a21sm30689999pfi.0.2019.10.24.11.24.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 24 Oct 2019 11:24:09 -0700 (PDT)
To: =?UTF-8?Q?Daniel_D=c3=adaz?= <daniel.diaz@linaro.org>,
	openembedded-devel@lists.openembedded.org
References: <20191024175208.19746-1-daniel.diaz@linaro.org>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <f4dec827-0d24-50a5-dda0-761713e573b8@gmail.com>
Date: Thu, 24 Oct 2019 11:24:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191024175208.19746-1-daniel.diaz@linaro.org>
Subject: Re: [PATCH] perf: Add /scripts to sources
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
X-List-Received-Date: Thu, 24 Oct 2019 18:24:09 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US


wrong ml

I think you want openembedded-core@lists.openembedded.org


On 10/24/19 10:52 AM, Daniel Díaz wrote:
> As of linux-next-20191022, we need bpf_helpers_doc.py in order to
> build libbpf, which lives in /scripts. Otherwise, do_compile fails
> with:
> | /bin/sh: 1: /oe/build/tmp/work/machine-triplet/perf/1.0-r9/perf-1.0/scripts/bpf_helpers_doc.py: not found
> | Makefile:184: recipe for target 'bpf_helper_defs.h' failed
>
> See commit e01a75c159691 ("libbpf: Move bpf_{helpers, helper_defs,
> endian, tracing}.h into libbpf") from linux-next.
>
> Signed-off-by: Daniel Díaz <daniel.diaz@linaro.org>
> ---
>  meta/recipes-kernel/perf/perf.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
> index 8201c0cb60..a463eebc52 100644
> --- a/meta/recipes-kernel/perf/perf.bb
> +++ b/meta/recipes-kernel/perf/perf.bb
> @@ -113,6 +113,7 @@ PERF_SRC ?= "Makefile \
>               tools/Makefile \
>               tools/perf \
>               tools/scripts \
> +             scripts \
>  "
>  
>  PERF_EXTRA_LDFLAGS = ""


