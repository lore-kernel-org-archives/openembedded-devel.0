Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FB68C54F65
	for <webhook@archiver.kernel.org>; Mon,  4 Apr 2022 18:46:45 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web12.16138.1648931956513760169
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 02 Apr 2022 13:39:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=g3S3AiFR;
 spf=pass (domain: gmail.com, ip: 209.85.222.173,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f173.google.com with SMTP id v13so4767999qkv.3
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 02 Apr 2022 13:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=z/GUWd1gxZWDxkSHzziYX6dnoh91MmYAOQRQkyO/HfQ=;
        b=g3S3AiFRN+zicSgbiqa+9/hedIEXLy9bu7EmOISK21qFL07+qf+1hLfEOyt67NSEbn
         ukA4diBnh52wW79leGqE2tfnziyA0FtGLUL8vcdeje6FXG98YTHe56Y85L2LCYLp3H/c
         538C4amlxhadNsf/yKKY6HOM8amhlrRi+SgMGpQHdrNJn+LmWRTOgNsnuIl3Yf0vJ410
         zv7f55fkCOLdlAM7vvmUMp0bOf51xlOmWvGi1hW0Sj1WX1ohxi31J7gf3Vo2QjkqUKRP
         tXsDSg157nHSQkVKoPtTCX4xcBrK3I9tvwEL3ghoT6/LBgEhQnqMgOb7J5ShR20MGIKI
         AOXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=z/GUWd1gxZWDxkSHzziYX6dnoh91MmYAOQRQkyO/HfQ=;
        b=CKfxXqQYP/9+mZlr5zzqgfPw8H1ys2QKN+8DBDvj5WN1V9+GXV81UeeCIv/VlReQ6h
         D3Qva3V63u/YODuvpluMYHn+YaHNsJaRLUIkZcmknkDeC8peboSkLv04H9rwdn/YMB3X
         WQjTsQ4wK2b0Lf5U/M5rycWABF8Per4rqZ28AEfUq9AhnFD4ebZb6OgudzDRJFXVHSch
         eJBzOxaNlYJd0Lb9+uYQXUQ0lGSTc3x+tTZBJYnK693gRT8mcLTPQ8kVnvvi3uEtIeJE
         DdlwGym1lYgJ26ZzNtmohD2vMx7DPU8eiP8jkviuTN+ct69uRahBElXBKV1FEHEzoCtg
         vytg==
X-Gm-Message-State: AOAM533rY7jG1VCwJzocLn6BPiP1VKVofPErgV+ZBQHu6IEoLZ0w3SnR
	kMdnNCmOO9Oq0brMW5ET1LN9ZAMC/JluAQYwkBA=
X-Google-Smtp-Source: 
 ABdhPJyKzd/hpUqBb8ocJp6VKdkwDZ1eVAXCILhyPvEt0Ifc2XNl7mQO0mGtweu7j0+VVEVUI+4D2GLtPLeLEBSdEow=
X-Received: by 2002:a05:620a:4103:b0:67b:49f4:3ee4 with SMTP id
 j3-20020a05620a410300b0067b49f43ee4mr10253323qko.72.1648931955603; Sat, 02
 Apr 2022 13:39:15 -0700 (PDT)
MIME-Version: 1.0
References: <8c5e327b-f05a-681b-c212-b3a35e8997c8@gmail.com>
In-Reply-To: <8c5e327b-f05a-681b-c212-b3a35e8997c8@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 2 Apr 2022 13:38:49 -0700
Message-ID: 
 <CAMKF1sq1pBNbsenog-9=a4ty3TLBcvrVHNkLJL=ZgRLg4rw75g@mail.gmail.com>
Subject: Re: honister pull request: April 2nd
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 Apr 2022 18:46:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96348

merged thanks.

On Sat, Apr 2, 2022 at 10:31 AM akuster808 <akuster808@gmail.com> wrote:
>
> The following changes since commit 061b7fc74f887454251307ef119b808a90654d3f:
>
>    imagemagick: update SRC_URI branch to main (2022-03-15 07:38:00 -0700)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded honister-next
>
> for you to fetch changes up to de18681d7dd27000c132bc68f9fa267e8f5a2348:
>
>    python3-django: upgrade 3.2.10 -> 3.2.12 (2022-03-31 13:49:34 -0700)
>
> ----------------------------------------------------------------
> Trevor Gamblin (2):
>        python3-django: upgrade 2.2.24 -> 2.2.27
>        python3-django: upgrade 3.2.10 -> 3.2.12
>
>   .../recipes-devtools/python/{python3-django_2.2.24.bb =>
> python3-django_2.2.27.bb}        | 4 ++--
>   .../recipes-devtools/python/{python3-django_3.2.10.bb =>
> python3-django_3.2.12.bb}        | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-django_2.2.24.bb
> => python3-django_2.2.27.bb} (60%)
>   rename meta-python/recipes-devtools/python/{python3-django_3.2.10.bb
> => python3-django_3.2.12.bb} (77%)

