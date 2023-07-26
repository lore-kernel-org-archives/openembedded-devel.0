Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 201B4C001DC
	for <webhook@archiver.kernel.org>; Wed, 26 Jul 2023 08:32:29 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
 by mx.groups.io with SMTP id smtpd.web11.6709.1690360340393513394
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Jul 2023 01:32:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=h581pBw0;
 spf=pass (domain: gmail.com, ip: 209.85.160.47, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-1bb571ea965so2675449fac.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 Jul 2023 01:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690360339; x=1690965139;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ap9YPudjRqURIoxea/Vz8K+ZTC5lqFcTZhzRc6uskXE=;
        b=h581pBw0S0Slo38a1fIrOFKKppLXVpjJw4T3KcUij5JFaytMF9Pm/6uHIXhQo7sn0y
         O+8U1BpcnlnbNOjgfiww1ZI6OMVa3YxeeDaqSERW0MMRbG/kMXaCdam+8eGba19zWvNI
         Goeeq+0fNvyTn96kTBiyQxLQMXPyDuNP3NYoP7/D6+oXMw7fe1+UrYXKX7CvgUORxakF
         7lsVf/h3dO69cs4p5g/kxi1xFvEdSjTxlILwMvJ6c3rtJDjAiH+QFM58V1BHpnYb/shH
         moOuoO30UW7brmBxytonsrOSdkzhWWthJBvXTr0/wabnkP8LzZFdxy2kHNBV7RgTYGUN
         y1BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690360339; x=1690965139;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ap9YPudjRqURIoxea/Vz8K+ZTC5lqFcTZhzRc6uskXE=;
        b=hduDKmaQay56uSn8b/F0waLWDlRBhmKMksF3U7xH+Rih5TXAh1yQyf6SfId/5GNSnn
         T5lUy0MwYBaCZq2+441OgmdgdeELH0y71sHqIiAL6+4TfadatQalJYcQz6c4B2Tj4J0C
         Yz/tuGn7uY7wEXPg6RjUdZGJDHtfm0kUWTlh1/bQEmnbVK+91DoGW7pfY7xuPL0CCYla
         NaCguBVhzCws92PzpAT38n0xQazdMOtLf7U+QWIi+6MqptQJ0bWBuA/LE0rCFffpj8UM
         XXNI1OV8aATUcxEvvsTaIYvbNikIlKNWt9izVOi6+sgcwar/dZ4w4yQq/b/6sQfdt8Sj
         h1/w==
X-Gm-Message-State: ABy/qLZHJKJgBJdFCyjt3KKZBDgtyDcxLdsiM0eW12AFphmDslmsboJ0
	kwFYhUwB7UGW+NwMs/IU8cAFEFd4GjfD0Z5KllE=
X-Google-Smtp-Source: APBJJlEmKE0WviLVWCz90AgN1LW6r4K6af/aNkJyfU7Z4mmobqco0N9rr4vp+KlYiRb11JiMLaAWlhA0bS0IbkDv1JA=
X-Received: by 2002:a05:6870:638c:b0:1bb:831b:79e6 with SMTP id
 t12-20020a056870638c00b001bb831b79e6mr1689083oap.16.1690360339524; Wed, 26
 Jul 2023 01:32:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230724113527.141274-1-andrej.valek@siemens.com> <23f21fb658e12efe80dce29b82c1fa87cd60874d.camel@siemens.com>
In-Reply-To: <23f21fb658e12efe80dce29b82c1fa87cd60874d.camel@siemens.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 26 Jul 2023 01:31:53 -0700
Message-ID: <CAMKF1sq0SUzD6EG1OoqwD-3uuC5j1BczOKQjb8a6=wKJJRf6jw@mail.gmail.com>
Subject: Re: [meta-oe][PATCH] cve_check: convert CVE_CHECK_IGNORE to CVE_STATUS
To: "Valek, Andrej" <andrej.valek@siemens.com>
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Jul 2023 08:32:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104032

On Wed, Jul 26, 2023 at 1:09=E2=80=AFAM Valek, Andrej <andrej.valek@siemens=
.com> wrote:
>
> Hello Raj,
>
> Not sure if you realized, that I made a huge "conversion" for meta-oe as =
same as
> here
> https://git.yoctoproject.org/poky/commit/?id=3Dc15e506a4674e558922c5a7551=
2ca2b5c296cd44
> .
>
> Could you please take a care of it?

This patch did not appear in patchwork perhaps some issues with size
maybe I have no idea.
Can you resend

>
> Thanks,
> Andrej
>
> On Mon, 2023-07-24 at 13:35 +0200, Andrej Valek wrote:
> > openembedded-devel@lists.openembedded.org
>

