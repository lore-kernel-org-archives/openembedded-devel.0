Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f172.google.com (mail-we0-f172.google.com
	[74.125.82.172])
	by mail.openembedded.org (Postfix) with ESMTP id AB00871F59
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Jan 2015 09:02:48 +0000 (UTC)
Received: by mail-we0-f172.google.com with SMTP id k11so7520271wes.31
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Jan 2015 01:02:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=An1edgERcaYS0oDPZOI5GNhEANwzj34ls8tgpE7sOwQ=;
	b=rPbp3wUJcvDms4ccXp7vX2Zff+qd/Ne/kRrjLRNlVnk8TcUxu91MkjsRlWz4UUJm/j
	Gua3Tb6k9CKtZqYPGEo7JTRWgKBduk1mNyWbXU5fE0j4YehlNAhXz4gHKm9hAk0Ey7cW
	6JDJGBN2xK+r/gh1dmReXiobMpXuV4MsW5I4d2Jr0E4HecpmaGZpC/YzeQedIyjsFfPO
	VIN6rJzUA5fSdnXQ4abuBvPFHA/M9E4QQiV4BgYJ/VteLC6pT7/Utv6CFyzrVMUP6v7w
	gHMgRSQ3bPGrsFCx39I20t+SC0Y4ysUKcxuV6jNE4a7MBuVuW7W4sCpslkXqaqEs+Kyk
	dwJg==
X-Received: by 10.180.98.162 with SMTP id ej2mr23483249wib.39.1420448568794;
	Mon, 05 Jan 2015 01:02:48 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	u18sm74527875wjq.42.2015.01.05.01.02.47
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Jan 2015 01:02:48 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 5 Jan 2015 10:02:48 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150105090248.GD2484@jama>
References: <1420442394-39127-1-git-send-email-leimaohui@cn.fujitsu.com>
	<1420442394-39127-4-git-send-email-leimaohui@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1420442394-39127-4-git-send-email-leimaohui@cn.fujitsu.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH 3/3] dlm: add a new recipe
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
X-List-Received-Date: Mon, 05 Jan 2015 09:02:50 -0000
X-Groupsio-MsgNum: 53613
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jTMWTj4UTAEmbWeb"
Content-Disposition: inline

--jTMWTj4UTAEmbWeb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 05, 2015 at 03:19:54PM +0800, leimaohui wrote:
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
> index 0000000..b46c357
> --- /dev/null
> +++ b/meta-oe/recipes-extended/dlm/dlm_4.0.2.bb
> @@ -0,0 +1,47 @@
> +DESCRIPTION =3D "dlm control daemon and tool"
> +
> +SECTION =3D "utils"
> +HOMEPAGE =3D "https://fedorahosted.org/cluster/wiki/HomePage"
> +
> +SRC_URI =3D "https://git.fedorahosted.org/cgit/dlm.git/snapshot/dlm-${PV=
}.tar.xz"

dlm-${PV} -> ${BP} but more importantly is dlm.git/snapshots "stable"?
Doesn't it re-generated sometimes ?
> +
> +SRC_URI[md5sum] =3D "efc2ee6093aa6aa0a88aaad83e998a3f"
> +SRC_URI[sha256sum] =3D "b89bc557aaffbab0ac005398025f247718a5589cff6574d9=
02eaffe2b20e683e"
> +
> +LICENSE =3D "LGPLv2+&GPLv2&GPLv2+"

Add spaces around &

> +LIC_FILES_CHKSUM =3D "file://README.license;md5=3D8f0bbcdd678df1bce98634=
92b6c8832d"
> +
> +DEPENDS =3D "corosync systemd"
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
> +	install -d ${D}${sysconfdir}/sysconfig/
> +	install -d ${D}${sysconfdir}/init.d/
> +	install -m 0644 ${S}/init/dlm.sysconfig ${D}${sysconfdir}/sysconfig/dlm
> +	install -m 0644 ${S}/init/dlm.init ${D}${sysconfdir}/init.d/dlm
> +
> +	# install systemd unit files
> +	if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; then
> +		install -d ${D}${systemd_unitdir}/system
> +		install -m 0644 ${S}/init/dlm.service ${D}${systemd_unitdir}/system
> +	fi
> +}

Use 4 spaces for indentation

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

--jTMWTj4UTAEmbWeb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlSqUzgACgkQN1Ujt2V2gBzfDgCfVUYAugcscAb4Zx/TqLdVUbxK
MWcAn0dQJggWSrPMGNdlE38EC4GGJPvZ
=9ksX
-----END PGP SIGNATURE-----

--jTMWTj4UTAEmbWeb--
