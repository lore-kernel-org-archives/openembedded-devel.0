Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id 0F1087D11F
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  3 Aug 2019 00:55:25 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id q10so36804397pff.9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Aug 2019 17:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=L8VUBL0cQuCVh5xghHGiiC+6c57CeaoUsL/JYesaBpg=;
	b=KM35nzUTUhiYwMQy17rKib2EfTcqwufAStQm7Kmt3WTBLWRS4HdJYpjWZFUHlUNCOZ
	G+WQB+pknq0egThP5IdlrQJZTNpn+rJSrjLe1yeHP/aXHapu7Mb0Yy3p83Cs2im3Lran
	rb+GwD6VbqVrl1Q58XgphBZqnHYq6df9l2+dEMMq8LsC2Qi+6oFoX4sdFbCAdANyBKvg
	IurHEIqzOastEak0sdU5OUoDHdBfLZn8rnQYyVEX4FaKhGgvwJrFhNs1HtiVttCPeu+n
	chqyVgL0kHusoiYVont0igK289ooXvXrC9hCAUKxX9DXJMX/RqN9XZapegHsk1nukB6d
	r15g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=L8VUBL0cQuCVh5xghHGiiC+6c57CeaoUsL/JYesaBpg=;
	b=i56VVvoXyG15VxTf6bWjGek2tJupYPw0AutYmhjjZvvUzUfDz5fuPbHxN1DHZJbT4h
	mt2/YqehXPj394zJTLZ/pHGrezs4EU/TA5lOblV6Wl1yod3Mc1JaZy1ognXXZhSSSdAy
	OPwAnAiSDBDuM3RQZNX+eNJ5wWTsH6ivEbmcKGaEaKziaSigWZQAqORYeoPvZ3kv/86o
	wSoQu2w32HjHjewIjUqjZH/fAeJEXYHKdywpliKEKanOPkLCL14dIC+HMX3eX5q9Hwu1
	kBHPtu8/rfIb9tABRx0fdhXbB1mk1VAngNNez25cmx5oYEBGWSOrvauXEXkbWjrJs8ue
	o2lw==
X-Gm-Message-State: APjAAAVVxBsjt5Y+H4jiidJWG/0VWK5Gr+5drk6oo5eD+96/VukCPJIN
	OqNmOYju6iFBce0bMqV60diNhTw5x0E=
X-Google-Smtp-Source: APXvYqwIfJQ6mLO+0FZljE6G1Bn0K7izaD+wembCd00gb4OzMT+vJE++oKGXUFvJwGR3RSkJ1j1c2g==
X-Received: by 2002:a17:90a:9301:: with SMTP id
	p1mr6879130pjo.22.1564793726687; 
	Fri, 02 Aug 2019 17:55:26 -0700 (PDT)
Received: from ?IPv6:2601:646:8500:6bc6::d477? ([2601:646:8500:6bc6::d477])
	by smtp.gmail.com with ESMTPSA id t7sm7608015pjq.15.2019.08.02.17.55.25
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Fri, 02 Aug 2019 17:55:26 -0700 (PDT)
To: Pablo Saavedra <psaavedra@igalia.com>,
	openembedded-devel@lists.openembedded.org
References: <20190802085032.32687-1-psaavedra@igalia.com>
	<20190802085032.32687-3-psaavedra@igalia.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS
