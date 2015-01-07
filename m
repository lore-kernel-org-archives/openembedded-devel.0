Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f170.google.com (mail-we0-f170.google.com
	[74.125.82.170])
	by mail.openembedded.org (Postfix) with ESMTP id 1CD53706D9
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Jan 2015 10:14:58 +0000 (UTC)
Received: by mail-we0-f170.google.com with SMTP id w61so874259wes.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Jan 2015 02:14:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=c0QU37VfWJXygidd8YTWAqQJ8NYmUU6f5Ax1t5W9E/8=;
	b=D4uhjpTaAjQhs5jFLgyjkFJ+etg8LdetYnLp1HXPVkHJ5fZDcmO4/1bjCgwPDdGDkR
	e33vsbjfHTHyyJs12EnX1APVO3nVERpoQmBfbXARMQ8YiOmWrbkUaxxud4GpTkg7ewGM
	VjOqt9SqG1yGDyO82icX8uqxypmz75EUo29AWTfUg/muiYpBLdDJ99syovanKqfpdiKU
	XNTCWUFSOLClxGGgPxpiwIGRQnPdzZajOpZbEQvD9bQbA7AsTtffBwFWKn96Z9vsU0Z9
	NONz2NqqnNGV1S9dazPB+BWuIzbV2y+yudDET/VDr8BKjk0o5FESRaR0ARnLi8oJv1kl
	Rmtw==
X-Received: by 10.194.240.201 with SMTP id wc9mr4629418wjc.57.1420625698842;
	Wed, 07 Jan 2015 02:14:58 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	n4sm17266990wia.7.2015.01.07.02.14.57
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 07 Jan 2015 02:14:58 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 7 Jan 2015 11:15:01 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150107101501.GI29986@jama>
References: <1420517556-49274-1-git-send-email-leimaohui@cn.fujitsu.com>
	<1420517556-49274-3-git-send-email-leimaohui@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1420517556-49274-3-git-send-email-leimaohui@cn.fujitsu.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][V2 PATCH 2/3] corosync_2.3.4: add new recipe
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
X-List-Received-Date: Wed, 07 Jan 2015 10:14:59 -0000
X-Groupsio-MsgNum: 53722
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="l0l+eSofNeLXHSnY"
Content-Disposition: inline

--l0l+eSofNeLXHSnY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 06, 2015 at 12:12:35PM +0800, leimaohui wrote:
> From: leimh <leimaohui@cn.fujitsu.com>
>=20
> The Corosync Cluster Engine and Application Programming Interfaces.

Triggers QA warning:
corosync-2.3.4: corosync requires /bin/bash, but no providers in its RDEPEN=
DS [file-rdeps]

>=20
> Signed-off-by: leimh <leimaohui@cn.fujitsu.com>

Can you use full name in SOB line?

> ---
>  .../recipes-extended/corosync/corosync_2.3.4.bb    | 59 ++++++++++++++++=
++++++
>  1 file changed, 59 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/corosync/corosync_2.3.4.bb
>=20
> diff --git a/meta-oe/recipes-extended/corosync/corosync_2.3.4.bb b/meta-o=
e/recipes-extended/corosync/corosync_2.3.4.bb
> new file mode 100644
> index 0000000..7385d55
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
> +SRC_URI =3D "http://build.clusterlabs.org/corosync/releases/${BP}.tar.gz=
 \
> +	   "
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
> +    install -d ${D}${sysconfdir}/sysconfig/
> +    install -d ${D}/${sysconfdir}/init.d
> +    install -m 0644 ${S}/init/corosync.sysconfig.example ${D}${sysconfdi=
r}/sysconfig/corosync
> +    install -m 0644 ${S}/init/corosync-notifyd.conf.in ${D}${sysconfdir}=
/sysconfig/corosync-notifyd.conf
> +    install -m 0644 ${S}/init/corosync.conf.in ${D}${sysconfdir}/sysconf=
ig/corosync.conf
> +    install -m 0644 ${S}/init/corosync.in ${D}${sysconfdir}/init.d/coros=
ync
> +    install -m 0644 ${S}/init/corosync-notifyd.in ${D}${sysconfdir}/init=
=2Ed/corosync-notifyd
> +
> +    if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; =
then
> +        install -d ${D}${systemd_unitdir}/system
> +        install -m 0644 ${S}/init/corosync.service.in ${D}${systemd_unit=
dir}/system/corosync.service
> +        install -m 0644 ${S}/init/corosync-notifyd.service.in ${D}${syst=
emd_unitdir}/system/corosync-notifyd.service
> +        sed -i -e 's,@INITWRAPPERSDIR@,${sysconfdir}/init.d,g' ${D}${sys=
temd_unitdir}/system/corosync.service
> +        sed -i -e 's,@SYSCONFDIR@,${sysconfdir},g' ${D}${systemd_unitdir=
}/system/corosync-notifyd.service
> +        sed -i -e 's,@SBINDIR@,${base_sbindir},g' ${D}${systemd_unitdir}=
/system/corosync-notifyd.service
> +    fi=09
> +}
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

--l0l+eSofNeLXHSnY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlStByUACgkQN1Ujt2V2gBwkGQCgly/dJLFfyeTmxMfFmlz7k1nw
d48An2LBJSQR0YVrH+LU1YvV7SSKoHAv
=lSU9
-----END PGP SIGNATURE-----

--l0l+eSofNeLXHSnY--
