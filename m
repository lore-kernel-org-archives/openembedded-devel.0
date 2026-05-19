Return-Path: <jeremie.dautheribes@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A70D0CD4F5B
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 15:00:44 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.747.1779202843090487739
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 May 2026 08:00:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=wdkeesHr;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: jeremie.dautheribes@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 9C5C5C5DC78
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 15:01:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 440935FFC8;
	Tue, 19 May 2026 15:00:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6690F107E943C;
	Tue, 19 May 2026 17:00:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779202838; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=bFFTmR9NknlSxMoyerb1U+P8jxtHIMqSQT4hD3B/Z6U=;
	b=wdkeesHrpDfdzbqGUTcmx8rANoxjPUP7Kl8/z5Hb9H259D9Qg//a4lvPlI5oEOos/0VTcJ
	fVq+WFSKwal5pYoTUhREalLG0RMmK9Oad1v2UPgVMn81hEJTBkZy3H8oiENVOW4iaDDH7s
	WGiLXmNOzW6IwLhz9kPE8Qy2rlHQAaOfzTyhi6gt95g1SfUUROdS8qN7g5p9kOxdAaL7rJ
	q5SJAyfrgFXUwcIF6JG3tAS2TX0Q6wTTxuUcRYR/rfzCxPwKfLYOz7AajGZLpLyhTevn65
	WFjGwq/XPaeWYC/acvejJQ0BrernS8s6UQW6rzeR2ZBR8vNO7wPpnJ3Hs5LVKA==
Message-ID: <b38bfc08-3791-4924-9478-066da6b0285b@bootlin.com>
Date: Tue, 19 May 2026 17:00:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] git clone git://git.openembedded.org/meta-openembedded times
 out
To: Radoslav.Pesek@kistler.com
References: <DB9P190MB1275448B0CF656B13CA2F62D9D002@DB9P190MB1275.EURP190.PROD.OUTLOOK.COM>
Content-Language: en-US, fr
Cc: "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
From: =?UTF-8?B?SsOpcsOpbWllIERhdXRoZXJpYmVz?=
 <jeremie.dautheribes@bootlin.com>
Organization: Bootlin
In-Reply-To: <DB9P190MB1275448B0CF656B13CA2F62D9D002@DB9P190MB1275.EURP190.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 15:00:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127105

Hello,

On 5/19/26 16:54, Pe=C5=A1ek Radoslav via lists.openembedded.org wrote:
> Hello,
>=20
> Not sure this is the right place to ask, but I'm trying to clone meta-o=
penembedded via git protocol and it times out:
>=20
> $ git clone git://git.openembedded.org/meta-openembedded
> Cloning into 'meta-openembedded'...
> fatal: unable to connect to git.openembedded.org:
> git.openembedded.org[0: 104.18.9.166]: errno=3DConnection timed out
> git.openembedded.org[1: 104.18.8.166]: errno=3DConnection timed out
> git.openembedded.org[2: 2606:4700::6812:9a6]: errno=3DNetwork is unreac=
hable
> git.openembedded.org[3: 2606:4700::6812:8a6]: errno=3DNetwork is unreac=
hable
>=20
> My colleague tried it form other network with the same result. It's hap=
pening since at least last friday. HTTPS works.
>=20
> Is this some issue on your side?

git protocol has been temporarily disabled due to aggressive scrapers.

Please see:
https://lists.yoctoproject.org/g/yocto-infrastructure/topic/git_service_p=
rotocol_change/118721034?dir=3Ddesc

Best regards,

J=C3=A9r=C3=A9mie Dautheribes

>=20
> Radoslav Pe=C5=A1ek
> Software Developer
>=20
>=20
> Kistler Bratislava, s.r.o.
>=20
> Einsteinova 33, 851 01 Bratislava, Slovakia
> Direct +421232272948, Main Office +421 2 32 272 900
> radoslav.pesek@kistler.com<mailto:radoslav.pesek@kistler.com>, www.kist=
ler.com<https://www.kistler.com/> , Contact Service<mailto:Service@kistle=
r.com?subject=3DService%20request>
>=20
>=20
>=20
>=20
> [cid:1e6c6b6d-6ab2-4bcb-bb9b-244b6afd416e]<https://www.linkedin.com/com=
pany/kistler> [cid:0fc4f4b0-727d-406c-bb35-41d3eecc291b] <https://www.you=
tube.com/KistlerGroup>
>=20
> Confidentiality Notice: This e-mail is privileged and confidential and =
for the use of the addressee only. Should you have received this e-mail i=
n error please notify us by replying directly to the sender or by sending=
 a message to info@kistler.com<mailto:info@kistler.com>. Unauthorised dis=
semination, disclosure or copying of the contents of this e-mail, or any =
similar action, is prohibited.
>=20
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#127104): https://lists.openembedded.org/g/openembed=
ded-devel/message/127104
> Mute This Topic: https://lists.openembedded.org/mt/119391947/10093646
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[jeremie.dautheribes@bootlin.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

--=20
J=C3=A9r=C3=A9mie Dautheribes, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


