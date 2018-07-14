Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f169.google.com (mail-ua0-f169.google.com
	[209.85.217.169])
	by mail.openembedded.org (Postfix) with ESMTP id 09EE075169
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Jul 2018 18:24:01 +0000 (UTC)
Received: by mail-ua0-f169.google.com with SMTP id x24-v6so22539486ual.10
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Jul 2018 11:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=zecPXg2aj/2AcSF1ZwGXlvWNQP7QWDMxP3RXw4YR//U=;
	b=jK4b+43ONVAaIVygm0WmngG7o44QEs5lrLaKwNlBy8eRe8TZOiB2rkFbp2pjnEaBrK
	xeIgUHcjSuOkaqqg53/uRGo4+zYhIVMRNRzTC210n/hB3B7cYYhwolns4iOEerLQnh4m
	ZSMe8Z5TkEPXTojRgejb7bZia7mT22OqupJtYhHlghgiQ4hKJCwPfmncAIGrNjJ6piUi
	KPyejqFvDLgMC1zMPBHnQB5CG5hFZKtRWMFWDprw7cXOywV7I2lPd96s0DlsVt77w/1m
	IFFeq8piVGMTdSaru8cyMvDUFg7CkGLU/iBVejRZ9UQyBNjhrrMhHBecUnPXJNjfVXPI
	P1zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=zecPXg2aj/2AcSF1ZwGXlvWNQP7QWDMxP3RXw4YR//U=;
	b=cDxtF6aQunHeLSK+qB66979bOXOZoOM+Ich3G/o8Ofo8P9tXChY+85SmFMYopeXKMl
	QZ3yHPG/YVWk75pNEDiFioCMFjsyNxRp7RvZMcoiK0mc+zPmB6LnOv1EQ27h6KoQdv+J
	ODpTR4w6zSsz7hZPI0P08eW67jUWCajRnS2iP6flO/WssUJjWs820iBNwxE5CznMtz9H
	XZ27YPeExsWMeJ6zR3U/MzDvQeTHvuEMpqAF9Q/iCeixdyg4PtcuvMKgQ4uX86eGAfZb
	ommcM6LcIxekFn+mtYg1T3HkcIKXYLTZBUXZ3tWwzNcMqu3tLnN8WiZ9iqOEe367tVZA
	iKfw==
X-Gm-Message-State: AOUpUlGONej39XpR/rZ3HLGl1B7byYmzdJ8YzeMYo4ZsVgI9G17+iA4h
	/yJ4s96acTU6ZSScVEiq1PEXdp11y+1qalXOsFnm/w==
X-Google-Smtp-Source: AAOMgpd/W20ymNpMnRxT0fCNv/1X/fCLaoZrkeO5H3kgfmv16aU5zq0TAQpP8M0TSjfssE+7G0YVU8ZC/uIYz9ziKQ4=
X-Received: by 2002:a9f:2187:: with SMTP id 7-v6mr7845229uac.49.1531592642564; 
	Sat, 14 Jul 2018 11:24:02 -0700 (PDT)
MIME-Version: 1.0
References: <20180713011903.84114-1-mingli.yu@windriver.com>
In-Reply-To: <20180713011903.84114-1-mingli.yu@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 14 Jul 2018 11:23:36 -0700
Message-ID: <CAMKF1spHkse1PnbcvYX7-5XxFRnVRt9rdjzD0VxzD-x=w3fJtA@mail.gmail.com>
To: Mingli Yu <mingli.yu@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] cryptsetup: Upgrade to 2.0.3
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
X-List-Received-Date: Sat, 14 Jul 2018 18:24:02 -0000
Content-Type: text/plain; charset="UTF-8"

This fails to build when systemd is selected in DISTRO_FEATURES

cryptsetup-2.0.3: cryptsetup: Files/directories were installed but not
shipped in any package:
  /usr/lib/tmpfiles.d
  /usr/lib/tmpfiles.d/cryptsetup.conf
Please set FILES such that these items are packaged. Alternatively if
they are unneeded, avoid installing them or delete them within
do_install.


On Thu, Jul 12, 2018 at 6:19 PM <mingli.yu@windriver.com> wrote:
>
> From: Mingli Yu <mingli.yu@windriver.com>
>
> * Update the homepage to https://gitlab.com/cryptsetup/cryptsetup
> * Add json-c to DEPENDS as cryptsetup requires the
>   json-c library for JSON data processing since cryptsetup
>   2.0.0 per "The LUKS2 format and features" part of
>   https://mirrors.edge.kernel.org/pub/linux/utils/cryptsetup/v2.0/v2.0.0-ReleaseNotes
>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  .../{cryptsetup_1.7.4.bb => cryptsetup_2.0.3.bb}       | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>  rename meta-oe/recipes-crypto/cryptsetup/{cryptsetup_1.7.4.bb => cryptsetup_2.0.3.bb} (78%)
>
> diff --git a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_1.7.4.bb b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.0.3.bb
> similarity index 78%
> rename from meta-oe/recipes-crypto/cryptsetup/cryptsetup_1.7.4.bb
> rename to meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.0.3.bb
> index c13b764f7..176e29a91 100644
> --- a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_1.7.4.bb
> +++ b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.0.3.bb
> @@ -4,16 +4,16 @@ device-mapper mappings. These include plain dm-crypt volumes and \
>  LUKS volumes. The difference is that LUKS uses a metadata header \
>  and can hence offer more features than plain dm-crypt. On the other \
>  hand, the header is visible and vulnerable to damage."
> -HOMEPAGE = "http://code.google.com/p/cryptsetup/"
> +HOMEPAGE = "https://gitlab.com/cryptsetup/cryptsetup"
>  SECTION = "console"
>  LICENSE = "GPL-2.0-with-OpenSSL-exception"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=32107dd283b1dfeb66c9b3e6be312326"
>
> -DEPENDS = "util-linux libdevmapper popt libgcrypt"
> +DEPENDS = "util-linux libdevmapper popt libgcrypt json-c"
>
> -SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/v1.7/${BP}.tar.xz"
> -SRC_URI[md5sum] = "058ed35c5b776032c2a036838f9e22a7"
> -SRC_URI[sha256sum] = "7ccf893ef79a38fb92d61f03c17b964982119f5319cdaa85a1335b8558cca016"
> +SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/v2.0/${BP}.tar.xz"
> +SRC_URI[md5sum] = "ea1c722f8d4c4e36427628b679b1f819"
> +SRC_URI[sha256sum] = "4d6cca04c1f5ff4a68d045d190efb2623087eda0274ded92f92a4b6911e501d4"
>
>  inherit autotools gettext pkgconfig
>
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

