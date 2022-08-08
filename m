Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD57AC00140
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 22:09:43 +0000 (UTC)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com
 [209.85.219.170])
 by mx.groups.io with SMTP id smtpd.web08.4842.1659996574687080168
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Aug 2022 15:09:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Wx6vBUWK;
 spf=pass (domain: gmail.com, ip: 209.85.219.170,
 mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f170.google.com with SMTP id 21so15784843ybf.4
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Aug 2022 15:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=ZgRMXiZft4WrsgYK+3WDr1SjsDj68nIU/9hLqDqD2Ac=;
        b=Wx6vBUWK646/RcN5IrttQ0A6jGREZpNwq1KuKrTJ+Fi70OxpJ0JibhCDstib3XmMjP
         4/bL+1Qj74B46S6AaTuneUq7xsodoro9S5vYcJpISCXyDVh5M+M3IE/Slpza/GNWhfBE
         juTXh8CNIn1Vsg2GtdCDoYKUot7oEvc2lJlTC1MVgvTAhWtWieZIeXPtAhGExcpnjBBh
         BV332nPbp0hFMeQ4UIIR33H+h0mBzNWF3JL41JPCU+8GtOOPkWxPtietouLPGCX63DH3
         kCjAfPHl0YM9iSQCXCNdEhsGTRklIQdoBCeJvRA9uIUwOvHl39CGSYPbJb2OeOCYZ4+t
         yjKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=ZgRMXiZft4WrsgYK+3WDr1SjsDj68nIU/9hLqDqD2Ac=;
        b=fvKWXJeOB0WlHSkYkq4PDtAXPEcceXEXuGd29NUOWYOx1WABkUrTSHpcS+on6tAq2U
         aQv+hkCyQQu1vdtoLkZE6MkwP+e6b8bCqYggok93bS+f/Mf5OR+qwclMjkpdARr6P6J+
         VmExR50+jl5Gk3QYhyxSeykN1An4xV/h1mw6eqWoRO2mrlBAIEt6WrY63Pm3ATNyPZPw
         zAVM2vOyCy2sn4PcgAK3SyDbhaefKJjG0weqyP9mDFh0keaF7TTGeP9qpc7S7KX62fbp
         DSJl+2Lcjqi3upvl6sVlCytl5bSsF7WumK0Cb0rt3lUj3MisesqSh1+rCWq7Rydj54zb
         dNBg==
X-Gm-Message-State: ACgBeo0hkN93p7o6VoEKFHCVg8g3aPgpm8EZ6JTrVjMEvmzCrysytYIj
	kUvhM19MqNx8SH8DfPun1y0Po7dl+bsuX47F6EA=
X-Google-Smtp-Source: 
 AA6agR47GJATJNIk7/XW4HR12NusvHhXanzvx4nWzI/9gGkaptkF4zeMylz921/00O+Mr8siAuCCGMfCFMSSeAxeA3g=
X-Received: by 2002:a25:e713:0:b0:67b:d3f3:3072 with SMTP id
 e19-20020a25e713000000b0067bd3f33072mr7708382ybh.428.1659996573766; Mon, 08
 Aug 2022 15:09:33 -0700 (PDT)
MIME-Version: 1.0
References: <e0511155-cbeb-57ad-2910-c60a5d397887@gmail.com>
In-Reply-To: <e0511155-cbeb-57ad-2910-c60a5d397887@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 8 Aug 2022 15:09:06 -0700
Message-ID: 
 <CAMKF1srHvQA_d4Dw8bb3F439NnQsgSNcUW3hb2Rb5z4C_Dfhdg@mail.gmail.com>
Subject: Re: dunfell merge request: Aug 8th
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Aug 2022 22:09:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98177

merged thanks Armin.

On Mon, Aug 8, 2022 at 2:47 PM akuster808 <akuster808@gmail.com> wrote:
>
> The following changes since commit 52cee67833d1975a5bd52e4556c4cd312425a017:
>
>    ntfs-3g-ntfsprogs: upgrade to 2021.8.22 (2022-07-16 12:56:17 -0700)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded dunfell-next
>
> for you to fetch changes up to f22bf6efaae61a8fd9272be64e7d75223c58922e:
>
>    meta-oe: Add leading whitespace for append operator (2022-08-02
> 06:59:38 -0700)
>
> ----------------------------------------------------------------
> Armin Kuster (1):
>        bigbuckbunny-1080p: update SRC_URI
>
> Chen Qi (1):
>        ntfs-3g-ntfsprogs: upgrade to 2022.5.17
>
> Khem Raj (1):
>        meta-oe: Add leading whitespace for append operator
>
>   .../ntfs-3g-ntfsprogs/{ntfs-3g-ntfsprogs_2021.8.22.bb =>
> ntfs-3g-ntfsprogs_2022.5.17.bb}  | 3 +--
>   meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-1080p.bb | 2 +-
>   meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb | 2 +-
>   meta-oe/recipes-devtools/grpc/grpc_1.24.3.bb | 2 +-
>   meta-oe/recipes-devtools/lua/lua_5.3.6.bb | 2 +-
>   meta-oe/recipes-extended/gnuplot/gnuplot_5.2.8.bb | 2 +-
>   meta-oe/recipes-extended/libstatgrab/libstatgrab_0.92.bb | 2 +-
>   meta-oe/recipes-support/anthy/anthy_9100h.bb | 4 ++--
>   8 files changed, 9 insertions(+), 10 deletions(-)
>   rename
> meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/{ntfs-3g-ntfsprogs_2021.8.22.bb
> => ntfs-3g-ntfsprogs_2022.5.17.bb} (93%)

