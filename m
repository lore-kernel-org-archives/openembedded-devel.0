Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C278DC00144
	for <webhook@archiver.kernel.org>; Fri, 29 Jul 2022 11:56:33 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web11.7034.1659095792024547112
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Jul 2022 04:56:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EMd+teoa;
 spf=pass (domain: gmail.com, ip: 209.85.167.51,
 mailfrom: rybczynska@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id b16so6973739lfb.7
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Jul 2022 04:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=wfsSIH2WiJxtpfJLihsSDniCtUl0kt4gblCRIOM16mc=;
        b=EMd+teoadxxX2su4DPFHYh5+6P3lMZLvD/islfsi4qBVxJy9MvgcDTQFxKhEeiZ/AX
         sJV/YUwGk66/KxhILzEj3Vysqft7XsV0HqaddQfFTkv6XjXsA95ZQsz6T6ZI3InLetYn
         MT+zYWWGP4KYhounHYi/iB11+tGeZHgreqN1+IBpyrbvWLp34ExAexjfYVuythELRLYt
         AheAJIP3yK6RkDdyCBFi8h7b6bAYryKNXyO+gXXqBAvCIzIVvunPEHL4dyBgX28eLLxm
         PPMwSiJHxmqfKL7heapZjbb6nJ9KPKtTiXp9zPUV6Gln00MT86Hq4pUuDCicPquASuB4
         2uxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=wfsSIH2WiJxtpfJLihsSDniCtUl0kt4gblCRIOM16mc=;
        b=eGFZVGRPiMxbciWWgHQ1WlovANcYSg/5soLR4bxEkNh5brZ04UhyP8guAMPdiioW+A
         85iTWph7MmsINhCZ3ycdkvqzjn0LQVIK+Od/CSr+KmyrBAqJtUnhLEwbLMJx2olG0gc3
         /f+irNtH7aQBU1MHS7zbyl7werfJbAvDw5IaVoaAAunBdZkeKm4ixfAT2wmad09LESkN
         tEWRrEKlE/QsFGodTT7NPB4ccpr8RLuuOyxAa7CcI4Q5U6MUytYJApG9idImStyQBFAn
         TC8fJsHOT1Q20rMlEKQ3PkCo+nhnPqYaajpa5eVV2dTCI/BnG7ou/Kt/oNOz8hULyN+j
         blBQ==
X-Gm-Message-State: AJIora9slAe6S0KirDnTmr7p3PWgyx4a0XCFerN+IQAZecFjjlpckVwM
	pMcdvcyolRypv8UE47BCwF9yG2bScbBVaYU4EOInXth+
X-Google-Smtp-Source: 
 AA6agR79Y4WpTmJBAIJH68xurx/VncQIb1RFIq88L5PQGt1n6vexqaLdRfjZJGpngafKncnWFV01T36uwNdpEsgbUpE=
X-Received: by 2002:a05:6512:b21:b0:47f:752a:c140 with SMTP id
 w33-20020a0565120b2100b0047f752ac140mr1083739lfu.349.1659095789396; Fri, 29
 Jul 2022 04:56:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220729112413.282067-1-rybczynska@gmail.com>
In-Reply-To: <20220729112413.282067-1-rybczynska@gmail.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Fri, 29 Jul 2022 13:56:17 +0200
Message-ID: 
 <CAApg2=Q2TCiG+0-aZ9io_rFrvjf=niR5v9vBj+=zwY1qm5ytWA@mail.gmail.com>
Subject: Re: [meta-oe][PATCH] polkit: update patches for musl compilation
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: Khem Raj <raj.khem@gmail.com>,
 Marta Rybczynska <marta.rybczynska@huawei.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Jul 2022 11:56:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98040

On Fri, Jul 29, 2022 at 1:24 PM Marta Rybczynska <rybczynska@gmail.com> wrote:
>
> Update the patch to make netgroup support optional to fit the commit
> merged upstream [1], update the other patch depending on one of the
> changes.
>
> Without this update, a compilation using duktape with musl fails with:
> | ../../../polkit-0.119/src/polkitbackend/polkitbackendduktapeauthority.c: In function 'js_polkit_user_is_in_netgroup':
> | ../../../polkit-0.119/src/polkitbackend/polkitbackendduktapeauthority.c:1039:7: warning: implicit declaration of function 'innetgr' [-Wimplicit-function-declaration]
> |  1039 |   if (innetgr (netgroup,
> |       |       ^~~~~~~
>
> The main patch has been split in two, to apply the duktape part only when duktape is
> applied.
>
> [1] https://gitlab.freedesktop.org/polkit/polkit/-/commit/b57deee8178190a7ecc75290fa13cf7daabc2c66
>
> Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
> ---
>  ...ded-support-for-duktape-as-JS-engine.patch |  20 ++--
>  ...0004-Make-netgroup-support-optional.patch} | 103 +++++++++---------
>  ...ke-netgroup-support-optional-duktape.patch |  34 ++++++
>  .../recipes-extended/polkit/polkit_0.119.bb   |   4 +-
>  4 files changed, 98 insertions(+), 63 deletions(-)

Khem,
The master version is different from the kirkstone one because of the
changes that were done on duktape
support. Is there any special reason this recipe isn't updated to a
newer version so that we could drop many
of the patches?

Regards,
Marta

