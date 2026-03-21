Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81F421075269
	for <webhook@archiver.kernel.org>; Sat, 21 Mar 2026 02:25:34 +0000 (UTC)
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4667.1774059926220581521
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Mar 2026 19:25:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fAe8Vhdb;
 spf=pass (domain: gmail.com, ip: 209.85.161.49, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-67c20ed3076so1038579eaf.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 20 Mar 2026 19:25:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774059925; cv=none;
        d=google.com; s=arc-20240605;
        b=SbFIu+6ff2mtu9BtgNkeCyKI53zYKxdPSmjFUQ6tvbopPKndz/g8HrehJQz8UCV++f
         qPnqLTvpLwnQR403//XpLTS7+JARHk8OcmqcmI+0LFkMRY0NjAnCFpjLb/vHGVtv2Jf9
         V83p44AakPFUdR4gnR6cEmGttew2UZMKnWdhF646vBbKcoAOYqMKXb5fWzLvvPWwnhNS
         sJh/sHPVrNdb3R83aUkvKgVawGDvOlDBSBJ/EFfWgzNMHSoXFug/G7L4rowGVqWYZ1+J
         gDWuPouxZoq2yW/+j9g3FULA3jZHQq/Sz3gnVyTukYk/5fvzauDoBkgZyvD7TJDoersi
         RyVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fuAhW+5x1zHmCdWVGHdNNtdKxqRKk0XMdsAB7+Y64YY=;
        fh=sa2ng0Zpy+5Z8mTrnPO7JLs9/01I0WOh2WbwiwCGXy0=;
        b=QOAcXPDaOpEr0aO8hxjJ+iMwkzvhFXmZn4MNPuJ0oEset4KGUQfhoiD0jcVcp/CFV3
         RndC3fYcsMJ5OtGS5HWIY3yEhb1dLGMWpY+qfvlvMNJvnJD8FdLJDlttkV8UApYwXiX+
         fpa1iZ7Qs70tG6JvL5ItLlF0w1JEYczgenw6cOijPi1JxBQi6+16F9Yf2/IDRqAKkX5N
         1mLFVz+pasyxvkVzGmBkcWQ0JuKanP8hpRch5TEutFtfFKuR6r5cUVTOx3I0VLaY00pq
         uizTOMKRXaK02LLvsm88QA1TkC5JEcKx14qNUIuduUvryJi6Utu363Zgucc0FE5QUBUo
         jjaQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774059925; x=1774664725; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fuAhW+5x1zHmCdWVGHdNNtdKxqRKk0XMdsAB7+Y64YY=;
        b=fAe8VhdbMwo+bQNiGuWdx4Tk7V9wDFAKq8AFmB6h2KGm0Wub4PZ2Lz1FvsWIgpoyAq
         fMNZmrS4tmy7ioU5QA20IOhTKsrxG/EeRa5fCyoBNldija7MEEfcwWOoQW9pMerqUBDM
         gSDv9GmJycafsv5UEhpdJPoCcPVDPkywyQPhfABpLzww6nONzRjeqZTERCIo4aoV4Fbl
         MBNbrIuWnMLqYR8Wp7h8MWkcnmurdFIE5i9fSy9dT335g/PtxpdXmngTt5272A//Ncri
         t6DBPfGsNRhFBUMr0CvQgQ6mal6DimRxvL/4JbvSmxqkkFSzMo7hvgFwzd3BIRl1vNps
         Vkug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774059925; x=1774664725;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fuAhW+5x1zHmCdWVGHdNNtdKxqRKk0XMdsAB7+Y64YY=;
        b=pnNgDpl3xGmGbxM89ihZ/tLLtc7mdJsIzqyuFoi0sa3BwbhO7lFgbUNK7pDvEidg3Z
         9SLl9+8ni1BJ566+34jUa6Lihevyn4u2djpBZHrNjehL9IdCPY4nRJC2G3K9FYrfomHd
         MKZKSZJfwTqT1egCbBRB7jEFx3EFfhH3carQp2bBReeqJQzKaJjIyLj+Sw4zwclXPSqc
         DuPL68RsLAXcdsHmE8nbO2UKhEMiSJWwxez+EaeW5puP2oKsruS4VRqKCuw12dGtDSK7
         3BQ0iPGjJe1A71aNsWd5gBa6J08OHQAuFCHWvMPIKrP2GjstPaSLkNJiRderL7ED1MPq
         zxzA==
X-Gm-Message-State: AOJu0YyGH4j7zGgmFTZ3YaG+0VJA08LzX02zlalbukk5uX7+gx+PzWQK
	DhCVVRu0PgAu9+MBgRqxu4PdmvV1+7Ben83WG1kkLgAbHbtEZpQVyfL6hFOukVwU/bjqYBMesSQ
	8Bnvuenye6V4fuHIhEF4Bhkbl8Jufb7tbpkxs
X-Gm-Gg: ATEYQzxXkWsOA3Whd/olfieXCt2g76cGh5ZskTEKXW2OChdv75DcXcoDFzxL21hH/le
	2FtIi7v3aj3u90mEWuhPDAbPSSEVUYvf+n0TG7AzMTR4cRYXTrS9uGlM4nF0z20ph4zTpgGTQln
	ueKYvvsn8sb50NF8fV+IrqoiHJSSwKls2BAH7RJ0Yz6Wc7VQsfXUGi8tq9U+fSPgAuDzt/qYaeq
	KdRygvpz3dkZQWssHjRz737hoHPXaXeDTfadjll4Xxuz3u04Wwf+PYJDPiusoRIZrI9kkv2Q20H
	yCf3OtLN
X-Received: by 2002:a05:6820:8185:b0:67b:f3ea:be4b with SMTP id
 006d021491bc7-67c22ed1580mr4204722eaf.27.1774059925436; Fri, 20 Mar 2026
 19:25:25 -0700 (PDT)
MIME-Version: 1.0
References: <20260320170155.1413929-1-khem.raj@oss.qualcomm.com> <20260320170155.1413929-3-khem.raj@oss.qualcomm.com>
In-Reply-To: <20260320170155.1413929-3-khem.raj@oss.qualcomm.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Sat, 21 Mar 2026 15:25:14 +1300
X-Gm-Features: AaiRm52HTLeTf1cJYuu9z8qQEPOuSzYE-2ZVl0jSKwJx0GwaKGZkx17NXMQV5gs
Message-ID: <CADySD0GV1w1G8D3QuedQw-Yyjwzwxmgues4rv15rc6wOmbWu_A@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCH 3/8] tepl: Upgrade to 6.14.0
To: raj.khem@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 21 Mar 2026 02:25:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125456

