Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id 9E6CB6AC1E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Aug 2015 12:41:57 +0000 (UTC)
Received: by wicne3 with SMTP id ne3so71024320wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Aug 2015 05:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=BOuK+A4iEKbFhpBMo0M63HbcYBoHDzdKSE+0tOSie2U=;
	b=Cy8rIhtVO7nug3tk40sr6SaOWl4eV4ybAcdlY7DTUM6/TzchYwsyoc5W+G8OLY0gTo
	RfTFMqd5rQ0B05j83D6EHu8wi+Uo9V6QKFFt7am5mEzh9tdSGsX5NzRNU51gxaoTBxc4
	iIg5k5MVJzS4Ha9+8XSmBhXQA6EfLcVzHCACElFMbxlEprh/quIF3X6Yqd8h0v/Fg3XP
	n1eC7ewy+1AYQkLinfwMpuTYSWnl+IjIu0MFjuulGMY6gKLi2vuzrriRnEDDf3JD27EP
	5tyxAAsoWlGmJZK0g8TT+2StDTBHc+BozzKOKp0tmOE7+4WwCsfaEI3jr8ycNPr6PVTh
	m8OQ==
X-Received: by 10.194.178.1 with SMTP id cu1mr40162753wjc.59.1440420117154;
	Mon, 24 Aug 2015 05:41:57 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	k4sm16024905wix.19.2015.08.24.05.41.55
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Aug 2015 05:41:56 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 24 Aug 2015 14:42:00 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150824124200.GC2446@jama>
References: <cover.1440407387.git.samuli.piippo@theqtcompany.com>
MIME-Version: 1.0
In-Reply-To: <cover.1440407387.git.samuli.piippo@theqtcompany.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-qt5][PATCH 00/11] upstreaming Qt for Device Creation changes
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
X-List-Received-Date: Mon, 24 Aug 2015 12:41:58 -0000
X-Groupsio-MsgNum: 56944
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2JFBq9zoW8cOFH7v"
Content-Disposition: inline

--2JFBq9zoW8cOFH7v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 24, 2015 at 12:13:19PM +0300, Samuli Piippo wrote:
> As part of Qt for Device Creation [1], we are starting to use meta-qt5 la=
yer
> when creating images for our supported devices. We have done number of ch=
anges
> to the layer when intergrating it with our internal layer. We would now l=
ike
> to upstream those changes.

I've just merged upgrade to 5.5 can you please rebase your changes and
re-submit?

Thanks

