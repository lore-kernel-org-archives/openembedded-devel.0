Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
	[209.85.160.176])
	by mail.openembedded.org (Postfix) with ESMTP id 810417C70C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Feb 2019 18:17:20 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id y4so15991182qtc.10
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Feb 2019 10:17:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=dmTADV6ZmZqzuFi1OjA7YETpYtw9e2k62JxaYF8mnec=;
	b=dfrKrnaQuOhMKL3TI5EyQ5K/rRr3gKi5pgmXw2SceN0P21V647ikJtUG34zqCh20vN
	Szboeao6jHLdyb3AJ/pvjJaEwJ6STzahzVoehzGgSRcReLjz9jyq7KGDTLZ8XOXPYtA0
	isiv5/MRlq9Ky4rd9dKXaMBHB71XpDu6DNqJszvNxWq8kXqjcr/Dwr42MvSwPZSSADVR
	Q+se+YiZPFDHp0uE5Kzb2/yykQFAwuO3sxNozM+AY/Snq3x8Yk+i+NBVn5SdAYxjMwah
	4XNErcMKvyOr9rO7R9RH9fKghgnsIptVuP7wptFJ4WCkyDznbsCGzsaNQE4VTixOUG1s
	50Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=dmTADV6ZmZqzuFi1OjA7YETpYtw9e2k62JxaYF8mnec=;
	b=rgLCCvfw6bOCr8RCFwnOD6Am5cefLHoDledgRNtur4xzTIMgK86/Md2htnCrG9bVZm
	OODLOAPYmsk2Y/FB4+ueVbNJq7l2WWhJjfe7hU45fKcvxlkL/YoqUxav/gNW8C+UWY+5
	V0M7vUP+ilHAQZ4JC75rPMQQpBZj9VO0m75EsogHt96x71tBlv25aKiDQmN3QiM8eHkm
	16c5uAQw9O0gJLOdRt61sqaExyVcBEDp5rPrnW5a29EgRKq/d+dd2oBcQl2gI7aDwKaJ
	xdgJWPKU2XXqcfiPB5OpB+qoU8u1tNQojok/mgr/YPrC5MvlxRMeVLfuopOgW5YPzkXY
	Fy1A==
X-Gm-Message-State: AHQUAuZCPC2Y0C2o/FhIlqpKVfqYrV/YYwMLeeorg3VzKtPT3amLbAMH
	z+aWSV3ZggjjwNLpbndCt2S1bN7fKjFZi4sd3D7WEw==
X-Google-Smtp-Source: AHgI3IY+zAnDyoC/mNKW3CC5JtjiVAaq/5Oac/2NuMqYywh5CPQ/Sm/v4NkhT7ocJy5OyVXS3Ftx/RNLc0Kk/la3/q8=
X-Received: by 2002:ac8:300a:: with SMTP id f10mr18890753qte.236.1551205041255;
	Tue, 26 Feb 2019 10:17:21 -0800 (PST)
MIME-Version: 1.0
References: <20190220043740.27952-1-zboszor@pr.hu>
	<20190226095502.5499-1-zboszor@pr.hu>
	<20190226095502.5499-7-zboszor@pr.hu>
In-Reply-To: <20190226095502.5499-7-zboszor@pr.hu>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 26 Feb 2019 10:16:55 -0800
Message-ID: <CAMKF1sp9y6+7Qk_vgunPtZDXSfx=YcZfWsa9x1ZO0AgASUht7Q@mail.gmail.com>
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@pr.hu>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 6/7] plymouth: Use plymouth_initrd DISTRO_FEATURE
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
X-List-Received-Date: Tue, 26 Feb 2019 18:17:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 26, 2019 at 1:55 AM B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n <zbo=
szor@pr.hu> wrote:
>
> dracut conditionally depends plymouth-initrd using the same
> DISTRO_FEATURE knob.
>

cant apply this on top of master-next, can you rebase and resend

> Signed-off-by: B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n <zboszor@pr.hu>
> ---
>  meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb b/meta-oe/re=
cipes-core/plymouth/plymouth_0.9.2.bb
> index a5b16c979..b7be9f04b 100644
> --- a/meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb
> +++ b/meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb
> @@ -36,7 +36,6 @@ PACKAGECONFIG_append_x86-64 =3D " drm"
>  PACKAGECONFIG[drm] =3D "--enable-drm,--disable-drm,libdrm"
>  PACKAGECONFIG[pango] =3D "--enable-pango,--disable-pango,pango"
>  PACKAGECONFIG[gtk] =3D "--enable-gtk,--disable-gtk,gtk+3"
> -PACKAGECONFIG[initrd] =3D ",,,"
>
>  LOGO ??=3D "${datadir}/plymouth/bizcom.png"
>
> @@ -46,12 +45,12 @@ do_install_append() {
>      # Remove /var/run from package as plymouth will populate it on start=
up
>      rm -fr "${D}${localstatedir}/run"
>
> -    if ! ${@bb.utils.contains('PACKAGECONFIG', 'initrd', 'true', 'false'=
, d)}; then
> +    if ! ${@bb.utils.contains('DISTRO_FEATURES', 'plymouth_initrd', 'tru=
e', 'false', d)}; then
>          rm -rf "${D}${libexecdir}"
>      fi
>  }
>
> -PACKAGES =3D. "${@bb.utils.contains('PACKAGECONFIG', 'initrd', '${PN}-in=
itrd ', '', d)}"
> +PACKAGES =3D. "${@bb.utils.contains('DISTRO_FEATURES', 'plymouth_initrd'=
, '${PN}-initrd ', '', d)}"
>  PACKAGES =3D+ "${PN}-set-default-theme"
>
>  FILES_${PN}-initrd =3D "${libexecdir}/plymouth/*"
> --
> 2.20.1
>

