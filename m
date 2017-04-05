Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id B001D60806
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Apr 2017 18:42:17 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id g19so5152329wrb.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Apr 2017 11:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=NStdOrdOT4Xw2mQfookejD1dieltktLcJ9PhOu+OCqE=;
	b=Ub+DkBhmg4HWRmvu0MQj7QTfZD7eW7WK/AuHJ5j+AeeX61FKLs1hSUCOmqz4lkCT6n
	jeCxzk5dNHwqIvDeKNnjiaM2rV0YQ6OU5jeA8bSytvY2VQxwF/hAahn4ETfj2MjrMM/U
	NmqOfLu7T3LGRs57T+WkO83jHMvKq8su5Gu2Cb2XnjH3iVgyFqSgEGIGXc1TH9IThAVL
	f1yDfGr370W8KUsgdmsUqyXKtA+gAuQBAwpU/DUYYWfKx6JRJp8pAc5GtA5yyfh4RwgN
	T8MM9S6t/zFPgM7CPkUBxR1JRmFl+6bmVRTShJv5F/gBplKNqywiKJJ5NKiErmkpUx/B
	w+uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=NStdOrdOT4Xw2mQfookejD1dieltktLcJ9PhOu+OCqE=;
	b=uklHarvboRTZu5nQ1a0z/1BQGdE5JBgsmlA58G+/WwWScLn7cFBskNKgmDK7Cmoz3k
	nyhy6b0GsaEltlYP9cxUxFSc+Zh5zQkKXYfTAswb+7NUw9f9PQsWBAVAttZ4n2rMEK6X
	zNvpBac+c1SARD78nE05OEYR4Ks4d7flJt5ZoQxj1rjwNEo9cy9rQUqcXFncNGnqlf5B
	VhM2SihjmArM9Q+ZhNTUOZnY5u/9AwGotA5KZAr5+93YSxk78Q7i3W424vnV/7/x2JqZ
	altM5JrTZbhZFkBzyAMGlPkPqMM8C0OoKw6mFzedJdtATSL23l0U2BJ+m8W0vAichi3D
	UrXw==
X-Gm-Message-State: AFeK/H0p8g8GzEra7Ds3X/QV7lheYSEpjQrtJibe/7g1pitTd+PknwVil6phFlRh68O3tg==
X-Received: by 10.223.176.242 with SMTP id j47mr9026906wra.81.1491417738537;
	Wed, 05 Apr 2017 11:42:18 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	k63sm23282302wmf.9.2017.04.05.11.42.17
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 05 Apr 2017 11:42:17 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 5 Apr 2017 20:42:18 +0200
To: openembedded-devel@lists.openembedded.org, joe_macdonald@mentor.com
Message-ID: <20170405184218.GD3301@jama>
References: <20170405133857.GA15126@graute-opti>
MIME-Version: 1.0
In-Reply-To: <20170405133857.GA15126@graute-opti>
User-Agent: Mutt/1.8.0 (2017-02-23)
Subject: Re: [meta-networking] [PATCH v2] nfacct: added nfacct recipe to meta-networking
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
X-List-Received-Date: Wed, 05 Apr 2017 18:42:17 -0000
X-Groupsio-MsgNum: 66122
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ylS2wUBXLOxYXZFQ"
Content-Disposition: inline

--ylS2wUBXLOxYXZFQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 05, 2017 at 03:38:57PM +0200, Oliver Graute wrote:
> this patch adds nfacct to meta-networking
>=20
> Signed-off-by: Oliver Graute <oliver.graute@neuhaus.de>
> ---
>  meta-networking/recipes-filter/nfacct/nfacct_1.0.2.bb | 17 +++++++++++++=
++++
>  1 file changed, 17 insertions(+)
>  create mode 100644 meta-networking/recipes-filter/nfacct/nfacct_1.0.2.bb
>=20
> diff --git a/meta-networking/recipes-filter/nfacct/nfacct_1.0.2.bb b/meta=
-networking/recipes-filter/nfacct/nfacct_1.0.2.bb
> new file mode 100644
> index 0000000..d92f7c0
> --- /dev/null
> +++ b/meta-networking/recipes-filter/nfacct/nfacct_1.0.2.bb
> @@ -0,0 +1,17 @@
> +SUMMARY =3D "nfacct is the command line tool to create/retrieve/delete a=
ccounting objects"
> +HOMEPAGE =3D "http://netfilter.org/projects/nfacct/"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D8ca43cbc842c2336e835926c2166c=
28b"
> +
> +SRC_URI =3D "ftp://ftp.netfilter.org/pub/nfacct/nfacct-1.0.2.tar.bz2"

nfacct -> ${BPN}
nfacct-1.0.2 -> ${BP}

> +
> +SRC_URI[md5sum] =3D "94faafdaaed85ca9220c5692be8a408e"
> +SRC_URI[sha256sum] =3D "ecff2218754be318bce3c3a5d1775bab93bf4168b2c4aac4=
65785de5655fbd69"
> +DEPENDS =3D "libnfnetlink libmnl libnetfilter-acct"
> +
> +EXTRA_OEMAKE +=3D 'HOSTCC=3D"${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS=
}"'
> +
> +S =3D "${WORKDIR}/nfacct-${PV}"

This is the default, drop.

> +
> +inherit autotools pkgconfig
> +
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ylS2wUBXLOxYXZFQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWOU6iQAKCRA3VSO3ZXaA
HEduAJ9vnJED58BNnthi15UiPxtrHUua8QCgspECQHpe3cRpvaIyVX/ivdQI5jo=
=rcNK
-----END PGP SIGNATURE-----

--ylS2wUBXLOxYXZFQ--
