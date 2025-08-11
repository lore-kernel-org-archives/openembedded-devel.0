Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2453BCA0ED1
	for <webhook@archiver.kernel.org>; Mon, 11 Aug 2025 23:45:40 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.web10.62563.1754955934735338371
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Aug 2025 16:45:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NyKow+Vv;
 spf=pass (domain: gmail.com, ip: 209.85.128.179, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-718409593b9so50759737b3.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 11 Aug 2025 16:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754955934; x=1755560734; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2o9UUNBCZHEHGAqjba1sF66skHCwPcCBXBkc8CMr1iQ=;
        b=NyKow+VvZmksCXBh1+eGf9cwerZNR9OXaP1ONnXK1pN0KatWfNaRFWCtw/uZDOkxV0
         B+87bV0DfsL0kWjbWEEGnaHKstsfPbdUvWG1KMlqR7byWq6YfZpqB4lBPR4Zz/qFnPeg
         sdW4t+YHbHlD4ZcIRPlfKM5Alu9JP7kBU++oexNlOoSKoYgGUnDjbiR37FPSBmlMY25N
         2h7QsNVwL97rLIdl8CBlTSa9nRVq+Gt9WC+kTwVl0lsdYPsM8mKG1vWN2XPtS2W9Wawq
         r9/UFpm26/wriOBe63jDemDa+mR01EqHtBILk4i4in+jeXnyat+6tr5+8VlWGDvfsJo/
         2WvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754955934; x=1755560734;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2o9UUNBCZHEHGAqjba1sF66skHCwPcCBXBkc8CMr1iQ=;
        b=Y0TvoLzPjLsMJekDlRt0Fle8Q3A8/+tXDZo9JWM2P7zELyzps5qjTc6vF6o9MPeRzn
         rJhPhY+0BM8t19SFVCC7rglukjGW7l5Q5B57rbZ14GQR8tvUtOKk8k3e80USSvOTSuZe
         xFjeo7LMNoyhL49NKuE8LmxA6jWSjdZVuDQrKYyVHtnvclN3Bm4Cq+HEhWfJzJAVOuwG
         eNpWg/HLVdBdy9J2MUups5CBKFfAYqJ5lTmyJPApvWODxtKIUWhlb9OzKnsqElJeWqFo
         8iKR15sfrI7A3+UbVryHRrAI4Lv19y6JnQ8Ax14xadcR8mD5VRLPgODZGCW56Vdurglr
         uzUw==
X-Gm-Message-State: AOJu0Yw6P5Aouir6Hh1XX5sv5ZePHAjKa5xCXiPT1wE3COCCsIH/18v3
	ajsElEiw0VsVhuepF9XCvOZhDOk6NEs6wNAD4GjXQZ3kIAKEXzbxj2JNVt25w69p7C4GID6f//N
	hvQxHsfKiMQ66R3Cp8rNl2dsHBf7WgOo=
X-Gm-Gg: ASbGncuI4/tn15DYWkW87BqZHf+/koAPmJa8UW732dowj1Ofme71SUjpJjPwEvvgAkG
	XItOJppz1l0YqcxlsjV988hilaAUzaE3YUYANjA14x7XHYYBc7QaZDP8062UQniUtxak1KZlV1x
	GJjh/t55aGfFU7Nibbek5nryDuZmki9WRztQ0UWz1ynqhPopAVsUU82jNdzZ8NsdV5ZlpqTGB79
	mCGLks=
X-Google-Smtp-Source: AGHT+IF/hxwyXRsmApU8iXPEXdjw08plAjvXqHblhtiZ7lrabq5zLLtB1Bw8rw9i1pbBdI+l1Hvosxhi9rY+yOWLNVI=
X-Received: by 2002:a05:690c:2609:b0:71b:f6b4:da91 with SMTP id
 00721157ae682-71c42a4421dmr22390887b3.24.1754955933727; Mon, 11 Aug 2025
 16:45:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250811162325.201977-1-costamagnagianfranco@yahoo.it>
In-Reply-To: <20250811162325.201977-1-costamagnagianfranco@yahoo.it>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 11 Aug 2025 16:45:07 -0700
X-Gm-Features: Ac12FXyvB1qAx_q1YoBUAJPINpQ9_R8QqXGzKVOcfpHdGkOVo15SjuPZ-N2Uuo4
Message-ID: <CAMKF1sqoSOW-YVsoW0Pz6=p-jqZrfPu=nndr=bjt3zh=UovwBA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] mosquitto: bump to 2.0.22
To: costamagna.gianfranco@gmail.com
Cc: openembedded-devel@lists.openembedded.org, 
	Gianfranco Costamagna <locutusofborg@debian.org>, 
	Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Aug 2025 23:45:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118911

fails patching - https://errors.yoctoproject.org/Errors/Details/877233/

On Mon, Aug 11, 2025 at 9:23=E2=80=AFAM Gianfranco via lists.openembedded.o=
rg
<costamagna.gianfranco=3Dgmail.com@lists.openembedded.org> wrote:
>
> From: Gianfranco Costamagna <locutusofborg@debian.org>
>
> Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
> Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
> ---
>  .../mosquitto/{mosquitto_2.0.21.bb =3D> mosquitto_2.0.22.bb}      | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-networking/recipes-connectivity/mosquitto/{mosquitto_2.0.21.=
bb =3D> mosquitto_2.0.22.bb} (97%)
>
> diff --git a/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0=
.21.bb b/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.22.bb
> similarity index 97%
> rename from meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.=
21.bb
> rename to meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.22=
.bb
> index dcbcbadd59..ae28093e19 100644
> --- a/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.21.bb
> +++ b/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.22.bb
> @@ -20,7 +20,7 @@ SRC_URI =3D "http://mosquitto.org/files/source/mosquitt=
o-${PV}.tar.gz \
>             file://3238.patch \
>  "
>
> -SRC_URI[sha256sum] =3D "7ad5e84caeb8d2bb6ed0c04614b2a7042def961af82d87f6=
88ba33db857b899d"
> +SRC_URI[sha256sum] =3D "2f752589ef7db40260b633fbdb536e9a04b446a315138d64=
a7ff3c14e2de6b68"
>
>  inherit systemd update-rc.d useradd cmake pkgconfig
>
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#118910): https://lists.openembedded.org/g/openembedde=
d-devel/message/118910
> Mute This Topic: https://lists.openembedded.org/mt/114650544/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

