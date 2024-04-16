Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EDF4C4345F
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 14:17:22 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web11.21780.1713277035814325679
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Apr 2024 07:17:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=g07LHTNX;
 spf=pass (domain: gmail.com, ip: 209.85.208.173, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2dac79e350cso8571161fa.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 16 Apr 2024 07:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713277034; x=1713881834; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QQHZQWDkQdWgFUzvIWe0pTg8XK8EVN4kEGE9it0Q5ZU=;
        b=g07LHTNX/xaJ2Kr3PQZlApFcomSATWO9nkaS0N15b0Or6iwap4pWRUYqliPGmeCGAZ
         diQDN7Op1jsRtOKKxH569LqD436B0aTlt/X7U9zGrodrCmC/+XPfhTcELBY2NiGUjtUT
         Q2zj8z2o8B+LntlIlbvt9b2uUoV3wcTTuPNPzU85Y/BGpjfw0tRbxRvjmZG7c4K2IXDK
         Gs50Hv07tp8S/BysyXxB/+bqNfN+1vvnhKKQ3D0CfkwgoenGA66YZopneK3gpOMHa2e2
         4ohvlgiRY4EyUuyA2GQ2LiozvEjcF6Q5htG62DK1keJUGg2GVgkKGRJ9+Dt6q1Cg0xEg
         jntg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713277034; x=1713881834;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QQHZQWDkQdWgFUzvIWe0pTg8XK8EVN4kEGE9it0Q5ZU=;
        b=qR5onMXkNAXKEtiUej3wvEujlLZ/LTt0ZFE447esWLW2yeQyVJENIOBOOZuxdGBmD9
         LryMqomd2ZT6wiW3XG5bbWaJEAb4d3rsD92b57ioi4+i0V3t9lCqdrMEzZb9t4nXIn6Q
         7XvvkGbCVHHwHe1prV5yaOC/UMULzosW5u+uB1dHWss3Ex4eafTEwZZoEovo7xF2DSuo
         RMFni9VdRipBpELP4IlO/dooc6fKGZNR7qRmr6v5qmRnAkxBWNUGBXhBP6k28IGS5GRa
         y51SLdVFRZjdDTNt00satXny+rnacaRFbksrZXaZ/VU7KmFX7LUX6XHcE5xuV/Hhlq+H
         qS/g==
X-Forwarded-Encrypted: i=1; AJvYcCVxyNFyq2LGkTE/nmkiDUhLGdYOCnC6xlzEdTvy7mVJJQFPmNYhGIDd/hWxLO/bQ5fT0fONKuZpBxbuasx4N0UOD7/nIsupqqp35Uwvg2DRZAFfwHsum2ym4w==
X-Gm-Message-State: AOJu0YyxrgXbwueVBBSKSdGKdTX16/nBOLcRdMUoCnvPCRV0f1hEAUF9
	73f2y38kZ0HexX2/ev0W29TkbuWXJo1m+OpJ7B5U3CPFju279V+7+Q2ZSwpR1BxZFxaXGH01u31
	2HHg0VL31448WsPLrPgek2bPfdmE=
X-Google-Smtp-Source: AGHT+IEB+YtIbMeRJJ/u7VwxI2hcA/bcR3XeLClU5tP47tqvU1ZQX2bdD85g1gLr9Be5HeytKznmDeubx/zBfPyDKL4=
X-Received: by 2002:a05:651c:b0c:b0:2d8:7fa5:5034 with SMTP id
 b12-20020a05651c0b0c00b002d87fa55034mr10426667ljr.43.1713277033730; Tue, 16
 Apr 2024 07:17:13 -0700 (PDT)
MIME-Version: 1.0
References: <20240415131443.7295-1-marex@denx.de> <CA+chaQcJXRzwTd4Hh=2gYZ7aQQDw3DAFSFq7=KH67-dhgODz1A@mail.gmail.com>
 <743657ad-53aa-4fad-b4e7-ae4ee204984a@denx.de>
In-Reply-To: <743657ad-53aa-4fad-b4e7-ae4ee204984a@denx.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 16 Apr 2024 16:17:02 +0200
Message-ID: <CANNYZj_1F0z6gLxk+i0bGqoqtriePrXyLrziSVXmTU-NDXnzLw@mail.gmail.com>
Subject: Re: [oe] [meta-python2][PATCH] layer.conf: update LAYERSERIES_COMPAT
 for scarthgap
To: marex@denx.de
Cc: Martin Jansa <martin.jansa@gmail.com>, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Apr 2024 14:17:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109979

On Tue, 16 Apr 2024 at 15:55, Marek Vasut via lists.openembedded.org
<marex=denx.de@lists.openembedded.org> wrote:
> I am aware of qt5 being a dead end, but I also think if making this
> stuff build with scarthgap is a one-liner change, I don't really see why
> not enable people to build it.
>
> The security implications have to be considered by the users. Maybe this
> should also be spelled out in the README, for both the meta-python2 and
> meta-qt5. I can send such a patch ?

Again, no. We need to draw the line somewhere, and this is where we
draw it. Martin can of course still push the patch, but I'd be
disappointed if he did.

Alex

