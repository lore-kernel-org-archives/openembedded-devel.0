Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C135C6FD1F
	for <webhook@archiver.kernel.org>; Wed, 20 Mar 2024 17:32:24 +0000 (UTC)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
 by mx.groups.io with SMTP id smtpd.web10.51865.1710955935368266129
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Mar 2024 10:32:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MX7yR+11;
 spf=pass (domain: gmail.com, ip: 209.85.160.49, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-22963f0e12cso86554fac.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 20 Mar 2024 10:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710955934; x=1711560734; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZGwdIb5YYwnmfOR7rzRBQSPj6xjZfMGYXC7i2QZhWnM=;
        b=MX7yR+11h38qB1yXE7DbH5CshB83KwWBckPWo065MmqTJKZ8L7SzSg5vXcvTp1uz/0
         nLguV+8q++4yyMLvkorQGRNiFsXyKegp2FKC3/PmuBpmfmb4bDUQfHja+HWuzveWy/Us
         PcuwakpUF97Eo2+cUvM5DSEzrcbcA7cDb5bWeP+d38U+nBwyaOP7DxZ60fzNtWPjCYQV
         V4jkJ6vL9qpZ4emGOz6ScFjhS7s+nyAzHKU7Cmjd27XJl2YvewRN7Mu8pbpEEifG99sB
         Voyv5J3meIrJ1bx0j0vVHxy5Px+RMHwOkmW9XVk6UlyvOlJI8oW+/z76BTebAlW5U/BU
         S1vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710955934; x=1711560734;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZGwdIb5YYwnmfOR7rzRBQSPj6xjZfMGYXC7i2QZhWnM=;
        b=Zar2klAYQhGUxquKRZyFF+Cpx8oymLU7k87XkzUI++fzQl0TH0Ykf2lSKo7GHjGeRw
         6wlz1cQODCV6XKxmqgR01N40ecsD9N3xMeepeprR3DgweRHGvfSCmnAEuxtzrIwov6+i
         xoU2y/PwRsTlKswK2m6l977ecQs0bKr66cCNkYv89ocb58TxRILkK8Mcz9lbUWq4U7ES
         BDe2P3BhBkrtyFfayqddNcX4/FskUvyj96j1+pNxRf3wZtoE7KQJptktFzd0XpKndQYy
         CNYiLLo7zIQnDtVmjiYX8zFiAzb+FAEe7FdVIcOOSipwyX3rKqIWX/GiX5zbkwokftBC
         QJXQ==
X-Gm-Message-State: AOJu0YzCF5JGXXiJkjpKARFUF4Mn8BeBE2uyxRLajIvgGg3eu8yBBCBM
	uqcfv/oevtv4PCi24cGXl8xcQAQnIrJ+BF9tZ883zM0hMTkHV1gnFAg72nWS52UDuKXWV9SP8Li
	gQdhAipJv/87LFXbBjNVZIt/Nb+s=
X-Google-Smtp-Source: AGHT+IGobSeHfhgNkDt2GuXt/CZOlZ5F5GOQVoBwD4mOl3eKLPS8CLKXkeEviPHdlcWs0ydw7Lq+/UIrnYNLggTWfhs=
X-Received: by 2002:a05:6871:3388:b0:21f:6c9e:d4cf with SMTP id
 ng8-20020a056871338800b0021f6c9ed4cfmr7162995oac.36.1710955934606; Wed, 20
 Mar 2024 10:32:14 -0700 (PDT)
MIME-Version: 1.0
References: <17BE205582F63951.29196@lists.openembedded.org>
 <P19LAS.XNJ0HDKLN7IM@t-online.de> <CAMKF1sr=j4b+r45zt+mvkD0kqUDoWofzLabiFhCDj=RFaDyq0g@mail.gmail.com>
 <CAMKF1sqhYPiFY3AfwDzydNJaJuF8ye_ng2OuynGH6y+uyenKiA@mail.gmail.com> <VVPNAS.FCPMXAAPQ9Y82@t-online.de>
In-Reply-To: <VVPNAS.FCPMXAAPQ9Y82@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 20 Mar 2024 10:31:48 -0700
Message-ID: <CAMKF1srGvQ3d-L=PR4r3H_tMvbb9jwcgMz6kx6FD1LuVebY-TA@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCHv2] freerdp3: add recipe
To: f_l_k@t-online.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Mar 2024 17:32:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109495

On Wed, Mar 20, 2024 at 10:28=E2=80=AFAM <f_l_k@t-online.de> wrote:
>
> On Wed, Mar 20 2024 at 09:22:01 AM -07:00:00, Khem Raj <raj.khem@gmail.co=
m> wrote:
>
> next issue, it can not find heimdal krb5 module.
>
>
> This can probably be fixed by adding:
> PACKAGECONFIG[krb5] =3D "-DWITH_KRB5=3DON -DWITH_KRB5_NO_NTLM_FALLBACK=3D=
ON,-DWITH_KRB5=3DOFF,krb5"
>
> I'll send a patch for the krb issue but this will take a few days, becaus=
e I'm not at home for the next days
>
> The bigger problem seems to be the ffmpeg dependency.  A commercial licen=
se is not necessarily required to use swscale.

Alright, take a look at master-next and I would like to know what
their dependencies are which are not yet in master branch of the core
layer.

