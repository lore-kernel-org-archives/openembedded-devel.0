Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id C126072041
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Nov 2014 15:49:11 +0000 (UTC)
Received: by mail-wi0-f182.google.com with SMTP id h11so2347896wiw.9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Nov 2014 07:49:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ykwp5C+3y80/lnGd5KT1NNRF3w7c/ydOI4VRUFWCG2Y=;
	b=WuB0cJQsrr8WzRaJUSRGcsk60rUQkgAXpxBtea5sbvZoKuo43t/NwPEkJFQLW3YX1t
	GOz2DCj6ijF0VqBQOzscy3pQBtlkzjZj681tqEihcyKsbsFwiaacJ4FnWW6FsKCt+AZD
	JexA1JFK8jXJWeqZi6m0q3Nsay+mc8uUyViyLmT1uZ0RukiNKbFf24u4l5N8BZJriZ8W
	Qr2Mt1/HpM6Gp430n7+fn+dmyxN8HJ5sp26PXQHqseyZZ8pI+lnuKsXuzQblmHSTMAq2
	cnjcbQhz2/5ZcaJPDcvHE6LGCJutrBvOKX7ILeGee+JBpB4XnuhoM0UAATnmxNYQb3hy
	LmCw==
X-Received: by 10.180.107.193 with SMTP id he1mr14386587wib.27.1416412151662; 
	Wed, 19 Nov 2014 07:49:11 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	t9sm2775724wjf.41.2014.11.19.07.49.10
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Nov 2014 07:49:10 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 19 Nov 2014 16:49:12 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20141119154912.GP3315@jama>
References: <1415353906-20924-1-git-send-email-qianl.fnst@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1415353906-20924-1-git-send-email-qianl.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH] umip: Add new recipes
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
X-List-Received-Date: Wed, 19 Nov 2014 15:49:22 -0000
X-Groupsio-MsgNum: 52942
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yEbVe0JFHWhrOjGA"
Content-Disposition: inline

--yEbVe0JFHWhrOjGA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 07, 2014 at 05:51:46PM +0800, Qian Lei wrote:
> UMIP is an open source implementation of Mobile IPv6 and NEMO Basic
> Support for Linux. It is released under the GPLv2 license. It supports
> the following IETF RFC: RFC6275 (Mobile IPv6), RFC3963 (NEMO), RFC3776
> and RFC4877 (IPsec and IKEv2).
>=20
> Signed-off-by: Qian Lei <qianl.fnst@cn.fujitsu.com>
> ---
>  meta-oe/recipes-connectivity/umip/umip_1.0.bb | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 meta-oe/recipes-connectivity/umip/umip_1.0.bb
>=20
> diff --git a/meta-oe/recipes-connectivity/umip/umip_1.0.bb b/meta-oe/reci=
pes-connectivity/umip/umip_1.0.bb
> new file mode 100644
> index 0000000..a7163b0
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/umip/umip_1.0.bb
> @@ -0,0 +1,20 @@
> +SUMMARY =3D "Mobile IPv6 and NEMO for Linux"
> +DESCRIPTION =3D "UMIP is an open source implementation of Mobile IPv6 an=
d NEMO \
> +Basic Support for Linux. It is released under the GPLv2 license. It supp=
orts \
> +the following IETF RFC: RFC6275 (Mobile IPv6), RFC3963 (NEMO), RFC3776 a=
nd \
> +RFC4877 (IPsec and IKEv2)."
> +
> +HOMEPAGE =3D "http://umip.org/"
> +SECTION =3D "System Environment/Base"
> +
> +SRC_URI =3D "git://git.umip.org/umip.git;tag=3Dv${PV}"

Use SRCREV otherwise bitbake fetcher will always run git ls-remote to
map the tag to SRCREV.

> +DEPENDS =3D "rpm"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D073dc31ccb2ebed70db54f1e8aeb4=
c33"
> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit autotools-brokensep
> +
> +EXTRA_OE_CONF =3D "--enable-vt"

Missing some deps:

| In file included from conf_reload.c:36:0:
| conf.h:9:18: fatal error: pmgr.h: No such file or directory
|  #include "pmgr.h"
|                   ^


> --=20
> 1.8.4.2
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--yEbVe0JFHWhrOjGA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlRsu/gACgkQN1Ujt2V2gBwaNQCgq7200b2M7bnWUtxbRZAB/8DP
M50AnRoI2p1rNP+5LYw1uRWpwZmWzHoc
=5cn3
-----END PGP SIGNATURE-----

--yEbVe0JFHWhrOjGA--
