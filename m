Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id 18B6960111
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Sep 2019 22:06:30 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id t1so9206172plq.13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Sep 2019 15:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=idKOJCxtixFPwTDoMTcBJs0FgzcBPqAhbzqv7tAFggY=;
	b=tUzZQIrudc59UDTbo0BZgB8fRL+ZlUjvTo85/0Mj7tebN5K8NPERLoFJMjZqfBFmV2
	AFqgTQw945uzAKhpYh4HEhK949YhdU2ybSy9W1NOHL49ZGNYimAsUDf26eGOCAfOfS7d
	aN7WCkkM0NNMoUUiNi9rqNnoVAeQ2mUh7gNHgcYyiRsMFayc4IZ9+d0TphrQo/cUXq3x
	AWH8840VvwO7K41DRsOoTVsjuZ3t4eSO077KYPodPF141MKULXbFVTzMd3Pc43Nw1U7G
	2iaPuEiIqJtRtYkubBHR0ourFtx68a/1q6gyXReC7i+PW+ILLxvyca2U81FKFJxUuN4B
	Nc6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=idKOJCxtixFPwTDoMTcBJs0FgzcBPqAhbzqv7tAFggY=;
	b=fi8vmg2SaT2AySMfMxqhi4tTopAmCJKHTYHnjRTVWMZG1MU7cGkR7R+iPpQLvwPL7s
	McOxY77xZTc9e/sirDK8oSLDrce/aQQvSk+odli5PeYjus6s3lglmQmbgPS7WHPkbpPF
	xtNKuWoSA0/83pqYnR37CZKwZFT8zCS/r++0ld9MencevK76X6QkePcODtul85XeD003
	aj+WytmawgYv0aFOTjidmH6wGA6/J08VGkQ2IGJpf/1hp5d6ZR5tjoYclQde45+kuaNn
	iMRY16IQyFJ8nt3Fpzw+62CXAf5FECHd5B608z4YdiHx+5aI+UKaAOwnPllCj2RKjygu
	RaPA==
X-Gm-Message-State: APjAAAXQN6R2peZ0Q5zOdAsmL7w9RDHbQGShJT8GCFfLPokhfa0iYgOO
	HBGb+X3R4m2FMCLx07XyW8A=
X-Google-Smtp-Source: APXvYqyur9BtO4y/aBJ3GyWhls7098GJ0d9HQnhbGkyZ6se/7239uPz8qfGD/c6m//5mNbpuDZBXHw==
X-Received: by 2002:a17:902:c004:: with SMTP id
	v4mr23977354plx.159.1568153191828; 
	Tue, 10 Sep 2019 15:06:31 -0700 (PDT)
Received: from [172.31.25.184] ([45.19.219.178])
	by smtp.gmail.com with ESMTPSA id ce3sm643467pjb.27.2019.09.10.15.06.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 10 Sep 2019 15:06:31 -0700 (PDT)
To: Stefan Agner <stefan@agner.ch>, openembedded-devel@lists.openembedded.org
References: <20190910214919.9171-1-stefan@agner.ch>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <c30d914c-da23-70f0-cde3-6bb32a5b8f98@gmail.com>
Date: Tue, 10 Sep 2019 15:06:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190910214919.9171-1-stefan@agner.ch>
Cc: Stefan Agner <stefan.agner@toradex.com>
Subject: Re: [meta-filesystems][PATCH] fuse3: add libfuse3 recipe
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
X-List-Received-Date: Tue, 10 Sep 2019 22:06:31 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Stefan,

On 9/10/19 2:49 PM, Stefan Agner wrote:
> From: Stefan Agner <stefan.agner@toradex.com>
>
> Add recipe for libfuse version 3 series. Follow the scheme other
> distributions use and create a new recipe with 3 in its name.
> To avoid conflict with the fuse (2) recipe this recipe does not
> provide init scripts/configuration files which automatically load
> the fuse kernel driver.
>
> Signed-off-by: Stefan Agner <stefan.agner@toradex.com>

This recipe appears to already exist in meta-filesystem

https://git.openembedded.org/meta-openembedded/tree/meta-filesystems/recipes-support/fuse/fuse_2.9.9.bb

Is this a all together a different Major version that is not compatible
with the one above? or should we just update the old one?

- armin
> ---
>  .../recipes-support/fuse/fuse3_3.6.2.bb       | 48 +++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 meta-filesystems/recipes-support/fuse/fuse3_3.6.2.bb
>
> diff --git a/meta-filesystems/recipes-support/fuse/fuse3_3.6.2.bb b/meta-filesystems/recipes-support/fuse/fuse3_3.6.2.bb
> new file mode 100644
> index 000000000..e65eb08e2
> --- /dev/null
> +++ b/meta-filesystems/recipes-support/fuse/fuse3_3.6.2.bb
> @@ -0,0 +1,48 @@
> +SUMMARY = "Implementation of a fully functional filesystem in a userspace program"
> +DESCRIPTION = "FUSE (Filesystem in Userspace) is a simple interface for userspace \
> +               programs to export a virtual filesystem to the Linux kernel. FUSE \
> +               also aims to provide a secure method for non privileged users to \
> +               create and mount their own filesystem implementations. \
> +              "
> +HOMEPAGE = "https://github.com/libfuse/libfuse"
> +SECTION = "libs"
> +LICENSE = "GPLv2 & LGPLv2"
> +LIC_FILES_CHKSUM = "file://GPL2.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
> +                    file://LGPL2.txt;md5=4fbd65380cdd255951079008b364516c \
> +                    file://LICENSE;md5=a55c12a2d7d742ecb41ca9ae0a6ddc66"
> +
> +SRC_URI = "https://github.com/libfuse/libfuse/releases/download/fuse-${PV}/fuse-${PV}.tar.xz \
> +"
> +SRC_URI[md5sum] = "1798945aa69434286723b9999a141c7a"
> +SRC_URI[sha256sum] = "f45869427575e1e59ab743a67deb57addbf2cb8f9ce431199dbd40ddab71f281"
> +
> +S = "${WORKDIR}/fuse-${PV}"
> +
> +UPSTREAM_CHECK_URI = "https://github.com/libfuse/libfuse/releases"
> +UPSTREAM_CHECK_REGEX = "fuse\-(?P<pver>3(\.\d+)+).tar.xz"
> +
> +inherit meson pkgconfig
> +
> +DEPENDS = "udev"
> +
> +PACKAGES =+ "fuse3-utils"
> +
> +RPROVIDES_${PN}-dbg += "fuse3-utils-dbg"
> +
> +RRECOMMENDS_${PN}_class-target = "kernel-module-fuse fuse3-utils"
> +
> +FILES_${PN} += "${libdir}/libfuse3.so.*"
> +FILES_${PN}-dev += "${libdir}/libfuse3*.la"
> +
> +EXTRA_OEMESON += " \
> +     -Dexamples=false \
> +"
> +
> +# Forbid auto-renaming to libfuse3-utils
> +FILES_fuse3-utils = "${bindir} ${base_sbindir}"
> +DEBIAN_NOAUTONAME_fuse3-utils = "1"
> +DEBIAN_NOAUTONAME_${PN}-dbg = "1"
> +
> +do_install_append() {
> +    rm -rf ${D}${base_prefix}/dev
> +}


