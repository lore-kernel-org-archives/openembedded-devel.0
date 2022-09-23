Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AF87ECAAD8
	for <webhook@archiver.kernel.org>; Fri, 23 Sep 2022 03:26:20 +0000 (UTC)
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com
 [209.85.161.48])
 by mx.groups.io with SMTP id smtpd.web08.3851.1663903568222747794
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Sep 2022 20:26:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=D8IDWMt2;
 spf=pass (domain: gmail.com, ip: 209.85.161.48, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f48.google.com with SMTP id
 c17-20020a4aa4d1000000b0047653e7c5f3so19606oom.1
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Sep 2022 20:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=wloeCKS1VUAzbnVyyEPRPJQpzTFw7u3h7dTNDU5UyqQ=;
        b=D8IDWMt2s+CT8jTXmZcGXw+MZKuv3Q49vaAEGMB3e/s9wK4enZPLdH+2Mgtx1RX7ut
         DCOZ6IdNdQRvj9dQqFqLCkkHrZAkMA78Wzl4SdZzpFq64beRXDKp93lCSpDoN1fi2Jbn
         LRBdVMKxRzUH6/R1KJCi5Mb9Ldo+94xfqD9+D+hY+mpMypacpy2RjkxVech1ZkgKeNoz
         LTIN+IDg3T7M19zs0AtaNHIQ6nkspnRQMP1ylxCXHngVhnZW5tplVLp/iDTBWbmFaWNg
         12eO/oJT/3UChNGJfFnV+bLJpl2pEg11+heBtS80WQWunbMDoAyJcg/rvrcgEcr7xnVq
         8Scg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=wloeCKS1VUAzbnVyyEPRPJQpzTFw7u3h7dTNDU5UyqQ=;
        b=8BrxbXdJvcjI2+hfuM4UsAwU1fyawWZwR9HQh6VamVhqZSZSslwPyalQdnyHyIlTry
         JHMoMEPEe6Z7yHTLxZPHwgPcgg+YdETuEC092EP6jnyos04FDzRxAyaxtlOwb9ihQxCz
         6l+gz++IvYn7mzjPtSJvfy/x/buyAn2wxil8alzQlt4g/ea0UjgG+7KWsa4HhTYL2ufK
         1N28Bx5uCbdw4YJO1jaM8nUfOLAOOICblC5f9FlS9tEEmxUPzvXH51g0vTNq8KWUdjWd
         FZBHoWRpXW37NYcWhFwpvDNtubSTK0lm2+am2MahCG8Z7xpVybkvmuQqS5/8kS0o5Pdo
         PiNQ==
X-Gm-Message-State: ACrzQf2ZbOIjJmT7LCiNcQxjJU0D0c2RtiN7yCnIU1KhfYyqX0I+yd7O
	4geA4RTZ09eD0hJFO6HUqhu/Ok3mclunUc6Rkc8=
X-Google-Smtp-Source: 
 AMsMyM5mzDV9aiz6FomXhCJYpiyHeeFQBJN7nyHZOsjqC7DDN6mMN+WISiMnpDH/hh6Xom31ZNdnNAC3Rma+VgZT6Ws=
X-Received: by 2002:a4a:d129:0:b0:475:62e0:d7fb with SMTP id
 n9-20020a4ad129000000b0047562e0d7fbmr2661324oor.9.1663903567230; Thu, 22 Sep
 2022 20:26:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220923021317.1987661-1-jpuhlman@mvista.com>
In-Reply-To: <20220923021317.1987661-1-jpuhlman@mvista.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 22 Sep 2022 23:25:41 -0400
Message-ID: 
 <CAMKF1soPiM5Tvd3EDkp0v++BM8SJ9i0M0iuP7gRF8KBuNgWbMQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][kirkstone][PATCH] audit: Install audit.h from
 audit package.
To: Jeremy Puhlman <jpuhlman@mvista.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Sep 2022 03:26:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98935

does this backport fix it for you

https://patchwork.yoctoproject.org/project/oe/patch/20220921081916.17313-1-mikko.rapeli@linaro.org/

On Thu, Sep 22, 2022 at 10:13 PM Jeremy Puhlman <jpuhlman@mvista.com> wrote:
>
> Source: MontaVista Software, LLC
> MR: 121884
> Type: Defect Fix
> Disposition: Submitted to meta-oe
> ChangeID: 2708329947da5ec2f96a8478771f56cfce95f616
> Description:
>
> The last upgrade to audit, changed libaudit.h to use "audit.h", which
> makes the build work for this package, but breaks any other package
> trying to use libaudit.h, like libsemanage.
>
> build/tmp/work/aarch64-montavista-linux/libsemanage/3.3-r0/recipe-sysroot/usr/include/libaudit.h:30:10: fatal error: audit.h: No such file or directory
>    30 | #include "audit.h"
>       |          ^~~~~~~~~
> compilation terminated.
>
> Install audit.h so other applications can use it.
>
> Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
> ---
>  meta-oe/recipes-security/audit/audit_3.0.8.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-oe/recipes-security/audit/audit_3.0.8.bb b/meta-oe/recipes-security/audit/audit_3.0.8.bb
> index 3dbfc9e60..6195b6749 100644
> --- a/meta-oe/recipes-security/audit/audit_3.0.8.bb
> +++ b/meta-oe/recipes-security/audit/audit_3.0.8.bb
> @@ -110,4 +110,5 @@ do_install:append() {
>
>         # Create /var/spool/audit directory for audisp-remote
>         install -m 0700 -d ${D}${localstatedir}/spool/audit
> +       install -m 644 ${S}/lib/audit.h ${D}${includedir}/audit.h
>  }
> --
> 2.35.4
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#98934): https://lists.openembedded.org/g/openembedded-devel/message/98934
> Mute This Topic: https://lists.openembedded.org/mt/93862901/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

