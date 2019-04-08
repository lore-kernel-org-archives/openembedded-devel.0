Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
	[209.85.160.169])
	by mail.openembedded.org (Postfix) with ESMTP id 6A19F7D4E2
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Apr 2019 17:34:31 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id v32so16398314qtc.10
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Apr 2019 10:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=kcDxfyfZnyJliPWqu/W7Etp1ByEXoDIEKkRjPMYpxFk=;
	b=i8l24VOv/Jv4iTMfsp9pDfPEYD3sbOOcxq/qugNWiGF+NdoTDS0EIC65n2XAj1Rjik
	uAptFCTtX10CmBP3xg7K0QogOxgoZpjTeF6tkAz0mXSw3uFTtnp1Jkp7LS8QsjXidjSl
	z84Q3upVE3o8DYnhSsDpOeizyR6I0hgEWXo587jp60WBnEJuQd2REOrWtSbvO2guoCAX
	Yr8Obl9F2HRzwhyVcSHQ9+K2XKCfSdKhE2MLPKkRejAdjjuq+XH1SUEIi8rCJgktje6x
	j2do9nqxeoYsPkbVACJNf+lWb/Kdoa18pP0eYqCTvWIAYD6pqjAd/Ja2Spauqa4yNOGo
	rHLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=kcDxfyfZnyJliPWqu/W7Etp1ByEXoDIEKkRjPMYpxFk=;
	b=pNOv+9zGKcxlAyrzcp6A+qaHqT40uFFZ2+eEH95AxjBpHFIFdtLWiQcDSPRhpmuhPx
	x7Gcb4USRoofXaEhjWSRLI2xVlI2XUn7XzVcrmtW8uxZQ+iI+HM0CT/SRZcQFLG6iAD/
	qwDbUDvpQwNVNelODWZoRKNFsMKzhTr7+PuvaOmj0sumOXpSZ0jzhILhw54pzxx+VhbH
	nmKy3N0a/2exfMtJQUvVlC51i8mGLLD1MCPaQF4WD8HFM4ramZ6udl650ydSBkQRkcxQ
	X7R1N95sqnhRYME9XDoWVy5O6Thvm4OLyDNDiZ1hayZMbRTR6bTQziJggpXGN1RMy+x7
	TVXQ==
X-Gm-Message-State: APjAAAUDmTLZAtV37qbANeaJgaukVQTofyb5Lwaj6uSycNIYiMTZY2AA
	vDigpVrR9YNSuvZspxzyTR4kBSajQv00SdKU6Wj3sBRDkRk=
X-Google-Smtp-Source: APXvYqzLQjrCHHUhe6DP+WeAWj8AdnwIy3Es5RrFkeNGaJqoxU3pI5qoaVSJMoAeo4GSCnGz5kCrzdZPXSnUHHkNJ6c=
X-Received: by 2002:ac8:262c:: with SMTP id u41mr26388960qtu.198.1554744872060;
	Mon, 08 Apr 2019 10:34:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190406190807.5220-1-open.source@oleksandr-kravchuk.com>
In-Reply-To: <20190406190807.5220-1-open.source@oleksandr-kravchuk.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 8 Apr 2019 10:34:06 -0700
Message-ID: <CAMKF1sqwXkVbyAV8Kq+3gT5sqcnToPdPDU8uD8qyxdrqW58FvA@mail.gmail.com>
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH][meta-networking] macchanger: update to 1.7.0
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
X-List-Received-Date: Mon, 08 Apr 2019 17:34:31 -0000
Content-Type: text/plain; charset="UTF-8"

Fails to build for musl see
https://errors.yoctoproject.org/Errors/Build/79499/

On Sat, Apr 6, 2019 at 12:08 PM Oleksandr Kravchuk
<open.source@oleksandr-kravchuk.com> wrote:
>
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>  .../{macchanger_1.5.0.bb => macchanger_1.7.0.bb}    | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
>  rename meta-networking/recipes-support/macchanger/{macchanger_1.5.0.bb => macchanger_1.7.0.bb} (50%)
>
> diff --git a/meta-networking/recipes-support/macchanger/macchanger_1.5.0.bb b/meta-networking/recipes-support/macchanger/macchanger_1.7.0.bb
> similarity index 50%
> rename from meta-networking/recipes-support/macchanger/macchanger_1.5.0.bb
> rename to meta-networking/recipes-support/macchanger/macchanger_1.7.0.bb
> index a90177f19..0c683ac01 100644
> --- a/meta-networking/recipes-support/macchanger/macchanger_1.5.0.bb
> +++ b/meta-networking/recipes-support/macchanger/macchanger_1.7.0.bb
> @@ -1,14 +1,13 @@
>  SUMMARY = "Tool to view/change network interface MAC addresses"
>  DESCRIPTION = "A GNU/Linux utility for viewing/manipulating the MAC address of network interfaces."
> -HOMEPAGE = "http://www.alobbs.com/macchanger"
> -LICENSE  = "GPLv2"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
> +HOMEPAGE = "https://github.com/alobbs/macchanger"
> +LICENSE  = "GPLv3"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
>  SECTION = "net"
>
> -SRC_URI  = "${GNU_MIRROR}/macchanger/${BPN}-${PV}.tar.gz"
> -
> -SRC_URI[md5sum] = "79b7cdaeca3d8ebafa764c4b0dd03ab7"
> -SRC_URI[sha256sum] = "d44bfa27cb29c5a718627cb3ef3aa42eb5130426545eb2031120826cd73fa8fe"
> +SRC_URI = "https://github.com/alobbs/macchanger/releases/download/${PV}/${BPN}-${PV}.tar.gz"
> +SRC_URI[md5sum] = "ca56f16142914337391dac91603eb332"
> +SRC_URI[sha256sum] = "dae2717c270fd5f62d790dbf80c19793c651b1b26b62c101b82d5fdf25a845bf"
>
>  FILES_${PN} = " \
>      ${bindir}/${BPN} \
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

