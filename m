Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id D1969609B9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Feb 2020 04:59:47 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id j4so6280343pgi.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Feb 2020 20:59:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=fAEvz/JlA0O1E1elYlIksdwwCxa+3CWlsTYtCfOVAps=;
	b=FZ5cv+GNaQowfTRT+GRT6hycrnnM3NZYh7U0BBP/TUDnE5uQNk4wT/wJN9xkiCR+v/
	SbN5TlgldzZtWIGSl5Sq+AmO26LFKnCmjL6KL0XYIWHqdYPeldfp68ZVGxVnWX2PubZR
	SUqSgcxo534lEUGECO42BqTGFWfZvD5/a9JRjbYYULXYeMRKXO18lbpIKlIZmu3bDrTf
	rojCgBMnSQQMO1IBWdMN8+sOeaV8Fy6u+QYW4OE3Xtaku2f8rGhOZEv71vRnsUprLuMu
	Ms9ovu6F41UXLBymr04gs4zkOQCQTibSxE5AFq1Gao3OMOdx2FNQ2RzbpEP7B4EfoJdU
	N9mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=fAEvz/JlA0O1E1elYlIksdwwCxa+3CWlsTYtCfOVAps=;
	b=NeP6DMGW2WWlApYpILSFdqafhtoCwSqLlV4FWieaGaL0I6HLHjP8cnyHNPixzgx/2i
	YVh3X53pz0sH7Ba9WyR3+IOsDFkDvN+5bPdf41IhxFLXjTJDQh2wrCdjp8PG2jhGEb9o
	UAE+GIWMOM5YNMtcqeUiLg4Wxjhu5ocOCVoqEYwWharROPJKZoLqZUZtl0OsEjWY+gEp
	od6XT2tT9NuVsxfQvH7byRGZ7YAIDk3ZnVOCxDzJgXA+Zo6H8eUkJeJ5u1PSBwtxsoHZ
	KE/DOd+v4GBSKWyFVLCQV6K3nNv6jxESqummtM3Uw0VpxcdGTsRdoArNw0I0YQ7nOG0i
	IDNw==
X-Gm-Message-State: APjAAAVHHsW+sOmY0cmhyUHU4iUx5JySw6ffXqWvG9TME2sYvIM8I4/f
	6iw5/oRjLytCL9KiLrgqekQiG5zTC6w=
X-Google-Smtp-Source: APXvYqx/gfXi9yR2gP/BUgiiD+UEARopwjitwaEwEXx2Px275tk8VgTVDPV8la2LBWKcN6Ijvqd9ag==
X-Received: by 2002:a62:3343:: with SMTP id z64mr52937732pfz.150.1582606788375;
	Mon, 24 Feb 2020 20:59:48 -0800 (PST)
Received: from ?IPv6:2601:646:9200:4e0:a81f:d24b:3e8b:cce0?
	([2601:646:9200:4e0:a81f:d24b:3e8b:cce0])
	by smtp.gmail.com with ESMTPSA id
	o6sm11721094pfg.180.2020.02.24.20.59.47
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 24 Feb 2020 20:59:47 -0800 (PST)
To: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>,
	openembedded-devel@lists.openembedded.org
References: <1582536523-89923-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <549f56c2-9056-ff8c-96f4-713437fc8de0@gmail.com>
Date: Mon, 24 Feb 2020 20:59:47 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1582536523-89923-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
Subject: Re: [meta-networking][PATCH] daq: upgrade 2.0.6 -> 2.2.2
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
X-List-Received-Date: Tue, 25 Feb 2020 04:59:47 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 2/24/20 1:28 AM, Zheng Ruoqin wrote:
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ---
>   .../recipes-connectivity/daq/{daq_2.0.6.bb => daq_2.2.2.bb}   | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-networking/recipes-connectivity/daq/{daq_2.0.6.bb => daq_2.2.2.bb} (88%)
> 
> diff --git a/meta-networking/recipes-connectivity/daq/daq_2.0.6.bb b/meta-networking/recipes-connectivity/daq/daq_2.2.2.bb
> similarity index 88%
> rename from meta-networking/recipes-connectivity/daq/daq_2.0.6.bb
> rename to meta-networking/recipes-connectivity/daq/daq_2.2.2.bb
> index 42ffb17a1..29ac5c770 100644
> --- a/meta-networking/recipes-connectivity/daq/daq_2.0.6.bb
> +++ b/meta-networking/recipes-connectivity/daq/daq_2.2.2.bb
> @@ -25,8 +25,8 @@ EXTRA_OECONF = "--disable-nfq-module --disable-ipq-module --includedir=${include
>   PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
>   PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
>   
> -SRC_URI[md5sum] = "2cd6da422a72c129c685fc4bb848c24c"
> -SRC_URI[sha256sum] = "b40e1d1273e08aaeaa86e69d4f28d535b7e53bdb3898adf539266b63137be7cb"
> +SRC_URI[md5sum] = "c61f60674a5f951f0c50faf33a611fee"
> +SRC_URI[sha256sum] = "7cd818cabb1ad35360e83076e54775f07165ee71407dc672d147e27d3cd37f7b"
>   
>   inherit autotools
>   
> 
This is causing snort build failures since we use snort 2.9

https://errors.yoctoproject.org/Errors/Details/392611/

Perhaps we need to upgrade snort 3.0 and daq together

