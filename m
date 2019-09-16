Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id 8B08C7F281
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Sep 2019 19:33:23 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id w10so346567plq.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Sep 2019 12:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=azrP9oaIWmyFL0ZpqJOcedY+SNqCJwzeLyIPXwk2plk=;
	b=VARuuCj8lGlSOP8FFxK7M10FYpvg/c+ZndDkCORU4Xoeaehb0S3JA5eSc/xwjMwPO7
	tt5jtgSSUL3axrPWognnidLGkSbC3A3rySgGP20KqvgN+QT4pS7qihP5aW4/yE8KGtQC
	zndy5HzT3rGFZSBglahBoPofyOgKB7Z5CSJiQuUdKW678ff2JHGqkDbhw9bkJwuy7TC3
	5KC+LSVqIWodvJuij70DkFOIHjZbB6xMqOWSn5bAfLHiBTedPVwETxX5DieQm5GrlgqS
	Kd2oYlLzO9i5ORVI90ZIiWNPoIHMXrdIyHWZTL+BhVK0xijB4Mc7SDpSQeyJd+8Yth4g
	O7Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=azrP9oaIWmyFL0ZpqJOcedY+SNqCJwzeLyIPXwk2plk=;
	b=X8J2oqdWCPlNe+k8/TlkAsKI5JFELSwYXXsrCDwuqFpvvMMj4odxlTCVl3xykxm/Gu
	tgzI+LfgJDmvLaN81ZUvHweG7Gh9tabhx3g5FVm3q6NzTZlm/ISDP5TaDbrDl1V2RhmY
	upJePUuoGKl9L88/KyGS1emMWzX8DSFVkTVdxtpU/lrBPhr1E6rDQgYKYtFdI6x7oLHa
	Am+rXJuCdvW2F2Yz8Y08CHmRoSE4tXqcepGnEeE4eWTtvKEnzp5rCdtDEMJBbuHv7yyD
	CJNM6pVdbQyChvQ+kqQVi+Y86mmgk5n6H5g0garOjuNOVNxbN/5Dd9wGlYOS5YYgddSW
	oi/w==
X-Gm-Message-State: APjAAAXpL9JbC8QgzkGn6815aUAfRsg6huWCwmJUzEVxBEj+aIOKF94l
	c0kOpK87QAyAi99JCEqZK8k=
X-Google-Smtp-Source: APXvYqwPddoy2v95XkVsqHt7aOIL6EeC15DD9Zv+oL6L0NrMTWpJtqGStb5ip1BarW2Endb8usNULQ==
X-Received: by 2002:a17:902:9b87:: with SMTP id
	y7mr1404357plp.341.1568662404490; 
	Mon, 16 Sep 2019 12:33:24 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:ac6a:3cec:ecd7:6ae1?
	([2601:202:4180:c33:ac6a:3cec:ecd7:6ae1])
	by smtp.gmail.com with ESMTPSA id c1sm3136866pfn.22.2019.09.16.12.33.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Sep 2019 12:33:23 -0700 (PDT)
To: Peiran Hong <peiran.hong@windriver.com>,
	openembedded-devel@lists.openembedded.org
References: <20190916190441.5734-1-peiran.hong@windriver.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <5ab8ae33-dfa8-9fc4-9004-4a9c17b195ff@gmail.com>
Date: Mon, 16 Sep 2019 12:33:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190916190441.5734-1-peiran.hong@windriver.com>
Subject: Re: [meta-oe][warrior][PATCH] tcpdump: Fix CVE-2017-16808
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
X-List-Received-Date: Mon, 16 Sep 2019 19:33:23 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 9/16/19 12:04 PM, Peiran Hong wrote:
> Backport selected parts of three upstream commits to fix
> CVE-2017-16808 where tcpdump 4.9.2 has a heap-based buffer over-read.
>
> Upstream-Status: Backport
> [ several ]
>
> Upstream commits fully backported:
> 46aead6  [CVE-2017-16808/AoE: Add a missing bounds check]
>
> Upstream commits partially backported:
> 7068209  [Use nd_ types in 802.x and FDDI headers.]
> 84ef17a  [Replace ND_TTEST2()/ND_TCHECK2() macros by macros using
> pointers (1/n)]
>
> 46aead6 fixes the vulnerability and requires two macros defined in
> 7068209 and 84ef17a, which are committed after the release of 4.9.2.
> Only the definition of the macros are taken from the two commits
> as they impact a wide range of code and are difficult to integrate.
>
> CVE: CVE-2017-16808
the backport from master is already sitting in my stable/warrior-nmut
which is under review.  I will check if that and this request are the same.

thanks for the formal request.

-armin

