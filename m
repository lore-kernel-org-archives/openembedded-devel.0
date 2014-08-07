Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f50.google.com (mail-wg0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id A04C5701A6
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Aug 2014 07:49:03 +0000 (UTC)
Received: by mail-wg0-f50.google.com with SMTP id n12so3783533wgh.9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Aug 2014 00:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ymm44jmD12vE/CE1U2GYmlY4qbdu6BIEVgLUkj5iok8=;
	b=p15YN4NJKe/xfEGMTzMfPlJwYUeSQgDlcg/04ZV/KP61lTnGgYyCxpiLI72w9IuthR
	9vAZUzdVWeJBI6ZkJvpehRhmhae0V+GkDhBG9kLzSIWLzpeFru/jDdFBvDjFDFHZ7U50
	sjQgjr5GH1zTP64GAgfCJ11r3/uvMula+0/hDFYEP4mXyzPLtSPt1faxpdLrxbUuQkBD
	Cif/mG2MWWjpgWO6gK/nIfuScyvF/2EFyBtNmmj5cpM8R2uu7sn4qcYTaKpEqKGbp3ft
	MM4V2oIc99HNL+IRYI5toZsZ6ttlZBLRom1svHnS8wyjbO7J9XBLP8HHg/xJWJQy4+DL
	xSUg==
X-Received: by 10.181.13.44 with SMTP id ev12mr58121238wid.57.1407397744700;
	Thu, 07 Aug 2014 00:49:04 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	r20sm26303614wik.0.2014.08.07.00.49.03
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Aug 2014 00:49:03 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 7 Aug 2014 09:49:35 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140807074935.GT14848@jama>
References: <1407386976-24889-1-git-send-email-eduardo@monkey.io>
MIME-Version: 1.0
In-Reply-To: <1407386976-24889-1-git-send-email-eduardo@monkey.io>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-webserver][PATCH] monkey: new v1.5.2 release.
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
X-List-Received-Date: Thu, 07 Aug 2014 07:49:12 -0000
X-Groupsio-MsgNum: 51478
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+OVWeTxrbAwQuiek"
Content-Disposition: inline

--+OVWeTxrbAwQuiek
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 06, 2014 at 10:49:36PM -0600, Eduardo Silva wrote:
> This patch add the new Monkey HTTP Server v1.5.2. The new Bitbake file
> contains the modifications suggested over the patch set for v1.5.1. It
> specify each configuration file for CONFFILES_${PN}.
>=20
> For more details about software changes please visit:
>=20
>   http://monkey-project.com/Announcements/v1.5.2

Can you please resend with -M?

