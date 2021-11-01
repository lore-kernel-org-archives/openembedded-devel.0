Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CAD4C433EF
	for <webhook@archiver.kernel.org>; Mon,  1 Nov 2021 19:18:44 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web09.1049.1635794311819895590
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Nov 2021 12:18:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=7QhyMH+B;
 spf=pass (domain: burtonini.com, ip: 209.85.128.48,
 mailfrom: ross@burtonini.com)
Received: by mail-wm1-f48.google.com with SMTP id
 67-20020a1c1946000000b0030d4c90fa87so606568wmz.2
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Nov 2021 12:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KdtD81kVIKQavhLBSXd6BFea4s6AZbTHiLJO94gAat4=;
        b=7QhyMH+BH+a1qoBO07AwTIbgCjUaC1gYIJSDZwkaKS2MAn3HQ/4PsmfYTbjJj+fwGJ
         cMiyh/z9sWbPWu9wR7z+nv6FPQcG6zOgil4R0Nt1M/99Y38bZykikcyHuB35gUEUT9ab
         D5pah9FonVQgRiTALielzApfF95GXcr7h7mDfRMeB1j4Mg3NZlUv2R3fKL4UaB7wE1rA
         4AAjUUKS8X0mZZmC40+zuK35ENAhi+3i4EIu6cp1mb1uB8BgM2DOBHIDq5TKS7T9nBNy
         TkB6ZuZzxpHta4Eaqt+dT3G+Oa2GYOHKMaESVxVq0ldYbs43vVce8qGDUxh7p6gHI9jT
         Txmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KdtD81kVIKQavhLBSXd6BFea4s6AZbTHiLJO94gAat4=;
        b=Ow7tEY8BVrYa5Eo3tf3mDTybXM/TY3cCcmLM6tUuRBYTY44EGjip8JMPxB2oOU4lK0
         szXr+q4/JYjLGrupXXaoCN4KLpvgcGj2B4xaFosQ9nJqVwmP1A6noP6uCFPJlzT0CTdo
         HUZeoMVfMcxLxH/IkKp2i87+k0CFSIomAOsA17MS+ySs2NrTg9/wW7VPDvMcj8mkchZv
         WBOllD374dn7JS9iMW7vAa9HxF2YEaN/Jw6NOPhq4ihPtBsvKcx0CsWWI5tneu7jANdh
         NCwKItwDkUOzKeJ9tIrbkTGPT2Mo/d74OrQwF43OycQFC8JKfefjVMWQWRjRr3bweknB
         6vAQ==
X-Gm-Message-State: AOAM532S4xzsLCC5B838f1sJDZorWJWFj7o8sTT6JsS1fLOg32rGLQk6
	Lw7krc9Oh02oujHVmZBHOh/Hwmm58JLC+SdLaweeqrq+OXFwDA==
X-Google-Smtp-Source: 
 ABdhPJwBHczIFsNFALqse8o1i+DDs57KykB5uWqrPM4J05QqbfWJFtGRthToPfJOsCOYnqNXKc90CfEueH2SFQBMwEM=
X-Received: by 2002:a05:600c:350f:: with SMTP id
 h15mr982308wmq.62.1635794310226;
 Mon, 01 Nov 2021 12:18:30 -0700 (PDT)
MIME-Version: 1.0
References: <20211101161831.1978140-1-ross.burton@arm.com>
 <b10ccd03-dd16-1e54-9372-1fd7c0261a8d@windriver.com>
In-Reply-To: <b10ccd03-dd16-1e54-9372-1fd7c0261a8d@windriver.com>
From: Ross Burton <ross@burtonini.com>
Date: Mon, 1 Nov 2021 19:18:19 +0000
Message-ID: 
 <CAAnfSTuGnE-=fAP4bu-k61QoD_N3EcR2QdNqUO1d8HMs+X7ZOg@mail.gmail.com>
Subject: Re: [oe] [PATCH][meta-python] python3-imgtool: add recipe
To: Trevor Gamblin <trevor.gamblin@windriver.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Nov 2021 19:18:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93752

On Mon, 1 Nov 2021 at 19:12, Trevor Gamblin
<trevor.gamblin@windriver.com> wrote:
> +RDEPENDS:${PN} = "python3-cbor python3-click python3-cryptography python3-intelhex"
>
> Did you mean python3-cbor2? The layer index suggests that python3-cbor is only in meta-iot-cloud/meta-arm/meta-ros-common.

Probably.  Very curious how this worked as I don't have that layer
locally!  I'll double-check.

Ross

