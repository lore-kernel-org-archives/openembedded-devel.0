Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF54CCFA750
	for <webhook@archiver.kernel.org>; Fri,  4 Oct 2024 07:45:52 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
 by mx.groups.io with SMTP id smtpd.web10.16992.1728027943037850310
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Oct 2024 00:45:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bnWSryAR;
 spf=pass (domain: gmail.com, ip: 209.85.160.44, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-287c57452d3so206021fac.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 04 Oct 2024 00:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728027942; x=1728632742; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PGqiDUOXOoKFKMljBMzwtUXOQNAVHouL7XtES+Wh+m0=;
        b=bnWSryARklaeh9dors9vyQjAzwB0Ft6orE/3NO6Ky63vu0ConJkOKJUuJbUGGJJvOD
         r80E1Q1jJfDTFyvrpotQi3oEBP686rNQBk0ninalJl5K1O2eodyITWsGdCZuldyDJbU7
         RQSv8K6Et+Z0COa4vbPc7KOBukAxeej3y4SumjJoO2m49l9NxhcdnLoQTt7fdLm5zmki
         jEN+w9CnPIg/owZDLhI3ix4D+/yId8AzQ/Ciu9eOaddz8xXYQYBV0WyiMsMFB0rpHbux
         ysifQgxCWI8xKYJ+Ry4bjCXCWAXnvfgb2XbxLWpMFW9HveZD/kANDQx0JkK/b6c7RYFD
         BOiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728027942; x=1728632742;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PGqiDUOXOoKFKMljBMzwtUXOQNAVHouL7XtES+Wh+m0=;
        b=M9izfIKRLUuXgoGVoXGWg+ZR/wUU/3VxeOTjwlrQd+cGQaAHQhY/ub69CH7gVt2WIm
         oeVLiuPOYh7Cyht1UZ9TgXxZu4DI06b1K2Bt6Z+J6HA/Cmgsc01erMrRTXBTqBSOTnVw
         yTC13wccd3rLbuJCvOvBs3FvmAi75tlP1CwBrN6pf2pohiyrB4FwCvSQO0jtgcrO5epL
         71plKLZqFV7tOtg8rnwtSJedNRzRmE7YGnRFZP/9dv708xNBMbo2wjGwq9SlKtz3plxB
         iyWPygU/9K6ShYHXblPw+cl41PjBPFyOb6FA7GireStEmkSEo3mUruHHh0f4dZoLHxQP
         adrw==
X-Gm-Message-State: AOJu0Yzp914LXE5fqBk+ntfipNFqF6wCT41PY3yWnoZZ+qs6rQUOes3V
	uVZjECuKO58/rEzUFILgXji+tDH9g8t/50HJdw7xpBpzS4gh5Yjg2MScNjs7/HY4rBp+JpJerzL
	FNsTxWSyk0ov+qWmepNFA172gjaQ=
X-Google-Smtp-Source: AGHT+IFP82w92Sl4XVnGZTUforArGlIaw6imCqk6OmaxdBL3dCmOWqF8RxDKAOIu4Mjl03XQh3ENKh6FFGKgdRp+CXo=
X-Received: by 2002:a05:6870:c095:b0:287:3fa2:8978 with SMTP id
 586e51a60fabf-287c1e18d1fmr1897080fac.27.1728027942187; Fri, 04 Oct 2024
 00:45:42 -0700 (PDT)
MIME-Version: 1.0
References: <20240918184731.54155-1-f_l_k@t-online.de> <CAMKF1srYntLyTC+rixg+4UgYB8pyCUB7q26nsJWp5ntKM38OJg@mail.gmail.com>
 <FC14KS.G22B53FBJ0212@t-online.de> <HWLTKS.726242ZDS9WE3@t-online.de>
In-Reply-To: <HWLTKS.726242ZDS9WE3@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 4 Oct 2024 00:45:16 -0700
Message-ID: <CAMKF1sp6W6V9=6T8HjZA0BdcV-GcsA=qkGk_DCK84FhMmcGfyQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] webkitgtk3: update 2.44.3 -> 2.46.0
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Oct 2024 07:45:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112656

On Fri, Oct 4, 2024 at 12:22=E2=80=AFAM Markus Volk <f_l_k@t-online.de> wro=
te:
>
> On Fri, Sep 20 2024 at 02:00:15 PM +02:00:00, Markus Volk <f_l_k@t-online=
.de> wrote:
>
> it fails to compile on riscv64 and perhaps this commit is to blame
>
>
> Yes, looks like this commit is the reason. That missing RISCV64 register =
errors sounds quite unfamiliar to me and I always get lost for hours lookin=
g at the webkitgtk code. I'll check if this issue was already addressed  an=
d if so maybe also has been fixed. If not, I'll file an issue for it. The w=
ebkitgtk update brings great usability improvements for epiphany but is not=
 a build requirement for epiphany 47.0. Also current gnome-online-accounts =
seems to work well without the webkitgtk update.  Therefore no need to hurr=
y
>
>
>
> I had a closer look at the webkitgtk riscv64 issue. The error with the mi=
ssing RISCV64 registers is due to a typo. But once that was fixed, the fun =
began. Despite looking at the code in a few places, I couldn't figure out h=
ow to build webassembly with Jit. However, I was able to build webassembly =
without jit, and since I've seen that there are general efforts to make thi=
ngs compilable without jit, I wanted to ask if jit support is mandatory for=
 riscv64?
>
> webassembly build with jit enabled leads to a similar problem as this one=
 some time ago:
> [https://bugs.launchpad.net/ubuntu/+source/webkit2gtk/+bug/2008798]
>
> It seems to me that riscv64 does not support b3 at all? I'm not entirely =
sure, as I don't even own such a machine, but the fact that this typo was n=
ot caught for the release version suggests that riscv64 is not being tested=
 by CI in the webkit project. Therefore I ask.

Thanks for following this through. I wonder if we should take the
patch from - https://github.com/WebKit/WebKit/pull/8696

