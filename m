Return-Path: <jester@theyoctojester.info>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0296CC77B75
	for <webhook@archiver.kernel.org>; Mon, 22 May 2023 16:17:21 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web10.495.1684772235143637354
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 May 2023 09:17:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@theyoctojester-info.20221208.gappssmtp.com header.s=20221208 header.b=JZGApxu4;
 spf=none, err=permanent DNS error (domain: theyoctojester.info, ip: 209.85.218.52, mailfrom: jester@theyoctojester.info)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-96aae59bbd6so1178002566b.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 22 May 2023 09:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=theyoctojester-info.20221208.gappssmtp.com; s=20221208; t=1684772233; x=1687364233;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=++4mOibKnQ7PZ5zKOALw2QqFcYivRLr7udWUwCila+o=;
        b=JZGApxu4emS4/DDwoiwK0c0I+Mb4rRPMi6uNqSL+zu1wkJfRxTBt97+6DohfYYddvj
         gGB8h8NEPDBZYrfzkPOSoH8YHCfUNxM4EYEKMYYuDMpBz3yx83LwmsiGPJYL9M8nZkyn
         igdYuEATVxPtDFQxSUDLTsm91NFpJzudp10mg34A2YsumCBLYeqbPfJBXolnGXtsra4X
         Uu9lE8izA00vwLAkh0GtRJcun60B04/nFkcc+foO/yQupdNXkcdcRCA348J2s70oTDuj
         IIT0Iv78h2lF24uKTua0RFL9Ih+UeCGRFYqKuYjHzc+fzdmrq4LVWOBJ9iR74f9R7Z+C
         +CMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684772233; x=1687364233;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=++4mOibKnQ7PZ5zKOALw2QqFcYivRLr7udWUwCila+o=;
        b=W4MirimbC7kSlL2i2fFdjf0c1iKnqj6yDg40KdeWl7ryHCgS/kge90lcgAhjndGow0
         s0UzsDyfDLgRgrHCAnK+aUu8oFwBpFiWYWMZTYTnpT20ObAjwrHuM0swytB2v4FQlbY/
         SRVcwbPsJTtuOwUWq6qsG2pkOYB1iy+APIbleJxQgAtMcWzeJ9cq3emnYNx17aRKYygB
         sxbVlZdiLh6w0nIAxiaOgd8wfF6fjJL8eMs3RR3yZM3SxR/AAUL+lPDFt61YdJH9ZtOy
         eRrkD/2PErfyukIt20oIuxjqIcuzAYa6VRC/X1ODOPEbYHS4YOC66SNnvaVSwomSK0bb
         HYlQ==
X-Gm-Message-State: AC+VfDyI/pHZloo1aiPn3ItaTzl838nGDQfiKVavQxtPIfBdHmRQhoJA
	KkX4ia1ZVNPnDgEnNS7ieRiw3+tJqy2U1rZy3i5+luzWdxzd10Gp4rM=
X-Google-Smtp-Source: ACHHUZ5KWR6hIbLhrjepEn5S1wZld6WhUqztSFLq0oHFfb0iDjzQCJKvkkd7w6wzG34psBvypJ7WKhtL5rZDxX6Fd2s=
X-Received: by 2002:a17:907:928b:b0:969:faf3:7dba with SMTP id
 bw11-20020a170907928b00b00969faf37dbamr10721593ejc.52.1684772233333; Mon, 22
 May 2023 09:17:13 -0700 (PDT)
MIME-Version: 1.0
From: Josef Holzmayr <jester@theyoctojester.info>
Date: Mon, 22 May 2023 18:16:47 +0200
Message-ID: <CAEt6NwqDBzae8wC6qCDPo-sBrR-f5vETedL3211BhSxEWbyVFw@mail.gmail.com>
Subject: Final reminder: CFP for Yocto Project Developer Day in Prague, June
 26th 2023
To: Yocto-mailing-list <yocto@lists.yoctoproject.org>, openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000007ee50f05fc4a9ab5"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 May 2023 16:17:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102709

--0000000000007ee50f05fc4a9ab5
Content-Type: text/plain; charset="UTF-8"

Hello there!

Time is running out for you if you'd like to speak at the Yocto Project
Developer Day in Prague on June 26th, 2023 in Prague, neatly colocated with
EOSS.

You have exactly...*checks clock* 3 hours and 44 minutes left to let us
know about the cool things you built, the riddles you solved, or just how
you use or support the Yocto Project.

So hurry up!

Greetz,
Josef of on behalf of the organization team

PS: 3 hours and 42 minutes now, sorry.

--0000000000007ee50f05fc4a9ab5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello there!<div><br></div><div>Time is running out for yo=
u if you&#39;d like to speak at the Yocto Project Developer Day in Prague o=
n June 26th, 2023 in Prague, neatly colocated with EOSS.</div><div><br></di=
v><div>You have exactly...*checks clock* 3 hours and 44 minutes left to let=
 us know about the cool things you built, the riddles you solved, or just h=
ow you use or support the Yocto Project.</div><div><br></div><div>So hurry =
up!</div><div><br></div><div>Greetz,</div><div>Josef of on behalf of the or=
ganization team</div><div><br></div><div>PS: 3 hours and 42 minutes now, so=
rry.</div></div>

--0000000000007ee50f05fc4a9ab5--

