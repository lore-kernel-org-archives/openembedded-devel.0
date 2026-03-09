Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C084AFCA178
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 18:45:19 +0000 (UTC)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22215.1773081913835508042
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Mar 2026 11:45:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LX6sxWfQ;
 spf=pass (domain: gmail.com, ip: 209.85.167.171, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-466f00535cfso1494335b6e.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Mar 2026 11:45:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773081913; cv=none;
        d=google.com; s=arc-20240605;
        b=Vvxfxw5ku18z3TB4TL0RK2uok7wLVf28y1k1aF5OAHsbo5NDJMYD0X1Uw9BmOm9i1J
         8ugjABNPVIHzuRg8wmTBDT8oGsw8YNCZfos5WRlf7iupnt02dKCA4WEu7utGZF0GHjpb
         WbImYJZ1YLVsMUNDtogVoFu3sDa/eGrpptGuA3hG5FXyP9vL5QHlQCnxvC4SF5ILPQpj
         vO7GxuraDz76lGhLGLKTLc0IQRG3leHwj6ILV2G3Wp3vFQeqW68y+A8N3aXNERjXQMtx
         wlY2Cgizn6pfcft1fhRN40k6wcVdPPFshCCPdHD3CZwM642lcVee2K4JuOnVzXTOf7/y
         rS8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=S+YvpI/PVHn/GomwfO0XVwzwJSNaREgH/l+XscgCVF4=;
        fh=/pKZqiJO6ZyW8l1F3cqMwIj3cJesZI6SFBUzs2mKL9s=;
        b=d8ThDm0e67nFW+S1orQWF7wHWYVQloSUOmZ5M8w2Kdcd+S/bApAPDukzlpoC1oEPAQ
         5E/Vss0H/4cj/5kebhS2Gg3Ig0GDVDMeetD1+aqJWnGQoa9pt/3QXlF+7qq72G3FfZmz
         8XdxNXMl+1oP0BoRU/Mi7P/5BvTn2kvPKo698OxcTyw7LNuMVij7s4MGArfnbBhyrTJS
         SK2abbWiVjqjf5nacuO/3/sUGi50O22r5PpHawjLX1FiBkRoEKGaQ/y1/6uWotSPmuPf
         oteWjYvv7Hi1kgw9ERp9l0BY2nf/rSjfuXtZVl7zbD+7W0lp8tksh3A9O5W5DxnJCLnS
         hR9w==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773081913; x=1773686713; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S+YvpI/PVHn/GomwfO0XVwzwJSNaREgH/l+XscgCVF4=;
        b=LX6sxWfQ1LuLTlHld+RQXFr5VXxzZoEDGomPS39dj2EzsFmUCZcDnXqrWbyR/el0xO
         Vvx4KzT/c9rNw0ImsN8HGCjvfmmLR7gxVU8JtoS/tbPq4NuZSL+mZ7sekD0iFqePdlJd
         gWj3OeY6hi4Wp1lH69Mq+WKULGDo81pBSwOj7SD+j7ERD/qkUlFfqLnI6gYkhj93Zi2z
         0L/ngLfhvC4DU8iwjrA1mO1ebc4IZruw4cIEd0Dw2Cn+YN32Zv/BTsPGj8Tpqbssy9YH
         hawMP9b6K1/EV3842bkmDs46xIipDDJieBl635Jaau5UH+n0JkdrcTmLkgVKaHIYzs/w
         6kYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773081913; x=1773686713;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=S+YvpI/PVHn/GomwfO0XVwzwJSNaREgH/l+XscgCVF4=;
        b=sKsh0bmGjTwropPqbZTeuFJoeVyNq+ju+oS4XPhkNnJdvdzJ2ohh5aSX0KP7VRc/5P
         ov9M2BIOoYIXznift06dIJGiQBdseAxuslycHIX0P1D9Nwy/3gc6886KjM1w+RQ4xX1y
         goowCuBdm7uM+yOX2ZyKqDFst0uw5h02ELWpWBxvDLzMhDX43zpFUBwRFpxtCjkGsNk4
         lEtvFu2iNImoKlHe9JowfVloGHe8u49PgS8wCQekuxKFZhjuQNxztXrVEY7dviuccuAP
         LmaMzb/1rKHTifP5VWOz+4rUXnhTZN6r46zT85rdjLg4o6usX8XBRYYi2mvjnyeTx5MJ
         ppEg==
X-Gm-Message-State: AOJu0Yw2iZIwPV0B9L8rRfOkXgFYQsuOKmxq9PY5aUd+BW21quc7XsWn
	ozIA1TI/YDQVpTnjkghhqQ/h4mHMGL6Pe4pgf4u0cdgcg7+csjIvUiRyjs1LptX5kLFpsj+2dwd
	vITqmeymjSltHfWt5v/p/NjxKtMOPZVQ=
X-Gm-Gg: ATEYQzwirg/FMzNZmbVldOM8iDkhHfDIEkNodfbGyabzAuMHk5Jeno0q9dNgW0g+FlT
	/nXb2LPcMBeJ2EO2Z1HEzKpgHJ6aA92nqXZTqwOdrQ7Gu4F6gEUKcSGIXTY6AvEmw0BKutTe4Kl
	1LT+e34nn4G5T/Ovio/PssLrdyolQW6W0s7JWURax5K5zCIh2jKBenXgcrG5VN189/NXdULW9Fe
	etHT9Fasd+tcUPtBM2MpIpFx/3pSV1BBU3ncpLH5KfKXWDborTXYp9zN8BgY3/KUslkMkGfrRIY
	Y/YMT+38
X-Received: by 2002:a05:6808:13d1:b0:45f:59e:1e06 with SMTP id
 5614622812f47-466dc9eeaa3mr6462484b6e.4.1773081913030; Mon, 09 Mar 2026
 11:45:13 -0700 (PDT)
MIME-Version: 1.0
References: <20260309100630.404637-1-andrej.kozemcak@siemens.com> <20260309100630.404637-5-andrej.kozemcak@siemens.com>
In-Reply-To: <20260309100630.404637-5-andrej.kozemcak@siemens.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Tue, 10 Mar 2026 07:45:01 +1300
X-Gm-Features: AaiRm534GR6mlWwjcLVY64LyHD0am7oxfCXnmhBMH2kLNqhYQjabHHrVTHH9Dgw
Message-ID: <CADySD0GD72a5hm9v72nXmWqrfXthcuDX9iEPchpZpzwzt6JupQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 05/14] libmodbus: upgrade 3.1.11 -> 3.1.12
To: andrej.kozemcak@siemens.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Mar 2026 18:45:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125007

