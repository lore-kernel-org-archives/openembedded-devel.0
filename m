Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f181.google.com (mail-pf0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id 521A774A24
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Apr 2018 22:22:07 +0000 (UTC)
Received: by mail-pf0-f181.google.com with SMTP id h69so6571038pfe.13
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Apr 2018 15:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=0GG9PdnLklTP/v5zqEkI300JnHeCapW9dFX0V/pVAFc=;
	b=lmiZzmStbhDSmnZBtUDBEK3a6Xpz5KEa/VnYNWKVroPJ42PXGfDT1lzxmqcILuNDJg
	7+6dHinWkpJmSLlAJO2MMR+s0Qufi8HT6qbpi7cWZ+7imvjM6D++kq8RyuGsZOdiM5MN
	izaRFMkYYKRF0mN0O2Ho3gvx2iWNI9EwHLVyLaKET1fg87CIxVDh9n+H/bFxuioRkeRq
	kLvsWq7rVlS+JGCkbSgVbsLecXzDqqXU24b36ECk9XarOHoscAR6sTk4mYdICGZdbHn8
	GorgQ6cEH4zfTS3TfWUtWAq/MSY/9rZgKcy1T2YvIjo4G29+vGPCwnrbzwykhRrF7/I3
	T/4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=0GG9PdnLklTP/v5zqEkI300JnHeCapW9dFX0V/pVAFc=;
	b=JRCeyYARdZFLc6r62fS21hHyxuGXPkU7cKjgbF0SzubjJ4+Dk9H/c/jXS5pgI4+UK6
	vyU/sOSn8SXBfAa2qIn06l5h14G7MqcJhcIuSPPalEjBhMU0KSao0hMR0NkHD0RaYpxa
	0rZqOHYFOFl5lh30DlwkGIICHsSkm3QV6X1fSl/BpKvwgRozQWxDJ8xuXUw2KqC/xD5/
	qpVAH1ribiNlhKXPqAoerTNglMONqP/MyRJLazro0dGYiO3OddMfpXxiCZLGSohxNx64
	T4GDj54E0uDwo0PUphznvw2dG14JWwt2U2enOgmDfARi81nO420A642kZ2B+UPMR4CAm
	2Ovw==
X-Gm-Message-State: AElRT7Hkge19kBxbD5/a2p6ZeLcRbpblJU7qyjg8za5XmzNNpjWims3v
	6WWYntgCc++S+dBbmdPTYpsRNvQu
X-Google-Smtp-Source: AIpwx492p9Hgf5yAjz0i/SOqzcfmI7lQmNFOqakJUExuZ81uy9M2eVY+Dp5hyDmoIfKgn1NbeiKsCw==
X-Received: by 10.99.3.216 with SMTP id 207mr26408632pgd.163.1523312527898;
	Mon, 09 Apr 2018 15:22:07 -0700 (PDT)
Received: from ?IPv6:2601:646:8880:466c:d8c2:1bee:5b5c:2c82?
	([2601:646:8880:466c:d8c2:1bee:5b5c:2c82])
	by smtp.gmail.com with ESMTPSA id
	l8sm1829172pff.126.2018.04.09.15.22.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 09 Apr 2018 15:22:06 -0700 (PDT)
To: Niko Mauno <niko.mauno@vaisala.com>,
	openembedded-devel@lists.openembedded.org
References: <20180409160652.4835-1-niko.mauno@vaisala.com>
From: Khem Raj <raj.khem@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=raj.khem@gmail.com; prefer-encrypt=mutual; keydata=
	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
Message-ID: <fc468dd4-19fe-c91f-1c57-8dec70ff5701@gmail.com>
Date: Mon, 9 Apr 2018 15:22:05 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
	Gecko/20100101 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20180409160652.4835-1-niko.mauno@vaisala.com>
Subject: Re: [meta-oe][PATCH] tslib: Align recipe content to better match v1.15
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
X-List-Received-Date: Mon, 09 Apr 2018 22:22:07 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 4/9/18 9:06 AM, Niko Mauno wrote:
> Respective changes to recipe:
>  - updated AUTHOR field to match current author in tslib/AUTHORS file
>  - updated LICENSE field to 'LGPLv2+ & GPLv2+' to reflect licenses in
>    v1.15 (LGPLv2+ for shared library parts, GPLv2+ for command line
>    utility parts)
>  - updated LIC_FILES_CHECKSUM to contain COPYING files for both license
>    families
>  - dropped EXTRA_OECONF altogether as it contained just obsoleted or
>    implied configure options

Perhaps a set of packageconfigs would be desired. It may not be
reflecting exact set as seen here but whatever knobs currently are
available.

Other parts look good.

>  - removed commented-out detect-stylus lines (a detect-stylus recipe
>    was apparently available in OE-Classic)
> 
> Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
> ---
>  meta-oe/recipes-graphics/tslib/tslib_1.15.bb | 14 ++++++--------
>  1 file changed, 6 insertions(+), 8 deletions(-)
> 
> diff --git a/meta-oe/recipes-graphics/tslib/tslib_1.15.bb b/meta-oe/recipes-graphics/tslib/tslib_1.15.bb
> index e87b411a8..dca5506b6 100644
> --- a/meta-oe/recipes-graphics/tslib/tslib_1.15.bb
> +++ b/meta-oe/recipes-graphics/tslib/tslib_1.15.bb
> @@ -5,10 +5,13 @@ Tslib is generally used on embedded devices to provide a common user \
>  space interface to touchscreen functionality."
>  HOMEPAGE = "http://tslib.org/"
>  
> -AUTHOR = "Russell King w/ plugins by Chris Larson et. al."
> +AUTHOR = "Martin Kepplinger <martink@posteo.de>"
>  SECTION = "base"
> -LICENSE = "LGPLv2"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=fc178bcd425090939a8b634d1d6a9594"
> +LICENSE = "LGPLv2+ & GPLv2+"
> +LIC_FILES_CHKSUM = "\
> +    file://COPYING;md5=fc178bcd425090939a8b634d1d6a9594 \
> +    file://tests/COPYING;md5=a23a74b3f4caf9616230789d94217acb \
> +"
>  
>  SRC_URI = "https://github.com/kergoth/tslib/releases/download/${PV}/tslib-${PV}.tar.xz;downloadfilename=tslib-${PV}.tar.xz \
>             file://ts.conf \
> @@ -21,8 +24,6 @@ UPSTREAM_CHECK_URI = "https://github.com/kergoth/tslib/releases"
>  
>  inherit autotools pkgconfig
>  
> -EXTRA_OECONF = "--enable-shared --disable-h3600 --enable-input --disable-corgi --disable-collie --disable-mk712 --disable-arctic2 --disable-ucb1x00"
> -
>  do_install_prepend() {
>      install -m 0644 ${WORKDIR}/ts.conf ${S}/etc/ts.conf
>  }
> @@ -32,9 +33,6 @@ do_install_append() {
>      install -m 0755 ${WORKDIR}/tslib.sh ${D}${sysconfdir}/profile.d/
>  }
>  
> -# People should consider using udev's /dev/input/touchscreen0 symlink
> -# instead of detect-stylus
> -#RDEPENDS_tslib-conf_weird-machine = "detect-stylus"
>  RPROVIDES_tslib-conf = "libts-0.0-conf"
>  
>  PACKAGES =+ "tslib-conf tslib-tests tslib-calibrate tslib-uinput"
> 


