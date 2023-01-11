Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD377C46467
	for <webhook@archiver.kernel.org>; Wed, 11 Jan 2023 18:07:51 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web11.31679.1673460469736566164
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Jan 2023 10:07:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=zrOxwpyz;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.50, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f50.google.com with SMTP id b4so3987499edf.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Jan 2023 10:07:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=C5xwcNeC+oocNwYXZ6Hc7Zhaj8nHOGHrvxCrQzQCF6Q=;
        b=zrOxwpyzUgGxJn6x75gt/GUun7fJn67FehyQAU5MRzIu9axVlQJ7WdipNbvJop0ory
         6UYMHpadxKSmTcvNEQ2XCI6mYZ6D3bA0g5mGUbEL8XUbJ/od8fyR7mKHe4fSJUg86MIr
         SpKmTaR4IeQ8oG7wqDVx89FlvzPKyL5JXg4Em5TsnWSqkCkJ+RqQsToQeaKL3769q+Wz
         2VPgVnQoHJW2NcNc6TzGKOAjDJ7LZz3khnJiU5SB1LZeyZOBpUtWkU+Z+kjwV9LXUkWl
         F9VpJAEVPXTGacn19inmBfXU/mnUhPX6SUaYRH6SWZxKaF9zrcXueBmG/3nvceFUVka+
         zfCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C5xwcNeC+oocNwYXZ6Hc7Zhaj8nHOGHrvxCrQzQCF6Q=;
        b=xvGr/td+/ku/IMmdijYVCnU7VR6s/e8zJJV+0DvmsbMo9NoAseaQGPyofDUP7dGGFM
         L+zqP+XBDbNJtq+2xqYoV7MCIDY+R5YlhE4qy85xXgtoGQcpJM6pbxYt/wukbR2aLBKY
         2oXXJr80GxiYjj84+CZnEVDGPuO/d3wh88jJ6F+Skr554EfXMx/ZCgTOGFYSUuZrMthm
         oyINB9MZsGHGMyaieUOPvoFtJoD9ZlKpZ4Gbky6BhpUW7p5cxsbh0rJUctST0nlgNKLK
         T8bkpBTNIbvqNhEMhsnpnuqvw4XFWTUuMSC2xRXbgENoNIU1ANuWFyKhIMj0F5QbNCzH
         4U8Q==
X-Gm-Message-State: AFqh2kpAZ294pgexkdsONrSVlVTJbQRTp3TVRcGukZTjQRxlVkKbPmeS
	SupG0zd0UWZaGeEyY6lZnHjlpZk68e6eHAzpp4ELmA==
X-Google-Smtp-Source: AMrXdXsZGDI6Z4YrQgAbuzj9LS2jQmjCHXVHA8Jnu/F84/cGi3Cm9N7fC9u80uY3FtYgDf9Kin5ULv5cIzonIPc9JCw=
X-Received: by 2002:a05:6402:2208:b0:48a:7ada:b260 with SMTP id
 cq8-20020a056402220800b0048a7adab260mr4051829edb.311.1673460467734; Wed, 11
 Jan 2023 10:07:47 -0800 (PST)
MIME-Version: 1.0
References: <7b00f80d33fc4d77eafcddb8ba46b992d713df25.camel@siemens.com>
In-Reply-To: <7b00f80d33fc4d77eafcddb8ba46b992d713df25.camel@siemens.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 11 Jan 2023 08:07:36 -1000
Message-ID: <CAOSpxdapG_z_H0DrcRc=N6AczcPykLLBd+zfHbLCqTFGvOC0Lw@mail.gmail.com>
Subject: Re: gRPC
To: "Valek, Andrej" <andrej.valek@siemens.com>
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Jan 2023 18:07:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100555

Hi Andrej,

I'm the maintainer for openembedded-core, and gRPC is in
meta-openmebedded. So this isn't my call to make.

However we typically only take version bumps if they are security/bug
fix only releases.  So if this is the case, you can submit a patch.
But please be sure to include either release notes or change log so
the meta-openembedded maintainer can verify that it is suitable for a
stable release.

Thanks!

Steve

On Tue, Jan 10, 2023 at 9:31 PM Valek, Andrej <andrej.valek@siemens.com> wrote:
>
> Hello Steve,
>
> I have a question about gRPC. Would it be possible to backport
> gRPC(grpc_1.50.1.bb) from master to kirkstone branch? There are some
> CVEs reported (for the current version) and going to newer version
> would be better solution I guess.
>
> Thank you,
> Andrej

