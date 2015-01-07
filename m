Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f53.google.com (mail-wg0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 673F27213F
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Jan 2015 09:10:14 +0000 (UTC)
Received: by mail-wg0-f53.google.com with SMTP id x13so760843wgg.26
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Jan 2015 01:10:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=JoRBdcZG4mYusddutaumN0wYtSICqIqrBw17Meypcu4=;
	b=OhVF+tt9V9rGg0u9yayrr8BCKyLrkXiTToNKYnsrUiaS9Xg3gHj0OGKog4HwemJGaD
	SyGwxp2WjCWmshqsGYEaxL/w+S9EC/uJTVRG1ssBwdvjRWpdaxGOHxYqYQxvN2qpC0DY
	F9KtKqt0H+lnFonErefs8D+w6giEZ8C3/5gF/Mjyo8QiQ7bD/mFw2ErimhN5VI79+/FK
	9CGGNe8u9soKJjlEQzQaCgA4SFHl9izvGNP3lNcvpPQRGoNP+3lsZ6AdjpgziTXlW0wh
	hbVI+RCyzmV14g1X42mAftcI5W9hn7Zs8c4F/meJGi9ogGq2OjRDcArSTQ3jeZdGqdfi
	/xlQ==
X-Received: by 10.180.91.36 with SMTP id cb4mr45180939wib.30.1420621814782;
	Wed, 07 Jan 2015 01:10:14 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	n3sm17070485wiw.5.2015.01.07.01.10.13
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 07 Jan 2015 01:10:13 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 7 Jan 2015 10:10:16 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150107091016.GE29986@jama>
References: <1420517556-49274-1-git-send-email-leimaohui@cn.fujitsu.com>
	<1420517556-49274-4-git-send-email-leimaohui@cn.fujitsu.com>
	<20150106143529.GF19402@jama>
	<1B56A49860EB2D45ADE3731B15C959FDAE4143@G08CNEXMBPEKD01.g08.fujitsu.local>
MIME-Version: 1.0
In-Reply-To: <1B56A49860EB2D45ADE3731B15C959FDAE4143@G08CNEXMBPEKD01.g08.fujitsu.local>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][V2 PATCH 3/3] dlm: add a new recipe
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
X-List-Received-Date: Wed, 07 Jan 2015 09:10:20 -0000
X-Groupsio-MsgNum: 53717
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="19uQFt6ulqmgNgg1"
Content-Disposition: inline

--19uQFt6ulqmgNgg1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 07, 2015 at 06:02:48AM +0000, Lei, Maohui wrote:
> Hi Martin
>=20
> > > +DEPENDS =3D "corosync systemd"
> >=20
> > Does it need explicit systemd dependency?
> > https://git.fedorahosted.org/cgit/dlm.git/tree/dlm_controld/Makefile
> > looks like yes with default USE_SD_NOTIFY
>=20
> Yes.
>=20
> >=20
> > If yes, then it should be together with
> > REQUIRED_DISTRO_FEATURES =3D "systemd"
> > to prevent world error when systemd isn't in DISTRO_FEATURES
> > ERROR: Nothing PROVIDES 'systemd' (but
> > meta-oe/meta-oe/recipes-extended/dlm/dlm_4.0.2.bb DEPENDS on or otherwi=
se
> > requires it)
> > ERROR: systemd was skipped: 'systemd' not in DISTRO_FEATURES
>=20
> But I think add REQUIRED_DISTRO_FEATURES can't prevent the world error.
> Even if I add the REQUIRED_DISTRO_FEATURES =3D "systemd",the error still =
appears.
> Unless add "system" into DISTRO_FEATURES.

It doesn't, because dlm will be skipped just like other recipes incompatibl=
e with distro-less configuration.

> The following comes from http://www.yoctoproject.org/docs/1.7/ref-manual/=
ref-manual.html .
> ********************************************************
> REQUIRED_DISTRO_FEATURES
> When inheriting the distro_features_check class, this variable identifies=
 distribution features that must exist in the current configuration in orde=
r for the OpenEmbedded build system to build the recipe. In other words, if=
 the REQUIRED_DISTRO_FEATURES variable lists a feature that does not appear=
 in DISTRO_FEATURES within the current configuration, an error occurs and t=