On Sat, Mar 21, 2026 at 6:02=E2=80=AFAM Khem Raj via lists.openembedded.org
<raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
>
> From: Khem Raj <raj.khem@gmail.com>
>
> Add missing dependencies
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../recipes-gnome/tepl/{tepl_6.8.0.bb =3D> tepl_6.14.0.bb}   | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>  rename meta-gnome/recipes-gnome/tepl/{tepl_6.8.0.bb =3D> tepl_6.14.0.bb}=
 (80%)
>
> diff --git a/meta-gnome/recipes-gnome/tepl/tepl_6.8.0.bb b/meta-gnome/rec=
ipes-gnome/tepl/tepl_6.14.0.bb
> similarity index 80%
> rename from meta-gnome/recipes-gnome/tepl/tepl_6.8.0.bb
> rename to meta-gnome/recipes-gnome/tepl/tepl_6.14.0.bb
> index f4d027ebf7..b6ba7e1a2a 100644
> --- a/meta-gnome/recipes-gnome/tepl/tepl_6.8.0.bb
> +++ b/meta-gnome/recipes-gnome/tepl/tepl_6.14.0.bb
> @@ -7,7 +7,9 @@ DEPENDS =3D " \
>      glib-2.0 \
>      gtk+3 \
>      libgedit-amtk \
> +    libgedit-gfls \
>      libgedit-gtksourceview \
> +    libhandy \
>      libxml2 \
>      uchardet \
>      gtk-doc-native \
> @@ -20,9 +22,8 @@ inherit meson gobject-introspection gettext features_ch=
eck pkgconfig
>
>
>  ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
> -SRC_URI =3D "git://gitlab.gnome.org/swilmet/tepl;protocol=3Dhttps;branch=
=3Dmain"
> -SRCREV =3D "16ab2567257a053bd957699f89080fafd0999035"
> -
> +SRC_URI =3D "git://gitlab.gnome.org/World/gedit/libgedit-tepl.git;protoc=
ol=3Dhttps;branch=3Dmain"

can please also include tag=3D${PV} in the SRC_URI

> +SRCREV =3D "d60f7ded17b52ea42091c073ea81090e91f38620"
>  # gobject-introspection is mandatory and cannot be configured
>  REQUIRED_DISTRO_FEATURES +=3D "gobject-introspection-data"
>  GIR_MESON_OPTION =3D ""
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#125443): https://lists.openembedded.org/g/openembedde=
d-devel/message/125443
> Mute This Topic: https://lists.openembedded.org/mt/118421460/3619737
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nkur.tyagi85@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

