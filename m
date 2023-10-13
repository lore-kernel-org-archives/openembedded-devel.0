Return-Path: <beniaminsandu@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8E4CCDB47E
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 14:04:30 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.39216.1697205866855111848
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Oct 2023 07:04:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ak4Be4+o;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: beniaminsandu@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1c9de3f66e5so15227395ad.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 13 Oct 2023 07:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697205866; x=1697810666; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gW+orbpuq6QtG2nIbXo/oK18Nj8TV0TfbAJQEk7cq4Y=;
        b=ak4Be4+oEgnZGwWqAZELW4mYpiKnefaq8SDGfLm7QAvpZEaApRZaOxfA71LHxELubz
         HX5YwplLSuKCWsRxwr6cLdwH6eMVACzOFU34YdxolImmbicaknB4EGSuEu8Us5xUs3G0
         kn6HhXNoo/S19qHMnWO9GX8wn0Uy/OFigmvWaDzUIdzPEqLqXgEQNjAhsbthsRxgWm2R
         Bj1Swm0mN+vzyLlX4GUuR8LRNbs5SzaCs6pVgxEXCyAA/MQ9rlIv3O8hXBMwv9GwEjtd
         DnIdC6pKwdjGw79f0bjqOf4gl0TuJ2mT2es3JB41UgmvOKFPsNIU39NPR/CJnWdBFcAy
         YwBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697205866; x=1697810666;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gW+orbpuq6QtG2nIbXo/oK18Nj8TV0TfbAJQEk7cq4Y=;
        b=lSZjrMC6gQXCJy/w3nsOlvlikPe6QYm2posbalvX1ABWJ2pn/MwGqp5P6MR+EhsT1w
         lx3XvKPwDz3JLzjD9wLTi/6caigGa0owQSrRzBflNxzyHtCHDFH/OypTyFdN/8agCpKI
         8sR9XCXWdAi9AChUjMCCoBaKcMMRrIvI1x/U9tzohWBCOOkB593n+/LLLZ2WepXxwJuM
         FLhelZCzcnCJcB84xXub63QCw2WCwR2yQCcrZ7RQvPXmLcGVtGxm9e8IlidPIo6eo6N5
         b93MpEUNor6aw3+MFQ9Wo8M6qb2PLffglvqao0qLfMLs2glNKQVnh0Gk1+8paUK5Vibk
         FSbA==
X-Gm-Message-State: AOJu0YwiC+0n8P/y+K1j3P2pUd6Tdsw/KXHNDPV0C2APfTZdFGHLtzU4
	wQPJK+Dqn7IAf9NR8X0nO5k+GaOl4+34hfBk+qw=
X-Google-Smtp-Source: AGHT+IE24d3OfT+bumEGT10hIyVuBzOXZWh6/T/V4rxS+85TgAObTdhhK+P+G5n3P7x8D3+CwTojfeBQ1H3Blk3U+ao=
X-Received: by 2002:a17:90b:3911:b0:268:5431:f2a7 with SMTP id
 ob17-20020a17090b391100b002685431f2a7mr25940688pjb.28.1697205865829; Fri, 13
 Oct 2023 07:04:25 -0700 (PDT)
MIME-Version: 1.0
References: <20231013125705.322898-1-beniaminsandu@gmail.com> <ZSlEMt2vRc-57r-t@nuoska>
In-Reply-To: <ZSlEMt2vRc-57r-t@nuoska>
From: Beniamin Sandu <beniaminsandu@gmail.com>
Date: Fri, 13 Oct 2023 15:04:14 +0100
Message-ID: <CABQJdOH6wDNRbsUA3poiZWseq07uDOvN--NaTMvsHd5EDWBs=w@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH v2] mbedtls: upgrade 3.4.1 -> 3.5.0
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 Oct 2023 14:04:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105469

On Fri, 13 Oct 2023 at 14:20, Mikko Rapeli <mikko.rapeli@linaro.org> wrote:
>
> Hi,
>
> Adding CVE-2023-43615 to the commit message would be nice. Maybe
> upstream omitted that on purpose if the issue was not public
> when preparing the release.

There are actually 2 CVEs mentioned in the release notes, but not in
the changelog file. It was silly of me to not double check before
copying that. Will send a v3 soon which mentions both of them. :)

Thanks,
Beni
>
> https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2023-10-1/
> mentions that TLS with null cipher and RC4 are affected but I hope those
> are not used in any real products.
>
> Cheers,
>
> -Mikko

