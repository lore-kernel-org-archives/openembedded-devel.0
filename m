Return-Path: <u.oelmann@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3171DC433FE
	for <webhook@archiver.kernel.org>; Thu, 10 Nov 2022 10:31:10 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web10.5782.1668076260117902002
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Nov 2022 02:31:01 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: u.oelmann@pengutronix.de)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <u.oelmann@pengutronix.de>)
	id 1ot4pl-0008Vx-UV; Thu, 10 Nov 2022 11:30:57 +0100
Received: from uol by dude.hi.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <u.oelmann@pengutronix.de>)
	id 1ot4pl-00D1z3-Hg; Thu, 10 Nov 2022 11:30:57 +0100
References: <17241B2BA7BC32D1.10169@lists.openembedded.org>
User-agent: mu4e 1.6.9; emacs 29.0.50
From: Ulrich =?utf-8?Q?=C3=96lmann?= <u.oelmann@pengutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Ulrich =?utf-8?Q?=C3=96lmann?= <u.oelmann@pengutronix.de>
Subject: Re: [oe] [meta-java][PATCH] layer.conf: Mark as compatible with
 langdale
Date: Thu, 10 Nov 2022 11:30:26 +0100
In-reply-to: <17241B2BA7BC32D1.10169@lists.openembedded.org>
Message-ID: <6rv8nn3xum.fsf@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: u.oelmann@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-devel@lists.openembedded.org
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Nov 2022 10:31:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99547

Gentle ping!

On Thu, Nov 03 2022 at 16:00 +0100, Ulrich =C3=96lmann <u.oelmann@pengutron=
ix.de> wrote:
> Signed-off-by: Ulrich =C3=96lmann <u.oelmann@pengutronix.de>
> ---
>  conf/layer.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/conf/layer.conf b/conf/layer.conf
> index 2e2ce1677ecc..99a137608744 100644
> --- a/conf/layer.conf
> +++ b/conf/layer.conf
> @@ -7,7 +7,7 @@ BBFILES +=3D "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/rec=
ipes*/*/*.bbappend"
>  BBFILE_COLLECTIONS +=3D "meta-java"
>  BBFILE_PATTERN_meta-java :=3D "^${LAYERDIR}/"
>  BBFILE_PRIORITY_meta-java =3D "10"
> -LAYERSERIES_COMPAT_meta-java =3D "kirkstone"
> +LAYERSERIES_COMPAT_meta-java =3D "kirkstone langdale"
>  LAYERDEPENDS_meta-java +=3D "openembedded-layer"
>=20=20
>  LICENSE_PATH +=3D "${LAYERDIR}/licenses"
--=20
Pengutronix e.K.                           | Ulrich =C3=96lmann            =
   |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

