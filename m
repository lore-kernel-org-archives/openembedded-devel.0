Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72B63C5B549
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 17:17:14 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.web11.22324.1749057430736199160
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Jun 2025 10:17:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fgFFX6wc;
 spf=pass (domain: gmail.com, ip: 209.85.128.176, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-70e767ce72eso1386577b3.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Jun 2025 10:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749057430; x=1749662230; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uIqIeYue1EhEkTDOrq5v6ZTR+8KScjlKSImCaVyS+og=;
        b=fgFFX6wcz8mErcsaQLIiEILmyQ5BINuUOJxefsqMvV0qfo2WUbpKkp/LFxiLl1rgnR
         pU/KVJfbzQszQhloaQi7YGlkaa9X3wA09d1wNExTlssOrr9aeCuBLayAaId32l6Py2l+
         TFJpXgDRNWHnMPFiZuVDX7N2bFnPEqkBrrpYGBt8oxBmmPRcnoIq91CC+8ZBBKhVuO5m
         zOMHR2IuIOF5zqj9I+PVKU0xGJbjrMZ8ENguWBUMlKxP4bK7jjUiLETUtiogP78KYKyS
         aJ2nFtk+Mno4cATeiMUZkfHfKMpsD4C41Y1Wx7Qig5OG80Xe7+KVd3jcJloqDypXXPb5
         HS8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749057430; x=1749662230;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uIqIeYue1EhEkTDOrq5v6ZTR+8KScjlKSImCaVyS+og=;
        b=qDk/LFq39yVdDh+D3ASUgKT2qLrpRiyIXN08V7yC3Th4/24DwTd5ruzQ72LEl6M0HY
         WaKJrcfW684vMxIhx1az6d44VDfgC4Q8o8b8BFnHs0rsFTn8piLDHbwZ9KPqr6uGKK2G
         Je59R95HCW9C2h0PTsCYBylsma8AV1Fwm1otgQNmc1/OB3GCosBvZNw4S4pOh+ZGBaEE
         cqjWrwIYfCQHhEldpX2ufiCsHgtdLw874X13jBkvW03tuMF367H7tNp7hQ95XDb85Gmq
         zcT4c3mgx0OQw0bW2GGQy/JdM+40ZmD/dspRLQu0lNLl4pbHa1tOUfkb8IresCplYDp0
         iR+w==
X-Gm-Message-State: AOJu0YxmK/PVxEB0AklFlRbInEjKtcZPzsgbS05+CbNwMVhMncI078rE
	0EQOHlgIG4iRH50lyuwqfjRlqGFkHbLS9ZI+fgwXJmFyxgdb8YqIDwcFiEf3LX9RmRl7tqzaL4S
	M2lpNAx29IMvjWZB9jevwlLO+P+TvgCc=
X-Gm-Gg: ASbGnctORgpJGY27PZNhSPJDyBYrOJuABYKow2yuVUmtk93vXxzJWIG9FJ3W83kXDk+
	CamSj/pR7JGbhGwKnOxF/xM65Zhl6mah627tYdXtpoSSZwt9dkloUUpMEucKmcF1XPRpHaj7Uz4
	QfkxIHATzqUKQ9tH545OOiIonWUSEAqQ0=
X-Google-Smtp-Source: AGHT+IH5jYuhlTt5ecuQ+Ura6PUqnui/PjLMwtkfYjOajGTqSjA4xrwq19CxvXOqFkwKftGhPLPCMmFAPM9jEeDfyDg=
X-Received: by 2002:a05:690c:25ca:b0:702:d85:5347 with SMTP id
 00721157ae682-710da01a419mr50627597b3.36.1749057429695; Wed, 04 Jun 2025
 10:17:09 -0700 (PDT)
MIME-Version: 1.0
References: <54a40e2b-8aa2-4cca-84b2-cf1b3ccbec49@gmail.com>
In-Reply-To: <54a40e2b-8aa2-4cca-84b2-cf1b3ccbec49@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 4 Jun 2025 10:16:43 -0700
X-Gm-Features: AX0GCFtn6LkQbXnE4KANIHkYWuJJ5kAXfFLhbIqFbTp0ZXFAVjt0JgCWkqE3F1c
Message-ID: <CAMKF1sqG2v-ngFtPxdiQ382fPM1KCyy6Us9xuSDquXYWNGAyZQ@mail.gmail.com>
Subject: Re: kirkstone merge request: June 4th
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Jun 2025 17:17:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117742

merged now, thanks Armin.

On Wed, Jun 4, 2025 at 4:30=E2=80=AFAM akuster808 <akuster808@gmail.com> wr=
ote:
>
> The following changes since commit e42549cef364ae09b3b7c8b64bbeab32e50f1b=
b0:
>
>    net-snmp: fix memory leak (2025-04-20 13:43:55 -0400)
>
> are available in the Git repository at:
>
>    git://git.openembedded.org/meta-openembedded kirkstone-next
>
> for you to fetch changes up to 45bddd258a3d1ded925faf8389e01bb948dc7f5b:
>
>    poppler: fix CVE-2025-43903 (2025-05-25 14:48:44 -0400)
>
> ----------------------------------------------------------------
> Soumya Sambu (1):
>        python3-twisted: Fix CVE-2024-41671
>
> Yogita Urade (3):
>        poppler: fix CVE-2025-32364
>        poppler: fix CVE-2025-32365
>        poppler: fix CVE-2025-43903
>
> Zhang Peng (1):
>        frr: fix CVE-2024-55553
>
>   meta-networking/recipes-protocols/frr/frr/CVE-2024-55553.patch  | 304
> ++++++++++++++++++++++++++++
>   meta-networking/recipes-protocols/frr/frr_8.2.2.bb              | 1 +
>   meta-oe/recipes-support/poppler/poppler/CVE-2025-32364.patch    | 28 ++=
+
>   meta-oe/recipes-support/poppler/poppler/CVE-2025-32365.patch    | 41 ++=
++
>   meta-oe/recipes-support/poppler/poppler/CVE-2025-43903.patch    | 54 ++=
+++
>   meta-oe/recipes-support/poppler/poppler_22.04.0.bb              | 3 +
>   .../python/python3-twisted/CVE-2024-41671-0001.patch            | 33 ++=
+
>   .../python/python3-twisted/CVE-2024-41671-0002.patch            | 196
> ++++++++++++++++++
>   meta-python/recipes-devtools/python/python3-twisted_22.2.0.bb   | 3 +
>   9 files changed, 663 insertions(+)
>   create mode 100644
> meta-networking/recipes-protocols/frr/frr/CVE-2024-55553.patch
>   create mode 100644
> meta-oe/recipes-support/poppler/poppler/CVE-2025-32364.patch
>   create mode 100644
> meta-oe/recipes-support/poppler/poppler/CVE-2025-32365.patch
>   create mode 100644
> meta-oe/recipes-support/poppler/poppler/CVE-2025-43903.patch
>   create mode 100644
> meta-python/recipes-devtools/python/python3-twisted/CVE-2024-41671-0001.p=
atch
>   create mode 100644
> meta-python/recipes-devtools/python/python3-twisted/CVE-2024-41671-0002.p=
atch
>

