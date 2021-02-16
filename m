Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web09.5725.1613469338151208695
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Feb 2021 01:55:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qppsruCn;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id lu16so684858ejb.9
        for <openembedded-devel@lists.openembedded.org>; Tue, 16 Feb 2021 01:55:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=jW9ro6cxAuSYBh3XPW3y2jTYb+k+Q/02EO1VGFEPJBw=;
        b=qppsruCnezsBcuzk2sDkONcrROlTz3HPp7cR2K8gF1JTZQPJFS6mrK1HCCFHmmkaKA
         RypmDnDpLaCvJYNQw8dikr4++n5Sz2/7Ia/U0xVxo96P+r9WDlJz0MMcdYvOCIkzH+OY
         oiu+n5giC5xXiq5XxX9HideSiMsLqRjhaAjSozv+djaKH2G6jKHXZlLveR4rZjHypO3d
         h6cW8YqPW1d9JsVYd7ChsHHypIYA6gGem22WloaEY2A3Q6GYy/HveCM6nVtc35iQTaak
         RJIiqLUOYM+GRiBB74yzf8S6fReA/+EID/jBMUZ+oMXCffBzejcqHzw2Mx/Vn7WEh0EF
         9Txw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jW9ro6cxAuSYBh3XPW3y2jTYb+k+Q/02EO1VGFEPJBw=;
        b=hu5zHbzABWqVg7PH7rKUr+YGaVFzDmOj5Hlo5OCQqyi48pDmboELcnNwxzU8zBsn3a
         /YA0JLCaHNmu/Z2sLnuJrm4d9ozApWV4VSVdUtELY5rSTDUB51PoFftaL/n86A1gfpRj
         RuEJC5EGePNOaJY0G24nJy2XLx7QAcnTfuShJlJ6msZw1RapCqhgOpqDTVn3l2JnPXL7
         oZsRbLBz6l/1OB1BmzTtQgvYFJqau4sblho7z4Zb0eImwPm/18Lwi4nKIoESyyVgkk0j
         RrcnW9ZUKVn5Cjubv3rJ9Vyt3v8MWqMIzcbzXO4X9DXTzr/LwHfUKabW/07hSpPwhJeC
         y6hA==
X-Gm-Message-State: AOAM5327nF0RQz70iG3DJwXVom1mlSkaEdB5SEQ6L5REO42ewqRotJVL
	Z0BX0JNWyQ7xDyegSGRiUj4=
X-Google-Smtp-Source: ABdhPJxvrocWo9S4pnKRCo1iHemlgf7YRYQ5xmwXxzTS8aKZ8J4xohIJh9J7ak1nIHjJg+5n5wyovQ==
X-Received: by 2002:a17:906:16c6:: with SMTP id t6mr19148232ejd.102.1613469336631;
        Tue, 16 Feb 2021 01:55:36 -0800 (PST)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id g20sm7724843ejz.54.2021.02.16.01.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Feb 2021 01:55:35 -0800 (PST)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 16 Feb 2021 10:55:35 +0100
To: akuster <akuster808@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [dunfell 00/11] Patch review Feb 15th
Message-ID: <20210216095535.57niv5clax3lzwlr@jama>
References: <cover.1613440394.git.akuster808@gmail.com>
MIME-Version: 1.0
In-Reply-To: <cover.1613440394.git.akuster808@gmail.com>
X-Groupsio-MsgNum: 89548
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="se4vjo63pcqr7sh5"
Content-Disposition: inline

--se4vjo63pcqr7sh5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 15, 2021 at 05:58:08PM -0800, akuster wrote:
> Here is the next set for review.
> Please have reviews back by Wednesday
>=20
> The following changes since commit de37512b25c1f8c6bb6ab2b3782ac0fe014434=
83:
>=20
>   gpsd: mark CLEANBROKEN (2021-01-31 09:42:35 -0800)
>=20
> are available in the Git repository at:
>=20
>   git://git.openembedded.org/meta-openembedded-contrib stable/dunfell-nut
>   http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=3Dstable/=
dunfell-nut

Please include
https://lists.openembedded.org/g/openembedded-devel/message/89395
as well.

--se4vjo63pcqr7sh5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCYCuWlQAKCRA3VSO3ZXaA
HNYcAJwOV2AeuD2RXhWIIoghwmJGcJekbgCfU1389kYNapct8cfeZjZVE/73HXo=
=pnXp
-----END PGP SIGNATURE-----

--se4vjo63pcqr7sh5--
