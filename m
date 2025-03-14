Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A32BC282EC
	for <webhook@archiver.kernel.org>; Fri, 14 Mar 2025 17:59:53 +0000 (UTC)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
 by mx.groups.io with SMTP id smtpd.web10.716.1741975184539245654
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Mar 2025 10:59:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VVE1fzwh;
 spf=pass (domain: gmail.com, ip: 209.85.167.174, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3f8df49e75fso580248b6e.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Mar 2025 10:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741975184; x=1742579984; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2DsHhCKi7jz+8skJFowUGJk59oJtJLGp2BTxYKjY7QA=;
        b=VVE1fzwh1J1uFzgaDh35qaq6EsWBAaMjC2dWoURlAywJ7/DLbi5bFN94iYgbHW9TF8
         ERbW+4hYNS2aJqZgwtxiKZhmwQ6TeVSY4VUj5HwsduPLSzt62N1FTvCN5aQeYjM2n9RP
         CdQcRH3M2AyDru3QP39QlhValIL6pOdlpg0UtYAdmK3PLNE70xybSspCDrM+WhY/JuUA
         v3srJV3Jjq6s+3vk4r14NsKz3kVCw7PW7h8U0AUOpGIi69Jw+avhwm++I5dPNMJ3TkL+
         sUPwtdrOwQR7Uf/6vb2faFDqm43CXwwWtknMrzCKb7IYakIqqisfo5mQh4UA5jJYAcyB
         xYVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741975184; x=1742579984;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2DsHhCKi7jz+8skJFowUGJk59oJtJLGp2BTxYKjY7QA=;
        b=O0OWiSEqVQQHj7uHsfiXbBQyY0CPu1YnUtXw58YcauAEVL/+y3VJjsxfdHnIWEq6OQ
         QxZDGecpyABxYLfoQa0hceD7z5BQAhd2cKEp5wETQhrv8VEhQnLvslXJonLVC3A20UQ8
         KaT8X30s/CPxXok5UfFawMXX9sf+aBl6bmyLjpOxdJGaKnXPg0hg82slLIA7DcijUppY
         cqGxrGWs5O6Cf8X9CXn+fb8Ghz8BWFOs721gvnRocVx2ottXpPCxf4Wz2AoM1STUvaJz
         aB+KMUbrnlPoNOBBgdkfKZTfbdVLRE/k/c+nwaRJEvbhIKQ0cmG78krhtixNkJUqV4Tb
         oINQ==
X-Gm-Message-State: AOJu0YyG0CYmlamdNvlzuqGqOp4c7BIS2minor8bNrtZwasYUvZCct3r
	bH9xNXY5fRbLwtBqDxpvnbEEJpOWYEiZdUQ/uFPfBL+GhieEeUXNlBAL/IF1w/ninnqNvFWicry
	5il5E2o2+vSgaPI/qtgyUQCLsYXA=
X-Gm-Gg: ASbGncv1hiywXJYx37Z1XXNWep1uOajoQuAVwPsV6sdB9tAKLHfxIiMRvL2FdAbHOAv
	ntm/L4sID7Zzfo4oRxR2HYKCorOTlBplO4fpHFDtn1PeXNT1xJUyhI46Qor180gW/doBgDSHpZI
	T/gsBewYOn4z8T8RmHiz4l/cv/W7HF2igSWbuC
X-Google-Smtp-Source: AGHT+IGte0yL+hGTzdExoq80u9o1xb3gFCI8BYfLiUV4zrpC1e/oPcX3ZX5e7haU1gUvkvIP7eXFTz22Zr+o63V5Nso=
X-Received: by 2002:a05:6808:159f:b0:3f7:d033:a0 with SMTP id
 5614622812f47-3fdee36e548mr2043369b6e.4.1741975183638; Fri, 14 Mar 2025
 10:59:43 -0700 (PDT)
MIME-Version: 1.0
References: <wUYw.1741172173148394856.1XeG@lists.openembedded.org> <17040.1741963662509012296@lists.openembedded.org>
In-Reply-To: <17040.1741963662509012296@lists.openembedded.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 14 Mar 2025 10:59:16 -0700
X-Gm-Features: AQ5f1JpMhu5YqgUrUPbp_OzYclomuE2wTavz46P66IYcmA2dpp1q79YUe15DE8E
Message-ID: <CAMKF1so2L2j89OhQL5Y+3OZB7=vPf4b2oiFx4f4xHb_QhJQHVg@mail.gmail.com>
Subject: Re: [oe] Problems adding cppzmq to Target-SDK
To: lukas.weiss@janitza.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Mar 2025 17:59:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115986

On Fri, Mar 14, 2025 at 7:47=E2=80=AFAM Lukas Wei=C3=9F via lists.openembed=
ded.org
<lukas.weiss=3Djanitza.de@lists.openembedded.org> wrote:
>
> I found a solution, this is a problem in recipe. Patch is attached.
>

If we allow empty main package then do we still need

RDEPENDS:${PN}-dev =3D "zeromq-dev zeromq-staticdev"
DEV_PKG_DEPENDENCY =3D ""

can you check your usecase without these settings?

>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#115985): https://lists.openembedded.org/g/openembedde=
d-devel/message/115985
> Mute This Topic: https://lists.openembedded.org/mt/111525960/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

