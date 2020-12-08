Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web11.4676.1607406853144490241
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Dec 2020 21:54:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZJZ8Vfg3;
 spf=pass (domain: gmail.com, ip: 209.85.160.178, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f178.google.com with SMTP id 7so11294086qtp.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 07 Dec 2020 21:54:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nAWAGX8ZxnpcVMUoH0k+d22RE4CTH9rdBfkXOgZ93kc=;
        b=ZJZ8Vfg3MsWGYos5ScQbu/7Ht2x3YOzN7tQe2DZ1w8CgdFfJ+HeOaSz+jYbyCS+fkf
         Dn3CRJ0cWX/k64aU31ytWQGFb/YPj9ITAyQfsXEGuhhYApWd0DrqmHZq6BtqtQbTY9M0
         hKc09n6aZlor9ZnWWpmHPfgDAdTu6d3DVBwVxWUp9KrwZyqU0iUyvC+d7dhgmiZS5sdc
         TFHU39+kSbMaht7a+oGmejYRnn9eCxWCRF317heP5eYa5dCYdU6jjpI11URYuVPpOaWM
         NjN3DJN1jW9n3B/yn78tx7mNq+1Om2ACSqBKxJ1ZMHZ1x9ytCE3w0oAtjNB5vXLKfkDX
         He5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nAWAGX8ZxnpcVMUoH0k+d22RE4CTH9rdBfkXOgZ93kc=;
        b=Eu81fl7HLTptU5o95CWNdnBjgRcFdRC4rRzayBl7MvimbEdGfCh+FgqGeB6aaDvfEA
         VmTawk27oDyKKb8WYB2S5fELc7aN1+ZrdO1jTfY/Wt+rx/d8Pe4wa7NC6ZBIuWqJ3jfi
         iSq8gaRVBJ19QLJFZkDJAeCanoEbM+nRYobz7BflRphBi/0fpeeYRfArIs+R1NNFj/FQ
         9hGE8R8BQJlZbjYxwypU/8k5dGTfKPxa0vxrkw+UIn1LDYjvewxovihB4m7UWSpigGk+
         kq/3gOy+/UCToVKfQCcPNJvXTGbYqYiVU5N4qDQy5VG/k690Ss5uhFTfk4Q3TXcoTGmx
         EnGQ==
X-Gm-Message-State: AOAM531PY1/fOkYlCMtfXwZpc1qvGyVcoAifbt/SfRvnfb9QgjkbtECP
	2QWqgm/0gWKGWAuT8DgH6L9ArRELGrezrpNZ1OE=
X-Google-Smtp-Source: ABdhPJzk7MoulQtxr/pVg0I2ilFyC7C42vUDnelnVE7Bl2y2f/OKETbzKS45wxtCkacmGGvJ15pini4DMJCC0HImhOE=
X-Received: by 2002:aed:2ec6:: with SMTP id k64mr2956309qtd.194.1607406851963;
 Mon, 07 Dec 2020 21:54:11 -0800 (PST)
MIME-Version: 1.0
References: <20201207171423.16180-1-wickbergster@gmail.com>
In-Reply-To: <20201207171423.16180-1-wickbergster@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 7 Dec 2020 21:53:43 -0800
Message-ID: <CAMKF1sofh-GUd6FCv4C2iE-Tsd-COT06YXZZn75GugF0qH6asA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] libwebsockets: upgrade to 4.1.6
To: Alexander Vickberg <wickbergster@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

fails packaging.

https://errors.yoctoproject.org/Errors/Details/539130/

