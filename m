Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99398C433EF
	for <webhook@archiver.kernel.org>; Thu, 24 Feb 2022 04:53:51 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web10.6632.1645678430753918181
 for <Openembedded-devel@lists.openembedded.org>;
 Wed, 23 Feb 2022 20:53:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PRbqWl9R;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: ticotimo@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id p9so1839381ejd.6
        for <Openembedded-devel@lists.openembedded.org>;
 Wed, 23 Feb 2022 20:53:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=sY0fyLC32HmPJVXKKC2+t3sOkOB2WK0/y0IdG/xGOIc=;
        b=PRbqWl9RVPs7n27RCkWC+Y3S+Qy+A5RdPkTgyCRpueXcURo8cKEktwyWwl4DZpK9EE
         KA3KxF2ExiAcmoMKWdzXppqNkClprn2X3llD7UlvvbydAJfXCXmu3iK8dPxTx0ExJgfE
         0KHRrtQ+xt7l1na5jx5CRFB9OmEI84jbqKPQGSa6w/dUtj2OlOcS8LGiK7xOJlWJnCCY
         dOl9YZfS5FB5N8/h0ZPt1HNuGCZDuIJg009l8mzi6qM42FYHJW6lwKRiRmq6szcyeIN5
         dGcvGnar/ucIJW6uZ3KCem6/B6JhHEe1tK2ZE646TY0LrSPRhf5t6dDgwpkhfXF/WRJj
         k8XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=sY0fyLC32HmPJVXKKC2+t3sOkOB2WK0/y0IdG/xGOIc=;
        b=UYroBL3U80t4sFHI7ggTRla3WTGqDeHV/c/oOL0VYKAV991MZrf5TIMbmr2k3iP7wV
         FnsbuSmQ5dbGqjwrOKsH2fMlJ9Z1UwFPyJkfsSXy5CXcRBfUGPBVpFUBxyA0HEzUvDBb
         8YemiQxSkmR+aU8w0MCApWPVaX3dAVoXBORccFTPzwAKchxsGyXFBShA2KzWiMYkIrwI
         WmHaq6W8yKYBdZjhDEAWVBwOQ8eC/UadraXhXQniw/UL3oAsOirYNkDMBlIowFRYr5RY
         68jCpPgf720Lm4qINEH417m688FFAqK9PdA2eLIwlYMMOa6lpMFStYn4gn7FmHs6v6TR
         Y5uw==
X-Gm-Message-State: AOAM532DQtRqR0qRzh8cuOK3d1q4c52AX3ljnPkmuj0PB1BUX8KZDxtD
	w/k8g7w4LD8qIRQ8h8/k+S6J7tWfzWulQuFE5hev/lGmCkBS/w==
X-Google-Smtp-Source: 
 ABdhPJw43Kn3id/MeYRwgjpDhCqyJq6nhzFxqEMqPotbl+2hXjFIcKszqX5B7YwS0n0KnPs3AUV+7xgA7H1v3Q/SuZo=
X-Received: by 2002:a17:906:f293:b0:6b6:bc93:f01f with SMTP id
 gu19-20020a170906f29300b006b6bc93f01fmr721552ejb.743.1645678428970; Wed, 23
 Feb 2022 20:53:48 -0800 (PST)
MIME-Version: 1.0
From: Tim Orling <ticotimo@gmail.com>
Date: Wed, 23 Feb 2022 20:53:38 -0800
Message-ID: 
 <CANx9H-Bs=XCdmTCE8uhqEtWYBNBotJA-sb-DOx-RZafs2FxRdA@mail.gmail.com>
Subject: Fix for python3-setuptools-rust-native
To: "openembedded-devel@lists.openembedded.org"
 <Openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000002c620c05d8bc5e81"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Feb 2022 04:53:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95493

--0000000000002c620c05d8bc5e81
Content-Type: text/plain; charset="UTF-8"

I have a patch staged to fix python3-setuptools-rust-native (but it depends
on pending patches just sent to oe-core).

This branch is where I will be staging fixes for meta-python, as time
permits.

https://git.openembedded.org/meta-openembedded-contrib/log/?h=timo/pyprojecttoml

Please realize that I also need to spend time on the documentation for the
changes in oe-core and have other customer work that must be done as well.

Regards,

--Tim

--0000000000002c620c05d8bc5e81
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I have a patch staged to fix python3-setuptools-rust-nativ=
e (but it depends on pending patches just sent to oe-core).<div><br></div><=
div>This branch is where I will be staging fixes for meta-python, as time p=
ermits.</div><div><br></div><div><a href=3D"https://git.openembedded.org/me=
ta-openembedded-contrib/log/?h=3Dtimo/pyprojecttoml">https://git.openembedd=
ed.org/meta-openembedded-contrib/log/?h=3Dtimo/pyprojecttoml</a><br></div><=
div><br></div><div>Please realize that I also need to spend time on the doc=
umentation for the changes in oe-core and have other customer work that mus=
t be done as well.</div><div><br></div><div>Regards,</div><div><br></div><d=
iv>--Tim</div></div>

--0000000000002c620c05d8bc5e81--

