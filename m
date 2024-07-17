Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31070C3DA62
	for <webhook@archiver.kernel.org>; Wed, 17 Jul 2024 19:24:11 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web10.1731.1721244241535071082
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Jul 2024 12:24:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MiUTqgxT;
 spf=pass (domain: gmail.com, ip: 209.85.208.174, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2eeb1051360so989951fa.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 17 Jul 2024 12:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721244240; x=1721849040; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vT6qsCovPZXtznoNv6EN+VmfG9XHo5oSZzg53SbdmbI=;
        b=MiUTqgxT21yA/OIL8XPzZyVvj9LkawHZdnPnKPk2vbIRIRZ9+t0uvFvhtCpVB/lChZ
         14VUCnPfPUYWAklrrL9Lj+grvowBRsWlU0ck9Tv85YqW/LZG41k7d8fIgt9GqpjOnls5
         NqoD1fir97iKC2CEw8x1icOP78MEgquf/bKi93Ay2uOlKnmV0LLtuW7Z0zbOuzCUimQ8
         NfVqhUo+PgQsQ1Z1YWH7nxSBBqDnZ3M9yEUfsreylrPQ7MG1TtE3/pZCGG6CMsIMvSRi
         quKz/VtZXTQNpN2u4nuzRfCidQHYcyr92M03GLWBkZmmVxlI9IFUl54gK+pbOzbH/z+7
         4dXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721244240; x=1721849040;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vT6qsCovPZXtznoNv6EN+VmfG9XHo5oSZzg53SbdmbI=;
        b=aMhmc/D/aEs/KKEvEIAdbuYyNyBpy2qINd9z/JWbdW+AwBjPRbzX8nsy9OaYoHDMMf
         jya24E85RAvwDyWwy20Cba5YBhB3cJQvGSRuPFWF25ZrCoVXSyv2Exsbnz4BuoDsQ1xG
         hRmy9QPKCzwIukVeaLIsaQDSEHyjqD5RhN7JDPPxdBzzy93yefTQZUEOZwPRQduI+Izf
         MhWYV4IOsPetTuhhysk/J7Y0tgKK/Q0X1hiOoPtGCpexRYM90ClzpUW+w61Rp/9vjXDf
         4UFawZMmK8gT07twuiGvDsdKgTzfG33c5krwvMUNFhfgucbiDjpaX+tR5Po6D4y7fdIH
         mJzA==
X-Forwarded-Encrypted: i=1; AJvYcCWstfMPcvBsWFNimC+6Bunq0gjJZmKjxHCc6FJ6eJ9DUKXPpapJcLHTI+Q7vo+xxaOER3w3v1Sb7uOhl3f9e3+wy7NZ9dQl1nqPjzjKowChpa2jhdjI/oEZVQ==
X-Gm-Message-State: AOJu0YyldwHvL1RJQWnqVwFjiiEbK9U7vhX/iGcVLlZPPpFYmWiQWmLM
	JufhcSRmLB32b1HKlGhTKG0i49m5B7seJnZEi6iQr/BZnsj0m6ZfSex7FwaL5xr6csbpV8YQEmi
	WNPsAkrK8ysqYsyjBD02L1nZk4sw=
X-Google-Smtp-Source: AGHT+IF3NWum1zslI7395syCqASgeFfqugn4l5nUP5b51tl4Qs8pFXU3H3O1CQ2gtXyC5bg2/Uv5B+yI4Or8gsd2ekw=
X-Received: by 2002:a05:6512:2811:b0:52c:d8c1:8d15 with SMTP id
 2adb3069b0e04-52ee542d7fcmr1970006e87.46.1721244239328; Wed, 17 Jul 2024
 12:23:59 -0700 (PDT)
MIME-Version: 1.0
References: <44e317f2-4858-4031-b95c-052d67ce3969@gmail.com>
 <CAMKF1sp=q+YD8yJR1K6vKf7Nwm8sCZQuFcjN=R0JtGbGZMffPw@mail.gmail.com> <CAMSfU+7qHYJCJGqesipRoQ+Cj84WGNcJT-gCyo-RroOpYO5ikQ@mail.gmail.com>
In-Reply-To: <CAMSfU+7qHYJCJGqesipRoQ+Cj84WGNcJT-gCyo-RroOpYO5ikQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 17 Jul 2024 21:23:44 +0200
Message-ID: <CA+chaQedFHY1keVbpvCMhdkSeD909ri5mLKnC3Z7nYPGkfNiew@mail.gmail.com>
Subject: Re: [oe] scathgap merge request: July 17th
To: yoann.congal@smile.fr
Cc: raj.khem@gmail.com, akuster808 <akuster808@gmail.com>, 
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Jul 2024 19:24:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111384

On Wed, Jul 17, 2024 at 8:49=E2=80=AFPM Yoann Congal via
lists.openembedded.org <yoann.congal=3Dsmile.fr@lists.openembedded.org>
wrote:
>
> Hello,
>
> I sent 2 backport requests for scarthgap that were not in this merge requ=
est:
> [meta-oe][scarthgap][PATCH] packagegroup-meta-oe: fix lvgl inclusion  htt=
ps://lists.openembedded.org/g/openembedded-devel/message/111364
> [meta-oe][scarthgap][PATCH] openbox: fix crash on alt+tab with fullscreen=
 app  https://lists.openembedded.org/g/openembedded-devel/message/111369
>
> Armin, can you tell me if those will be considered for the next merge-req=
uest ?
> No pressure, I'm just ensuring that they are not lost somewhere.

#metoo 2 patches from 10th July:
https://lists.openembedded.org/g/openembedded-devel/message/111291
[meta-oe][scarthgap][PATCH 1/2] giflib: fix build with gold and avoid
imagemagick-native dependency
https://lists.openembedded.org/g/openembedded-devel/message/111292
[meta-oe][scarthgap][PATCH 2/2] bolt: package systemd_system_unitdir
correctly

Thanks

