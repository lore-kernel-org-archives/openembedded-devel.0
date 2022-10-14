Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E5D3C4332F
	for <webhook@archiver.kernel.org>; Fri, 14 Oct 2022 15:08:49 +0000 (UTC)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
 by mx.groups.io with SMTP id smtpd.web10.8348.1665760125883021832
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Oct 2022 08:08:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SauzqjVD;
 spf=pass (domain: gmail.com, ip: 209.85.160.48, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-1370acb6588so6153477fac.9
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Oct 2022 08:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U+NdlC1E0YdCiQB/y0iZuSvyPWkYuWtISg1HffIBEV4=;
        b=SauzqjVDvFXtm3u1PgLR++hjvwwk5j7OjAAU/u0YeRX8N/inL5jh7RvIX/xDGWevH9
         EzDiuVm998jgGqUOv375YqlO+eR948YxEJHOmSEs/CP3pA+a3vr+XTXNn/k48e4NXbcd
         /G3IzkqLpufeNeGS0iNikBHi5ZjcKZvdU/R4KXK/+KlJUrcf94nEfqomWzD2x0UHjASq
         rfHY0u437hyds+Om/voLRcc36F1C0BmiihfDUmSlzgWMgLUcApos0ndlHKFXZmzsEJMk
         0iYIgyyvCwuUqIQGjwRiOGb3yU3kjoBtnQVq2A89QYVvwrCacDzyEZcsaYROSCK8Zkir
         bL0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U+NdlC1E0YdCiQB/y0iZuSvyPWkYuWtISg1HffIBEV4=;
        b=w2YeMp5Cg6Ex1oEEK+KPR2XQgp2QKa+antUq8pgU/aiCDA/WQM5JVemQYlKzRHE24e
         PeOD6EpGZkn/h5dJQgNyiPnfFpsCIWKPfbIQvceHcMwIYNDsF4hjhZ5d0ErrKmjeiYsZ
         +czYzmbkZkiu+LYsm/6tC5K1CpfJLUtQm5RQzOjEI8wNUfkwrhQRgXcAouoJy5Y2dLiZ
         TTq8SFsn2NFB6v5L1kHS4pS68GXAdO3uVB4Z4nlMUqX2wn0EBjz4anYCydniULPwA9U4
         BsSJkkVw+oK9TJ5eFXGNU1BVhSGFOZMMwCZkf67cTLfVs9F7Ovipfa8Cw7EfJSsTM/aO
         aV1g==
X-Gm-Message-State: ACrzQf3FBt71jrG+qY++OvdzOnfQQudkF/t5ChBsSdWPI8B8av87vXvW
	shO6t+Ggq0B5ODaUsCKMe/yS552zDbJIPQFsekdRm1TbXHw=
X-Google-Smtp-Source: AMsMyM59cew3sRVDkLCClnL6wwJZBVeceandHgOe52Ki83Ci7gIDEoG1qAGehdcZmx2IHyqDtbwy16jz5Y8B5712ZUU=
X-Received: by 2002:a05:6870:b00b:b0:127:2d3d:3c16 with SMTP id
 y11-20020a056870b00b00b001272d3d3c16mr8329078oae.262.1665760114500; Fri, 14
 Oct 2022 08:08:34 -0700 (PDT)
MIME-Version: 1.0
References: <1665547429-23508-1-git-send-email-wangmy@fujitsu.com>
 <CANPvuRm1e0ahSFda7VOqpKG-OB-g-8xza7E5_X-csm4QTAr=9Q@mail.gmail.com>
 <CAMKF1sq3tZLuvT+4yeoCui6COj5x58hrApw4COpemz7UjmSkHw@mail.gmail.com>
 <F57949F9-AAC0-4F69-9942-4829C9B296B2@arm.com> <OSBPR01MB1845EC14164CABBA0849ACECDC249@OSBPR01MB1845.jpnprd01.prod.outlook.com>
 <5ACC99BC-0F7C-4E93-9075-B59AE48475C0@arm.com>
In-Reply-To: <5ACC99BC-0F7C-4E93-9075-B59AE48475C0@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 14 Oct 2022 08:08:08 -0700
Message-ID: <CAMKF1sr695viLmmE8nz+wyvfmp9fKCuMkG5vzB+geE3n-17dxg@mail.gmail.com>
Subject: Re: [oe] [meta-oe] Add nativesdk-systemd-systemctl as dependency of dnf-plugin-tui
To: Ross Burton <Ross.Burton@arm.com>
Cc: wangmy <wangmy@fujitsu.com>, Jose Quaresma <quaresma.jose@gmail.com>, 
	"openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Oct 2022 15:08:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99169

On Fri, Oct 14, 2022 at 3:31 AM Ross Burton <Ross.Burton@arm.com> wrote:
>
> On 14 Oct 2022, at 01:23, wangmy via lists.openembedded.org <wangmy=3Dfuj=
itsu.com@lists.openembedded.org> wrote:
> >
> >> Also, why would a nativesdk DNF need to manage systemd units?
> > When executing postinstall, the system is needed.
>
> So this is a direct clone of the systemctl in systemd-systemctl-native, w=
hich solves exactly the same problem.
>

looks like that. Yes, I agree, I guess replacing oe-core script with
python could be an improvement.

> We shouldn=E2=80=99t be duplicating code.  If this is a better script the=
n it should replace the one in oe-core.  If the one in oe-core is sufficien=
t, then it can be simply be extended to build for nativesdk.
>
> Ross

