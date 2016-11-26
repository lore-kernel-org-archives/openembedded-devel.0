Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 73C8A6FF80
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Nov 2016 00:16:08 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id u144so9836725wmu.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Nov 2016 16:16:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=boT2GnB4xFB2+mriYf9kDnOsWKLQgk8qu10OmnZmtIM=;
	b=eDiANC9ZRzWJyxWCP9MKOeJDo95+1gJBWZ6qXWxSwPmgCwwbFsmCJfbsxHjfUo47oj
	90tb3XLKERKj9Bt/ensl2CEgMwXZLm2PwXbOBAgnWeUqdI1NuYJhnvi+iNnYSbaHCw4a
	wWj/ktwgON6TMPv+SzAveJs1Dyxst8ZJ4Ih6vY+nJmRKdR7Cy3HZVKX3oA9sIrQXjuA/
	tyaCQLU9RYNNclbHPWjXArQ4v+pixZQV1WQa1eHUAqgD01BrzhxBDOxFYrmA9zDuen96
	b1fBxQCsKoO5v79q+JWxb5V7MgI7JIQyRWGFmGd3KjTT5oi/EsJPXAsAJkjRqUS7nxhZ
	+jSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=boT2GnB4xFB2+mriYf9kDnOsWKLQgk8qu10OmnZmtIM=;
	b=gAMSoW7rH8LDamxwOhvOczqV8Gfs6hlcDOypcCg+LK0cQNop64iKUyqAvlix7nL+nx
	K3OhCK7PYgpye2XBS/DN/x0fc5BTasGz1sUI7slFpdX0SwRbnFQKCs91W/KPdqNU2Xyo
	bHD26eX8lln5z7fkqHlTPQLczrsFUH6EzeOKLq0mBbL98v4abQVTL0Ha6DFClFKeKe9W
	lSq6KT1jqXGTud1MJ1d4KAv7i6PfTSE9z+l09puLFiw6NebEftR95XHQjUVcIQ9pwqbl
	EG6nueTYOBUkOtdOHYAtL/1rYgxm0Moslmo/r2lwV762Aa+R7t+bp+nYTd48liOjnVSP
	ZtCw==
X-Gm-Message-State: AKaTC03PwVIoyiRHrwOo+XTgMjElJqNQ/zZXsVVf63sKKLilqPicIFRoXmuyNh+9vSt2Uw==
X-Received: by 10.28.6.203 with SMTP id 194mr9472514wmg.16.1480119369965;
	Fri, 25 Nov 2016 16:16:09 -0800 (PST)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id 6sm49425013wjt.5.2016.11.25.16.16.09
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 25 Nov 2016 16:16:09 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sat, 26 Nov 2016 01:16:14 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20161126001614.GC8369@jama>
References: <20161123092209.23699-1-raj.khem@gmail.com>
	<20161123092209.23699-29-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20161123092209.23699-29-raj.khem@gmail.com>
User-Agent: Mutt/1.7.1 (2016-10-04)
Subject: Re: [meta-networking][PATCH 29/49] dante: Add recipe for 1.4.1
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
X-List-Received-Date: Sat, 26 Nov 2016 00:16:09 -0000
X-Groupsio-MsgNum: 64045
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JgQwtEuHJzHdouWu"
Content-Disposition: inline

--JgQwtEuHJzHdouWu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 23, 2016 at 01:21:49AM -0800, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../recipes-protocols/dante/dante_1.4.1.bb         | 47 ++++++++++++++++=
++++++
>  1 file changed, 47 insertions(+)
>  create mode 100644 meta-networking/recipes-protocols/dante/dante_1.4.1.bb
>=20
> diff --git a/meta-networking/recipes-protocols/dante/dante_1.4.1.bb b/met=
a-networking/recipes-protocols/dante/dante_1.4.1.bb
> new file mode 100644
> index 0000000..dbb86fb
> --- /dev/null
> +++ b/meta-networking/recipes-protocols/dante/dante_1.4.1.bb
> @@ -0,0 +1,47 @@
> +SECTION =3D "console/utils"
> +SUMMARY =3D "A free SOCKS server"
> +DESCRIPTION =3D "Dante consists of a SOCKS server and a SOCKS client,\
> +implementing RFC 1928 and related standards. It is a flexible product\
> +that can be used to provide convenient and secure network\
> +connectivity. Once installed, Dante can in most cases be made\
> +transparent to clients, providing functionality somewhat similar to\
> +what could be described as a non-transparent Layer 4 router."
> +HOMEPAGE =3D "http://www.inet.no/dante/"
> +
> +LICENSE =3D "BSD-3-Clause"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D221118dda731fe93a85d0ed973467=
249"
> +
> +SRC_URI =3D "https://www.inet.no/dante/files/dante-${PV}.tar.gz \
> +          "
> +SRC_URI[md5sum] =3D "68c2ce12119e12cea11a90c7a80efa8f"
> +SRC_URI[sha256sum] =3D "b6d232bd6fefc87d14bf97e447e4fcdeef4b28b16b048d80=
4b50b48f261c4f53"
> +
> +# without --without-gssapi, config.log will contain reference to /usr/lib
> +# as a consequence of GSSAPI path being set to /usr by default.
> +# --with-gssapi-path=3DPATH specify gssapi path
> +# --without-gssapi        disable gssapi support
> +# --enable-release        build prerelease as full release
> +EXTRA_OECONF +=3D "--without-gssapi --sbindir=3D${bindir}"
> +
> +DEPENDS +=3D "flex-native bison-native"
> +DEPENDS +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '=
', d)}"

Autodetects bunch of dependencies:
http://lists.openembedded.org/pipermail/openembedded-devel/2016-November/11=
0050.html

--JgQwtEuHJzHdouWu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWDjUTQAKCRA3VSO3ZXaA
HH6ZAJ46SQyzOaiG/NQ802IXkUFxz/JTnACgg9bJHArSFiA+SPed1dEQme1XXdE=
=4OfK
-----END PGP SIGNATURE-----

--JgQwtEuHJzHdouWu--
