Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f171.google.com (mail-we0-f171.google.com
	[74.125.82.171])
	by mail.openembedded.org (Postfix) with ESMTP id 291BD724F4
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Jan 2015 09:00:51 +0000 (UTC)
Received: by mail-we0-f171.google.com with SMTP id u56so7524091wes.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Jan 2015 01:00:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=PYUWJgq6megF4HvmEZFdLxNyduoiP4hgOgrK2rZOsgg=;
	b=ZMfsgum+yuJENCqmokDW55P/aYuqE/JsHE6IB3jBb6WCl4HwS64Q9M38tYwUnqY/Lk
	m/vTtSEAtLB3FX4K3JSVAXtvrfl68tgkOAjj6vCbGDvYAsQT4zxjrBPOIL9D9L8Hdz70
	cABcYTUzBhmQyI6tXNr9CxxlNLEkTCE1X7FA6Xwgyt62MGu0HCUdP+rPgEj6Sya07Qsc
	hmxrqCnwB7w336cwvmOmqYHXtUFMumJdR9vOKGUgL12BwiUw9pHusu4Vidg6yNW3Gvh3
	X3VqR4tcM6nDMVnWptZRHml24fVuWETplUNFEYs/RZ5C3+i+DbLmNkw7qyokA1Xhq7pJ
	orUQ==
X-Received: by 10.194.242.196 with SMTP id ws4mr180737222wjc.1.1420448451941; 
	Mon, 05 Jan 2015 01:00:51 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	s9sm9057040wiz.12.2015.01.05.01.00.51
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Jan 2015 01:00:51 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 5 Jan 2015 10:00:52 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150105090052.GC2484@jama>
References: <1420442394-39127-1-git-send-email-leimaohui@cn.fujitsu.com>
	<1420442394-39127-3-git-send-email-leimaohui@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1420442394-39127-3-git-send-email-leimaohui@cn.fujitsu.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH 2/3] corosync_2.3.4: add new recipe
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
X-List-Received-Date: Mon, 05 Jan 2015 09:00:57 -0000
X-Groupsio-MsgNum: 53612
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0IvGJv3f9h+YhkrH"
Content-Disposition: inline

--0IvGJv3f9h+YhkrH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 05, 2015 at 03:19:53PM +0800, leimaohui wrote:
> From: leimh <leimaohui@cn.fujitsu.com>
>=20
> The Corosync Cluster Engine and Application Programming Interfaces
>=20
> Signed-off-by: leimh <leimaohui@cn.fujitsu.com>
> ---
>  .../recipes-extended/corosync/corosync_2.3.4.bb    | 59 ++++++++++++++++=
++++++
>  1 file changed, 59 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/corosync/corosync_2.3.4.bb
>=20
> diff --git a/meta-oe/recipes-extended/corosync/corosync_2.3.4.bb b/meta-o=
e/recipes-extended/corosync/corosync_2.3.4.bb
> new file mode 100644
> index 0000000..7a09862
> --- /dev/null
> +++ b/meta-oe/recipes-extended/corosync/corosync_2.3.4.bb
> @@ -0,0 +1,59 @@
> +SUMMARY =3D "The Corosync Cluster Engine and Application Programming Int=
erfaces"
> +DESCRIPTION =3D "This package contains the Corosync Cluster Engine Execu=
tive, several default \
> +APIs and libraries, default configuration files, and an init script."
> +HOMEPAGE =3D "http://corosync.github.io/corosync/"
> +
> +SECTION =3D "base"
> +
> +inherit autotools pkgconfig systemd
> +
> +SRC_URI =3D "http://build.clusterlabs.org/corosync/releases/${BPN}-${PV}=
=2Etar.gz \
> +	   "

${BPN}-${PV} -> ${BP}

> +
> +SRC_URI[md5sum] =3D "4b0f36a1dc014527e5b192265dbd7e70"
> +SRC_URI[sha256sum] =3D "3dae93fb1cf5c560295253b0560cbc25421ed053ee373852=
864f3a60c03247d4"
> +
> +LICENSE =3D "BSD"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Da85eb4ce24033adb6088dd1d6ffc5=
e5d"
> +
> +DEPENDS =3D "groff-native nss libqb"
> +
> +SYSTEMD_SERVICE_${PN} =3D "corosync.service corosync-notifyd.service"
> +SYSTEMD_AUTO_ENABLE =3D "enable"
> +
> +INITSCRIPT_NAME =3D "corosync-daemon"
> +
> +PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', =
'systemd', '', d)}"
> +
> +PACKAGECONFIG[systemd] =3D "--enable-systemd --with-systemddir=3D${syste=
md_unitdir}/system/,--with-systemddir=3D"
> +
> +EXTRA_OECONF =3D "--disable-nss \
> +                --with-upstartdir=3D%{_sysconfdir}/init \
> +"
> +EXTRA_OECONF +=3D " --enable-nss "
> +
> +do_configure_prepend() {
> +    ( cd ${S}
> +    ${S}/autogen.sh )
> +}
> +
> +do_install_append() {
> +        install -d ${D}${sysconfdir}/sysconfig/
> +	install -d ${D}/${sysconfdir}/init.d
> +	install -m 0644 ${S}/init/corosync.sysconfig.example ${D}${sysconfdir}/=
sysconfig/corosync
> +	install -m 0644 ${S}/init/corosync-notifyd.conf.in ${D}${sysconfdir}/sy=
sconfig/corosync-notifyd.conf
> +	install -m 0644 ${S}/init/corosync.conf.in ${D}${sysconfdir}/sysconfig/=
corosync.conf
> +	install -m 0644 ${S}/init/corosync.in ${D}${sysconfdir}/init.d/corosync
> +	install -m 0644 ${S}/init/corosync-notifyd.in ${D}${sysconfdir}/init.d/=
corosync-notifyd
> +
> +	if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; then
> +		install -d ${D}${systemd_unitdir}/system
> +		install -m 0644 ${S}/init/corosync.service.in ${D}${systemd_unitdir}/s=
ystem/corosync.service
> +		install -m 0644 ${S}/init/corosync-notifyd.service.in ${D}${systemd_un=
itdir}/system/corosync-notifyd.service
> +		sed -i -e 's,@INITWRAPPERSDIR@,${sysconfdir}/init.d,g' ${D}${systemd_u=
nitdir}/system/corosync.service
> +		sed -i -e 's,@SYSCONFDIR@,${sysconfdir},g' ${D}${systemd_unitdir}/syst=
em/corosync-notifyd.service
> +		sed -i -e 's,@SBINDIR@,${base_sbindir},g' ${D}${systemd_unitdir}/syste=
m/corosync-notifyd.service
> +	fi=09
> +}

Use 4 spaces for indentation.

> +
> +FILES_${PN}-dbg +=3D "${libexecdir}/lcrso/.debug"
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

--0IvGJv3f9h+YhkrH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlSqUsQACgkQN1Ujt2V2gBxRqgCfeBBTjM9lGiK60N1w1JT3uEGv
OVoAoKRvLZCJtIkrrBMyGV8ln6N5wOw3
=TPzS
-----END PGP SIGNATURE-----

--0IvGJv3f9h+YhkrH--