On Mon, Dec 7, 2020 at 9:15 AM Alexander Vickberg
<wickbergster@gmail.com> wrote:
>
> Event lib support is now built into dynamically loaded plugins so
> package them separately and include them in RDEPENDS if enabled.
>
> Building minimal-examples with generated SDK failed due to cmake
> configuration had static enabled but not included into SDK. Solve
> this by adding static as PACKAGECONFIG option and adding
> ${PN}-staticdev to RDEPENDS_${PN}-dev if enabled.
>
> Remove CFLAGS_append with -Wno-error for fixing building with Os.
> This looks like it's fixed in upstream.
>
> Signed-off-by: Alexander Vickberg <wickbergster@gmail.com>
> ---
>  ...ckets_4.0.20.bb => libwebsockets_4.1.6.bb} | 20 +++++++++++++------
>  1 file changed, 14 insertions(+), 6 deletions(-)
>  rename meta-oe/recipes-connectivity/libwebsockets/{libwebsockets_4.0.20.bb => libwebsockets_4.1.6.bb} (51%)
>
> diff --git a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.0.20.bb b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.1.6.bb
> similarity index 51%
> rename from meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.0.20.bb
> rename to meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.1.6.bb
> index 5427daac4..e922d681f 100644
> --- a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.0.20.bb
> +++ b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.1.6.bb
> @@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8c47b078124308a4e1354e8d59f606b7"
>  DEPENDS = "zlib"
>
>  S = "${WORKDIR}/git"
> -SRCREV = "ec9e8ab892f2dc569ae09336c80c2796fd14a6ff"
> -SRC_URI = "git://github.com/warmcat/libwebsockets.git;protocol=https;branch=v4.0-stable"
> +SRCREV = "736f0739ed8c75db0e29c7678b5a9194e957c347"
> +SRC_URI = "git://github.com/warmcat/libwebsockets.git;protocol=https;branch=v4.1-stable"
>
>  UPSTREAM_CHECK_URI = "https://github.com/warmcat/${BPN}/releases"
>  UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
> @@ -18,18 +18,26 @@ PACKAGECONFIG ?= "libuv client server http2 ssl"
>  PACKAGECONFIG[client] = "-DLWS_WITHOUT_CLIENT=OFF,-DLWS_WITHOUT_CLIENT=ON,"
>  PACKAGECONFIG[http2] = "-DLWS_WITH_HTTP2=ON,-DLWS_WITH_HTTP2=OFF,"
>  PACKAGECONFIG[ipv6] = "-DLWS_IPV6=ON,-DLWS_IPV6=OFF,"
> +PACKAGECONFIG[libevent] = "-DLWS_WITH_LIBEVENT=ON,-DLWS_WITH_LIBEVENT=OFF,libevent"
>  PACKAGECONFIG[libev] = "-DLWS_WITH_LIBEV=ON,-DLWS_WITH_LIBEV=OFF,libev"
>  PACKAGECONFIG[libuv] = "-DLWS_WITH_LIBUV=ON,-DLWS_WITH_LIBUV=OFF,libuv"
>  PACKAGECONFIG[server] = "-DLWS_WITHOUT_SERVER=OFF,-DLWS_WITHOUT_SERVER=ON,"
>  PACKAGECONFIG[ssl] = "-DLWS_WITH_SSL=ON,-DLWS_WITH_SSL=OFF,openssl"
> -PACKAGECONFIG[testapps] = "-DLWS_WITHOUT_TESTAPPS=OFF,-DLWS_WITHOUT_TESTAPPS=ON,"
> +PACKAGECONFIG[static] = "-DLWS_WITH_STATIC=ON,-DLWS_WITH_STATIC=OFF -DLWS_LINK_TESTAPPS_DYNAMIC=ON,"
>
>  EXTRA_OECMAKE += " \
>      -DLIB_SUFFIX=${@d.getVar('baselib').replace('lib', '')} \
>  "
>
> -PACKAGES =+ "${PN}-testapps"
> +PACKAGES =+ "${PN}-testapps ${PN}-evlib_event ${PN}-evlib_uv ${PN}-evlib_ev"
>
> -FILES_${PN}-testapps += "${datadir}/libwebsockets-test-server/*"
> +FILES_${PN}-testapps += "${datadir}/libwebsockets-test-server/* ${bindir}/libwebsockets-test-*"
> +FILES_${PN}-evlib_event += "${libdir}/libwebsockets-evlib_event.so"
> +FILES_${PN}-evlib_uv += "${libdir}/libwebsockets-evlib_uv.so"
> +FILES_${PN}-evlib_ev += "${libdir}/libwebsockets-evlib_ev.so"
>
> -CFLAGS_append = " -Wno-error"
> +RDEPENDS_${PN} += " ${@bb.utils.contains('PACKAGECONFIG', 'libevent', '${PN}-evlib_event', '', d)}"
> +RDEPENDS_${PN} += " ${@bb.utils.contains('PACKAGECONFIG', 'libuv', '${PN}-evlib_uv', '', d)}"
> +RDEPENDS_${PN} += " ${@bb.utils.contains('PACKAGECONFIG', 'libev', '${PN}-evlib_ev', '', d)}"
> +
> +RDEPENDS_${PN}-dev += " ${@bb.utils.contains('PACKAGECONFIG', 'static', '${PN}-staticdev', '', d)}"
> --
> 2.25.1
>
>
> 
>
