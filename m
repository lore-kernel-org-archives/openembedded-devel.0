Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 506C0CAC5AE
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 18:20:10 +0000 (UTC)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
 by mx.groups.io with SMTP id smtpd.web11.21590.1758738009901565185
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Sep 2025 11:20:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LL/DKXD/;
 spf=pass (domain: gmail.com, ip: 209.85.219.173, mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e96c48e7101so133717276.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 11:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758738009; x=1759342809; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YHGYmAwkFB4bIUmHTO/yubF6YOd/qzBd3M9pbpLwHV8=;
        b=LL/DKXD/glJGqMr05CsRlW+ol8AlEbx9fjnaB+tOQoePpC/HEdsKQlw6YFHhcX3ZxT
         hvhhJp4xE7dl8OZtof2yakN2MfKbIrilDBFSi0yFGo/KCaUy1eb02sxC0ag75ppaF/W+
         x0iXP/t4HBDqaSBe1E1obejabcYZ6wo2TwD6smioYWPsWzt0An0qDr98mTPB//BSQvl7
         SepV4ytEGk6e6h3YJXACACBIv+7CJpTkxD+bscpSa8SHRQIBqdPMOUYR+rpdeDzAranX
         GJTTj0mn37wVPZbDFZJvqTg9myxni1N62xErCxqwy7D0C3fBwHXVmbPC4A16lEnQGJF4
         ZM+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758738009; x=1759342809;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YHGYmAwkFB4bIUmHTO/yubF6YOd/qzBd3M9pbpLwHV8=;
        b=MBqyS/TxmRjlUc1b6wTDhyhbfLzL3/7YeRWmh6PMHocz6bXs42mAybFQsmJHz2dAVa
         9XQVetImxQG10q82Cxj7Xeu0AKRXhnlagRycDfUQZg07g/wRGfaMIHvKJ7Wq7DcIuFF+
         pv0amfDQ4HGe46u4M1I+nocpyLCkuk6SwJ/ujf2kuHjkPBtcqBGPb7a69mdMTTy5jM7i
         k26sNNsbKRB5suZu+gzjNouN94VRwavQr1fg3V1cNwaCe39zYqGMtZiwig47xUf+3pPx
         TJP1cmjlgF/G0NUzr01hLU3tUW17jQ5kgOirZK73ieTQzxNz/Sny2zVe0tU47qpLfFLf
         vtqQ==
X-Gm-Message-State: AOJu0YwZb0IIEIlhgFzbIbkGMv+nGv5X8ewWBjg/Iw2gJL6FZGkC4JoA
	uW0bfvTGkOsRB4RrJKeQlLCBf9cNovwdJz5etEUSYlNwcDmMN2Lb5Baj2bEDsO0Pf6iGd3/WNwj
	LgCVcNQdh6amCilIVBxtwvWC9zhGUlIg=
X-Gm-Gg: ASbGncvS/NTkKjjpM5zMmvGADqeLeRzXGux+6TzD2I0R01+xqSQKk5/otivPi0u4Nym
	YV0bcL6X70In+NT+Wszs4+Ugz5EPLRKyWanHM1gTXvNXZ8LtKWQK4MQih7eYvYL9mNORrfU2W6J
	RtOUaaCOFnuu9Lk1K631DhmPRl3mwUyoH8FA0xoEcnlIq59Q1OI8DU7P3akiNQxvw6Phvg7lfu+
	1fX1YdQZfkfYbmihzaN4RMdInpBCbvnNcHeqZMWjpcSh6oLAAFJ8rKMgtiZ55qZuxrpm8QC2nOe
	x35Y9sYBKvjoaaV9yM2VuAs=
X-Google-Smtp-Source: AGHT+IETnJuTkbl4O4gdJpI/b16Jj3yrubjgl6eS18M8q5a0RazybztZL8QsUK0XnRSdVqKuh5+AsEGxXuT/VsU3bXE=
X-Received: by 2002:a05:6902:6b09:b0:e96:f737:774 with SMTP id
 3f1490d57ef6-eb37fc109f1mr943103276.18.1758738008824; Wed, 24 Sep 2025
 11:20:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250924122839.4184719-1-skandigraun@gmail.com> <20250924122839.4184719-2-skandigraun@gmail.com>
In-Reply-To: <20250924122839.4184719-2-skandigraun@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 24 Sep 2025 11:19:41 -0700
X-Gm-Features: AS18NWCbTBgs_K_eQLJsIqVNXVMTITnKH2BvEJb7fDlxYs5Ue91v9RHZuuiej7c
Message-ID: <CAMKF1soKbOp3+p=+P9oPwL-2am4Fz3YBB5yNvd+Q+=B2Ka6+5g@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][kirkstone][PATCH 01/20] gedit: upgrade 42.0 -> 42.1
To: skandigraun@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 18:20:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119828

this sets looks ok to me, Another question I have is we need to keep
an eye on scarthgap as well and ensure that versions in kirkstone are
not newer for a longer time. Folks upgrading from kirkstone to
scarthgap will have adverse experience.

On Wed, Sep 24, 2025 at 5:28=E2=80=AFAM Gyorgy Sarvari via
lists.openembedded.org <skandigraun=3Dgmail.com@lists.openembedded.org>
wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Changelog:
> Translation updates.
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> (cherry picked from commit e0462bfb13d571e8ee55b5cff2d0fca7aee98393)
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ---
>  meta-gnome/recipes-gnome/gedit/{gedit_42.0.bb =3D> gedit_42.1.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-gnome/recipes-gnome/gedit/{gedit_42.0.bb =3D> gedit_42.1.bb}=
 (91%)
>
> diff --git a/meta-gnome/recipes-gnome/gedit/gedit_42.0.bb b/meta-gnome/re=
cipes-gnome/gedit/gedit_42.1.bb
> similarity index 91%
> rename from meta-gnome/recipes-gnome/gedit/gedit_42.0.bb
> rename to meta-gnome/recipes-gnome/gedit/gedit_42.1.bb
> index 5bb5525d53..e2bbf1889f 100644
> --- a/meta-gnome/recipes-gnome/gedit/gedit_42.0.bb
> +++ b/meta-gnome/recipes-gnome/gedit/gedit_42.1.bb
> @@ -21,7 +21,7 @@ inherit gnomebase gsettings itstool gnome-help gobject-=
introspection gtk-doc val
>  def gnome_verdir(v):
>      return oe.utils.trim_version(v, 1)
>
> -SRC_URI[archive.sha256sum] =3D "a87991f42961eb4f6abcdbaabb784760c23aeaee=
fae6363d3e21a61e9c458437"
> +SRC_URI[archive.sha256sum] =3D "7f1fd43df5110d4c37de6541993f41f0fbc3efc7=
90900e92053479ba069920e9"
>
>  # gobject-introspection is mandatory and cannot be configured
>  # x11 is needed for tepl and gtksourceview4
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#119804): https://lists.openembedded.org/g/openembedde=
d-devel/message/119804
> Mute This Topic: https://lists.openembedded.org/mt/115410718/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

