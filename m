Return-Path: <marek.vasut@mailbox.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE00ACA1005
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 18:08:49 +0000 (UTC)
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by mx.groups.io with SMTP id smtpd.web11.84696.1756836524437293016
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Sep 2025 11:08:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@mailbox.org header.s=mail20150812 header.b=WTCF/9Ry;
 spf=pass (domain: mailbox.org, ip: 80.241.56.171, mailfrom: marek.vasut@mailbox.org)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4cGYdh4vpgz9tfr;
	Tue,  2 Sep 2025 20:08:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1756836520;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KJyG0WAbjtlvHRGpTikd0dHME4JD+JwHMLqPMVA6vjQ=;
	b=WTCF/9RyC59Ei43rMebtvK9068bJ6YGoGJbbq86J8t6wYVQ5l4ECBk2Y62WCI5b4Bk/Ad1
	xTZ584jd66ZRz4c19/7icZ7/5sKuPzdmo5KFzcYHthNfKtOGosOh6/7Re1aKG577oOsM9Z
	Fa2npp23AzlRQXCRkrHCIujeNmQ+9RcCRVrtux7/tKN46ruTxGo8Om5FQAaa6mSuroyQoV
	KU9loK6gUJ2RmRyDmYDjktioTP7v6WyMdjPqV1RI4A4PAH2BcATLN31cFRnSGNm2A5Y+gZ
	WBTamuc/YlhncmzGZ6vGMMIvDiBYSeiMHjkyeHlThTUm5ydXkd9L1a3/OklECQ==
Message-ID: <5b969489-3dbc-49de-b3d8-bd4434fbf2bb@mailbox.org>
Date: Tue, 2 Sep 2025 20:08:39 +0200
MIME-Version: 1.0
Subject: Re: [meta-oe][RESEND PATCH v2] imx-cst: Replace hard-coded linux64
 with linux${SITEINFO_BITS}
To: openembedded-devel@lists.openembedded.org
Cc: Kelefa Sane <kelefa.sane@smile.fr>, Khem Raj <raj.khem@gmail.com>,
 =?UTF-8?Q?Ulrich_=C3=96lmann?= <u.oelmann@pengutronix.de>,
 Yoann Congal <yoann.congal@smile.fr>
References: <20250902180740.263633-1-marek.vasut@mailbox.org>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20250902180740.263633-1-marek.vasut@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-MBO-RS-META: 6uz6mmcb8bnkr1k6nbhg4u1er7crtdb3
X-MBO-RS-ID: bdc8a029a1375c90f26
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Sep 2025 18:08:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119186

On 9/2/25 8:07 PM, Marek Vasut wrote:
> Replace hard-coded linux64 with linux${SITEINFO_BITS}. This way,
> 32bit machines can also build and use this tool correctly.
>=20
> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
> ---
> Cc: Kelefa Sane <kelefa.sane@smile.fr>
> Cc: Khem Raj <raj.khem@gmail.com>
> Cc: Ulrich =C3=96lmann <u.oelmann@pengutronix.de>
> Cc: Yoann Congal <yoann.congal@smile.fr>
> ---
> V2: - inherit siteinfo
Sorry for the all the noise, had some ML subscription issues, now resolve=
d.

