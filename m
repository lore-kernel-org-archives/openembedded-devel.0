Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id D6A6A789CE
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  4 Mar 2018 15:02:31 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id 9-v6so2772350ple.11
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 04 Mar 2018 07:02:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=RkvCQOElyttokssDzaaf/Gay0wIs6/v7YeAhacxShKU=;
	b=qpB41WiMl4cf0C9PE7GXWhkY5l1YJvzM5lz6in+f5qkAJWMhrqtA4gUgUEX7hmbkP4
	0bVicRQ5+GTcrJg2lA/d3BDSh60SoO6il0XHGpIIvOiBKvH4CrZIGzJ/RUDaoAHXr7PM
	JV3D1S6tzIjW4ENW4kbkuaq+Gigk37KMrAshl2R5FZicMTxAXvRWYVhR4JnrFMtGtCm3
	4zvsOTcFYt33mukxAzGoUuyvqCg4orr+Gzi4DM+tklB0CuU9QimBf+GCkFRbN7pbd5I2
	5+Xn+xETK7w2C3SCeOS0QhYseWEfzOF4l+v2gllcfN4txQ3/25OuqBpwUOxqjZI52Zef
	ju/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=RkvCQOElyttokssDzaaf/Gay0wIs6/v7YeAhacxShKU=;
	b=g+jgHKG0AQg7sisDbM1X2+IYDkiNVl9gRUTJylM8iiF77Id/+Ioq+lOxlvaVxhp2Qc
	E+Z7HKPSk0x6rEAaq6P0F9uKcWfCAL5gJkmoUvn2Xset9BlHwy8yguz+N3UEax9yj/Hl
	R/TRyiwCdbOuzNpTtjqpiXF9wtDWQthCUnJtK5TyOXiFNHlMolNaekA98DX032nfOH+q
	Y7bJCvxUVg7pJp+Z+tXmJ7l9bOpzt8mZGrYeUSb9JsFAQeQaaaE25cW64aFY2U4T+x9s
	J+ac0tp33kCzSIoJKRaM6fanqzOAEE0+W4lc1BY+JSyNDWXJyVkZirIhd/jxle+gkiNy
	qatA==
X-Gm-Message-State: APf1xPD3IXZ6Nrwh5USUHd0LCJyCjj/K6wy6ZbAgtVWT8FaRRxjGRQR1
	5SZbpdEhG5T1U+p50+Yo1xsr1g==
X-Google-Smtp-Source: AG47ELs0IzaxBOP+Atsgsa4yvyU8EjYV4OPekEK2mkqYg1IC9APyXoQ1AbH3y/EC9x1tC5iZIf+k5w==
X-Received: by 2002:a17:902:d682:: with SMTP id
	v2-v6mr10364090ply.348.1520175749378; 
	Sun, 04 Mar 2018 07:02:29 -0800 (PST)
Received: from ?IPv6:2601:202:4000:1184:6dbb:c9f4:e105:a5b4?
	([2601:202:4000:1184:6dbb:c9f4:e105:a5b4])
	by smtp.gmail.com with ESMTPSA id
	75sm22825089pfl.169.2018.03.04.07.02.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 04 Mar 2018 07:02:28 -0800 (PST)
To: Martin Jansa <martin.jansa@gmail.com>,
	openembedded-devel@lists.openembedded.org
References: <20180301103813.8027-1-Martin.Jansa@gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <277b760d-e7b1-833b-c671-26fc1cc50942@gmail.com>
Date: Sun, 4 Mar 2018 07:02:28 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180301103813.8027-1-Martin.Jansa@gmail.com>
Subject: Re: [meta-oe][PATCH] xrdp, xorgxrdp: require pam in DISTRO_FEATURES
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
X-List-Received-Date: Sun, 04 Mar 2018 15:02:31 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 03/01/2018 02:38 AM, Martin Jansa wrote:
> * libpam dependency was added to xrdp in
>   http://git.openembedded.org/meta-openembedded/commit/?id=cc32ca8030c02a2b1b22f6b43e1894dc5f00e14e

Please rebase

- armin
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.2.5.bb | 2 +-
>  meta-oe/recipes-support/xrdp/xrdp_0.9.4.bb          | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.2.5.bb b/meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.2.5.bb
> index 9355379840..558a1982f5 100644
> --- a/meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.2.5.bb
> +++ b/meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.2.5.bb
> @@ -8,7 +8,7 @@ inherit autotools pkgconfig
>  DEPENDS = "virtual/libx11 xserver-xorg xrdp nasm-native"
>  
>  inherit distro_features_check
> -REQUIRED_DISTRO_FEATURES = "x11"
> +REQUIRED_DISTRO_FEATURES = "x11 pam"
>  
>  SRC_URI = "git://github.com/neutrinolabs/xorgxrdp.git"
>  
> diff --git a/meta-oe/recipes-support/xrdp/xrdp_0.9.4.bb b/meta-oe/recipes-support/xrdp/xrdp_0.9.4.bb
> index 88e309a59f..671a251962 100644
> --- a/meta-oe/recipes-support/xrdp/xrdp_0.9.4.bb
> +++ b/meta-oe/recipes-support/xrdp/xrdp_0.9.4.bb
> @@ -8,7 +8,7 @@ inherit distro_features_check autotools pkgconfig useradd systemd
>  
>  DEPENDS = "openssl virtual/libx11 libxfixes libxrandr libpam nasm-native fuse"
>  
> -REQUIRED_DISTRO_FEATURES = "x11"
> +REQUIRED_DISTRO_FEATURES = "x11 pam"
>  
>  SRC_URI = "git://github.com/neutrinolabs/xrdp.git \
>             file://xrdp.sysconfig \


