Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17221C3DA7F
	for <webhook@archiver.kernel.org>; Mon, 12 Aug 2024 18:52:07 +0000 (UTC)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
 by mx.groups.io with SMTP id smtpd.web11.54259.1723488720812569276
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Aug 2024 11:52:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DpqjritY;
 spf=pass (domain: gmail.com, ip: 209.85.210.43, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7095bfd6346so2399533a34.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Aug 2024 11:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723488720; x=1724093520; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KPqfCTXHIfwYCdA7FS6kAiSF9gJjFdqpiIQtf7vRhvs=;
        b=DpqjritYVq+0TupxO8AYn2Re2j+rlzoO5iSdJVHUO4zmrI/svVt33YGIo9f2fJPfWD
         BTF13KA+l06DURZeUqunkqO/irP3HAVrcIHf5mFzjsaCWudp2iV+dC5dEy/cqvGkbKwx
         +p8lyPiXZcrkQwm8HY2hJ4vxuCUyAfoKFArzA6zqtk+Biqqb2aZ4tIKSzGoEdL+DMsx+
         4WyDGR/AVz1wouwu4XcRCvkmyqesgz2vg11MnZhIubULc2NPDXq6bQzEupq9MhObfp3y
         2q6cJDPU+pe4yInsIIiQIHPRQLhhssSVeByI2+6p4+C2DHZWKbs/+A7C52OXO53SEZ6k
         ndpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723488720; x=1724093520;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KPqfCTXHIfwYCdA7FS6kAiSF9gJjFdqpiIQtf7vRhvs=;
        b=rSgoJx4u7wyI3HabOgDX+8NQ5r92AFyQSkdYL83Q0gBx0P2P8N4opjhaRi/S5NZ3qA
         jWF41oV8RinJjo+3eayz4odu/47vRhbVZ6Nq5IkJ70j2JF0BDWCKDSAgwnh0OPEsrirj
         DfU9m4Vjj/b0p9qkszXBkFmdrxa8ac2TKkvjhRG4xH/vZHNRxBq0PQyDMehyFvYCzW+b
         icx+CA0nHHHYlE6urVUtr6Yo7RagTbNRhm02zyTNZXPbcuu+iqUPVbzdcc5OFsX2u9vt
         fCAsvs9anm89em9oqJAAQRG7ZscrS3dGxL9wPpHPnaE2KWt0f7ojubkSQjhT0fSAwlKw
         DeBA==
X-Gm-Message-State: AOJu0YxhtlkB+c6ylPxPscAwnIRpeawMAhCRbGi/dnuE7P1mPpVBnHqJ
	8GRpodjMzX4GjcAX6cLRRWHDQTk8AIhdkuoJQ5guLQOKBz8KdSpgQazZh85WTUmSCthAACozsod
	Pgo/UWMFtMjT5/XY9vcKWaDk0HJ1OEA==
X-Google-Smtp-Source: AGHT+IEBQEopoxRjxzymwyLl0SblSdySn1DG+NrYr9/3O9auclZim5ssQGG3qtxz68rRYQY83KhfUpK4z9YICrkLiFk=
X-Received: by 2002:a05:6830:3104:b0:709:4279:8347 with SMTP id
 46e09a7af769-70c9387e676mr1104395a34.8.1723488719906; Mon, 12 Aug 2024
 11:51:59 -0700 (PDT)
MIME-Version: 1.0
References: <92f616b010f11891d2814eb526aded1e5dcaac3d.1723456138.git.esben@geanix.com>
In-Reply-To: <92f616b010f11891d2814eb526aded1e5dcaac3d.1723456138.git.esben@geanix.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 12 Aug 2024 11:51:34 -0700
Message-ID: <CAMKF1sqEsOQ7F_MYJjah5STHfF-vEHrijELcAuJYnOHw9ApyAQ@mail.gmail.com>
Subject: Re: [oe] [PATCH] netplan: add missing runtime dependencies
To: esben@geanix.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Aug 2024 18:52:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111775

sadly this did not apply directly on master, but it is needed on
master so I have to massage it a bit. Please check master-next and see
if all is ok.

On Mon, Aug 12, 2024 at 2:52=E2=80=AFAM Esben Haabendal via
lists.openembedded.org <esben=3Dgeanix.com@lists.openembedded.org>
wrote:
>
> The json module is used in several cli commands.
>
> The fcntl module is used in terminal input handling.
>
> Signed-off-by: Esben Haabendal <esben@geanix.com>
> ---
>  .../meta-python/recipes-connectivity/netplan/netplan_1.0.bb      | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netp=
lan/netplan_1.0.bb b/meta-oe/dynamic-layers/meta-python/recipes-connectivit=
y/netplan/netplan_1.0.bb
> index 229414718c06..cf8d6d19e711 100644
> --- a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/net=
plan_1.0.bb
> +++ b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/net=
plan_1.0.bb
> @@ -34,6 +34,7 @@ EXTRA_OEMESON =3D "-Dunit_testing=3Dfalse"
>
>  RDEPENDS:${PN} =3D "python3-core python3-netifaces python3-pyyaml \
>                    python3-dbus python3-rich python3-cffi \
> +                  python3-json python3-fcntl \
>                    util-linux-libuuid libnetplan \
>                   "
>
> --
> 2.45.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#111768): https://lists.openembedded.org/g/openembedde=
d-devel/message/111768
> Mute This Topic: https://lists.openembedded.org/mt/107853740/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

