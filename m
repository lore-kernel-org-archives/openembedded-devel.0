Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A006EE74AC3
	for <webhook@archiver.kernel.org>; Tue,  3 Dec 2024 16:16:35 +0000 (UTC)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
 by mx.groups.io with SMTP id smtpd.web10.23935.1733242591114817877
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Dec 2024 08:16:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=d2U5ngOf;
 spf=pass (domain: gmail.com, ip: 209.85.210.50, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-71db609acddso90015a34.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Dec 2024 08:16:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733242590; x=1733847390; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dd1DgbSaRF044mneiF8hPFnNI3Ki/CneNPPUKCdk388=;
        b=d2U5ngOfNt9Ao1yRkX5QIW55iBQcA0gVw3VrchjLu1Xyl3o6szCCPbkxl/LkWWQeRy
         oryCXh5jMIekxDCUiUOD9/SFh8Iiv8H+qXKKUSN3z9+pukA92X+WdpMrHHhioEQSN/u+
         Uo2H0j0ikHy5uyhehYO6aSKGdRo6nstRtMJva/sVrT8R/5cNWc1BrTcQv1WuY+8MpQLU
         bDHDjB5+N8k25nFmGQTehWJ+pmvrktP50mLyRUZIY/77QFWQEA+qJfo8h+LaP9b6I5nC
         eqvpHc4+1imHkVCA2UKbgd3gvCdkkXwGQilVJmhHOZbJ0ezT0Q9m8Qi2XUDqFiyOa4CG
         7D5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733242590; x=1733847390;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dd1DgbSaRF044mneiF8hPFnNI3Ki/CneNPPUKCdk388=;
        b=p8FrFZwXdgWvvzqkL9GqeOawcMgvkIwsb737S9hnc4Fy9AKMQHMO7Q12ys31Zbptk7
         it3v10Y3vsSBk32Nbq+bNk8gRLRLcvJ3suC7w2+y/BxDtaDt6rjtEOLlRV/eUe9N34fw
         hCjRsH3NmUH5t77l9B6OmV8GOPnABxJ9J0YEcyV+gbj16UMhzlt/Xel1ryTR54QPRp7o
         lyCUaxenBUB0qotEg+YckkgQ+mKpBDjA6n5GYLjsIRsXZEKgqWDZhVc4qimKkFgiF+8L
         E647JqijQ+s43XCWQ0EsPlrpBB/uta2d6RyVbQ/4TlY6WhgTLDY9c3d2h4XbYVEAyQ2K
         689Q==
X-Gm-Message-State: AOJu0YxPEu2JnPzpM/+8Tt1+Yy8f9EHOW6HkjTiS00++e1e3F8ca2VIm
	yIhO7p7WOuzu72lodJXflFmXJw4Q2pksxAagYfhNzIsdZdPOTB64pnnzYMr0W8SOebMt+RGvqqY
	fyJlGm3dAO94NZbDm6vRxsxsjOP8=
X-Gm-Gg: ASbGnctODOer0/e7lY4tHRHEESVLNqPEKWoQO87SYeCBc+KEyR/Tt2v2Fk6kADW4L/z
	lOWszGJ+ukyvyt+H5MBnl21ETOs3MMA==
X-Google-Smtp-Source: AGHT+IEFn0Bnr/9GRKFVIBuJPCm5tgSPZ/dKjIBB6XBIE6EI2Z8kw5OdwH/xVjkYqQ+SAjFx15Es0AnFfR00Nu7rJe4=
X-Received: by 2002:a05:6830:d01:b0:71d:5043:1026 with SMTP id
 46e09a7af769-71dad612881mr3704288a34.9.1733242590390; Tue, 03 Dec 2024
 08:16:30 -0800 (PST)
MIME-Version: 1.0
References: <20241124165419.24549-1-ethan.twardy@gmail.com>
 <CAMKF1sqq7iu2AiQxBX2eqQX0P_sO1of_5ioCp7u5nj2hodYxcA@mail.gmail.com> <D625OBSZYCB3.CNBANSTUR7WI@gmail.com>
In-Reply-To: <D625OBSZYCB3.CNBANSTUR7WI@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 3 Dec 2024 08:16:04 -0800
Message-ID: <CAMKF1sof1An7TXxGavKmCwEe6EW7FMpW8QyYpdxiXNWm_HxbsA@mail.gmail.com>
Subject: Re: [oe] [meta-multimedia][PATCH] pipewire: Add glib-2.0-native dep
 for bluez5
To: "Ethan D. Twardy" <ethan.twardy@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Dec 2024 16:16:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114184

On Tue, Dec 3, 2024 at 7:03=E2=80=AFAM Ethan D. Twardy <ethan.twardy@gmail.=
com> wrote:
>
> On Fri Nov 29, 2024 at 5:28 PM CST, Khem Raj wrote:
> > Thanks for the patch, it is not done on top of master it seems. Please
> > rebase it on master and resend if patch is needed for master
> > otherwise mark the release branch in subject prefix. This will help
> > route it correctly.
>
> Thanks for getting back to me, Khem! I will rebase onto master and
> resend the patch shortly. Please forgive my question, I'm unfamiliar
> with the OpenEmbedded development process: I'd like this change to be
> applied to both master and the scarthgap branch, since I'm currently
> basing my work on scarthgap. In that case, should I submit two patches,
> one to be applied to master, and one to be applied to scarthgap (with
> [scarthgap] in the subject line)?

yes

>
> Ethan

