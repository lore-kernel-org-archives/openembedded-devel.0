Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACD9AC433F5
	for <webhook@archiver.kernel.org>; Thu, 24 Mar 2022 16:57:36 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web10.13696.1648141055708238647
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Mar 2022 09:57:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cC1l2ZWc;
 spf=pass (domain: gmail.com, ip: 209.85.222.179,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f179.google.com with SMTP id b189so3977738qkf.11
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Mar 2022 09:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RBEosxVYEdDOsR1xUtM1TvPcfj3+yq2EIsDwzCyh+GQ=;
        b=cC1l2ZWcCL2EeTmqHeo6YCZtly4Wf1C33KSKq78okTUt5ihATnohZRHLKLwb+nD44/
         aLE1vB78HoJasmGaTmLnpFj/iBGJU+9aLvuXtjSGop9NsL4ZNsCIeDJjSM/rXK14KWQR
         BgM+e/fJAGyazshXzqdMTbZwWRQBj0Djj5Hlme40pR9K5vJCLq3qtAdFMUGjKd6kIh2d
         7dKrKWW8QDw50VpjeBwkeGiZkJBwtdW5mha6R375NdPD8RcKm9uvNv2Ull5RL8uerUtr
         y8yEvtyhmboEWftwOcPAMwje7cUAC0SfY4F7jtX06FNVS3T3T/0TJXlTO06hjQnC/ZrE
         VdXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RBEosxVYEdDOsR1xUtM1TvPcfj3+yq2EIsDwzCyh+GQ=;
        b=NcV0tjyPTQw+iXMLuTO62xRaPluGGCB5Ap4nsBf0o17VrP2GLYISx/yKpjgLwIBh12
         OdwJPoY2I2Hku8pg8E2jKjoT2BHfxT5sGOXuFMvnKh5sLkCro/jgPdKbqyeR505FpcED
         gISCJt6ezIFHquxwsPGLwInUWQBrkdfh3B+li6F0yFmyaKA7AWwP7MfezrLYNQnmLGci
         qk4rr2s3dzpgrwUygugyoQnBkIvqHcrLLRbUviPswIX8IWd/iqheBgvxYwdnzgHOuvok
         3bbWJziUCESsQSVIWXwTN4E2/9PpqPBgt6iEceTh5SvmtCabVbYrYPXQr0xx7LgVQC1k
         Xryw==
X-Gm-Message-State: AOAM533fuIRBGvw/6Auu/XM4e2t6a1NmGPqOU2fL1uASX/M6rm13SRhH
	Rkr8Rdo8xHSqBd7aCUMq8OFmCGbXbFPJpMjhfTOZkLxrAfk=
X-Google-Smtp-Source: 
 ABdhPJz7AgRKsgUwncIFsgWUBaKbis8dPSXi2KtJfL/24dcuKTDlPHpawy1nSMzZFexwPtOLJAmhYfeqrhBrmbhOnwo=
X-Received: by 2002:a05:620a:4103:b0:67b:49f4:3ee4 with SMTP id
 j3-20020a05620a410300b0067b49f43ee4mr4167757qko.72.1648141054679; Thu, 24 Mar
 2022 09:57:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220324090901.7061-1-mikko.rapeli@bmw.de>
In-Reply-To: <20220324090901.7061-1-mikko.rapeli@bmw.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 24 Mar 2022 09:57:08 -0700
Message-ID: 
 <CAMKF1sq7nGjy7Bnkw5D5qmqEEtgG3-fFfmz=HTdu+fbwVTmeYQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 0/2] polkit: switch from mozjs to duktape
 javascript engine
To: Mikko Rapeli <mikko.rapeli@bmw.de>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Mar 2022 16:57:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96201

v2 of first patch applied the second patch does not apply, Can you
send full series rebased on top of master next ?

On Thu, Mar 24, 2022 at 2:09 AM Mikko Rapeli <mikko.rapeli@bmw.de> wrote:
>
> From: Mikko Rapeli <mikko.rapeli@bmw.de>
>
> polkit 0.121 will contain support for duktape but the patch applies
> to 0.119 already so use it to get rid of mozjs and free 20 Mb of space.
> Pick some CVE patches from master while at it.
>
> Mikko Rapeli (2):
>   polkit: add patches for CVE-2021-4034 and CVE-2021-4115
>   polkit: switch from mozjs to duktape javascript engine
>
>  ...l-privilege-escalation-CVE-2021-4034.patch |   82 +
>  ...0002-CVE-2021-4115-GHSL-2021-077-fix.patch |   86 +
>  .../0002-jsauthority-port-to-mozjs-91.patch   |   38 -
>  ...ded-support-for-duktape-as-JS-engine.patch | 3460 +++++++++++++++++
>  ...re-to-call-JS_Init-and-JS_ShutDown-e.patch |   63 -
>  .../recipes-extended/polkit/polkit_0.119.bb   |    8 +-
>  6 files changed, 3633 insertions(+), 104 deletions(-)
>  create mode 100644 meta-oe/recipes-extended/polkit/polkit/0001-pkexec-local-privilege-escalation-CVE-2021-4034.patch
>  create mode 100644 meta-oe/recipes-extended/polkit/polkit/0002-CVE-2021-4115-GHSL-2021-077-fix.patch
>  delete mode 100644 meta-oe/recipes-extended/polkit/polkit/0002-jsauthority-port-to-mozjs-91.patch
>  create mode 100644 meta-oe/recipes-extended/polkit/polkit/0003-Added-support-for-duktape-as-JS-engine.patch
>  delete mode 100644 meta-oe/recipes-extended/polkit/polkit/0003-jsauthority-ensure-to-call-JS_Init-and-JS_ShutDown-e.patch
>
> --
> 2.20.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#96183): https://lists.openembedded.org/g/openembedded-devel/message/96183
> Mute This Topic: https://lists.openembedded.org/mt/89995316/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