he build stops.
> ********************************************************
>=20
>=20
> Cheers
> Lei
>=20
>=20
> > -----Original Message-----
> > From: openembedded-devel-bounces@lists.openembedded.org
> > [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> > Martin Jansa
> > Sent: Tuesday, January 06, 2015 10:35 PM
> > To: openembedded-devel@lists.openembedded.org
> > Subject: Re: [oe] [meta-oe][V2 PATCH 3/3] dlm: add a new recipe
> >=20
> > On Tue, Jan 06, 2015 at 12:12:36PM +0800, leimaohui wrote:
> > > From: leimh <leimaohui@cn.fujitsu.com>
> > >
> > > The kernel dlm requires a user daemon to control membership.
> > >
> > > Signed-off-by: leimh <leimaohui@cn.fujitsu.com>
> > > ---
> > >  meta-oe/recipes-extended/dlm/dlm_4.0.2.bb | 47
> > > +++++++++++++++++++++++++++++++
> > >  1 file changed, 47 insertions(+)
> > >  create mode 100644 meta-oe/recipes-extended/dlm/dlm_4.0.2.bb
> > >
> > > diff --git a/meta-oe/recipes-extended/dlm/dlm_4.0.2.bb
> > > b/meta-oe/recipes-extended/dlm/dlm_4.0.2.bb
> > > new file mode 100644
> > > index 0000000..774f136
> > > --- /dev/null
> > > +++ b/meta-oe/recipes-extended/dlm/dlm_4.0.2.bb
> > > @@ -0,0 +1,47 @@
> > > +DESCRIPTION =3D "dlm control daemon and tool"
> > > +
> > > +SECTION =3D "utils"
> > > +HOMEPAGE =3D "https://fedorahosted.org/cluster/wiki/HomePage"
> > > +
> > > +SRC_URI =3D
> > "https://git.fedorahosted.org/cgit/dlm.git/snapshot/${BP}.tar.xz"
> > > +
> > > +SRC_URI[md5sum] =3D "efc2ee6093aa6aa0a88aaad83e998a3f"
> > > +SRC_URI[sha256sum] =3D
> > "b89bc557aaffbab0ac005398025f247718a5589cff6574d902eaffe2b20e683e"
> > > +
> > > +LICENSE =3D "LGPLv2+ & GPLv2 & GPLv2+"
> > > +LIC_FILES_CHKSUM =3D
> > "file://README.license;md5=3D8f0bbcdd678df1bce9863492b6c8832d"
> > > +
> > > +DEPENDS =3D "corosync systemd"
> >=20
> > Does it need explicit systemd dependency?
> > https://git.fedorahosted.org/cgit/dlm.git/tree/dlm_controld/Makefile
> > looks like yes with default USE_SD_NOTIFY
> >=20
> > If yes, then it should be together with
> > REQUIRED_DISTRO_FEATURES =3D "systemd"
> > to prevent world error when systemd isn't in DISTRO_FEATURES
> > ERROR: Nothing PROVIDES 'systemd' (but
> > meta-oe/meta-oe/recipes-extended/dlm/dlm_4.0.2.bb DEPENDS on or otherwi=
se
> > requires it)
> > ERROR: systemd was skipped: 'systemd' not in DISTRO_FEATURES
> >=20
> > > +
> > > +inherit pkgconfig systemd
> > > +
> > > +SYSTEMD_SERVICE_${PN} =3D "dlm.service"
> > > +SYSTEMD_AUTO_ENABLE =3D "enable"
> > > +
> > > +export EXTRA_OEMAKE =3D ""
> > > +
> > > +do_compile_prepend() {
> > > +    sed -i "s/libsystemd-daemon/libsystemd/g"
> > > +${S}/dlm_controld/Makefile }
> > > +
> > > +do_compile () {
> > > +    oe_runmake 'CC=3D${CC}'
> > > +}
> > > +
> > > +do_install_append (){
> > > +    install -d ${D}${sysconfdir}/sysconfig/
> > > +    install -d ${D}${sysconfdir}/init.d/
> > > +    install -m 0644 ${S}/init/dlm.sysconfig
> > ${D}${sysconfdir}/sysconfig/dlm
> > > +    install -m 0644 ${S}/init/dlm.init ${D}${sysconfdir}/init.d/dlm
> > > +
> > > +    # install systemd unit files
> > > +    if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d=
)};
> > then
> > > +        install -d ${D}${systemd_unitdir}/system
> > > +        install -m 0644 ${S}/init/dlm.service
> > ${D}${systemd_unitdir}/system
> > > +    fi
> > > +}
> > > +
> > > +do_install() {
> > > +    oe_runmake install DESTDIR=3D${D} LIBDIR=3D${libdir} }
> > > +
> > > --
> > > 1.8.4.2
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >=20
> > --
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--19uQFt6ulqmgNgg1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlSs9/gACgkQN1Ujt2V2gBzaYgCfU6NGh3Jsj0UxmEhIlIroN69D
eMwAnieduVeNxyRofMEgzkOVGiuPZdSK
=pD58
-----END PGP SIGNATURE-----

--19uQFt6ulqmgNgg1--
