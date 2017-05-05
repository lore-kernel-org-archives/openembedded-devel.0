Return-Path: <jobol@nonadev.net>
Received: from erza.lautre.net (erza.lautre.net [80.67.160.89])
	by mail.openembedded.org (Postfix) with ESMTP id 9937B77D19
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 May 2017 08:26:21 +0000 (UTC)
Received: from d-jobol.iot.bzh (por56-1-78-229-206-229.fbx.proxad.net
	[78.229.206.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by erza.lautre.net (Postfix) with ESMTPSA id 3DE87FBBBE
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 May 2017 10:26:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=nonadev.net;
	s=alternc; t=1493972767;
	bh=rHcjxLqq+RYzG3yZVgaGyGi5E7Zp75T+4PaV1sh6sBE=;
	h=Date:From:To:Subject:In-Reply-To:References;
	b=uTcbRI1TyP8Ovkp8mB203nQLByZqgvyfZmxK0YhwnwVlyZKdWdUlTcpMnxt5lzoTZ
	Gg9bC7J00VY3k7DX61XvPQm48ZMDTjd7jq6WPtlfMr7C8RS/8XapPZsQvSvq3Ydn3F
	6FtAoCWY072HeLEex1FQR4tyhsHAYg4DrhRFVbyI=
Date: Fri, 5 May 2017 10:26:20 +0200
From: =?UTF-8?B?Sm9zw6k=?= Bollo <jobol@nonadev.net>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20170505102620.2aaafa18@d-jobol.iot.bzh>
In-Reply-To: <20170505080718.6774-1-jobol@nonadev.net>
References: <20170505080718.6774-1-jobol@nonadev.net>
X-Mailer: Claws Mail 3.14.1 (GTK+ 2.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [PATCH] libmicrohttpd: Fix a segmentation fault on upgrade error
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
X-List-Received-Date: Fri, 05 May 2017 08:26:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri,  5 May 2017 10:07:18 +0200

A backport to pyro is a very good idea because this fixes a
vulnerability.

I don't know the procedure, maybe this simple mail is enough ?

Best regards
Jos=C3=A9 Bollo

jobol@nonadev.net wrote:

> When a connection upgrade is requested and when the
> request sent an error reply, it happened most often
> that a segmentation fault occured.
>=20
> The patch applied here is a backport from the
> upstream (see https://gnunet.org/git/libmicrohttpd.git/
> commit b4216c60fdb5b48f6cfec416301fc63a1167e6cd).
>=20
> Change-Id: I6847550ba2c4fc24d5caf8912ac6d5ac89ae01fb
> Signed-off-by: Jos=C3=A9 Bollo <jose.bollo@iot.bzh>
> ---
>  .../Check-response-existence-on-upgrade.patch      | 49
> ++++++++++++++++++++++ .../libmicrohttpd/libmicrohttpd_0.9.53.bb
> |  3 ++ 2 files changed, 52 insertions(+)
>  create mode 100644
> meta-oe/recipes-support/libmicrohttpd/libmicrohttpd/Check-response-existe=
nce-on-upgrade.patch
>=20
> diff --git
> a/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd/Check-response-exis=
tence-on-upgrade.patch
> b/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd/Check-response-exis=
tence-on-upgrade.patch
> new file mode 100644 index 0000000..a02bbd4 --- /dev/null
> +++
> b/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd/Check-response-exis=
tence-on-upgrade.patch
> @@ -0,0 +1,49 @@ +From: jose.bollo@iot.bzh
> +Date: Thu, 4 May 2017 21:47:38 +0200
> +Subject: [PATCH] Check response existence on upgrade
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +When a connection upgrade is requested and when the
> +request sent an error reply, the response is most of
> +the time already sent when the test on
> +connection->response->upgrade_handler is made, leading
> +to dereferencing NULL.
> +
> +Two possibilities exist:
> +
> +  NULL =3D=3D connection->response || NULL =3D=3D
> connection->response->upgrade_handler +
> +or
> +
> +  NULL !=3D connection->response && NULL =3D=3D
> connection->response->upgrade_handler +
> +The first is prefered because it is probably safer to close the
> connection +in that case.
> +
> +Upstream-Status: Accepted
> [https://gnunet.org/git/libmicrohttpd.git/commit/?id=3Db4216c60fdb5b48f6c=
fec416301fc63a1167e6cd]
> + +Change-Id: Ie6e7fc165f7fe3635ade0952bb34a0b937d38716
> +Signed-off-by: Jos=C3=A9 Bollo <jobol@nonadev.net>
> +Signed-off-by: Jos=C3=A9 Bollo <jose.bollo@iot.bzh>
> +---
> + src/microhttpd/connection.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/microhttpd/connection.c
> b/src/microhttpd/connection.c +index a495524..d39c110 100644
> +--- a/src/microhttpd/connection.c
> ++++ b/src/microhttpd/connection.c
> +@@ -882,7 +882,7 @@ keepalive_possible (struct MHD_Connection
> *connection)
> + #ifdef UPGRADE_SUPPORT
> +     if ( (MHD_str_equal_caseless_ (end,
> +                                    "upgrade")) &&
> +-         (NULL =3D=3D connection->response->upgrade_handler) )
> ++         (NULL =3D=3D connection->response || NULL =3D=3D
> connection->response->upgrade_handler) )
> +       return MHD_NO;
> + #endif /* UPGRADE_SUPPORT */
> +=20
> +--=20
> +2.9.3
> +
> diff --git
> a/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.53.bb
> b/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.53.bb index
> a7f032a..45f2460 100644 ---
> a/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.53.bb +++
> b/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.53.bb @@
> -9,6 +9,9 @@ SRC_URI =3D
> "http://ftp.gnu.org/gnu/libmicrohttpd/${BPN}-${PV}.tar.gz"
> SRC_URI[md5sum] =3D "5a425e993a0f5295aecb5d6607a1c242"
> SRC_URI[sha256sum] =3D
> "9b15ec2d381f44936323adfd4f989fa35add517cccbbfa581896b02a393c2cc4"
> +FILESEXTRAPATHS_append :=3D ":${THISDIR}/${PN}" +SRC_URI +=3D "
> file://Check-response-existence-on-upgrade.patch" + inherit autotools
> lib_package pkgconfig gettext EXTRA_OECONF +=3D "--disable-static
> --with-gnutls=3D${STAGING_LIBDIR}/../"


