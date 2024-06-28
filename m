Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A5F0C3064D
	for <webhook@archiver.kernel.org>; Fri, 28 Jun 2024 08:47:45 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web11.12926.1719564459289227297
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Jun 2024 01:47:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BXkIqCeP;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-52cd80e55efso586597e87.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 28 Jun 2024 01:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719564457; x=1720169257; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zOF+b/xOrjhBfBEv0dWqbDoG4Udgi0eum9lN28Yf//8=;
        b=BXkIqCeP+X6A/ZBRmy9cpFDOvYqg0+YI80rey7oNZ3canqYVFN1jGku0xs9YRyhQN2
         7ktdAs9CfQfsqzSjjEFHqfakLAMroptE4cbD6QkgjPxJ8ZEMlGRQawlzfja+sDjYYw75
         vERcRUf6Z9S13PfA5PCySqvkjHPh4HnyvEgDFXToxqGniqpmJAl8eXgweqjp76F07ktb
         7nFeIFWh1d/cYDwb5+54KKRDQS2LDEoBciZF7hjUzYZg84M2ndqWWlDM0a7oowjc2h6Y
         L+xA5HL2UOGcrOv8qnAtzHkcmy5udLtUfeHsHeWwMG079CkYO9i0+xe3dnbcpZKxWAz/
         KYXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719564457; x=1720169257;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zOF+b/xOrjhBfBEv0dWqbDoG4Udgi0eum9lN28Yf//8=;
        b=vg/OnokpMuSNNJnihfWffx5/53fD7tO5/KyEZqd8GUzwbN3qGFsAYrDG+li49HCjcJ
         3MRH3BwAHbKrZwZKA2YJ439NtNmuHL9q/RUXJeBAIWGHMov2ov22EwfC2V24eu0KHrlD
         a19138e/BhyynhVFcAeeUYqXjOoAH9zXE3j5HZ1rzukdlpbiCLltLump/UymSOL+iN76
         Rx+ott+ZHzwsRO0OUd5mqy3lXFTxcM2G3cc7Z5Z6X7bf7SSkh8r3rsy2sx3MXbymMmIl
         RGFUleIgA6YVFU8mhlAwNLADssfhxkxN+Up3o32XPMxXGHVZQjAFjgdppzG5IcB0W98x
         RUqg==
X-Gm-Message-State: AOJu0YxOaLi3/qzxPdO7ZZe4En/qCfClvYiC7ahcg5jop7o+XP78IxTU
	XsLRwSraiAIOcXvE+Sy+AJ4/HsC+l3UcuiVc7lPX7amTmbNFzy9PrnryjB8rGxt+cBBqIeLshH1
	Pce+A5fQTl/H8w+Vngc9QJGS4/LI=
X-Google-Smtp-Source: AGHT+IE737NZTJcS83BJdJvtKOI2v/fq+1OVgTJX5Jaf6VJqrde3kfvt1gnYnP4lwxgeK8X6bH7G15l9hl6oDkITKsQ=
X-Received: by 2002:a05:6512:3449:b0:52c:dbf9:7e54 with SMTP id
 2adb3069b0e04-52ce1836330mr10972370e87.41.1719564457224; Fri, 28 Jun 2024
 01:47:37 -0700 (PDT)
MIME-Version: 1.0
References: <20240521164945.333290-1-f_l_k@t-online.de> <CA+chaQe4am_vJwBgT+zsWMFuxHMbD=zAXvrQOzVjKLuoaqXd7Q@mail.gmail.com>
 <ZQ7SFS.CUMW4YF9DVM23@t-online.de>
In-Reply-To: <ZQ7SFS.CUMW4YF9DVM23@t-online.de>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 28 Jun 2024 10:47:25 +0200
Message-ID: <CA+chaQdiVC7nGWa4YT=MVcxK=DxvCC43YU8hno0+O_2KKqDRVQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] flatpak: add PACKAGECONFIG knob for malcontent
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Jun 2024 08:47:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111146

On Fri, Jun 28, 2024 at 10:32=E2=80=AFAM Markus Volk <f_l_k@t-online.de> wr=
ote:
>
> On Fri, Jun 28 2024 at 09:24:10 AM +02:00:00, Martin Jansa <martin.jansa@=
gmail.com> wrote:
>
> is there some knob for dconf?
>
>
> In fact, there is.
> https://github.com/flatpak/flatpak/blob/92d7f9ec49e2db4ad93040d8e60753179=
1165024/meson_options.txt#L10
>
> Making pipewire dependent on meta-gnome doesn't feel right to me. Would i=
t be acceptable to just disable dconf for flatpak by default?

I'm not using flatpak so it's fine with me (I don't know what runtime
features missing dconf support affects).

