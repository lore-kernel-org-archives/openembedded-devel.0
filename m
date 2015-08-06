Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id C9999734DA
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Aug 2015 03:40:29 +0000 (UTC)
Received: by ioii16 with SMTP id i16so69390414ioi.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Aug 2015 20:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=S1wUvrAerZtgcfDKAXf8Lzqm+Oq9hC6sp9cTsyUk53Q=;
	b=Zo6n+0iVBQ2eghr9hYSajIDdDmHczL9XikGkf5ftbRH8Lqs/XWYBsgcP1eJogFVD7e
	xVAao6IDtbRrYEhBL3XpUyy9qKwJ6bFqlycI1JkfwtyWT/FgxDaXkAT8lxOixzme0c75
	YTEvd/auzxCAY08wFT5bWhBpD8Tt56kUh4t/undVnFBm5UoEKxEauBsuBYGvJ80jyp8T
	9p70aFkONRfPPqBYEM6p5xXYWSaFOsNTt3v+E5d37m39C3ZVkGBbbMqzInVZ7z6gw+Pg
	NOC6PVw9UDQ28zyzsQkL3yxnIsOSaakWRCGpoc9ZYYZBlodIBZvn9GlDZ47ipOVcDgst
	DzFA==
X-Received: by 10.107.34.194 with SMTP id i185mr13198755ioi.49.1438832429313; 
	Wed, 05 Aug 2015 20:40:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.38.79 with HTTP; Wed, 5 Aug 2015 20:39:59 -0700 (PDT)
In-Reply-To: <1438743456-2869-1-git-send-email-lixin.fnst@cn.fujitsu.com>
References: <1438743456-2869-1-git-send-email-lixin.fnst@cn.fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 5 Aug 2015 20:39:59 -0700
Message-ID: <CAMKF1sp=e32BtfgaRPsEhrMGB-SMi7aNgyyMg1mLr801bMy=7Q@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2] pcsc-lite: upgrade 1.8.6 -> 1.8.13
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 06 Aug 2015 03:40:29 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Aug 4, 2015 at 7:57 PM, Li xin <lixin.fnst@cn.fujitsu.com> wrote:
> * Remove PR
> * Modify chksum of COYING,since the explanation of GPLv3+ is added, but the LICENSE has not been changed.

can you add this to commit message and resend ?

>
> Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> ---
>  .../pcsc-lite/{pcsc-lite_1.8.6.bb => pcsc-lite_1.8.13.bb}        | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>  rename meta-oe/recipes-support/pcsc-lite/{pcsc-lite_1.8.6.bb => pcsc-lite_1.8.13.bb} (69%)
>
> diff --git a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.6.bb b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.13.bb
> similarity index 69%
> rename from meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.6.bb
> rename to meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.13.bb
> index c562b3d..cc72549 100644
> --- a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.6.bb
> +++ b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.13.bb
> @@ -2,14 +2,13 @@ SUMMARY = "PC/SC Lite smart card framework and applications"
>  HOMEPAGE = "http://pcsclite.alioth.debian.org/"
>  LICENSE = "BSD & GPLv3+"
>  LICENSE_${PN}-dev = "GPLv3+"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=a39d325b7d9cf2f07826a5154b16500c"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=bcfbd85230ac3c586fb294c8b627cf32"
>  DEPENDS = "udev"
>
> -SRC_URI = "https://alioth.debian.org/frs/download.php/file/3757/pcsc-lite-${PV}.tar.bz2"
> -SRC_URI[md5sum] = "3e4b777231d35ce35c15c0704f936eaa"
> -SRC_URI[sha256sum] = "1e44049168d1ce55fd56c175f61206955254df0f385455f2a20ec7e8a0e6a77a"
> +SRC_URI = "https://alioth.debian.org/frs/download.php/file/4126/pcsc-lite-${PV}.tar.bz2"
> +SRC_URI[md5sum] = "4dcd22d20a6df8810fac5480cc320b6d"
> +SRC_URI[sha256sum] = "f315047e808d63a3262c4a040f77548af2e04d1fd707e0c2759369b926fbbc3b"
>
> -PR = "r3"
>
>  inherit autotools systemd pkgconfig
>
> --
> 1.8.4.2
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

