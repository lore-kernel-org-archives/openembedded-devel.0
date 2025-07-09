Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4848C83F09
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 06:43:22 +0000 (UTC)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
 by mx.groups.io with SMTP id smtpd.web11.9195.1752043398552634644
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Jul 2025 23:43:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=S3oi8SHQ;
 spf=pass (domain: gmail.com, ip: 209.85.219.172, mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e812c817de0so4058627276.0;
        Tue, 08 Jul 2025 23:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752043397; x=1752648197; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5exxlS9M6P9ffuh8wGyNCKR0h0wk4dU5xxv1aqQ4/kE=;
        b=S3oi8SHQbU5rC1+Za2QEMK7sUIlbMreGGtk57RSjG+DOm04cyqTH3KOZ2suHHMhmGf
         5aISUc9Zc0TllCyDUb0wzd8Non9l4Zdl5FZR2wIMK/4J3aXSc3Xg/aTc588ZnBCEafMq
         47oy0tSweWNeapeCP50anBygPPReb4GxJDcOF6VM5KOvViDjN24huffn9Z9pFD2TfhDp
         3lzgScoj1DMh412p8aMLg16z5u/q4kHC2eDp2TxonkJ4BoCoc5Pcbs9+jwNXrp4wEx0i
         7lP3y9/sAi8a77Ho7UlmaFmUOQm2sqFVX7cNpGz281GlE6ADPCWm54s+xQ+NsMqdoV19
         Uj7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752043397; x=1752648197;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5exxlS9M6P9ffuh8wGyNCKR0h0wk4dU5xxv1aqQ4/kE=;
        b=lMsBDfhmoagf/GZuRLP49b03b0pZQbsY8olweRpfU4ZtigSs6idXtJCeBuooudQfgP
         dT5ujvf42PqrMnuExH7el4GDPzyOx5uhaTEo4B8xeJbfFJzNQlznJR2ICSWY7Yw6wHnP
         8wNgWwPk4Sv75OuO5sWmwWfsZDZxkubZzpLqsJHh96hFeVSWQ04OJcII+LH8WMfzWOMG
         txFs54y6ofAf6SZ4I0xz1EHN94mvjAQtZG0MlCvBCxKnnptGAIq6K79Rv+q+S9tUaog/
         q8opj3wwBVE/rNtDrL4lF9Co/j8NGfqwhJtvJZJRKBji2N2bghobpjDMeJVLuXmjSI7G
         rgog==
X-Forwarded-Encrypted: i=1; AJvYcCWQCmfqS5vpSqtoNuM5K2iwyajCwsA5bu/LFpbqpg5v+rNt78/DFm74W17tliDfoP/DX2x8+U1lTSZadVggUtqIT0YJ@lists.openembedded.org, AJvYcCWSB9sYnRJlQQdTxUkWN6906LwAHzr0d3fh/vmg+Do0kR8fCRYL6Rytz8cAwMFuD/UIa5HCXDxyjwmCMV3ov7yEQKI=@lists.openembedded.org
X-Gm-Message-State: AOJu0YzrrRef7pxWg6X2fTJVkzM6Hbt4OmPvv7l4c0WIV3B3hDZvMguk
	5rKFsH7uUobPUx4wlRKWrSBB4i1sIcpFBt+uSf5AKk1qGrec/DJnesTL2OBUHctTTj8WO0Bnxia
	+jcf5gutHDF2l93MgA5rTr2daxFhfDBbL68YE
X-Gm-Gg: ASbGnct4Fg8FmaWo1A9PO+v7jNFA9MvwEutP+p04G3N4YMlsC9939Du3W9RwsfAKy2j
	QC38R8k9OZewYRop5Ya1hS3TZLFS9A2RWckM3x5JFypTH0lC1lI937mBSxzbzM4BEdGkgEBLzd1
	a0KvBER/kNBHBYEcZ51C8entanMc1Q4ZQjtxEmeoo4DQ==
X-Google-Smtp-Source: AGHT+IFkDJgdD2UnKSi2vHFOaZWa82R7MPRFConAPCKhgTfovBfhV3l8iDNhrddu41/lgRkcUkvuCHVTs9aOuZJTk4Y=
X-Received: by 2002:a05:690c:3388:b0:712:d946:788e with SMTP id
 00721157ae682-717b169f9bamr22715817b3.14.1752043397433; Tue, 08 Jul 2025
 23:43:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250707090656.1216-1-wangmy@fujitsu.com> <20250707090656.1216-5-wangmy@fujitsu.com>
 <ESC4ZS.OVMPDS5L8SEX1@t-online.de>
In-Reply-To: <ESC4ZS.OVMPDS5L8SEX1@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 8 Jul 2025 23:42:51 -0700
X-Gm-Features: Ac12FXzOMuCW5v2cVNG-8eClcGc5H_Ti8rCdxuebe2HrCwlr5SMK29VBmi4a_hU
Message-ID: <CAMKF1sqHs_eEMrFo4xmeMc+ZPiyc-DByYAb40n-0=pbk6tsS=g@mail.gmail.com>
Subject: Re: [oe] [meta-gnome] [PATCH 05/35] gexiv2: upgrade 0.14.5 -> 0.15.0
To: Markus Volk <f_l_k@t-online.de>
Cc: wangmy@fujitsu.com, openembedded-devel@lists.openembedded.org, 
	"wangmy via lists.openembedded.org" <wangmy=fujitsu.com@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Jul 2025 06:43:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118344

On Tue, Jul 8, 2025 at 11:31=E2=80=AFPM Markus Volk <f_l_k@t-online.de> wro=
te:
>
> This seems to be a developement release and it also breaks localsearch an=
d gegl.
> Eventually its too early for this update

Right, I was seeing these failures too, thanks for root causing it.

>
> On Mon, Jul 7 2025 at 17:06:25 +08:00:00, wangmy via lists.openembedded.o=
rg <wangmy=3Dfujitsu.com@lists.openembedded.org> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com> Signed-off-by: Wang Mingyu <wangmy=
@fujitsu.com> --- .../gexiv2/{gexiv2_0.14.5.bb =3D> gexiv2_0.15.0.bb} | 4 +=
+-- 1 file changed, 2 insertions(+), 2 deletions(-) rename meta-gnome/recip=
es-gnome/gexiv2/{gexiv2_0.14.5.bb =3D> gexiv2_0.15.0.bb} (90%) diff --git a=
/meta-gnome/recipes-gnome/gexiv2/gexiv2_0.14.5.bb b/meta-gnome/recipes-gnom=
e/gexiv2/gexiv2_0.15.0.bb similarity index 90% rename from meta-gnome/recip=
es-gnome/gexiv2/gexiv2_0.14.5.bb rename to meta-gnome/recipes-gnome/gexiv2/=
gexiv2_0.15.0.bb index fadae34608..bfd9749972 100644 --- a/meta-gnome/recip=
es-gnome/gexiv2/gexiv2_0.14.5.bb +++ b/meta-gnome/recipes-gnome/gexiv2/gexi=
v2_0.15.0.bb @@ -6,9 +6,9 @@ DEPENDS =3D "exiv2 python3-pygobject-native" G=
TKDOC_MESON_OPTION =3D "gtk_doc" -inherit gnomebase gobject-introspection g=
tk-doc python3native vala +inherit gnomebase gobject-introspection gtk-doc =
python3native vala gi-docgen -SRC_URI[archive.sha256sum] =3D "0913c53daabab=
1f1ab586afd55bb55370796f2b8abcc6e37640ab7704ad99ce1" +SRC_URI[archive.sha25=
6sum] =3D "045ec4584d32963719e0722929f40f1d19566d4582e1eee4604be97e8c3eb740=
" EXTRA_OEMESON =3D " \ ${@bb.utils.contains('GI_DATA_ENABLED', 'True', '-D=
vapi=3Dtrue', '-Dvapi=3Dfalse', d)} \
> --
> 2.43.0
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D- Links: You receive all mess=
ages sent to this group. View/Reply Online (#118250): https://lists.openemb=
edded.org/g/openembedded-devel/message/118250 Mute This Topic: https://list=
s.openembedded.org/mt/114024723/3618223 Group Owner: openembedded-devel+own=
er@lists.openembedded.org Unsubscribe: https://lists.openembedded.org/g/ope=
nembedded-devel/unsub [f_l_k@t-online.de] -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-=3D-

