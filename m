Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 83E686BCE7
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Jun 2019 14:24:13 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id 81so358189pfy.13
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Jun 2019 07:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=0O52T2yarSS9e2IXWxeXd0LQarHj3MzGdde2ASiWGhY=;
	b=fKtFSMCJ/fQG1Ey7u6xkQohqezaCJt8zzhGRjoNTWjfIZwOctmoTDMg2G0QFB1VP1k
	ZVUSTmBshtXDwaxLp04wWYOoSWHNIbd62i5XSuJ4HXS2QYjGHpuzbFEe62KYpa/9mtOn
	oSD9hf/2TiNGbLEfZCU3ixDbW+w5QqGmQcqW4Ck8g5Zt9JXzl1dvfF5EqHibuDdxAmS+
	GtpQyrzrx7NkpuMXwLO0/mR+a2O1u9ouvEg0jLQHAKZxVLSKE0D7FqzRw9yEg02EJ57e
	7tDogw0yUQ1k56R0L9WhoalHaDHnKXYN8QXsNPKN/zKWlI9gjcSZzKJHEFdQHZesAkZn
	orNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=0O52T2yarSS9e2IXWxeXd0LQarHj3MzGdde2ASiWGhY=;
	b=T8tcAvObxGl5gFJ/1ZEhrmfmpK9RXFrpHlZ/qRWcW7oicUl9l3oBp9iNzd5lNMt6NR
	algRTQfKq5eTqcJ1eZD2N+JkOaxh0T96qL69Cu7oSzhh08rpOin08tfBCMdFtNEa/wlp
	8R1IGttadsGbzNjDM7rr+/QDmUACHuVUVpJ2gTXchANBS5AQWAUvFN/MDi+6ZhJKqPkL
	l9Fj5o1O0K9qRl766HMc8j+9XcWoliJHVJj2k2py1CrnEDQXIK/OOw0lu7TtTWBotESv
	PbNNlJB75RdHjcxBLOI8wC7CwUo/oxYgliHSMUHcXCjI9lbwEGIvORmOluBdgsGirI/Y
	GcmQ==
X-Gm-Message-State: APjAAAVoxtoREwRYkGEpix5In2ec/wQoFy6yak2ENxACUo0zidgmbzSy
	TxSCiwfPvJvqUHA06spW/HLLuPEy
X-Google-Smtp-Source: APXvYqxHbb95+lDq01cMm+KK7a/O2293wj52ZHMXJsFbZjcELKQ40Q/bQqytY4gaOfrxAaxgSsupPQ==
X-Received: by 2002:aa7:956d:: with SMTP id x13mr13943136pfq.132.1559831053654;
	Thu, 06 Jun 2019 07:24:13 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:649f:275:809c:24d6?
	([2601:202:4180:c33:649f:275:809c:24d6])
	by smtp.gmail.com with ESMTPSA id
	k8sm3170201pfk.177.2019.06.06.07.24.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Jun 2019 07:24:12 -0700 (PDT)
To: Robert Joslyn <robert.joslyn@redrectangle.org>,
	openembedded-devel@lists.openembedded.org
