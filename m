Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEECFCAC59A
	for <webhook@archiver.kernel.org>; Wed, 17 Sep 2025 18:51:14 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.web10.31813.1758135068020668855
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Sep 2025 11:51:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ahHq1AVJ;
 spf=pass (domain: gmail.com, ip: 209.85.128.176, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-72c3b247827so1799147b3.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 17 Sep 2025 11:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758135067; x=1758739867; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kL52KSf67SxNHZS0PNjg9NozlIijZ9NLYdE+2+5pMKw=;
        b=ahHq1AVJ1NqWu82GEurSVsuRa7KZ/D5sMSOFJwFp+888gRGGhGxNVHjRZ4sks/F0qn
         ndZuSIDg4P9kYG3Z33pp1mM9n/U9BMBAJF1mMKVDbru+d0yVaUu3HcJLDabEBr89Sjrn
         YuE01ZmB42vEkwtmtRP5thZv0+V0ktBc7OtBJtNuykDjsjvXsx1Qd7jtsrieM48hOapw
         pdWlnHuy9Mvv+H/xJCgrezq/0s8MgH/oSl18JatfN7V2QRiB+vb11ZNlG/GKip3NxPN2
         GDWcztlNZQgYv1eK4BYv4OSz1Ro/3O0vXa1WzqukPKCWQTdE3VA1GoBBOxoB6sPakm58
         71Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758135067; x=1758739867;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kL52KSf67SxNHZS0PNjg9NozlIijZ9NLYdE+2+5pMKw=;
        b=p46F/aRwgi3FBIKEmRzWQbtIDbvu3GW1M0OcFXgW/huorWD2TpVzWLaTTELjc1VDrO
         18nlLVrAWhrpiXeddaW2uy3tQ3lIvQ6M2YZX0oYkzft/A9MF1obN3zTvVdEGwtFl7mId
         Od6YAMs5zD+qIlj+5gISWOGjXGqc7oLmZGGU0IeNj7mmHvAqxd0VE8Vr+w8ku+aBrH3J
         krlFMFWXV0n6uAy4NfzazfkL3hIjFBUvVh8FiaJzxBka33+KoMkDpZY8/VO2i7Mulsix
         MPhQH6Fw08+C3kUESFDouqWNj5pL1AqcaX6Jxiz8cvzd7FDZF63AkS8lsr0BxNxvxfNO
         vg9w==
X-Forwarded-Encrypted: i=1; AJvYcCWiOWT658G2P5WdylbjKcRR6u6P7EpCLlv3eMPpXGeu7f5QPiHc0X44o72Wj0Bo4WTEDiwYgZPbMqLa1/MVEZPKNPI=@lists.openembedded.org
X-Gm-Message-State: AOJu0YywsipX8CFqnJa5PeJSm8AxudBXiAP+e0O9ZkyfJ33PsDsUN/kG
	73jHyTjkZ8/v7QSRyxQ3HPNB6I1vLQEI0aSLEsnAwxylBPHoGxz2Y6UecDbUJxKT0S1dQObKniB
	UYOU4JkV3vcsnLCrQLy4wPg1bRUWL2aI=
X-Gm-Gg: ASbGncv4xhwOykVdpvjhJ0YKCKzbVJ+pSZbvMiJe/Txuqte8ZOFc2GkbgLHW7B1V22X
	GdX4zB7Byx80Te12nUr+IVScadoQNv8Uk+REv7aIhx6s8osqJjVF5Vk7+7v2QPSS3vbCA9MH04Y
	pK4sFJVQ+OmzR1DXiW5Fsee4WbrgTWagmzu/lxxiWoL2C+sW7uyJYIToI28qgp1hXzbbeaMSppB
	ArQGTwzxTyV8C0Jr4Z9WwHYM9GdtQKt6vE/i7otbwhBTCKLJO59oD9+iQzya0TOTK9CbQ7azJp9
	qn66IHc9lXEU+Nyvq76A2+k=
X-Google-Smtp-Source: AGHT+IGedg77TB/oFzX4N0MW1gOicn9z4Oy4qMlzgLNgVSZn/R8VhzMxI8pl4pmHVszgw/dsPwY1xidHG3Kz1+HEAcU=
X-Received: by 2002:a05:690c:64ca:b0:726:37ae:95a0 with SMTP id
 00721157ae682-73893246ad1mr27679337b3.47.1758135066941; Wed, 17 Sep 2025
 11:51:06 -0700 (PDT)
MIME-Version: 1.0
References: <CAOMZO5CSQZG5=+urHZb9yPK5cV8S=c1EmqecPNQgPjA5qWNwpw@mail.gmail.com>
In-Reply-To: <CAOMZO5CSQZG5=+urHZb9yPK5cV8S=c1EmqecPNQgPjA5qWNwpw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 17 Sep 2025 11:50:40 -0700
X-Gm-Features: AS18NWDuvWIb78vYDySkTFa3E0U3gyzTvaRI8-WrwEfJzwJgBa5YZu68pEUCeNw
Message-ID: <CAMKF1sp6CDY46z+FsgMyZ5feuike_pJeR9S8zLo8+ESBXfcLZw@mail.gmail.com>
Subject: Re: crucible: Recipe update with go module fecher
To: Fabio Estevam <festevam@gmail.com>
Cc: christian.lindeberg@axis.com, 
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Sep 2025 18:51:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119487

On Wed, Sep 17, 2025 at 11:38=E2=80=AFAM Fabio Estevam <festevam@gmail.com>=
 wrote:
>
> Hi,
>
> I'm trying to update the crucible recipe from 2023.11.02 to
> 2025.05.28, but I'm unsure how to generate crucible-go-mods.inc and
> crucible-licenses.inc.
>
> 'devtool upgrade crucible' did not work:
>
>   File "/opt/work/festevam/oe/poky/scripts/devtool", line 352, in <module=
>
>     ret =3D main()
>   File "/opt/work/festevam/oe/poky/scripts/devtool", line 338, in main
>     ret =3D args.func(args, config, basepath, workspace)
>   File "/opt/work/festevam/oe/poky/scripts/lib/devtool/upgrade.py",
> line 605, in upgrade
>     old_licenses =3D _extract_licenses(srctree_s,
> (rd.getVar('LIC_FILES_CHKSUM') or ""))
>   File "/opt/work/festevam/oe/poky/scripts/lib/devtool/upgrade.py",
> line 509, in _extract_licenses
>     with open(os.path.join(srcpath, path), 'rb') as f:
> FileNotFoundError: [Errno 2] No such file or directory:
> '/opt/work/festevam/oe/poky/build/workspace/sources/crucible/pkg/mod/clou=
d.google.com/go/compute/metadata@v0.2.3/LICENSE'
>
>
> Does anyone have any suggestions?

I am not sure devtool support for go mod fetcher is there and working.
You can do

rename recipe
bitbake <recipe>
Fix sha256 checksum
 bitbake -c update_modules <recipe>
bitbake <recipe>

>
> Thanks,
>
> Fabio Estevam

