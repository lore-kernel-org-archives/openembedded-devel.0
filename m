Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CD95CFB43F
	for <webhook@archiver.kernel.org>; Mon,  7 Oct 2024 13:57:34 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web11.53675.1728309448616027837
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Oct 2024 06:57:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EmO/6q75;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5398e58ceebso3920814e87.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 07 Oct 2024 06:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728309447; x=1728914247; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AFQRWrIh+rqCZNoawqziIeQPCYQPtnms1HCj4vhhx4Y=;
        b=EmO/6q75t4NKtqbUKEZv2mSRN5LU7w6LGiOcrqz6e37dsITc1F28t7fSU0GZPkOF3h
         l88am41qhlBioZq9GfS/gp68G3zn99JFXyxnsn68oj8eoCzlCIcQXxO8Y3JmYLsBUFHX
         PoZwMGIczWuFp0QvpTQtvvENtQ59ptZysX3gPeTgtjNQ/olJW912FZmAJoxo9TqUttn/
         SGwf7RF8YInvq1AniIX78TeiMLsis+Aof8ksBQwrre+VbTG4wsmkcbmR2UcBLFwKbgfX
         mXijfPsLZYY7crOLF1i8CtX6FxZoHS1gIwdokT+FKrgsISXVI/TYX+ZYlcAHqNvW28qZ
         tu8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728309447; x=1728914247;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AFQRWrIh+rqCZNoawqziIeQPCYQPtnms1HCj4vhhx4Y=;
        b=Lwz7TuVI03jXmAguV7R1rBIKb9z9GhjYXNDgRigSrMzFboqGmauT+896OVDtRwIUaI
         k6j9spUY6kH7GD3QFZAhdJ/F8+1/0nn/J9JOLcnJ+BZpOCY029VeePo8YPtAL5RjNKoS
         zROiSJt6oMnB8kNaVtmHe7T7D2diBEzsuBpP567dM+WK1PKUCQg0Z5cjTXSYbDVyrbss
         2eah8JHRRvBBS789Muyj9JO6G8iOeFLqJzPIFVBQYQnsjgIqg2IHPMsdiIbvQBh47nd6
         Dl5GnrQUBQrZMMs6v9ZGNoljE0uj1aE96flWLGIj1pVO1aS8o5oA5VrQiDkWrWq2u6vO
         hCDA==
X-Gm-Message-State: AOJu0YxVjYMfhfmbibzHfY15zZ5LoTSQLav17YQ5mXaMhwNrC/R6fFvo
	SjpcJmsOWaYJCtVm6LFD8gvFZmzondpGXRk/t6WIoIvmpvmuuJA/ppawL4PEMtBRBZYNBrDGlME
	yPx1lSJ8F/MI4QXkuB5wj3ZlEftw=
X-Google-Smtp-Source: AGHT+IEofS2xpxCFBWcAgjBlYAVV7Lht/tE8NIZYHHC2rVyE3mb9qhsEQkw0QZ70mM+ZgoEqLEr9r61mNoYpue4TPhs=
X-Received: by 2002:a05:6512:10d0:b0:539:9ff9:5c94 with SMTP id
 2adb3069b0e04-539a626066cmr5444521e87.8.1728309446440; Mon, 07 Oct 2024
 06:57:26 -0700 (PDT)
MIME-Version: 1.0
References: <ae23174dc7aa9aa7cd5e8fbfbc912bf8d6a3e4db.camel@infinera.com>
 <CANNYZj9FdP6GUi_SzY1_041EHbtbtncM=oCMfN9w8DhAGQ93mA@mail.gmail.com> <8da539dd2dbf56c0a402fb93b0794bec2295b8c3.camel@infinera.com>
In-Reply-To: <8da539dd2dbf56c0a402fb93b0794bec2295b8c3.camel@infinera.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 7 Oct 2024 15:57:14 +0200
Message-ID: <CANNYZj8nMQ2DhgLxXsAR-E2gaKDBKJ-4_RZoY012JbujFaMywg@mail.gmail.com>
Subject: Re: [oe] scarthgap: How to revert zstd from ipk ?
To: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Oct 2024 13:57:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112698

On Mon, 7 Oct 2024 at 15:50, Joakim Tjernlund
<Joakim.Tjernlund@infinera.com> wrote:
> All ipks I have checked has compression zstd for data, assuming all of then are ATM.
>
> opkg itself is built without zstd and build fail in the end when trying
> generate and image, here is one such error msg:

meta/classes-global/package_ipk.bbclass presribes zstd compression for
opkg packages. I wouldn't recommend trying to change that because
that's the only tested option.

Alex

