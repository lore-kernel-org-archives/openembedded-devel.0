Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 82DF66FF93
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Mar 2016 21:37:34 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id p65so12291971wmp.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Mar 2016 14:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=oNhbkCzKEH374XONTaGJoNxKfYjgaDXY/oiSraQfqy0=;
	b=jnYH5m09amcNWVMfDwoCS3d2sMq8lc0ZA8dhmik67V2vn9kA0f4lzXQH25WtDeVSe+
	3/KgXa88IC0CRvcyS9GHGick/1p+U5TNBaqCOihS9nZnewqzuvz3XLwD4M/5iYZT7vE+
	vj9k6x1chIzqXVXCb8Y8j0WzsTEcdIdZbrasm9l/ukT6E7RiOPA097UtoCrFoDF5JWBi
	fIz13PsZCZNkEwL6UT87XJW7MLCySayKlgBWjYEVdTR39HO1jgJMgrBqgFc0J+XH1GHZ
	eC3V1TEbENPydxP7BPpQvS5QSyFIcFprTZSNyRS184a+MI+gFepbuv806H/MBPPVX94h
	wjtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=oNhbkCzKEH374XONTaGJoNxKfYjgaDXY/oiSraQfqy0=;
	b=NWAtcLza1/fmanPFiRfJCSfKf/n82GbLiDqJMMsa/0UfSymdaMjIhYwm0NjKVBBaWk
	Z65sFJ+IUE1qKvNCfbOQOnMqQdLCZGMqWJi/yffhOmsu9xZEV2erFU3Wy8mcqfZXsQpp
	p7JiRmaLNmz0NjlSNce9vipXC3zV5IbUSTguFEuIUzTsD1XC6kE/mE+a2sg4SXSpW+WX
	qybVNfRZFVYr2+0Vyc8Tx73N4IGLPbbpjH5IS1+WQ+6OwEQ/Y8rquCMBkbzk4epbzW0V
	1rXm6O+EwAKaPVhGTL9NbgPwh98WnXeY4uggYsIC6g81+14aelrcTKgWjl5qMg04FZav
	16iQ==
X-Gm-Message-State: AD7BkJIic6UaUrEVfpD+DnVihW9FORb50TTQDCIYvj9alYJ7CvmliiluzkGkquQ4mLczgA==
X-Received: by 10.194.113.38 with SMTP id iv6mr12166407wjb.126.1458250655140; 
	Thu, 17 Mar 2016 14:37:35 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	r62sm9892241wmd.15.2016.03.17.14.37.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 17 Mar 2016 14:37:33 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 17 Mar 2016 22:41:18 +0100
To: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
Message-ID: <20160317214118.GH2553@jama>
References: <614cbca3bdce23c4c67f78eab893a21ef6a50663.1458230028.git.adrian.ratiu@ni.com>
	<5663cbe1f0256f5eec13f90acd9b2373932dbbc5.1458230028.git.adrian.ratiu@ni.com>
MIME-Version: 1.0
In-Reply-To: <5663cbe1f0256f5eec13f90acd9b2373932dbbc5.1458230028.git.adrian.ratiu@ni.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: Haris Okanovic <haris.okanovic@ni.com>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH v2 2/2] apache-websocket: Add recipe
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
X-List-Received-Date: Thu, 17 Mar 2016 21:37:38 -0000
X-Groupsio-MsgNum: 60553
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="U3BNvdZEnlJXqmh+"
Content-Disposition: inline

--U3BNvdZEnlJXqmh+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 17, 2016 at 05:54:35PM +0200, Ioan-Adrian Ratiu wrote:
> From: Haris Okanovic <haris.okanovic@ni.com>
>=20
> The apache-websocket module is an Apache 2.x server module that may be
> used to process requests using the WebSocket protocol (RFC 6455) by an
> Apache 2.x server. The module consists of a plugin architecture for
> handling WebSocket messaging.

does v2 fix hits?

| checking for libtool... no
| configure: error: could not find an installed libtool
| NOTE: The following config.log files may provide further information.
| NOTE:
/home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/apa=
che-websocket/1.1.1-r0/git/config.log

?

>=20
> Signed-off-by: Haris Okanovic <haris.okanovic@ni.com>
> Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> ---
>  .../apache-mod/apache-websocket_git.bb             | 32 ++++++++++++++++=
++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 meta-webserver/recipes-httpd/apache-mod/apache-websoc=
ket_git.bb
>=20
> diff --git a/meta-webserver/recipes-httpd/apache-mod/apache-websocket_git=
=2Ebb b/meta-webserver/recipes-httpd/apache-mod/apache-websocket_git.bb
> new file mode 100644
> index 0000000..2cfc1f3
> --- /dev/null
> +++ b/meta-webserver/recipes-httpd/apache-mod/apache-websocket_git.bb
> @@ -0,0 +1,32 @@
> +SUMMARY =3D "Websocket module for Apache web server"
> +DESCRIPTION =3D "Process requests using the WebSocket protocol (RFC 6455=
)"
> +HOMEPAGE =3D "https://github.com/jchampio/${PN}/"
> +SECTION =3D "net"
> +LICENSE =3D "Apache-2.0"
> +
> +inherit autotools-brokensep pkgconfig
> +
> +DEPENDS =3D "apache2 apache2-native"
> +RDEPENDS_${PN} +=3D "apache2"
> +
> +# Original (github.com/disconnect/apache-websocket) is dead since 2012, =
the
> +# fork contains patches from the modules ML and fixes CVE compliance iss=
ues
> +SRC_URI =3D "git://github.com/jchampio/apache-websocket.git"
> +
> +SRCREV =3D "f5230d8c520dccf8631da94bf90c23f3c1100dcc"
> +
> +PV =3D "0.1.1"
> +
> +S =3D "${WORKDIR}/git"
> +
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D2ee41112a44fe7014dce33e26468b=
a93"
> +
> +EXTRA_OECONF =3D "APACHECTL=3D${STAGING_DIR_TARGET}${sbindir}/apachectl"
> +
> +do_install() {
> +    install -d ${D}${libdir}/apache2/modules/
> +    install ${B}/.libs/mod_websocket.so ${D}${libdir}/apache2/modules/
> +}
> +
> +FILES_${PN} +=3D " ${libdir}/apache2/modules/* "
> +FILES_${PN}-dbg +=3D " ${libdir}/apache2/modules/.debug/* "
> --=20
> 2.7.3
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--U3BNvdZEnlJXqmh+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbrJH0ACgkQN1Ujt2V2gBxTzwCcDHLoS+abomfbUbtY3bZBxv7u
HJIAnjvlaQ2TEMpTlZIvXDRRobo7dnyr
=OVkU
-----END PGP SIGNATURE-----

--U3BNvdZEnlJXqmh+--
