Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E717C54E67
	for <webhook@archiver.kernel.org>; Tue, 26 Mar 2024 15:44:30 +0000 (UTC)
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
 by mx.groups.io with SMTP id smtpd.web11.12575.1711467866636327663
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Mar 2024 08:44:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZjoSOgWL;
 spf=pass (domain: gmail.com, ip: 209.85.161.49, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-5a485724ddaso3296450eaf.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 26 Mar 2024 08:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711467866; x=1712072666; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FBLU5hZCDP5Ke1bBOqs2frjw8QxbI7dfk81rGXbwoz0=;
        b=ZjoSOgWLQ90ggcw7VSNiKQ1iH/LPnSHW+iFUttkbP6sC+O3ivO+G4gLsOOC3gXx65t
         ZSUWFVQFk7j43zP5S25/JYa978FZnvqdeuDyRXlDl8ZJTghqDV2oB3Nf7PQNg/0I131+
         34w0v+cQWfoSxCgOKb9Z9z8T7LKcNhQw0vJhOW8TvMos6+zvIzYL1M8qyMSYaOZ8tWGu
         YhG8TfJPbozYUEGZ95C6XkdrpiUZOvgxNKqLEKq1AOvYdaIFFPuV/lX1ofn0yaPMKr2j
         SozCe4ORbc0Raxg3FmUF8tglVuGXmKUZjCW5UmjFZ/hFc+zoMY368/R7K0CJpRadJDhy
         8sDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711467866; x=1712072666;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FBLU5hZCDP5Ke1bBOqs2frjw8QxbI7dfk81rGXbwoz0=;
        b=MbsqkgSxoY5i5eg69cI2ZHcB4S2OHPMRPr9R182sMU/4fc4pob9Vt792A9A4fupr3f
         cnbDGGV90Fi8XCvdee8ke91MPNNHWf7Hq7TsnvxBUb4PXPc0ijCvLRxlG/AHZLIWbqM7
         6QEkL1fhGDHdEeW06eTsGrYYS951IU30Kz29dtMNuPiMgvktdvYMWQVHkFW8f4OVUn4i
         0EktmnHethNtZh7FexkoucDnyK+bac7Ho1XBJCkd7ZwXaEYwcVVmIAtWssqz9hQ3qVP7
         y8nEJQvfRLhddwyBeE5UWahDQfbJaWJ77u6KB/rEQFDzXMg/y6ELno+CSdf+4fBdCXhR
         vhlQ==
X-Gm-Message-State: AOJu0YwqFFssSEUbWq7gAGydsXW+4DzdQpE8Od2PoZesk8iKM8b5Nne0
	2eaHhZ6/AyK9HBOju5LxJKNOwLLebhsbklmy1GEH1HhX4lUFcULd1Qnfe3SwNBFTi8Jx8OHEp5T
	3GS/g1m9Vf+fwb7B4MbnaxCKCGH8=
X-Google-Smtp-Source: AGHT+IFrJo2lpuiCEYDx7MIVGc0l+Zf6xq+xtjlcW+Myn8FFKTf2irM7MI5riBrTHgPJERl81AOzs44n1fCcy2iZyMU=
X-Received: by 2002:a4a:e910:0:b0:5a4:6e43:3518 with SMTP id
 bx16-20020a4ae910000000b005a46e433518mr1708378oob.6.1711467865732; Tue, 26
 Mar 2024 08:44:25 -0700 (PDT)
MIME-Version: 1.0
References: <CAMKF1srWVvy9tME92yc16tPVRyjELep1m90ew+ev=9+dtgY9+Q@mail.gmail.com>
 <28797.1711464201221257265@lists.openembedded.org>
In-Reply-To: <28797.1711464201221257265@lists.openembedded.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 26 Mar 2024 08:43:59 -0700
Message-ID: <CAMKF1srJ-hbp2fKy=XZOWiLYJQ_QPEc1f=hjAywaB6V94A4vXg@mail.gmail.com>
Subject: Re: [oe] [[meta-oe][PATCH]aer-inject:add new recipe]
 [[meta-oe][PATCH]aer-inject:add new recipe]
To: chenheyun <chen_heyun@163.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Mar 2024 15:44:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109623

On Tue, Mar 26, 2024 at 7:43=E2=80=AFAM chenheyun <chen_heyun@163.com> wrot=
e:
>
> sorry, i run it on older meta-openembedded,so i dont find this WARNING. n=
ow, i know it ,thanks.
>
> this is note in README:
> "You should find a copy of v2 of the GNU General Public License
>    somewhere on your Linux system; if not, write to the Free Software
>    Foundation,"
>
> then,can i copy  "kernel-source\LICENSES\preferred\GPL-2.0" to files to f=
ix "obsolete licenses GPL-2.0"?
>

I think you should change

LICENSE =3D "GPL-2.0" to
LICENSE =3D "GPL-2.0-only"

That should fix one problem, for the second problem some object file
is encoding paths into it.
so things like __FILE__ macros in code can do so, they must be removed.

> thanks for your suggestions very much!
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#109622): https://lists.openembedded.org/g/openembedde=
d-devel/message/109622
> Mute This Topic: https://lists.openembedded.org/mt/105119602/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

