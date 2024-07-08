Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 088C5C3DA42
	for <webhook@archiver.kernel.org>; Mon,  8 Jul 2024 15:34:09 +0000 (UTC)
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
 by mx.groups.io with SMTP id smtpd.web10.82925.1720452847651432560
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Jul 2024 08:34:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mOemv+SE;
 spf=pass (domain: gmail.com, ip: 209.85.161.47, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-5c6775ea6a3so684653eaf.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 08 Jul 2024 08:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720452847; x=1721057647; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ve54W+tjUQgrLHF4IQpKCZyKT8KWBG20oWMoZ/xxcM=;
        b=mOemv+SEC1m892AZQ12oUfJzVhxH7s1qqJRXh1B/r+RDXaBIxk6RDJKXBwrUG3RkWI
         q9pNggS9hf6yQiVIZcNFqQtPe8bsBjaA+rp5NIxt/2lk9k44/gZwZFb7UsMV9BOZOIL1
         qI/snHQQA3RZhtCsRtb8CR3H/zEPYj63jPPkSo+hvfIGTONYoPaZop+NKtJjluzAnc7p
         JF2K701wnwfBaK9Rg044eQoosrNpvQXvs6XWdzm/Z5jVTWL+rg1uuCM464jlKbJKKbzM
         sZSHuplFlJeUnitMvpGIj39FLN2G2FGfA/beiO77Ax6c/Qi3yLDGzpDnrGfbHAoH7XCs
         WiDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720452847; x=1721057647;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/ve54W+tjUQgrLHF4IQpKCZyKT8KWBG20oWMoZ/xxcM=;
        b=E48l/FJ9s4EybfhEEmBqOekaE8lflmSf8+GJIQTGQagUEgubvEBLe9aZkdBDgQA9qr
         +wjfh2LV0XAZYkhRqdXujg2ha5wRuySVpfeB+idfrF+HrUdWgasu4g512RWKWugj1ekI
         yVHbnzbjwvHWDL43XdZwKya2wryKCADVvbSmTlH/eTEbh8x1orJ2ITXUNmt/ibT0fQVU
         +7emTJWUp0SwSwoZK/G7oC2UpB14BoEMHAVjagPmUo7IFd12vnUxGDog5ynONcFhFTNl
         ZodjWCzF/3ivz4JX1XLU2WfIMuKq+MaRjD73mWvw+t62Atkcn/s1zRIzj375a3L6zSk/
         nGKw==
X-Gm-Message-State: AOJu0Yzsed/LSe6lxU5PuvNcrKU82gGq7YaV+ePxIhAQHeNs+VkT+sMf
	zUiFvuD8ARchl7xp9qg7uatPpUHOtfvs0iXQpZWgQhLZ+9iKx/0r/q3GnCSK1WvmfiwxE74KBzo
	WGBwwBSWsRZdsyzd6kc8lJsGN3a4=
X-Google-Smtp-Source: AGHT+IEmV9U2rzMQUuuxVlLj/TIj8aNgvzbAaYiPL829dRw9krBBBCbOwZSgY29JxPYNHJJx3SE2DWAHNbwtBwiJygs=
X-Received: by 2002:a05:6870:a119:b0:259:8cb3:db2e with SMTP id
 586e51a60fabf-25e2bea68b9mr11416782fac.39.1720452846748; Mon, 08 Jul 2024
 08:34:06 -0700 (PDT)
MIME-Version: 1.0
References: <CAMKF1sqg2o8ZRVQyUa6k7sbAN+Cbp5yniEgadPg4WaOnMhKqEQ@mail.gmail.com>
 <20240708093731.5742-1-alba@thehoodiefirm.com>
In-Reply-To: <20240708093731.5742-1-alba@thehoodiefirm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 8 Jul 2024 08:33:39 -0700
Message-ID: <CAMKF1srD0K+BZ20ZmVrfK6bOrJaqvLf5zTjmbkoP1o0qdgc3Rw@mail.gmail.com>
Subject: Re: [oe] [PATCH v2] yelp: fix unterminated string
To: alba@thehoodiefirm.com
Cc: openembedded-devel@lists.openembedded.org, engineering@neighbourhood.ie
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Jul 2024 15:34:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111267

This patch is marked as v2, which is right subject for sending an
updated version to v1, however, the content of
that patch is just the delta on top of v1,  whenever sending next
version, send the whole series and patches which are reworked
should have the new and old change squashed and sent, so we can
maintain a clean history.

On Mon, Jul 8, 2024 at 3:27=E2=80=AFAM Alba Herrer=C3=ADas via
lists.openembedded.org <alba=3Dthehoodiefirm.com@lists.openembedded.org>
wrote:
>
> Signed-off-by: Alba Herrerias <alba@thehoodiefirm.com>
> ---
>  meta-gnome/recipes-gnome/yelp/yelp_42.2.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-gnome/recipes-gnome/yelp/yelp_42.2.bb b/meta-gnome/reci=
pes-gnome/yelp/yelp_42.2.bb
> index 69c421662..14986f265 100644
> --- a/meta-gnome/recipes-gnome/yelp/yelp_42.2.bb
> +++ b/meta-gnome/recipes-gnome/yelp/yelp_42.2.bb
> @@ -40,4 +40,4 @@ FILES:${PN} +=3D " \
>
>  RDEPENDS:${PN} +=3D "yelp-xsl"
>
> -CVE_STATUS[CVE-2008-3533] =3D "cpe-incorrect: The current version (42.2)=
 is not affected. Fixed in 2.24.
> +CVE_STATUS[CVE-2008-3533] =3D "cpe-incorrect: The current version (42.2)=
 is not affected. Fixed in 2.24."
> --
> 2.40.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#111262): https://lists.openembedded.org/g/openembedde=
d-devel/message/111262
> Mute This Topic: https://lists.openembedded.org/mt/107100010/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

