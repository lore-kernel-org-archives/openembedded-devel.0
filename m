Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1207EC5B543
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 13:17:13 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.16230.1749043022191616361
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Jun 2025 06:17:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=CX9aqncY;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 42D3F43987;
	Wed,  4 Jun 2025 13:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749043018;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aWzcpHx075xe1QfS3BT9OMVMnwXuvyGt1mokvvPI26A=;
	b=CX9aqncYmlCtxt8zzrzmHSLz6Tlu+qzDKSw82awgf2k40qL8+N05XRmSKZuMPGxSip0wXQ
	Vq3KGmIvrDQQ9HWGNRMzIwtpbhArUK+BsHHqQDG7Tn7xETvGedNdq3hY6WUL7S07VypIHE
	ISulnqxuzabTTU4krOYjtbAgu7Yj0guNmGUvTOvIbwASCqIyzU1ZHSfLXMYM0x6b87oW8D
	oOCWt1HvZaFUKKNTPMpuYw/jXfcXLvpzHzZaLJnHWOqX6JkzGsa0stt/quvFh2FJljcK5g
	ZyTiO4z5WJCYJ52xYiRhOqwY0W6Qqh71AOhiSAFoxxM+pqqiGXSmoPUh+IwF3A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Jun 2025 15:16:57 +0200
Message-Id: <DADS05TNTW47.2RJD9AAHCUP7I@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Gyorgy Sarvari" <skandigraun@gmail.com>,
 <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe PATCH v4] cryptopp: add a recipe for version
 8.9.0
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Martin Jansa"
 <martin.jansa@gmail.com>
References: <20250604-add-cryptopp-v4-1-9e9400a9e877@bootlin.com>
 <2cf31147-fa1a-4277-892d-a6b89648ed5e@gmail.com>
In-Reply-To: <2cf31147-fa1a-4277-892d-a6b89648ed5e@gmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddvudelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkhffvufevfhgjsehtqhertddttdejnecuhfhrohhmpedftehnthhonhhinhcuifhouggrrhgufdcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepleelvefggffgvedtudekffffjedukeehtdefhfefkedugfffvdfgudfggfehjedtnecuffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdrohhrghdpkhgvrhhnvghlrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvuddvrddutdehrdduhedtrddvhedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdduvddruddthedrudehtddrvdehvddphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepshhkrghnughighhrrghunhesghhmrghilhdrtghomhdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdquggvvhgvlheslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtr
 giiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepmhgrrhhtihhnrdhjrghnshgrsehgmhgrihhlrdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Jun 2025 13:17:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117739

On Wed Jun 4, 2025 at 12:33 PM CEST, Gyorgy Sarvari wrote:
> On 6/4/25 10:54, Antonin Godard via lists.openembedded.org wrote:
>> Cryptopp is a library of cryptographic schemes written in C++.
>>
>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>> ---
>> Note: I had no issue building with MACHINE to "qemux86-64" and TCLIBC =
=3D
>> "musl", as reported here:
>> https://lore.kernel.org/r/CAMKF1sreBnjjX0GW-G9+15Y+EgFQUmKUPX_cqYE7J3WaZ=
9=3D94g@mail.gmail.com
>> Any extra steps to reproduce the issue would be appreciated.
> Looking at the linked logs, Khem was using clang - and indeed,
> 'TOOLCHAIN =3D "clang"' reproduces the error on my end.

Thanks for the hint, I'll try that.

> If there will be a v5, could you also add "tag" to the SRC_URI?

And thanks for the reminder!

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


