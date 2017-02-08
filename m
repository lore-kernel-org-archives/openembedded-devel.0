Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id BDCD571D06
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Feb 2017 20:16:51 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id u63so35056969wmu.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Feb 2017 12:16:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=yjm4z3/FNoe7Uvpmk1BVyusLdhxU0HZhmqL19GdZHQo=;
	b=vMdPnOxBM0MPC/u6EZnUya9mjJdaFCDs1LMWIiG/6hUpQoSJ5c2AoRkz6nuiIm+ZmQ
	hynnR1jNHoO8Y7+rKkO68PY4pn6qlcT3TokmasOFs4VtnzoN6RtJcALItxBXO3o+5NCs
	SNBVlQdwDjpw2Mz/kc18mKwwVwYo4OEmrFvuCKyZy7514EJNUSjU92Aw6+a2tUnhdins
	DZeJMGxEfACtqrXKQAwgCYQdHc+Hrw0Hs8Y8h7uAriY4lfK9ICRRREs14dBr2hsHLOyD
	NQZRbnvWu76FDLsH2AwtTx9sMrqn8VIqrMo/yjFpDV3tCEthnYwztZL6GA1uD67fmQ7a
	R9gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=yjm4z3/FNoe7Uvpmk1BVyusLdhxU0HZhmqL19GdZHQo=;
	b=EMElOkq+/0uWoTN3LhzaoWXFAEH3oF7A+ZCgwaHC2zaLzZdykYor8OM29QalqxD5wO
	BwYlGbTNty1Avdg6GthCojYjC3rtkcrhA95SkRjJRAsabBlhCSoVwS0TIoi0tCYfg+YW
	nLnKeXQeGjHIyZRUjpkSqhrHiqYAwJsDJqpH1WX+fj/LZXEMRbjs5bn5kJn7H9wqt46G
	FoCe7wyuIzh9+bSYtTXD3cFqMbwNP2qJgRXhQ1jQjNRyitF1MWAOJi9SgT89kCHvTgY7
	ga6WM3F9UrG37T6fwwneOaSGqT0HOz2KJ9PflGeejrB6+MwjztK1mJ3S4t3gqhE7jRNa
	/Lxg==
X-Gm-Message-State: AMke39kS8kw+Znh7w0E8mt3psgmp+ZPlziPSQ+ank5QFtpWBfzgze+k7TKqqbpYpDhP/ekaT6aSZconbHVwTDg==
X-Received: by 10.28.191.208 with SMTP id o77mr18530836wmi.117.1486585011096; 
	Wed, 08 Feb 2017 12:16:51 -0800 (PST)
MIME-Version: 1.0
Received: by 10.195.17.228 with HTTP; Wed, 8 Feb 2017 12:16:50 -0800 (PST)
In-Reply-To: <20170208181320.21119-3-fabio.berton@ossystems.com.br>
References: <20170208181320.21119-1-fabio.berton@ossystems.com.br>
	<20170208181320.21119-3-fabio.berton@ossystems.com.br>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 8 Feb 2017 12:16:50 -0800
Message-ID: <CAJ86T=XRqVLSk7U3hTcUC-pRkoyZAhF0wng7eWQtcSxwCEin+A@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2 3/3] libwebsockets: Add recipe for version 2.1.0
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
X-List-Received-Date: Wed, 08 Feb 2017 20:16:52 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Feb 8, 2017 at 10:13 AM, Fabio Berton
<fabio.berton@ossystems.com.br> wrote:
> Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
> ---
>  .../libwebsockets/libwebsockets_2.1.0.bb           | 32 ++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 meta-oe/recipes-connectivity/libwebsockets/libwebsockets_2.1.0.bb
>
> diff --git a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_2.1.0.bb b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_2.1.0.bb
> new file mode 100644
> index 000000000..316b38d3b
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_2.1.0.bb
> @@ -0,0 +1,32 @@
> +SUMMARY = "Canonical libwebsockets.org websocket library"
> +HOMEPAGE = "https://libwebsockets.org/"
> +LICENSE = "LGPL-2.1"
> +LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"

GPL-2.0 looks wrong given that LICENSE is LGPL and not GPL?

Define LIC_FILES_CHKSUM in terms of a file from within the
libwebsockets source tree instead.

> +
> +DEPENDS = "zlib"
> +
> +SRC_URI = "https://github.com/warmcat/libwebsockets/archive/v${PV}.tar.gz"
> +
> +SRC_URI[md5sum] = "4df3be57dee43aeebd54a3ed56568f50"
> +SRC_URI[sha256sum] = "bcc96aaa609daae4d3f7ab1ee480126709ef4f6a8bf9c85de40aae48e38cce66"
> +
> +S = "${WORKDIR}/${PN}-${PV}"

That's the default, so doesn't need to be specified.

> +inherit cmake pkgconfig
> +
> +PACKAGECONFIG ?= "libuv client server http2 ssl"
> +PACKAGECONFIG[libev] = "-DLWS_WITH_LIBEV=ON,-DLWS_WITH_LIBEV=OFF,libev"
> +PACKAGECONFIG[libuv] = "-DLWS_WITH_LIBUV=ON,-DLWS_WITH_LIBUV=OFF,libuv"
> +PACKAGECONFIG[client] = "-DLWS_WITHOUT_CLIENT=OFF,-DLWS_WITHOUT_CLIENT=ON,"
> +PACKAGECONFIG[server] = "-DLWS_WITHOUT_SERVER=OFF,-DLWS_WITHOUT_SERVER=ON,"
> +PACKAGECONFIG[http2] = "-DLWS_WITH_HTTP2=ON,-DLWS_WITH_HTTP2=OFF,"
> +PACKAGECONFIG[ipv6] = "-DLWS_IPV6=ON,-DLWS_IPV6=OFF,"
> +PACKAGECONFIG[ssl] = "-DLWS_WITH_SSL=ON,-DLWS_WITH_SSL=OFF,openssl"
> +PACKAGECONFIG[testapps] = "-DLWS_WITHOUT_TESTAPPS=OFF,-DLWS_WITHOUT_TESTAPPS=ON,"

Maybe sort this list of PACKAGECONFIG options (unless the current
order has some special significance?).

> +
> +PACKAGES =+ "${PN}-testapps"
> +
> +FILES_${PN}-dev += "${libdir}/cmake/libwebsockets/*.cmake"

The "convention" in various other recipes seems to be simply:

  FILES_${PN}-dev += "${libdir}/cmake"

> +FILES_${PN}-testapps += "${datadir}/libwebsockets-test-server/*"
> +
> +RDEPENDS_${PN} += "zlib"

Explicitly defining a runtime dependency on a library isn't normally
required since it will be detected automatically. If it is required in
this case then please explain why in the commit message.

> 2.11.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

