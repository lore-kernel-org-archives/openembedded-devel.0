Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A29AEC46CA2
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 15:59:10 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
 by mx.groups.io with SMTP id smtpd.web11.16899.1703001550244159715
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Dec 2023 07:59:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=i8Onlfo/;
 spf=pass (domain: gmail.com, ip: 209.85.160.45, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-1ef36a04931so3008794fac.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 19 Dec 2023 07:59:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703001549; x=1703606349; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pyqNhyQ1ptvzOjYd4YVJRA/YfMHrU1/diaZZU2SmXfg=;
        b=i8Onlfo/AkIEy0I8IvTNlssGe0hbEBFWF1whU/xGQ4b7yp6CVB6uj0irNSbxSyzM5q
         3FHLoevJFzjehkGI9CfF8+Ia6eWatJKt/NVk3nUZMD/uOWqXpIi1n2mZ0KxfCqqZ/f4o
         ZCEM/pbLzD2CZsjZM7slcP3wqt/1lZpdUmrH8qA+3Io4gBQXd8Z+vd0jG8CaATE444xH
         LKCwghGCAEkPqxw/V8aL9Y6A5RLsJU+xgNReoddoLgKkSqD6kW1jecbbcLTPweEn0Kdx
         MBfJRuGKhD+5HgkPfnBH72Fgts3wBCUVxMmgkRTD3DC5qurM+YVHNwJnPwhOQ/bE+0yu
         To9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703001549; x=1703606349;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pyqNhyQ1ptvzOjYd4YVJRA/YfMHrU1/diaZZU2SmXfg=;
        b=vmuqyYp001tVw3oXqlH5JX6jkSe6MISdiG9Wf5BT2X/TtBYYdOBNogkS39FaLws0br
         AsNMj4Oq3nyZYDta2Q1PlZwzt1Jpygw9Htz4PAYKqqJeijgpcNamwewlB+cxScd5KAC5
         fGt5xiuz0JwcmUP4EmbIFi3VJiHKGPZ3uEXYn5bWKGVvPQEoFO/uk4p+I84vRcOLFqv2
         asWzDn/Leh2r9r+cbds4/f0xl44i1EjdseAyS2pg4raVE4UtZeP5mdF58rflE9bitYw7
         pZRCxKbAAIBu2wg5lrT+BVGhUhtoZegXjpZM9J9V5QjK1caG6ZdEicT3ihrZTZ1VwFhk
         E1uA==
X-Gm-Message-State: AOJu0YyWHa9Zl5x4LdGQyguDcanfsP48ahuv/pi90eBn4Gsmo/84c+cz
	J9vs3r60oRlKAjlFxBbz3+ADWD1poJLOxa5+8M0=
X-Google-Smtp-Source: AGHT+IGGqnd1GWSLN4mKkcODuaNg1QlS2cYl13kZReNw/UZDNCY5mqFbt3rGlZbHVuXBlHokxttaN8+hPZQxooG2Qfk=
X-Received: by 2002:a05:6871:b22:b0:203:d75a:d85e with SMTP id
 fq34-20020a0568710b2200b00203d75ad85emr2602717oab.58.1703001549337; Tue, 19
 Dec 2023 07:59:09 -0800 (PST)
MIME-Version: 1.0
References: <CANNYZj_RSUUieQcKPkmrVft7fGmVHzR4yjL0wFGDBLx_wBghig@mail.gmail.com>
 <8133.1703001181390498333@lists.openembedded.org>
In-Reply-To: <8133.1703001181390498333@lists.openembedded.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 19 Dec 2023 07:58:42 -0800
Message-ID: <CAMKF1sqnSpuH4mKvA2tqMwh+XLOT_Bio42oF-eu1cvJH9U6MAA@mail.gmail.com>
Subject: Re: [oe] python 3.12 - help needed in fixing meta-oe failures
To: nyantra.ranaivoarison@smile.fr
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Dec 2023 15:59:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107636

It would be good if you could send the patch this mailing list as well.

On Tue, Dec 19, 2023 at 7:53=E2=80=AFAM <nyantra.ranaivoarison@smile.fr> wr=
ote:
>
> Hello,
>
> I send you a PR for this error:
> /srv/work/alex/meta-openembedded/meta-python/recipes-devtools/python/pyth=
on3-click-spinner_0.1.10.bb:do_compile
> Here :
> https://github.com/kanavin/meta-openembedded/pull/1
>
> These ones have not been maintained for years, maybe it's best to remove =
them:
> /srv/work/alex/meta-openembedded/meta-python/recipes-devtools/python/pyth=
on3-oslash_0.6.3.bb:do_compile
> /srv/work/alex/meta-openembedded/meta-python/recipes-devtools/python/pyth=
on3-xmlrunner_1.7.7.bb:do_compile
>
> This one should be fixed by this patch: https://lists.openembedded.org/g/=
openembedded-devel/message/107547
>
> Best regards,
>
> Ny Antra
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#107635): https://lists.openembedded.org/g/openembedde=
d-devel/message/107635
> Mute This Topic: https://lists.openembedded.org/mt/103036574/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

