Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEF97CD8CA7
	for <webhook@archiver.kernel.org>; Mon,  8 Jun 2026 23:12:24 +0000 (UTC)
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.67861.1780960340755717505
 for <Openembedded-devel@lists.openembedded.org>;
 Mon, 08 Jun 2026 16:12:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=JqTlHaaC;
 spf=pass (domain: gmail.com, ip: 74.125.224.41, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-6607048fa62so4897463d50.1
        for <Openembedded-devel@lists.openembedded.org>; Mon, 08 Jun 2026 16:12:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780960340; cv=none;
        d=google.com; s=arc-20240605;
        b=TAqfrHKSZxWTA8iYnFcuMjf7k0u/dDdzxtYNfKB1A/2XOjQ0DlZHsSwdF3aNBtLKxa
         Ma1to3Dyz/OX+0618ddpj6Sc/T7qIhckiWLv6D0y6sLr3HFHeec/E1zgtoW2z3bDwAKB
         M9aAtCggIDurFWUAxd6xmlB1P72vezHeIM6QJJVW/PoOIUFbseB2nxEae4IhLWy7hAwD
         x1Cuk9c0FDGJE+X9pRtbOOYrPkq2fk9LdztzSO71hXAUbYhqb94vioyHs9NMSAlqGH1r
         D93FH3eD7Xhx88LgHQGcfPJpbkPvgGMwXVStzge/Y6S9dqnA90Rnt7MhlnxqF8PJCkAs
         ohPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=aA1PTlIQpUuyoYWfVfMjm+2ss6R/gbA4X45odmD2ff4=;
        fh=8zJdW+oNUiUnP74dbMVZ4YwJbClZ6dA+woNTiwLfAqM=;
        b=ZPuZxF+8v3++FuLh7GG+P4tM94gcH2s/fP2H24jAxqZKfWCuUZXCldRv+bKw7vJvk9
         oSUtoj/B58f7oQ3rs26uc0ep052NsP8BA3Kt+NAqETCYfrv3oErYcJodB4Hz4JIifjEE
         ecn/fl3MdI0Ej26DYQWbzhKeA2DNpw0jOMO8HbXCF9Jgz35fwtM30pqzmsVCvxEEnr6v
         Zuqa2OvRzH2RGgJwPJjQPzEDaBZ5LUKk2rjVQuxnG8nToT8TyyD/SMWQsQ3QmU4CKqWn
         x9LrEJbC6Zq1MlRpijvcuOZmLwZqsJ4Ckndvc+YaWQkRT/E8jdgffCqBk+9Qf3LZegT1
         rPtg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780960340; x=1781565140; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=aA1PTlIQpUuyoYWfVfMjm+2ss6R/gbA4X45odmD2ff4=;
        b=JqTlHaaCWEBH3IvmBzj4OwsoXSqgScMLjhOn3j/9dLGEG7LvjRRpt+RQH7EuHwY5I6
         D7DoN41i4g8GSi7wf1msk2VPR58nNgnpOyLPbAeicAWdHEit9X5k7oazmWDKzmf295jB
         z+/DW+krKivCMCWy4Bt1OVczOfroGxv66IdAQtDGcNoPkz6oiDPhNB1uAM0lY1PoyKzi
         /UVQFeNOq9Dqw2da6tqj5/IM1a/on2fd469gSk6RLS9voX1av7EuA/E+veXMO5Ni2WR1
         Khctn2uZszitkLKKWURxX3FyqrgZnU8wlUF80I2y75p2jtFnXl2fWN23eN/QNm/zNFAP
         1kbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780960340; x=1781565140;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aA1PTlIQpUuyoYWfVfMjm+2ss6R/gbA4X45odmD2ff4=;
        b=Ppp244DfnPTFK/Le1UspHWVR8hNUaSFzKRfIpFl7yg64msMZ6pbIZUp9VKdpePHoLZ
         iG0jKkBTlaYOUMK7FSseZiSale2Cm9tLySmScalOx8miDBJekWX8BJ+qAQUvulhESay9
         2cnE/BuEOoJxffVKqnqkps023f609Y6Qy7Ue9GNyK9SAWYSv6gLknuSPeA6DUclGYE9y
         7jWUI4fj8JpNnPxUmWH1oMNOp6vO35g4V5g96gOrPpvJG3oJLaLQxb1ay7npPSht2Zcl
         Vd/WthHCMkoy3BOR0sTdAlAQs1oLsEUv0k/hclmNwEuyML7qP7Qc+9E61ntE8k8sljl6
         VsFA==
X-Gm-Message-State: AOJu0Yzu+PSDYcylUqlWI4o/od5BQWtBnrsNdJ7EEiMzQytxsFVaxZeE
	7MmBdAmoTjtmZXnf1WVoJ6Fh5eGhRiUspVZeVrFDobAYHwhn9ZNgLFWI98QVhn7QZAo4AhF5dcz
	3LlO7qoWNx3idoh4H4+HI3n5LZsK9FeXPZ+0jVSE=
X-Gm-Gg: Acq92OG7VYn62VsfuG/gCj/mywei/YT+FO4idgxntRy56alkWP80OBdjHkBoAPsMBc8
	E0n5u/tdB5SZH9Sd/p41WYzlUdcgR1jXNolkRWDFbdHL3JkiSyxwla2JtVBtrWb/jLxrbgA5LGn
	5Bpye5+84An0Ga0JWWQ3yLvbIVpaHCMDwaN7naCd2UFVNvazYb4PSh0KdArvks29wC+LrgqVuJX
	/yMEi4qitZAM2jEd0FKswqXFm0KWoEXwqOFYjDUqjX1XdH7bhMHFtGlz1Z8bHITUm/K7Cf3Cq5n
	uMDRWkrLfPbyEeiiAD9vMJ3mhmRF+8DEj3/wtUCvYHq4h9j2Ri6oPTRooRJk+ygjIyX5vRV63rI
	ZcvY8opolf7Ag6mLjdZG2o79s015AWa952Ai3RcJy7AxhlcJAj4dfGLHiHGIQHq/ZNYgYczaZFK
	USJ67i77zyNxSjltM=
X-Received: by 2002:a05:690e:1182:b0:650:39d6:6983 with SMTP id
 956f58d0204a3-6614f5b1099mr162260d50.5.1780960339766; Mon, 08 Jun 2026
 16:12:19 -0700 (PDT)
MIME-Version: 1.0
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 8 Jun 2026 16:11:53 -0700
X-Gm-Features: AVVi8CfDbBfK5TilHLUGGCRVyXEjWZNQGs4oamlw3vCWHyhRwXj3M2m0-IJ9PHY
Message-ID: <CAMKF1sq2JtpgEWVmGAXp1QTmYOiMWyajir-bHDRN56pr_E-bJQ@mail.gmail.com>
Subject: GCC 16 and meta-openembedded
To: openembeded-devel <Openembedded-devel@lists.openembedded.org>, 
	Deepesh Varatharajan <deepesh.varatharajan@windriver.com>
Content-Type: multipart/alternative; boundary="0000000000006930630653c624c4"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Jun 2026 23:12:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127425

--0000000000006930630653c624c4
Content-Type: text/plain; charset="UTF-8"

Hi All,

GCC 16 is now in core, however there are few failures seen in
meta-openembedded layers.

https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/7083446/raw_inline

Any help in fixing these recipes is appreciated

Thanks
-Khem

--0000000000006930630653c624c4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi All,<div><br></div><div>GCC 16 is now in core, however =
there are few failures seen in meta-openembedded layers.</div><div><br></di=
v><div><a href=3D"https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs=
/7083446/raw_inline">https://autobuilder.yoctoproject.org/valkyrie/api/v2/l=
ogs/7083446/raw_inline</a></div><div><br></div><div>Any help in fixing thes=
e recipes is appreciated</div><div><br></div><div>Thanks</div><div>-Khem</d=
iv><div><br></div></div>

--0000000000006930630653c624c4--

