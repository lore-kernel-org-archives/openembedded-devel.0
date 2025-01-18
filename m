Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58B5CC02187
	for <webhook@archiver.kernel.org>; Sat, 18 Jan 2025 17:25:24 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
 by mx.groups.io with SMTP id smtpd.web11.14711.1737221115541357917
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 18 Jan 2025 09:25:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=l/SuyNOf;
 spf=pass (domain: gmail.com, ip: 209.85.160.44, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-29fcbf3d709so1120020fac.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 18 Jan 2025 09:25:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737221115; x=1737825915; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xeRRMLWAK/vFN5a6peLBGC1oAleZlvMcEaykPvlNOGs=;
        b=l/SuyNOfkHs5MwsRjv3n1a09SlVRKYfS4yQ6EqeJFGiaJiyHaLTnde6GC+SPbz+Xki
         VbAUwTnIPaN1qSHzhQkqObsDzD4oIICf39+7uzqynLmtpi8tuZb9bcHTowJgpw4nc53p
         LGLbCACaMOJ1vMVAnmZ9t/JmWrVyYtZCedt7X3OV0jTvzX9TEjCrFQiiyFxMWj4EX2IN
         2RVTwUgvl87cnCsivlyAijhW6gegFvl7UnaPx/LAnGcEC68xtVCF6pfpgC0npsBRmNh6
         kExW46lD7famhZBph40jo0auZslRXDDDehi4DgQJjNXCeGVI/9Dfd/Qu5YrJFRaeWJhS
         948g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737221115; x=1737825915;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xeRRMLWAK/vFN5a6peLBGC1oAleZlvMcEaykPvlNOGs=;
        b=DHw4upa66pwdohHIz6JdY2swi6f8WEjD1WkfB6+CMC0HfI3pIjKowGJ4Uu0UgjzIZX
         9v/9VETwY5aSQi0Xc4Bg8qY4E0/3bl36lrpHNNg/ZB3nSaLzu47WV/lpTHcvFQZyFmI0
         LOhnx92qmu6AGoyHtqXYLY99ni7ssmiejn/HQSnNblyvgxXhvx2wLpMwAxzJpRc/rztL
         G4po+aBrRnga1wY6e8lUzO1cMryReH8ErakTcXoGgqwNcnn1Mopq8cIbH0GYLMf6/sdf
         PwTFlXrtkw50065j3hPlOoEVR4pd+nsVnlzaAw+LQxXstsK6V4elSpCcJADxpBWnoiAG
         7zaw==
X-Gm-Message-State: AOJu0YwZu2OXhmgaVBHfxd7/PFcQc/LzksHnRevq4uYNO/PaTozwOLDG
	sOa5lPDwxLlpRwYDKzJtiTS/bVtik3u/piwnbEnoLrKv6g+hBHQG5UuG0FzVg92LzKHf7aT/bGA
	+BD/4jsai7LZ/qcSeXqTBi+hw/CQ=
X-Gm-Gg: ASbGncudycjCwicpadIi1yb7ddgFMXqJ9uUEeieZrbbtDuzVv08DoxgNwWNheZLw+Ci
	KCDmMJu31SOAoznuE0QLGOrliWA3P7eDfQFBfZxFvu6kGrsfGxVD+oy07tYGa05ESLQ==
X-Google-Smtp-Source: AGHT+IGvnDxY5kpMgCn5whqOFAq9/KAmoJjUTFq6iMEGg60SKZhLhkrkE+/wMlUO0og0AlGs3Q5y9KUU1GgzRIbg0xk=
X-Received: by 2002:a05:6870:b015:b0:29f:d0bb:618e with SMTP id
 586e51a60fabf-2b1c0c04a2dmr3800267fac.25.1737221114778; Sat, 18 Jan 2025
 09:25:14 -0800 (PST)
MIME-Version: 1.0
References: <dc27926c-b702-4bb0-888f-1641611961c3@gmail.com>
In-Reply-To: <dc27926c-b702-4bb0-888f-1641611961c3@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 18 Jan 2025 09:24:48 -0800
X-Gm-Features: AbW1kvaWSoCF6uF7QIPunEEgi5XHFv0dHAkI0lnwO908rOGzdq1Hfh5trTNqGIc
Message-ID: <CAMKF1srPU_ADKcQShHXiUBY5bUq_OCV-fKRFF5WyytV9jgbHqw@mail.gmail.com>
Subject: Re: scathgap merge request: Jan 18th
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 18 Jan 2025 17:25:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114950

merged Thanks Armin.

On Sat, Jan 18, 2025 at 8:01=E2=80=AFAM akuster808 <akuster808@gmail.com> w=
rote:
>
> The following changes since commit 3c293e14492f01e22a64004e2330fb620c2757=
8a:
>
>    python3-tornado: Upgrade 6.4 -> 6.4.2 (2024-12-27 09:24:53 -0500)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded scarthgap-next
>
> for you to fetch changes up to 5f9f741193f55bb4bb3c974e913d169dd23e40d3:
>
>    ghex,gnome-chess,gnome-photos: Add missing dep on itstool-native
> (2025-01-05 16:46:47 -0500)
>
> ----------------------------------------------------------------
> Khem Raj (1):
>        ghex,gnome-chess,gnome-photos: Add missing dep on itstool-native
>
> Markus Volk (2):
>        geary: add itstool-native dependency
>        eog: add itstool-native dependency
>
>   meta-gnome/recipes-connectivity/geary/geary_44.1.bb        | 1 +
>   meta-gnome/recipes-gnome/eog/eog_45.3.bb                   | 1 +
>   meta-gnome/recipes-gnome/ghex/ghex_46.0.bb                 | 1 +
>   meta-gnome/recipes-gnome/gnome-chess/gnome-chess_46.0.bb   | 2 +-
>   meta-gnome/recipes-gnome/gnome-photos/gnome-photos_44.0.bb | 1 +
>   5 files changed, 5 insertions(+), 1 deletion(-)
>

