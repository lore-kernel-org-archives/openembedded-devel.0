Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20BD4E7B614
	for <webhook@archiver.kernel.org>; Thu,  5 Oct 2023 17:01:31 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
 by mx.groups.io with SMTP id smtpd.web10.21006.1696525283840378913
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Oct 2023 10:01:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aafoV4+Z;
 spf=pass (domain: gmail.com, ip: 209.85.160.47, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-1dcbd8a56d6so755450fac.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Oct 2023 10:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696525283; x=1697130083; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dda/QDHFXIE4qRxzdonQ/2XhllU4CLqhtXhiFn9FWzM=;
        b=aafoV4+Z3NB+ctqcXcfeSWUrFXWmHKcsiJ8mHZseWpmeo6qQUG+5CIHxjGnNwoLPYe
         LnLsUT9tIqtKo+IhwyFI6wEd/7c5yXjejFaFOxmmmDZqCY4eRHgb5DKsjo17e1s5K89S
         7OwckavakMUKKXNJE+leahldc8nt4FrdgqUEMHK5JHe6NP/xRD/SrxYSuha0tQgYMrNH
         5jXdZbRQOuhYhwY3+2RXD0JHx87OMwKxtB2Cu6aZWLxH8IovcMPK/ATqbN/lnC1pb0Fd
         eF0KLWuN1bxL2TCan3Ab8PbFwvu3PtEqiC/CAOPNTghjLQUQ1SFaMNGO/FM9V0apFyDY
         5x9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696525283; x=1697130083;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dda/QDHFXIE4qRxzdonQ/2XhllU4CLqhtXhiFn9FWzM=;
        b=Ij+TLcbhMLdn+AZP6SHlXGm9RI8/9U26qCFbvYIqtEnUY3+fFt2xHUSuT4LjvCv2bh
         qKX/hM0s71pC1+vJwG9TgBlxoX/FyChPWZDYyR3gojZdiSwBDk7WpXD+BKVtn8uisYu9
         CQdRhxVc1ALc/7SW6yLpp7Mjjr5wHvcxOd/cDAPZ6SojtcWU7ySme9T6vuBm0mTYcNSM
         4MCx8p2Ht36KaZu/PIOmczsqBwWjuhBqE5c90HHJ0DjgZbJm1rDibCAMLzlqU+obwwQA
         Cg3KNULiC8traFaww0KMUQ6p2MFyvU4tYv9/qXIibDnm4WYbD7cPtg7yd/INQZzsU2t3
         GaNA==
X-Gm-Message-State: AOJu0Yx5xjMbwkUBo4VR6Q27D4iHX5Wi/lw2Rq/FGjvz4SWA9HWnkwAp
	TE6LhOXTURgU9lFK/aE4QiPAGO3WocDSCuctnGM=
X-Google-Smtp-Source: AGHT+IGt97NmJ3vS5m6iX6xRYEHIXYCEch8JDSWJJduKGfVcQOA7Rn8ABeSdyRiN3rWoGK7zhPMLhw4hmBLLjdF3iyY=
X-Received: by 2002:a05:6870:c106:b0:1d6:97:bd7d with SMTP id
 f6-20020a056870c10600b001d60097bd7dmr6187394oad.34.1696525282911; Thu, 05 Oct
 2023 10:01:22 -0700 (PDT)
MIME-Version: 1.0
References: <DB5PR02MB10213DB493B73CBCA0E2D8D55EFCAA@DB5PR02MB10213.eurprd02.prod.outlook.com>
In-Reply-To: <DB5PR02MB10213DB493B73CBCA0E2D8D55EFCAA@DB5PR02MB10213.eurprd02.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 5 Oct 2023 10:00:56 -0700
Message-ID: <CAMKF1sqf=x+1Ar+D58hgcNFQw-Pofz7H-o=vEuBkf_nSCBj8pg@mail.gmail.com>
Subject: Re: [oe] What are the plans for the nanbield branch?
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "OE Development (openembedded-devel@lists.openembedded.org)" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Oct 2023 17:01:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105359

Hi Peter,

We have created the branch since there were some patches moving
python3 recipes to core which were not sure if they will make into
this release
or not. Plan was to keep it in sync with master as far as possible.
Good part is that those python recipe move has made into core in
nanbield so we
are unblocked. Armin
has plans to sync nanbield to master

Thanks
-Khem

On Thu, Oct 5, 2023 at 7:03=E2=80=AFAM Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>
> Khem and Armin,
>
> what are the plans for the nanbield branch, given that is was
> branched off long before the actual Nanbield release? Do you plan
> on merging master into it once Nanbield is released, or will it
> stay as it is and relevant parts will have to be backported?
>
> The reason I ask is because I am currently working on preparing
> our layers for the upgrade to Nanbield and currently there is
> quite a big difference between the nanbield branch and the master
> branch in meta-openembedded. Thus it would help to know if should
> continue to track the master branch for meta-openembedded, or if
> I should revert to the nanbield branch.
>
> //Peter
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#105357): https://lists.openembedded.org/g/openembedde=
d-devel/message/105357
> Mute This Topic: https://lists.openembedded.org/mt/101777064/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

