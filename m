Return-Path: <lchristina26@hotmail.com>
Received: from BAY004-OMC4S6.hotmail.com (bay004-omc4s6.hotmail.com
	[65.54.190.208])
	by mail.openembedded.org (Postfix) with ESMTP id 2F1FA7276B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Dec 2014 21:29:29 +0000 (UTC)
Received: from BAY168-W61 ([65.54.190.200]) by BAY004-OMC4S6.hotmail.com over
	TLS secured channel with Microsoft SMTPSVC(7.5.7601.22751); 
	Mon, 22 Dec 2014 13:29:29 -0800
X-TMN: [0i2QMlsh6SKKJHBEUsn9vlPKIw8Xo6Ku]
X-Originating-Email: [lchristina26@hotmail.com]
Message-ID: <BAY168-W61FFA01131B891AB065DD5D6560@phx.gbl>
From: LC Mac <lchristina26@hotmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Mon, 22 Dec 2014 14:29:29 -0700
Importance: Normal
In-Reply-To: <BLU436-SMTP91C639BE79BEE1011BACB5D6560@phx.gbl>
References: <BLU436-SMTP91C639BE79BEE1011BACB5D6560@phx.gbl>
MIME-Version: 1.0
X-OriginalArrivalTime: 22 Dec 2014 21:29:29.0375 (UTC)
	FILETIME=[5E55BAF0:01D01E2E]
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-networking][PATCH] cyassl: add new recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 22 Dec 2014 21:29:31 -0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Please ignore this patch.

> From: lchristina26@hotmail.com
> To: openembedded-devel@lists.openembedded.org
> CC: lchristina26@hotmail.com
> Subject: [meta-networking][PATCH] cyassl: add new recipe
> Date: Mon=2C 22 Dec 2014 14:20:08 -0700
>=20
> Adding cyassl 3.3.0 as a new recipe as instructed. Removing 3.1.0.
>=20
> Signed-off-by: Leah <lchristina26@hotmail.com>
> ---
>  .../recipes-connectivity/cyassl/cyassl_3.1.0.bb        |  1 -
>  .../recipes-connectivity/cyassl/cyassl_3.3.0.bb        | 18 ++++++++++++=
++++++
>  2 files changed=2C 18 insertions(+)=2C 1 deletion(-)
>  delete mode 100644 meta-networking/recipes-connectivity/cyassl/cyassl_3.=
1.0.bb
>  create mode 100644 meta-networking/recipes-connectivity/cyassl/cyassl_3.=
3.0.bb
>=20
> diff --git a/meta-networking/recipes-connectivity/cyassl/cyassl_3.1.0.bb =
b/meta-networking/recipes-connectivity/cyassl/cyassl_3.1.0.bb
> deleted file mode 100644
> index 46619a1..0000000
> --- a/meta-networking/recipes-connectivity/cyassl/cyassl_3.1.0.bb
> +++ /dev/null
> @@ -1 +0=2C0 @@
> -a=3Bdlfkj
> diff --git a/meta-networking/recipes-connectivity/cyassl/cyassl_3.3.0.bb =
b/meta-networking/recipes-connectivity/cyassl/cyassl_3.3.0.bb
> new file mode 100644
> index 0000000..b6f852d
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/cyassl/cyassl_3.3.0.bb
> @@ -0=2C0 +1=2C18 @@
> +SUMMARY =3D "CyaSSL Lightweight=2C Embedded SSL Library"
> +DESCRIPTION =3D "CyaSSL is a lightweight SSL library written in C and \
> +               optimized for embedded and RTOS environments. It can be \
> +               Up to 20 times smaller than OpenSSL while still supportin=
g \
> +               a full TLS 1.2 client and server."
> +HOMEPAGE =3D "http://www.yassl.com/yaSSL/Products-cyassl.html"
> +BUGTRACKER =3D "http://github.com/cyassl/cyassl/issues"
> +SECTION =3D "libs/network"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://COPYING=3Bmd5=3Db234ee4d69f5fce4486a80fdaf4=
a4263"
> +
> +SRC_URI =3D "http://www.yassl.com/${BP}.zip"
> +
> +SRC_URI[md5sum] =3D "0303eb0f2f9065a1207d9104ab0eba7c"
> +SRC_URI[sha256sum] =3D "e51583ea1e4d64537553922d67a96360312811dffef58d4c=
05506aa98a296fe3"
> +
> +inherit autotools
> +
> --=20
> 1.9.1
>=20
 		 	   		  =

