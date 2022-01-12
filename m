Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDBF7C433EF
	for <webhook@archiver.kernel.org>; Wed, 12 Jan 2022 04:34:35 +0000 (UTC)
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com
 [209.85.166.41])
 by mx.groups.io with SMTP id smtpd.web10.19086.1641962074753763528
 for <Openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jan 2022 20:34:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ouLD+tcS;
 spf=pass (domain: gmail.com, ip: 209.85.166.41, mailfrom: ticotimo@gmail.com)
Received: by mail-io1-f41.google.com with SMTP id i82so1908001ioa.8
        for <Openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jan 2022 20:34:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=SozgoGgdI3ohvW2B/u29kKicM1BqPn1JPsQlWZQ8Wgs=;
        b=ouLD+tcSHApeaMSvo4bVUQJjS5SC0jsUY35J8KEv7lanIA7VzBN7AYsTdNhlFFLa5/
         5EjpLrhJwr2bvuNnu2+xTE8SFIiJtMWTrjNalxtn2SeTra3R3MIOQ6GWDvj6EZ1E1zMG
         +fMAqn/FXQjZ4WzSSMUvVgsW4PQsTexFxYQQEuY272RdEGWcdoFBxw7h4xYY8GR37Fc8
         w1WM7/bJrZXWlsRRh/zpe9hFbfvOa0Q2Gb3BSvXG2xla5JXoJhLlPU4XV2witpf754xn
         KC3zGWXldA96WplgNvCHOHFupoxfYZeCfymipaCFpfW7U6adbnD7CnuZ72DNRURUNkUY
         kftQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=SozgoGgdI3ohvW2B/u29kKicM1BqPn1JPsQlWZQ8Wgs=;
        b=024p2fv/uzihMl/qpK3N3K6h3t6Gf8kU8CAYnJR0qo9KnN+D9j8EiPmzqOS3nKc05O
         cw0/mh51QJAd6sK4XTT8AwWGhOgvrqxoovqkdwdm9hkWhBxowkLVO00HfSeQJyt7wWmk
         F23YXtxttEZOyIY1ThYHjHCGfkyEzdl6NNzGEnAh0c8q/EH4U7H1wBXhNqs9jT+gllTx
         Z0jWBtgPIgzobbyrnAlYTA8pGoxtSPSbnWoLpVDbFMlO0D7WyGdQQCuz/HUNbUJBxHNa
         6vPRhW9B+GGObT3C2dsq8eiXL7zKxe/ajojihLHEaXwSwxipwjYhMHaYVE6LSlMN+61h
         1cuA==
X-Gm-Message-State: AOAM531P/YjMjowT5AqYk6kjB1/AG6Aic9eTcsonlPBRyfT7ryzbj42R
	mkTx9P66SJRVBec1I3y/vaOj+glgcJ1I5EehHUTPrxmGbOY=
X-Google-Smtp-Source: 
 ABdhPJymWeAoUjAIB2Q/S4nAZSeRWWpj2uCBLKQSRk4Tr89hFrC61O3oRLnkREZxvtHVtZoQQHUvLfp9rrc0gn/aUiM=
X-Received: by 2002:a02:6f03:: with SMTP id x3mr2248329jab.244.1641962073705;
 Tue, 11 Jan 2022 20:34:33 -0800 (PST)
MIME-Version: 1.0
From: Tim Orling <ticotimo@gmail.com>
Date: Tue, 11 Jan 2022 20:34:22 -0800
Message-ID: 
 <CANx9H-CHGrSzA=vZUAs=5Gg=5xw4W2MUKnvANv-a7xxQvJq5qA@mail.gmail.com>
Subject: python3-cryptography "success"
To: "openembedded-devel@lists.openembedded.org"
 <Openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000002352c205d55b16cc"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jan 2022 04:34:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94769

--0000000000002352c205d55b16cc
Content-Type: text/plain; charset="UTF-8"

I finally cracked a nut that was at the root of our cross-compile woes with
pyo3, which was the root cause of python3-cryptography not building.

For those interested, my WIP branch is:
https://git.openembedded.org/meta-openembedded-contrib/log/?h=timo/python3-cryptography_36.0.1

If someone is interested, figuring out why python3-setuptools-rust-native
is not aware of where the crate:// fetcher puts things would be helpful.
For now the hack is:

CARGO_DISABLE_BITBAKE_VENDORING = "1"

This is purely a hack and should not be necessary.

Read the commit log for info.

This is not the final form of this effort.

--Tim

--0000000000002352c205d55b16cc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I finally cracked a nut that was at the root of our cross-=
compile woes with pyo3, which was the root cause of python3-cryptography no=
t building.<div><br></div><div>For those interested, my WIP branch is:</div=
><div><a href=3D"https://git.openembedded.org/meta-openembedded-contrib/log=
/?h=3Dtimo/python3-cryptography_36.0.1">https://git.openembedded.org/meta-o=
penembedded-contrib/log/?h=3Dtimo/python3-cryptography_36.0.1</a><br></div>=
<div><br></div><div>If someone is interested, figuring out why python3-setu=
ptools-rust-native is not aware of where the crate:// fetcher puts things w=
ould be helpful. For now the hack is:</div><div><br></div><div><span style=
=3D"color:rgb(51,51,51);font-family:monospace;font-size:13.3333px;white-spa=
ce:pre">CARGO_DISABLE_BITBAKE_VENDORING =3D &quot;1&quot;</span><br></div><=
div><span style=3D"color:rgb(51,51,51);font-family:monospace;font-size:13.3=
333px;white-space:pre"><br></span></div><div>This is purely a hack and shou=
ld not be necessary.</div><div><br></div><div>Read the commit log for info.=
</div><div><br></div><div>This is not the final form of this effort.</div><=
div><br></div><div>--Tim</div></div>

--0000000000002352c205d55b16cc--

