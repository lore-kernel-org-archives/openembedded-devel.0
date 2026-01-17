Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07954C98318
	for <webhook@archiver.kernel.org>; Sat, 17 Jan 2026 09:29:49 +0000 (UTC)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5606.1768642179749035309
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Jan 2026 01:29:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WjODRIEd;
 spf=pass (domain: gmail.com, ip: 209.85.167.172, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-45c798c92edso1763141b6e.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 17 Jan 2026 01:29:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768642179; x=1769246979; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f671XBlpyt69WzsFR4ieWCVTvOsN+OerEhgju5CqPsU=;
        b=WjODRIEd+JcpwCRd2MNCg8iBm1bdkqRGuMRIs8x1nxFdLeYquZ8ditWvrtMXK70HLY
         FQG/SNoWw0ERrgysUlnuQKLpg9of6r8VE2QdUJGZGKKDdaiB8YJb94LKaDQN55M430ua
         xf/6c93DQqhLk1XfQSbo4/KtxEUoBaIzRNYqH89HmzBxEbKOgudDtP/3zfox7aMT/g2z
         9u+stupKq2eeKDtabyEOo7m2fuoeBvrIGmEAvPkoRc3CSer9TpMdrelWuQ55QyCuUv1m
         RWp+DyKpw41JNtRGMb7qbJYJ+bjXREQxzF+HZyT3CGVoHHP1Q74OcPJJDVceaNm9pje0
         pNlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768642179; x=1769246979;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=f671XBlpyt69WzsFR4ieWCVTvOsN+OerEhgju5CqPsU=;
        b=qaI0q/vumxyN7BfY3AmEQMd7atir0hy2+F4IZr9bFhVEZ+tla1rMW90SoYHLp7PT19
         DhdLZqn5RvaCYPB7RPVn2irKGF7bYprJJYGjfGMxaw3UTPtny1Jusvq/VfFa9uzw4KfC
         3RbetraFyZPt0y8k9+KFJVOY8sjTnl164zmCeMUe5Knwr53+XENT5qjVok8nkSP93Fu+
         L82jhjyhOLVyNIi/sTRffopTZIy+dx2Qt2d4qAkflan/DmmcBU3MzfhA3dRxAxjqBUEK
         z7QcMf6tjoAVgv+AWxK12tfdIFl+HKb0cysJtkxhcgVJFMZjoBKdJu86c1cNIwx0QS6E
         bKMg==
X-Gm-Message-State: AOJu0YxFoig7uX00u6kSRh/6Xd0YokXuNHtZAiXusiRIxHv5CmkvSD6f
	KQEqPc3n3BjjVXp13+6Mg/3nDclSnjGcVZAfpUGEEx5PBguo5OwEi/dN7ffP6lzlt9AFKA7EXol
	lkcgog02j4SB2dwA0vMFhptFBT8XFigs=
X-Gm-Gg: AY/fxX5lfhAYabe3g2cjDd7/jVm5ywPxKA7Q014cm/bOmDCtNavFWs3FhRRivBOlxyS
	ulP2Xx7LLqCFQDWn6DJ/C4ZWJuKkvK1iUUB+FIrETnl0lsEEPifzPczPYzQYC9p3l8LhYuMZafD
	yjZ5U52byPIQ1d0tdjd03+gRC7m4ej6xjDV+dnKVOPRcvWKjhcge+QZ4I9T3yNSMBO76uB17Scv
	+Ql7oyN1dR992sXxI5OoSLGzScTeJoYe3pHvr6lpsBAUAtbWmCBqArawORWRbhPs/qVK7A2mrOh
	MNmteeI=
X-Received: by 2002:a05:6808:50a4:b0:45c:9032:14e7 with SMTP id
 5614622812f47-45c9c09228amr2605429b6e.42.1768642178910; Sat, 17 Jan 2026
 01:29:38 -0800 (PST)
MIME-Version: 1.0
References: <20260116075959.111147-1-f_l_k@t-online.de> <CADySD0FQ1TaSHvtcs+7ksBe5NJTmd0VepTnYOYie44T112G9tw@mail.gmail.com>
 <OF309T.INVXHWIQ3QWN2@t-online.de>
In-Reply-To: <OF309T.INVXHWIQ3QWN2@t-online.de>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Sat, 17 Jan 2026 22:29:27 +1300
X-Gm-Features: AZwV_Qi4g5DukaddqV1riIcnHKXw9eLJctfxRiJCt1ZkFjWXITQ_9eocGhDEhH4
Message-ID: <CADySD0Gy3QXFVT=V3zf3fEPJLcuxKXUXX+K=x6Hz_gpst4jm6Q@mail.gmail.com>
Subject: Re: [oe] [meta-multimedia][PATCH] xdg-desktop-portal-wlr: update
 0.7.0 -> 0.8.1
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 17 Jan 2026 09:29:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123546

On Sat, Jan 17, 2026 at 9:55=E2=80=AFPM Markus Volk <f_l_k@t-online.de> wro=
te:
>
> On Sat, Jan 17 2026 at 21:49:25 +13:00:00, Ankur Tyagi via lists.openembe=
dded.org <ankur.tyagi85=3Dgmail.com@lists.openembedded.org> wrote:
>
> can please also include tag=3Dv${PV} in the SRC_URI
>
>
> I guess that will not work since as said the SRCREV is set two commits ah=
ead of the release. If this is really needed, I'll probably need to
> backport these two?

Gotcha but I think setting SRCREV not matching the PV is slightly misleadin=
g.

I would rather prefer backports but let's wait to hear from others as well.

