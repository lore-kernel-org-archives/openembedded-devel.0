Return-Path: <boas.meier@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E42DFC04A95
	for <webhook@archiver.kernel.org>; Tue, 25 Oct 2022 11:34:08 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web08.5985.1666697648109922124
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Oct 2022 04:34:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oDxE4rsP;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: boas.meier@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id a67so35696757edf.12
        for <openembedded-devel@lists.openembedded.org>; Tue, 25 Oct 2022 04:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JHPPRcCbRaNlPX2qYsMRcqE0ej66g+yUDAwwO/O72mY=;
        b=oDxE4rsPrNf6sx0n9L2QxZl6E503YHY4FeCfEB9D+JBQVE0mOBQywt97PyZHljeRJ0
         DusCMsQ38ANzjtup4HbKsvQxqet/7KoWnigOZwAbHPToc5bN9uycIqX+0ikuSh3BU77/
         KZxrH16s/s505Ay74LgIhKrMq8gdNCCn+i9/0UzlT8dK9KjbTB3mIqMHRlEQTkpI9zRn
         hMS5OyVWoyuVRHAE1K3d4UR6X1cqw7KcI6R+6PskYa4a6eS/Nt69FTLocYzKucsa+10A
         pdTVdpwQJe6rBtUCt4SpltEkB8Gu4+7hxZPQMfGBa3jIEWTn1ujASHy50i7dsbwFE72b
         Oynw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JHPPRcCbRaNlPX2qYsMRcqE0ej66g+yUDAwwO/O72mY=;
        b=K/Z+dZpbL/2CrAl1Y43z1fE4kfyZlLc3Wfaqh5rTkqie4sjVAS03Ov2fqdGRLmdzqL
         moGFhsw1Ga3rqTYnaCRfkLbb8Ls6x4dEJfr3oeICEtf7ulNFVhdOOl0l00NG2KFBdGnw
         PqdfqHsXCwIqkByQnOAgxACINd//7xUU1ok7kozglVNlaVEhR1iRItthtx0r/CXCEzKb
         FNWEsOt659X6/HpPIOvk67nPUQU5SG5RSqZFZH/0P5Y+c45A4KRODEVHsAomhIJ2k2oG
         sRL7+9UsemmfMmbLHf3G5Pvl5oEpQZs0bhqhqy+Bx34P27kL/mxHyBN1L5eCXHsEjGXk
         3D3Q==
X-Gm-Message-State: ACrzQf1F7tuP2CCJWqCqlVrbJrqvGGMTb6OSv8FpTIGX3ifY59MkwbwP
	+EpEPnm6B1mkPIH/YUI57ww+O9EQ69xxG5t+VDqZ2Q2WVYw=
X-Google-Smtp-Source: AMsMyM63W6FWpHQroX3siD0VD87is1jkSOFkatoEmoodOpHIKrQbO+XhuV4d6WO3cCnJ4s/13XgrqrcM/uHc5+LU0As=
X-Received: by 2002:a05:6402:1911:b0:461:f0d8:4eb6 with SMTP id
 e17-20020a056402191100b00461f0d84eb6mr5959379edz.297.1666697646082; Tue, 25
 Oct 2022 04:34:06 -0700 (PDT)
MIME-Version: 1.0
From: Meier Boas <boas.meier@gmail.com>
Date: Tue, 25 Oct 2022 13:33:30 +0200
Message-ID: <CAD6RADDQ2V-Hp=qpJU1wapYsh6KfiGtx8LHNx1xDxNb5Mv=_=Q@mail.gmail.com>
Subject: [meta-oe] jwt-cpp: add v0.6.0
To: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000248dfd05ebda497e"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Oct 2022 11:34:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99305

--000000000000248dfd05ebda497e
Content-Type: text/plain; charset="UTF-8"

The following changes since commit 2ab46bac63c32a1f37576b4b8be61c95585ffcf2:

  fwupd: Fix plugin_gpio PACKAGECONFIG (2022-10-23 22:10:01 -0700)

are available in the Git repository at:

  https://github.com/boasmeier/meta-openembedded

for you to fetch changes up to 71181860d47f14ce0d53789469a744af86a6c50f:

  jwt-cpp: add v0.6.0 (2022-10-25 11:28:40 +0200)

----------------------------------------------------------------
Boas Meier (1):
      jwt-cpp: add v0.6.0

 meta-oe/recipes-devtools/jwt-cpp/jwt-cpp_0.6.0.bb | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/jwt-cpp/jwt-cpp_0.6.0.bb

--000000000000248dfd05ebda497e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The following changes since commit 2ab46bac63c32a1f37576b4=
b8be61c95585ffcf2:<br><br>=C2=A0 fwupd: Fix plugin_gpio PACKAGECONFIG (2022=
-10-23 22:10:01 -0700)<br><br>are available in the Git repository at:<br><b=
r>=C2=A0 <a href=3D"https://github.com/boasmeier/meta-openembedded">https:/=
/github.com/boasmeier/meta-openembedded</a> <br><br>for you to fetch change=
s up to 71181860d47f14ce0d53789469a744af86a6c50f:<br><br>=C2=A0 jwt-cpp: ad=
d v0.6.0 (2022-10-25 11:28:40 +0200)<br><br>-------------------------------=
---------------------------------<br>Boas Meier (1):<br>=C2=A0 =C2=A0 =C2=
=A0 jwt-cpp: add v0.6.0<br><br>=C2=A0meta-oe/recipes-devtools/jwt-cpp/<a hr=
ef=3D"http://jwt-cpp_0.6.0.bb">jwt-cpp_0.6.0.bb</a> | 20 ++++++++++++++++++=
++<br>=C2=A01 file changed, 20 insertions(+)<br>=C2=A0create mode 100644 me=
ta-oe/recipes-devtools/jwt-cpp/<a href=3D"http://jwt-cpp_0.6.0.bb">jwt-cpp_=
0.6.0.bb</a><br></div>

--000000000000248dfd05ebda497e--