> =3D=3D=3D Build Tests =3D=3D
>=20
> This version and new Bitbake file have been tested on Yocto/Daisy being
> packaged and deployed on images based on rpm and ipk successfully.
>=20
> monkey-yocto/70d57bfd19c01ec055db57e35385ffc4185ae186
>=20
> Signed-off-by: Eduardo Silva <eduardo@monkey.io>
> ---
>  .../recipes-httpd/monkey/monkey_1.5.1.bb           | 50 -----------------
>  .../recipes-httpd/monkey/monkey_1.5.2.bb           | 64 ++++++++++++++++=
++++++
>  2 files changed, 64 insertions(+), 50 deletions(-)
>  delete mode 100644 meta-webserver/recipes-httpd/monkey/monkey_1.5.1.bb
>  create mode 100644 meta-webserver/recipes-httpd/monkey/monkey_1.5.2.bb
>=20
> diff --git a/meta-webserver/recipes-httpd/monkey/monkey_1.5.1.bb b/meta-w=
ebserver/recipes-httpd/monkey/monkey_1.5.1.bb
> deleted file mode 100644
> index 2de98f4..0000000
> --- a/meta-webserver/recipes-httpd/monkey/monkey_1.5.1.bb
> +++ /dev/null
> @@ -1,50 +0,0 @@
> -SUMMARY =3D "Fast and Lightweight HTTP Server for Linux"
> -HOMEPAGE =3D "http://monkey-project.com"
> -BUGTRACKER =3D "https://github.com/monkey/monkey/issues"
> -
> -LICENSE =3D "Apache-2.0"
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D2ee41112a44fe7014dce33e26468b=
a93"
> -
> -SECTION =3D "net"
> -
> -SRC_URI =3D "http://monkey-project.com/releases/1.5/monkey-${PV}.tar.gz \
> -           file://monkey.service \
> -           file://monkey.init"
> -
> -SRC_URI[md5sum] =3D "2fe04135728f5c3a86c3a412059e0da3"
> -SRC_URI[sha256sum] =3D "28dfc5e57bbcd305727e7af6a1a0587868db1c1286498757=
bfeb72edddf457e7"
> -
> -EXTRA_OECONF =3D " \
> -             --plugdir=3D${libdir}/monkey/ \
> -             --logdir=3D${localstatedir}/log/monkey/ \
> -             --pidfile=3D${localstatedir}/run/monkey.pid \
> -             --default-user=3Dwww-data \
> -             --datadir=3D${localstatedir}/www/monkey/ \
> -             --sysconfdir=3D${sysconfdir}/monkey/ \
> -             --enable-plugins=3D* \
> -             --disable-plugins=3Dpolarssl \
> -             --debug \
> -             --malloc-libc"
> -
> -inherit autotools-brokensep pkgconfig update-rc.d systemd
> -
> -INITSCRIPT_NAME =3D "monkey"
> -INITSCRIPT_PARAMS =3D "defaults 70"
> -
> -SYSTEMD_SERVICE_${PN} =3D "monkey.service"
> -
> -FILES_${PN} +=3D "${localstatedir}/www/monkey/"
> -
> -# temporarily remove, because ipk doesn't allow directories in CONFFILES
> -# CONFFILES_${PN} =3D "${sysconfdir}/monkey/"
> -
> -do_install_append() {
> -
> -    mkdir -p ${D}${sysconfdir}/init.d
> -    install -m 0755 ${WORKDIR}/monkey.init ${D}${sysconfdir}/init.d/monk=
ey
> -
> -    if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; =
then
> -        install -d ${D}${systemd_unitdir}/system
> -        install -m 644 ${WORKDIR}/monkey.service ${D}/${systemd_unitdir}=
/system
> -    fi
> -}
> diff --git a/meta-webserver/recipes-httpd/monkey/monkey_1.5.2.bb b/meta-w=
ebserver/recipes-httpd/monkey/monkey_1.5.2.bb
> new file mode 100644
> index 0000000..fcd40e0
> --- /dev/null
> +++ b/meta-webserver/recipes-httpd/monkey/monkey_1.5.2.bb
> @@ -0,0 +1,64 @@
> +SUMMARY =3D "Fast and Lightweight HTTP Server for Linux"
> +HOMEPAGE =3D "http://monkey-project.com"
> +BUGTRACKER =3D "https://github.com/monkey/monkey/issues"
> +
> +LICENSE =3D "Apache-2.0"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D2ee41112a44fe7014dce33e26468b=
a93"
> +
> +SECTION =3D "net"
> +
> +SRC_URI =3D "http://monkey-project.com/releases/1.5/monkey-${PV}.tar.gz \
> +           file://monkey.service \
> +           file://monkey.init"
> +
> +SRC_URI[md5sum] =3D "c90ccba23a814265c7e0fd3a75f883fd"
> +SRC_URI[sha256sum] =3D "2048d49662895f83df475e22d87c45ea8022c0b1565bba22=
2bda2192fd02c349"
> +
> +EXTRA_OECONF =3D "--plugdir=3D${libdir}/monkey/ \
> +                --logdir=3D${localstatedir}/log/monkey/ \
> +                --pidfile=3D${localstatedir}/run/monkey.pid \
> +                --default-user=3Dwww-data \
> +                --datadir=3D${localstatedir}/www/monkey/ \
> +                --sysconfdir=3D${sysconfdir}/monkey/ \
> +                --enable-plugins=3D* \
> +                --disable-plugins=3Dpolarssl \
> +                --debug \
> +                --malloc-libc"
> +
> +inherit autotools-brokensep pkgconfig update-rc.d systemd
> +
> +INITSCRIPT_NAME =3D "monkey"
> +INITSCRIPT_PARAMS =3D "defaults 70"
> +
> +SYSTEMD_SERVICE_${PN} =3D "monkey.service"
> +
> +FILES_${PN} +=3D "${localstatedir}/www/monkey/"
> +
> +CONFFILES_${PN} =3D "${sysconfdir}/monkey/monkey.conf \
> +                   ${sysconfdir}/monkey/sites/default \
> +                   ${sysconfdir}/monkey/monkey.mime \
> +                   ${sysconfdir}/monkey/plugins.load \
> +                   ${sysconfdir}/monkey/plugins/proxy_reverse/proxy_reve=
rse.conf \
> +                   ${sysconfdir}/monkey/plugins/mandril/mandril.conf \
> +                   ${sysconfdir}/monkey/plugins/fastcgi/fastcgi.conf \
> +                   ${sysconfdir}/monkey/plugins/logger/logger.conf \
> +                   ${sysconfdir}/monkey/plugins/cgi/cgi.conf \
> +                   ${sysconfdir}/monkey/plugins/cheetah/cheetah.conf \
> +                   ${sysconfdir}/monkey/plugins/dirlisting/dirhtml.conf \
> +                   ${sysconfdir}/monkey/plugins/dirlisting/themes/guineo=
/header.theme \
> +                   ${sysconfdir}/monkey/plugins/dirlisting/themes/guineo=
/footer.theme \
> +                   ${sysconfdir}/monkey/plugins/dirlisting/themes/guineo=
/entry.theme \
> +                   ${sysconfdir}/monkey/plugins/auth/README \
> +                   ${sysconfdir}/monkey/plugins/auth/monkey.users \
> +                   "
> +
> +do_install_append() {
> +
> +    mkdir -p ${D}${sysconfdir}/init.d
> +    install -m 0755 ${WORKDIR}/monkey.init ${D}${sysconfdir}/init.d/monk=
ey
> +
> +    if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; =
then
> +        install -d ${D}${systemd_unitdir}/system
> +        install -m 644 ${WORKDIR}/monkey.service ${D}/${systemd_unitdir}=
/system
> +    fi
> +}
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

--+OVWeTxrbAwQuiek
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPjL48ACgkQN1Ujt2V2gBxlPQCgozZ8w1XXRT3my8ifceQKU8BJ
p98An0nm5laWmdrbdgHLuZ2sk7XH5acH
=xIGu
-----END PGP SIGNATURE-----

--+OVWeTxrbAwQuiek--
