Return-Path: <akuster808@gmail.com>
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
	[209.85.218.68])
	by mail.openembedded.org (Postfix) with ESMTP id 60FC671AB5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jul 2018 15:35:57 +0000 (UTC)
Received: by mail-oi0-f68.google.com with SMTP id d189-v6so14649010oib.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jul 2018 08:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=QZKL/3HdweRBCfvc5E6E7l1VIvO1S7uas69uiLCUxr8=;
	b=OdI8/JjFPf/6bdSPhoiZmFSXagomk0m66O0GUq12rjBktx/zqxUFx8+IiEQuNJwSsQ
	poZfKm0jz1YhjENM0Ko4sLKXd6wxeKLOr2iaIqb1mMi4g+cIsinxXweThWCqzdQmXN+l
	0wMbziv44Zv2jSA1bx8K7Q86fLbW80cCWylUTMbtrc+YOWSrhcintfRbn4fHZeBjP4VF
	E/ulglzgHW3mexiVdwnsLP82X/6OtOtjw50pTqOn0p3Z6G+P6ywx9zh+WapynFObTRds
	R1Fo61CC2HK0Ee7Iom6fAliVo7w6h7M65/ur5+2y2lH0aVe92Ybi52OAQxleSJ9XV2of
	t9dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=QZKL/3HdweRBCfvc5E6E7l1VIvO1S7uas69uiLCUxr8=;
	b=XacAAr5FrIchwIjbrcNJqFdbk40yDTrPGBb8jHomzbnc71sBvxbwIdCJobLHUnENxj
	5rFOrJ+xFzFAztSf+aITTrX8hlEGPuNTsMnini6DrTH3sxISsCZk0e4Rjj4uaafQkCjw
	Atj1kS/T6HDkdDwh8igK9WO8vMX4I38AmLEZofY88vqTq0aZWr8KXy2fmjLsmv0Z9ajg
	KhOPcG2do3LMAUFN+QhLhkQl4RSlZKNLFpmgTq6j3z2noCBd5VI4Z+jbs9elxO513+iF
	AoRr/TxBcEIdzMxr1rBhxtsvAF1Xx+2lLPEHwIZWtXmWB9Vw8HLQQ7Qk3t8RsIIJBakR
	Xoig==
X-Gm-Message-State: AOUpUlHoNfSWMgm/yzYtn3cZm7/8c9V6TlH82E7uTGiQdidw+TsC/YlE
	k6in+PJWAYsJloobccDQuNyCyLc/
X-Google-Smtp-Source: AAOMgpdN6O6H/4coGjk0msnwhtcPXDDRxr+iAf8mP56SK9Nm7adJks/6RCtRWIaOb5RGfPgkJPt15Q==
X-Received: by 2002:aca:190d:: with SMTP id
	l13-v6mr4124427oii.216.1532532958193; 
	Wed, 25 Jul 2018 08:35:58 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:4d2f:35fd:bbaf:1e0d?
	([2601:202:4180:c33:4d2f:35fd:bbaf:1e0d])
	by smtp.gmail.com with ESMTPSA id
	m203-v6sm34667224oig.42.2018.07.25.08.35.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 25 Jul 2018 08:35:57 -0700 (PDT)
To: "Hongzhi.Song" <hongzhi.song@windriver.com>,
	openembedded-devel@lists.openembedded.org
References: <20180725103604.10463-1-hongzhi.song@windriver.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <3ebaef51-c4d7-e384-ac17-158e732263d3@gmail.com>
Date: Wed, 25 Jul 2018 08:35:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180725103604.10463-1-hongzhi.song@windriver.com>
Subject: Re: [meta-oe][PATCH] snappy: add a new recipe
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
X-List-Received-Date: Wed, 25 Jul 2018 15:35:57 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 07/25/2018 03:36 AM, Hongzhi.Song wrote:
> Snappy is a compression/decompression library. It does not aim for
> maximum compression, or compatibility with any other compression
> library; instead, it aims for very high speeds and reasonable compression.
>
> Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
> ---
>  meta-oe/recipes-extended/snappy/snappy_1.1.7.bb | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/snappy/snappy_1.1.7.bb
>
> diff --git a/meta-oe/recipes-extended/snappy/snappy_1.1.7.bb b/meta-oe/recipes-extended/snappy/snappy_1.1.7.bb
> new file mode 100644
> index 000000000..0fca4ccaf
> --- /dev/null
> +++ b/meta-oe/recipes-extended/snappy/snappy_1.1.7.bb
> @@ -0,0 +1,20 @@
> +#
> +# Copyright (C) 2014 Wind River Systems, Inc.
> +#
> +SUMMARY = "A compression/decompression library"
> +DESCRIPTION = "Snappy is a fast data compression and decompression library \
> +It was designed to be very fast and stable, but not to achieve a high \
> +compression ratio."
> +
> +LICENSE = "NewBSD"
Is this LICENSE somewhere ?

- armin
> +LIC_FILES_CHKSUM = "file://COPYING;md5=f62f3080324a97b3159a7a7e61812d0c"
> +
> +SRC_URI = "https://src.fedoraproject.org/repo/pkgs/snappy/snappy-1.1.7.tar.gz/sha512/32046f532606ba545a4e4825c0c66a19be449f2ca2ff760a6fa170a3603731479a7deadb683546e5f8b5033414c50f4a9a29f6d23b7a41f047e566e69eca7caf/snappy-1.1.7.tar.gz"
> +
> +SRC_URI[md5sum] = "ee9086291c9ae8deb4dac5e0b85bf54a"
> +SRC_URI[sha256sum] = "3dfa02e873ff51a11ee02b9ca391807f0c8ea0529a4924afa645fbf97163f9d4"
> +
> +inherit cmake pkgconfig
> +
> +PACKAGECONFIG ??= ""
> +PACKAGECONFIG[lzo] = "-DHAVE_LIBLZO2=1,-DHAVE_LIBLZO2=0,lzo,"


