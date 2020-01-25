Return-Path: <ticotimo@gmail.com>
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com
	[209.85.166.50])
	by mail.openembedded.org (Postfix) with ESMTP id B6F357FD14
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 Jan 2020 20:42:31 +0000 (UTC)
Received: by mail-io1-f50.google.com with SMTP id x1so5747053iop.7
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 Jan 2020 12:42:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=dLEnD1Ry3i/J14QXTs3vxIAqNRzLQq/y9r0VR505N5E=;
	b=dHpxxwxoEI9GfozRQ541Iw6heMN9edP5Dq8tL95b5OCZvE6q0PQiQ33G8bp+dOOurI
	gsof31/tl46Kqmrgaef4PncMrS0sNdSMCblTS/oB+5LGMdt2MH5PdY8psWMzOyUrMlNr
	qRhloFpG+Rf4yUtRmLBPZEatR85x2hs82qlP1wB8RYCJ8ogM/N95MD5KokmTA4T64Hbk
	bTCQ96PFKTDCGSluDYKk7l5vxd+uBt+0qllAM2ZMwRS1ckyzGVyZxo7PAYwivzrIwKXD
	NELvS4nr4VY7L1hf3FpYFqYabAGeb2Tqcxl+qBx6SEYfMeRiyk8PrSGwhVjdWwHpiuzU
	QCtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=dLEnD1Ry3i/J14QXTs3vxIAqNRzLQq/y9r0VR505N5E=;
	b=lpDO5qyMGE2YqC1RIv1CrV+SL4rVUUr8D+ypDynxuBqTZsTIxBsEw10gzJ7U8sTAVL
	EwjMCpjSeOQAwaoHp0TqhjLwVmpMAAbR3rOUjPxsY5VYxsXC+548nklG6OH0o8uJk3ps
	i/FJH5jjhVcX/8IeeuoRDx45c1WBRECGBbWVp/1RyUcWBhF3LsSPiC9hDbNszerqUrLL
	HoyBM74qX1gWwwhjo4RTKYJiWtCnCkGsL1j3Uqr4PZrxvvoIU8pLuy0XYGlNm0QRW/3a
	DTcfN+H094qLLlzFo0UbbzHfIj1DRlcRXPGz5FgrpGolzzNhenVIh0XzcGwApqILT8NX
	wFlQ==
X-Gm-Message-State: APjAAAW9R0ZJAS4u8x7d0cIJOHlz+T2mlg5abJvKWpSRgotbQm+uL5uC
	UYt6DRLZOBg/Lyk2TjMovxMHmQPVkL4A5fQd5Oo=
X-Google-Smtp-Source: APXvYqxVrA7s+Vte6JDVI8plNy8JhAb9+lq0yMV4rjQLMYkYT04FGLyj+wPzZLZwFNdLXM3RM7cZcpSWG35ylHN4xJY=
X-Received: by 2002:a05:6602:210a:: with SMTP id
	x10mr5610487iox.151.1579984952589; 
	Sat, 25 Jan 2020 12:42:32 -0800 (PST)
MIME-Version: 1.0
References: <20200125202357.4766-1-Martin.Jansa@gmail.com>
In-Reply-To: <20200125202357.4766-1-Martin.Jansa@gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Sat, 25 Jan 2020 12:42:21 -0800
Message-ID: <CANx9H-BvkgBQb_NPgJ66LUJvpMDFy7h899MTrnVrqGsm=fDsaQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] packagegrop-meta-oe: remove blacklisted mpv
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
X-List-Received-Date: Sat, 25 Jan 2020 20:42:31 -0000
Content-Type: text/plain; charset="UTF-8"

If someone cares, it has been updated to python3
https://github.com/mpv-player/mpv/releases/tag/v0.31.0


On Sat, Jan 25, 2020 at 12:24 PM Martin Jansa <martin.jansa@gmail.com>
wrote:

> * it's blacklisted with:
>   mpv_0.26.0.bb:PNBLACKLIST[mpv] = "Needs forward porting to use python3"
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> index 865cbb0bfc..d5789a758d 100644
> --- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> +++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> @@ -207,7 +207,7 @@ RDEPENDS_packagegroup-meta-oe-multimedia ="\
>      sound-theme-freedesktop v4l-utils yavta wavpack libvpx \
>      ${@bb.utils.contains("DISTRO_FEATURES", "x11", "xpext pavucontrol
> xsp", "", d)} \
>      libmikmod \
> -    ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "libmad
> faad2 mpv", "", d)} \
> +    ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "libmad
> faad2", "", d)} \
>      "
>  RDEPENDS_packagegroup-meta-oe-multimedia_remove_libc-musl = "alsa-oss"
>
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

