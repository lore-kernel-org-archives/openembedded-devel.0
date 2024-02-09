Return-Path: <thomas.perrot@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C54FAC48297
	for <webhook@archiver.kernel.org>; Fri,  9 Feb 2024 23:20:27 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.2265.1707520824041450997
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Feb 2024 15:20:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=R6paNOyC;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: thomas.perrot@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0DBB41BF206;
	Fri,  9 Feb 2024 23:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1707520821;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=zE7WdZz5EAipXwMqbJq6J2xs0sgFxj31dLpe6wM/qR4=;
	b=R6paNOyC7xP6n3uAb3X5PxhCd4vdgOZQDPxKPWHzq+bHyQHtTeeU6zQZcSBrVPyOondRn9
	7w4SPZnxt+UH+IXY+mA0jkiAFOZhnZ1uRhPa+BSAt2+vv/B/1p8EqxMSZ2MygosWNfu/EH
	DzCvxg66/QI0GGcuKn5HrlyNot51D/UmOO/vHMJa2XdlYWZGjzrGtdBNgJx9gvZDL+f1q/
	6DEVyBrUxx1q63QdomHEeVH0M/MQbO8R/762kI5RlJqbvUTeuk4T2qXyNkSasfbGVuntFY
	v9eZtT3Jq54gjQ3LodcLN0+XskNbJkmtQY5WveXdRE2vJgGnmnoJDysR0jdW4A==
Message-ID: <fb393c838038bfebd9768a9fb5d0d5f2c9b87862.camel@bootlin.com>
Subject: Re: [oe][meta-oe][PATCH] kernel-selftest: no longer skip ldflags QA
From: Thomas Perrot <thomas.perrot@bootlin.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Date: Sat, 10 Feb 2024 00:20:20 +0100
In-Reply-To: <CA+chaQd7Zzd8jXCopME1-Xq3CCQUTNQU25sb8gkWQNmrnDH+uw@mail.gmail.com>
References: <20240209153623.2759946-1-thomas.perrot@bootlin.com>
	 <CA+chaQd7Zzd8jXCopME1-Xq3CCQUTNQU25sb8gkWQNmrnDH+uw@mail.gmail.com>
Autocrypt: addr=thomas.perrot@bootlin.com; prefer-encrypt=mutual;
 keydata=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
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-rXKQQXC7dydSNTBRcPgY"
User-Agent: Evolution 3.50.3 (3.50.3-1.fc39) 
MIME-Version: 1.0
X-GND-Sasl: thomas.perrot@bootlin.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Feb 2024 23:20:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108694


--=-rXKQQXC7dydSNTBRcPgY
Content-Type: multipart/alternative; boundary="=-YRxIQiQyv3bGAPZcbLAm"

--=-YRxIQiQyv3bGAPZcbLAm
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable



--=-YRxIQiQyv3bGAPZcbLAm
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable



--=-YRxIQiQyv3bGAPZcbLAm--

--=-rXKQQXC7dydSNTBRcPgY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQGzBAABCAAdFiEEh0B3xqajCiMDqBIhn8ALBXH+Cu0FAmXGszQACgkQn8ALBXH+
Cu0BRgwAhXIay5+U7gkRYfHLXIX5dWlJp/OrpRsi1JpuvnjYSN9YABC+lXSifSJG
hcoIbjA+jnQy4Tsal1E0arX4P9Hd/E8469q0Tv1e3bi2R3ZyI727XF8kTF7+xInB
eOMwvNX8FT0P1ZkIC7DuC6xPh9fb1NgB7Ntxrh1YQKprAv9vJrLXBg/cnFehommH
vo/uz5rdwQdzwQdpIEuL/USJQ/3y3ZJ2p4Ian8gqyybUXZ7lTIAwbeh0KIy4fCSM
xkwI5XtFRvruWGwaQLcXMntGmcn9fV7MVGa7dHUK+o8qisK4XHUwh7EP0V+avUTQ
PYOqgHDCaCDlpjcrXSGS9XkTeXdiK/R2ZSJf288G/MvlsJTA1hUeQoNhve6jCtlq
ZNO9VwjYC5wDaJ/4ZyIz+ObSe3yOGXtdFnXl7xAfSTdFV620w6k8RMZ0eMtiJrCJ
ky3YgsvxlWTfPNB4AwqOCa89nAu5sjq1+oV8iuQ3mr7YYxdwSzCrh7N4vTt/lXE+
2Hfdbt3w
=Jn9T
-----END PGP SIGNATURE-----

--=-rXKQQXC7dydSNTBRcPgY--

