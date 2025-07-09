Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9A59C83F09
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 10:30:33 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web11.12330.1752057027242408243
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Jul 2025 03:30:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ekbpuz0f;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: alperyasinak1@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-315b0050bb5so3836469a91.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Jul 2025 03:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752057026; x=1752661826; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8pr6ZMgBgH+hNi+iS9vzp5tAAmEy4SYe2khvsT4Pd5I=;
        b=ekbpuz0fWY1Mb1/VlImR5cqyaU1rV7daX6dRBijxXtttFtM/nih5eYtxwj/pTWbh9i
         oxb9xXTxb687DHCY8C9OEqXe8B3SuG2TDbmHPkGoYQ28MWU4j7UtlggKTrKP1SShCzpx
         xdEEKutcieP06pKgCJUOSmrECbFpVcuhJl8h9DMI+JRq2RnSpxXP2eiOq253h+eEv8k2
         1u+dENFtfLeK7B2oJVVESEr7fma5ugtViXSJu6G1RNUktZy59yZL1UUenS0h1vjTp6VF
         mx/0y+afL8Rk7LvoIHYWiZehVr635N95mDn/t/8UYnNAav9b4J0ZF40phSJngYk7da4j
         rLeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752057026; x=1752661826;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8pr6ZMgBgH+hNi+iS9vzp5tAAmEy4SYe2khvsT4Pd5I=;
        b=sJi9k8c77r1ngFZdbKIQm+M5msfwXFITaPrSRmmNu22AKHB0t2Z+oh7TXt9tWleaWP
         e2Z2ylh/tq2VudqftjdL3dcpaNbOS1Jy81F56Iv8itCyVImA2ldH7JiEq9drzHJkjsrw
         MnesS31XQlQELN8n8+3L3Cya1VhPfTLoVhv/Yx88P6vAlg4tlIh1zI5KzoPtsKmyqcT4
         GAf4sst3HSZ5vG0Zi9Aldf9rly7MNt6B0MsdQAJqdrDW8b5Xwh5+ZGKDzaAb5UQFP5Jy
         n65+XXpjDe5+Z8ZGVzcI0JC6b4GIUfcp1pYZtGH2CgNs7EjTMdSTUotDhK1SKzNLhI+Q
         nsKA==
X-Gm-Message-State: AOJu0Yxj069z7HNDEbxPrDh3faus0ucF75G9iF69FKDbxaxVb5lyJ69I
	uNOGbaww2LnZqw95vHB6QhPjJ19xZz7XftYOJ3Ua4tUlqleYODAfZVS2kr4rsKBoOZ113Pb6Weo
	e3yiCMzrq+jt4yi08mc5di6/7je2Y2sY=
X-Gm-Gg: ASbGncvmeNG2ELCvKI7pVITHQ5tlRu6INg0YWZVgfEaCN3FIFUnA/57yi7M8EvX6gAu
	mdkLCgtgozQO5hd/70E6LsR/B7XUoNzhKkpQmH77S4qo8Vx8JrM2y7adm+0ZkrCTUR6kRCRtL33
	dMpqwwKpX3TXP8ZMgj0MawAP6mravHspY7gXPOnXy7S7eohyP4EFmXnw==
X-Google-Smtp-Source: AGHT+IGA9SxBvFvENJQHjNYijhxLYzDGtTnrTNWk2ufmyBhhN3UlgD12dqa/k9RFX4vB396BSHTOauCCNL0rk3VShys=
X-Received: by 2002:a17:90b:4a8c:b0:313:d6d9:8891 with SMTP id
 98e67ed59e1d1-31c2fccddadmr2792474a91.3.1752057026495; Wed, 09 Jul 2025
 03:30:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250708195636.1678606-1-alperyasinak1@gmail.com>
 <20250708195636.1678606-13-alperyasinak1@gmail.com> <1e048d60-2558-47dc-ac26-e027926c32ac@gmail.com>
In-Reply-To: <1e048d60-2558-47dc-ac26-e027926c32ac@gmail.com>
From: Alper Ak <alperyasinak1@gmail.com>
Date: Wed, 9 Jul 2025 13:30:14 +0300
X-Gm-Features: Ac12FXx_vHc2A3rsF_-BvnFjXChoaNrHDfPUaFoeZhgpKrWsFEqW_EAPyqH53Tk
Message-ID: <CAGpma=5EOMDjhRe9Qs_t=O7ROqLFg5-7M9EdwE2LP38+bsStMw@mail.gmail.com>
Subject: Re: [oe] [meta-openembedded][PATCH 13/20] uchardet: Add patch for
 CMake 4+ compatibility
To: Gyorgy Sarvari <skandigraun@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Jul 2025 10:30:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118348

> Minor note: this change is actually present in the master branch of the
> project, so technically it's a backport.
> https://gitlab.freedesktop.org/uchardet/uchardet/-/commit/6e163c978a7c13a=
6d3ff64a1e3dd4ba81d2d9e09

Thanks for the heads up, I will fix it.


Gyorgy Sarvari <skandigraun@gmail.com>, 9 Tem 2025 =C3=87ar, 13:26
tarihinde =C5=9Funu yazd=C4=B1:
>
> On 7/8/25 21:56, Alper Ak via lists.openembedded.org wrote:
> > +
> > +Upstream-Status: Pending
> > +
> >
>
> Minor note: this change is actually present in the master branch of the
> project, so technically it's a backport.
>
> https://gitlab.freedesktop.org/uchardet/uchardet/-/commit/6e163c978a7c13a=
6d3ff64a1e3dd4ba81d2d9e09
>

