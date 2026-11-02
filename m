Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9038.1793611126164299361
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Nov 2026 01:18:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=ZHjvlFzL;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so27804185e9.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 02 Nov 2026 01:18:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793611124; x=1794215924; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eRBb/QmPstYiWizzaazUBf9XlxqoWGrwUgRnwzwFuws=;
        b=ZHjvlFzLyLnR5qtG8kuT8eTZkinqNwpdrDU4l+f/6VjWtkljzM/U2DG9gddp473wab
         QQ+5mQCG2fwbO2bHGl8P2n0BmTKNwFxy8fwMpwhZPzEhx3za3+vcZMHMIB7dt1rioKbA
         aJ7M/dopAX6+8R+KTGNbSAF+E9/oRytjoW8yFE4qtKTBYI1sNqaU/HMABlWa3oXtdJnp
         hq/BMbQ/uShi3RQOfr70pqZF6FXuNplrLtwZPn7Mqv1XiKHy5X4dZ4kNlDtjBPPYZj8U
         gA0SkKu5haaN9vaDNpOhWy1QenRWLPXlR5+9Mf84QHIYw+EKD6U2s2AweioX3dZLxfyi
         HtJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793611124; x=1794215924;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eRBb/QmPstYiWizzaazUBf9XlxqoWGrwUgRnwzwFuws=;
        b=2PDuy5Lioan0UuAc71ivhzeWihnyyXyHqW5XA8jXyDpKD5kdOEln4SdlOsV59T9iZf
         VfxdDqKkBk6ct0nu18dE870opl4CIkeGpqAVm6daB5VQgrF3PmItZqfujPPbA/0ynN9S
         zzC8shEP4/Q4Al4+axmaP8GMoRsgXYMKW/sNeeZyy76AHtqUbtNXI29FQWxyXHs9fKrb
         Rux7up8TOcfPI6jtZ6Gn5EzRK95GhrZ8xF/RFJxOngfj2sHjoHKctEzyBujh6sT8Ar2h
         6XQ6+Nx92+Hfl3zo/ocCj/OFuUCqM9t9JJS1p+Og/lkyn4hl4cCb52Lbxjf7eJ94bjtE
         wD7Q==
X-Forwarded-Encrypted: i=1; AKwUvByhuhzJHdhYmamRCaLnAmMOaQbe5W8bN7qWodibVEh1HRY34OIbUGesftt4RXOQRfaI72NofFXquXz7QYLKvbVIY9A=@lists.openembedded.org
X-Gm-Message-State: AFq9FYJzO/eC+KoPIfuZsCBPki6hys6+W05/tQdi3li4zOPOrWxSqZdq
	QV3UXrV1rRODIwIFWGM0SppLKh2UUgQkgm8d43FAfzlHExBfZv/fyrgJiA2SxGrfj5U=
X-Gm-Gg: AYBFou28FV4gJAVyyPWjPsONEJzBRmuIu4ubSN8g/SXqwaxORbFZ8JWFfpFaYvvXs/6
	mkNcAR/6FbPV/7N46d0deeFDrQXTXuyf+OYSnXuL3Hw2DTayOuMCquE2qU40Tws+lB+5r/dvHOV
	zEnMTA7AqeALXDY6dyYKHFqIA6Td9wNBRgSPmZMKu+oND2cpZE3Ocav4vibrlFTft3YToTivFCJ
	aNCwZbl5zWOMh2iArfYAVFiees+cKkyRtlHEzMz/gXvXFwYwP4lcDuFTz2gWcC02GKOy7xQXp0E
	cC1E5q9uiooCf09Vup+3LFz6vuHDtgXmekJYRU5afgm7u80kH6FoqNV1QlD5Tg8BCBBnahoIvGs
	U/Z2Ayj1zo2tOY4szas/CvnNExub+KOIegQXuW3yv0uvaDnJslZPojK/wyF+o1usaTz0T9TU/Hf
	xfd1+fyu9jEVUBuwyaQnbu7/CUQdVlzm4rolj6srZntEd1XUXK/W6T2lk9+zyIDYBqpQYGyGYgi
	DOsHhl96uozFxbnohjESScA1XJEf7WNCtkaUdk2Shoid1BbQld2PMhNOpVgClUd8gmUXhNnyyFJ
	ZGg/CcGt5fjGmY2WnZYWArX3U1N3JWMERfUY+kqWEuLtTMUj2sR5Bdq4rGpqmf4c0Uw+BlapgAI
	4yxoPx2aQA+1r9Q==
X-Received: by 2002:a05:600c:638f:b0:4a2:c2b:a91b with SMTP id 5b1f17b1804b1-4ac17d168a6mr208396645e9.10.1793611124301;
        Mon, 02 Nov 2026 01:18:44 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa8213ead6sm337404815e9.14.2026.11.02.01.18.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 01:18:43 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Nov 2026 10:18:43 +0100
Message-Id: <DMKM2V33RN0M.255D31J6YKVW3@smile.fr>
Subject: Re: [oe] [PATCH 0/1] Backport of spitools 1.2.0 recipe into
 blacksail branch
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <mns@gomspace.com>, <openembedded-devel@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20261102071431.2735305-1-mns@gomspace.com>
In-Reply-To: <20261102071431.2735305-1-mns@gomspace.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 02 Nov 2026 09:18:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131744

On Mon Nov 2, 2026 at 8:14 AM CET, Martin Siegumfeldt via openembedded-deve=
l wrote:
> As indicated through https://github.com/cpb-/spi-tools/issues/36 a
> regression was introduced in 1.1.0/1.1.1 breaking the very basics
>
> Martin Siegumfeldt (1):
>   spitools: upgrade 1.1.1 -> 1.2.0
>
>  .../spitools/{spitools_1.1.1.bb =3D> spitools_1.2.0.bb}         | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>  rename meta-oe/recipes-support/spitools/{spitools_1.1.1.bb =3D> spitools=
_1.2.0.bb} (86%)

Hello,

FYI, if you want to target blacksail, you need to have [blacksail] in the
mail subject.

Regards,
--=20
Yoann Congal
Smile ECS

