Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F213C77B7F
	for <webhook@archiver.kernel.org>; Mon,  8 May 2023 14:11:19 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web11.108446.1683555074228724504
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 May 2023 07:11:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=aECS4pfU;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.45, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-50bd87539c2so7272958a12.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 08 May 2023 07:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1683555072; x=1686147072;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OaaomZh5nTo7lC0WK/B0CUCoYAc2u5GAjlMj8mij9gE=;
        b=aECS4pfU3Tf8X093QTts6JizCskPXK3cYOu9tTg3zpBktZw4QUG6hnGTc9IRitPTBR
         zCFbu4Rn/ipaKEW6MwlakqIHUcPjjgmiOmzBNK2sNpQgOjT2za6D2HTomaxQMOKU42H3
         uMntCgWAOe/OGFf+0m7NXbQNsTq0O+R2LGz0p3lvZcC9jlMvMpr1mSQ4f8cQhrjfLdxL
         XoIgCbWYZe7dnzrmygtG2WgzPo3Y+Z3WiY9DS3MXaKcAZsf/v3x52XmJa4MuiB286pNL
         pxCV0o56Im4OFBBYA+/4sdsg9fAEHzO4T6C9Bj3RfsJ+aAl/AeUefGrcP2K7i3eCx3cv
         xPpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683555072; x=1686147072;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OaaomZh5nTo7lC0WK/B0CUCoYAc2u5GAjlMj8mij9gE=;
        b=GMx16OC0QK0TudJcozgQkPLu/yYhO2kn+ODdo6O3PWyyJH1ZECX7FZNn19RdhkQgmO
         Xen0ntgLl27tMpOmHvi+L41xdR8b1bohp9mTuUAvheTkyma4Ce991KwXKa0WrWvaBa4W
         Tfvt8E9Db4kHbmsPC7+5uVcObr2pjXDfyhHevBks6w4AygX9wnmsv+8tVXDBsbP3nVB3
         tEVNwzXg0FqJjaW+pIdaGf9qv6lK56WHK3VlNVfZkdIZzejW2qt3vF/Scp82Si7+xXOm
         5Z7YEkfsHN6AN4OZR5B8TVItrlhMglAcXCpDGCaaPChiyndSPuST+oqLYh+zP9KgfXGk
         MDGA==
X-Gm-Message-State: AC+VfDwYF53LKBY4hnSGurIACl/y5UTgQKbElUuzEUvsgi1XnHdzpSui
	8IXhJCduv5/b3me16z9uzrXs51IlnByfVmkQVGTt4A==
X-Google-Smtp-Source: ACHHUZ6f1gie7HxBnpzzjr5mY/6Q8GLWxw6okwtI+6dc1tvD52QHYWZHU5lZEQqgL0DCQsKy+rBVZiCG8uSn6N309mQ=
X-Received: by 2002:a17:907:3e27:b0:965:b517:89a4 with SMTP id
 hp39-20020a1709073e2700b00965b51789a4mr8189739ejc.56.1683555072092; Mon, 08
 May 2023 07:11:12 -0700 (PDT)
MIME-Version: 1.0
References: <653e33ab-8ccd-fbc8-a3a1-24faa822e5bc@windriver.com>
In-Reply-To: <653e33ab-8ccd-fbc8-a3a1-24faa822e5bc@windriver.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 8 May 2023 04:11:00 -1000
Message-ID: <CAOSpxdZH4x5BkxziAJWvFsRkPqbZdSXNk9YJnB7UGjqLGEKJ3w@mail.gmail.com>
Subject: Re: [oe] nss: dunfell intermittent compilation error
To: randy.macleod@windriver.com
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>, 
	"Mali, Narpat" <narpat.mali@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 May 2023 14:11:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102441

On Mon, May 8, 2023 at 3:49=E2=80=AFAM Randy MacLeod via
lists.openembedded.org
<randy.macleod=3Dwindriver.com@lists.openembedded.org> wrote:
>
> When Narpat and I were testing chromium-112, we noticed an intermittent n=
ss compile failure for dunfell:
>
> /usr/src/debug/nss/3.51.1-r0/nss-3.51.1/nss/lib/freebl/gcm-aarch64.c:91: =
multiple definition of `gcm_HashZeroX_hw'; Linux3.4_aarch64_glibc_PTH_64_OP=
T.OBJ/Linux_SINGLE_SHLIB/gcm.o:gcm.c:(.text.gcm_HashZeroX_hw+0x0): first de=
fined here
>
> It's intermittent in that a bitbake -c clean nss and a recompile worked. =
We don't depend on dunfell other than as part of the chromium update testin=
g so all I can take time to do right now is to report the issue here in cas=
e someone else wants to work on it.
>
> Similar errors have been seen by buildroot and tracked here: https://bugs=
.busybox.net/show_bug.cgi?id=3D12501
>
> If you run:
> =E2=9D=AF git log --oneline lib/freebl/gcm-aarch64.c
> 2cf7fd12a Bug 1580126 - Fix build failure on aarch64_be while building fr=
eebl/gcm r=3Dkjacobs
> 02cb61a77 Bug 1559012 - Improve GCM perfomance using PMULL2 r=3DKevinJaco=
bs,jcj
>
> then 2cf7fd12a seems like the right fix but:
>
> nss.git on NSS_3_51_BRANCH
> =E2=9D=AF git tag --contains 2cf7fd12ad2895b13c9dea6717843bc15ca46ca3 | r=
g 51
> NSS_3_51_1_BETA1
> NSS_3_51_1_RTM
> NSS_3_51_BETA1
> NSS_3_51_BETA2
> NSS_3_51_RTM
>
> so it's already part of 3.51 unless we somehow managed to revert part of =
that change and I don't see that.
>
> Has anyone else seen this error on dunfell?

I don't recall ever seeing this in any of my dunfell testing.

Steve

> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#102439): https://lists.openembedded.org/g/openembedde=
d-devel/message/102439
> Mute This Topic: https://lists.openembedded.org/mt/98761347/3620601
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [s=
teve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

