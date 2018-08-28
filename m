Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
	[66.111.4.25])
	by mail.openembedded.org (Postfix) with ESMTP id 168A278FB9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Aug 2018 00:21:17 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 1C6F82102F;
	Mon, 27 Aug 2018 20:14:37 -0400 (EDT)
Received: from web2 ([10.202.2.212])
	by compute4.internal (MEProxy); Mon, 27 Aug 2018 20:14:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; bh=pqEgOZrOJdvUXdRFDwo+ktWor/EjO
	kcnWeS8Gkc4WiE=; b=oLSfg/hQgTDdCxu/8M6Y8FH9s7HhLT2vvQoFRAYptRYuj
	XBuZfQBdyib+qU5EsYcnbL5fnGvMhFzkPJnL/OWZZGR0OxBVDry1t+weHI2tz9pA
	6tgUvkq6q4yhQQS6zMlgI1rdbVJbSlGR+zSzj0p1LSHac6I0XD35wiAWA4g93iG7
	i9Bt7YDe2T5bjTo/TFjGskJzQmT3sNcwRpiMEdy/IENoyhM68gD1jZtfn5QNMR0p
	qlocraooWGEAhx89Bcp1WN7dGSK6QFcsrcSRbUDtUji54CvZeReO6YRY43KAMfXw
	sTp8kwTkVUuCFa6Z9mgbCvbjTp2yolLPRfXKuoo9Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=pqEgOZ
	rOJdvUXdRFDwo+ktWor/EjOkcnWeS8Gkc4WiE=; b=Mb0D+GOMDuQwXBU0iu55t7
	IogBDda/R4gkEFv2PKXxSkci1L4mf25Glcv+xl4Q6n1Y7WUcqgQAfBwUtwFyjYGL
	uRalQCasqipu2r9uIbzb9bck+bn2uTJE7VlqyI2aCTAEuzMS1Q4LzZNwz25dQIi6
	w+GoyZYcmwyW3Cs0SvmyGmlM3dqBfboiLb2txks4fHSL54+I/9VMylfcUAtbQTMm
	ELOemd8lrNUiEFvBmX+HzoPtcprCdLKi9zcivgSTjJcD34KT7nO6t0lO3xYs1f7M
	YUAZSep+pWVIM7PrgL80pj2FcEtxU7renNVhoRheK/BB0kDAWsfnT6SL+SUZL7Xg
	==
X-ME-Proxy: <xmx:7JOEWzoqFRbJxTDdsDqF3kTZWSFp8cYAaBr2yuSGvfJqrCYrMEgW-w>
	<xmx:7JOEW90MtNgeFPm-WgqO04jnhwr5-DGIR0JekR-YQ87Byx_udOkNxA>
	<xmx:7JOEWyBRzrHywcBUE_99EUfSCRJQpEO8mmJ5l5JHl7P7ZBl3x9z2bA>
	<xmx:7JOEW1fIAYWkNqTnt_aYfgCqevDxcYqQaBFwsxkosYka2lmgu3_8fA>
	<xmx:7JOEW3hijPt90K_shRaJTKFXSY0PfpU0u0RglHP3-GqbnapbzkcYpA>
	<xmx:7ZOEWwsJaaodzK4dTYYQf4CVagero5Zp7Xx9z3u6JhnRcofPT4bnOw>
X-ME-Sender: <xms:7JOEWwUJM_gA__S5GEc2ICknvSOassK1I4CfLMrcsxxapb_xWYXrqg>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
	id A57F462650; Mon, 27 Aug 2018 20:14:36 -0400 (EDT)
Message-Id: <1535415276.1026210.1488127592.5F0F27C7@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
X-Mailer: MessagingEngine.com Webmail Interface - ajax-7b72137a
References: <20180824163456.10528-1-raj.khem@gmail.com>
In-Reply-To: <20180824163456.10528-1-raj.khem@gmail.com>
Date: Tue, 28 Aug 2018 09:44:36 +0930
Subject: Re: [meta-python][PATCH 1/2] python-pyflame: Limit support to just glibc based systems
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
X-List-Received-Date: Tue, 28 Aug 2018 00:21:17 -0000
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"

On Sat, 25 Aug 2018, at 02:04, Khem Raj wrote:
> Fixes:
> | checking build system type... x86_64-pc-linux-gnu
> | checking host system type... x86_64-bec-linux-musl
> | configure: error: Pyflame can only be built for Linux hosts
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Andrew Jeffery <andrew@aj.id.au>

Acked-by: Andrew Jeffery <andrew@aj.id.au>

Thanks Khem!

> ---
>  meta-python/recipes-devtools/python/python-pyflame.inc | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta-python/recipes-devtools/python/python-pyflame.inc b/
> meta-python/recipes-devtools/python/python-pyflame.inc
> index 3b84a7e8f8..2ee79f7b8a 100644
> --- a/meta-python/recipes-devtools/python/python-pyflame.inc
> +++ b/meta-python/recipes-devtools/python/python-pyflame.inc
> @@ -10,3 +10,4 @@ S = "${WORKDIR}/git"
>  
>  inherit pkgconfig autotools
>  
> +COMPATIBLE_HOST_libc-musl_class-target = "null"
> -- 
> 2.18.0
> 

