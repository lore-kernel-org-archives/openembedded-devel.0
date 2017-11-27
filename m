Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 91B97783B2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Nov 2017 18:14:34 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id j16so19036006pgn.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Nov 2017 10:14:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=XHXWHfYs/jmze51bskcXEkwt32x5u5g4jorHITqMMes=;
	b=urkYeqCiXdJ/n2oOiM2VL6HqgEtKUGVy/mGtYBKMyhI9+hq4wxAI41LBu9IoFhPfgg
	qya/+EZJ8yfu1FIS1ao4lYjr27sAvYhOR33jEuol212kaWjFgMCgmLBQxcIRQZciIiEC
	bEXXiI70Pqst1v478vmJvFXRNk/KpUIHxr0uMloP8pPaBnrRfLzEmMZxpZ5pe9JVvJ5I
	Nf6GH9+P79ET6dtpF97TNIhxRCMErFOQAxqubeKexUwKtHqBK0P9YZOY968G7dmyFJJN
	T1ViopFGl4y3nJZH6nZbzIi0lGDGNMDPSq7QEvXhX1j/jMfLZwyjklERqEHXjF92Mf0g
	Qbpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=XHXWHfYs/jmze51bskcXEkwt32x5u5g4jorHITqMMes=;
	b=mUkosiGXl2jP+/gzcggZKuoRO/i/lYPrxuHeSi8qDrNkKlHt6MJQVgM1mffQYb4Q04
	hNevZEeNi5Ph7KvAYCxgTwgv+vlK9WcZAHkJ/91MVV+TG/X+8kp7wtPpvwYTgc//x6Gg
	yx2DySmB2u1ffZrMUI5sz3kpsR4NJ6N4ZQZUl4YqPfG0PIvIz2Da19rCk9C7/lrMnTOz
	RfpxWrasMOhS33Ouj1Hx1GjIK5sash5U60bzVghEwbTrl3te5+qQ57jaDWg9ylMLQzGw
	pchcM4TXdsW6KK4OzmWIEYXWmWhZ4cj3KLmy5JExcub3EYfkCCiqG2zclYIlSR5eNMoQ
	NZ+A==
X-Gm-Message-State: AJaThX44GLbcCp0pDfz12w99Kkpn8FFIQJ2SMKI6m2bXwDreo6Lzpqh0
	6GHeA2/JMIRAIyosb4EMJq2Rh6Mr
X-Google-Smtp-Source: AGs4zMaFI1BTiWPEPzdn8gRfgJzsYlenYvwk3tsfvwg7iS8vGInGHhTjcwAc6lp5Uz8o36fmE7o9UA==
X-Received: by 10.101.82.130 with SMTP id y2mr37455848pgp.65.1511806475340;
	Mon, 27 Nov 2017 10:14:35 -0800 (PST)
Received: from hermes.local ([2601:646:8880:466c:f197:f068:b85:adc4])
	by smtp.gmail.com with ESMTPSA id
	h69sm50679889pfk.166.2017.11.27.10.14.34
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 27 Nov 2017 10:14:34 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <1511798104-16019-1-git-send-email-derek@asterius.io>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <5a08d5c2-ca51-49d2-4939-f151035d3d0a@gmail.com>
Date: Mon, 27 Nov 2017 10:14:33 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:56.0)
	Gecko/20100101 Thunderbird/56.0
MIME-Version: 1.0
In-Reply-To: <1511798104-16019-1-git-send-email-derek@asterius.io>
Subject: Re: [meta-python][PATCH] python-grpcio: only modify the compiler arguments on the target build
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
X-List-Received-Date: Mon, 27 Nov 2017 18:14:34 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 11/27/17 7:55 AM, Derek Straka wrote:
> The modification causes issues with the native builds of the package:
> 
> src/core/lib/surface/lame_client.cc: In function ‘grpc_channel* grpc_lame_client_channel_create(const char*, grpc_status_code, const char*)’:
> src/core/lib/surface/lame_client.cc:178:3: warning: ‘auto’ changes meaning in C++11; please remove it [-Wc++0x-compat]
>      auto chand = reinterpret_cast<grpc_core::ChannelData *>(elem->channel_data);
>      ^
> src/core/lib/surface/lame_client.cc:178:8: error: ‘chand’ does not name a type
>      auto chand = reinterpret_cast<grpc_core::ChannelData *>(elem->channel_data);
> 

This looks like an option issue for different compiler version on your 
build host. The patch is trying to paper over it. I think it will be 
better if we could fix the code to be using right options across 
different compiler versions.

> Signed-off-by: Derek Straka <derek@asterius.io>
> ---
>   meta-python/recipes-devtools/python/python-grpcio_1.7.0.bb              | 2 +-
>   meta-python/recipes-extended/python-pyparted/python-pyparted_3.10.7.bb  | 2 --
>   meta-python/recipes-extended/python-pyparted/python3-pyparted_3.10.7.bb | 2 --
>   3 files changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/meta-python/recipes-devtools/python/python-grpcio_1.7.0.bb b/meta-python/recipes-devtools/python/python-grpcio_1.7.0.bb
> index 3ca7d53..d4d869d 100644
> --- a/meta-python/recipes-devtools/python/python-grpcio_1.7.0.bb
> +++ b/meta-python/recipes-devtools/python/python-grpcio_1.7.0.bb
> @@ -4,7 +4,7 @@ SECTION = "devel/python"
>   
>   DEPENDS = "python-protobuf"
>   
> -SRC_URI += "file://0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch \
> +SRC_URI_append_class-target = "file://0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch \
>              "
>   RDEPENDS_${PN} = "python-enum34 \
>                     python-futures \
> diff --git a/meta-python/recipes-extended/python-pyparted/python-pyparted_3.10.7.bb b/meta-python/recipes-extended/python-pyparted/python-pyparted_3.10.7.bb
> index 8a15a89..81d61c6 100644
> --- a/meta-python/recipes-extended/python-pyparted/python-pyparted_3.10.7.bb
> +++ b/meta-python/recipes-extended/python-pyparted/python-pyparted_3.10.7.bb
> @@ -1,7 +1,5 @@
>   require python-pyparted.inc
>   
> -DEPENDS += "python-re"
> -
>   PV = "3.10.7+git${SRCPV}"
>   
>   inherit distutils
> diff --git a/meta-python/recipes-extended/python-pyparted/python3-pyparted_3.10.7.bb b/meta-python/recipes-extended/python-pyparted/python3-pyparted_3.10.7.bb
> index ff72c2a..4d6f97b 100644
> --- a/meta-python/recipes-extended/python-pyparted/python3-pyparted_3.10.7.bb
> +++ b/meta-python/recipes-extended/python-pyparted/python3-pyparted_3.10.7.bb
> @@ -1,7 +1,5 @@
>   require python-pyparted.inc
>   
> -DEPENDS += "python3-re"
> -
>   PV = "3.10.7+git${SRCPV}"
>   
>   inherit distutils3
> 

