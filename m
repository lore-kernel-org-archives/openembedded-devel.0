Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4376DCD6E4A
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 03:37:45 +0000 (UTC)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16887.1780371454926458857
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Jun 2026 20:37:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=dPCq+bz6;
 spf=pass (domain: gmail.com, ip: 209.85.160.43, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-43d34292872so105861fac.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 Jun 2026 20:37:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780371454; cv=none;
        d=google.com; s=arc-20240605;
        b=llkeyUbVcLsceeHREoTYy83WOn8ZP8U4Mc4HIoa58NmnOL5XUoE4rJSSNMpTkt5v17
         yXZl5cMZkzSR/uYLaoX5pY7yyuTEuSVzggorID9Y816WpHtabrJ+EJpIKGbKzVWUKeWM
         sFT2dyn96aP+M/116M/aWb0iRWA68A72o8BOIA9XcT6+NXxlclwgLFw9hYvX4Lr2sndh
         9pR75e+oUFymrqKmD/ZA3X+FfYHNXph5NXquHi304oB/3hngMrCOkRChAoXda+h4MYV7
         i0UxHT/ingiZ7aWAda73T02kz78L0vKoh7/f5CuTAWRnQh+4ES8HkXZ44fkp2Yy7DFVA
         fZOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dNhE4g+uiOrZ08hL2cFyvnEf6cLxWTR41B5LWAvLZ8w=;
        fh=t00iliNe9pL0QaiZgATkfZzbJzbg/gzT7cLy1S2kUZs=;
        b=cbZIyscqA8YWnsb8dBM5HhL8ueZIrqLkhx12yb+Cr24p7oYgFWf3eMDrDG04uroyKm
         KZiBaKwpZOhqghQYRuv5e1xrBRvXAV/mszfbPBZ4puFLIakicx674Wseyu/U0IvVn5oG
         pWtOWbjN7GTVy4tB/EIYCEiDxZBoERApHT8gf14iIdK4jB7el68Sgisa5QXrpNwS/C0b
         1kG/TiYtql0E9FqEAeyMC9kbIe+omo3UnjN5bF+KGfSVy8TOUy2E5rB5xNDN+kQ9FLMG
         C5NGcz0xvGAqjxq+XA69ZPnjuM+iHOhVMYt3x7S6SHp7qNgLbocmvzJFQLysOxpclfJI
         l02Q==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780371454; x=1780976254; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dNhE4g+uiOrZ08hL2cFyvnEf6cLxWTR41B5LWAvLZ8w=;
        b=dPCq+bz6bLwMlGkSngTZgz+ltJgiH+/OBN7zqvOfdhNexanqYJFs+5w/+v11hsb/5a
         CXeJtinKzJHZofYvB0q7DGP0+9u+9BN4la9GzOHsjNZIu74LSRnGcdVUlJHfa/E/rX4b
         yCPn1N49HRH3wFWBrj36U+u12kR4gJQEQiNtOuh6xSwvH3xbXjq1XHXD6M/5lCM+vWC9
         F248N0e4kVJ9TfnPKvqcSd0ZzrQI39W79uToWk/1wA9ZTJ/pfYuNI+OvWZ8VFlK1sQaQ
         1XPdEsHNC29s46Lv+Q16NSuS0LOss3QGoyrX0nCknGj/zb4BbOiP7GZppIfRr1SXgIkZ
         YmJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780371454; x=1780976254;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dNhE4g+uiOrZ08hL2cFyvnEf6cLxWTR41B5LWAvLZ8w=;
        b=bMM4+GEO2pvuhPpbYBuJ6ibGllxFyWpmy2aQeViIbuSSDaJtQpE065C8AEoqTl2KBv
         Xnsd7vJJp/qzig+P+Bv3H3eIuWl1uSFfd7oZfwBvY8QkX0BVR8Cw/qQ+fj5O2LTwMocY
         orww5OCuDn5hfRUba1kflK9U/JAHapgr/cXVHhFNZ5cyH6V2qkHZluXO1ejOIchrxGhs
         2vgo25vHUDCTxUItfvSiiGTT7cbLjLo7V1T/5dgLX46sfQ0J2T0D8VWbDSk3z7j29sfG
         eJKKNn6Fm/6VF9EXj0BKl0h4b6BCb7h4rg+XyJzXmigs2MHEzusWSu0QtOAL9JPgBuW7
         ZCtg==
X-Gm-Message-State: AOJu0YxhXUYErT2ujllRp0Nvtb5adRuqAoiImFtbMNf9iqLGWX5cSWJo
	IpX7jQqdZDcuxVYgswedb2wtD6x6Ppwlp7NJrVjBCXg7S7FWB+vUaUxsCCTUVasukUf4BkaEzsD
	IzRlIUHj3t+FlYg4nJqjiuWgcm2zBBVw=
X-Gm-Gg: Acq92OEheIzkfeqFM8CJkFdmtCm4YR+5Z+1ScR2M2yculVfDeG5D/D3SRxyDXo0T347
	CAMbMY7bkVaL6C0/ODmW84N14nsWKyon48A3SJS73Oos8gnPFYdCmE3I5pL49+3C13qJNIlqreQ
	LeEk96uiccoKV8gJX5qU2QWzSEZI9H4GiAappL9qF1LoXbk24OMXF/Xqbf3MSlGZKyTAJrKO7fi
	1tYnTHvEIew2+Y2mXCjBhVpobFhZ3jWU3ss5J22mkcvAqwLrmFuXrUKtX8AOWyXPcz0LGQZow13
	vFBM89smjqj3zSsgrAmF
X-Received: by 2002:a05:6870:a24b:b0:439:d9ef:89c0 with SMTP id
 586e51a60fabf-43ca3f6da74mr8110786fac.5.1780371454031; Mon, 01 Jun 2026
 20:37:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260530120109.3938131-1-filipe.pires@konsulko.com>
In-Reply-To: <20260530120109.3938131-1-filipe.pires@konsulko.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Tue, 2 Jun 2026 15:37:22 +1200
X-Gm-Features: AVHnY4LU1E1bQq5HKzPpqbk0sTLkA4ErHPjeDwVqSoEgarhR32KfwOBhgIO7bRE
Message-ID: <CADySD0HzuNOPKc09VRGvKon+YiyEgFPob9faF-Bg-zCRAaTryw@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH] unbound: upgrade 1.25.0 -> 1.25.1
To: filipe.pires@konsulko.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Jun 2026 03:37:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127319

