Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f169.google.com (mail-we0-f169.google.com
	[74.125.82.169])
	by mail.openembedded.org (Postfix) with ESMTP id 199C270660
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Jul 2014 09:19:57 +0000 (UTC)
Received: by mail-we0-f169.google.com with SMTP id u56so865438wes.14
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Jul 2014 02:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Z0OjhIzWSGEkeo6tMWAkqBR5yVmcXdrj9ydJCJMLv7E=;
	b=C91U0QhEBTzNdpq10t85ZGu6dm7K14tVyi5vqMta/5xykN6e95RNP2957ZdiP1Npew
	5B4fgVR7NHMdZg5hHF8lAmRYAtYUzuFp5r+juM7jmWBEU1Upf7ms+i1xcDPAVczp6I6w
	0qer5LdlwM/9cUncpyzKtrg39WnwAiWHrWXfOKKIV+dg72Uv8HnTsgUTJdtTAJJpvCTA
	jL1CVM4FmI7EUoIpsro4w/zhMkAYbm6F6e5xJ4G93QeiNTiYmSVJhnbBNnrQZUpT9pjS
	rxqFSq84ThictxB4AFzxkFC01uX1pek0gG+NRW4DoQ8DWgSXKgPtT4egkY+zkSmvOIFp
	I2Pg==
X-Received: by 10.194.249.98 with SMTP id yt2mr43248215wjc.66.1406107195971;
	Wed, 23 Jul 2014 02:19:55 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	l2sm4534721wjw.31.2014.07.23.02.19.54
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Jul 2014 02:19:55 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 23 Jul 2014 11:20:11 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140723092011.GB22875@jama>
References: <1406105533-78428-1-git-send-email-coldnew.tw@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1406105533-78428-1-git-send-email-coldnew.tw@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-qt5][PATCH] cinematicexperience: fix qt5.3 compatibility
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
X-List-Received-Date: Wed, 23 Jul 2014 09:20:01 -0000
X-Groupsio-MsgNum: 51200
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Y18yPE/eBgOv3N1p"
Content-Disposition: inline

--Y18yPE/eBgOv3N1p
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 23, 2014 at 04:52:13PM +0800, coldnew wrote:
> cinematicexperience will run failed on Qt5.3 and Qt5.3.1, error message
> as below
>=20
> ------------------------------------------------------------
> Qt5_CinematicExperience.qml:26:5: Type MainView unavailable
>          MainView {
>          ^
> /content/MainView.qml:241:9: Type SettingsView unavailable
>              SettingsView {
>              ^
> /content/SettingsView.qml:88:13: Type Switch unavailable
>                  Switch {
>                  ^
> /content/Switch.qml:9:21: Cannot assign a value to a signal (expecting a =
script to be run)
>          property string onText: "On"
>=20
>                          ^
>=20
> ------------------------------------------------------------
>=20
> This patch fix this issue and make cinematicexperience can run on qt5.3.
>=20
> ref: http://wickwire2099.blogspot.tw/2014/05/qt-530-qt5-cinematic-experie=
nce.html
>=20
> Signed-off-by: coldnew <coldnew.tw@gmail.com>

Can you please use full name?

> ---
>  .../fix_qt5_3_compatibility.patch                  | 48 ++++++++++++++++=
++++++
>  recipes-qt/examples/cinematicexperience_1.0.bb     |  1 +
>  2 files changed, 49 insertions(+)
>  create mode 100644 recipes-qt/examples/cinematicexperience/fix_qt5_3_com=
patibility.patch
>=20
> diff --git a/recipes-qt/examples/cinematicexperience/fix_qt5_3_compatibil=
ity.patch b/recipes-qt/examples/cinematicexperience/fix_qt5_3_compatibility=
=2Epatch
> new file mode 100644
> index 0000000..fc132ec
> --- /dev/null
> +++ b/recipes-qt/examples/cinematicexperience/fix_qt5_3_compatibility.pat=
ch
> @@ -0,0 +1,48 @@
> +Index: Qt5_CinematicExperience_rpi_1.0/content/SettingsView.qml
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- Qt5_CinematicExperience_rpi_1.0.orig/content/SettingsView.qml
> ++++ Qt5_CinematicExperience_rpi_1.0/content/SettingsView.qml
> +@@ -127,8 +127,8 @@ Item {
> +             Switch {
> +                 text: "Do you l-o-v-e colors?"
> +                 checked: settings.showColors
> +-                onText: "Yes"
> +-                offText: "No!"
> ++                textON: "Yes"
> ++                textOFF: "No!"
> +                 onCheckedChanged: {
> +                     settings.showColors =3D checked;
> +                 }
> +Index: Qt5_CinematicExperience_rpi_1.0/content/Switch.qml
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- Qt5_CinematicExperience_rpi_1.0.orig/content/Switch.qml
> ++++ Qt5_CinematicExperience_rpi_1.0/content/Switch.qml
> +@@ -6,8 +6,8 @@ Item {
> +=20
> +     property alias text: textItem.text
> +     property bool checked: false
> +-    property string onText: "On"
> +-    property string offText: "Off"
> ++    property string textON: "On"
> ++    property string textOFF: "Off"
> +=20
> +     QtObject {
> +         id: priv
> +@@ -120,7 +120,7 @@ Item {
> +             color: "#000000"
> +             font.pixelSize: 18
> +             font.bold: true
> +-            text: onText
> ++            text: textON
> +         }
> +         Text {
> +             anchors.verticalCenter: parent.verticalCenter
> +@@ -129,7 +129,7 @@ Item {
> +             color: "#ffffff"
> +             font.pixelSize: 18
> +             font.bold: true
> +-            text: offText
> ++            text: textOFF
> +         }
> +=20
> +         Image {
> diff --git a/recipes-qt/examples/cinematicexperience_1.0.bb b/recipes-qt/=
examples/cinematicexperience_1.0.bb
> index 9ee5532..116127f 100644
> --- a/recipes-qt/examples/cinematicexperience_1.0.bb
> +++ b/recipes-qt/examples/cinematicexperience_1.0.bb
> @@ -5,6 +5,7 @@ LICENSE =3D "CC-BY-3.0"
>  LIC_FILES_CHKSUM =3D "file://README;beginline=3D38;endline=3D50;md5=3D51=
babd597624b70752069953876aaa18"
> =20
>  SRC_URI =3D "http://quitcoding.com/download/Qt5_CinematicExperience_rpi_=
1.0.tgz"
> +SRC_URI +=3D "file://fix_qt5_3_compatibility.patch"
> =20
>  SRC_URI[md5sum] =3D "935a5db0a6b2a72c67236e72f52be7d1"
>  SRC_URI[sha256sum] =3D "0dd602983ced5f7c0cfd5ad0fbfe2b0b7e3c9ff715e4ef23=
eef818ccc2b6c60b"
> --=20
> 1.9.2
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Y18yPE/eBgOv3N1p
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPPfksACgkQN1Ujt2V2gBzhBgCeO+HsybWU0nVFFmksdmoxovua
fR4AnRtdEtbSioCgYbCTEXzegorHsz1I
=7wn3
-----END PGP SIGNATURE-----

--Y18yPE/eBgOv3N1p--
