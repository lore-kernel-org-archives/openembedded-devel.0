Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 743A2C54EAA
	for <webhook@archiver.kernel.org>; Mon, 30 Jan 2023 06:42:26 +0000 (UTC)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
 by mx.groups.io with SMTP id smtpd.web10.35501.1675060941565117601
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 29 Jan 2023 22:42:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hjRc1bI2;
 spf=pass (domain: gmail.com, ip: 209.85.167.176, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f176.google.com with SMTP id s124so9270073oif.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 29 Jan 2023 22:42:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iKIG/it6Bo8jQa1XkPYvRfeDh3z23AnQ+J2IWCwdzlo=;
        b=hjRc1bI2Mjd1Y9ZpHp0xAMlyZhWROLqW3UBj8k5bOmd6Fc6boHIbiyuu4g7qP7Q10G
         kTIbhybUV1To81BKhQwPtQgnFDm6oOTADNf3O2lBK6MlZKf5jBVIqa7HDZtY+/o5hrzg
         8sXiBtt77FgxiXlEfbfMla4gIZdIArg/HKLA9cEFtSjbTaS4uFPGB3yJi2yoFxVEGCRD
         GVnK2kANZuW1nTHxlPijFXncJJQxBPhtnIc3qr+r/AY9ZkdOje48CnloVcHe3XE9CJ3R
         YpqTbx+WxOmqjE+6HJWI3j8eZpRYvmeQ5sEjkNArGGAv86Hz6vFAl8EPnRzwK9KrKeqp
         C3kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iKIG/it6Bo8jQa1XkPYvRfeDh3z23AnQ+J2IWCwdzlo=;
        b=Cyj7+l8Ro43aPE9lvKbsyA7ARRcwvEbSkUeuglajLPu2bKcpE4kGEMdIAdn+qAIdVI
         t0F8OFKDMYpS4TcV6JVHmG9rJzX7Cx+vj5Bt6tWxPNEImYx6m+MQr1thhVx++fPZkC9f
         Sbx2sTFr2pdQgciJUO2Gq9aeerctO2QP5cQKF4fm4t3wobQ4OK9oNqsi+lRrTWnpDXDj
         wL8KUER7tIKqt7fpMJhDpaQIPVkQkzA1OdBPnffMRcQKrQoB2W4TiXxmD1qra1p+lfmr
         phGRXJLjVq+sQzwitsVCN3NZDXBYDamD04fsOTvdiUHzNOCLHK8u0sWCZUIbyfjyExOr
         VJpA==
X-Gm-Message-State: AFqh2koo1NjCRaFE4aVZOVV3aAYUwISD27A+zHgi9mNqKJ8MATUpRvJh
	B87t3jnw74/inV4mUWNL7ZRI9spSmUDxGuJXaJY8AM3EsPk=
X-Google-Smtp-Source: AMrXdXuuNXd/enprGlfvd4sZwTiIG3qpkIqnG1LRwwuaYoGH+gcjZRgYoFojfR8Y8mTlzDpjKdoLawESvXtUhN+k3tM=
X-Received: by 2002:a05:6808:16:b0:36e:f5f8:ccd9 with SMTP id
 u22-20020a056808001600b0036ef5f8ccd9mr1232724oic.55.1675060940593; Sun, 29
 Jan 2023 22:42:20 -0800 (PST)
MIME-Version: 1.0
References: <5hnD.1675059793281797659.30EI@lists.openembedded.org>
In-Reply-To: <5hnD.1675059793281797659.30EI@lists.openembedded.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 29 Jan 2023 22:41:54 -0800
Message-ID: <CAMKF1srLrzrnqEoQnX+m6t=1kePSsk=S0JQopdeb4i62NtXtpQ@mail.gmail.com>
Subject: Re: [oe] Proposal to add recipe for varlink library
To: adinath.mhatre@philips.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Jan 2023 06:42:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100858

On Sun, Jan 29, 2023 at 10:23 PM adinath.mhatre via
lists.openembedded.org
<adinath.mhatre=3Dphilips.com@lists.openembedded.org> wrote:
>
> Hi,
>
> We want to add recipe for varlink library to meta-oe.
> varlink/libvarlink: C implementation of the Varlink protocol and command =
line tool (github.com)
>
> This recipe exists in meta-wayland
> meta-wayland/libvarlink_git.bb at master =C2=B7 MarkusVolk/meta-wayland (=
github.com)
>
> But varlink is an IPC alternative to dbus and its doesn=E2=80=99t have de=
pendency on wayland.
> So, we don=E2=80=99t want to include meta-wayland as we don=E2=80=99t nee=
d.
>
> We have asked meta-wayland author regarding same and he is ok with moving=
 varlink outside of meta-wayland.
> Upstream libvarlink recipe to poky/meta-oe =C2=B7 Issue #4 =C2=B7 MarkusV=
olk/meta-wayland (github.com)
>
> Also, we have asked openembedded-core, he suggests us to add it to meta-o=
e.
> openembedded-core@lists.openembedded.org | Proposal to add recipe for var=
link library
>
> Should we add this recipe to meta-oe/recipe-core?

if it is an independent and common enough tool/library then it might be ok.
someone has to signup to maintain this recipe and keep it uptodate.

>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#100857): https://lists.openembedded.org/g/openembedde=
d-devel/message/100857
> Mute This Topic: https://lists.openembedded.org/mt/96622996/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

