Return-Path: <jan.claussen10@web.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CF16D1BDEB
	for <webhook@archiver.kernel.org>; Wed,  3 Dec 2025 21:32:40 +0000 (UTC)
Received: from mout.web.de (mout.web.de [212.227.15.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27389.1764797550335946043
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Dec 2025 13:32:30 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=jan.claussen10@web.de header.s=s29768273 header.b=jbUUaEus;
 spf=pass (domain: web.de, ip: 212.227.15.4, mailfrom: jan.claussen10@web.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1764797548; x=1765402348; i=jan.claussen10@web.de;
	bh=874cJoZdaI2WznJ5uw2GkxX5r0HHaBU0rzHSlG9SwLs=;
	h=X-UI-Sender-Class:Content-Type:Content-Transfer-Encoding:From:
	 Mime-Version:Subject:Date:Message-Id:References:In-Reply-To:To:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=jbUUaEusbCRlVKeiU3laGS/jEXKrBY8mVpGm5TLLwGjXtGACmB7NiRdkzfpFHJQg
	 YbUctjoOg8MkLinTm3rgtLcezH3nre4eTBva4EKeb6KyNjzbjz9gS+QdFzYKJtncO
	 FyahE5ppo91R05cetxSsXKA3eV1CWaM9UsPLyphDKav4IzQxC9+GnowJHaWvJaMTI
	 OsLFc/vkGXDJ3ziJ5hXJ3LHY2hyYoaUmd54QyQ48is8VzD6jmeJjFhReOAsAsniA0
	 noNiXBTPYfpMGp+/Zqhg+eV9JrSlMOfMd9+4tukgprG4DW1dfAYd4FUt+RxfKCVUO
	 JzQXjAJlcyRKh+hwtQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from smtpclient.apple ([31.29.37.14]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Mho04-1vvaW41mvA-00pC7m for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Dec 2025 22:32:28 +0100
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: =?utf-8?Q?Jan_Clau=C3=9Fen?= <jan.claussen10@web.de>
Mime-Version: 1.0 (1.0)
Subject: Re: [meta-python][PATCH v2] python3-soundcard: Add recipe
Date: Wed, 3 Dec 2025 22:32:17 +0100
Message-Id: <4C07461B-CB4E-432A-AA42-E6FCC8D8317B@web.de>
References: <20251129100636.2844306-1-jan.claussen10@web.de>
In-Reply-To: <20251129100636.2844306-1-jan.claussen10@web.de>
To: openembedded-devel@lists.openembedded.org
X-Mailer: iPhone Mail (22H124)
X-Provags-ID: V03:K1:IqQl6zY+vODQ/0pye+woUgJMt5qBwKQuCvZmjejneMVS1ubRrvX
 AVHZFHdKh5dzT9/LSwpQDAHkWoLHOOrkZOcGAdKMYZ3JLwlnqtDnMzVmQR7yFi1hzkwBdw8
 3EbOGDjixkKZjWTmwwc2zYPgstuKtaa9vpz6KIPmWuxnhTIq03PzLeRjqfoTpvgCUhOrpOX
 neUfaMBdvEQ4nx4pcOB+w==
UI-OutboundReport: notjunk:1;M01:P0:T7wcP+gZSV0=;LaT3n3LxrnjCa+sHQPb3s1UvRsp
 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
 ZGUvdkp/jIrr0Pq/U=
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Dec 2025 21:32:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122291

This one good too? I forgot to name the [master] in the topic, but the recip=
e should work!

> Am 29.11.2025 um 11:06 schrieb Jan Clau=C3=9Fen <jan.claussen10@web.de>:
>=20
> =EF=BB=BFSoundCard is a library for playing and recording audio without re=
sorting to a CPython extension.
>=20
> Signed-off-by: Jan Clau=C3=9Fen <jan.claussen10@web.de>
> ---
> .../python/python3-soundcard_0.4.5.bb         | 20 +++++++++++++++++++
> 1 file changed, 20 insertions(+)
> create mode 100644 meta-python/recipes-devtools/python/python3-soundcard_0=
.4.5.bb
>=20
> diff --git a/meta-python/recipes-devtools/python/python3-soundcard_0.4.5.b=
b b/meta-python/recipes-devtools/python/python3-soundcard_0.4.5.bb
> new file mode 100644
> index 0000000000..5116892dad
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-soundcard_0.4.5.bb
> @@ -0,0 +1,20 @@
> +SUMMARY =3D "Python library for accessing soundcards"
> +DESCRIPTION =3D "SoundCard is a library for playing and recording audio w=
ithout resorting to a CPython extension"
> +HOMEPAGE =3D "https://github.com/bastibe/SoundCard"
> +SECTION =3D "devel/python"
> +
> +LICENSE =3D "BSD-3-Clause"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3De39df1540c06c17ca310ce87c36b04=
2c"
> +
> +SRC_URI[sha256sum] =3D "07272ba927e32cafdf634e4a1ca53b9a3218321a60c7d2e08=
f54b832a56946aa"
> +
> +inherit pypi setuptools3 features_check
> +
> +REQUIRED_DISTRO_FEATURES =3D "pulseaudio"
> +
> +RDEPENDS:${PN} +=3D " \
> +    libpulse \
> +    pulseaudio-server \
> +    python3-cffi \
> +    python3-numpy \
> +"
> --
> 2.52.0
>=20


