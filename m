Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web10.527.1617834398634158744
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Apr 2021 15:26:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=G7JSxrbb;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id c9so2045817qvv.13
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Apr 2021 15:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=d/73MVZz6PqflMN1fTgrN45lCioodcG995c2ZCmETfk=;
        b=G7JSxrbbX/DjTkUiI+xyWBUj9/wNcbZr8fsBdPx0kA0qiBT9zliKgdlt6amYNY/+GI
         nGmfKkXqhTOuupwZx9QuAQ+PnekolwSUzVULK+5rB+RQxV8h0r9ejTIcrl4gkFJ7S+KN
         3NWzmamMwbkxROuX/MjvzHUyLWuQD77qaHDTy332McufqodStm9le1liG6PIqziFsz7L
         D6jgUHhZJ/S0KO3WhHV55Tt8L+CZwkXkq0RPQwKl3PEBOjaXYRgJ4CJRL46hPssN4Cez
         IGb7/stE0OcHwaFgmQqPWSD95lMfHtp8lZixEVz2vBUQ9rp5oc6Ihd9ETiha86i0crYb
         1YBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=d/73MVZz6PqflMN1fTgrN45lCioodcG995c2ZCmETfk=;
        b=aPDev0OmGhDof5fKn8FYzGBnLnGkqVjowfeBa4XiGB4ub30wxvcHiXEadyG+e5Ln2i
         CFti5taJkXKxt/0tsogDz1YpN0cNz6c5azdKILHOMUhlU6K4N2GyZ3IJyV0HtxOQV8TZ
         N04/VjI1lL9SXOVob/GOQI+umslmA5zVxGBBdJr1aYPPtfTQll18W3l4N+p6dPSJFP4s
         +vuLDHWsz+frkMZkCCG/cNHug9xMl57TUEzLVHvcNlEe5vRJyE1Jm85YbMKY3FwjZcwK
         89hKjSuA77bDyky9vHS5o7UPo8+VYaz5uea5Vz14NkGT+szFz2tbDTFIZagernfv4vkE
         550Q==
X-Gm-Message-State: AOAM532UCF/KRDqWrgD8lA4NGK9FV6DJj9tBpBCRLKGlO232ucjbhcKg
	XY3ZbTtPf4OiwLz1uNkU0aNC/aTs0zm0u4ME8RY=
X-Google-Smtp-Source: ABdhPJxmGFe0bzPMMjQxXJS0TGqeU6NYxzDx8/RaQKRk/ZRnnfTXwCMqLNptTrKjBX2glWPJA44xVz89GlQJ8t8PGso=
X-Received: by 2002:a0c:8148:: with SMTP id 66mr5836946qvc.55.1617834397671;
 Wed, 07 Apr 2021 15:26:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210407221829.606871-1-schnitzeltony@gmail.com> <20210407221829.606871-2-schnitzeltony@gmail.com>
In-Reply-To: <20210407221829.606871-2-schnitzeltony@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 7 Apr 2021 15:26:11 -0700
Message-ID: <CAMKF1soK2QREb8XkTanPJQ_bCOQRAGTeng5iiuf1_D_WUwfpwQ@mail.gmail.com>
Subject: Re: [oe] [PATCH] networkmanager-openvpn: Fix packageing
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 7, 2021 at 3:18 PM Andreas M=C3=BCller <schnitzeltony@gmail.com=
> wrote:
>
> Recent upgrade introduced:
> | ERROR: networkmanager-openvpn-1.8.14-r0 do_package: QA Issue: networkm=
anager-openvpn: Files/directories were installed but not shipped in any pac=
kage:
> |  /usr/share/metainfo
> |  /usr/share/metainfo/network-manager-openvpn.metainfo.xml
>

I wonder why my world build missed this. Is there any setting you are
use where this is triggered.

> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ---
>  .../networkmanager/networkmanager-openvpn_1.8.14.bb              | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-networking/recipes-connectivity/networkmanager/network=
manager-openvpn_1.8.14.bb b/meta-networking/recipes-connectivity/networkman=
ager/networkmanager-openvpn_1.8.14.bb
> index a1a61bed1..1f76d8ab5 100644
> --- a/meta-networking/recipes-connectivity/networkmanager/networkmanager=
-openvpn_1.8.14.bb
> +++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager=
-openvpn_1.8.14.bb
> @@ -38,6 +38,7 @@ USERADD_PARAM_${PN} =3D "--system nm-openvpn"
>
>  FILES_${PN} +=3D " \
>      ${datadir}/dbus-1 \
> +    ${datadir}/metainfo \
>      ${libdir}/NetworkManager/*.so \
>      ${nonarch_libdir}/NetworkManager/VPN/nm-openvpn-service.name \
>  "
> --
> 2.26.2
>
>
>=20
>
