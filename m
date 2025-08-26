Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E32C5C8303F
	for <webhook@archiver.kernel.org>; Tue, 26 Aug 2025 02:50:52 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.web10.55811.1756176644536112654
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Aug 2025 19:50:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fi34U+cx;
 spf=pass (domain: gmail.com, ip: 209.85.128.174, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-71d60504db9so38383577b3.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 25 Aug 2025 19:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756176644; x=1756781444; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1baQsC2XriNkkEcTTtSwmr0ToYevaeheCDpAXnWCO/8=;
        b=fi34U+cxxTOR+lrWOOG4d8L7rj0Qph4SQ/V7wWiEhA12eLg1hDcSzpddhZdyVUXA9p
         /12gRGmTnog7bnOPSW6N67V5FLVMuPRTBlqX2dyYxhrF08bJmlbUx5Peg3rEDWIOJKht
         hIPwwnU+yReBIILGbCi1hKzfpUWKHXpMSq/B3+YixHz52I/5HkxlXQmOlzqUknJeIrWm
         IB9o6hVRC5U/Sl9qe+/jQypjbWwRbmmPF+t91B6KYYBng02VHv5t219mbb06NOpK47eq
         1pisDCdHFtH5VGq717jxBM0b02/0jLa7qGVCFnDbYUFkljEh3rstfi04Rv/MHNPIGCCZ
         2Ytg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756176644; x=1756781444;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1baQsC2XriNkkEcTTtSwmr0ToYevaeheCDpAXnWCO/8=;
        b=bEXoTYqhVcPDM3C9pwPsdGrOtet01Xwhq0iJYfG/5coZDI5I9wQYxuYgOQyfYyuXy6
         t/zHbB1YPurAhjq9K9aYBeVnePtaoM+bEKt9s8KWqIBe/E0D9hsTIzBN44ms0gmw2STw
         9XmIB7NRexfkFHqhCK0oC/LFPoJAjRIZBg2h3hd3yuQ5sjXwI5XLGaGpiPwx0WlBncJB
         8j6VRCTxhF5CgQBVM6Dq729QRw9W2i3CohOTAcqd+CMR5WAuC9Nn36gQVytfAh92/vlq
         juK7c6sOlnuhVlV0rpOynkJTQyqj9ln9dDZdNVYa7cLG+kCz7Y3+4Ja+cpvFcLUJI6xK
         +TrA==
X-Gm-Message-State: AOJu0YwUxhkxBjDNJ1w6kk6u6idchoMIvVHTxCZ8g9fgkp+v0aT0BDkw
	7ZKKnzFkYS39MJqQ7XnqxvlA3UFe+C1p1B40Mova7QK4zNjhGFAC/XAF2+Mbuwoq+2/QKy6/Egu
	WputUAf86Z9s7qyKFPDpcFl15y9LCLkneSwb5
X-Gm-Gg: ASbGncvHlDqr3vP7QAGLXzextEWWKK6/lEHx4MrJMXDhDr7H5kdLUuaX8nCWP3TOJTx
	gEIj8POW2D7PJw6Z7G0kLuKwRVbA+30h4akvIYp4qNGpUAJh0KWYorOzJ2VQVyB56XH6WprzgMw
	sA9EEj+xVAdp5TKXYAKBUt6H77x9lQZ0AuSHoUCE5Bg5iM+9sh555M3+UW+zFd2D8GvS7PI7Ezm
	2H312F3gH5OWxd/HZMshd5uFz7E0k4Fyi4noyXLhfsyoT2BqCcMfFzKtdyzDFIAfhguSW+fJXIa
	jIoPz10ZFUBAQi5omUFI4FtHk3Rg2REjIA==
X-Google-Smtp-Source: AGHT+IErvuoIZGkOzjl6Kd7w7llepxhNYO49zTOM24yAGNZqnllXJ21pgyzO+kJ/hW62T/uUBGzDoIxlHBbRsHsRvy0=
X-Received: by 2002:a05:690c:67c9:b0:71f:ff0c:c970 with SMTP id
 00721157ae682-71fff0ce534mr94746937b3.24.1756176643559; Mon, 25 Aug 2025
 19:50:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250825074801.2953407-1-jiaying.song.cn@windriver.com>
In-Reply-To: <20250825074801.2953407-1-jiaying.song.cn@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 25 Aug 2025 19:50:17 -0700
X-Gm-Features: Ac12FXwX1Bt7AdOKKanGDE0QATy-jrI_zF2G8RQ0q7PTvAuMDzP89T-mxQp_awc
Message-ID: <CAMKF1srFkRLbqQKvLpZj1Uf3n+nYPBLaGmfKEsYw=Fbsyk+xmg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] softhsm: switch source to GitHub repository
To: Jiaying.Song.CN@windriver.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Aug 2025 02:50:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119105

On Mon, Aug 25, 2025 at 12:48=E2=80=AFAM Song, Jiaying (CN) via
lists.openembedded.org
<Jiaying.Song.CN=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Jiaying Song <jiaying.song.cn@windriver.com>
>
> The original source URL is unavailable, so it has been replaced with the
> official GitHub repository.
>
> Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
> ---
>  meta-oe/recipes-security/softhsm/softhsm_2.6.1.bb | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/meta-oe/recipes-security/softhsm/softhsm_2.6.1.bb b/meta-oe/=
recipes-security/softhsm/softhsm_2.6.1.bb
> index 66f0488792..11a05b8283 100644
> --- a/meta-oe/recipes-security/softhsm/softhsm_2.6.1.bb
> +++ b/meta-oe/recipes-security/softhsm/softhsm_2.6.1.bb
> @@ -5,11 +5,12 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Def3f77a3507c=
3d91e75b9f2bdaee4210"
>
>  DEPENDS =3D "sqlite3"
>
> -SRC_URI =3D "https://dist.opendnssec.org/source/softhsm-2.6.1.tar.gz \
> +SRC_URI =3D "git://github.com/softhsm/SoftHSMv2.git;protocol=3Dhttps;bra=
nch=3Ddevelop \

Also add tag=3D${PV} to src_uri

>             file://0001-avoid-unnecessary-check-for-sqlite3-binary.patch =
\
>             file://0002-Prevent-accessing-of-global-c-objects-once-they-a=
re-.patch \
>  "
> -SRC_URI[sha256sum] =3D "61249473054bcd1811519ef9a989a880a7bdcc36d317c9c2=
5457fc614df475f2"
> +SRCREV =3D "7f99bedae002f0dd04ceeb8d86d59fc4a68a69a0"
> +S =3D "${WORKDIR}/git"

setting S is not needed anymore in master.

>
>  inherit autotools pkgconfig siteinfo
>
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#119094): https://lists.openembedded.org/g/openembedde=
d-devel/message/119094
> Mute This Topic: https://lists.openembedded.org/mt/114878036/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

