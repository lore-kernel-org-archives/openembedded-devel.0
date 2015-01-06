Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id 15EA3728CE
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Jan 2015 14:35:28 +0000 (UTC)
Received: by mail-wi0-f173.google.com with SMTP id r20so5458396wiv.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Jan 2015 06:35:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=t4oiOL2uNykusTm67ZPR+akKFm4ekvhXTw8m2luKNwo=;
	b=V0hByFr5ekYyuZDnjyVktBjrKeKCStrafy+kP/2Gt80c4h06Rf/rnXiaL10Aw6u+fF
	ROGF4AVvrmMpuKSslTWnepe4TBfK24f6l8dgnNp62trnSMnqLDAs60/EtDjh3f2lmFJs
	vs24rkE1pWqQUVjxC51iBcxCgM8LxpyGHrNXkZjg/0r3aXGRxL2jViARCCLgu62PvVla
	mpmOl40/c7UUHXbfmfCFoq9gaNNEsTu/vGZjLv9RIaec5ACIOZTVWOP/pVZQrPQ9kPDC
	HmS4RcLQZBsMnTxU8zNOGvTJ/Yir0QBY5hbUtFFMwYdftVoNZa2rBNNlfQ3Q9F1F7oX9
	0Y2A==
X-Received: by 10.194.175.69 with SMTP id by5mr189000409wjc.32.1420554928542; 
	Tue, 06 Jan 2015 06:35:28 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	gb10sm54465720wjb.21.2015.01.06.06.35.27
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 06 Jan 2015 06:35:27 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 6 Jan 2015 15:35:29 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150106143529.GF19402@jama>
References: <1420517556-49274-1-git-send-email-leimaohui@cn.fujitsu.com>
	<1420517556-49274-4-git-send-email-leimaohui@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1420517556-49274-4-git-send-email-leimaohui@cn.fujitsu.com>
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
X-List-Received-Date: Tue, 06 Jan 2015 14:35:30 -0000
X-Groupsio-MsgNum: 53690
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="eDB11BtaWSyaBkpc"
Content-Disposition: inline

--eDB11BtaWSyaBkpc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 06, 2015 at 12:12:36PM +0800, leimaohui wrote:
> From: leimh <leimaohui@cn.fujitsu.com>
>=20
> The kernel dlm requires a user daemon to control membership.
>=20
> Signed-off-by: leimh <leimaohui@cn.fujitsu.com>
> ---
>  meta-oe/recipes-extended/dlm/dlm_4.0.2.bb | 47 +++++++++++++++++++++++++=
++++++
>  1 file changed, 47 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/dlm/dlm_4.0.2.bb
>=20
> diff --git a/meta-oe/recipes-extended/dlm/dlm_4.0.2.bb b/meta-oe/recipes-=
extended/dlm/dlm_4.0.2.bb
> new file mode 100644
> index 0000000..774f136
> --- /dev/null
> +++ b/meta-oe/recipes-extended/dlm/dlm_4.0.2.bb
> @@ -0,0 +1,47 @@
> +DESCRIPTION =3D "dlm control daemon and tool"
> +
> +SECTION =3D "utils"
> +HOMEPAGE =3D "https://fedorahosted.org/cluster/wiki/HomePage"
> +
> +SRC_URI =3D "https://git.fedorahosted.org/cgit/dlm.git/snapshot/${BP}.ta=
r.xz"
> +
> +SRC_URI[md5sum] =3D "efc2ee6093aa6aa0a88aaad83e998a3f"
> +SRC_URI[sha256sum] =3D "b89bc557aaffbab0ac005398025f247718a5589cff6574d9=
02eaffe2b20e683e"
> +
> +LICENSE =3D "LGPLv2+ & GPLv2 & GPLv2+"
> +LIC_FILES_CHKSUM =3D "file://README.license;md5=3D8f0bbcdd678df1bce98634=
92b6c8832d"
> +
> +DEPENDS =3D "corosync systemd"

Does it need explicit systemd dependency?
https://git.fedorahosted.org/cgit/dlm.git/tree/dlm_controld/Makefile
looks like yes with default USE_SD_NOTIFY

If yes, then it should be together with
REQUIRED_DISTRO_FEATURES =3D "systemd"
to prevent world error when systemd isn't in DISTRO_FEATURES
ERROR: Nothing PROVIDES 'systemd' (but meta-oe/meta-oe/recipes-extended/dlm=
/dlm_4.0.2.bb DEPENDS on or otherwise requires it)
ERROR: systemd was skipped: 'systemd' not in DISTRO_FEATURES

> +
> +inherit pkgconfig systemd
> +
> +SYSTEMD_SERVICE_${PN} =3D "dlm.service"
> +SYSTEMD_AUTO_ENABLE =3D "enable"
> +
> +export EXTRA_OEMAKE =3D ""
> +
> +do_compile_prepend() {
> +    sed -i "s/libsystemd-daemon/libsystemd/g" ${S}/dlm_controld/Makefile
> +}
> +
> +do_compile () {
> +    oe_runmake 'CC=3D${CC}'
> +}
> +
> +do_install_append (){
> +    install -d ${D}${sysconfdir}/sysconfig/
> +    install -d ${D}${sysconfdir}/init.d/
> +    install -m 0644 ${S}/init/dlm.sysconfig ${D}${sysconfdir}/sysconfig/=
dlm
> +    install -m 0644 ${S}/init/dlm.init ${D}${sysconfdir}/init.d/dlm
> +
> +    # install systemd unit files
> +    if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; =
then
> +        install -d ${D}${systemd_unitdir}/system
> +        install -m 0644 ${S}/init/dlm.service ${D}${systemd_unitdir}/sys=
tem
> +    fi
> +}
> +
> +do_install() {
> +    oe_runmake install DESTDIR=3D${D} LIBDIR=3D${libdir}
> +}
> +
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

--eDB11BtaWSyaBkpc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlSr8rEACgkQN1Ujt2V2gBwl2wCeNqDJ7/j7N0+Sq3aFXp2sQkMa
P44AnRFC4Btkdf6zTbsv/zra933T06cq
=BK2q
-----END PGP SIGNATURE-----

--eDB11BtaWSyaBkpc--
