Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEAA0C0218F
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 00:38:25 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
 by mx.groups.io with SMTP id smtpd.web11.77598.1738543099268396883
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 02 Feb 2025 16:38:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=E5HvncPQ;
 spf=pass (domain: gmail.com, ip: 209.85.160.47, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-29e842cb9b4so980916fac.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 02 Feb 2025 16:38:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738543098; x=1739147898; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HqNj3KmKzYcbnt128h6Iy97WsIVq0BGvkB5pCmajbpQ=;
        b=E5HvncPQNjCiKYt18OMnbtDDftzczQYuVY7S9yiCQiuQDL+Scbnqqsbkc965gxud6L
         rGLmjZ9VoxBNA2cZj9cXK9dPPRDniMTG3zqbIgUcyHP729WYiWb04Pl2hiaOP53rejH0
         bB+WRak3FCI54dwvhidOXjqIByyncAoxfcUo57Eswo4vxg+qywgcC54YUwf4zuQvb3B3
         xwSD7p8/Rmyz/U8gMO9PN6Yf7/jsEazDBUVUtGffnUX0cERlHpkIWMoQlmAKXwg7G2y8
         Nar0aNoKjnflgAk/PuVXliVNPBHusUmi8+zKns3ZrLnFsGT5kSJb/wtxgr/dj4xwNViu
         B0xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738543098; x=1739147898;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HqNj3KmKzYcbnt128h6Iy97WsIVq0BGvkB5pCmajbpQ=;
        b=m0xotuHi9GFDc7EmD9joN8YApd7DbHeBskVbc93ngwCLgWa5rvODosYJ+I7O3df0nA
         WK0XdLjtbIq6UyYeu/qYEYNGbW8OaBRQ+IWdYz/0q8TfYTEnM/bFvAEVlrPachIoyoL7
         MTsnv8YE0AUDxcO1UdBm9TxB6hSOrISY8sK+i5r1U2bM+RTX6NSAFliXpdcmJwGxuvYK
         KsO+h6RISOkY+UJ71IBHIE1MsIxRdIK0otd0fykCPIZSqWEjyaEPixUJbPzxIxGsTfxk
         hfay2gZ0g643qrtJJfm/u14p6avmfHPzzaUkdKa+idG5yfzTUtVrCXj6kMGxn6QE70V/
         QpVQ==
X-Gm-Message-State: AOJu0Yyt/a1sKd9maBAyCuzUO+O6UgT3Ne6G+QqoI4ihFk4F/VocFzi4
	D0/6z+socBLU3xYu2yuMvshpA/+7AytZ/vlLONTS/+v4c5EV5k4kqYYqwRp7L/noQ3SE1uvc9Qm
	9htclIf7JnJM4sNk9Ryf3/nEDnULD2+sc
X-Gm-Gg: ASbGncs20wZOeMr0YKYShML6zSeNzBEO5ChZWNjGXRKO+eASAB6tgF6JzyzO89Yov3E
	/xpd4dqTvFP/Ou7/Aj1gHp5BQTz1/vVV+FFlSigT7G53vKlvUpD2nu2rFlAoP5Q14ERE7Zxau
X-Google-Smtp-Source: AGHT+IHRSQg0nRzJSebaPjWVByPEAuV9m0+0YCqMKI+HZaS+9uZC6ygi1GztBcs+hC4L1DXcl8R6nIGVYBTuQVdSPz4=
X-Received: by 2002:a05:6870:1594:b0:29d:c624:7cad with SMTP id
 586e51a60fabf-2b32ef5de6fmr11473772fac.3.1738543098500; Sun, 02 Feb 2025
 16:38:18 -0800 (PST)
MIME-Version: 1.0
References: <20250202213910.284312-1-peter.marko@siemens.com> <20250202213910.284312-4-peter.marko@siemens.com>
In-Reply-To: <20250202213910.284312-4-peter.marko@siemens.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 2 Feb 2025 16:37:52 -0800
X-Gm-Features: AWEUYZn-0rpGgq93cnU_kMixahQbcTx0g5J1tpueKfFlPzYvAyEpTn1n-Zm6_3Y
Message-ID: <CAMKF1sra1oC+W8hySB75F53SFHOqOgqLbLyF3vTv320M1AO0yA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 4/8] protobuf: don't download git submodules
To: peter.marko@siemens.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Feb 2025 00:38:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115230

On Sun, Feb 2, 2025 at 1:40=E2=80=AFPM Peter Marko via lists.openembedded.o=
rg
<peter.marko=3Dsiemens.com@lists.openembedded.org> wrote:
>
> From: Peter Marko <peter.marko@siemens.com>
>
> All dependencies are used from recipe sysroot now.

It might work now with the version set, how do we keep it working
when the packages get updated asynchronously unless upstream stops using
vendored components as a first class way of doing things.

>
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  meta-oe/recipes-devtools/protobuf/protobuf_4.25.5.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_4.25.5.bb b/meta-=
oe/recipes-devtools/protobuf/protobuf_4.25.5.bb
> index 470c368cf3..ded2c9b11b 100644
> --- a/meta-oe/recipes-devtools/protobuf/protobuf_4.25.5.bb
> +++ b/meta-oe/recipes-devtools/protobuf/protobuf_4.25.5.bb
> @@ -12,7 +12,7 @@ DEPENDS:append:class-target =3D " protobuf-native"
>
>  SRCREV =3D "9d0ec0f92b5b5fdeeda11f9dcecc1872ff378014"
>
> -SRC_URI =3D "gitsm://github.com/protocolbuffers/protobuf.git;branch=3D25=
.x;protocol=3Dhttps \
> +SRC_URI =3D "git://github.com/protocolbuffers/protobuf.git;branch=3D25.x=
;protocol=3Dhttps \
>             file://run-ptest \
>             file://0001-examples-Makefile-respect-CXX-LDFLAGS-variables-f=
ix-.patch \
>             "
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#115223): https://lists.openembedded.org/g/openembedde=
d-devel/message/115223
> Mute This Topic: https://lists.openembedded.org/mt/110959920/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