Thanks for your patch but there is already a pending one[1]

[1]https://lists.openembedded.org/g/openembedded-devel/message/127262


On Sun, May 31, 2026 at 12:01=E2=80=AFAM fpires96 via lists.openembedded.or=
g
<filipe.pires=3Dkonsulko.com@lists.openembedded.org> wrote:
>
> From: Filipe Pires <filipe.pires@konsulko.com>
>
> Signed-off-by: Filipe Pires <filipe.pires@konsulko.com>
> ---
>  .../unbound/{unbound_1.25.0.bb =3D> unbound_1.25.1.bb}            | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-networking/recipes-support/unbound/{unbound_1.25.0.bb =3D> u=
nbound_1.25.1.bb} (98%)
>
> diff --git a/meta-networking/recipes-support/unbound/unbound_1.25.0.bb b/=
meta-networking/recipes-support/unbound/unbound_1.25.1.bb
> similarity index 98%
> rename from meta-networking/recipes-support/unbound/unbound_1.25.0.bb
> rename to meta-networking/recipes-support/unbound/unbound_1.25.1.bb
> index 8e0d3f346d..7331fc01d1 100644
> --- a/meta-networking/recipes-support/unbound/unbound_1.25.0.bb
> +++ b/meta-networking/recipes-support/unbound/unbound_1.25.1.bb
> @@ -13,7 +13,7 @@ SRC_URI =3D "git://github.com/NLnetLabs/unbound.git;pro=
tocol=3Dhttps;branch=3Dmaster;t
>             file://run-ptest \
>             "
>
> -SRCREV =3D "25fe6020248df41f891c921b254cf91d3d55f194"
> +SRCREV =3D "75b6dba593d4fff000434cd64807c6ebd50bd244"
>
>  inherit autotools pkgconfig systemd update-rc.d ptest
>
> --
> 2.49.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#127298): https://lists.openembedded.org/g/openembedde=
d-devel/message/127298
> Mute This Topic: https://lists.openembedded.org/mt/119560964/3619737
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nkur.tyagi85@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

