Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F6E4C77B7A
	for <webhook@archiver.kernel.org>; Tue,  6 Jun 2023 15:57:36 +0000 (UTC)
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
 by mx.groups.io with SMTP id smtpd.web11.219.1686067052281839588
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Jun 2023 08:57:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=Ws0ETM+i;
 spf=pass (domain: gmail.com, ip: 209.85.161.42, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-55a35e2a430so1054594eaf.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 Jun 2023 08:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686067051; x=1688659051;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GnGy3nivTMOnQLT7Wv4KzhYL/KkEVVBLNmMdXLzrRSY=;
        b=Ws0ETM+i6fjlxGNynbITafbqGQWFSHULOLutxd7y04FFK9slhKRnTExaiYgXXhcvCp
         kOLs5E1zjKyvt7PiajV0mTSha5cHtAhORL/Q3yBXFuZ50loacRLKfBCtVM6XPJRrfTl6
         qWljrKw3IYavo17Il6Us2p+ZGh6YHzhmUBYFDUVXk7rWe+bgWoGZzBJCbT483S9oh187
         9wLnd+BMSAeW09BF+P6eBi3H027vWmmMlNgUK8TtssmnrjGB1z27AaXlb7Yh8KT8TNDw
         jubLcDvLbwCGadzJUtcZJxGvoAFKdlAkBD6um7RXpudoRk5B979vaRLnnyHySLQrNjDo
         EnjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686067051; x=1688659051;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GnGy3nivTMOnQLT7Wv4KzhYL/KkEVVBLNmMdXLzrRSY=;
        b=FkGBcD5iNbiayLbMSkrmhmTcCjcf8XLC1LRanpv0lEiAx5uYtYMPToN7NQxyYATZxl
         QCxKanFulznqUNDobCfuNM/bTGcpuNRPul9VHE2M5vFAYFRrrfjgqRh0yGKjVqPdH45c
         ttsYXNDaKhUZywG7cClHIj1D9nPgjciYmqWsDBXbTF7K3RFUT9JNFSSEc0EZec2YQvDR
         9N/sRjv4ngoXdJJrS+kpLU7H8QJqapDxlWmdiLgXkHfFHKZeR/Xra/79yc85Iya3me7h
         Zk8YF0byIc2GU7RCkvdUmieTqmr5w7/gwwVyhga57RuMtQXF5vmghT8gWDM9KcwnuvYA
         yisQ==
X-Gm-Message-State: AC+VfDyp1LNhFA9kmTPYbakJKLhh2x1TMHlUABYJ9jjau4V1e/O8qQ9V
	szaUsbqtFK7iiYNi8Yy33/ult/wRexGi0bJflgA=
X-Google-Smtp-Source: ACHHUZ6Z2xfeb3wFRtUXyb6bL1V4R8v3e2TQWUyhsJz0D93mYRUY/UEp/O4RivMze8EnQk/xlA19Guc/9c7RQDh/SkM=
X-Received: by 2002:a4a:e885:0:b0:558:b793:f10b with SMTP id
 g5-20020a4ae885000000b00558b793f10bmr1228415ooe.6.1686067051310; Tue, 06 Jun
 2023 08:57:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230606090013.1455222-1-f_l_k@t-online.de> <20230606090013.1455222-3-f_l_k@t-online.de>
In-Reply-To: <20230606090013.1455222-3-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 6 Jun 2023 08:57:05 -0700
Message-ID: <CAMKF1sqcqv4z5Z0=VS88DnzrJF+Y7aUaOaz5E0Pf42cPeUetYg@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCH 3/3] gnome-shell: upgrade 44.1 -> 44.2
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Jun 2023 15:57:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103148

was there a patch missed in this series ? I see 2/3 and 3/3 but not 1/3

On Tue, Jun 6, 2023 at 2:00=E2=80=AFAM Markus Volk <f_l_k@t-online.de> wrot=
e:
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  .../gnome-shell/{gnome-shell_44.1.bb =3D> gnome-shell_44.2.bb}    | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-gnome/recipes-gnome/gnome-shell/{gnome-shell_44.1.bb =3D> gn=
ome-shell_44.2.bb} (95%)
>
> diff --git a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_44.1.bb b/m=
eta-gnome/recipes-gnome/gnome-shell/gnome-shell_44.2.bb
> similarity index 95%
> rename from meta-gnome/recipes-gnome/gnome-shell/gnome-shell_44.1.bb
> rename to meta-gnome/recipes-gnome/gnome-shell/gnome-shell_44.2.bb
> index f8f500afe..09995e51e 100644
> --- a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_44.1.bb
> +++ b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_44.2.bb
> @@ -32,7 +32,7 @@ GIR_MESON_OPTION =3D ""
>  # gobject-introspection is mandatory and cannot be configured
>  REQUIRED_DISTRO_FEATURES +=3D "gobject-introspection-data"
>
> -SRC_URI[archive.sha256sum] =3D "0bfbe4394d267625154d08d01467bdbd99e81575=
12fc8df45d5c02ddb7551ca6"
> +SRC_URI[archive.sha256sum] =3D "55f279ec6303b7c0c89246eced81247c87fc1c73=
948f45eb212a647218d1b63f"
>  SRC_URI +=3D "file://0001-Introduce-options-gjs_path-to-optionally-set-p=
ath-to.patch"
>
>  PACKAGECONFIG ??=3D "bluetooth nm ${@bb.utils.filter('DISTRO_FEATURES', =
'systemd', d)}"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#103135): https://lists.openembedded.org/g/openembedde=
d-devel/message/103135
> Mute This Topic: https://lists.openembedded.org/mt/99359497/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

