Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB146EB64D9
	for <webhook@archiver.kernel.org>; Mon, 10 Jul 2023 17:48:01 +0000 (UTC)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
 by mx.groups.io with SMTP id smtpd.web11.46606.1689011281003716826
 for <Openembedded-devel@lists.openembedded.org>;
 Mon, 10 Jul 2023 10:48:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=q89W4SGD;
 spf=pass (domain: gmail.com, ip: 209.85.219.178, mailfrom: ticotimo@gmail.com)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-c6e4d4c59bcso4793396276.1
        for <Openembedded-devel@lists.openembedded.org>; Mon, 10 Jul 2023 10:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689011280; x=1691603280;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MxNZD96lMo5uU0JPi2nSKLxoqWvy3QVxnbLIGt0BnlA=;
        b=q89W4SGD+5oLXwDaBb0+kpsBoUdnIuBtcgAl6I4qocNjwmeHB1rvOXiJUSLqu6cc7L
         QcZP3+Q1UWg6QFlPrIEtR7U6/QDPArtyo3f/LhvtZR8BT6XJS7Nyot5FDZWDwBWqIZxH
         XruSVypzqGpiOZ4+4QdME3L9Yo37ABLsdKiF+3JIftcEO/8/6YrcMPaOC94G0MOhOc6x
         LiSdd9jhb3ZcOKLT/sbLzW8orVoVsfo+Zkz4kil3hZnZgNP3u2bCbUGDkR5tEJbEsJHs
         RDZFfFpVm+uxW1ZnTJa7v+7Zny4DeEGyKWtBWCeWUhHr4KUW9EnicuFfdtRR6fAavAMf
         PWng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689011280; x=1691603280;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MxNZD96lMo5uU0JPi2nSKLxoqWvy3QVxnbLIGt0BnlA=;
        b=k63gVG/U1rVaCiaK1mnSRpN9arO+QdVccnTR3FfaXiaiOzTgNtLJLn2CwnXEjeULND
         xa7x4xcWwMYLeo/eTre1zh5I59/qCxbpyhr2ZEjH3gduGEcmDnLRqUblQngWe6IoP+hV
         JlL+I9Ibppn7q6J9N7hfKjqseBye0ONSdgd4VXIR05eI0h+prODzgn06T30SIv7e3uDp
         dH9I2mqqcIizCo//rgZQo+C320xLGBIOEoqW0ZweQhskG+ULXO+Mg/ET8o5mhFZrnJ5S
         SXWYgXuq3kHuoalLyyDCuY5pV8ZmfE+HvVQ0SnAv611+YLDJCxNMimFzzO7I79B+XR/C
         Hfew==
X-Gm-Message-State: ABy/qLZVJ+04FaLv5TFWJACyZ5JRygKN3Av+qGbIWZBPKegTy9aYuX+M
	a/wibLA7Vp0IXBLKceCTW17UKKuD8uN8PqtI/jsqxbD7Pu9Plg==
X-Google-Smtp-Source: APBJJlGYsB1rKioAoCUjnwDylFqiAO47yI32sS2y0bXVouSyIDKHGHN3hIrYoDrP2AwiNa/g4+1PQ+EvIR/qwHDDCrA=
X-Received: by 2002:a0d:d78a:0:b0:577:41e2:5011 with SMTP id
 z132-20020a0dd78a000000b0057741e25011mr11185684ywd.26.1689011279667; Mon, 10
 Jul 2023 10:47:59 -0700 (PDT)
MIME-Version: 1.0
From: Tim Orling <ticotimo@gmail.com>
Date: Mon, 10 Jul 2023 19:47:48 +0200
Message-ID: <CANx9H-Cj9yZsFk5dpkWjQ3AqCvOKRxYQj1px6aVpO4FGx=mf3g@mail.gmail.com>
Subject: New AUH runs coming for meta-python/meta-perl
To: "openembedded-devel@lists.openembedded.org" <Openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000058a49a0600259524"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Jul 2023 17:48:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103727

--00000000000058a49a0600259524
Content-Type: text/plain; charset="UTF-8"

I have been running my own local Auto Upgrade Helper (AUH) jobs for a
couple years now. I finally have some infrastructure set up to have the
emails come from auh@moto-timo.dev. The jobs attempt to build for
qemux86-64, qemux86-musl and qemuarm64.

My intent is to run this job "every two weeks", like the AUH job that runs
on the Yocto Project AutoBuilder cluster.

Expect about 72 recipes from meta-python (and python recipes in meta-oe) to
need upgrading, about 20 will succeed, the rest will be a mix of
do_compile, devtool and other failures. A lot of the failures are likely to
be a migration from setup.py (our setuptools3 bbclass) to pyproject.toml
(one of python_*.bbclasses added around the kirkstone time frame).

Expect about a dozen and a half meta-perl (and perl recipes in meta-oe) to
need upgrading. A few have long standing issues with upgrading... they just
need some attention.

Any help with the recipe upgrades, especially the failures, is much
appreciated. Ask questions if you need a guiding hand. Please do take the
time to put something useful (at list a link to the "changelog" for the
recipe's git repository) in the git commit message. This really helps
stable branch maintainers know what to take for backports and is a huge
help to those of us sipping from the firehouse of patch review.

Let me know what you think.

--Tim "moto-timo" Orlilng

--00000000000058a49a0600259524
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I have been running my own local Auto Upgrade Helper (AUH)=
 jobs for a couple years now. I finally have some infrastructure set up to =
have the emails come from <a href=3D"mailto:auh@moto-timo.dev">auh@moto-tim=
o.dev</a>. The jobs attempt to build for qemux86-64, qemux86-musl and qemua=
rm64.<div><br></div><div>My intent is to run this job &quot;every two weeks=
&quot;, like the AUH job that runs on the Yocto Project AutoBuilder cluster=
.</div><div><br></div><div>Expect about 72 recipes from meta-python (and py=
thon recipes in meta-oe) to need upgrading, about 20 will succeed, the rest=
 will be a mix of do_compile, devtool and other failures. A lot of the fail=
ures are likely to be a migration from setup.py (our setuptools3 bbclass) t=
o pyproject.toml (one of python_*.bbclasses added around the kirkstone time=
 frame).</div><div><br></div><div>Expect about a dozen and a half meta-perl=
 (and perl recipes in meta-oe) to need upgrading. A few have long standing =
issues with upgrading... they just need some attention.</div><div><br></div=
><div>Any help with the recipe upgrades, especially the=C2=A0failures, is m=
uch appreciated. Ask questions if you need a guiding=C2=A0hand. Please do t=
ake the time to put something useful (at list a link to the &quot;changelog=
&quot; for the recipe&#39;s git repository) in the git commit message. This=
 really helps stable branch maintainers know what to take for backports and=
 is a huge help to those of us sipping from the firehouse of patch review.<=
/div><div><br></div><div>Let me=C2=A0know what you think.</div><div><br></d=
iv><div>--Tim &quot;moto-timo&quot; Orlilng</div></div>

--00000000000058a49a0600259524--

