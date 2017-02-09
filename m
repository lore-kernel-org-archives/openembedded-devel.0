Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 56A0B60248
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Feb 2017 20:22:16 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id v77so4536192wmv.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Feb 2017 12:22:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=Aiq/Fwobh3dOyU0DYwYoXG+YMBNa159LZhDQ48JWfvc=;
	b=LxRFHI52WhA9SQBqOo6+66wfUE4tA1RoQQhqEWST2X8WXDOs2miMfFnktWZuMqZ99X
	VVtDd5JeUtgmo8ISxABRWnI6L19ZPySFXJlS+cdPaEVnVAcsV8c77E8IxkpSsv7q1exV
	v3Rp0VR7MVgOqaElmNeiTyIHo/TQ06bdyXfsSawrF7jLhTdXfYtZPKx9K/WbA+hOCbdy
	lHb6OIVTe1heL058LxYHZBFkFRdaag6+1VuqZ0chgtmXs1Gt4QObxKg0Ak4MPv1dOOWM
	1F8DkfpDfm1ZC1oyRipsxh9b+CRvF92f32SRQyOkvReS/vw5NlElYihH2dqynfwk8Ob6
	qstQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=Aiq/Fwobh3dOyU0DYwYoXG+YMBNa159LZhDQ48JWfvc=;
	b=lw0A6BKyzp71nLgt9ohbU0iURuL67+KDCTGZo+zra94nicW7spj/cg/Y0qMwvEKEy/
	UMAw1JMSeiixn6+T8NqbzeNGlxbc6D+PMKAKkdrevyywuXVDu6adZV40bCMg8/IGlMbk
	PsDSghFKtqfP8bA8rCVxES0Z6+5P0OgZjXpimbAL16KJi8/16hA+IQD9vK3fCvsM8SQg
	0URoosjy74OEspsbZIzMrgm7R37YMG6blIQM8mYy1O32unoosbbqw1XoU5fVBFNb2sNb
	qsiji9cEUiHQDr+pE8X9JMAjisOrCcDliQx87jOg+/E8PJI86PERm7zTLMd0FcFHixkS
	lUeg==
X-Gm-Message-State: AMke39kYku3+F9JaRd8GGI4buDk8BMuRvfcRHUkS1rzMNjZDr/GBoImoHzisI0mYFWYHF3CBN78JoBEI2HcOwA==
X-Received: by 10.28.94.8 with SMTP id s8mr23053414wmb.117.1486671736650; Thu,
	09 Feb 2017 12:22:16 -0800 (PST)
MIME-Version: 1.0
Received: by 10.195.17.228 with HTTP; Thu, 9 Feb 2017 12:22:16 -0800 (PST)
In-Reply-To: <20170209194821.30766-3-fabio.berton@ossystems.com.br>
References: <20170209194821.30766-1-fabio.berton@ossystems.com.br>
	<20170209194821.30766-3-fabio.berton@ossystems.com.br>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 9 Feb 2017 12:22:16 -0800
Message-ID: <CAJ86T=X44=df2c3Fami6=Lo58rPYEOXePQXUvpwV9Uout3Fr9Q@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v3 3/3] libwebsockets: Add recipe for version 2.1.0
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
X-List-Received-Date: Thu, 09 Feb 2017 20:22:17 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Feb 9, 2017 at 11:48 AM, Fabio Berton
<fabio.berton@ossystems.com.br> wrote:
> Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
> ---
>  .../libwebsockets/libwebsockets_2.1.0.bb           | 28 ++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>  create mode 100644 meta-oe/recipes-connectivity/libwebsockets/libwebsockets_2.1.0.bb
>
> diff --git a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_2.1.0.bb b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_2.1.0.bb
> new file mode 100644
> index 000000000..ffade88ac
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_2.1.0.bb
> @@ -0,0 +1,28 @@
> +SUMMARY = "Canonical libwebsockets.org websocket library"
> +HOMEPAGE = "https://libwebsockets.org/"
> +LICENSE = "LGPL-2.1"
> +LIC_FILES_CHKSUM = "file://LICENSE;;md5=e3393a657830d4a118c5a6ed35ba53d0"

Typo, double ";"

> +DEPENDS = "zlib"
> +
> +SRC_URI = "https://github.com/warmcat/libwebsockets/archive/v${PV}.tar.gz"
> +
> +SRC_URI[md5sum] = "4df3be57dee43aeebd54a3ed56568f50"
> +SRC_URI[sha256sum] = "bcc96aaa609daae4d3f7ab1ee480126709ef4f6a8bf9c85de40aae48e38cce66"
> +
> +inherit cmake pkgconfig
> +
> +PACKAGECONFIG ?= "libuv client server http2 ssl"
> +PACKAGECONFIG[client] = "-DLWS_WITHOUT_CLIENT=OFF,-DLWS_WITHOUT_CLIENT=ON,"
> +PACKAGECONFIG[http2] = "-DLWS_WITH_HTTP2=ON,-DLWS_WITH_HTTP2=OFF,"
> +PACKAGECONFIG[ipv6] = "-DLWS_IPV6=ON,-DLWS_IPV6=OFF,"
> +PACKAGECONFIG[libev] = "-DLWS_WITH_LIBEV=ON,-DLWS_WITH_LIBEV=OFF,libev"
> +PACKAGECONFIG[libuv] = "-DLWS_WITH_LIBUV=ON,-DLWS_WITH_LIBUV=OFF,libuv"
> +PACKAGECONFIG[server] = "-DLWS_WITHOUT_SERVER=OFF,-DLWS_WITHOUT_SERVER=ON,"
> +PACKAGECONFIG[ssl] = "-DLWS_WITH_SSL=ON,-DLWS_WITH_SSL=OFF,openssl"
> +PACKAGECONFIG[testapps] = "-DLWS_WITHOUT_TESTAPPS=OFF,-DLWS_WITHOUT_TESTAPPS=ON,"
> +
> +PACKAGES =+ "${PN}-testapps"
> +
> +FILES_${PN}-dev += "${libdir}/cmake"
> +FILES_${PN}-testapps += "${datadir}/libwebsockets-test-server/*"
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

