Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id C6ADA7D217
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Jul 2019 02:39:38 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id f25so6860883pgv.10
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 07 Jul 2019 19:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=ldLQwFi2bSq6rvByHsXTDYniKrJkDEKatkCAy2Q4uH4=;
	b=hArHrkT2X9M3x2spG1yIekAt4egYhXd/oYJGhq9KuaWSVP3EtfbqV+PPkI8ISdiCg9
	YpLLN5/ggkGteeFWhN1XrheBXVaEFeTFH0OpVPJA8iu2xF5K22fAR1eWwQxieCYOoXx9
	Zx+BRGitAXOcWYJUaVz6Wsarysi7WokfeYQ4OaQqCmOMjkY28y+OXeB81Kf2uEM28aSF
	C7Z0A1TN9Lpo+BZ/yQsu+LXEvM2wuuBgJcv2niPZvivl6mCS2osBKPQGOv3x7BTbB1gM
	n10MLtt0X0lPfsDOuydJ8uH0Ep/EM3fAJ85sVEy98um+WMw9G9qfETdQ6Pm7K4mhZZW/
	+1Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=ldLQwFi2bSq6rvByHsXTDYniKrJkDEKatkCAy2Q4uH4=;
	b=tfNn3J97QKMl169aaHQLcUfTomg+4AO5lAf8gSMVD5qu517dBvz33ZXu3eoX3IluMj
	vcnvEuPr29Wx1Uj2jv+0fe5ILeAwo2XFvYBOdugMk0Hx+IhWcuKrAw59XJl7fck8aqOC
	BPKYuWeyvNnw8+sazz279J1gEATDh9ZB/P6mq8sSO1ywwHzuaqIfpYmTSL/aWhIyM96A
	OJkmQAXtIOzKTiowZa4gteWbaAXQAe7MY3MtVC/Q4zkPtjrQqvj6aSVzZeEr7SrHjq7n
	J5fLU2tWD+88z/O06rf2++YtIQ/j1vmqTvuTBCWQx5TW5AJLyWsft36g41gyC/A2LfDA
	vBOg==
X-Gm-Message-State: APjAAAUMaOd84xwIkeH/ArXH95AXFU5dA6nT+tdEyIi/Yc0lcL26r5/a
	wHn828YVLBqVHbcdLzP0CuDhlfkqdb8=
X-Google-Smtp-Source: APXvYqyn3OTbgrEg5ca5kBOcmPvQ4o9VfqbgnOySkR+M7dykaAYQ0upT7nsTU3PucF5nKThbdCduCw==
X-Received: by 2002:a63:6507:: with SMTP id z7mr19472314pgb.186.1562553579730; 
	Sun, 07 Jul 2019 19:39:39 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:c2e:f46a:e59c:dae7?
	([2601:202:4180:c33:c2e:f46a:e59c:dae7])
	by smtp.gmail.com with ESMTPSA id
	p23sm17866635pfn.10.2019.07.07.19.39.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 07 Jul 2019 19:39:39 -0700 (PDT)
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>,
	openembedded-devel@lists.openembedded.org
References: <20190708003555.8064-1-open.source@oleksandr-kravchuk.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <d3a2b3cd-906f-d652-e5d8-f721fc3848f3@gmail.com>
Date: Sun, 7 Jul 2019 19:39:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190708003555.8064-1-open.source@oleksandr-kravchuk.com>
Subject: Re: [PATCH][meta-networking] mosquitto: update to 1.6.3
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
X-List-Received-Date: Mon, 08 Jul 2019 02:39:38 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 7/7/19 5:35 PM, Oleksandr Kravchuk wrote:
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>  .../mosquitto/{mosquitto_1.5.8.bb => mosquitto_1.6.3.bb} | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>  rename meta-networking/recipes-connectivity/mosquitto/{mosquitto_1.5.8.bb => mosquitto_1.6.3.bb} (89%)
>
> diff --git a/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.5.8.bb b/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.6.3.bb
> similarity index 89%
> rename from meta-networking/recipes-connectivity/mosquitto/mosquitto_1.5.8.bb
> rename to meta-networking/recipes-connectivity/mosquitto/mosquitto_1.6.3.bb
> index 768b5930f..0a2555747 100644
> --- a/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.5.8.bb
> +++ b/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.6.3.bb

There is more here than just a version updates. Please explain what the
other changes are.

- armin
> @@ -1,5 +1,7 @@
>  SUMMARY = "Open source MQTT v3.1/3.1.1 implemention"
> -DESCRIPTION = "Mosquitto is an open source (Eclipse licensed) message broker that implements the MQ Telemetry Transport protocol version 3.1 and 3.1.1. MQTT provides a lightweight method of carrying out messaging using a publish/subscribe model. "
> +DESCRIPTION = "Mosquitto is an open source (Eclipse licensed) message broker that \
> +implements the MQ Telemetry Transport protocol version 3.1 and 3.1.1. MQTT provides \
> +a lightweight method of carrying out messaging using a publish/subscribe model. "
>  HOMEPAGE = "http://mosquitto.org/"
>  SECTION = "console/network"
>  LICENSE = "EPL-1.0 | EDL-1.0"
> @@ -14,8 +16,8 @@ SRC_URI = "http://mosquitto.org/files/source/mosquitto-${PV}.tar.gz \
>             file://mosquitto.init \
>  "
>  
> -SRC_URI[md5sum] = "bbbcceb32db3657d9d436a8440a9db1c"
> -SRC_URI[sha256sum] = "78d7e70c3794dc3a1d484b4f2f8d3addebe9c2da3f5a1cebe557f7d13beb0da4"
> +SRC_URI[md5sum] = "bd19cf124459ee26040912786ef177f7"
> +SRC_URI[sha256sum] = "9ef5cc75f4fe31d7bf50654ddf4728ad9e1ae2e5609a4b42ecbbcb4a209ed17e"
>  
>  inherit systemd update-rc.d useradd
>  
> @@ -66,6 +68,7 @@ PACKAGE_BEFORE_PN = "${PN}-examples"
>  
>  FILES_${PN} = "${sbindir}/mosquitto \
>                 ${bindir}/mosquitto_passwd \
> +               ${bindir}/mosquitto_rr \
>                 ${sysconfdir}/mosquitto \
>                 ${sysconfdir}/init.d \
>                 ${systemd_unitdir}/system/mosquitto.service \


