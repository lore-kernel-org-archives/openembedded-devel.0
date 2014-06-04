Return-Path: <martin.jansa@gmail.com>
Received: from mail-pb0-f45.google.com (mail-pb0-f45.google.com
	[209.85.160.45])
	by mail.openembedded.org (Postfix) with ESMTP id 8491C6FB5D
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Jun 2014 09:36:53 +0000 (UTC)
Received: by mail-pb0-f45.google.com with SMTP id um1so6745055pbc.18
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Jun 2014 02:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=KG1Q6VTovCvjUaPVTtvXHYahzipK39RnQJ6uQn2r9ag=;
	b=IZQGf+TtY9poRWwS3sT4Ic1A/+GUzdluo8q0Yuu5ISN7ND4fCz9CZqk43uQdDXOqOs
	GzFei3kW0Qj6hz2MxGz2QdIh+ZHeTFIXqQOJiJfQKc50YtPxgi4o6wWwHxWkFZ1LV2PR
	ZsSg+4jcNsvy6LOBSEFNEB1ix/wScAu3Nlmwd6UXUfLr8DLCm9M7Kc04B0yxg27duDWi
	Dqq6Sl4d8IZWIQatzM3+uYH35gCNQLuO9uPBkwzeyyOPc4MI/uCaiKv6mSlBWN1u4fD6
	2VdvEwtqeVW/ngbsVw6Vh1nAKY3hT3kYbDChhp0UWqtdBOI/7eihdBZpKEJU80bliD23
	5LUw==
X-Received: by 10.68.113.68 with SMTP id iw4mr60347457pbb.119.1401874614944;
	Wed, 04 Jun 2014 02:36:54 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	zq5sm7749275pbb.37.2014.06.04.02.36.52
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Jun 2014 02:36:53 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 4 Jun 2014 11:37:05 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140604093705.GQ2426@jama>
References: <CAAPegz1J+4vrvOF3F9Rj11_0-Lhd0ybFFci-_UXgLtVBhxreYg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAPegz1J+4vrvOF3F9Rj11_0-Lhd0ybFFci-_UXgLtVBhxreYg@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH] dfu-util 0.7 recipe, remove old 0.1 recipe
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
X-List-Received-Date: Wed, 04 Jun 2014 09:36:57 -0000
X-Groupsio-MsgNum: 50168
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Pa4xkLBhPDIhDLv1"
Content-Disposition: inline

--Pa4xkLBhPDIhDLv1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 01, 2014 at 01:42:34PM -0400, Chris Morgan wrote:
> dfu-util 0.7 is the latest release of dfu-util
>=20
> Remove old dfu-util 0.1 recipe

Please use git send-email, see extra line feeds you have in
'SRC_URI[sha256sum]' lines, this time I'll apply it manually, but next
time I'll just reject them.

Thanks

> Signed-off-by: Chris Morgan <chmorgan@gmail.com>
> ---
>  meta-oe/recipes-support/dfu-util/dfu-util_0.1.bb | 10 ----------
>  meta-oe/recipes-support/dfu-util/dfu-util_0.7.bb |  6 ++++++
>  2 files changed, 6 insertions(+), 10 deletions(-)
>  delete mode 100644 meta-oe/recipes-support/dfu-util/dfu-util_0.1.bb
>  create mode 100644 meta-oe/recipes-support/dfu-util/dfu-util_0.7.bb
>=20
> diff --git a/meta-oe/recipes-support/dfu-util/dfu-util_0.1.bb
> b/meta-oe/recipes-support/dfu-util/dfu-util_0.1.bb
> deleted file mode 100644
> index b63d74d..0000000
> --- a/meta-oe/recipes-support/dfu-util/dfu-util_0.1.bb
> +++ /dev/null
> @@ -1,10 +0,0 @@
> -require dfu-util.inc
> -
> -PR =3D "r1"
> -
> -DEPENDS =3D "virtual/libusb0 usbpath"
> -
> -BBCLASSEXTEND =3D "native"
> -
> -SRC_URI[md5sum] =3D "454b931249d29e4a6c2a2ade17858490"
> -SRC_URI[sha256sum] =3D
> "a27cc667be9b158fecf0ed066698e30eca0c0b3cd7a85aad2058d47ffe16f0e1"
> diff --git a/meta-oe/recipes-support/dfu-util/dfu-util_0.7.bb
> b/meta-oe/recipes-support/dfu-util/dfu-util_0.7.bb
> new file mode 100644
> index 0000000..c4c030d
> --- /dev/null
> +++ b/meta-oe/recipes-support/dfu-util/dfu-util_0.7.bb
> @@ -0,0 +1,6 @@
> +require dfu-util.inc
> +
> +DEPENDS =3D "libusb1"
> +
> +SRC_URI[md5sum] =3D "56844020177d4db4c1ea2e926fe9d588"
> +SRC_URI[sha256sum] =3D
> "f52a2a5489fbf9f3204a6ada05e0b47ee322e19d81c712e0c58a332d80ec3eab"
> --=20
> 1.9.3
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Pa4xkLBhPDIhDLv1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlOO6MEACgkQN1Ujt2V2gBwwYgCfX6JMIDQnavqghfjHosQqJDbO
pgoAnRX2Ml9Lq1m+reHzJ3sn7+LganqH
=LP42
-----END PGP SIGNATURE-----

--Pa4xkLBhPDIhDLv1--
