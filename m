Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA94CC369C9
	for <webhook@archiver.kernel.org>; Thu, 17 Apr 2025 17:45:29 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.15059.1744911927961567896
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Apr 2025 10:45:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=RoJPutT8;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43cf58eea0fso5411775e9.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 17 Apr 2025 10:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1744911926; x=1745516726; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=77rETHPRd1kmSrOmFKxjeZPm/CpgL6m4ZhK8eQmezkQ=;
        b=RoJPutT8uHtfJVBSd2Vmljo4g1YOSjvwO74LsKDYkkskaTm2nK7lETvhHAYH7o0kI/
         d/1m5Q5AKZpDMBmu451IxpNz432876kNk/N0n6u0DTPFsn6HrnTQBHRQtdjThme/9TsR
         1tQJ/pdkaUgvYqEBEXo6b/qi1NOu/R4HbvdCg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744911926; x=1745516726;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=77rETHPRd1kmSrOmFKxjeZPm/CpgL6m4ZhK8eQmezkQ=;
        b=oKRf4iXN78BDCYXkwFHpoXyEFxOuJblrKK9dCbxvICpy0cegp880M6moJ83KcrUFf/
         XZ9dACrWowXP6SA44I5EMRBcRAapCFjghyP9gjJcWXjDp9GlrWogeYQz7oig6SHLF4gu
         lRyjQyXmIuUh/tC8qBqN4BH7aH8y/zINp+YGqJFa4kIU8R5cK/E21A+BP8gFrUrLFc7M
         pQ0pqHGDHa190QJIwM8QyN0iSGy7PdgyF8SRsbT/8FvtYnCWaYgsWq1p95NWQ++YyOcc
         NFSpBu7JfF686QKu0ksMaR0dv8jGutmjs3sTHVHaaYa7v8t675k1teBmtLiXc3Rrae/R
         RRzg==
X-Gm-Message-State: AOJu0Yxdvuy+imoVwDJgOPlgBZnxNUB4zMaIAKrSZKkiTZyiOT/zTBOc
	qXSu/l2CMNWN8e4Uy0ixKzIMX0J7C4R3+NislmY2Q7Q8GBsTiU5ZxXaQwqBJEt9YS+3pZi3WMlc
	J9iZ37hO4vymn21qaFbbhgpCoaH6vhP47SUX0rw==
X-Gm-Gg: ASbGnctA48SXw2lAkEMonZDT98cB1xtn40pkAccTx5euoQpaBKZGpnq7HlimC0MJxK5
	Y/i0pJaCGZR8IJ9nMlYNZXJO3K49Fy4s6CmGjTR6j4IfbvtO4CYyjuNje5wytlu4OnYsZzPL5Yr
	xrKd34t+H/hncLKXI7aGRIwIiJvRQQyJoheXX36yL3k0XbiSON3KovxZzE
X-Google-Smtp-Source: AGHT+IFpRhOBM0l8XzxcfC1l88A75gO9Zl04I7nhf8BhTBrifIEVSa/nmqXVqv0mVazxTgUzi4hjhF4qXw8R2cGyBXI=
X-Received: by 2002:a5d:584e:0:b0:391:39fb:59c8 with SMTP id
 ffacd0b85a97d-39ef9e9518fmr585545f8f.25.1744911925899; Thu, 17 Apr 2025
 10:45:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250417163912.1060162-1-f_l_k@t-online.de> <20250417163912.1060162-2-f_l_k@t-online.de>
In-Reply-To: <20250417163912.1060162-2-f_l_k@t-online.de>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Thu, 17 Apr 2025 19:44:58 +0200
X-Gm-Features: ATxdqUE0s_ofpxCoLh2IzJJbs_rwBpeVktpUEkpRcpIGyDolr9Qwbru_Ch8qbrY
Message-ID: <CAMSfU+4jg=76Tj5qzHf4OyudZiw8Pj8rPQv69To3X_8pst2U6g@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 2/4] static-passwd-meta-oe: add flatpak user
To: f_l_k@t-online.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Apr 2025 17:45:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116941

Le jeu. 17 avr. 2025 =C3=A0 18:39, Markus Volk via lists.openembedded.org
<f_l_k=3Dt-online.de@lists.openembedded.org> a =C3=A9crit :
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  meta-oe/files/static-passwd-meta-oe | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta-oe/files/static-passwd-meta-oe b/meta-oe/files/static-p=
asswd-meta-oe
> index 1aba2e8d62..b08b2691f7 100644
> --- a/meta-oe/files/static-passwd-meta-oe
> +++ b/meta-oe/files/static-passwd-meta-oe
> @@ -10,3 +10,5 @@ pcpqa:x:621:nogroup::/:/bin/nologin
>  influxdb:x:622:influxdb::/var/lib/influxdb:/bin/nologin
>  mongodb:x:623:nogroup::/:/bin/nologin
>  gpio-manager:x:624:gpio::/:/bin/nologin
> +flatpak:x:980:980:Flatpak system helper:/:/sbin/nologin

Hi,

Anyway you can use 625 as the ID?
There is a kind-of pattern in static-passwd/groups files to avoid
clashing with each other in the long term.

Thanks!
> +
> --
> 2.49.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#116940): https://lists.openembedded.org/g/openembedde=
d-devel/message/116940
> Mute This Topic: https://lists.openembedded.org/mt/112316831/4316185
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [y=
oann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
Yoann Congal
Smile ECS

