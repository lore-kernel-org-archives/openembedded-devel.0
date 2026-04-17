Return-Path: <mail@michael-fitzmayer.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8204BF436BD
	for <webhook@archiver.kernel.org>; Fri, 17 Apr 2026 16:38:00 +0000 (UTC)
Received: from mailserv.regfish.com (mailserv.regfish.com [52.57.101.90])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.49463.1776443871833683535
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Apr 2026 09:37:52 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=permanent DNS error (domain: michael-fitzmayer.de, ip: 52.57.101.90, mailfrom: mail@michael-fitzmayer.de)
Received: by mailserv.regfish.com (Postfix, from userid 706)
	id AC1D1619C0; Fri, 17 Apr 2026 16:37:49 +0000 (UTC)
Received: from DESKTOPB84SDL6 (ipservice-092-209-208-070.092.209.pools.vodafone-ip.de [92.209.208.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: 46272-0001)
	by mailserv.regfish.com (Postfix) with ESMTPSA id 9575E619AE
	for <openembedded-devel@lists.openembedded.org>; Fri, 17 Apr 2026 16:37:49 +0000 (UTC)
From: "Michael Fitzmayer" <mail@michael-fitzmayer.de>
To: <openembedded-devel@lists.openembedded.org>
References: <CAMKF1sqWpfSsFVSiBkiQCQkv0pjTSh1i9HJuX06E_EkBd4jmyQ@mail.gmail.com> <3323E3B7-6461-427C-9A02-0C108D4A139B@michael-fitzmayer.de> <6c6a6f90-f25c-4b85-9c00-665f0f4e21b4@gmail.com>
In-Reply-To: <6c6a6f90-f25c-4b85-9c00-665f0f4e21b4@gmail.com>
Subject: RE: [oe] [meta-oe][PATCH] canopenterm: update to release version 2.02
Date: Fri, 17 Apr 2026 18:37:49 +0200
Message-ID: <002301dcce88$8757bae0$960730a0$@michael-fitzmayer.de>
X-Mailer: Microsoft Outlook 16.0
MIME-Version: 1.0
Content-Language: en-gb
Thread-Index: AQJKQt64/2TAYQACMXA7jTidGpE1fAIf/n+GAfd7Msi0587sUA==
Content-Type: multipart/signed;
	boundary="=-=kCbnrWecPjR3hA=-=";
	protocol="application/pgp-signature";
	micalg=pgp-sha256
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Apr 2026 16:38:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126447

This is a multipart message in MIME format.

--=-=kCbnrWecPjR3hA=-=
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable

-----Original Message-----
From: Gyorgy Sarvari <skandigraun@gmail.com>=20
Sent: 16 April 2026 09:19
To: mail@michael-fitzmayer.de; openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [meta-oe][PATCH] canopenterm: update to release version 2=
.02

< As I can see these patches basically move the recipe to the tip of the ma=
in branch. In the future, if there would be such cases, where there are ext=
ra commits after a tag that need to be included in the recipe, you can just=
 set the SRCREV to the correct revision, if there are no commits that need =
to be skipped. You can just add `PV .=3D "+git"` to the recipe to indicate =
that there are some extra goodies included also after the tag (and maybe ad=
d a quick note in the commit message about it).
That avoids messing with patches and makes the intent also clearer.

< I wouldn't send a new version because of this, but it might be useful for=
 the next time.

Understood! I will add `PV .=3D "+git"` in case I have a similar scenario i=
n the future. Is it fine for the time being?

Thanks!

--=-=kCbnrWecPjR3hA=-=
Content-Type: application/pgp-signature;
	name="openpgp-digital-signature.asc"
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQGzBAEBCAAdFiEEeko8mQdaojPAePLVyfzHsirX2UkFAmniYdwACgkQyfzHsirX
2UlRJQv+LxQEpZ5OiPeO4sIfVgU7T1BiqKjll7ey9zIcXSPlxqzPzaCFroMcmACF
sAcAzpxtRza+FO93Q/CXHDvxkPhyNH5JFi0uB9hHs8ISQX5u3s3c+zm4cjeNge9B
qiCuQVQNjHy6MhkemAOaprHIMbzAQBIDNBW0/kKtQ1OCoFXcJ031lFxWF4J6e7wf
znu1M5G29Quvgg1/PAlrxrWUzvoREZuUSAoqfKb8/1lIfOSA7dEN4MR3A9XvLg0P
6qUHEOkrjgWEKb2WOGF0dnOTLr0BClzRFQ0E9osNdMapCCY91gYKR1vDbdR5drMP
sbYNFbkBuENhaKGGOg+Mr499d+AbZ2YfPaY1pT+m/uuzwgwNLP8SMb+MIS886Gx3
rKVgFpL4ktGsl+Jyn+ORxHZr3Vl/eae6gtmBw5660UnBPK0sWZEHYuReYoF/m/H3
qUQs1wEOaQ2ZOD/JUDNFmNlBxdsvTb72T08gkrHrcm7JlSIBfHMYjnff6sBH86m4
ZsDYCJPF
=CIHi
-----END PGP SIGNATURE-----


--=-=kCbnrWecPjR3hA=-=--


