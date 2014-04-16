Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f42.google.com (mail-ee0-f42.google.com [74.125.83.42])
	by mail.openembedded.org (Postfix) with ESMTP id 8B67D60D67
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Apr 2014 19:01:36 +0000 (UTC)
Received: by mail-ee0-f42.google.com with SMTP id d17so9251523eek.29
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Apr 2014 12:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=UaG+M3K6lHmHOE6I92IktdJ5+rMspARssV1Ke4IQx7E=;
	b=lqf6rIAKbN30RnCUCz4ts7CzNN72nO6BMd+B230q4T+qvmuVq+sqTvitDEcbqxJarG
	vELImfSzjpn3XGk2vNBCT5Hdy68NZlJGYAdkRQytSfz7F/pUq0w6b/AZj2G0lXlngSJo
	cJPHptTcINDJjLuPSAHjr9PBr/tH2mkDbEWjF9cZ+gRdJphowNuXlTsry2NXAtcn/jfd
	6KB3ngrNnra7gvtBpbeTmL4ggf/7fPHtwSpoIDCRuquWxdbvg3XsDHjUdJsR/faacc4K
	k5V1gfVTiPAX/c/LqmKVYL0c74OzK6KtDJzqyDym8UnF65NIJPKhrMCskirpdUTvfrJD
	/MNg==
X-Received: by 10.15.102.74 with SMTP id bq50mr7341953eeb.21.1397674897574;
	Wed, 16 Apr 2014 12:01:37 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	o4sm60406311eef.20.2014.04.16.12.01.35 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 Apr 2014 12:01:36 -0700 (PDT)
Date: Wed, 16 Apr 2014 21:01:37 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140416190137.GF2458@jama>
References: <1397671872-57992-1-git-send-email-krzysztof.m.sywula@intel.com>
MIME-Version: 1.0
In-Reply-To: <1397671872-57992-1-git-send-email-krzysztof.m.sywula@intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: martin.jansa@gmail.comexit, koen@dominion.thruhere.net
Subject: Re: [meta-oe][PATCH] bitlbee: add bitlbee-3.2.1
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
X-List-Received-Date: Wed, 16 Apr 2014 19:01:39 -0000
X-Groupsio-MsgNum: 49254
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="B0nZA57HJSoPbsHY"
Content-Disposition: inline

--B0nZA57HJSoPbsHY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 16, 2014 at 07:11:12PM +0100, krzysztof.m.sywula@intel.com wrot=
e:
> From: Krzysztof Sywula <krzysztof.m.sywula@intel.com>
>=20
> Signed-off-by: Krzysztof Sywula <krzysztof.m.sywula@intel.com>
> ---
>  .../recipes-connectivity/bitlbee/bitlbee_3.2.1.bb  | 61 ++++++++++++++++=
++++++
>  .../recipes-connectivity/bitlbee/files/init-script | 31 +++++++++++
>  2 files changed, 92 insertions(+)
>  create mode 100644 meta-oe/recipes-connectivity/bitlbee/bitlbee_3.2.1.bb
>  create mode 100644 meta-oe/recipes-connectivity/bitlbee/files/init-script
>=20
> diff --git a/meta-oe/recipes-connectivity/bitlbee/bitlbee_3.2.1.bb b/meta=
-oe/recipes-connectivity/bitlbee/bitlbee_3.2.1.bb
> new file mode 100644
> index 0000000..449e6a0
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/bitlbee/bitlbee_3.2.1.bb
> @@ -0,0 +1,61 @@
> +SUMMARY =3D "Bitlbee is an IRC to IM gateway that support multiple IM pr=
otocols."
> +HOMEPAGE =3D "http://www.bitlbee.org/"
> +SECTION =3D "console/network"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae=
19f"
> +
> +DEPENDS =3D "glib-2.0 openssl"
> +
> +SRC_URI =3D "http://get.bitlbee.org/src/${P}.tar.gz \
> +           file://init-script"
> +
> +SRC_URI[md5sum] =3D "6ee7c7a99eb59dfcf0307fcf44c14105"
> +SRC_URI[sha256sum] =3D "00f411dd7d6d28f30f0e73e46c9cbe88b4006e7f03adfe07=
b90a97280a290f59"
> +
> +S =3D "${WORKDIR}/bitlbee-${PV}"

