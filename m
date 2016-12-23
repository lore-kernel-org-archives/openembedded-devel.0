Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id CCDFF773EC
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Dec 2016 10:15:57 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id c85so2557838wmi.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Dec 2016 02:15:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=DrPrBjGdRk+fI+nAqDV8AHYovv6yi8PD4jEsUtS6N8M=;
	b=Fiun6bi/o8aehyi0IENegWuNBNW3I6kvqn54+ADJZ4TFS4V1Oy37ZRhVpJjRw0d3we
	ITWEC6YqNi6G8+sOLNCGoo4oH0T6rHcB8tWLIR1HgWJKkUOSgkEY9zZUKZpUcmWNmsTZ
	npD6JsiFyOetKsBgR9zk90ZBaDGWSaejoLOjO+F9LfqdM/RdpTqBB7qIUHeYJN5+kBpV
	PEHT23ghcXc0EczrwwywrYjofwjvmkaJB4k9c66BjLG0Z9canlrE+QNdmYw+2ctpg8Wz
	6X7H22gvT/BOcaHpFCN2UEOKUYZoCmlpdQYCy85WFDaL8T3VrmfCPhbB1d+BIXyI/ddu
	aw7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=DrPrBjGdRk+fI+nAqDV8AHYovv6yi8PD4jEsUtS6N8M=;
	b=kUzV+0m5MqLkJckSQGE6mwOtzj7VDe4xQH1yx+9XIQ6T3mY7519qT6ugn6fqH8rFZf
	nDDSdznbSLFazNB/iQ8r87S+97uSN8+LBCHbZxT2QMac2Y2ynlJiybfu+cUgl9GINBB8
	+LJWYeujPvCMLLv/WwzgP6wKOHlcI+hjGCVLKwgzNrMCk9NYE/NvqvvfHF4ZmZhSsMck
	Ocfx4yhFVY8J60x/kIQdTjC0efYCsIGJxThDP+2iV1bSSyi8uiKitsD81e6q02bdLmwE
	EcaTkNZWfIc93NDoG6oy+p0jgtuprW8mMydxAv3jCpj3P9Es1D3xjPN3D7J5FtDtt8TA
	QvVg==
X-Gm-Message-State: AIkVDXJfPY+36dDPEdc8n7fkhc9h5mTq4DCYYJV8Xn8EEaGHquXnOmYSEQFY27nNj43W2g==
X-Received: by 10.28.72.3 with SMTP id v3mr16522569wma.20.1482488158590;
	Fri, 23 Dec 2016 02:15:58 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	c187sm36320584wmd.13.2016.12.23.02.15.57
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 23 Dec 2016 02:15:57 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 23 Dec 2016 11:15:58 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20161223101558.GA3294@jama>
References: <1482468166-33076-1-git-send-email-leimaohui@cn.fujitsu.com>
	<1B56A49860EB2D45ADE3731B15C959FDFE5B81EC@G08CNEXMBPEKD01.g08.fujitsu.local>
MIME-Version: 1.0
In-Reply-To: <1B56A49860EB2D45ADE3731B15C959FDFE5B81EC@G08CNEXMBPEKD01.g08.fujitsu.local>
User-Agent: Mutt/1.7.2 (2016-11-26)
Subject: Re: [oe-jethro] [meta-xfce][PATCH] imsettings: move to correct directory
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
X-List-Received-Date: Fri, 23 Dec 2016 10:15:58 -0000
X-Groupsio-MsgNum: 64509
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="C7zPtVaVf+AK4Oqc"
Content-Disposition: inline

--C7zPtVaVf+AK4Oqc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 23, 2016 at 04:57:58AM +0000, Lei, Maohui wrote:
> Hi armin
>=20
> Please merge this patch to jethro.

It's needed in krogoth as well, isn't it?

>=20
> Best regards.
> Lei
>=20
> > -----Original Message-----
> > From: Lei, Maohui
> > Sent: Friday, December 23, 2016 12:43 PM
> > To: openembedded-devel@lists.openembedded.org
> > Cc: Lei, Maohui
> > Subject: [oe-jethro] [meta-xfce][PATCH] imsettings: move to correct dir=
ectory
> >=20
> > Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
> > ---
> >  .../imsettings/{ =3D> imsettings}/gtk-is-required-by-notify.patch     =
      | 0
> >  .../multi-line-ACLOCAL_AMFLAGS-isnot-supported-by-autoreconf.patch    =
    | 0
> >  meta-xfce/recipes-extended/{ =3D> imsettings}/imsettings_1.6.8.bb     =
      | 0
> >  3 files changed, 0 insertions(+), 0 deletions(-)  rename meta-xfce/rec=
ipes-
> > extended/imsettings/{ =3D> imsettings}/gtk-is-required-by-notify.patch =
(100%)
> > rename meta-xfce/recipes-extended/imsettings/{ =3D> imsettings}/multi-l=
ine-
> > ACLOCAL_AMFLAGS-isnot-supported-by-autoreconf.patch (100%)  rename meta-
> > xfce/recipes-extended/{ =3D> imsettings}/imsettings_1.6.8.bb (100%)
> >=20
> > diff --git a/meta-xfce/recipes-extended/imsettings/gtk-is-required-by-
> > notify.patch b/meta-xfce/recipes-extended/imsettings/imsettings/gtk-is-
> > required-by-notify.patch
> > similarity index 100%
> > rename from meta-xfce/recipes-extended/imsettings/gtk-is-required-by-
> > notify.patch
> > rename to meta-xfce/recipes-extended/imsettings/imsettings/gtk-is-requi=
red-by-
> > notify.patch
> > diff --git a/meta-xfce/recipes-extended/imsettings/multi-line-ACLOCAL_A=
MFLAGS-
> > isnot-supported-by-autoreconf.patch b/meta-xfce/recipes-
> > extended/imsettings/imsettings/multi-line-ACLOCAL_AMFLAGS-isnot-support=
ed-by-
> > autoreconf.patch
> > similarity index 100%
> > rename from meta-xfce/recipes-extended/imsettings/multi-line-ACLOCAL_AM=
FLAGS-
> > isnot-supported-by-autoreconf.patch
> > rename to meta-xfce/recipes-extended/imsettings/imsettings/multi-line-
> > ACLOCAL_AMFLAGS-isnot-supported-by-autoreconf.patch
> > diff --git a/meta-xfce/recipes-extended/imsettings_1.6.8.bb b/meta-
> > xfce/recipes-extended/imsettings/imsettings_1.6.8.bb
> > similarity index 100%
> > rename from meta-xfce/recipes-extended/imsettings_1.6.8.bb
> > rename to meta-xfce/recipes-extended/imsettings/imsettings_1.6.8.bb
> > --
> > 1.8.4.2
>=20
>=20
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--C7zPtVaVf+AK4Oqc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWFz5XQAKCRA3VSO3ZXaA
HP/FAKCkIS2Sdxy9SAKL7NDs/4Ll2bIPbwCfaKQzkuA+qVRmNRnriBU7bnIp8DE=
=K+to
-----END PGP SIGNATURE-----

--C7zPtVaVf+AK4Oqc--
