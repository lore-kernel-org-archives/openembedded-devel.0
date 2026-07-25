Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C752C531D0
	for <webhook@archiver.kernel.org>; Sat, 25 Jul 2026 23:45:35 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2436.1785023130041116764
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Jul 2026 16:45:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=f_l_k@t-online.de header.s=20260216 header.b=WGLyz9eK;
 spf=pass (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd78.aul.t-online.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout09.t-online.de (Postfix) with SMTP id 4793837FED;
	Sun, 26 Jul 2026 01:45:08 +0200 (CEST)
Received: from [192.168.178.36] ([84.154.160.57]) by fwd78.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1wnm3D-2qoRk00; Sun, 26 Jul 2026 01:45:03 +0200
Date: Sun, 26 Jul 2026 01:44:57 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe][PATCH] malcontent: update 1.13.1 -> 1.14.0
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Message-Id: <XM8RIT.IRSXL710O88F2@t-online.de>
In-Reply-To: <CAMKF1spW8hp-e_TJQvX4v9T5nDx7P7thJ97ZNFXHZNEP6h2PRw@mail.gmail.com>
References: <20260725094508.166565-1-f_l_k@t-online.de>
	<CAMKF1spW8hp-e_TJQvX4v9T5nDx7P7thJ97ZNFXHZNEP6h2PRw@mail.gmail.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-GTiAIJ/OrwB+J2MqKUVf"
X-TOI-EXPURGATEID: 150726::1785023103-F77FDBDE-F8D79564/0/0 CLEAN NORMAL
X-TOI-MSGID: 66e22b5e-6ee3-4c9b-9aac-48b0a0c97a7b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1785023108; i=f_l_k@t-online.de;
	bh=vbCDqVPiZrDoFs59q37WgOr3vNXjt1O4HYP0DSDoSz0=;
	h=Date:From:Subject:To:Cc:In-Reply-To:References;
	b=WGLyz9eKSad/pZKGX9n2ytfDgQ5kUKE1dgkyaadQyxUQ1xcf3OFkYfBHtqAurYLcy
	 6lRzTBDBPteRrIkKIMptY1J9zE7NsXshnbY8u/+btymYxuQ0uNE3iBG+r1ltVg94Qm
	 TqNkS8CZl6ulqrvw5R1ChA3TsKTht2+DQa6dyqOvt7jClN6tCKh7bBEryCqb0nR2WD
	 lcT9/YtWYr2gnwihQBRgo6is7FJV37AB40Xckt8de9Lkapgg/Foo0nngC2dDAw+6nn
	 b7uUMyDMjwki/mJk2D/yB2A/DCKuWb63QRVeUsS2F5bQ8WqgUjUL1kPsZqHrN12+K8
	 wU4SeT+ss2gaQ==
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 25 Jul 2026 23:45:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128447

--=-GTiAIJ/OrwB+J2MqKUVf
Content-Type: text/plain; charset=windows-1251; format=flowed
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 25 2026 at 08:41:57 -07:00:00, Khem Raj=20
<raj.khem@gmail.com> wrote:
> why not inherit gi-docgen class here.

Assuming that the gi-docgen class is intended to make the build of docs=20
configurable via the =E2=80=98api-documentation=E2=80=99 distro feature, th=
is=20
option is not available in malcontent's meson.build. gi-docgen is a=20
hard dependency, and the doc build cannot be disabled. Therefore, I=20
thought it would be simpler and better reflect what the developer wants=20
to simply include `gidocgen-native` as a dependency without any=20
conditions.


You mean PV should be included in the recipe name? That's not so easy=20
with malcontent. We build it twice. First, without the graphical user=20
interface, so we can use it as a dependency for flatpak without=20
circular dependencies. Then, a second time, we build the full version=20
but manually install only the files for the graphical user interface to=20
avoid multiple file providers in `do_rootfs`. Thats why were dependent=20
on the recipes being updated together, and that's why PV is included in=20
`malcontent.inc`.



--=-GTiAIJ/OrwB+J2MqKUVf
Content-Type: text/html; charset=windows-1251
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto">On Sat, Jul 25 2026 at 08:41:57 -07:00:=
00, Khem Raj &lt;raj.khem@gmail.com&gt; wrote:<br><blockquote type=3D"cite"=
>why not inherit gi-docgen class here.</blockquote><div><br></div><div><div=
>Assuming that the gi-docgen class is intended to make the build of docs co=
nfigurable via the =E2=80=98api-documentation=E2=80=99 distro feature, this=
 option is not available in malcontent's meson.build. gi-docgen is a hard d=
ependency, and the doc build cannot be disabled. Therefore, I thought it wo=
uld be simpler and better reflect what the developer wants to simply includ=
e `gidocgen-native` as a dependency without any conditions.</div><div><br><=
/div></div><div><br></div><div><div>You mean PV should be included in the r=
ecipe name? That's not so easy with malcontent. We build it twice. First, w=
ithout the graphical user interface, so we can use it as a dependency for f=
latpak without circular dependencies. Then, a second time, we build the ful=
l version but manually install only the files for the graphical user interf=
ace to avoid multiple file providers in `do_rootfs`. Thats why were depende=
nt on the recipes being updated together, and that's why PV is included in =
`malcontent.inc`.</div><div><br></div></div></div>
--=-GTiAIJ/OrwB+J2MqKUVf--


