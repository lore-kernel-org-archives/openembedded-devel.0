Return-Path: <schnitzeltony@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE2DFC433EF
	for <webhook@archiver.kernel.org>; Fri,  1 Apr 2022 05:36:43 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web12.7005.1648791402934349202
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 31 Mar 2022 22:36:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=E6nPIjzV;
 spf=pass (domain: gmail.com, ip: 209.85.210.180,
 mailfrom: schnitzeltony@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id w7so1613654pfu.11
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 31 Mar 2022 22:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=056tMZNtOVxZ/tgy7T98vECKkqz+99qmI2ZbwV6SaL0=;
        b=E6nPIjzVGEXMZDWKCGHO0F4Q67smT/NPnjaH8+AknGdnZxc4nuRM7a1/GQsHvvcJJN
         lQq4Mhh9eGeYVq33b0CwYvXPVg7RzhpAPhKjxDUk7cYC0RZsDZzAGJvffBqOiy7aWUBR
         LDUQXqDOMH9gAu6XuFw589JXXISqDVedqB3FUdVG9wNOg5nn7nHsxXvNuJkyc7TAtE/W
         gkJC/0GETIoJDISwcu8L9/Gs/brHmya8bZXCueC8kyfq6dGRYRARbEl57NuVYVccWhes
         oAU1ovh373ygMX49XVnsPaSLOOiNI1Kimp0SpFnMgDo8u9umxymMKDye2WxfhfMCyvwZ
         1BFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=056tMZNtOVxZ/tgy7T98vECKkqz+99qmI2ZbwV6SaL0=;
        b=WvOV0Q41EHTo0zRzR6uhR9W4hF5FybJ1Zr6NEieyj+WwAhVSQZo5ej7aY+gRV9+8lB
         zq2CCGTAG2oXaBECOvOHDA5s4oKIDBxtYNJXsW1zT8YVKVybVt4nxnsS7Ba44HIAe8kT
         zeAcG+Ci1tgUOgGWHBx1CQ9k377FZHIrEZhHgDKetOTnn+cjIWn1Sa2LVOr/Q4PAfUTj
         Z9HyuRX5e/BvStZAef/7pbSt2hOKiKXPbdb4ba7bePemnJAzfLGt2ac//aje4lEIJZY8
         7dmHt+BzL6jWHyfR6VXcYw59s1UuPw7jZvTZQp7WZU1F4l7DZQbiOhHUcgyziQvEutxf
         IOSg==
X-Gm-Message-State: AOAM530Z/rANvI7kcoVopcb9YLRgqJ9gJI4zLnI/2caJAZ08n0QG/T1Z
	3Pez/Zfq4IH16mGQhOFs3zJTu63ksurV1j2MPmk=
X-Google-Smtp-Source: 
 ABdhPJw5F40lcCM8FWTDGwXoTaAQpFIgb1R92C+xExaNEJpcGQhNTn+zQ/6DUBb9F5Gxg4r0LfKteiSdtk6xddu29Lg=
X-Received: by 2002:a05:6a00:1ac8:b0:4fa:917f:c1aa with SMTP id
 f8-20020a056a001ac800b004fa917fc1aamr42922191pfv.2.1648791402461; Thu, 31 Mar
 2022 22:36:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220401042203.1491670-1-raj.khem@gmail.com>
In-Reply-To: <20220401042203.1491670-1-raj.khem@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Fri, 1 Apr 2022 07:36:29 +0200
Message-ID: 
 <CALbNGRSU2DQOkEc9-H=Q2Kgo4JYxoAdoHqQT216oR9d6JX5oew@mail.gmail.com>
Subject: Re: [meta-gnome][PATCH] gnome-commander: Fix build with clang
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 01 Apr 2022 05:36:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96321

On Fri, Apr 1, 2022 at 6:22 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> Add a patch to fix it while glib-2.0 is resolving the issue
Thanks for this. Does this build for clang/gnu? I had thought that the
glib2/atomic issue was not the only one...

Andreas
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Andreas M=C3=BCller <schnitzeltony@gmail.com>

