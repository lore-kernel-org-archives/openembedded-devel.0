Return-Path: <ashishkumar.mishra@bmwtechworks.in>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10D6DCD4F25
	for <webhook@archiver.kernel.org>; Thu, 14 May 2026 08:02:48 +0000 (UTC)
Subject: Re: [meta-oe][PATCH v3 0/3] android-tools: migration and cleanup
To: openembedded-devel@lists.openembedded.org
From: "AshishKumar Mishra" <ashishkumar.mishra@bmwtechworks.in>
X-Originating-Location: Bengaluru, Karnataka, IN (49.207.60.202)
X-Originating-Platform: Linux Chrome 148
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 14 May 2026 01:02:42 -0700
References: <20260505150634.192651-1-emailaddress.ashish@gmail.com> <2022222.1778130561122567168@lists.openembedded.org> <2115555.1778654861364723634@lists.openembedded.org> <6a719287-ab7f-486b-a9c4-ec5801e9e8af@gmail.com> <CAMKF1sp=Ae3MHJYK7fbAXokwEhayigWkOPjpzw+H4Mp3W3Bjow@mail.gmail.com> <PN0P287MB0358EC7112FFB28C9B6157C089062@PN0P287MB0358.INDP287.PROD.OUTLOOK.COM> <CAMKF1spvQfLjaAWu4_QJwU+_QPivKEw7SjTvxMzcc4+dieAmqA@mail.gmail.com>
In-Reply-To: <CAMKF1spvQfLjaAWu4_QJwU+_QPivKEw7SjTvxMzcc4+dieAmqA@mail.gmail.com>
Message-ID: <1575450.1778745762950591364@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="YKXOqzenha2kS66gYMkE"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 May 2026 08:02:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126985

--YKXOqzenha2kS66gYMkE
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Khem,

Looking at above error report it appears the build was triggered using the =
Yoe distro with
clang as the default compiler targeting cortexa57 (AArch64).

I'm trying to reproduce this clean upstream Poky environment
The key differences I need to replicate are:
- Yoe distro vs Poky
- clang as default compiler vs gcc
- cortexa57 AArch64 target

Could you point me to the Yoe distro.conf (or the relevant
compiler/tuning config) so I can reproduce the exact build
environment? I have meta-clang added to my layer stack and
am testing against qemuarm64 as a starting point.

Thanks,
Ashish

--YKXOqzenha2kS66gYMkE
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div style=3D"color: #000000; background-color: #ffffff; font-family: JetBr=
ains Mono, Cascadia Mono, Consolas, monospace, 'Droid Sans Mono', monospace=
; font-weight: normal; font-size: 14px; line-height: 22px; white-space: pre=
;">
<div><span style=3D"color: #000000;">Hi Khem,</span></div>
<br />
<div><span style=3D"color: #000000;">Looking at above error report </span><=
span style=3D"color: #000000;">it appears the build was triggered using the=
 Yoe distro with </span></div>
<div><span style=3D"color: #000000;">clang as the default compiler targetin=
g cortexa57 (AArch64).</span></div>
<br />
<div><span style=3D"color: #000000;">I'm trying to reproduce this clean ups=
tream Poky environment </span></div>
<div><span style=3D"color: #000000;">The key differences I need to replicat=
e are:</span></div>
<div><span style=3D"color: #000000;"> </span><span style=3D"color: #0451a5;=
">-</span><span style=3D"color: #000000;"> Yoe distro vs Poky</span></div>
<div><span style=3D"color: #000000;"> </span><span style=3D"color: #0451a5;=
">-</span><span style=3D"color: #000000;"> clang as default compiler vs gcc=
</span></div>
<div><span style=3D"color: #000000;"> </span><span style=3D"color: #0451a5;=
">-</span><span style=3D"color: #000000;"> cortexa57 AArch64 target</span><=
/div>
<br />
<div><span style=3D"color: #000000;">Could you point me to the Yoe distro.c=
onf (or the relevant </span></div>
<div><span style=3D"color: #000000;">compiler/tuning config) so I can repro=
duce the exact build </span></div>
<div><span style=3D"color: #000000;">environment? I have meta-clang added t=
o my layer stack and </span></div>
<div><span style=3D"color: #000000;">am testing against qemuarm64 as a star=
ting point.</span></div>
<div><span style=3D"color: #000000;"> </span></div>
<div><span style=3D"color: #000000;">Thanks,</span></div>
<div><span style=3D"color: #000000;">Ashish</span></div>
</div>

--YKXOqzenha2kS66gYMkE--

