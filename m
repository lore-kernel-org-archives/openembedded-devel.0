Return-Path: <mhalstead@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B25BC4345F
	for <webhook@archiver.kernel.org>; Wed, 17 Apr 2024 17:30:34 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web10.20341.1713375032979962871
 for <Openembedded-devel@lists.openembedded.org>;
 Wed, 17 Apr 2024 10:30:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bEzhNajY;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.167.52, mailfrom: mhalstead@linuxfoundation.org)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-516d1c8dc79so7592559e87.1
        for <Openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1713375030; x=1713979830; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=q16Np01xDnq40tAejUVLX1L/tY+f9jRT+TbqB0r0Gc8=;
        b=bEzhNajYNvB1d2TUAyA8LrYipe/lbXndSVl2o2WDGmNy+Vntqo0uNOMch9X2KGyT3o
         YWLkAcPnqX91noy+dQh7a1X5kZ675HQApiKVpa742TdTMRz7ZrjJS1RPem9f2E7+kyph
         4jk7ntLtGPK5v9W5L+jvH59eZ0NCCV/o3zL+I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713375030; x=1713979830;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q16Np01xDnq40tAejUVLX1L/tY+f9jRT+TbqB0r0Gc8=;
        b=wBsXDdESPQ/MR6A72Nt/xAqFAlz2rXf8MsFasjQFXQV3XQJP7UkglbpW1nIg0hmmgT
         FAs7HdZ6xT2wTqlT+3Os4oLRWK/6Y7V9qihXgqCyv32j5/x3tjK2ckjyuId2LBfIIZNm
         p0H3fxVpsk782+w8gArzZzoJ9/WOT1QO261jqBQuylsfBfUKFK5LjSgKiUZvwyzGGw46
         IUgW0TyOY4sUisDsQwxLcd4igapjpII1KVEnPF/LuYQx5n0iAwxAcEpuAv9CzWj11IfL
         xaRsdSWNYbB/OwDvmdbuar9NMXp8bU9thSRe864vD2N8nkf8769tGoe9+ikZ6rzCMZRE
         N7Nw==
X-Gm-Message-State: AOJu0YyCdgknbHpC9Dg/fKmQKBn1+Rwh4iTSfdMHvbWExYCrUIYSqTTH
	9jH+3pnzLF30HblnuuDJUmjdfMWJGGrYK3ofkeo+LAexSzTwzVxGPUdl8isON8orgxpVoqUT5Qs
	4g09dzOSE3bhWd4sJpcoGybN7peXDu+7l97fXPf7BDdGHZ4F/bLQ=
X-Google-Smtp-Source: AGHT+IGGvX6xBIwzUgfaSZfzR6EkplmzFARlEu+T3cd5uGcLKJUon68oBcTvWuLU0z1VINmJ5Acfc0GG7Vxn8qX9T6s=
X-Received: by 2002:ac2:5049:0:b0:518:9b42:b846 with SMTP id
 a9-20020ac25049000000b005189b42b846mr9558416lfm.21.1713375030221; Wed, 17 Apr
 2024 10:30:30 -0700 (PDT)
MIME-Version: 1.0
From: Michael Halstead <mhalstead@linuxfoundation.org>
Date: Wed, 17 Apr 2024 10:30:18 -0700
Message-ID: <CADfgfoZdquuYzpM8Qw6nq9ewJatPWmz_OYzTtjN3s8JRwLqddQ@mail.gmail.com>
Subject: [infra] layers.openembedded.org: 8 minute outage
To: openembeded-devel <Openembedded-devel@lists.openembedded.org>, 
	yocto-infrastructure <yocto-infrastructure@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="0000000000000b40c806164e363e"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 17:30:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110045

--0000000000000b40c806164e363e
Content-Type: text/plain; charset="UTF-8"

We had an 8 minute outage of the Layer Index today when its IP address
changed unexpectedly during resource autoscaling. The server is now better
sized for performance and is operating normally.

Down: Wed Apr 17 16:49 UTC
Restored: Wed Apr 17 16:57 UTC

-- 
Michael Halstead
Linux Foundation / Yocto Project
Systems Operations Engineer

--0000000000000b40c806164e363e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>We had an 8 minute outage of the Layer Index today wh=
en its=C2=A0IP address changed unexpectedly during resource=C2=A0autoscalin=
g. The server is now better sized for performance and is operating normally=
.</div><div><br></div><div>Down: Wed Apr 17 16:49 UTC</div><div>Restored:=
=C2=A0Wed Apr 17 16:57 UTC<br clear=3D"all"><div><br></div><span class=3D"g=
mail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signat=
ure" data-smartmail=3D"gmail_signature"><div dir=3D"ltr">Michael Halstead<d=
iv>Linux Foundation / Yocto Project</div><div>Systems Operations Engineer</=
div></div></div></div></div>

--0000000000000b40c806164e363e--

