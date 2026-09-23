Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 726D0C9830D
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 13:27:59 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6913.1790170068608127200
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Sep 2026 06:27:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=CcGPE/xX;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 38F114E4102D
	for <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 13:27:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0728B60580
	for <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 13:27:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 386C510329206;
	Wed, 23 Sep 2026 15:27:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790170061; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=tz3CNps5RmCmQ/DhxZgJb63zxn6vlKhuEskM4Naposs=;
	b=CcGPE/xXZAAgXIjEgvuGIt69M5d2zyZ2JRtRQ7d5Oisrnowkxndx8y9fxxkkDezX2OHWGx
	RSyKfwE0fS0nVYAnfJTeftjmMjFr60ck7xZKhIOVpFT7S64WVV9zNr1NHmzZF075QUhzGn
	6ksN81uCExusa4foW5rCfjj8DRPIMs5pyNxgiiHEPH5XHQRu0nfcng8uSvV+sFI0xQqUKj
	g/VKJ+tTPnxdAKckVApYCBF49d9s/pGq/VsSrI+EXrgkOF+rO9okYfCVx0X4pmzbUV++vo
	zBRUJbmvhG78N+o+BI2yaWbbIPuVZIUsHAy9NFQvwBWzZHW9+nMJSM+dNWLAEw==
From: Benjamin Robin <benjamin.robin@bootlin.com>
To: openembedded-devel@lists.openembedded.org
Cc: olivier.benjamin@bootlin.com, mathieu.dubois-briand@bootlin.com
Subject: 
 Re: [PATCH 0/2] libwebsockets: update to 4.3.10 and fix CVE-2026-19773
Date: Wed, 23 Sep 2026 15:27:39 +0200
Message-ID: <KVqG2p0ATP2R6GEC4jv_7A@bootlin.com>
In-Reply-To: 
 <20260923-update-libwebsockets-fix-cve-2026-19773-v1-0-33878fcb7190@bootlin.com>
References: 
 <20260923-update-libwebsockets-fix-cve-2026-19773-v1-0-33878fcb7190@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 13:27:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130235

On Wednesday, September 23, 2026 at 2:52=E2=80=AFPM, Benjamin Robin (Schnei=
der Electric) wrote:
> This series updates libwebsockets to version 4.3.10 and also fixes the
> CVE-2026-19773 by backporting the fix from v5 branch.

Sorry, this series is for scarthgap, and I forgot to add the tags in the
subject. I am going to send a v2

>=20
> Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootli=
n.com>
> ---
> Benjamin Robin (Schneider Electric) (2):
>       libwebsockets: update to version 4.3.10
>       libwebsockets: fix CVE-2026-19773
>=20
>  .../libwebsockets/CVE-2025-11677.patch             | 161 ---------------=
=2D-----
>  .../libwebsockets/CVE-2025-11678.patch             | 128 ----------------
>  .../libwebsockets/CVE-2026-19773.patch             |  32 ++++
>  ...websockets_4.3.3.bb =3D> libwebsockets_4.3.10.bb} |   7 +-
>  4 files changed, 35 insertions(+), 293 deletions(-)
> ---
> base-commit: b5874ea07d69919d9b40d59f2c2f0bbd24bc3259
> change-id: 20260923-update-libwebsockets-fix-cve-2026-19773-21cf90b878b3
>=20
> Best regards,
> -- =20
> Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>

=2D-=20
Benjamin Robin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com




