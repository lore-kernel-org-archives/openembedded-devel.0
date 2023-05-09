Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F997C77B75
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 17:57:24 +0000 (UTC)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
 by mx.groups.io with SMTP id smtpd.web11.40185.1683655039135678135
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 May 2023 10:57:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=fBP81Zdb;
 spf=pass (domain: gmail.com, ip: 209.85.167.181, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3940db1c14dso321052b6e.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 May 2023 10:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683655038; x=1686247038;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Q2jbX7xMU9lR/OLHL/S+0xM/kaUAXAqZwj7oiORUdA=;
        b=fBP81Zdb48eO+Swn6zYUBOpwzKWi5YTp9qfS/yJ1EUCP618MUasYmB8H5NZNfKhfJg
         ZaoCJrlwGrFbDKWRgdjlCAE3voRmlVhTwqV1ZS2TNyHOkOj3gn+IbGXnsIRIoXZ3+Bb6
         6KcVC2ZQ+L1oQZO2gNfh09JVRQijFs9w/vAshJGyLdyG/glWFWqW4Z+OxlZkc/wL/iX1
         nJQiSMFMVXd+P7CZ1b1I4f22Zy6WhrHzCkVEL/Aq6S7wsFJ+rApawYh9OE8Qn0lyVpC1
         F8b5rRcH7X709/OEL3KnTdOfFgGqdLcUBjQ168+r4PJ/u3I2eRWM0Em2pP26BhhAyrmD
         s0Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683655038; x=1686247038;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Q2jbX7xMU9lR/OLHL/S+0xM/kaUAXAqZwj7oiORUdA=;
        b=PzS1PF2CSf5BFyOqhhf+cKAHp8IjBelzsCJgVurjKH9hgwDIj586P6jZQ9V2/nF/Zm
         5hSDseIeUB4sBXFc1HqEMkH1+p/2Xr4NFh3nDaiZS87p6u1iu++rfOHIMbmTZr+XTU72
         Sdsje/J6n0rt03AO7aLdCSaGGnjwwf68iWJFl9XKexfFRudZ2Q2tAlV5fYoqIg/086CV
         7GScz4xdWLP976OgYB4c93syfcz5M0bD7EjvE2Gs9NDE9vqXKOezVbT774sLDq7f4Ipr
         MGZPxRErzJqMs+AREeK5G+bCq5gUmxD+qKOwSGpt5s/k7TatJvWBUdZQ2zvnw0JxRsQ3
         g/vg==
X-Gm-Message-State: AC+VfDyxcVajgKC9YSk5TG2kacbHlH0KTnMW0UwhYyDZJPxIfYZX2cDi
	Zy8+8vcLumyrgkCbAseXDREKPzjT1HZbTeVeUq8=
X-Google-Smtp-Source: ACHHUZ6dF9KX+qBB3g95YoB1ldDvpMMbLM2fs361v8XG0RdgBBboc36RDeb5Njnxak/LbDdYKx2xBMfqRPn7or440rU=
X-Received: by 2002:a05:6808:3a89:b0:390:9228:c772 with SMTP id
 fb9-20020a0568083a8900b003909228c772mr1539924oib.52.1683655038229; Tue, 09
 May 2023 10:57:18 -0700 (PDT)
MIME-Version: 1.0
References: <175D6764FA66605D.26836@lists.openembedded.org> <CABymUCP5MBU+T1q8WTf1oraeC0OJq2W5XLFoDT4jW3P1wh3MVQ@mail.gmail.com>
In-Reply-To: <CABymUCP5MBU+T1q8WTf1oraeC0OJq2W5XLFoDT4jW3P1wh3MVQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 9 May 2023 10:56:52 -0700
Message-ID: <CAMKF1so6txL4o_vb8F=m5DFowTa75vw=FEs=p-1YgbFhg2vxLg@mail.gmail.com>
Subject: Re: [oe] [meta-oe 0/3] Add necessary lib and python tool to handle
 CoSWID tag
To: Jun Nie <jun.nie@linaro.org>
Cc: richard@hughsie.com, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 May 2023 17:57:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102514

Thanks for your contribution. You could use something like

git format-patch --subject-prefix=3D'meta-oe][PATCH' -1

to create a patch

On Tue, May 9, 2023 at 12:02=E2=80=AFAM Jun Nie <jun.nie@linaro.org> wrote:
>
> Sorry for the un-aligned title pattern. I do not find any option in
> manual of git-format-patch to generate "[meta-oe][PATCH 1/3]" like
> title. Please help indicate how to generate that if you know. Thanks!
>
> - Jun

