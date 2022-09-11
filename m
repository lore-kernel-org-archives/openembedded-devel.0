Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9011BECAAD3
	for <webhook@archiver.kernel.org>; Sun, 11 Sep 2022 23:23:25 +0000 (UTC)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com
 [209.85.210.52])
 by mx.groups.io with SMTP id smtpd.web11.1711.1662938596269274154
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Sep 2022 16:23:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mTN3sI81;
 spf=pass (domain: gmail.com, ip: 209.85.210.52, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f52.google.com with SMTP id
 br15-20020a056830390f00b0061c9d73b8bdso4790660otb.6
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Sep 2022 16:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=7BAbCmunWkcC3jevhSOcMH5oyd5Wc4FsOIgYzk1syw4=;
        b=mTN3sI81NSxDkAsenCHRvCPCecqbyOpuNtTnOejsj2s0QLskS2vOrmfxIPxz7YIEb2
         1LISqD7IeSt8+6Pfl7HpcpiAj2oJ3Dc74TJ8qiIkaHap/Y4PIjhXJHx3LYFHBNHJ9FmW
         X9SgTy2JtvYCHRWFRKcRPow8Uu25kkncGZKTWE32L3UyJwQhBWm5qlOIlkVPoQ920eGj
         Vqyldi2lZLqeZtw9D6guWpOQ4pxkFJSGlrCZw9+3H2xFF166T0G7jWr4+9vkHbqk/94U
         M474q3kvigvEwHlQQXLBc2/yjPlEdntZ1TURLJB6dQRAoVS6MjsnLBJuZvVx0ElG91Gr
         3Y7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=7BAbCmunWkcC3jevhSOcMH5oyd5Wc4FsOIgYzk1syw4=;
        b=MBeRBkviGNy4UNzS8bf0TZFCFIKyatE7YtXa9CqrpPyGXtQVXYGe+XOWkGJ+gU2HfR
         zMatwVhPsIGfb9ULCG8+oYfjWSejhEOsPl3T0Csxk05zukAUicKYpNtupsw6NCavE0iH
         0z7UVMkB2OMPaHciJ8cqgcxmEuzHUfVOuapfNSfELN6Eqo4tQZH2UjCaFKeALG0vxEQt
         xJl5r+wU2NCTAGd+jFfxSscNKeDaC2gAhLt9kHbvCtgN4rs1Tvul3ztOMRNHigvdtel7
         EqXDExqfWO+P+YqDC32xPw9oKqUSW5DW21sRr8HUBVJVpmCNNFwrIkzw1kMWgzbvb/8F
         GzAw==
X-Gm-Message-State: ACgBeo0zFFNCiPp9RbpwXCyXbWGHLdKpREh2infZFpvAEKA1tAH1Asjp
	n4wHobQbNsyeVbuYyMqKJ/5Dy7AKYRItEUn3VW4=
X-Google-Smtp-Source: 
 AA6agR7dgrAqWqoEzlaxyqITfThgRp9vqjXFmnmLWzGygQFnP3UZtm4V1wlmSE7ZPs9ImTlwUKWkETQ2QwfnFussT/0=
X-Received: by 2002:a9d:6c0c:0:b0:655:f641:2824 with SMTP id
 f12-20020a9d6c0c000000b00655f6412824mr32832otq.55.1662938595500; Sun, 11 Sep
 2022 16:23:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220911191217.2596456-1-Martin.Jansa@gmail.com>
In-Reply-To: <20220911191217.2596456-1-Martin.Jansa@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 11 Sep 2022 16:22:49 -0700
Message-ID: 
 <CAMKF1sqQydhJ22REL76JFff4Ft80_Sw9UPf2qBTkD=B=yO-ckA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] lvm2: use bfd even with ld-is-gold in
 DISTRO_FEATURES
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 11 Sep 2022 23:23:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98739

Hi Martin

On Sun, Sep 11, 2022 at 12:12 PM Martin Jansa <Martin.Jansa@gmail.com> wrote:
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-oe/recipes-support/lvm2/lvm2.inc | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
> index 34e57ec7a5..dfabf11e2f 100644
> --- a/meta-oe/recipes-support/lvm2/lvm2.inc
> +++ b/meta-oe/recipes-support/lvm2/lvm2.inc
> @@ -57,3 +57,7 @@ EXTRA_OECONF = "--with-user= \
>                  --with-thin-repair=${sbindir}/thin_repair \
>                  --with-thin-restore=${sbindir}/thin_restore \
>  "
> +
> +# gold doesn't like multiple dm_bitset_parse_list definitions in libdm/.exported_symbols.DM_1_02_138 and libdm/.exported_symbols.DM_1_02_129
> +# after it was uncommented in the later in 2.03.12 with https://github.com/lvmteam/lvm2/commit/60eb608d66c2056a78e81f27db3da14139d9faab
> +LDFLAGS += "-fuse-ld=bfd"

We do have third player in the game, lld and this would mean
that even lld is disabled. so perhaps its better apply this only when
ld-is-gold distro feature is on.

> --
> 2.37.3
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#98737): https://lists.openembedded.org/g/openembedded-devel/message/98737
> Mute This Topic: https://lists.openembedded.org/mt/93618041/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

