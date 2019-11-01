Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com
	[209.85.217.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3B5587F8E5
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Nov 2019 10:55:37 +0000 (UTC)
Received: by mail-vs1-f65.google.com with SMTP id b184so2551495vsc.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Nov 2019 03:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=txzF/0gTDiex7CXuVGTdcGqR8vP0ZPxDgaPIHvDc6hc=;
	b=uaAAOQVKN552V9H7AttDE/MEiFaDk7NYBIkVuW05uk1lsYCABzEicIKsxoziy7y+x7
	3MCdiiv51ZSMrC+1mVfBZkVdk6TUf+PU0CXrBQA0dCPbQ98CVD5f8fThrY5ZUv3BXELa
	le45K7Ijh0keYaChq6C8XHrxdqTyEOL+ekoDPtEcf29ueBNyTJh776iBjKaY8/MHJrWF
	GM0DfDp3g8nALCbAVrTjip3cZ+9CdlsvPA/21n/ul5CssMfBS00igQwHWJE2dICAXVds
	uCvbuM3tA99admcV6znDYPoM06K0cxv5WpN9TYX81A4sc2XDchWgRQgtwf9P7Hi5d6dt
	StLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=txzF/0gTDiex7CXuVGTdcGqR8vP0ZPxDgaPIHvDc6hc=;
	b=q0kNwgQI7MMsenly1cCXSrXs4es97Ecv6Ge0Mouzm002w6m3rMhUzziR/cCBlTbmc5
	q2PHX2cpvXXjcKoYbIXjHcTYAR9Lm+yCFsuw/iNcIlRrJYddCGWr8kZGM1eSA2QojOOK
	SGC5Aatxly2Vz3LrNbwPo04QMSAKWXRaK3w3i84Nl5IIRM6DsKBM85D6BNzcIb1mk1ID
	3Chq2VonIq8SmH5fFr/gTvUVaia3U0dU7ObRF58zzKRkuLvbsezCiuN5fSj3kaCM/e7L
	bGEJSZuc6W0HqqnXPr1z6Lxcd/cmszCaMeRyajj8IghQ395YBX/nvtHYwB5WzbmnTCt7
	6YfQ==
X-Gm-Message-State: APjAAAWfrR8W+TmeIhGci0MfHDSewIqe+ojopM17gGheQGqkKQ9Fmlvy
	J2ASK6c2UOAB3IdjqiyhK5MXqp6SehL1vdWv/2x7I0cP
X-Google-Smtp-Source: APXvYqxKrc5XnN7jfJWlILtHrTnQpzGugS5EDoW4P0UNLtJgBSHBVMZbqR4oYX33DDZklhHGyM6xHlvbqXTo1u/PW1E=
X-Received: by 2002:a67:ad0e:: with SMTP id t14mr5317280vsl.35.1572605738124; 
	Fri, 01 Nov 2019 03:55:38 -0700 (PDT)
MIME-Version: 1.0
References: <1572616775-69362-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
In-Reply-To: <1572616775-69362-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 1 Nov 2019 11:55:27 +0100
Message-ID: <CANNYZj_aty2tpJ6qttT3phqktydh_xz0sVPwv-n4hfYQjKHr-Q@mail.gmail.com>
To: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] glibmm: upgrade 2.62.0 -> 2.63.1
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
X-List-Received-Date: Fri, 01 Nov 2019 10:55:37 -0000
Content-Type: text/plain; charset="UTF-8"

Is 2.63.1 a pre-release version? As a gnome project, it's probably
following the odd-even scheme.

Alex

On Fri, 1 Nov 2019 at 11:20, Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
wrote:

> 1) Update DEPEND from libsigc++-2.0 to libsigc++-3.
>
> 2) Update install dir from glibmm-2.4 to glibmm-2.64.
>
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ---
>  .../glib-2.0/{glibmm_2.62.0.bb => glibmm_2.63.1.bb}        | 14
> +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>  rename meta-oe/recipes-core/glib-2.0/{glibmm_2.62.0.bb =>
> glibmm_2.63.1.bb} (68%)
>
> diff --git a/meta-oe/recipes-core/glib-2.0/glibmm_2.62.0.bb
> b/meta-oe/recipes-core/glib-2.0/glibmm_2.63.1.bb
> similarity index 68%
> rename from meta-oe/recipes-core/glib-2.0/glibmm_2.62.0.bb
> rename to meta-oe/recipes-core/glib-2.0/glibmm_2.63.1.bb
> index 75eea4e..99f5cf9 100644
> --- a/meta-oe/recipes-core/glib-2.0/glibmm_2.62.0.bb
> +++ b/meta-oe/recipes-core/glib-2.0/glibmm_2.63.1.bb
> @@ -5,7 +5,7 @@ LICENSE = "LGPLv2.1 & GPLv2"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=42dfffebc56fec7527aac53b7a89d1d8 \
>
>  file://COPYING.tools;md5=751419260aa954499f7abaabaa882bbe"
>
> -DEPENDS = "mm-common glib-2.0 libsigc++-2.0 glib-2.0-native"
> +DEPENDS = "mm-common glib-2.0 libsigc++-3 glib-2.0-native"
>  inherit gnomebase
>
>  SHRT_VER =
> "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
> @@ -13,23 +13,23 @@ SHRT_VER =
> "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
>  SRC_URI += " \
>      file://remove-examples.patch \
>  "
> -SRC_URI[archive.md5sum] = "7da228e3f0c6a10024b9a7708c53691e"
> -SRC_URI[archive.sha256sum] =
> "36659f13cc73282392d1305858f3bbca46fbd1ce2f078cc9db8b9f79b2e93cfe"
> +SRC_URI[archive.md5sum] = "6d00da9e119d3cd1a27caaae4b00114e"
> +SRC_URI[archive.sha256sum] =
> "4f99e29bd0a67afd94c0d6fdad2b86bc5cd944cd5d4ff097520dc58b6c997ada"
>
>  do_install_append() {
> -    install -d ${D}${datadir}/glibmm-2.4
> +    install -d ${D}${datadir}/glibmm-2.64
>      install -d ${D}${datadir}/aclocal
>
> -    install -m 0644 glib/glibmmconfig.h ${D}${datadir}/glibmm-2.4/
> +    install -m 0644 glib/glibmmconfig.h ${D}${datadir}/glibmm-2.64/
>      install -m 0644 scripts/glibmm_check_perl.m4 ${D}${datadir}/aclocal/
> || true
>
>      for i in generate_wrap_init.pl gmmproc; do
> -        sed -i -e '1s,.*,#!${bindir}/env perl,'
> ${D}${libdir}/glibmm-2.4/proc/$i
> +        sed -i -e '1s,.*,#!${bindir}/env perl,'
> ${D}${libdir}/glibmm-2.64/proc/$i
>      done
>  }
>
>  FILES_${PN} = "${libdir}/lib*.so.*"
> -FILES_${PN}-dev += "${datadir}/glibmm-* ${libdir}/glibmm-2.4/include/
> ${libdir}/glibmm-2.4/proc/ ${libdir}/giomm-2.4/include/"
> +FILES_${PN}-dev += "${datadir}/glibmm-* ${libdir}/glibmm-2.64/include/
> ${libdir}/glibmm-2.64/proc/ ${libdir}/giomm-2.64/include/"
>
>  RDEPENDS_${PN}-dev = "perl"
>  SECURITY_CFLAGS = "${SECURITY_NO_PIE_CFLAGS}"
> --
> 2.7.4
>
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

