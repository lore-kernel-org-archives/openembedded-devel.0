Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E616CC19F32
	for <webhook@archiver.kernel.org>; Thu, 27 Feb 2025 18:12:41 +0000 (UTC)
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
 by mx.groups.io with SMTP id smtpd.web10.18020.1740679952561835988
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Feb 2025 10:12:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ew5xXZFq;
 spf=pass (domain: gmail.com, ip: 209.85.161.47, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-5fce03395d4so923337eaf.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 27 Feb 2025 10:12:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740679952; x=1741284752; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hbFlzg0hTlReRg84yumKg7TCeYXOrwPY4reYqmwNHK4=;
        b=ew5xXZFq7EqMTfWZiPpVzZdYbf61jqFjEKzkU4cTfcVh6KxqRUvqejEckF0hQlakGl
         IRaJOeiq/KCiX68Bk5OXbT/b68c80Xzb57kK0uiO/mhKaTMv+VeecNDX4xHkYVLKBtJN
         /mT8ESGaI3e4o44h6McFgZ1L4HFqfB5s9Qqs7Fuj17nmQ3CM0tojc0p7hH3qDY0wQeCF
         YL9mYfVycr26ODIrDEYrfcfSsLXGkbZJztM5Y8CCHNusT0Z7KNoJHpsLHzubeUE6ZeSj
         tbEy9RF5EFJUcdC+ul+VjTvfcuj9+5Vi43GxYBpP3EGQaH0fbW//KsMxQipnWH+vbwsM
         ti9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740679952; x=1741284752;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hbFlzg0hTlReRg84yumKg7TCeYXOrwPY4reYqmwNHK4=;
        b=TLszHkY78XET9Si8G3pK32xdZosWNSHqUwcBe5inB1nMLo4edcGNfNCsU8HpMf7v73
         nQt+0tzkb73xZerPE8cLYoywST3BUQcpXAFVyyOpParW0w2oeRBPY5q01un1omblCSAb
         HeMey8IJ34Bmsvfs3pKoGqRkGn0fGj9QiqqRL7VUTHJzvXUiwRwoVyE7JH9Q0fKdhel1
         uXNi0ti/ATNgFJ27mAXjPxX0t7rcWI0xw+Z/CnjOm5YQQkUYDbcH9ybOTpKA1CTLYQOi
         kgYPxyIs+Sr3TJNEVShFdGn9Qkb/X4O7OUyxEkFwsIgSI6e/pwM8XDhfNPzKyiWlsGKS
         STbA==
X-Gm-Message-State: AOJu0YzCGzvHqtxAin54En+dxBmaCO7CsgA//25nRjv4QO/V5vjj9mOW
	G9jZK53Xhs+2y08WAYremn+lVGxqN1Sgra/qBcuKNyOkQSzcR/Yr3ltRK4D6R3vZzJTrmpyBhbt
	6A7TjPalYroG2NgR/excLS9eCx10=
X-Gm-Gg: ASbGncv7SRlblProno2BuaA771np/WI+pX3MG56GF6z5NRN95Ysl6N+F3/uMqppcxMw
	zhzqHgyKixqEJ9H7rN2fEqI/Ksy0S8MdT4hW+Th3M3Sf7lkkrUCD7k3qbzp8miLpF8yPyrmLXy4
	Q/VSCkYWj/iytsvwKfKGap2mu6nQ1OLlbS2xVd
X-Google-Smtp-Source: AGHT+IFjSOWRJ25frqc33fXiZkgN/P1Za+Oz/XFR/VqKmDmLAiF1MlG0QrX3wFsojFgLEitDWkIF7/iADvpZW5AhbkI=
X-Received: by 2002:a05:6820:553:b0:5fc:a89b:a339 with SMTP id
 006d021491bc7-5feb355f64bmr158937eaf.4.1740679951809; Thu, 27 Feb 2025
 10:12:31 -0800 (PST)
MIME-Version: 1.0
References: <56818ccb-b03d-4ed9-a7e1-267876ef8cb5@gmail.com>
In-Reply-To: <56818ccb-b03d-4ed9-a7e1-267876ef8cb5@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 27 Feb 2025 10:12:05 -0800
X-Gm-Features: AQ5f1JoSNyKpx-eh4HHbEOdlhnf5-gxTNvl2d9__x4lgaqDq0PKs8KOyyzYFlRI
Message-ID: <CAMKF1spOX4eU7r-c7B0eBHVB58+D20ft9ViJhHx25Z3Kc1vqPg@mail.gmail.com>
Subject: Re: styhead merge request: Feb 27th
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Feb 2025 18:12:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115698

merged now, thanks Armin

On Thu, Feb 27, 2025 at 4:53=E2=80=AFAM akuster808 <akuster808@gmail.com> w=
rote:
>
> The following changes since commit 6851cbf026088a13b2b45f684838d3dc4d7ccf=
dd:
>
>    lapack: fix buildpaths in ptest also when CBLAS is enabled
> (2025-02-04 14:29:37 -0800)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded styhead-next
>
> for you to fetch changes up to c93994f1bb601c57548b588d4f77a044d90822cf:
>
>    sip: Upgrade 6.8.3 -> 6.8.6 (2025-02-25 08:45:21 -0500)
>
> ----------------------------------------------------------------
> Leon Anavi (1):
>        sip: Upgrade 6.8.3 -> 6.8.6
>
> Peter Kjellerstedt (5):
>        ebtables: Remove the dependecy on bash
>        tbb: Re-enable hwloc support
>        lvm2: Remove a lingering reference to ${PN}-udevrules
>        libeigen: Remove LGPL code
>        licenses/MINPACK: Remove
>
>   .../ebtables/ebtables-2.0.11/ebtables-legacy-save               | 19 +-
>   meta-networking/recipes-filter/ebtables/ebtables_2.0.11.bb |    2 -
>   meta-oe/licenses/MINPACK                                        | 51 --
>   meta-oe/recipes-devtools/sip/{sip_6.8.3.bb =3D> sip_6.8.6.bb} |   12 +-
>   .../libeigen/0002-Remove-LGPL-Code-and-references.patch         | 1040
> +++++++++++++++++++++++++++
>   meta-oe/recipes-support/libeigen/libeigen_3.4.0.bb |    9 +-
>   meta-oe/recipes-support/lvm2/lvm2.bb |    2 +-
>   meta-oe/recipes-support/tbb/tbb_2021.13.0.bb |    1 +
>   8 files changed, 1065 insertions(+), 71 deletions(-)
>   delete mode 100644 meta-oe/licenses/MINPACK
>   rename meta-oe/recipes-devtools/sip/{sip_6.8.3.bb =3D> sip_6.8.6.bb} (5=
3%)
>   create mode 100644
> meta-oe/recipes-support/libeigen/libeigen/0002-Remove-LGPL-Code-and-refer=
ences.patch
>