References: <20190602231221.24148-1-robert.joslyn@redrectangle.org>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <ed9e6fc4-d91c-7457-34d7-491c153215cb@gmail.com>
Date: Thu, 6 Jun 2019 07:24:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190602231221.24148-1-robert.joslyn@redrectangle.org>
Subject: Re: [meta-oe][PATCH] cryptsetup: Add PACKAGECONFIG options
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
X-List-Received-Date: Thu, 06 Jun 2019 14:24:13 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 6/2/19 4:12 PM, Robert Joslyn wrote:
> Add various PACKAGECONFIG options, keeping the default options enabled.
the PACKCONFIG went from openssl to a lot more, how is that keeping the
defaults?
> ---
>  .../cryptsetup/cryptsetup_2.1.0.bb            | 51 ++++++++++++++++++-
>  1 file changed, 49 insertions(+), 2 deletions(-)
>
> diff --git a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.1.0.bb b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.1.0.bb
> index cf1d22242..51cecf5d2 100644
> --- a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.1.0.bb
> +++ b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.1.0.bb
> @@ -9,7 +9,12 @@ SECTION = "console"
>  LICENSE = "GPL-2.0-with-OpenSSL-exception"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=32107dd283b1dfeb66c9b3e6be312326"
>  
> -DEPENDS = "util-linux libdevmapper popt libgcrypt json-c"
> +DEPENDS = " \
> +    json-c \
> +    libdevmapper \
> +    popt \
> +    util-linux \
> +"
>  
>  SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/v${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}/${BP}.tar.xz"
>  SRC_URI[md5sum] = "41d8b985ef69242852b93e95d53e8e28"
> @@ -19,9 +24,45 @@ inherit autotools gettext pkgconfig
>  
>  # Use openssl because libgcrypt drops root privileges
>  # if libgcrypt is linked with libcap support
> -PACKAGECONFIG ??= "openssl"
> +PACKAGECONFIG ??= " \
> +    keyring \
> +    cryptsetup \
> +    veritysetup \
> +    cryptsetup-reencrypt \
> +    integritysetup \
> +    ${@bb.utils.filter('DISTRO_FEATURES', 'selinux', d)} \
> +    udev \
> +    kernel_crypto \
> +    internal-argon2 \
> +    blkid \
> +    luks-adjust-xts-keysize \
> +    openssl \
> +"
> +
> +PACKAGECONFIG[keyring] = "--enable-keyring,--disable-keyring"
> +PACKAGECONFIG[fips] = "--enable-fips,--disable-fips"
> +PACKAGECONFIG[pwquality] = "--enable-pwquality,--disable-pwquality,libpwquality"
> +PACKAGECONFIG[passwdqc] = "--enable-passwdqc,--disable-passwdqc,passwdqc"
> +PACKAGECONFIG[cryptsetup] = "--enable-cryptsetup,--disable-cryptsetup"
> +PACKAGECONFIG[veritysetup] = "--enable-veritysetup,--disable-veritysetup"
> +PACKAGECONFIG[cryptsetup-reencrypt] = "--enable-cryptsetup-reencrypt,--disable-cryptsetup-reencrypt"
> +PACKAGECONFIG[integritysetup] = "--enable-integritysetup,--disable-integritysetup"
> +PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux"
> +PACKAGECONFIG[udev] = "--enable-udev,--disable-udev,udev"
> +PACKAGECONFIG[kernel_crypto] = "--enable-kernel_crypto,--disable-kernel_crypto"
> +# gcrypt-pkbdf2 requries --with-crypto_backend=gcrypt or the flag isn't
> +# recognized.
> +PACKAGECONFIG[gcrypt-pbkdf2] = "--enable-gcrypt-pbkdf2"
> +PACKAGECONFIG[internal-argon2] = "--enable-internal-argon2,--disable-internal-argon2"
> +PACKAGECONFIG[internal-sse-argon2] = "--enable-internal-sse-argon2,--disable-internal-sse-argon2"
> +PACKAGECONFIG[blkid] = "--enable-blkid,--disable-blkid,util-linux"
> +PACKAGECONFIG[dev-random] = "--enable-dev-random,--disable-dev-random"
> +PACKAGECONFIG[luks-adjust-xts-keysize] = "--enable-luks-adjust-xts-keysize,--disable-luks-adjust-xts-keysize"
>  PACKAGECONFIG[openssl] = "--with-crypto_backend=openssl,,openssl"
>  PACKAGECONFIG[gcrypt] = "--with-crypto_backend=gcrypt,,libgcrypt"
> +PACKAGECONFIG[nss] = "--with-crypto_backend=nss,,nss"
> +PACKAGECONFIG[kernel] = "--with-crypto_backend=kernel"
> +PACKAGECONFIG[nettle] = "--with-crypto_backend=nettle,,nettle"
>  
>  RRECOMMENDS_${PN} = "kernel-module-aes-generic \
>                       kernel-module-dm-crypt \
> @@ -32,6 +73,12 @@ RRECOMMENDS_${PN} = "kernel-module-aes-generic \
>  "
>  
>  EXTRA_OECONF = "--enable-static"
> +# Building without largefile is not supported by upstream
> +EXTRA_OECONF += "--enable-largefile"
> +# Requires a static popt library
> +EXTRA_OECONF += "--disable-static-cryptsetup"
> +# There's no recipe for libargon2 yet
> +EXTRA_OECONF += "--disable-libargon2"
>  
>  FILES_${PN} += "${@bb.utils.contains('DISTRO_FEATURES','systemd','${exec_prefix}/lib/tmpfiles.d/cryptsetup.conf', '', d)}"
>  


