Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f193.google.com (mail-ua0-f193.google.com
	[209.85.217.193])
	by mail.openembedded.org (Postfix) with ESMTP id 60C826059F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Dec 2016 16:00:23 +0000 (UTC)
Received: by mail-ua0-f193.google.com with SMTP id i68so22676332uad.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Dec 2016 08:00:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=8IWcnlRKwXMYNJLUWNjYpaeegYrkh+VpUgQFf7CgwgQ=;
	b=NgwL7zP0PE4vEXjjpL0+Z5y634ZjI8jtmmC7074xofZTaYTM9Pql4Nyd/LlngHS//y
	VJboGr+bBlMMgHE8wa8EVie+/g6FldSzqyab9RtCNH1+n1sh8sgG4zqyLxe6ui7Kbks5
	VWAEkeYUnOzuBT798AqdShUzNaNB3G8FhiyJZFGyZRnnLNivD/+1MqMogILarswwPnE+
	g8STn63AI+oMlNmoL2RsJH6wnSdvNQxWLH+GYmVPE4YaAbOqhSEINwbwT2quvcUclnU3
	0K1/J0uNDwGjPpnOcFlsyf+KjmfSP3IXukdu/s95vly4hqQKW6ypMhdtGn4P4BT/k8S1
	o2Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=8IWcnlRKwXMYNJLUWNjYpaeegYrkh+VpUgQFf7CgwgQ=;
	b=AptXLx8Ywpn3nPtBs40muxLfkqd3UaRWyQzuOqobEpti1tymAx3TipzxJcOKMqo2LH
	RsejBwY5Fn48gIUxZbbmF6rkh21S9+5aa/v87LjS28Y71o1tr2rsddKiwx5Jcwvh8+bC
	Zfv5DQl7fA0y6NdQ8YzTNg1vARywct6bH/uI4RxT18kz5wZd/7ePiXdw8ozkcner2U9w
	mW2LHAD5YE68oafUOPrspI82DLES2hmLyHvKzZ6GFLuU3qi36M04K18ruCDPhufIhGzM
	T/oeKMYd6jBhCmqGuqJPOowFBcwxS/U7GxHE+KndXtn1nhd2rkYyaG8GZBqwv4HAROqx
	jYtw==
X-Gm-Message-State: AIkVDXLPte4ocPyT6jVLrk00Wk07oC4AhZ7RV4HKT7/2Q4u9xZXyfG+7rk/JvQk7t2SPJQbv7OzVyVpND6J27Q==
X-Received: by 10.176.71.86 with SMTP id i22mr19219400uac.31.1483027225051;
	Thu, 29 Dec 2016 08:00:25 -0800 (PST)
MIME-Version: 1.0
References: <20161229133508.5584-1-ricardo.ribalda@gmail.com>
In-Reply-To: <20161229133508.5584-1-ricardo.ribalda@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 29 Dec 2016 16:00:14 +0000
Message-ID: <CAMKF1spXWGsW6S=tWgsduPB3SJ=8f5M27dx819mw6sAMGUS32g@mail.gmail.com>
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>, martin.jansa@gmail.com,
	openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [PATCH 1/2] protobuf: Update to latest version 3.1.0
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
X-List-Received-Date: Thu, 29 Dec 2016 16:00:25 -0000
Content-Type: text/plain; charset=UTF-8

What changed in license that resulted in md5 checksums change

On Thu, Dec 29, 2016 at 5:35 AM Ricardo Ribalda Delgado <
ricardo.ribalda@gmail.com> wrote:

> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
>
> ---
>
>  .../protobuf/{protobuf_2.6.1.bb => protobuf_3.1.0.bb}               | 6
> +++---
>
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
>  rename meta-oe/recipes-devtools/protobuf/{protobuf_2.6.1.bb =>
> protobuf_3.1.0.bb} (83%)
>
>
>
> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_2.6.1.bb
> b/meta-oe/recipes-devtools/protobuf/protobuf_3.1.0.bb
>
> similarity index 83%
>
> rename from meta-oe/recipes-devtools/protobuf/protobuf_2.6.1.bb
>
> rename to meta-oe/recipes-devtools/protobuf/protobuf_3.1.0.bb
>
> index 7b8f62986a41..18210b1e5c8f 100644
>
> --- a/meta-oe/recipes-devtools/protobuf/protobuf_2.6.1.bb
>
> +++ b/meta-oe/recipes-devtools/protobuf/protobuf_3.1.0.bb
>
> @@ -12,11 +12,11 @@ DEPENDS = "zlib"
>
>  RDEPENDS_${PN}-compiler = "${PN}"
>
>  RDEPENDS_${PN}-dev += "${PN}-compiler"
>
>
>
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=af6809583bfde9a31595a58bb4a24514"
>
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=35953c752efc9299b184f91bef540095"
>
>
>
> -SRCREV = "bba83652e1be610bdb7ee1566ad18346d98b843c"
>
> +SRCREV = "a428e42072765993ff674fda72863c9f1aa2d268"
>
>
>
> -PV = "2.6.1+git${SRCPV}"
>
> +PV = "3.1.0+git${SRCPV}"
>
>
>
>  SRC_URI = "git://github.com/google/protobuf.git"
>
>
>
> --
>
> 2.11.0
>
>
>
>

