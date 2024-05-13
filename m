Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81DEBC25B78
	for <webhook@archiver.kernel.org>; Mon, 13 May 2024 16:48:41 +0000 (UTC)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
 by mx.groups.io with SMTP id smtpd.web10.65800.1715618920438793638
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 May 2024 09:48:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=D/cc+6pt;
 spf=pass (domain: gmail.com, ip: 209.85.210.46, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-6f0fbfc6f80so374503a34.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 May 2024 09:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715618920; x=1716223720; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3ZLfz+XdOc4k62SAG3iJPUBdluxUOkALdiGqpRIE4Ho=;
        b=D/cc+6pt8pQlo1rjt8W0aDXTnraYZAK4mmCeABbe15tlhE5bDLmbFa9DC/AF5cIgeN
         ukrxmBTp1I9uwFmBJ3mtm+ReGtN3yuvZIJ1VbCKOSLFdzQxoHYLPaWsQENbDWD1qqZZo
         pFDelvq4XBOYZzU8kq/+jaqJdcb5eZqL4dqz+H0KALmGpuC7uv5wncTHyJZT13Sixo+L
         Pb/rHl9Gron7yLOiK06MQfwfrvp36Yi0Z0lXMflTuj3mqqkOT6CBhGylBdA91mTzYtRj
         KA8TMpXbdCOG7g4oqhg7wGXRRa54iUxzhqXNtkanuTiKcnY9PMkW2sP8mip50J6aRaM7
         4rpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715618920; x=1716223720;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3ZLfz+XdOc4k62SAG3iJPUBdluxUOkALdiGqpRIE4Ho=;
        b=PdDL9oa0orjKjWE08++Wlj8lMPmQw/fiVArABnv+z3rQwx+EGeb0o8qfFC8nkPqkp4
         wCWSGaIdK1XpLYOv+VPf9FyH/e0kkxi1kDDihBkeTqZZuytjRXba1Eu10zWVZvk1KJXY
         v/34nyuC8w7jHXgf0/s0/aB3qv/vzc8+UJbbTFqqjH65dZFiN8EBwLHhX+h84k1Z7Kg2
         P3Dhq8FR1+fs2lV4dCDjQdU4CpwSCk9cdO5ll4k5xkNTjCUiPo4AUTKsJc3KdDBa4qET
         DV6NatfP9ceMMo9P5cLSi+Ppi3u3dbFBOyaN15r97YQwCcfmLM+Q20/qYslaimYgr677
         j9Hw==
X-Gm-Message-State: AOJu0YySB6gTOEUIT2dEaiHcHc2YcusS70ng/3lb98N2J3GrhMbGgVtT
	gvwiK4Zb0o/hN0NFt1BNg7Qifi9fGu5z32r8pkjD3qKoajhIdQmeQZYSs9AzSTwl/fTfMlTdIdJ
	B1AULEwemkK23ix90E55KPcvBnNC9eVXioBk=
X-Google-Smtp-Source: AGHT+IHrN+dKQ+hzVOzftcQwQeEOuKLZ2KonX0OePk0zInwfYnnpcvrb2mzycAJmaCA8tifZvyRv8Q2qOG551JJ863k=
X-Received: by 2002:a05:6871:7987:b0:22e:7460:d2a8 with SMTP id
 586e51a60fabf-24172be019emr11883804fac.42.1715618919625; Mon, 13 May 2024
 09:48:39 -0700 (PDT)
MIME-Version: 1.0
References: <CAMKF1so10fduO3FksorrkVw6wUGNLWXqZM5gjf1ucEkZvNbdbg@mail.gmail.com>
 <25272.1715583428346104272@lists.openembedded.org>
In-Reply-To: <25272.1715583428346104272@lists.openembedded.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 13 May 2024 09:48:13 -0700
Message-ID: <CAMKF1sqtpdSbdNKGsvsJOd2q7xRs6UoU1rCfHUYVUbTjK2Bhow@mail.gmail.com>
Subject: Re: [oe] [PATCH] nodejs-oe-cache: fix offline install of dependencies
To: geoffhp@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 May 2024 16:48:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110340

On Sun, May 12, 2024 at 11:57=E2=80=AFPM Geoff Parker via
lists.openembedded.org <geoffhp=3Dgmail.com@lists.openembedded.org>
wrote:
>
> When is the expected next update to the scarthgap branch? I've watched th=
e patch move from  master-next  to  master, but there does not seem to be a=
 visible scarthgap-next branch to watch.

Usually there is a monthly release update to stable branches that
Armin queues up in contrib repo e.g.

https://git.openembedded.org/meta-openembedded-contrib/log/?h=3Dstable/scar=
thgap-nut

eventually when this branch is gone through some level of testing, it
is proposed to upstream
branch via scarthgap-next in main repo.

> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#110334): https://lists.openembedded.org/g/openembedde=
d-devel/message/110334
> Mute This Topic: https://lists.openembedded.org/mt/105884883/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