Message-ID: <e568134c-3389-aa32-7e34-3b73df398c7a@gmail.com>
Date: Fri, 2 Aug 2019 17:55:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190802085032.32687-3-psaavedra@igalia.com>
Subject: Re: [meta-openembedded][PATCH v6 03/10] ibus-anthy: add ibus-anthy recipe
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
X-List-Received-Date: Sat, 03 Aug 2019 00:55:26 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 8/2/19 1:50 AM, Pablo Saavedra wrote:
> It is a Japanese input engine for IBus.
>
> Signed-off-by: Pablo Saavedra <psaavedra@igalia.com>
> ---
>   .../ibus/ibus-anthy/fix_anthy_include_in_gir.patch | 19 +++++++++++
>   meta-oe/recipes-support/ibus/ibus-anthy_1.5.10.bb  | 37 ++++++++++++++++++++++
>   2 files changed, 56 insertions(+)
>   create mode 100644 meta-oe/recipes-support/ibus/ibus-anthy/fix_anthy_include_in_gir.patch
>   create mode 100644 meta-oe/recipes-support/ibus/ibus-anthy_1.5.10.bb
>
> diff --git a/meta-oe/recipes-support/ibus/ibus-anthy/fix_anthy_include_in_gir.patch b/meta-oe/recipes-support/ibus/ibus-anthy/fix_anthy_include_in_gir.patch
> new file mode 100644
> index 000000000..9812be08f
> --- /dev/null
> +++ b/meta-oe/recipes-support/ibus/ibus-anthy/fix_anthy_include_in_gir.patch
> @@ -0,0 +1,19 @@
> +Index: ibus-anthy-1.5.10/gir/Makefile.am
> +===================================================================
> +--- ibus-anthy-1.5.10.orig/gir/Makefile.am
> ++++ ibus-anthy-1.5.10/gir/Makefile.am
> +@@ -68,12 +68,12 @@ Anthy_9000_gir_SCANNERFLAGS = \
> + 	--warn-all \
> + 	$(NULL)
> + Anthy_9000_gir_INCLUDES = GObject-2.0
> +-Anthy_9000_gir_LIBS = $(libanthygobject) anthy
> ++Anthy_9000_gir_LIBS = $(libanthygobject)
> + Anthy_9000_gir_CFLAGS = @ANTHY_CFLAGS@
> + Anthy_9000_gir_FILES = \
> + 	$(libanthygobject_1_0_la_SOURCES) \
> + 	$(anthyinclude_HEADERS) \
> +-	$(ANTHY_INCLUDEDIR)/anthy/anthy.h \
> ++	$(STAGING_DIR_HOST)$(ANTHY_INCLUDEDIR)/anthy/anthy.h \
> + 	$(NULL)
> + INTROSPECTION_GIRS += Anthy-9000.gir
> +
> diff --git a/meta-oe/recipes-support/ibus/ibus-anthy_1.5.10.bb b/meta-oe/recipes-support/ibus/ibus-anthy_1.5.10.bb
> new file mode 100644
> index 000000000..d42f87ae5
> --- /dev/null
> +++ b/meta-oe/recipes-support/ibus/ibus-anthy_1.5.10.bb
> @@ -0,0 +1,37 @@
> +DESCRIPTION = "It is a Japanese input engine for IBus."
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
> +SECTION = "inputmethods"
> +
> +SRC_URI = "https://github.com/ibus/${PN}/releases/download/${PV}/${PN}-${PV}.tar.gz \
> +    file://fix_anthy_include_in_gir.patch \
> +"
> +SRC_URI[md5sum] = "d7c2c410619edacfbaca6a9d02ed8982"
> +SRC_URI[sha256sum] = "cc33e0d1afe7e4a1f0a092d2a4575269ac21373771e49579c434afb4eef9f84a"
> +
> +# Needed to find the Anthy included headers (anthy/anthy.h)
> +export STAGING_DIR_HOST
> +
> +inherit autotools pkgconfig gettext gobject-introspection gtk-immodules-cache gtk-icon-cache gsettings qemu
> +
> +REQUIRED_DISTRO_FEATURES = "x11"
> +
> +DEPENDS = " anthy ibus gobject-introspection adwaita-icon-theme"
> +RDEPENDS_${PN} += " ibus takao-fonts anthy libanthy0"
> +
> +DEPENDS_append_class-target = " intltool-native qemu-native"
> +
> +do_configure_prepend() {
> +    export PYTHON=python2
maybe just inherit pythonnative
> +}
> +
> +
> +FILES_${PN} += " \
> +    ${datadir}/icons/* \
> +    ${datadir}/ibus \
> +    ${datadir}/appdata \
> +    ${datadir}/ibus/component/anthy.xml \
> +    ${datadir}/appdata/ibus-anthy.appdata.xml \
> +    ${datadir}/gir-1.0/Anthy-9000.gir \
> +    ${datadir}/glib-2.0/schemas/org.freedesktop.ibus.engine.anthy.gschema.xml \
> +"

