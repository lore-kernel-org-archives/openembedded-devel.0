Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F00D6C3601E
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 07:48:18 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.28870.1744271288902955305
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Apr 2025 00:48:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Ld/SqmSX;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9CC2244374;
	Thu, 10 Apr 2025 07:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744271287;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5+0X6uZb0ikvznYYB/4Udql4TXIkNIN5zNXy40SjFtY=;
	b=Ld/SqmSXChq63r1/uK+YLFNPOcV8Ce+f0zFx588Q99WapM+n4YFwmTdCNr5cF2qdBsN+KG
	krh/pa1GPefCZsL5cIIgpNBreqoBXu1LvvC7ySArqubpHs2nM3yC/qrT1DPDcSX+qwe6Nv
	KNSu2m8VaDeTIukruo/jsCen2KejXrlgXwBq1W2AWikoE1kKuCk4vOoS9wymOjVuAR8CC8
	whEEWga1Nd2CCNA0LyXmxrIS7Oa32tVHMcxC+uj49EVjSjfl4gmq450Ax122m2TmI8nZNZ
	62rLUraEXlpvMYhkYRjzPL1PPRY0EQC45pUu7yCv2kpz7atzv+BNVMmVDUKIzA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 10 Apr 2025 09:48:06 +0200
Message-Id: <D92SKEPSJ2EM.MJLRU86WJBT3@bootlin.com>
Subject: Re: [oe] [meta-oe][PATCH v2] cryptopp: add a recipe for version
 8.9.0
Cc: <openembedded-devel@lists.openembedded.org>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Martin Jansa" <martin.jansa@gmail.com>, <raj.khem@gmail.com>
X-Mailer: aerc 0.20.1-57-gc9a57f76bf52-dirty
References: <20241122-add-cryptopp-v2-1-19456062f791@bootlin.com>
 <CAMKF1sq=SUX2ZUxoduOc3QLgMk8_24KGsq481ABOXOv4558XWw@mail.gmail.com>
 <CAMKF1sreBnjjX0GW-G9+15Y+EgFQUmKUPX_cqYE7J3WaZ9=94g@mail.gmail.com>
 <CA+chaQcyRBTjQ0sQxvv2APzYqjkCbDJhL6Y_jZ-Xy+QiSVO7pQ@mail.gmail.com>
In-Reply-To: <CA+chaQcyRBTjQ0sQxvv2APzYqjkCbDJhL6Y_jZ-Xy+QiSVO7pQ@mail.gmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdekfeefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkufevhffvofhfjgesthhqredtredtjeenucfhrhhomhepfdetnhhtohhnihhnucfiohgurghrugdfuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedvhedtteetheefgfejleeiledvieevleduffejgeeufedujeeufeefjeefveegudenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmedujegtvdemfeekjegrmehfieehmeehvdefheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemudejtgdvmeefkeejrgemfheiheemhedvfeehpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopehmrghrthhinhdrjhgrnhhsrgesghhmrghilhdrtghomhdprhgtphhtthhopehrrghjrdhkhhgvmhesghhmrghilhdrtghomhdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqu
 ggvvhgvlheslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Apr 2025 07:48:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116764

Hi Martin,

On Thu Apr 10, 2025 at 9:09 AM CEST, Martin Jansa wrote:
> Hi Antonin,
>
> are you going to address the failures reported by Khem? it would be
> nice to get this merged.

I'd love to, but I tried digging deeper into this and kept hitting various
errors on the aarch64 build when removing CRYPTOPP_DISABLE_ASM (target mism=
atch
errors). From memory, cryptopp's makefile tries to guess a lot of processor
optimizations, which doesn't really make sense in our context since OE sets=
 all
of that already. But even removing all of those still doesn't cut it, and I=
 was
basically out of time to spend on this. :/

We could perhaps live with CRYPTOPP_DISABLE_ASM on aarch64, but other error=
s on
qemux86-64/musl needs to be dealt with.

If you want to take a look I can send you more details about what I tried d=
oing.
I'd be happy to have this merged in meta-oe too.

Regards,
Antonin

--
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