>=20
> [1] https://www.qt.io/qt-for-device-creation
>=20
> The following changes since commit d2c05c81e8230358dca80cf9df67e49f9f672a=
29:
>=20
>   libconnman-qt5: update to 1.0.91 (2015-07-31 16:23:35 +0200)
>=20
> are available in the git repository at:
>=20
>   git://github.com/sapiippo/meta-qt5 master
>   https://github.com/sapiippo/meta-qt5/tree/master
>=20
> Samuli Piippo (11):
>   qt5: make populate_sdk_qt5 reusable
>   qt5: improve Qt module package handling
>   qt5: improve support for native and nativesdk modules
>   qt5: add host paths to qt.conf
>   qt5: disable debian auto renaming
>   qt5: make qt5.inc reusable qt5-module.bbclass
>   qttools: use one recipe for all compilations
>   qtbase: remove dependency to sqlite
>   qtbase: PACKAGECONFIGs for libproxy and libinput
>   qtlocation: use correct dependencies
>   qtwebengine: fix problem with recursive qmake call
>=20
>  classes/populate_sdk_qt5.bbclass                   | 11 +---
>  classes/qmake5.bbclass                             |  8 +++
>  classes/qmake5_base.bbclass                        | 11 ++++
>  .../qt5/qt5.inc =3D> classes/qt5-module.bbclass      | 38 +++++++++++-
>  recipes-qt/examples/cinematicexperience_1.0.bb     |  2 +-
>  recipes-qt/examples/qt5everywheredemo_1.0.bb       |  2 +-
>  recipes-qt/examples/qt5nmapcarousedemo_1.0.bb      |  2 +-
>  recipes-qt/examples/qt5nmapper_1.0.bb              |  2 +-
>  recipes-qt/examples/qtsmarthome_1.0.bb             |  2 +-
>  recipes-qt/examples/quitbattery_1.0.0.bb           |  2 +-
>  recipes-qt/examples/quitindicators_1.0.1.bb        |  2 +-
>  recipes-qt/libconnman-qt/libconnman-qt5_git.bb     |  2 +-
>  recipes-qt/meta/meta-toolchain-qt5.bb              |  4 ++
>  recipes-qt/qt5/nativesdk-qttools_git.bb            | 45 --------------
>  recipes-qt/qt5/qt3d_git.bb                         |  2 +-
>  recipes-qt/qt5/qtbase_git.bb                       |  6 +-
>  recipes-qt/qt5/qtconnectivity_git.bb               |  2 +-
>  recipes-qt/qt5/qtdeclarative_git.bb                |  4 +-
>  recipes-qt/qt5/qtenginio_git.bb                    |  2 +-
>  recipes-qt/qt5/qtgraphicaleffects_git.bb           |  2 +-
>  recipes-qt/qt5/qtimageformats_git.bb               |  2 +-
>  recipes-qt/qt5/qtlocation_git.bb                   |  5 +-
>  recipes-qt/qt5/qtmultimedia_git.bb                 |  2 +-
>  recipes-qt/qt5/qtquick1_git.bb                     |  2 +-
>  recipes-qt/qt5/qtquickcontrols_git.bb              |  2 +-
>  recipes-qt/qt5/qtscript_git.bb                     |  2 +-
>  recipes-qt/qt5/qtsensors_git.bb                    |  2 +-
>  recipes-qt/qt5/qtserialport_git.bb                 |  2 +-
>  recipes-qt/qt5/qtsvg_git.bb                        |  2 +-
>  recipes-qt/qt5/qtsystems_git.bb                    |  2 +-
>  recipes-qt/qt5/qttools-native_git.bb               | 26 --------
>  recipes-qt/qt5/qttools_git.bb                      | 11 +++-
>  recipes-qt/qt5/qttranslations_git.bb               |  2 +-
>  recipes-qt/qt5/qtwayland_git.bb                    |  2 +-
>  recipes-qt/qt5/qtwebchannel_git.bb                 |  2 +-
>  .../0005-Generate-usable-qmake_extras.gypi.patch   | 71 ++++++++++++++++=
++++++
>  recipes-qt/qt5/qtwebengine_git.bb                  |  3 +-
>  recipes-qt/qt5/qtwebkit-examples_git.bb            |  2 +-
>  recipes-qt/qt5/qtwebkit_git.bb                     |  2 +-
>  recipes-qt/qt5/qtwebsockets_git.bb                 |  2 +-
>  recipes-qt/qt5/qtx11extras_git.bb                  |  2 +-
>  recipes-qt/qt5/qtxmlpatterns_git.bb                |  4 +-
>  42 files changed, 183 insertions(+), 120 deletions(-)
>  rename recipes-qt/qt5/qt5.inc =3D> classes/qt5-module.bbclass (86%)
>  delete mode 100644 recipes-qt/qt5/nativesdk-qttools_git.bb
>  delete mode 100644 recipes-qt/qt5/qttools-native_git.bb
>  create mode 100644 recipes-qt/qt5/qtwebengine/0005-Generate-usable-qmake=
_extras.gypi.patch
>=20
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

--2JFBq9zoW8cOFH7v
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlXbERcACgkQN1Ujt2V2gBzs9gCcCjYpiv9sotFADCdjRtMp5mkB
LvEAnR8TptBgBfF1tgy3v/yoRtN7HuBN
=+bEz
-----END PGP SIGNATURE-----

--2JFBq9zoW8cOFH7v--
