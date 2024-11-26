Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E69A1D6554C
	for <webhook@archiver.kernel.org>; Tue, 26 Nov 2024 19:16:14 +0000 (UTC)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
 by mx.groups.io with SMTP id smtpd.web11.54968.1732648571630392679
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Nov 2024 11:16:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=k3TUU2h+;
 spf=pass (domain: gmail.com, ip: 209.85.210.42, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-71d4182b2cbso1567702a34.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 26 Nov 2024 11:16:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732648571; x=1733253371; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0zP56jDLnsbijWXZY1sYsTewal/e5WfJqKhpkJ+INOY=;
        b=k3TUU2h+3kzdjoviNNHyroPPhD0Ao3EDuR1LENgSntG20D7V0hfW/sTubaGtqzsmLP
         QX+RaPYi2D91hYkKi2ztmoe97WRmDJ2CWehxNC1w7HmK7Phkb7jhHcMWdkyJkbU9yVJ5
         KqQ8EYlB+JuGDvcj1VvePe4Ny3ctRcUWL9yXNAMEZnkDq7mvHJJUlEvAvp/4pYAb4TfZ
         LMkYiS+lEOMmZzmAxpLJjTcLNZJV2M3zFCEd8r6trGhzFG0xDMnktGaG0RNGNzzww5GE
         X96L7w3fyVNyGC+ik81/cZcowY+f68MyYr+DU5dULwQxMuOd1f5JgGRR0Hm1hj/JUcLe
         BNhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732648571; x=1733253371;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0zP56jDLnsbijWXZY1sYsTewal/e5WfJqKhpkJ+INOY=;
        b=is2mHwv4MDOZvX3x3jegX+nPTlKfjmlNGrmcCH/wiGKr+u1L1fdM3X3nH6YCrKLKgc
         fsWwYaAhzNqEMK9Kbkgi1FIeZqyGF3fYuiGNkX0f7aqCQ5+uWw89wM4yHcg3Ovr+9Lb4
         2I+V/hH3pTIsY0zHM7Zxyo7Kbz7Q3fAxt5zzxo5zH8k07KbN3RnhM6A8a9RriLmzRwGe
         0q8PaD6/f8rQNmYhNk/nNgljZqLowDzEWN1KY3qgCyJ4L0t/ai/uVv3Rv3U7c9MCQrmV
         gfGw55RnQtN7lhOBiEQE7pR5rOPEivbH253k/0eURcb3ifNfU/CR0uiV7umAKLbTbDjR
         Eoww==
X-Gm-Message-State: AOJu0YylZo72iZbS2xDrS6bGQJ6fVl/fWdzVgPc/dhl5InA7AAMXwEwd
	bzb1OaRO5pPhB23HN49fX4wJ9ZLPNcm2NB2WAeb1NR/NFnCAWP27FENHMkk7sA25/Dsv5MOLbeN
	bKLXlWUYhC6md0vAbW8qi4TWc1J4=
X-Gm-Gg: ASbGncubxlk4dlUWnLFaedqKUnEyUExGC17mmdetVQT/fzNyhI0kGeB5dHAxO3Q43aN
	UBpHMLac+qdFuebCl5kRz694zxcQgqw==
X-Google-Smtp-Source: AGHT+IFz6e0fzv2vDttw3RQer3UlnxxNHNNq1xqu6wGsvzHKiM4pOq2woNRjPQDwZgx6El+b2h10R9/6+Wh8h9XaifY=
X-Received: by 2002:a05:6830:6508:b0:71d:4264:cce2 with SMTP id
 46e09a7af769-71d65c99945mr211847a34.9.1732648570893; Tue, 26 Nov 2024
 11:16:10 -0800 (PST)
MIME-Version: 1.0
References: <20241126183234.7438-1-gudni.m.g@gmail.com>
In-Reply-To: <20241126183234.7438-1-gudni.m.g@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 26 Nov 2024 11:15:45 -0800
Message-ID: <CAMKF1spHnyCO-9Jmhfc=65aEEDpDKk_2PNktuTetCDqLDBucUg@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-isodate: move from oe-core to meta-python
To: gudni.m.g@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Nov 2024 19:16:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114078

On Tue, Nov 26, 2024 at 10:32=E2=80=AFAM Gu=C3=B0ni M=C3=A1r Gilbert via
lists.openembedded.org <gudni.m.g=3Dgmail.com@lists.openembedded.org>
wrote:
>
> Signed-off-by: Gu=C3=B0ni M=C3=A1r Gilbert <gudni.m.g@gmail.com>
> ---
>  .../python/python3-isodate_0.6.1.bb              | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python3-isodate_0=
.6.1.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-isodate_0.6.1.bb=
 b/meta-python/recipes-devtools/python/python3-isodate_0.6.1.bb
> new file mode 100644
> index 000000000..293fb0827
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-isodate_0.6.1.bb
> @@ -0,0 +1,16 @@
> +SUMMARY =3D "ISO 8601 date/time parser"
> +HOMEPAGE =3D "https://github.com/gweis/isodate/"
> +SECTION =3D "devel/python"
> +LICENSE =3D "BSD-3-Clause"
> +LIC_FILES_CHKSUM =3D "file://PKG-INFO;beginline=3D8;endline=3D8;md5=3De9=
10b35b0ef4e1f665b9a75d6afb7709"
> +
> +SRC_URI[sha256sum] =3D "48c5881de7e8b0a0d648cb024c8062dc84e7b840ed81e864=
c7614fd3c127bde9"
> +
> +inherit pypi setuptools3
> +
> +RDEPENDS:${PN} +=3D " \
> +    python3-numbers \
> +    python3-six \
> +"
> +
> +BBCLASSEXTEND =3D "native nativesdk"


are their any known packages that will need this ? otherwise I would
think its best to just let it go

> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#114077): https://lists.openembedded.org/g/openembedde=
d-devel/message/114077
> Mute This Topic: https://lists.openembedded.org/mt/109794480/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

