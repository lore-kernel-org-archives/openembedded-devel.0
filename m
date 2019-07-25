Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
	[209.85.160.182])
	by mail.openembedded.org (Postfix) with ESMTP id C26CB7EEF8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Jul 2019 14:54:00 +0000 (UTC)
Received: by mail-qt1-f182.google.com with SMTP id y26so49338827qto.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Jul 2019 07:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=jBRe2OCyRrtcj+0Cdjjl3iVk5NXPJhyxRcd2qUAeUmA=;
	b=ujKd/BRBSDD8AgNXdl7c8QTmtSbPRO5Z4Xu3HuIZnFNqSDltkb2V+YQb4ossKFe8QY
	AKynoOmP4fSASQAhS0/E6dibSHVdAkMdZgF6qY8agZ9yNTOhFe39QqW5Dkx4dsMv38Tj
	2E2yv44Zo7z5opRMPjiAyQbrk7xTxgKGbi8GCa1wH8TeMb9yefpS8RJj+bCGIvQbH33V
	Qhbx/lVUTXyWBkcfkYeeS1Ju2kBDXXdWGN7yRfG3Hmw9Nmyeti3Pxo8JaXhOk/hYDS2x
	Chy4pXHgmPhyXFrZwqkRri6cALYL5TVTVD2z3XReBfzwYHMEWzRket2SyEpYiOPn0KLW
	5YFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=jBRe2OCyRrtcj+0Cdjjl3iVk5NXPJhyxRcd2qUAeUmA=;
	b=W5OWR07CFHC84RfBnOQO0ZRRb/+A7Axv42fFyLRCJto59TAqAT/mdplYJM5QLfV+Zz
	eKZdDWZStbWP3XD3nxoQplxErGk0BOV5/52TcK4aQTL2da55uCqgNiPNG76k3TMEdjW0
	BGjcYCSm2l/LGR4qx2rpK614lAPyupBTwpSZnoG4k70B5+9yVaz8gVAPhUI9z/NawXph
	o8F98Q/EsIBkx9fqElyUg+RhxF3UgfF7XeUVS9qkRYg0S4wrsF8HbRlSBKJWtABKjAzi
	du8+tdlECFtgmS/DLXnrBDqaMPk+IslMqV8p3zws+GlCMMd7CFAy5OQ75lUUuRLUyxx0
	jFMA==
X-Gm-Message-State: APjAAAVior2XZ/F11NtX5ViLUmQzPUTyfGBRnU5jpuVGbbFrBRwUjrV2
	a7dK/wD7L+ye5mt79KaPEOH/44RUehcROd6Z9qo=
X-Google-Smtp-Source: APXvYqx0zCv9/DkuCPpLJWawTe7yrO+AT+2INqhHN9hheQU3evPUp8J8KqkYkM6yamlkqyTccsnnt+VGWaxmsLjQlwI=
X-Received: by 2002:a0c:b115:: with SMTP id q21mr64357761qvc.68.1564066441440; 
	Thu, 25 Jul 2019 07:54:01 -0700 (PDT)
MIME-Version: 1.0
References: <20190724145100.88293-1-psaavedra@igalia.com>
	<20190724145100.88293-4-psaavedra@igalia.com>
In-Reply-To: <20190724145100.88293-4-psaavedra@igalia.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 25 Jul 2019 07:53:45 -0700
Message-ID: <CAMKF1sqr4VaNv2bSYwPmUmEuW8sNkHzo4xc=VXZKH98MuLFsLg@mail.gmail.com>
To: Pablo Saavedra <psaavedra@igalia.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-openembedded][PATCH v5 4/7] ibus-pinyin: add ibus-pinyin recipe
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
X-List-Received-Date: Thu, 25 Jul 2019 14:54:01 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 24, 2019 at 7:59 AM Pablo Saavedra <psaavedra@igalia.com> wrote:
>
> PinYin engine for IBus.
>
> Requires: pyzy
>
> Signed-off-by: Pablo Saavedra <psaavedra@igalia.com>
> ---
>  meta-oe/recipes-support/ibus/ibus-pinyin_1.5.0.bb | 30 +++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>  create mode 100644 meta-oe/recipes-support/ibus/ibus-pinyin_1.5.0.bb
>
> diff --git a/meta-oe/recipes-support/ibus/ibus-pinyin_1.5.0.bb b/meta-oe/recipes-support/ibus/ibus-pinyin_1.5.0.bb
> new file mode 100644
> index 000000000..a91ed33cb
> --- /dev/null
> +++ b/meta-oe/recipes-support/ibus/ibus-pinyin_1.5.0.bb
> @@ -0,0 +1,30 @@
> +DESCRIPTION = "PinYin engine for IBus."
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
> +SECTION = "inputmethods"
> +
> +SRC_URI = "https://github.com/ibus/${PN}/archive/${PV}.tar.gz \

causes
WARNING: ibus-pinyin-1.5.0-r0 do_package_qa: QA Issue:
https://github.com/ibus/ibus-pinyin/archive/1.5.0.tar.gz           :
SRC_URI uses unstable GitHub archives [src-uri-bad]

Lets use git:// fetcher instead of archive

> +          "
> +SRC_URI[md5sum] = "9a794c76f3e8fa888c7a0a097de2ebf0"
> +SRC_URI[sha256sum] = "79fc51517ab8dec696cbbbca9526459b59f4eb045492ea88e5f9e01160b905db"
> +
> +inherit distro_features_check autotools lib_package
> +
> +REQUIRED_DISTRO_FEATURES = "x11"
> +
> +DEPENDS = "ibus enchant hunspell pyzy pyxdg"
> +DEPENDS_append_class-target = " intltool-native glib-2.0-native"
> +RDEPENDS_${PN} += " ibus enchant hunspell pyzy pyxdg"
> +
> +BBCLASSEXTEND = "native"
> +
> +EXTRA_OECONF += "--disable-static \
> +           --disable-boost \
> +"
> +
> +FILES_${PN} += "${datadir}/ibus/component/pinyin.xml \
> +"
> +
> +do_configure_prepend() {
> +    export PYTHON=python3
> +}
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

