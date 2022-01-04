Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C223FC433EF
	for <webhook@archiver.kernel.org>; Tue,  4 Jan 2022 06:42:01 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com
 [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web08.3436.1641278520540533332
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Jan 2022 22:42:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EpPTffnr;
 spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id h5so33438036qvh.8
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Jan 2022 22:42:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NDRUIdDXc9bwnimaqWkmubeO30IkDjssG+VFgqWvTYQ=;
        b=EpPTffnr8WfQueKKcwXLCCsBtfQYMHBdkFcW9pamQRHkaJLOU8lwGrn2/laSKyypje
         BAgOlrnNJgJbaZQF9+Ly3ZjyAoL/bUuypbW8fXvRpU/X5rzQ6C8TA3Xe8WbEnU4EXwZ1
         mxCnVFEROZKXnkesPNQXTnumFZmsm5ByH1R9E1eU4oOML0R+jg9pTOhXdtcOZH0vGMGI
         pCkgqAJnuiMtjQcDIs4/unDmwylJb/wJ3Y7pw2Azt5RH0WCl5tI6Arujzpf1yCJmj4Mn
         1q3LIOrmIzMXpAqgj9uEi/EzjH1IXjlSqeLtxTmFV9vt1CVvJELg7tDa4huQtUQzc474
         jvZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NDRUIdDXc9bwnimaqWkmubeO30IkDjssG+VFgqWvTYQ=;
        b=c0kfDjLBONURzZKZtyE+QoxDo5BXGm5OQqB0IM8hOM4O4b/nxV64rqRfZYyCCBoe1h
         cdSI3gBmSsi5A85QZpAKrBr5eFrp0qCe5Lh5vPzJSioprfAvSG9Q8oGf2/THCsPo5MYr
         InqlSbSdw0q7hp8b8nI2d+HeAUc9F4FhFg7qkek+NIKVXzhhR74WkezHjdGipN/g2E29
         Gr3oTa/IL3a6ipESfdFKTGhTUZt07B/Cb6LfQghQM+9Ep7IzZe7hP9uPwRpq4r+Re4/x
         jH46ysmqlM6SYGAGMETV2VZJdqXB5zmoGKYDeKkST++eIYLd4R9qQkOXiez4WGjIRSGH
         JY5g==
X-Gm-Message-State: AOAM530HdqfBW2TTKDNT/M4hNt8PviE3RijSjB6PqU1nmzzQM2p9ZvxY
	M2irlKh0oDQh/kLLjVhUFfsWM6s0BuLjD7cYvlU=
X-Google-Smtp-Source: 
 ABdhPJwc6rPTTjHbvmbUBZFO+pKhMwh9n932l5GYGBRau+GuSOypWzTj5TR60xwpBp1vNRTndYXHlAnT+VmftVbPP60=
X-Received: by 2002:a05:6214:c4d:: with SMTP id
 r13mr45850913qvj.63.1641278519636;
 Mon, 03 Jan 2022 22:41:59 -0800 (PST)
MIME-Version: 1.0
References: <463f577f-075c-cdd4-50c2-017f9c64991f@gmail.com>
In-Reply-To: <463f577f-075c-cdd4-50c2-017f9c64991f@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 3 Jan 2022 22:41:33 -0800
Message-ID: 
 <CAMKF1sofazcbR0ACaMVyODYOw3Hr1cSyGoN1nixCvc8ZUEX48g@mail.gmail.com>
Subject: Re: dunfell merge request: Jan 1st
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Jan 2022 06:42:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94655

merged thx

On Sat, Jan 1, 2022 at 8:04 AM akuster808 <akuster808@gmail.com> wrote:
>
> The following changes since commit 95969f0f5f4264644a5dbfb6d4fb66e2ac3a2cde:
>
>   dovecot: refresh patches (2021-12-27 13:23:37 -0800)
>
> are available in the Git repository at:
>
>   https://git.openembedded.org/meta-openembedded dunfell-next
>
> for you to fetch changes up to ab9fca485e13f6f2f9761e1d2810f87c2e4f060a:
>
>   postfix: upgrade 3.4.12 -> 3.4.23 (2021-12-31 10:24:49 -0800)
>
> ----------------------------------------------------------------
> Yi Zhao (2):
>       postfix: fix build with glibc 2.34
>       postfix: upgrade 3.4.12 -> 3.4.23
>
>  .../postfix/files/0001-fix-build-with-glibc-2.34.patch          | 46
> +++++++++++++++++++++++++++++
>  .../postfix/{postfix_3.4.12.bb => postfix_3.4.23.bb}            |  5 ++--
>  2 files changed, 49 insertions(+), 2 deletions(-)
>  create mode 100644
> meta-networking/recipes-daemons/postfix/files/0001-fix-build-with-glibc-2.34.patch
>  rename meta-networking/recipes-daemons/postfix/{postfix_3.4.12.bb =>
> postfix_3.4.23.bb} (75%)
>

