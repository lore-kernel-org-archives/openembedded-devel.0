Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BC06C83F1B
	for <webhook@archiver.kernel.org>; Thu, 10 Jul 2025 18:13:50 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web11.1993.1752171221606869985
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Jul 2025 11:13:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eGHPw8LC;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: alperyasinak1@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b350704f506so1139383a12.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 10 Jul 2025 11:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752171221; x=1752776021; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kplh2JvjGa3DAGYlIf363BiZK7Ovq1mQR7Oju95CGL4=;
        b=eGHPw8LC7G0a3kyAxX7wpnK4KZaPHuPPsGZ2v1RbP2EQPillYpP5SwBNEHmaVI1mFk
         2z5GHyQy58CCBioMG51gR+IzsssQfpSehaPfIg7CZWViyp0hWOHBzoNJblY4TqSoYRHR
         xxlwVz27Q6qT04Me0RDlvT0yOdxxPc0xzV6g9kNKpDnBo6+ZYu6+tsZzRYzGHiwL9lIy
         UE1eh/bViuK7TGM/rtzwKknkB0bGpPIH6f3CfNr2xB/PTfygNUpNRp5R7Un6vKtQnypi
         p7NM1L7GZGf6rQkcYwFvkLJxnuQE71bZxoepJpehJ1cv8nmze8YLApzWKAUpJRLOefX+
         cv1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752171221; x=1752776021;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kplh2JvjGa3DAGYlIf363BiZK7Ovq1mQR7Oju95CGL4=;
        b=m1MygWId/rVwcq4ql+5+jRQelv099PdcRObFuBq1CZwMv+AGkoQ8IVLRg+LmNWBgHd
         ZhQhT0SWqAFWoL40pDQ+pjJo5JaUjHO8//S1sLubo8b9419L2RNOmre0SuWE8wa5ts7j
         2f8FAQE/PjSaaomFN3jtIOW3E8ca6Z452HrZ8KRzzlKh0o0GKwtf5lejt0pqf7vQq6o6
         0oRoIUVEN0q59WakWJS5Z1NEoeqCgpvu6IlObNjc7zawp+adcMEjCN4XyUUyV4Vuey3D
         2xNgNIDSv5jhM8pwdVBcthu1KeCSt9ESt9AspvhlMNvLT2otnAPtfiUdNFVG0iblu5Bi
         bmVw==
X-Gm-Message-State: AOJu0YwsyGuZ8tY2xHFc5wp+60bS3dHk+dT3Urf4Cf6wswjQEMFWEI3Z
	Q+6QyFW+rDt/j/cgxwFIBqT1eJyWTgaX3UvmAOq7OStRqmll0PDpuk7IeotZlhsb2+tLwTJdweZ
	KsVo7Hajnel3k6Dwd+t3UNX5XJzgQwImT8NHn
X-Gm-Gg: ASbGnct+ho4URzPH4E1W87ab+SZ7qAw+MkSRPw/WGS6wSGTJBHCNl31ptG+UvloUksP
	Y61nGNOc4OuVr1cGQuPXQCBJ+0Lmvyt87mfaKsaTG1rL6xtujMHdWLBW/43gZym3lCBQqAydfUQ
	2giRXMzuA+Bjsr8nTF5UFzGjCxvyJ1IbLChAs7aUHI7Ek=
X-Google-Smtp-Source: AGHT+IEDGjl1sZjOZmqsky9DhMOXLtRQQw0N31vzgIj9M6oPK8f/sJU6DwOTgfqVU10xoRqXm3lwwe4SFZf/xoO90p0=
X-Received: by 2002:a17:90b:1c0f:b0:2fa:562c:c1cf with SMTP id
 98e67ed59e1d1-31c3cf1ab0bmr7697282a91.1.1752171220951; Thu, 10 Jul 2025
 11:13:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250709173054.605430-1-alperyasinak1@gmail.com>
 <20250709173054.605430-3-alperyasinak1@gmail.com> <7d94e8f3-71e5-4046-98cf-330a9df9ab07@gmail.com>
In-Reply-To: <7d94e8f3-71e5-4046-98cf-330a9df9ab07@gmail.com>
From: Alper Ak <alperyasinak1@gmail.com>
Date: Thu, 10 Jul 2025 21:13:29 +0300
X-Gm-Features: Ac12FXwm5tBaVLznk85EgN92gPZ_7GnmIWccLx30nS-fE6F4niRyJKDRPWXUZmI
Message-ID: <CAGpma=6jk0F9M0Wad5Xgpum5M0sk88ZY=wmLVj_7hQYAhCnQTA@mail.gmail.com>
Subject: Re: [oe] [meta-openembedded][PATCH 03/20] ade: Add patch for CMake 4+ compatibility
To: Gyorgy Sarvari <skandigraun@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Jul 2025 18:13:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118422

Sent a v2 patch ->
https://lists.openembedded.org/g/openembedded-devel/message/118421

Gyorgy Sarvari <skandigraun@gmail.com>, 9 Tem 2025 =C3=87ar, 21:44
tarihinde =C5=9Funu yazd=C4=B1:
>
> On 7/9/25 19:30, Alper Ak via lists.openembedded.org wrote:
> > +
> > +Upstream-Status: Backport [https://github.com/opencv/ade/commit/8b24d5=
f1286d178fd0d3a22d584e1a798f5e9a6c]
> > +
> >
> There are multiple new tags that contain this commit (v0.1.2c ...
> v0.1.2e), unless we need this specific old tag, I think a tag bump would
> be better over having a patch.

