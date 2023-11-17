Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E38BC54FB9
	for <webhook@archiver.kernel.org>; Fri, 17 Nov 2023 19:58:16 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web10.5059.1700251091314089772
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Nov 2023 11:58:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=DFYwVrCT;
 spf=pass (domain: smile.fr, ip: 209.85.218.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-9df8d0c2505so454090066b.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Nov 2023 11:58:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1700251089; x=1700855889; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aEZUXOIJK/nR7/JPG6qxSoSCQZfaYxgBmKPqtgV7mXE=;
        b=DFYwVrCTWqvhdosGTuBNim/wZIGUg77XEEkNUrx5xVq78JzGDFvL8TtWzB+6TemTzw
         XidKF9A+gapNRrKsYYBW10gFRNZdk5PjOUBfuL2VBGxBbF0BXJ2hXBDaAZNhEnKr7VDn
         FvYXMlpQ/+YFf3VqBHBfrgCkpcieVl/tL4UyLqNpGBiV4pFK95hABlciUH00Y2aPvW/v
         RFfuwcZm4TcXOBkm8t5o+DfWhJdMAJs2JVgN2BPeHqmdmqoJltuaCqscAX+hzc4f+/tN
         72q+qdMEuhS4x0DYJ+AONY9O5OrrivSUNiOzIlTjA4ZhkQZFHR5YobcKsj+F1EUiH2Gs
         QilA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700251089; x=1700855889;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aEZUXOIJK/nR7/JPG6qxSoSCQZfaYxgBmKPqtgV7mXE=;
        b=FSsvJJTdruNe5rGhaIpTa6fk6dc4eDOpC0h0Ztfhv382m/9XSaqp1ocL/zIsY/3ric
         2U8XPFebrA524iFzT6rcSEgKZamUWFBZTDEO9PNZmNOk2275FxMvP85LB/iQqbXyD2pb
         P7xKXo3jdeLxcdj14sB+GBMWv7MYM9M43+vSMtScNFTQ0ec5Jcb1RYS16KL6C10WnQMJ
         UShJ4YnWNAOgEDrDGQKzMZuovdighoMDWseApl53MPA+1faI05Xcmjnd5f9BNSNkN6X+
         Bq41WUV5X68vrIq8erbDjyS71N2GlQR2QHNyl7Rybrca8hGxBfevsPNbRlkLMaJXA6bB
         YxtQ==
X-Gm-Message-State: AOJu0YzNNah55LvFCS84tI309S27OYGhVtHnvxv9SuUa7pB6cqy2KyRU
	K8gVdbbqh+eNFt+i2y4jNpqpeW53ka+3laK8vguZfA==
X-Google-Smtp-Source: AGHT+IFAkVyNcD3pW0vV/BnmC3E/DA6FUCZ9q/0DJgsjv4QRNFrYcP0cSVky/6oMlKYL1d9fN3KdNpsxPYscFlLoZTc=
X-Received: by 2002:a17:907:991a:b0:9ee:29fe:9499 with SMTP id
 ka26-20020a170907991a00b009ee29fe9499mr5840982ejc.4.1700251089329; Fri, 17
 Nov 2023 11:58:09 -0800 (PST)
MIME-Version: 1.0
References: <20231117180208.401854-1-raj.khem@gmail.com>
In-Reply-To: <20231117180208.401854-1-raj.khem@gmail.com>
From: Yoann CONGAL <yoann.congal@smile.fr>
Date: Fri, 17 Nov 2023 20:57:43 +0100
Message-ID: <CAMSfU+6LM4MEkHOkHhYknHpOfsRAaF9A1VMoLpNaUs9QBUDvkQ@mail.gmail.com>
Subject: Re: [meta-multimedia][PATCH] projucer: Refresh patch to apply cleanly
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Nov 2023 19:58:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106877

Hi,

Le ven. 17 nov. 2023 =C3=A0 19:02, Khem Raj <raj.khem@gmail.com> a =C3=A9cr=
it :
> This was resulting on rejects on master
>
> patching file modules/juce_core/system/juce_StandardHeader.h
> Hunk #1 FAILED at 64 (different line endings).
> 1 out of 1 hunk FAILED -- rejects in file modules/juce_core/system/juce_S=
tandardHeader.h
> Patch 0001-StandardHeader-Include-utility-for-GCC-12-compatibil.patch doe=
s not apply (enforce with -f)
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Yoann Congal <yoann.congal@smile.fr>
> ---
>  ...r-Include-utility-for-GCC-12-compatibil.patch | 16 +++++++---------
>  1 file changed, 7 insertions(+), 9 deletions(-)

I forgot to rebuild after the devtool cycle, sorry.

Devtool seems to change the line ending between the commit and the
generated patch...
Smell like a bug : https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D1528=
5

Regards,
--=20
Yoann Congal
Smile ECS - Tech expert

