Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 62C4371D9A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Feb 2017 17:37:09 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id c85so20688213wmi.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Feb 2017 09:37:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=BYT2EB5T+2fBBrJTRKVvdnx5zDRS3Hg0pKXlInqiR38=;
	b=WZms0Gvxoiz8oKtd28VDdbxStDzeKRPaaKBMmMZDrfK6gWKiOtlWjkxmdBlMgdl/Zb
	I+opB0ucqMNBMf0diIFVRNHSrf6uCDmKrCv5Osh3UQ+LafeZM57uNTlFyYAkdSxUrXTF
	3mbODkYLgrMvvthWw+Zzhiz2SpXkPGkSdAsszhJFXEc8XSCD1qc5SrbB2u1vxoqLmJrw
	pASsoFpZJeAOl47ut6o7WpdoTIDthKMLp+QF3jqDyqaOscjhoI+mOm/dyc2da+C6YUiW
	oTofkHieWSQn02vFakl3WKm6dcNxL5NfDF7zhrPEMVsAYM2TKswSrgHBjzzhiSNT1cuT
	uEzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=BYT2EB5T+2fBBrJTRKVvdnx5zDRS3Hg0pKXlInqiR38=;
	b=Ox6gxsz6lmj5x0cZ5oqQdpSpkfQtXaQm/FmNqhUf/5Xme+ykZCDthqi855O5aB7tsL
	I4oXwEzVjfjpnveCoX46VqC3z+rVynvSfEIor0cKi7WRsIiUfX0g4kx4GKZgIHhJDzJM
	sP9YhLyfzw90omY4rBaSJM0HAXYQ1Nfwyn2Hflvef+c32aJqiIoaRrcCT9dpxmLHhuD3
	xFVwpK+EuxNW+U4QtrhBdl26aDTcQ65rPiBcPUnTRkcP9dsTj814lS4XmdBehQ6XrwOY
	LFZo64xXKXPMvFjBvBzmu4KdsJ/aLYGhcfthBTKNoFowGXsrgjHDPWt+ox4N3gnKRoLD
	pTKA==
X-Gm-Message-State: AMke39lAigZW7Q+lSDK3AF6ZbohgIfsrV8SwXOmvefHzNopXWFyyKHSkBkNefTQXxLOcjw==
X-Received: by 10.28.6.210 with SMTP id 201mr41937082wmg.85.1487007430196;
	Mon, 13 Feb 2017 09:37:10 -0800 (PST)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id q12sm176373wmd.8.2017.02.13.09.37.09
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 13 Feb 2017 09:37:09 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 13 Feb 2017 18:37:10 +0100
To: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <20170213173710.GA856@jama>
References: <cover.1486980186.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <cover.1486980186.git.liezhi.yang@windriver.com>
User-Agent: Mutt/1.7.2 (2016-11-26)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 00/13] fix for dependencies issues
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
X-List-Received-Date: Mon, 13 Feb 2017 17:37:11 -0000
X-Groupsio-MsgNum: 65167
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tKW2IUtsqtDRztdT"
Content-Disposition: inline

--tKW2IUtsqtDRztdT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 13, 2017 at 02:04:14AM -0800, Robert Yang wrote:
> The following changes since commit 5ecbf9bab404af0de7d0f058d1620f40dae0d2=
d8:
>=20
>   poppler: update to 0.51.0 (2017-01-25 16:00:02 +0100)
>=20
> are available in the git repository at:
>=20
>   git://git.openembedded.org/meta-openembedded-contrib rbt/deps
>   http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=3Drbt/deps

Please rebase your changes on top of current master-next, because some of
them duplicated older changes already on ML (and in master-next) and
send the remaining ones (if there are any still needed).

> Robert Yang (13):
>   dibbler: fix SRC_URI from ${P} to ${BP}
>   postgresql: add gettext-native and tcl-native to DEPENDS
>   udisks: add dbus-glib-native to DEPENDS
>   udisks2: add libxslt-native to DEPENDS
>   xfdesktop: add dbus-glib-native to DEPENDS
>   xfce4-notifyd: add dbus-glib-native to DEPENDS
>   python-pbr: add python-setuptools-native to DEPENDS
>   sthttpd: add base-passwd to DEPENDS
>   nostromo: add base-passwd to DEPENDS
>   openflow: inherit pkgconfig
>   openconnect: add gettext-native to DEPENDS
>   gnome-disk-utility: add dbus-glib-native to DEPENDS
>   libnet-ssleay-perl: fix EXTRALIBS and LDLOADLIBS
>=20
>  .../recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb    | 5=
 ++++-
>  meta-networking/recipes-connectivity/dibbler/dibbler_1.0.1.bb        | 2=
 +-
>  meta-networking/recipes-connectivity/openconnect/openconnect_git.bb  | 2=
 +-
>  meta-networking/recipes-protocols/openflow/openflow.inc              | 2=
 +-
>  meta-oe/recipes-support/postgresql/postgresql.inc                    | 5=
 ++---
>  meta-oe/recipes-support/udisks/udisks2_2.1.7.bb                      | 4=
 +++-
>  meta-oe/recipes-support/udisks/udisks_1.0.5.bb                       | 4=
 +++-
>  meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.65.bb             | 4=
 ++--
>  meta-python/recipes-devtools/python/python-pbr_1.10.0.bb             | 1=
 +
>  meta-webserver/recipes-httpd/nostromo/nostromo_1.9.6.bb              | 2=
 +-
>  meta-webserver/recipes-httpd/sthttpd/sthttpd_2.27.0.bb               | 2=
 ++
>  meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.3.4.bb          | 4=
 +++-
>  meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.12.3.bb                 | 4=
 +++-
>  13 files changed, 27 insertions(+), 14 deletions(-)
>=20
> --=20
> 2.9.0
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--tKW2IUtsqtDRztdT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWKHuxQAKCRA3VSO3ZXaA
HAayAJ9JzxSF+Q0nAJKCTf7zBB3C3ygbOQCgnwLjueh3YrnXhIuV0ciayUPnB3Q=
=Qhz4
-----END PGP SIGNATURE-----

--tKW2IUtsqtDRztdT--
