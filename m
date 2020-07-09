Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web11.3403.1594323570386701502
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Jul 2020 12:39:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rQKy3+TL;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: caner.altinbasak@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id b15so2752347edy.7
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Jul 2020 12:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=CaDadFhUQan6eDHrn7WN8/bGUx8lFiNvLrrl4bXs4rI=;
        b=rQKy3+TLgrNn/q36hzI9Gp3FSE7vEDmH2MDMOcrSBPiXL2yoNvoYaphq72I0kvgRt6
         /0rfDLYYvINtZ3/+0nk8LJ8n3QtvZAAHCNXIIfL6eQRSbg+J2E3JYUvxTr4UYRA47Bec
         6n33JLK+oo6hYx49jDs3T9fELO/6kqNN1IYh4TinTDbSY/X6tTsGPhThKgczUGzhvEAW
         sKnBx/5APYnQ3aL6rT9sJiPwN2RPEVBk6KjZNt5C1VZ5J+hby/KbYqvFGXJEPaKDMHLN
         YlIJxHRFLCGS6pdyp5FGLNKzoQJc8UwuDP3ZjGLz6mhFCWPaNko3kI1nQOlecxKF515S
         xNEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=CaDadFhUQan6eDHrn7WN8/bGUx8lFiNvLrrl4bXs4rI=;
        b=Tz/Wdv5Ri3g8Uh3i2AnobyslIpb8FImkk99DCdh4IxlelHZzg4MKWM8KpsKmpO16z2
         Pag/rwW0tcCtbPczzcVY+XfIct6/o1+y+0V4lXtOIgFswMEOfCqMRlo45QpNjTKkg6yL
         OLFlkVzwPLcZYIG/a6myASkv7+WMP+D37TtddwcTWyDbaK/m+qOjUN7DARlojL+a22L0
         oiGFSS8rU59RlVi4CgkrlGsgfYTSkcyuA+o5Dd3l1XQQYgctAA4mM9yw8C/o8nKp/DOt
         ix7iQXVXIZ6zKqRgYhd5sG3t7maTTI9/b2syktDv6f5md/tDweD/+hMRcuc1ahkFAZj0
         Agkg==
X-Gm-Message-State: AOAM5316ZoMcGklR2GtrYKmqs5hZ+SupzafcbNdIQiuXzDoKDScXLvWb
	wjCbyjecCQq0B6j86gYZh/HW3f031NlZbFoWP/uwsDGV
X-Google-Smtp-Source: ABdhPJwIiYXGhd1y2AFcC9WUzVD02zyF2dyvp9m18V1vbQx+It3uyYqj+sCPj7HI9lhtIDMBhYiQZtRc7LziPV1nQqQ=
X-Received: by 2002:aa7:c3d7:: with SMTP id l23mr64877590edr.18.1594323568578;
 Thu, 09 Jul 2020 12:39:28 -0700 (PDT)
MIME-Version: 1.0
From: caner.altinbasak@gmail.com
Date: Thu, 9 Jul 2020 20:39:17 +0100
Message-ID: <CAPkNZbN7_7ie1pqMN5SWDhj_eH55MKSazMjbiC6ZoUbFjUp+GQ@mail.gmail.com>
Subject: [oe] [meta-browser] electron-x11 recipe
To: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000f6545605aa076102"

--000000000000f6545605aa076102
Content-Type: text/plain; charset="UTF-8"

I've implemented a electron-x11 recipe based on chromium-x11. It doesn't
touch the way chromium-x11 and chromium-ozone is built. But I've divided
chromium.inc and chromium-gn.inc into smaller recipes to share common parts
with electron.

I've also added a gclient fetcher to use with Electron. I've tested it with
Chromium, and it also works with Chromium. Chromium can also switch to
using gclient if you wish to.

I will maintain electron-x11 and gclient fetcher(and electron-ozone going
forward). It will make my life easier if you accept my changes upstream,
since I've moved the files around a lot and want to keep up with stable
releases.

It is on my github account right now. I can create a pull request to
OSSystems/meta-browser if you are interested:

https://github.com/caneraltinbasak/meta-browser/tree/electron-x11

Thanks,

Caner

--000000000000f6545605aa076102
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><br></div>I&#39;ve implemented a electron-x11 recipe =
based on chromium-x11. It doesn&#39;t touch the way chromium-x11 and chromi=
um-ozone is built. But I&#39;ve divided chromium.inc and chromium-gn.inc in=
to smaller recipes to share common parts with electron.<div><br></div><div>=
<div>I&#39;ve also added a gclient fetcher to use with Electron. I&#39;ve t=
ested it with Chromium, and it also works with Chromium. Chromium can also =
switch to using gclient if you wish to.</div><div><br></div><div>I will mai=
ntain electron-x11 and gclient=C2=A0fetcher(and electron-ozone going forwar=
d). It will make my life=C2=A0easier if you accept my changes upstream, sin=
ce I&#39;ve moved the files around a lot and want to keep up with stable re=
leases.</div><div><br></div><div>It is on my github account right now. I ca=
n create a pull request to OSSystems/meta-browser if you are interested:</d=
iv></div><div><br></div><div><a href=3D"https://github.com/caneraltinbasak/=
meta-browser/tree/electron-x11">https://github.com/caneraltinbasak/meta-bro=
wser/tree/electron-x11</a><br></div><div><br></div><div>Thanks,</div><div><=
br></div><div>Caner</div></div>

--000000000000f6545605aa076102--