On Mon, Mar 9, 2026 at 11:06=E2=80=AFPM Andrej Kozemcak via
lists.openembedded.org
<andrej.kozemcak=3Dsiemens.com@lists.openembedded.org> wrote:
>
> Changelog:
>   https://github.com/stephane/libmodbus/releases/tag/v3.1.12
>
> Changes:
> - Fix FD_SET overflow when socket fd >=3D FD_SETSIZE.
> - Check dest pointer not null and nb in read functions.
> - NULL check for src and nb < 1 validation in write functions.
> - modbus_reply: don't compute address for FC 0x07/0x11.
> - Use O_NONBLOCK instead of deprecated O_NDELAY
> - Explicit cast for Coverity CID 416366.
> - Document required buffer size of modbus_receive.
> - Document macros for error codes corresponding to Modbus exceptions
> - Fix example of modbus_rtu_set_serial_mode
> - Test filesystem provides symlink in autogen.sh
> - Sync API signatures with the documentation.
> - Many documentation fixes and typo corrections.
> - Add coverage target and helper script.
>
> Signed-off-by: Andrej Kozemcak <andrej.kozemcak@siemens.com>
> ---
>  .../libmodbus/{libmodbus_3.1.11.bb =3D> libmodbus_3.1.12.bb}      | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-oe/recipes-extended/libmodbus/{libmodbus_3.1.11.bb =3D> libm=
odbus_3.1.12.bb} (92%)
>
> diff --git a/meta-oe/recipes-extended/libmodbus/libmodbus_3.1.11.bb b/met=
a-oe/recipes-extended/libmodbus/libmodbus_3.1.12.bb
> similarity index 92%
> rename from meta-oe/recipes-extended/libmodbus/libmodbus_3.1.11.bb
> rename to meta-oe/recipes-extended/libmodbus/libmodbus_3.1.12.bb
> index ffbb3a8c8e..06a4049b31 100644
> --- a/meta-oe/recipes-extended/libmodbus/libmodbus_3.1.11.bb
> +++ b/meta-oe/recipes-extended/libmodbus/libmodbus_3.1.12.bb
> @@ -7,7 +7,7 @@ LICENSE =3D "LGPL-2.1-or-later"
>  LIC_FILES_CHKSUM =3D "file://COPYING.LESSER;md5=3D4fbd65380cdd2559510790=
08b364516c"
>
>  SRC_URI =3D "git://github.com/stephane/libmodbus;branch=3Dmaster;protoco=
l=3Dhttps"

can please also include tag=3Dv${PV} in the SRC_URI

> -SRCREV =3D "5190e5e141780ae481f24be16d7b39a5f3ad8f8f"
> +SRCREV =3D "9af6c16074df566551bca0a7c37443e48f216289"
>
>
>  inherit autotools pkgconfig
> --
> 2.47.3
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#124977): https://lists.openembedded.org/g/openembedde=
d-devel/message/124977
> Mute This Topic: https://lists.openembedded.org/mt/118218622/3619737
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nkur.tyagi85@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

