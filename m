Return-Path: <mattwood2000@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69EFBC3DA4A
	for <webhook@archiver.kernel.org>; Thu,  8 Aug 2024 16:56:39 +0000 (UTC)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
 by mx.groups.io with SMTP id smtpd.web10.65077.1723136196083826527
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Aug 2024 09:56:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jIOLic82;
 spf=pass (domain: gmail.com, ip: 209.85.219.172, mailfrom: mattwood2000@gmail.com)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e0bfd14aff7so1017730276.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Aug 2024 09:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723136195; x=1723740995; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SvTEnpowzULif4/ZTpKmjcDWmcisg9SwgI9CFdgJeYs=;
        b=jIOLic824vmkNxbx19K4e3QlSusl0rD3RhcdjL7tFnxeRZd4ubK4ap0R1ICu8oPjHU
         +tbmwyaywv61Pum3uz8Ir8dLCG4Lz/G6KAzr3lPSCSNLJq9a7b18QErWLCvVvMyGvZ0H
         ekQ/1JH86P+gzg2mVWMMV6NMiIBzxVK5l04iriSGOvi5yiLH0hzVwQfO14ugesg1lqZy
         +Y+2E5ZI8ZeojSznkgqdQ9kMbU7/MgTtESC0DPWVWdRQsUS+YoK+OtDbc9IgXsw9Gv/K
         HaoS4beGgdc3h9aZEf5BbBxZTA7YAJimklo+62RA1OZJW1fdMY051PNbiPulXYQQ4Oge
         LqXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723136195; x=1723740995;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SvTEnpowzULif4/ZTpKmjcDWmcisg9SwgI9CFdgJeYs=;
        b=he0Rxjk0B/FUUVzPlKmgr2HAmCBWCytT3PrEjTgWo08ElE3JqtTRybDKBgetj2EcWM
         MFIo9+4+AaIm0/8Tvmd2Z36xD+DVmtE8CuKRNJs979KuGn4wN7zEemStuxWshntWrjeL
         BvKZ6wbAkP64amyvT7cXUHN/tTTfcq2KMUyWYtddS4K+wyRk5jWYpxhmux+MpD8KEB94
         y/chFwys/9ztbF7QCoAzINjz26pTCvOkoFiejBvWiiTqvz7TT/hN1lkDVgtjpK56z8wJ
         t/VEqk966tv6ykLoLimy5Uj/RXIrHsWPZMTu9pG73fV6l3XJSM1Wda5ppFcZOqwBh6K7
         Fzbg==
X-Gm-Message-State: AOJu0YzpPKvWki0ijHv9c44lSgWAiu+nMDFfHlVfjEeU6IpHElw+0efV
	8zt0Z3zC5UVahOuzN7jyMEJY91qrWhWGKN/ziAmDBaZmfkDGYc9ieVmitsaHtKM2KVfM3sbrYLm
	+JCA2xWLqW1PINTJJ1cg556KyPgsCW2KK
X-Google-Smtp-Source: AGHT+IFbTaJSYjYQbjKjujWRbeTVSgShRHTdaE1VK2dLGfvWhMTTWORU1i6Fl2W0bzDcihbxA14P0cfd0ZjNJJrPZaI=
X-Received: by 2002:a05:6902:1ac4:b0:e0b:b2d6:f528 with SMTP id
 3f1490d57ef6-e0e9dbb22dfmr2424267276.38.1723136195027; Thu, 08 Aug 2024
 09:56:35 -0700 (PDT)
MIME-Version: 1.0
From: mattwood2000@gmail.com
Date: Thu, 8 Aug 2024 12:56:24 -0400
Message-ID: <CADjezmY=7diF1SSniqsPh=k=GVuGzFLF-LMzhD2pPkQ=jdpjWA@mail.gmail.com>
Subject: [meta-networking] ot-br-posix build fails with OTBR_WEB=ON
To: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000cdf269061f2ee8dc"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Aug 2024 16:56:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111679

--000000000000cdf269061f2ee8dc
Content-Type: text/plain; charset="UTF-8"

Hi all,

I'm trying to get the ot-br-posix recipe to build with the Web UI enabled.
On both kirkstone and scarthgap the build will timeout and fail with an npm
error reason: getaddrinfo ENOTFOUND registry.npmjs.org.

I am not behind a proxy and have tried various things like clearing and
verify the cache, adding the packages from the recipe to the cache, etc.
but the timeout and error still happens.

Does anyone have any ideas what would be causing this issue?

Building without the web UI works just fine.

Thanks, Matt

--000000000000cdf269061f2ee8dc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi all,</div><div><br></div><div>I&#39;m trying to ge=
t the ot-br-posix recipe to build with the Web UI enabled.=C2=A0 On both ki=
rkstone and scarthgap the build will timeout and fail with an npm error rea=
son: getaddrinfo ENOTFOUND <a href=3D"http://registry.npmjs.org">registry.n=
pmjs.org</a>.</div><div><br></div><div>I am not behind a proxy and have tri=
ed various things like clearing and verify the cache, adding the packages f=
rom the recipe to the cache, etc. but the timeout and error still happens.<=
/div><div><br></div><div>Does anyone have any ideas what would be causing t=
his issue?</div><div><br></div><div>Building without the web UI works just =
fine.</div><div><br></div><div>Thanks, Matt<br></div></div>

--000000000000cdf269061f2ee8dc--