This looks like default value, isn't it?

> +EXTRA_OECONF =3D "--prefix=3D/usr \
> +                --datadir=3D/usr/share/bitlbee \
> +                --etcdir=3D/etc/bitlbee \
> +                --oscar=3D0 \
> +                --ssl=3Dopenssl"
> +
> +do_configure () {
> +    # NOTE: bitlbee's configure script is not an autotool creation,=20
> +    # so we do not use the default autotools_do_configure.

This recipe doesn't inherit autotools, so there is no "default
autotools_do_configure" afaik.

> +    ./configure ${EXTRA_OECONF} || die "./configure failed"
> +}
> +
> +do_compile () {
> +    make CC=3D"${CC}" LD=3D"${LD}" || die "make failed"

Can you use oe_runmake to respect EXTRA_OEMAKE, especially PARALLEL_MAKE?

> +    # make bitlbeed forking server
> +    cd ${S}/utils
> +    ${CC} bitlbeed.c -o bitlbeed || die "bitlbeed failed to compile"
> +}
> +
> +do_install () {
> +    # install bitlbee
> +    install -d ${D}${localstatedir}/lib/bitlbee
> +    make install DESTDIR=3D${D} || die "install failed"
> +    make install-etc DESTDIR=3D${D} || die "install failed"

Can you use oe_runmake to respect EXTRA_OEMAKE, especially PARALLEL_MAKE?

> +
> +    # copy bitlbee forking server
> +    install ${S}/utils/bitlbeed ${D}${sbindir}/bitlbeed
> +
> +    # copy init script
> +    install -d ${D}${sysconfdir}/init.d
> +    install ${WORKDIR}/init-script ${D}${sysconfdir}/init.d/bitlbee
> +    sed -i -e "s:BITLBEED_EXEC:${sbindir}/bitlbeed:" ${D}${sysconfdir}/i=
nit.d/bitlbee
> +    sed -i -e "s:BITLBEED_OPTS::" ${D}${sysconfdir}/init.d/bitlbee
> +
> +    # copy bitlbee utils
> +    install -d ${D}${datadir}/bitlbee
> +    cp ${S}/utils/* ${D}${datadir}/bitlbee/
> +    rm ${D}${datadir}/bitlbee/bitlbeed*
> +}
> +
> +pkg_postinst_${PN} () {
> +    chown nobody:nogroup ${localstatedir}/lib/bitlbee
> +    chmod 700 ${localstatedir}/lib/bitlbee
> +}
> diff --git a/meta-oe/recipes-connectivity/bitlbee/files/init-script b/met=
a-oe/recipes-connectivity/bitlbee/files/init-script
> new file mode 100644
> index 0000000..3ec3fdf
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/bitlbee/files/init-script
> @@ -0,0 +1,31 @@
> +#!/bin/sh

please add LSB headers

> +
> +case "$1" in
> +    start)
> +    	echo "Starting bitlbee daemon"
> +	start-stop-daemon --start --startas BITLBEED_EXEC \
> +		-c nobody:nogroup  --exec BITLBEED_EXEC -- \
> +		BITLBEED_OPTS /usr/sbin/bitlbee
> +	[ $? -eq 0 ] || echo $? "Failed to start bitlbee daemon"
> +    ;;
> +
> +    stop)
> +        echo "Stopping bitlbee daemon"
> +	start-stop-daemon --stop --signal 9 \
> +	                 --exec BITLBEED_EXEC
> +	[ $? -eq 0 ] || echo $? "Failed to stop bitlbee daemon"
> +    ;;
> +
> +    restart)
> +    	$0 stop
> +    	sleep 1
> +    	$0 start
> +    ;;
> +
> +    *)
> +        echo "usage: $0 { start | stop }"
> +    	exit 1
> +    ;;
> +esac
> +
> +exit 0
> --=20
> 1.8.2
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--B0nZA57HJSoPbsHY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNO05EACgkQN1Ujt2V2gBy9xgCeKcQmhaMmhts8Mu37VKI0C4tA
7ZMAn2lk32h1oBt1Ul9m94CZ6rS6na5J
=Jcg8
-----END PGP SIGNATURE-----

--B0nZA57HJSoPbsHY--
