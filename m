Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FAD5CA5FC5
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 15:13:35 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15226.1790779711021852974
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Sep 2026 07:48:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=PALqVtNm;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id DEE124E410D7
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Sep 2026 14:48:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B38EE60749
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Sep 2026 14:48:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DEF83103297CC;
	Wed, 30 Sep 2026 16:48:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790779708; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=K9S+yh1TlWquJnP3b29a8cpluPX79uAwmRiV96R7Pws=;
	b=PALqVtNmgsL9VO2i3kauF6vyI6GDwgRMun2pkgg9MIihsTTApdD9pCbKz/AML/4lNy9dHl
	Fk9Fv2bjkZNG5xNayja8QHTn7ABW6TyNgvKOBpSb8IUskHq6/no+INQRDL8iw6h1EzgpKF
	EP6vjCnCZeDGsd5vse/ZmaE2Q8aZ0Hv+j7khFz7khKZdxO++fzuhuvJht9Ja8QQk6dX0uf
	JTtk2tcgnt94UodhivtQKA/hPwVEpdcYAbcA0z0X2eXcTzfOtHT+a42O61QMggBSUdpBA4
	09sxyInoY/lExXE5vEsdJ8Kww/8HtbDZnB3ma+jN4zjAOWu+4IQOUMAPr7Y41Q==
Message-ID: <f2d8039c-41bd-46ab-9c6e-dab1fa8f706b@bootlin.com>
Date: Wed, 30 Sep 2026 16:48:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-networking][scarthgap][PATCH] ntp: add CVE-2026-1548 to CVE_STATUS_NTP
To: openembedded-devel@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com
References: <20260930092915.1909757-1-joaomarcos.costa@bootlin.com>
From: "Joao Marcos Costa" <joaomarcos.costa@bootlin.com>
Organization: Bootlin
In-Reply-To: <20260930092915.1909757-1-joaomarcos.costa@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Sep 2026 15:13:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130532

The Subject is not correct: the CVE is CVE-2016-1548, while the subject=20
contains "2026".

I will send a v2 with the fixed Subject.

--=20
Best regards,
Jo=C3=A3o Marcos Costa


