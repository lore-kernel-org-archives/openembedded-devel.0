Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AECCC4345F
	for <webhook@archiver.kernel.org>; Wed, 17 Apr 2024 06:11:31 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.6114.1713334282987640600
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Apr 2024 23:11:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=awthKQEd;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-41896acb1ebso9129955e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 16 Apr 2024 23:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713334281; x=1713939081; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wbTwWx3kSG+J3jGOx8d1wHUPIwd/AUs+OMcL0jpApuo=;
        b=awthKQEdjtnmdi+z9R8c5gVLqLqp/ljJWcA2v56+AOEhvE0QZQwefYfTbeLNJ0iHmj
         q3KjQn2cTIYOjFbNB8U4E+GU74Mt5bbUrKmIzFll9aRLCZj9smzFcmxA0pcHmPTWVBD2
         S9cQ+voscmdOqIlSyZ1qQbclWXzccaXI50In2wBOlOI3w0NxG2CxIAnhlyAeRG1zJPXK
         wnTXlMqPI0Z2PnMvkC1/6zJwdMA1zJ/d2mjWuSTUlcwIT63FHwglAByCA5N1ULrOX1vq
         cGar24U3oZYce/foiGsKVLjJA2icS5b4m+cMqsVw7PbcczRbB875UB3QtYwx/mEQlYBE
         NFjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713334281; x=1713939081;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wbTwWx3kSG+J3jGOx8d1wHUPIwd/AUs+OMcL0jpApuo=;
        b=Ha9HCSt3SSbfdRyMQvbGlBcZoWGqZocQcYt0ZnLiuMTTV2MTuADFcdctqxdquPtQmx
         u2A/YtdzbTW3dn0nzTXdeA6vuxWT9pK6pi8KSZNnrr4oGxr0j242dw/R6o5MJT147lkr
         J3MaJNwEO/mDrTw4WLXs4y94/G+axnDvYYQud/1K0kLbyIHsDRwLmR5rGCuFSF/THzdM
         wsOhoxWs0UbMTMie1bU898aIcgapXBY841azGnEaZgvx78pm4xc+DphyLiRf6VZwWVhF
         JfzI8/PcehhaNhFgC2Xvh8VFY5gmljHAPXuMgeGFDxRiDS06MsboRNOoB3AhdrpZnfDH
         hNpg==
X-Gm-Message-State: AOJu0Yy6h4AoCzTJ39yCbXBAa3TeA1D/smvhaO8vAeJc4y7sb80O1yfV
	KQlwqFrd6EW0LAalV0bZpVpDN/ho7w3jeu3Ow6XT8lpMZaTtgyDU+OXWEvE7AJs0Yi3clepoLNg
	eLL+bQfg6awWQuHp0tKl/bh1YkPw=
X-Google-Smtp-Source: AGHT+IGSRuEJQSnBiHwee9qu1tXkrtq+gR4h3kifL+3lynDYtswMP9pUMMprrvo9v7RTNa3lkNal5vPbEzkMHN947zc=
X-Received: by 2002:a05:600c:3505:b0:418:4aef:b6ac with SMTP id
 h5-20020a05600c350500b004184aefb6acmr5092567wmq.28.1713334280918; Tue, 16 Apr
 2024 23:11:20 -0700 (PDT)
MIME-Version: 1.0
References: <0c3ae56b-b5f8-4371-a0ac-c1f1444264df@kernel.crashing.org>
In-Reply-To: <0c3ae56b-b5f8-4371-a0ac-c1f1444264df@kernel.crashing.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 17 Apr 2024 08:11:08 +0200
Message-ID: <CA+chaQehGAmMgJ8dWD8G+_Ozv6uycMD0xGE7kC_diYBh9PLAog@mail.gmail.com>
Subject: Re: [oe] [meta-python] obsolete distutils3-base.bbclass error
To: mark.hatle@kernel.crashing.org
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 06:11:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110037

See https://github.com/openembedded/meta-openembedded/pull/811

On Wed, Apr 17, 2024 at 12:13=E2=80=AFAM Mark Hatle via lists.openembedded.=
org
<mark.hatle=3Dkernel.crashing.org@lists.openembedded.org> wrote:
>
> In scarthgap/master, I still have a couple of recipes that haven't been m=
oved to
> using the proper setuptools3-base class yet.  However, including distutil=
s3-base
> fails.
>
> The code meta-python/classes/distutils3-base.bbclass is missing the close=
 "}".
>
> --Mark
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#109986): https://lists.openembedded.org/g/openembedde=
d-devel/message/109986
> Mute This Topic: https://lists.openembedded.org/mt/105566562/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [m=
artin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

