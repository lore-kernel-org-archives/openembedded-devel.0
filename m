Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA90EC77B7E
	for <webhook@archiver.kernel.org>; Thu, 25 May 2023 23:41:44 +0000 (UTC)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
 by mx.groups.io with SMTP id smtpd.web11.4941.1685058101617756010
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 May 2023 16:41:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=YrgROmp/;
 spf=pass (domain: gmail.com, ip: 209.85.167.169, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-397fe20a2b5so83907b6e.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 16:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685058101; x=1687650101;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nWCPMthJxNiCXxvMlGdPetkYESpQVZ/KJibUZ1ttodM=;
        b=YrgROmp/zxjygSWdCWg+4Y9hufwed5RoogQCGwvPmYDdIbAgzhMK0Qy7NryK4SpktQ
         jzNB0SVfCLlQw+u5AtadKbQkzOdm0D4/oZHUPPEHSGG49bwKQ2Eu7qOQeoC8194PoOTd
         Cx0fVyOUzvv+Z6N8xp+k4mgTTLH8T1jjxgGW3nmqc0IN0vkAnI0EXf5XJ/XKoY/7YhC0
         OAUUvUTWdg9orWsSWU37ydjr24e2hTwh3Ft5Hnj3MKtZ0an7LMZbimabXaHKZMhJ3+zv
         lcj7BKKtsulsBCSjnKpQm6QCxZWcJams1CsBaGK0dGHbX7B274ye+gWYQUa991i1I9+0
         hWJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685058101; x=1687650101;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nWCPMthJxNiCXxvMlGdPetkYESpQVZ/KJibUZ1ttodM=;
        b=lNlLfGt7lnrsU7W8MpGZiI+t+JSFHmp9kgx6RPvHbwoP22ZGhpD6+V5Lug7rsawOzU
         JZircp2ZvufJ0Nk5UHuRgbxKZXeB6E7/ii7S8DenVkiwGa67EEOBK40jJG/dzpKxc/Yg
         4Bk7Vt0XXfBGnwAxfsYiJ9WxdTc6krNozgqMT+r4iplTAQsDwLILmr2J49yf2HM10bfm
         X3yqaoFIbBRQLqs0hjVC17LjcPRQ5zeCn5hz9/JiwkRVKbqlfXDCpXGXxSEdobzl94Go
         PO8WJqXuLyRYhNbUL6WpxIYGut2cjWOfWXhwYW4+Akb2cFVVIFPJmGWlkrJk3Xd/eIQz
         FO+w==
X-Gm-Message-State: AC+VfDxtT1MaeFs6lgi70k+fDTXY4c6mgTneiWFQqEpy/795nSS8eH7l
	KV591hsVFiPUtSP+N0iFEgqXSeWOW9OHeuN2a0U=
X-Google-Smtp-Source: ACHHUZ5fXWeqnouzz2u+neHtENKSqv691SOwQsUznAjNBGcHWF2sixfocCq7OC3GrKqsV8CxwVnKcg/p4nenoiH1LoY=
X-Received: by 2002:a05:6808:1a01:b0:396:1411:804f with SMTP id
 bk1-20020a0568081a0100b003961411804fmr77250oib.26.1685058100719; Thu, 25 May
 2023 16:41:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230525121357.245812-1-ross.burton@arm.com> <20230525121357.245812-12-ross.burton@arm.com>
In-Reply-To: <20230525121357.245812-12-ross.burton@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 25 May 2023 16:41:14 -0700
Message-ID: <CAMKF1sq3ZsxKQ80G45PCz1cjNOccTbg6U8GH052SbKJH2MkggQ@mail.gmail.com>
Subject: Re: [oe] [PATCH 12/14] xfce4-panel-profiles: requires
 gobject-introspection-data DISTRO_FEATURE
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-devel@lists.openembedded.org, nd@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 23:41:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102861

On Thu, May 25, 2023 at 5:14=E2=80=AFAM Ross Burton <ross.burton@arm.com> w=
rote:
>
> From: Ross Burton <ross.burton@arm.com>
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  .../xfce4-panel-profiles/xfce4-panel-profiles_1.0.13.bb         | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-prof=
iles_1.0.13.bb b/meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-pr=
ofiles_1.0.13.bb
> index ab1b827266..9624f90f92 100644
> --- a/meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles_1.=
0.13.bb
> +++ b/meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles_1.=
0.13.bb
> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb67346=
3ab874e80d47fae504"
>
>  inherit python3native gettext gtk-icon-cache features_check
>
> -REQUIRED_DISTRO_FEATURES =3D "x11"
> +REQUIRED_DISTRO_FEATURES =3D "x11 gobject-distro-features"

typo here, it should be gobject-introspection-data instead of
gobject-distro-features, I have fixed it locally on master-next
no need to send a v2.

>
>  DEPENDS +=3D "intltool-native"
>
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#102855): https://lists.openembedded.org/g/openembedde=
d-devel/message/102855
> Mute This Topic: https://lists.openembedded.org/mt/99128572/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

