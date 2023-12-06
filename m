Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C60F5C4167B
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 18:02:19 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web10.40151.1701885731448937453
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Dec 2023 10:02:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Sl7oEVt9;
 spf=pass (domain: gmail.com, ip: 209.85.219.42, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-67abd1879c0so469286d6.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 06 Dec 2023 10:02:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701885730; x=1702490530; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wVniYf5A7wi1M9iodPYmxDy6atfusIdQi20iyzc0vxo=;
        b=Sl7oEVt9pSD1avKesfezSSnHZ29Nv8RnlF+MwreChdgU4oNpRCQn3YtcSo46CEE5bd
         gvgq8CLkcuDVfFdq4IzOedmJQGKBLGk2nUCuENTcXyTurAE4H/aLKkMnj2Exl0pVQB8f
         sq/rPa7rvFKQvN4frzrBXO1Izg8KfvpIYGmWawTT71x09nPmeVfMLT2SuPLlyk/HbYAT
         nXR/xSskNjP2cBH6XQ54+iElLdlojYKwe4qVoM3ZjpiuNMmICHxmDeF6X5WGWJ+ccojS
         Mktlq0jPrXqPAiz5qAP65zN4mt9mAzNn+HYYcH5UdA3P8c3LIe1l4D/JNlTVX4d7vRKq
         pZRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701885730; x=1702490530;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wVniYf5A7wi1M9iodPYmxDy6atfusIdQi20iyzc0vxo=;
        b=IkLCckukgU7QF/BBUExtLlLzMqx5p1mfQUQTFDHyqH/Vssk6iAkcOvtwM/n/sDM9LU
         LRMVINdS5XARG1N6URZjdXMsbrbQ1HTmpGzRF2vglKCIA+sPPlqRBRoEtO91oNW5RONX
         QbSNrdo4tZ28CsFeCtkqq8EL8pgk43pGv7QUrPfBj78aWCDSTcF/C4ofZs1TqJavGsJP
         yBKO6XLc8++W9G17PWt3Z/LuAX8dSIG/8SHh+R/iwEX/aIBWPoGyl1nTpB/Jw0/hSaZH
         JGKpKsbuoySs+K++Y21JgNA6tnMmj8usrpRZse8+yP39wa6amx1A95oJMJjMhNJaEUOI
         UTOw==
X-Gm-Message-State: AOJu0YxUBHukk7EmXkriwYAv4Tdg1VIT17/E+9+DyNwIWq8HnP5Mp7fK
	CDitkZx96PjztOcvIoNcLE+fbWcDebigTR5BlPUlb8P/
X-Google-Smtp-Source: AGHT+IHyP1ximES0eYX1uVbNy87FKRHG6mHr3qm0lAt2PBtGESvqj6EJZiXjkdNXri2a/xha56JolXuvL7kz58jHqwo=
X-Received: by 2002:a05:6214:9af:b0:67a:b325:f976 with SMTP id
 du15-20020a05621409af00b0067ab325f976mr1136674qvb.41.1701885730391; Wed, 06
 Dec 2023 10:02:10 -0800 (PST)
MIME-Version: 1.0
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Wed, 6 Dec 2023 19:01:59 +0100
Message-ID: <CA+cAkeqg51T1u1DuPM_5vx+2gAn-6KxWYfY0GYuXdqvM_mbF4A@mail.gmail.com>
Subject: Crash cross canadian?
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000688caf060bdb269e"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Dec 2023 18:02:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107261

--000000000000688caf060bdb269e
Content-Type: text/plain; charset="UTF-8"

Hello list,

Since some times (back to warrior branch I think), I have in my custom
layer a cross canadian version from the crash tool, I personnally used it
for analysing vmcore from an arm target (cortex a53) offline within the sdk.

I recently upgraded to kirsktone and the update of this version was a
little tricky (must have played with LDFLAGS, gdb target build and host and
so on...)

I finally managed to get crash working for all my hardware (both include
aarch64 and x86-64 arch).

I would like to know if it would be acceptable to have a cross canadian
arch in meta-openembedded (from what I see, there is only native and target
flavor)?

If you think it is accurate, I'll work to push some patches against master.

Please tell me, thanks!

--000000000000688caf060bdb269e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hello list,<div dir=3D"auto"><br></div><div dir=3D"auto">=
Since some times (back to warrior branch I think), I have in my custom laye=
r a cross canadian version from the crash tool, I personnally used it for a=
nalysing vmcore from an arm target (cortex a53) offline within the sdk.</di=
v><div dir=3D"auto"><br></div><div dir=3D"auto">I recently upgraded to kirs=
ktone and the update of this version was a little tricky (must have played =
with LDFLAGS, gdb target build and host and so on...)=C2=A0</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">I finally managed to get crash workin=
g for all my hardware (both include aarch64 and x86-64 arch).</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">I would like to know if it would be a=
cceptable to have a cross canadian arch in meta-openembedded (from what I s=
ee, there is only native and target flavor)?=C2=A0</div><div dir=3D"auto"><=
br></div><div dir=3D"auto">If you think it is accurate, I&#39;ll work to pu=
sh some patches against master.</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Please tell me, thanks!=C2=A0</div></div>

--000000000000688caf060bdb269e--

