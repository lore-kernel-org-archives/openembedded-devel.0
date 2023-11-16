Return-Path: <hnd@dorscm.wakeful.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9AC3C197A0
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 21:19:40 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web11.18318.1700169576326830727
 for <Openembedded-devel@lists.openembedded.org>;
 Thu, 16 Nov 2023 13:19:36 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: dorscm.wakeful.net, ip: 209.85.216.48, mailfrom: dorscm@dorscm.wakeful.net)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-28397a2c402so103619a91.2
        for <Openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 13:19:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700169575; x=1700774375;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wrmHqvps7ZUCXWbqbg0CicvCB/I482hrEkHyqIfbmnQ=;
        b=AhStNoW2ZdAy30/jSEs+4PsHG7mawY4R2d6Vfgj5NdjK+hmZSQ36rDzKRIZMpbSAIC
         z2ZnMggGHPkFwdqWWQSi7DCryEEkB0AsuqkrPHKoyjNtwApYJwQcb38H+x1Y09x95fzX
         AvXeJ7L7p04n/fLGRIdU4PqNIvS2jinCAO9xDJFgJ4W92jpQ0IZjYBeAjDjvCmMgL92A
         w26xATZiaRdgvuaKoGygvRVy8VRMMj+sSfiPH76sjzBcHsF1QpelPKB94eQJiFMnWUty
         a1qr6mZtCV1sFzQ1Rklcg2wpJTnzlw7Z8D61pauazhXCnba34lgCmJRixinmrBAlHPhp
         peaQ==
X-Gm-Message-State: AOJu0Ywa9qVNcMJEBilnucIHwqbGzloqeHLF0qbIGJ6kUgVbrLL2b1Ft
	CIoo4O9Iw0awv5w60D3nJx3ZbAze5pvmfbbCp/IigBNX2nr3qwk+YO8=
X-Google-Smtp-Source: AGHT+IFNFQTnehAf8r+eliyY1I6+wrEX9oU/JcRtlFH0ALQFSFiQHXLm4iODd40Q4FLHrMW27AgE6qfOMU4XKFc75aE=
X-Received: by 2002:a17:90b:1646:b0:27d:1538:e324 with SMTP id
 il6-20020a17090b164600b0027d1538e324mr15811025pjb.32.1700169575458; Thu, 16
 Nov 2023 13:19:35 -0800 (PST)
MIME-Version: 1.0
From: Matt Dorsch <hnd@dorscm.wakeful.net>
Date: Thu, 16 Nov 2023 16:19:23 -0500
Message-ID: <CAFWmYv0mYFjLuegx+LyVQDQEVmzXUyuU49qjsH7Bw6WOkRVaPw@mail.gmail.com>
Subject: Maintainer for Qualcomm Adreno 650 OpenCL Library
To: Openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000009a808d060a4b930f"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 21:19:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106828

--0000000000009a808d060a4b930f
Content-Type: text/plain; charset="UTF-8"

Good afternoon,

I've run into an issue in the OpenCL Library for the Qualcomm Adreno 650
chip. This library is delivered to Ubuntu 18.04 via the package qti-adreno.
The info for this package lists the maintainer as "OE-Core Developers <
openembedded-core@lists.openembedded.org>" and a homepage of
http://support.cdmatech.com . Should I be asking for help with the issue
here or via support.cdmatech.com ? If it helps, the issue I'm seeing occurs
when I try to use clFFT, which is the standard library for performing Fast
Fourier Transforms via OpenCL. I can debug far enough to lead me to think
that something is wrong with the OpenCL barrier function for the Adreno. At
a higher level, more than half of clFFT's 16,000 self-tests fail on the
Adreno. clFFT runs correctly on NVIDIA GPU (including all 16,000
self-tests), so I suspect the issue is with the Adreno OpenCL
compiler/driver/hardware.

Thank you in advance for any advice you can provide on where I should go to
seek help.

Matt

--0000000000009a808d060a4b930f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Good afternoon,</div><div><br></div>=
<div>I&#39;ve
 run into an issue in the OpenCL Library for the Qualcomm Adreno 650=20
chip. This library is delivered to Ubuntu 18.04 via the package=20
qti-adreno. The info for this package lists the maintainer as &quot;OE-Core=
=20
Developers &lt;<a href=3D"mailto:openembedded-core@lists.openembedded.org" =
target=3D"_blank">openembedded-core@lists.openembedded.org</a>&gt;&quot; an=
d a homepage of <a href=3D"http://support.cdmatech.com" target=3D"_blank">h=
ttp://support.cdmatech.com</a> . Should I be asking for help with the issue=
 here or via <a href=3D"http://support.cdmatech.com" target=3D"_blank">supp=
ort.cdmatech.com</a>
 ? If it helps, the issue I&#39;m seeing occurs when I try to use=C2=A0clFF=
T,=20
which is the standard library for performing Fast Fourier Transforms via
 OpenCL. I can debug far enough to lead me to think that something is=20
wrong with the OpenCL barrier function for the Adreno. At a higher=20
level, more than half of clFFT&#39;s 16,000 self-tests fail on the Adreno.=
=20
clFFT runs correctly on NVIDIA GPU (including all 16,000 self-tests), so
 I suspect the issue is with the Adreno OpenCL compiler/driver/hardware.</d=
iv><div><br></div><div>Thank you in advance for any advice you can provide =
on where I should go to seek help.</div><div><br></div><div>Matt</div></div=
></div>

--0000000000009a808d060a4b930f--

