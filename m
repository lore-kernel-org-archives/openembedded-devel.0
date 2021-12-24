Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF61EC433EF
	for <webhook@archiver.kernel.org>; Fri, 24 Dec 2021 05:39:41 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web12.42642.1640324380410793627
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Dec 2021 21:39:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iYaat2g5;
 spf=pass (domain: gmail.com, ip: 209.85.222.178,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id i130so6515899qke.3
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Dec 2021 21:39:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wQms1LwFo6y8wH90SpIKe8Dv2Ig7/ooeAo0QHZau00s=;
        b=iYaat2g5TTWbtLwSdKLYvRF6CXMvZ2GeO9x/5+NmSXcsOzAdPEuveZBmeOQN+KbFwn
         IOL10Z+yYh3kPNZjfU2WwP1UO89K88DrkMiaGzdMdv1PvICh3qhuQ/k5D5N8rddiOWDx
         kaL6aFMVxrvT/a0RxFDTiZ9r6Y0Yn9Zc9qJsnon6sN2aczGP/WB/x5aXdmfESeEVEnrK
         1a81vTOxuE6cbOdCa8qlDo87smxYBuTDNk+ixK4rBEBf5T43wrMmcy+I1CoqN8FvgB7r
         Jpg3F1tUUUYy8l1sInE38Q0Rfny8a4lMnwfAqtB50hkQofH7jOnm2tVB+EuLCWrHf7g4
         eKQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wQms1LwFo6y8wH90SpIKe8Dv2Ig7/ooeAo0QHZau00s=;
        b=TeG4zZ3YrJPTjSg46lGh4G20tFGe0179XAfmuQ1Z7SdGmEHACs1L1BUBzguUucrveE
         u/5Q+AB4ve90880r5XUf4jVcPwAJz/hz0xccZ6BCEovz06SI7leuGXnap/3JSYP58rFh
         6rqV0tzc1M3+8poSBeJU90vtyZ6+BlvWDg4+AO9l/eyTHLzqkkN4P1PfhwJaWPz+eXk3
         1NXAsR2ROrTqFbs4+0nxeJ2C8eRkE72Ti2Wm00tvyoPANpz3YXcv17+JYqL9ufimsZoO
         Zq9T1AGC4xD2aeDOBrlsjPSw1uCTPhUyiQp0vlIOcFDvfpF+MonCTME/VNeftw3fsLJl
         ez5g==
X-Gm-Message-State: AOAM531pyc9CrxJPDeAwLSgcGDiWso/uIlrBsvpEDAnmf6MxEAklaOuD
	EBpCmWjmOrld0KKESlXCRFYEbzXU1xS2Ee0vwqAUezhBf6TiGQ==
X-Google-Smtp-Source: 
 ABdhPJyjlIQ7/sfSJmFcp2bQsZB03WmXE+P6QdYGX3a9vMVoNK3kUPwoKgyjAN+5el7wsU80qabhWbFHGTW199WL+Cw=
X-Received: by 2002:a05:620a:11b8:: with SMTP id
 c24mr884436qkk.227.1640324379366;
 Thu, 23 Dec 2021 21:39:39 -0800 (PST)
MIME-Version: 1.0
References: <20211224034425.336596-1-jpuhlman@mvista.com>
In-Reply-To: <20211224034425.336596-1-jpuhlman@mvista.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 23 Dec 2021 21:39:13 -0800
Message-ID: 
 <CAMKF1sqpRPqdfdK+mK-tEB03vtN1SOEnO9np2BfhY1hq5u6MzA@mail.gmail.com>
Subject: Re: [oe] [meta-multimedia][PATCH] cdrkit: Allow PN to be empty.
To: Jeremy Puhlman <jpuhlman@mvista.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Dec 2021 05:39:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94490

On Thu, Dec 23, 2021 at 7:44 PM Jeremy Puhlman <jpuhlman@mvista.com> wrote:
>
> If you add -dev packages to an image, as in an
> sdk, ${PN}-dev is pulled in, which depends on ${PN}
> which no longer exists in the new package layout.
>
> Error:
>  Problem: conflicting requests
>   - nothing provides cdrkit = 1.1.11-r0.1 needed by cdrkit-dev-1.1.11-r0.1.corei7_64
> (try to add '--skip-broken' to skip uninstallable packages)
>
> Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
> ---
>  meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb b/meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb
> index c89204062..2e295388d 100644
> --- a/meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb
> +++ b/meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb
> @@ -25,6 +25,8 @@ RDEPENDS:dirsplit = "perl"
>
>  PACKAGES =+ "dirsplit genisoimage icedax wodim"
>
> +ALLOW_EMPTY:${PN} = "1"
> +

i think adding something like

RDEPENDS:${PN}-dev = ""

might be preferred here.

>  FILES:dirsplit = " \
>      ${bindir}/dirsplit \
>  "
> --
> 2.31.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#94489): https://lists.openembedded.org/g/openembedded-devel/message/94489
> Mute This Topic: https://lists.openembedded.org/mt/87931432/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

