Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD822D6ED13
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 12:14:22 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.9350.1732191258953201731
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Nov 2024 04:14:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=SLeTHZdF;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A9F122000D;
	Thu, 21 Nov 2024 12:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1732191257;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BuUVLTx0Xb8sK1DSTwuywe0UIME7GyVfDfoy9hJmtr8=;
	b=SLeTHZdFkOUHoCaCwqKJZ4zzUYMPKerIcEwL+lt2eQqY3jrxdQXv77Y/vj236k070wI+M9
	bPPzIcWQCnmvK4ppjOvqPQkUpidpl5GqMVHgLP5d4GUP2YOLzC24Alop6qdpioAeyERan8
	q96t080nZN9OPECRJTsD38e0DgVWzVUOCtwcJYUHiSQlKWB1lZzh/BBrnxeB2+R+7rlxZn
	GHA2nLtrnE+5SlLuzR84gt1pO5vHyLzbc4G2HjVrshSBx7R2dQyo7NjRSmVvxE5zQGJsH4
	bZ2/2zuRntZOtHPME2IeMUAdqLBaZEKivEu/629ZH4aBZHEE1n+X8HxeisBQEw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 21 Nov 2024 13:14:16 +0100
Message-Id: <D5RUJXLOWCGQ.3STHKCTLIKLBI@bootlin.com>
Subject: Re: [oe] [meta-oe][PATCH] cryptopp: add a recipe for version 8.9.0
Cc: <openembedded-devel@lists.openembedded.org>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Mikko Rapeli" <mikko.rapeli@linaro.org>
X-Mailer: aerc 0.18.2.r87.gd0484b15
References: <20241121-add-cryptopp-v1-1-36382a60cecb@bootlin.com>
 <D5RTGU2DZLNI.IOI1OVBS2LOS@bootlin.com> <Zz8a-A4l-GJDtOJ-@nuoska>
In-Reply-To: <Zz8a-A4l-GJDtOJ-@nuoska>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Nov 2024 12:14:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113970

Hi Mikko,

On Thu Nov 21, 2024 at 12:35 PM CET, Mikko Rapeli wrote:
> Hi,
>
> Would be nice to have the reason why this is needed in oe-core in the
> commit message. As dependency to some usecase or recipe, for example.

I was aiming at meta-openembedded/meta-oe, I don't think it's needed in oe-=
core
too. I wrote this recipe for a customer project, and since the project is
somewhat popular and maintained I felt like sharing the recipe for others. =
I
don't have any other specific reason to send it here.


Regards,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

