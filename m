Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 0B8E57759A
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  4 Mar 2017 11:50:17 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id n11so6725649wma.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 04 Mar 2017 03:50:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=gwNfVYoGLCT59vdKDznZ6HtV/Mb14yXQLrwIyjwiQyM=;
	b=KDlVaRYHSQQg6J9/XDfUa52vo5XaRLOgvxhJ+9nPLyTD6z5LFxXQZxZg0cntK/Juqr
	AuFb5W1xBARNuHcMT8objGYUUz5JDOvie8MkMmmcYnUMuJwoj/yKOjI9RCVgcb5is0Sl
	+I0WZgGFr7q3mUFrFqJlkFurZfBNMujqWPMRPxecCmO+lOfU7WjFwcbWlTwXPeM7sBXv
	FZyyASaN0Sioy9o+bQDKYZzRG/aSpFwRWrJUxnoxdB4t+4n5gmdspADZtT7Z2quw2B1U
	NSZaJpqt1pwCdv4bFLTL4nSXj0sAXHj1gbdG3ZzIQQfruDGa5pIH93sSa5YpeiJZCNSI
	1LIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=gwNfVYoGLCT59vdKDznZ6HtV/Mb14yXQLrwIyjwiQyM=;
	b=nG7et58ksTI3rCYfwEENlicL2wyQwpV2Oy/EMnFU/Kce02bow6gGDVt8JP1ANuwBh/
	OtSY1V8+Xoc1mmU4ttSRaVAT5kVfOTyoQoyX52lpoTqepv/9YNjTa93L2gnTLP82H1/b
	c9YO/AonRGxzjo6yWr+BlKv4BDPKlvR3MC2vhmdCoW1WdE43obWnfqES3o5iQayk5+Dw
	PbJ+Q/CiA9KGgisAzmCbpbMBt9nC0/h8D5zvY5h+qdFvLdsBS41D0kF7O3QjbIiQJSQK
	HLje9EXqng0wca0cjV32UphG/k9MLBrPRoa2YXrZDBvQjQgKahv/1rLMY7Xx2LWlX64K
	oK7Q==
X-Gm-Message-State: AMke39lSOVjhEZfvMfUlvWeKNpWp8ZaxX/QY5Zw8ikM0O1LPo/2AE7aPWv4VWpTLEz/XtA==
X-Received: by 10.28.236.209 with SMTP id h78mr7043050wmi.97.1488628218654;
	Sat, 04 Mar 2017 03:50:18 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	h3sm18963297wrb.31.2017.03.04.03.50.17
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 04 Mar 2017 03:50:17 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sat, 4 Mar 2017 12:50:20 +0100
To: Joe Slater <jslater@windriver.com>
Message-ID: <20170304115020.GB3025@jama>
References: <1488579737-32653-1-git-send-email-jslater@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1488579737-32653-1-git-send-email-jslater@windriver.com>
User-Agent: Mutt/1.8.0 (2017-02-23)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe-core][PATCH 1/1] e2fsprogs: expand @mkdir_p@ during configuration
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
X-List-Received-Date: Sat, 04 Mar 2017 11:50:18 -0000
X-Groupsio-MsgNum: 65673
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tsOsTdHNUZQcU9Ye"
Content-Disposition: inline

--tsOsTdHNUZQcU9Ye
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 03, 2017 at 02:22:17PM -0800, Joe Slater wrote:
> If we do not do this, locale data will not be put
> into /usr/share/locale.

Wrong ML.

>=20
> Signed-off-by: Joe Slater <jslater@windriver.com>
> ---
>  .../e2fsprogs/e2fsprogs/mkdir_p.patch              |   20 ++++++++++++++=
++++++
>  .../recipes-devtools/e2fsprogs/e2fsprogs_1.43.4.bb |    1 +
>  2 files changed, 21 insertions(+)
>  create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/mkdir_p.pat=
ch
>=20
> diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/mkdir_p.patch b/me=
ta/recipes-devtools/e2fsprogs/e2fsprogs/mkdir_p.patch
> new file mode 100644
> index 0000000..b0fa4b8
> --- /dev/null
> +++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/mkdir_p.patch
> @@ -0,0 +1,20 @@
> +e2fsprogs: expand @mkdir_p@
> +
> +Add AC_SUBST to configure.ac.  @mkdir_p@ is currently
> +not expanded so no locale data is written into usr/share/locale.=20
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Joe Slater <jslater@windriver.com>
> +
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -811,6 +811,8 @@ AC_SUBST(PACKAGE)
> + AC_SUBST(VERSION)
> +=20
> + AM_GNU_GETTEXT
> ++dnl @MKDIR_P@ is expanded in AM_GNU_GETTEXT
> ++AC_SUBST([mkdir_p],['$(MKDIR_P)'])
> + dnl
> + dnl End of configuration options
> + dnl
> diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.4.bb b/meta/r=
ecipes-devtools/e2fsprogs/e2fsprogs_1.43.4.bb
> index 95ebc3a..153b3a1 100644
> --- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.4.bb
> +++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.4.bb
> @@ -8,6 +8,7 @@ SRC_URI +=3D "file://acinclude.m4 \
>              file://mkdir.patch \
>              file://Revert-mke2fs-enable-the-metadata_csum-and-64bit-fea.=
patch \
>              file://e2fsprogs-1.43-sysmacros.patch \
> +            file://mkdir_p.patch \
>  "
> =20
>  SRC_URI_append_class-native =3D " file://e2fsprogs-fix-missing-check-for=
-permission-denied.patch"
> --=20
> 1.7.9.5
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--tsOsTdHNUZQcU9Ye
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWLqp+wAKCRA3VSO3ZXaA
HCN7AKCxc7cPzjOEKt3pI9v6Jx/vSkviuQCgi6Y02B59u9tenWCGU2NZNONa2DA=
=4kNQ
-----END PGP SIGNATURE-----

--tsOsTdHNUZQcU9Ye--
