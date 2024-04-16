Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45DA6C4345F
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 14:27:22 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web11.22001.1713277634167223380
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Apr 2024 07:27:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YarXRLEO;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2da888330b1so34879611fa.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 16 Apr 2024 07:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713277632; x=1713882432; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nVsSQ6P/R2v9H16c37+sPG6dJnSyT6fbQWDOkOiypw0=;
        b=YarXRLEOwTwAVq/G2zjfk5ZzKDE1XAaoMaTk9F4ybr/w7w1LD7hOqJM0FfiYAzmeBG
         4mlIm1bBjD5cryfT2HcW5y0MKI2R6n4n1WkKSTHw6p368Tu5/YWTabo0AIP3QqMAkZBT
         XtLV1otn8pWlIoQS9oVUUFE7brlS3LPs0zzc0BkY2VfIEPO61gck7zjeIWnRxHY7VyZg
         5It2+h7pkOEAqCA0xeiwpHHDYFTtguGxPoYzOXlfDojalivjadourScd9KweTZ7GERVZ
         mN/AJ+/4aeaxLyrWaWXTpe1U8CkyyORm7wkWMQO+gEB1e73Qp7klZDgJNKyh8T9HhOOd
         qbQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713277632; x=1713882432;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nVsSQ6P/R2v9H16c37+sPG6dJnSyT6fbQWDOkOiypw0=;
        b=gsnjQP67j1mFzHo3ybcxUoxcmvVwZlFk3bwI80ne3hktgAs9x1jYEbPXI8maFg+lqV
         8TMB6iDahnlt2p66EQbYd3L71nb6mTDPU7QnojCiG/QCg6T3342k4jmbU7nVTarYI5X/
         09xrJ6lQiGUB23AtY2uQeHU88Sya20nuQ6wXCYg+/bPfs9FDAFXcLpKmxQMo/L88qnRL
         pJ0PcTk590z+rMlJzmQnavDTbnmDIGP/fHLbyTn113GiNfcvpOM6Ia5yP6cRrEd2rIP/
         8FXJHyEU39e6Vt3Sf2csgE1MPm3dyXIbIIpU/pBSRdGN3yhwaPrxpNO7P8fqsXHZLJUn
         enhQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdL9Ibv3IqUxDdMNao0mB2f2gkDOvSVaYvdFwvcbdhwYYLVuMHwyU1KkOQk96BqHLbyERDbdq/168ta/Ui1o4btKgv0Tl0y3JiHo8poSUiKWtjBNMe6XsqNQ==
X-Gm-Message-State: AOJu0YzMtacaoQ+ra9tTWtp55Lwk2d0xN0EzK7z2CQHPzK9psqFQNyQy
	4JW9n561mi2V+IpIPTb0cZEw5LU2XVSepLsixuZkZ31+siIeJfjxvzNhbqwS/WiDi5XMOAORNOV
	ZXabGfCtOP5TSd3k+Hql+p4MEfwA=
X-Google-Smtp-Source: AGHT+IGUu5pnDsjQ3DOMtw+NHIsHNkGWWf5kJoIV28eQJxaFNr3kZ6VukF3a2HK99efJSleaQX8wEZDz72JBb0S52N8=
X-Received: by 2002:a05:651c:170c:b0:2d9:fa96:1634 with SMTP id
 be12-20020a05651c170c00b002d9fa961634mr7408117ljb.25.1713277632059; Tue, 16
 Apr 2024 07:27:12 -0700 (PDT)
MIME-Version: 1.0
References: <20240415131443.7295-1-marex@denx.de> <CA+chaQcJXRzwTd4Hh=2gYZ7aQQDw3DAFSFq7=KH67-dhgODz1A@mail.gmail.com>
 <743657ad-53aa-4fad-b4e7-ae4ee204984a@denx.de> <AS1PR10MB56979F3C20FEAA7E4EA855CEFD082@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS1PR10MB56979F3C20FEAA7E4EA855CEFD082@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 16 Apr 2024 16:27:00 +0200
Message-ID: <CANNYZj-idDTJMihKSJYZCf3R16d1qYajfBC6AscGigR91UeqLQ@mail.gmail.com>
Subject: Re: [oe] [meta-python2][PATCH] layer.conf: update LAYERSERIES_COMPAT
 for scarthgap
To: peter.marko@siemens.com
Cc: "marex@denx.de" <marex@denx.de>, Martin Jansa <martin.jansa@gmail.com>, 
	"openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Apr 2024 14:27:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109981

On Tue, 16 Apr 2024 at 16:19, Peter Marko via lists.openembedded.org
<peter.marko=siemens.com@lists.openembedded.org> wrote:
> Following works for yocto kirkstone + meta-lts-mixin kirkstone/go + meta-lts-mixin kirkstone/rust + meta-virtualization master
> LAYERSERIES_COMPAT_virtualization-layer += "kirkstone"
>
> meta-qt5 should be able to do something similar with meta-python2 if meta-python2 is frozen...

If I remember right, meta-qt5 does not need target python2, it need
only native python2 because the qt5 web widget contains a badly
outdated chromium. So meta-qt5 could just copy the python2 recipe
directly into the layer perhaps and drop meta-python2 dependency.

Alex

