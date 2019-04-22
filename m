Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 84F6C6069C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Apr 2019 20:15:44 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id w15so15764491wmc.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Apr 2019 13:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=F6okHo9+uYySlc7RYvOin6uKhlUt1kmDuDY4ew5/1yg=;
	b=HDK4z2/X8AsbOux9n0PIERDCXc0JyoWduRAInvjZXIbWKcPqRXyhQfY40qlPXdlswG
	MnrxOqLDj/0kNpFRoaTR8dVZZLNhsFkjnoqebGNUolnx6nF8N/U3jazX12sT8IgBAhCj
	m20bVHNIKdIM6gCk4aZIrza7KbakMLztnr+rWfKqHU5Wp2oUnZMmnbwTXLz7E9ui2UI3
	sI75tYx3P8rEUVMVTksK0DfdGC6x1Vnu698agl7Rsp5pt0KRmdZ3AM+3PYQwDJn4HKVB
	iG/Y69A+dH42AmOIejmi+VXt/6nAP9diSZuVu1TxAkmgg/CN6DmTHaNThnmYATJIx10E
	6DSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=F6okHo9+uYySlc7RYvOin6uKhlUt1kmDuDY4ew5/1yg=;
	b=m3JXTWXRugI58cn7eOV63KebqmgDPAUSad+pzQ8efBedavnuokVW1RrewXDLsU/Nys
	oKq065s0o4L0Vwd9BcEoIxSCWoEG1rWt8e6wucvFr4T/WK/ZTe7Q1ynzeRNxPDNDYktm
	psg/vDaUPjOqIwSj35GUoPchHWo1bJHAA8G59BgAmYL3oBnUss3ptv14bDvmGWItXikH
	aUw9CxCVj1Iu87o8p1xvg/HtOhUmYkJ00BiIkIRtrDW2Ha6TqDpi2DiRv3hHZGHPzYmS
	MqlxcoKCxMN7ExwpfmjNTDaCvjGDG2C86azpzo1uMd8OrLPUOG1QsVAcBUbHNFDA1rfb
	XL4w==
X-Gm-Message-State: APjAAAVn6tk0Upd2tecNs5nT4o4PvkP3S32gBEZfC6GNgeEnl8lZ2kw1
	ly8bKXllYS3S4s9UAROn/1UHqldlba31yce3omw=
X-Google-Smtp-Source: APXvYqzUae06Ms788aRvuARlWnAuGFjjRumtsaWJIjROKWBiH9WDucgeEP5WWKlgpYzjCMWcwO4d2sgU9TKOCLERd/Y=
X-Received: by 2002:a1c:3507:: with SMTP id c7mr23868wma.20.1555964145221;
	Mon, 22 Apr 2019 13:15:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190422200845.14343-1-daniel.diaz@linaro.org>
In-Reply-To: <20190422200845.14343-1-daniel.diaz@linaro.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 22 Apr 2019 22:15:35 +0200
Message-ID: <CA+chaQcLbYYHTkiU78CkS7t5kRNnPhsk2WsvfD28VVBBjdcidQ@mail.gmail.com>
To: =?UTF-8?B?RGFuaWVsIETDrWF6?= <daniel.diaz@linaro.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] cpupower: update license file checksum
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
X-List-Received-Date: Mon, 22 Apr 2019 20:15:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

NAK

This completely defeats the purpose of LIC_FILES_CHKSUM.

If the COPYING file vary across releases than LIC_FILES_CHKSUM should be
updated when needed while verifying that the LICENSE value is still correct=
.

If you use COMMON_LICENSE_DIR and completely ignore the license in the
source, then it won't ever warn the user that the license was changed while
upgrading to newer release.

On Mon, Apr 22, 2019 at 10:09 PM Daniel D=C3=ADaz <daniel.diaz@linaro.org> =
wrote:

> The Linux kernel is GPLv2, at least as far cpupower is
> concerned. Because this recipe reuses the kernel code, and
> said source code can (does) vary across different releases,
> it's best to refer to license by its name.
>
> Use GPL-2.0 from OE common license dir.
>
> Signed-off-by: Daniel D=C3=ADaz <daniel.diaz@linaro.org>
> ---
>  meta-oe/recipes-kernel/cpupower/cpupower.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-kernel/cpupower/cpupower.bb
> b/meta-oe/recipes-kernel/cpupower/cpupower.bb
> index 928973871..c7ea087a5 100644
> --- a/meta-oe/recipes-kernel/cpupower/cpupower.bb
> +++ b/meta-oe/recipes-kernel/cpupower/cpupower.bb
> @@ -2,7 +2,7 @@ SUMMARY =3D "Shows and sets processor power related value=
s"
>  DESCRIPTION =3D "cpupower is a collection of tools to examine and tune
> power \
>  saving related features of your processor."
>  LICENSE =3D "GPLv2"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dbbea815ee2795b2f4230826c0c6b8=
814"
> +LIC_FILES_CHKSUM =3D
> "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=3D801f80980d171dd6425610833a22d=
be6"
>  DEPENDS =3D "pciutils gettext-native"
>  PROVIDES =3D "virtual/cpupower"
>
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

