Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90FE8CAC5A5
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 19:03:30 +0000 (UTC)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
 by mx.groups.io with SMTP id smtpd.web10.22500.1758740601409898516
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Sep 2025 12:03:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kbrTj4TY;
 spf=pass (domain: gmail.com, ip: 209.85.219.170, mailfrom: jan.vermaete@gmail.com)
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-ea5bcc26849so156946276.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 12:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758740600; x=1759345400; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pjCZz3ax20+baaRYUg6oVaoN9gd17/0RBUvbwqmPZog=;
        b=kbrTj4TYKmFUWHmeSE8DFJyLFfrCBTijPuTty4zwW9DIsrLcUQeztG+Ic45ho3rTtN
         O4uqdGv21tUiT0X9Tp8oyZgWW+e8wRW/QN1hav9I+20QiLrCGYTP3qK0OvNebDBXNANy
         XwtCriSPKIe7kM+8odo2jj/CYicwfohklG8fZR4corY5Sbq9yKpcoh2da2OGMuw0PWVq
         PHSHaUiHcaUzNF619prd00TN2X/Gs1VX4EFoQtRJMVLOy23IKnQ9s9Qa5TQ+bEaEISQ1
         FXbkMsGTvoi70BgA3c4U0+byelmxrJuN8Zg/vdDdn+VigscApv+dl2QLepkZWQ8CfX5E
         B9tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758740600; x=1759345400;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pjCZz3ax20+baaRYUg6oVaoN9gd17/0RBUvbwqmPZog=;
        b=CyyCAiJiq1hI8k3i3Dz4Og02e5WId5bNJOiiZK3KDX45nBnpsUqtnlGk9LZjbJdsbC
         GLN4NK7DGUP+JeY41wtDozF3jfL9yc07+2DPJPBAADffJUKCQ7C6tiH4XCq7dgtdDIH8
         ZuL64V8g0o1QVWxffCXqLr72zPT/bRMEFUw4Eq8IBkzQcVRcU2fGhanGXxzs54N2+zNq
         GdobhG22rMhIQz+wrCb2k2lxrcQbpCkML3yOe8Btg33yY5a91RRh8thU2sWalKHI2Vwt
         M9j7OAq2Kh8oNhIGMQ0xxSmwtDJfbP9UTHWfCpY0XpiUFKD20ARzrdyHTcT5XHjwRouw
         4ChQ==
X-Gm-Message-State: AOJu0YyI3dI5Z11kZblOG6ZPXQexecC6sXxL74Ofs+WDYWuQYOsvJV07
	ngiqK3lPIX4v2lOtBJoNyJOPLsm5OkLsTIYwEdgJzu7o0yVcp9wJyQEKlohLCDH47s8vzeyMEz4
	4cB0qL/IEKk94ie/1Tsa143QFRhpBzdQ=
X-Gm-Gg: ASbGncu5vsD/FOYjqpdo5wyI4xB3DFQckARbAFRd5Z+A0u0TdrwM0rCRR3uOWxwpCao
	qehhLmzGMoyxm7AnNtAEk2wDgDBuaH/+BGjwGKgXK1FISOzr0rZVpx8/Hpgvx70RP9eseO4zlY4
	HUgJ2XrL7GJnRL1SBxNs9ilI8dgjt74Mk2Y7uFR8JQMlKH2ck2ZQX+s1XcHqhOn1h97ERxVC5f+
	f+18r6In0ObbOSJq8yt6dnOQF60LmE8GZHudvTg+jm+dWoj7Uw=
X-Google-Smtp-Source: AGHT+IG758uycMFE+lxniEMXg5I+STcqhYtfOgpyTWchF7Fvxsx9pY6GaRl58l8Ace65ExFme/SNHnvNKNZb+Whes3w=
X-Received: by 2002:a05:6902:144b:b0:eac:c616:41b7 with SMTP id
 3f1490d57ef6-eb37fc9b959mr901887276.19.1758740600312; Wed, 24 Sep 2025
 12:03:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250924185113.40093-1-jan.vermaete@gmail.com> <45A18B2C-FA43-4EA4-8E79-102E11E5C092@arm.com>
In-Reply-To: <45A18B2C-FA43-4EA4-8E79-102E11E5C092@arm.com>
From: jan vermaete <jan.vermaete@gmail.com>
Date: Wed, 24 Sep 2025 21:03:08 +0200
X-Gm-Features: AS18NWAmoRYqEcRpPkn5DRulCzE62pnxv0whnfsVNjJYTslpSH2OK0hTzAgV2YY
Message-ID: <CABF_=yiLOVcWmOiSYUTvLkUCDD_SYsjCifnAvvvQGo5h2AiSCQ@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-pyproj: added native + nativesdk
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 19:03:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119832

Hi Ross,

I did build the -native within a project with meta-ros.
And checked the doc
(https://docs.yoctoproject.org/singleindex.html#term-BBCLASSEXTEND)
And because the =3D+ looked a bit strang I did a grep on it and found a
few recipes.
On the other hand, I should have done grep on just '=3D' to.

I will send a v2

On Wed, Sep 24, 2025 at 8:54=E2=80=AFPM Ross Burton <Ross.Burton@arm.com> w=
rote:
>
> On 24 Sep 2025, at 19:51, Jan Vermaete via lists.openembedded.org <jan.ve=
rmaete=3Dgmail.com@lists.openembedded.org> wrote:
> > +BBCLASSEXTEND =3D+ "native nativesdk=E2=80=9D
>
> The idiom is just =3D, but did you verify that both actually build?
>
> Ross
>


--=20
Jan Vermaete
=E2=80=9CSuccess is a self-correcting phenomenom.=E2=80=9D -- Gary Hamel

