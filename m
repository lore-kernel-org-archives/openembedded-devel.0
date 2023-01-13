Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56921C3DA78
	for <webhook@archiver.kernel.org>; Fri, 13 Jan 2023 18:04:17 +0000 (UTC)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
 by mx.groups.io with SMTP id smtpd.web10.95460.1673633047620196996
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Jan 2023 10:04:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=p1hfKK74;
 spf=pass (domain: gmail.com, ip: 209.85.167.171, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f171.google.com with SMTP id j130so18292614oif.4
        for <openembedded-devel@lists.openembedded.org>; Fri, 13 Jan 2023 10:04:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EmU1EwVhdYWm4HO0OIN7dCPHMP388j9RbSlue9NQtC4=;
        b=p1hfKK742X2N6kVtchP3ozEP4i+H7ZN29ayrrvpHkg+1+s6JlDTUp9Ylw384jpLNco
         xoQiWOd8pRPuzgtJ1v2l6N1+7QF4jRH43M2s4EoNdvGTb4r8641DQqhUmyXN7TnhxO9Z
         3hbiqefxmD9Vl897VZFyhUDIld6nxVUTbkD0cjjvbOYi63gTweROI1M6mPbd2rC8zlxN
         oYqCLyftq0Vu/pou66XtQRB4vu5eo/To3MjJtEzSeZSZOt0GMXxNDmD/5weeDY+YqALt
         WKX9D34Kc0GhwKYKChFZ1qFh9OshvEKrN8CKwVH3vZ0jjRAHwhaI9zJmHYyz3r1wRdTi
         DzAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EmU1EwVhdYWm4HO0OIN7dCPHMP388j9RbSlue9NQtC4=;
        b=FvC4TlVpfQpoRvF29e5aOlZzrIZCuFm1gyb3GSbnVhmwF3s+0ylmEZWGTu1cPWYGAZ
         IwGa2keOrRAo+iKNKK7NEd6+ADHVZMRjVVraN8r9cOpYyYDbaJuccVzqxZPv+w6HzCHl
         +DvWQi9QFmgpiRjZAJMhkoqn6eib/w/xzIohQgbcqDpZho83WqQGxBl/mivH2wjW4W/e
         x5mUwI+d0ceve478Gc69C8f7wPYZszrcWnMKVE88psFHHXjM2Sun5VpELQoqlGJ2ZGne
         hjznA+wKPKz+XnfKQObSPyMnptNt1hOZrKaEfvomwp/N6RgFoU7HD/ZGqvJwpDXKpSMk
         +aug==
X-Gm-Message-State: AFqh2krEQPBXCcWNGvosXmCLIhdQCslWamWL6jeEirmOT93LfB2SvOKs
	t6osiN54bwcyTY3fcMgzuuSjOP5oBAQ733uvzu1u0MDWTC1tbQ==
X-Google-Smtp-Source: AMrXdXvTO/vgNflqXm3RuF8pysuxr8zwZcCFq+jmmrC1KgrnKso9aDKX6E04rtqzmzStvAaEFMocXUzjPc/gd9ZJsqc=
X-Received: by 2002:a05:6808:7c1:b0:364:bd84:ca34 with SMTP id
 f1-20020a05680807c100b00364bd84ca34mr105642oij.262.1673633046806; Fri, 13 Jan
 2023 10:04:06 -0800 (PST)
MIME-Version: 1.0
References: <20230113172727.2565686-1-alejandro@enedino.org>
In-Reply-To: <20230113172727.2565686-1-alejandro@enedino.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 13 Jan 2023 10:03:40 -0800
Message-ID: <CAMKF1sriKSe2VaH_gFTYDfL=Neg9kvWvY_2A-F9YKRPUwiFs3w@mail.gmail.com>
Subject: Re: [oe] [PATCH] imapfilter: update 2.7.6 -> 2.8.1
To: Alejandro Hernandez Samaniego <alejandro@enedino.org>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 Jan 2023 18:04:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100570

I have

https://lists.openembedded.org/g/openembedded-devel/message/100507?p=%2C%2C%2C20%2C0%2C0%2C0%3A%3Acreated%2C0%2Cimapfilter%2C20%2C2%2C0%2C96171776

already staged in master-next.

On Fri, Jan 13, 2023 at 9:27 AM Alejandro Hernandez Samaniego
<alejandro@enedino.org> wrote:
>
> - Changes in this release [1]
>
> - License checksum changed because dates got updated.
>
> [1] https://github.com/lefcha/imapfilter/compare/v2.7.6...v2.8.1
>
> Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
> ---
>  .../imapfilter/{imapfilter_2.7.6.bb => imapfilter_2.8.1.bb} | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta-oe/recipes-support/imapfilter/{imapfilter_2.7.6.bb => imapfilter_2.8.1.bb} (78%)
>
> diff --git a/meta-oe/recipes-support/imapfilter/imapfilter_2.7.6.bb b/meta-oe/recipes-support/imapfilter/imapfilter_2.8.1.bb
> similarity index 78%
> rename from meta-oe/recipes-support/imapfilter/imapfilter_2.7.6.bb
> rename to meta-oe/recipes-support/imapfilter/imapfilter_2.8.1.bb
> index eb23816e8..3ab87f498 100644
> --- a/meta-oe/recipes-support/imapfilter/imapfilter_2.7.6.bb
> +++ b/meta-oe/recipes-support/imapfilter/imapfilter_2.8.1.bb
> @@ -1,9 +1,9 @@
>  SUMMARY = "IMAPFilter is a mail filtering utility that processes mailboxes based on IMAP queries"
>  LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=c11d4fd926d3ce7aac13b0ed1e9b3a63"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=f8d2fc4954306888fd0e4b27bef83525"
>
> -# v2.7.6
> -SRCREV = "b39d0430f29d7c953581186955c11b461e6c824f"
> +# v2.8.1
> +SRCREV = "e6372b88e09a4d1c573b57270de6b40846825a8b"
>  SRC_URI = "git://github.com/lefcha/imapfilter;protocol=https;branch=master \
>             file://ldflags.patch \
>  "
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#100568): https://lists.openembedded.org/g/openembedded-devel/message/100568
> Mute This Topic: https://lists.openembedded.org/mt/96250964/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

