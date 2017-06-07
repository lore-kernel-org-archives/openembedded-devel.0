Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id E23D36B6EA
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Jun 2017 21:44:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 7B127184FC;
	Wed,  7 Jun 2017 23:44:34 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id R2W7n4ObDWH2; Wed,  7 Jun 2017 23:44:33 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 47B44184FB;
	Wed,  7 Jun 2017 23:44:33 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0735F1E0BE;
	Wed,  7 Jun 2017 23:44:33 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EC4281E0B9;
	Wed,  7 Jun 2017 23:44:32 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Wed,  7 Jun 2017 23:44:32 +0200 (CEST)
Received: from XBOX04.axis.com (xbox04.axis.com [10.0.5.18])
	by thoth.se.axis.com (Postfix) with ESMTP id DEE362B4A;
	Wed,  7 Jun 2017 23:44:32 +0200 (CEST)
Received: from xbox11.axis.com (10.0.5.25) by XBOX04.axis.com (10.0.5.18) with
	Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Wed, 7 Jun 2017 23:44:33 +0200
Received: from XBOX02.axis.com (10.0.5.16) by xbox11.axis.com (10.0.5.25) with
	Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Wed, 7 Jun 2017 23:44:32 +0200
Received: from XBOX02.axis.com ([fe80::d00f:cb52:1b56:20d]) by XBOX02.axis.com
	([fe80::d00f:cb52:1b56:20d%21]) with mapi id 15.00.1210.000;
	Wed, 7 Jun 2017 23:44:32 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "Adam C. Foltzer" <acfoltzer@galois.com>, Ross Burton
	<ross.burton@intel.com>
Thread-Topic: [oe] [meta-oe][PATCH 1/3] meson: update Meson devtool to 0.40.1
Thread-Index: AQHS3iB+trpzHf1gP0mwgAxv4TjnoKIZ7XNQ
Date: Wed, 7 Jun 2017 21:44:32 +0000
Message-ID: <8806ffa9be8f4516b3f29cc1be0ceaf3@XBOX02.axis.com>
References: <20170605172321.12557-1-acfoltzer@galois.com>
In-Reply-To: <20170605172321.12557-1-acfoltzer@galois.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 1/3] meson: update Meson devtool to 0.40.1
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 07 Jun 2017 21:44:35 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> Adam C. Foltzer
> Sent: den 5 juni 2017 19:23
> To: openembedded-devel@lists.openembedded.org
> Subject: [oe] [meta-oe][PATCH 1/3] meson: update Meson devtool to
> 0.40.1
>=20
> Signed-off-by: Adam C. Foltzer <acfoltzer@galois.com>
> ---
>  meta-oe/recipes-devtools/meson/{meson_0.37.1.bb =3D> meson_0.40.1.bb} |
> 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-oe/recipes-devtools/meson/{meson_0.37.1.bb =3D>
> meson_0.40.1.bb} (88%)
>=20
> diff --git a/meta-oe/recipes-devtools/meson/meson_0.37.1.bb b/meta-
> oe/recipes-devtools/meson/meson_0.40.1.bb
> similarity index 88%
> rename from meta-oe/recipes-devtools/meson/meson_0.37.1.bb
> rename to meta-oe/recipes-devtools/meson/meson_0.40.1.bb
> index dbbea64..fd96b42 100644
> --- a/meta-oe/recipes-devtools/meson/meson_0.37.1.bb
> +++ b/meta-oe/recipes-devtools/meson/meson_0.40.1.bb
> @@ -9,7 +9,7 @@ SRC_URI =3D " \
>      file://native_bindir.patch \
>  "
>=20
> -SRCREV =3D "3d4bfdcb22314ea7db45a5b075f8b2a9c1498aab"
> +SRCREV =3D "b25d3e4d3f2b4d37029a507cc089bdde643c6240"
>=20
>  S =3D "${WORKDIR}/git"
>=20
> --
> 2.9.4

When I updated the meson recipe to 0.37.1, I did not update it to the=20
latest version at the time (0.38 something if I remember correctly)
because the latter version failed to build shared libraries if building=20
with PIE had been enabled by including security_flags.inc. I had=20
planned to look into that, but never got around to it. If you have not=20
tried building with PIE enabled, you should try that as it probably=20
still causes build problems with 0.40.1...

My guess is that the problem stems from the fact that security_flags.inc=20
adds -pie (which is a linker flag) to SECURITY_CFLAGS rather than=20
SECURITY_LDFLAGS...

//Peter


