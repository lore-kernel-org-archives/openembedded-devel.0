Return-Path: <martin@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CA42C4345F
	for <webhook@archiver.kernel.org>; Mon,  6 May 2024 07:15:23 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by mx.groups.io with SMTP id smtpd.web11.15242.1714979719012546663
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 May 2024 00:15:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=default2211 header.b=cinbjN+N;
 spf=pass (domain: geanix.com, ip: 188.40.30.78, mailfrom: martin@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=MIME-Version:Content-Transfer-Encoding:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=3deTM5sQu2JyRK2+4syP+FIwppSadUgroxMRCXDSkmM=; b=cinbjN+NVoRkNcLGZIuix7Rs7U
	UV1MHgxpZkZ45U7rivJ6ODuYWhrviMT0rV1eJ/JahEHHbWVGwWxbU8SKIXK/q0UseQPL04f9b1kXN
	slYRs9IyT5pt7Nz4ZpchWInzP0QFEtjFVv3L9BMRszy+kl8dgfbNr6cOaMiaebwUeLPq6dL48Dlfw
	J0FS94W2QqToX8id0fxPAkFGJ98bJ6P8TSeeYka5WRBZZryszkuPfmJAc6GXjrbrk6vFYhILSCssG
	Xq33WY09EiailEvLej81rzHDZihd6uEkKyOz5Khl55JiEhPf2eHtpN2gThEnDyUs0nGrRHggPer9x
	ptp3TPyA==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <martin@geanix.com>)
	id 1s3sZA-000Dq3-6u; Mon, 06 May 2024 09:15:16 +0200
Received: from [185.17.218.86] (helo=[192.168.64.76])
	by sslproxy06.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <martin@geanix.com>)
	id 1s3sZ9-007Jmg-34;
	Mon, 06 May 2024 09:15:15 +0200
Message-ID: <8ce0bdc0aa421a9685b740a8cca4c93801e049ad.camel@geanix.com>
Subject: Re: [PATCH] nodejs-oe-cache: fix offline install of dependencies
From: Martin =?ISO-8859-1?Q?Hundeb=F8ll?= <martin@geanix.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 06 May 2024 09:15:15 +0200
In-Reply-To: <20240503094232.2114574-1-martin@geanix.com>
References: <20240503094232.2114574-1-martin@geanix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 
MIME-Version: 1.0
X-Authenticated-Sender: martin@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27266/Sun May  5 10:28:11 2024)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 May 2024 07:15:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110259

Hi Khem,

Please pick this patch for scarthgap too.

Thanks,
Martin

On Fri, 2024-05-03 at 11:42 +0200, Martin Hundeb=C3=B8ll wrote:
> Apparently, npm has changed its request accept header, so that cache
> lookup misses. This causes an ENOTCACHED error when doing the offline
> install in do_compile() from npm.bbclass.
>=20
> Fix it by updating the fake cache entry to match the newest behaviour
> from npm.
>=20
> Note that npm doesn't agree with itself, as it still uses the
> previous
> header value when doing `npm cache add <pkg>`, but the new value when
> doing `npm install <pkg>`.
>=20
> Bug submitted upstream:
> https://github.com/npm/cli/issues/7465
>=20
> Signed-off-by: Martin Hundeb=C3=B8ll <martin@geanix.com>
> ---
> =C2=A0.../recipes-devtools/nodejs/nodejs-oe-cache-20.12/oe-npm-cache=C2=
=A0 | 2
> +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-
> 20.12/oe-npm-cache b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-
> 20.12/oe-npm-cache
> index f59620764..eb0f143ea 100755
> --- a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-20.12/oe-npm-
> cache
> +++ b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-20.12/oe-npm-
> cache
> @@ -30,7 +30,7 @@ const xlate =3D {
> =C2=A0		time: Date.now(),
> =C2=A0		url:=C2=A0 key,
> =C2=A0		reqHeaders: {
> -		=C2=A0=C2=A0=C2=A0 'accept': 'application/vnd.npm.install-v1+json;
> q=3D1.0, application/json; q=3D0.8, */*',
> +		=C2=A0=C2=A0=C2=A0 'accept': 'application/json',
> =C2=A0		},
> =C2=A0		resHeaders: {
> =C2=A0		=C2=A0=C2=A0=C2=A0 "content-type": "application/json",


