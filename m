Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EAAAD0D7BB
	for <webhook@archiver.kernel.org>; Fri, 11 Oct 2024 15:15:41 +0000 (UTC)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
 by mx.groups.io with SMTP id smtpd.web11.14416.1728659731682025674
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Oct 2024 08:15:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Yjs6Lovx;
 spf=pass (domain: gmail.com, ip: 209.85.160.49, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-2884e7fadb8so1118468fac.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 11 Oct 2024 08:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728659731; x=1729264531; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZUC7Y1GHi2NeKpNm4X8afDUoAx5oS/InGbcVrbSiRBM=;
        b=Yjs6LovxdbCO9Cke361/1YQfmK+/urcZUbKjRlvJEePhRfY0jT9drRfwos9RgkrzGJ
         QQMAIu/kKAplO9KjunbdXHj6Io7PO95aNAIKbCCbYGhPDpbIEEUkiZOOx6BhtBiE4zJe
         +9VCLNX793ETtoA+Vb0gduXJrwZW/pIbbbJUhPPV1EJ5MknBB7t98mRiWJE/wcodmi59
         7LI3VzEDvzd4XlEObaHgmbp9PBVaZ/Dc0bG17jjTr74PWnpbw3GjYyl6vyKvbdQ1jPwe
         +b96xqf1qT5JRc/lW4QUp2KlLr/GIrDQ8NYLkvQERvaOstWTDSAaCN9bQZQ4eHUgst4Y
         lA5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728659731; x=1729264531;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZUC7Y1GHi2NeKpNm4X8afDUoAx5oS/InGbcVrbSiRBM=;
        b=mBRoDoFskl0K0HS3HSBZeH8QyL8aAkR+ZokqgqortHS6w9t/hQJmgr5ZDO7wOdNFEH
         IrHXtCLIuntMzAfTZWo6a8Y6gkLKsiz1Oeuy9ZoZ00h4+rJUijFuKe2tfXjstb1l6RQm
         PfMmFd+9Geu0/PbNc4oStKJhuDl8kkA/U1VbMhwaXbbV7Z8prrIvkGTRYz5KG//aUKUv
         VKWsfkW8MFf1heKATASf9VCnvjyxOQlIVg+bZERWgKoodoM4JwlSUtw7bV5+E7WIlwAR
         eyBUgErAMRbt5KltffNFHLthPqQq15abbtKV8GFIVm74Vg3VVLwkzyha+5rVsDQhtPIn
         NqZQ==
X-Gm-Message-State: AOJu0YxtI4M0rJfXMRNBD4bXA/0CxQv7Vag+d1m4vbcmUZtNSzEOxgu/
	1Zlr9L2vGMq+DJewTp3MpVJFO//KWMPce837j9RMbdlCFb7sIryG7NxWracUpI2srJoTPv/Dm35
	tZKKVACXg+CiKO8LnWe20YPDsY/HZERxi
X-Google-Smtp-Source: AGHT+IHSDFikmpam9yHDU4zrfOr8/7F2LwbB78UzHN/oHbAJPE8elhSZAVM1lrDxaTuyW+NhlX+9oy/CLsEaYGQFB0Y=
X-Received: by 2002:a05:6871:b22:b0:254:affe:5a05 with SMTP id
 586e51a60fabf-2886de5dd87mr2069579fac.21.1728659730890; Fri, 11 Oct 2024
 08:15:30 -0700 (PDT)
MIME-Version: 1.0
References: <20241011151023.1516957-1-yoann.congal@smile.fr>
In-Reply-To: <20241011151023.1516957-1-yoann.congal@smile.fr>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 11 Oct 2024 08:15:05 -0700
Message-ID: <CAMKF1sosOO0BEOewee+wJBazF9LMKmXXVypA6tJ77PV97gQsYg@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCH] gimp: fix buildpaths QA error by
 removing gimptool
To: yoann.congal@smile.fr
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Oct 2024 15:15:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112808

On Fri, Oct 11, 2024 at 8:10=E2=80=AFAM Yoann Congal via
lists.openembedded.org <yoann.congal=3Dsmile.fr@lists.openembedded.org>
wrote:
>
> From: Yoann Congal <yoann.congal@smile.fr>
>
> gimptool can be used in GIMP plugin compilation. It would make more
> sense as a native tool. It also contains the sysroot path which break
> build with buildpaths QA error. Remove it from target packages.
>
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> ---
>  meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb b/meta-gnome/re=
cipes-gimp/gimp/gimp_2.10.38.bb
> index a17e03b103..8755af94a9 100644
> --- a/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb
> +++ b/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb
> @@ -70,6 +70,13 @@ do_compile:prepend() {
>      export GEGL_PATH=3D`find ${STAGING_LIBDIR_NATIVE} -maxdepth 1 -name =
'gegl-*'`
>  }
>
> +do_install:append:class-target() {
> +    # gimptool can be used in GIMP plugin compilation. It would make mor=
e sense
> +    # as a native tool. It also contains the sysroot path which break bu=
ild
> +    # with buildpaths QA error. Remove it from target packages.
> +    rm ${D}/${bindir}/gimptool-2.0
> +}

it does mean we can't build plugins in a usecase where an on-device
SDK is being used, even though it is a rare usecase.
Can we explore a way to omit the sysroot from being emitted into the
target version of gimptool ?

> +
>  FILES:${PN}  +=3D "${datadir}/metainfo"
>
>  RDEPENDS:${PN} +=3D "mypaint-brushes-1.0"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#112807): https://lists.openembedded.org/g/openembedde=
d-devel/message/112807
> Mute This Topic: https://lists.openembedded.org/mt/108950447/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