>
> Signed-off-by: Peiran Hong <peiran.hong@windriver.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  ...16808-AoE-Add-a-missing-bounds-check.patch | 61 +++++++++++++++++++
>  .../recipes-support/tcpdump/tcpdump_4.9.2.bb  |  1 +
>  2 files changed, 62 insertions(+)
>  create mode 100644 meta-networking/recipes-support/tcpdump/tcpdump/0001-CVE-2017-16808-AoE-Add-a-missing-bounds-check.patch
>
> diff --git a/meta-networking/recipes-support/tcpdump/tcpdump/0001-CVE-2017-16808-AoE-Add-a-missing-bounds-check.patch b/meta-networking/recipes-support/tcpdump/tcpdump/0001-CVE-2017-16808-AoE-Add-a-missing-bounds-check.patch
> new file mode 100644
> index 000000000..919f2b009
> --- /dev/null
> +++ b/meta-networking/recipes-support/tcpdump/tcpdump/0001-CVE-2017-16808-AoE-Add-a-missing-bounds-check.patch
> @@ -0,0 +1,61 @@
> +From c45443a0d3e16b92622bea6b589e5930e8f0d815 Mon Sep 17 00:00:00 2001
> +From: Peiran Hong <peiran.hong@windriver.com>
> +Date: Fri, 13 Sep 2019 17:02:57 -0400
> +Subject: [PATCH] CVE-2017-16808/AoE: Add a missing bounds check.
> +
> +---
> + netdissect.h | 12 ++++++++++++
> + print-aoe.c  |  1 +
> + 2 files changed, 13 insertions(+)
> +
> +diff --git a/netdissect.h b/netdissect.h
> +index 089b0406..cd05fdb9 100644
> +--- a/netdissect.h
> ++++ b/netdissect.h
> +@@ -69,6 +69,11 @@ typedef struct {
> + typedef unsigned char nd_uint8_t;
> + typedef signed char nd_int8_t;
> + 
> ++/*
> ++ * Use this for MAC addresses.
> ++ */
> ++#define MAC_ADDR_LEN    6               /* length of MAC addresses */
> ++
> + /* snprintf et al */
> + 
> + #include <stdarg.h>
> +@@ -309,12 +314,19 @@ struct netdissect_options {
> + 	((uintptr_t)ndo->ndo_snapend - (l) <= (uintptr_t)ndo->ndo_snapend && \
> +          (uintptr_t)&(var) <= (uintptr_t)ndo->ndo_snapend - (l)))
> + 
> ++#define ND_TTEST_LEN(p, l) \
> ++  (IS_NOT_NEGATIVE(l) && \
> ++        ((uintptr_t)ndo->ndo_snapend - (l) <= (uintptr_t)ndo->ndo_snapend && \
> ++         (uintptr_t)(p) <= (uintptr_t)ndo->ndo_snapend - (l)))
> ++
> + /* True if "var" was captured */
> + #define ND_TTEST(var) ND_TTEST2(var, sizeof(var))
> + 
> + /* Bail if "l" bytes of "var" were not captured */
> + #define ND_TCHECK2(var, l) if (!ND_TTEST2(var, l)) goto trunc
> + 
> ++#define ND_TCHECK_LEN(p, l) if (!ND_TTEST_LEN(p, l)) goto trunc
> ++
> + /* Bail if "var" was not captured */
> + #define ND_TCHECK(var) ND_TCHECK2(var, sizeof(var))
> + 
> +diff --git a/print-aoe.c b/print-aoe.c
> +index 97e93df2..ac097a04 100644
> +--- a/print-aoe.c
> ++++ b/print-aoe.c
> +@@ -325,6 +325,7 @@ aoev1_reserve_print(netdissect_options *ndo,
> + 		goto invalid;
> + 	/* addresses */
> + 	for (i = 0; i < nmacs; i++) {
> ++		ND_TCHECK_LEN(cp, MAC_ADDR_LEN);
> + 		ND_PRINT((ndo, "\n\tEthernet Address %u: %s", i, etheraddr_string(ndo, cp)));
> + 		cp += ETHER_ADDR_LEN;
> + 	}
> +-- 
> +2.21.0
> +
> diff --git a/meta-networking/recipes-support/tcpdump/tcpdump_4.9.2.bb b/meta-networking/recipes-support/tcpdump/tcpdump_4.9.2.bb
> index 038c1617f..9bd861cd4 100644
> --- a/meta-networking/recipes-support/tcpdump/tcpdump_4.9.2.bb
> +++ b/meta-networking/recipes-support/tcpdump/tcpdump_4.9.2.bb
> @@ -12,6 +12,7 @@ SRC_URI = " \
>      file://avoid-absolute-path-when-searching-for-libdlpi.patch \
>      file://add-ptest.patch \
>      file://run-ptest \
> +    file://0001-CVE-2017-16808-AoE-Add-a-missing-bounds-check.patch \
>  "
>  
>  SRC_URI[md5sum] = "9bbc1ee33dab61302411b02dd0515576"


