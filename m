Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 480F5C5AD49
	for <webhook@archiver.kernel.org>; Mon,  2 Jun 2025 21:12:38 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.web11.6563.1748898750823371433
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Jun 2025 14:12:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ULGCay0t;
 spf=pass (domain: gmail.com, ip: 209.85.128.174, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-70f31433d96so45840097b3.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 02 Jun 2025 14:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748898750; x=1749503550; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1cUxTEHBw72zOIZ7Qg7Tr5f1iBEW7P8wHhwvdEmwLEU=;
        b=ULGCay0t6kWS5fTulacnUO2Av9X0/9qyPnaNIWbIi8hTux8WWuEtXypu1kuguKd0J+
         MQOZLdfE8Qd22E55rOeyZt8Vne62VkMg5aQK5HkuOKUHoaAx8G293/fbGGxevMYvr5a1
         8DC/4lZsQcH+Yf9pWGzA4k15GI+eGMhmD2ydWSy+Cxn1PKlUjveQOfn1Qb4y96anvIZM
         bsZUY1CQjL3q3COs1UVRyl5Ba1XIGUEsvczs7Apph8Ro5isLlak7I8ikbTLqrAJyHNYT
         YGZDiNq4+/Pgi2LRL0MAcmgCmFPQqBVpE9raa2cmZWDIPoYU3YCI8xoIlf3L7l4OvugY
         mV3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748898750; x=1749503550;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1cUxTEHBw72zOIZ7Qg7Tr5f1iBEW7P8wHhwvdEmwLEU=;
        b=IMls1BsKh/KWrMki/NlbAnlJve5ubCMH4QHxnjWmB5R4gbN8coF8DoMJwubB6xbOQt
         pHi50JlgHEuhLasp5B/vPOciPis2dhO2NzXL+XKSVKEX5SEYh6NnF+t/GEbzMXTcyS4F
         yk9uF9S/5IIJUEqJyYbN+DdJKU9DPZjxYv8VFRoCrHTL7QKjVLoQyAzhY2GVeQdgLerE
         SHcttgSbcklP9IHXoBSlLIQiOtDC81vhBwjmjMEqn6eeRS5OW4SJ/77OrfmVvzzV5qNC
         vd1oKajD0ZNyqU69jqfWbu7IerUFMCiA1/J0VkcCnJok8VCySKbZGvLeSpXNiIEKCAXX
         OXYA==
X-Gm-Message-State: AOJu0YyTLlw3iizX33D5Cuj/gqFcNPyzGaSif0/xV4JTQGN5hPhKMhn4
	WGIZJBAf+gPzttlC+Dkf7693ArrAfLB+KnQ+jKDurxS1/bkZNW3D7WsD1K/of+L6HzceyPYXcWb
	WqAXGVmZHWHf+eL+FzUIkP2zZa5CZgoI=
X-Gm-Gg: ASbGncsMD1bFEkBiCnDx2l0LVWrlsd5RCrSOaSvT0f36th6ERlzlqJY7ANIZ0ZbSiBR
	IGEQ16T7L/037Buf9C1N0cTH+VnpKsquTeVLRa4tHWPQNO8BDMbx9aAnjYIDdh9uIWtJu/grGJJ
	74Y6D8dH8txMNkBZQ+QQ91X+fcA1u3WfyDkSM2x5vkPGTTAe+ZeCNiyuxOrhFOPgYb+Q==
X-Google-Smtp-Source: AGHT+IE/RGikyGuJWBiurDel999d2xaCyBH54OUsqhAL9Dd4Gqd1FZbeySJKlJCIwnYUJnteM0iz80Z1g49EIP6REks=
X-Received: by 2002:a05:690c:4d0a:b0:70e:2c7f:2ed4 with SMTP id
 00721157ae682-7104f03f914mr169220757b3.0.1748898749861; Mon, 02 Jun 2025
 14:12:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250602131807.3748115-1-jhaller.oss@gmail.com>
In-Reply-To: <20250602131807.3748115-1-jhaller.oss@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 2 Jun 2025 14:12:03 -0700
X-Gm-Features: AX0GCFsoHg4VqqDsWONm-QAz0NyxZzO4r14gf1rFQ1rv51euduMi2WJ9pZO2KFo
Message-ID: <CAMKF1srpM-mTdZTTxTnmvzGw1jx6f-TUvjDLiZwkD1FXDo-GhA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] cli11: Use the standard catch2 version
To: jhaller.oss@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Jun 2025 21:12:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117717

fails with ptest in DISTR_FEATURES

   /home/kraj200/yoe/build/tmp/work/riscv32-yoe-linux-musl/cli11/2.3.2+git/=
git/tests/catch.hpp:9:10:
fatal error: 'catch2/catch.hpp' file not found
       9 | #include <catch2/catch.hpp>
         |          ^~~~~~~~~~~~~~~~~~
   1 error generated.

sometimes there are hard version dependencies too, have you checked
that it will not run out of sync

On Mon, Jun 2, 2025 at 6:18=E2=80=AFAM Julian Haller via
lists.openembedded.org <jhaller.oss=3Dgmail.com@lists.openembedded.org>
wrote:
>
> From: Julian Haller <julian.haller@philips.com>
>
> The cmake infrastructure already supports using catch2 from the recipe
> sysroot. Make use of this mechanism and add catch2 as build time
> dependency. This allows us to drop the custom patch, the additional
> catch2 fork reference and the do_configure workaround.
>
> Also, cli11 does not use git submodules, so change the SRC_URI type to
> git.
>
> Fixes: 62db1c041f81 ("cli11: upgrade 1.9.1 -> 2.2.0")
> Signed-off-by: Julian Haller <julian.haller@philips.com>
> ---
>  meta-oe/recipes-support/cli11/cli11_2.3.2.bb | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)
>
> diff --git a/meta-oe/recipes-support/cli11/cli11_2.3.2.bb b/meta-oe/recip=
es-support/cli11/cli11_2.3.2.bb
> index ef3c951bbf..a247509c24 100644
> --- a/meta-oe/recipes-support/cli11/cli11_2.3.2.bb
> +++ b/meta-oe/recipes-support/cli11/cli11_2.3.2.bb
> @@ -6,17 +6,11 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dafb20fe5f67e=
21074b10b864d9563c11"
>  SRCREV =3D "291c58789c031208f08f4f261a858b5b7083e8e2"
>  PV .=3D "+git"
>
> -SRC_URI +=3D "gitsm://github.com/CLIUtils/CLI11;branch=3Dmain;protocol=
=3Dhttps \
> -            https://github.com/philsquared/Catch/releases/download/v2.13=
.7/catch.hpp \
> -            file://0001-Do-not-download-the-catch-framework-during-confi=
gure.patch"
> +DEPENDS =3D "catch2"
>
> -SRC_URI[sha256sum] =3D "ea379c4a3cb5799027b1eb451163dff065a3d641aaba23bf=
4e24ee6b536bd9bc"
> -S =3D "${WORKDIR}/git"
> +SRC_URI =3D "git://github.com/CLIUtils/CLI11;branch=3Dmain;protocol=3Dht=
tps"
>
> -do_configure:prepend() {
> -    mkdir -p ${S}/tests/catch2
> -    cp ${DL_DIR}/catch.hpp ${S}/tests/catch2/catch.hpp
> -}
> +S =3D "${WORKDIR}/git"
>
>  inherit cmake
>
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#117706): https://lists.openembedded.org/g/openembedde=
d-devel/message/117706
> Mute This Topic: https://lists.openembedded.org/mt/113427706/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

