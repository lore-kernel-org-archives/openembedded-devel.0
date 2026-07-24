Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4CC1C531F9
	for <webhook@archiver.kernel.org>; Fri, 24 Jul 2026 18:56:42 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23319.1784911019652513099
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Jul 2026 09:37:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=Dtdl/pwO;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id CDD6D1A11F0
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Jul 2026 16:36:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A2A2D60395
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Jul 2026 16:36:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D813A11C11002;
	Fri, 24 Jul 2026 18:36:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784911017; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=r4AZSYQvL9kRWMoDAxKCasfsEfTy3FupZAS1S09wMRM=;
	b=Dtdl/pwODBcCZeHPKbJBNcVdDuVC1vwuZNw5T2p27fc7uUcEMttziAI2gPhSZmcmEmZWV+
	L3jDbbqSe9vfYl1rSnJnFf5PtwC94IsBTTKVoKvykEmgtmAMDdWhTZMLfcos8qSeprXBHn
	PdOd2ExUkEozaSfHiVEGWj2Rwusb8fmQ8oRfKZ/I+dhdcvfqJwHauvDI0wSZv7+MJSVKQ5
	SjDlhLk3TDMU/2dFjyd94/8JRRI2HspG7gUP9kul1mpziaydOaHgqw2tlQpidtfHPIa2tF
	DdMFKQn0UKVv0C04Jqd5dCdOFiGGp6proVELKL39E6XBp89Nj7CzoXRdHVGFig==
Message-ID: <d1742eb0-e2a6-4dda-886a-24bf6dbb9794@bootlin.com>
Date: Fri, 24 Jul 2026 18:36:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-webserver][scarthgap][PATCH] nginx: backport fix for CVE-2026-42533
To: openembedded-devel@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com
References: <20260724163017.3655415-1-joaomarcos.costa@bootlin.com>
From: "Joao Marcos Costa" <joaomarcos.costa@bootlin.com>
Organization: Bootlin
In-Reply-To: <20260724163017.3655415-1-joaomarcos.costa@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Jul 2026 18:56:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128443

Hello,

On 7/24/26 18:30, Jo=C3=A3o Marcos Costa wrote:
> This fix was made available with v1.30.4 [1] version of nginx:
>=20
> https://github.com/nginx/nginx/commit/b99f804ad38a60ceb07bc429598d5b2c4=
e70e336
>=20
> and the CVE is further described here: https://nvd.nist.gov/vuln/detail=
/CVE-2026-42533
>=20
> [1]: https://github.com/nginx/nginx/releases/tag/release-1.30.4
>=20
> Signed-off-by: Jo=C3=A3o Marcos Costa (Schneider Electric) <joaomarcos.=
costa@bootlin.com>
> ---
>   .../nginx/files/CVE-2026-42533.patch          | 52 ++++++++++++++++++=
+
>   meta-webserver/recipes-httpd/nginx/nginx.inc  |  1 +
>   2 files changed, 53 insertions(+)
>   create mode 100644 meta-webserver/recipes-httpd/nginx/files/CVE-2026-=
42533.patch
>=20

The fix for this CVE needs more patches than this single one, so please=20
disregard this patch for now. Thanks!

--=20
Best regards,
Jo=C3=A3o Marcos Costa

