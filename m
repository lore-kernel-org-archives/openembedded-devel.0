Return-Path: <akuster808@gmail.com>
Received: from mail-il1-f196.google.com (mail-il1-f196.google.com
	[209.85.166.196])
	by mail.openembedded.org (Postfix) with ESMTP id CCD78605C6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jan 2020 13:22:32 +0000 (UTC)
Received: by mail-il1-f196.google.com with SMTP id f70so3021534ill.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jan 2020 05:22:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:autocrypt:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=W3yQtpYyYOVnBMqXW+nsVPeZEvPT/PWfVgtF8GTXGDo=;
	b=BX3hJRek/JZxy89t6cBGUM5kLCV3Vl80BKgOHF/iFeP5PzIWt0U6qkgftlBHmFfMmh
	/nurKw0A2hjCbvnNTFYOfMQOPU9lxYy+t9hiNPgh5wIeiG4bG3sfNU9PuRfFLkWUbgVs
	WCqaXxdiymvoO7ofIrt5Ko3mo0l42oxD2ocgawoxCGE+ljPQ+Nh3TtVe4mzFktsDyzZS
	WuH5+VaEQRWpCGWl6ayOIUQShGe1pr73Aq2iG29/XzqfsVM7VY0BBOyH6awo1xRDg/MI
	OaB2WFeKMCCK6557nOcZUq2behRwkv4pQTSM9AT9+2pGRusRTLmHOJpsArvSwgoGCQBF
	JPtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=W3yQtpYyYOVnBMqXW+nsVPeZEvPT/PWfVgtF8GTXGDo=;
	b=SpsqBghJeGpFV47Kt1thfhLcPyz2N47YamU7InWCVcSqxHkSFZNuokcnpqYnl2dtvn
	RFfAYzMYMkOaUmOfUsw0IvsAnZPfQ/8z5NXmXG2fswIwYFKcpUKKRDmVYeTkgAKjzTSf
	MLH2BUsjOeTnDnv5rAqr5au0Nd/AG4P+lswbWvKMZKVXAPsV2w7JaAhtQG955C7Sevav
	ZNAwax2w1o7IwXt80wVnMMJR+sbZjp590omDqP0nVy3s8NcTnEmNGk2jKQVLhN6GLOD+
	C8gXYe7w4ujpaq7x7fwOter/Xp6Opq3iSvdTxYyblgzqEaL3FGSE382CxgdAI+w7cRsd
	SJ9A==
X-Gm-Message-State: APjAAAX/5PTYMHkIZUpSwOit2Y+5ZRksEjj4AgUbsif6iEQwPZLvpbkQ
	4sj3QiWAMGz3wQ/1SsuUzEaWibOM
X-Google-Smtp-Source: APXvYqwp14y7HrlEUx48phRnM/ayRzqoeCuaGSKQ0s1JKnrxiqWMY6VKucEnWQyrDkJzQAqfUwFGww==
X-Received: by 2002:a63:3f47:: with SMTP id m68mr2825410pga.411.1580362328097; 
	Wed, 29 Jan 2020 21:32:08 -0800 (PST)
Received: from ?IPv6:2601:202:4180:a5c0:25aa:a762:1b4:49d3?
	([2601:202:4180:a5c0:25aa:a762:1b4:49d3])
	by smtp.gmail.com with ESMTPSA id
	t65sm4518407pgb.17.2020.01.29.21.32.06
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 29 Jan 2020 21:32:07 -0800 (PST)
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
References: <20200128215353.3594210-1-raj.khem@gmail.com>
From: akuster808 <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <fc466017-0803-06e9-ebc5-d8c6867a5229@gmail.com>
Date: Wed, 29 Jan 2020 21:32:06 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200128215353.3594210-1-raj.khem@gmail.com>
Subject: Re: [meta-networking][PATCH 1/3] squid: Link with libatomic on riscv
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
X-List-Received-Date: Thu, 30 Jan 2020 13:22:33 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 1/28/20 1:53 PM, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Is this for the same reason as for nodejs Cento7 fix ?

- armin
> ---
>  meta-networking/recipes-daemons/squid/squid_4.9.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta-networking/recipes-daemons/squid/squid_4.9.bb b/meta-networking/recipes-daemons/squid/squid_4.9.bb
> index 6f202cf401..19949acd84 100644
> --- a/meta-networking/recipes-daemons/squid/squid_4.9.bb
> +++ b/meta-networking/recipes-daemons/squid/squid_4.9.bb
> @@ -40,6 +40,8 @@ inherit autotools pkgconfig useradd ptest perlnative
>  
>  LDFLAGS_append_mipsarch = " -latomic"
>  LDFLAGS_append_powerpc = " -latomic"
> +LDFLAGS_append_riscv64 = " -latomic"
> +LDFLAGS_append_riscv32 = " -latomic"
>  
>  USERADD_PACKAGES = "${PN}"
>  USERADD_PARAM_${PN} = "--system --no-create-home --home-dir /var/run/squid --shell /bin/false --user-group squid"


