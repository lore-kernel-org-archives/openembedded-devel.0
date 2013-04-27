Received: from mail-pa0-f44.google.com ([209.85.220.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UWB71-0001Kd-P1
	for openembedded-devel@lists.openembedded.org;
	Sat, 27 Apr 2013 21:48:52 +0200
Received: by mail-pa0-f44.google.com with SMTP id bi5so3047689pad.17
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Apr 2013 12:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=amROFPJwSm0y3taHdwOBDo8qm8t1Gtj/8ts81c1Pm/M=;
	b=lai7xKrnMlOhy05x5Ht/+zEzLqF4voPwrCUu8922dSKOSQxCfFJc0+LKloQt1upudb
	qq0N+SG7DOH/SHLmm67zEMYoP19cx0cx0CNYkVUZSE96NyHfoy0eWSEX0517rZliDd0Q
	63zVjV30+oigqLApxTH7M9atYUfNqCg9uV6m3OTwWtpUcw5BjXEL3eMC4+vHaoINtvxz
	6VSXf9sGE1UCfwgzH5xMPL6fbopo2Rg+rejoSSDpElj/o7lwAM564zQQSLqlZADuh0Pe
	njtEJjTLZ3fRhyGBuZ8GaDgyFz+h2p5nLcYVtz/lWzzKF4wQ4BHQXUcj2KmoptP4wwr9
	pkGw==
X-Received: by 10.67.10.228 with SMTP id ed4mr53094594pad.41.1367091060449;
	Sat, 27 Apr 2013 12:31:00 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	dr6sm18339182pac.11.2013.04.27.12.30.57
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sat, 27 Apr 2013 12:30:59 -0700 (PDT)
Date: Sat, 27 Apr 2013 21:31:11 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130427193111.GF3199@jama>
References: <1367087640-4264-1-git-send-email-schnitzeltony@googlemail.com>
	<1367087640-4264-2-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
In-Reply-To: <1367087640-4264-2-git-send-email-schnitzeltony@googlemail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-gnome/meta-xfce 1/4] gdm: fix postinst-code to unbreak first boot issues
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 27 Apr 2013 19:48:58 -0000
X-Groupsio-MsgNum: 44467
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4VrXvz3cwkc87Wze"
Content-Disposition: inline

--4VrXvz3cwkc87Wze
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 27, 2013 at 08:33:57PM +0200, Andreas M=FCller wrote:
> Exiting postinst code leaves systemd.bbclass offline postinst code unexec=
uted,
> causes postinst not to finish at first boot (gdm.service is not aliased to
> display-manager.service -> started much too early) and is not neccesary:
> language preparation can be done offline.
>=20
> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> ---
>  meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb |   31 ++++++++++------------=
-----
>  1 files changed, 12 insertions(+), 19 deletions(-)
>=20
> diff --git a/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb b/meta-gnome/reci=
pes-gnome/gdm/gdm_2.32.2.bb
> index 1e55dd9..87efc28 100644
> --- a/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb
> +++ b/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb
> @@ -4,9 +4,9 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba3=
6caa9b7df079bae19f"
> =20
>  DEPENDS =3D "xinput gnome-panel tcp-wrappers libcanberra libxklavier gre=
p consolekit libpam gnome-doc-utils gtk+ xrdb"
> =20
> -PR =3D "r15"
> +PR =3D "r16"
> =20
> -inherit gnome update-rc.d systemd
> +inherit gnome update-rc.d systemd useradd
> =20
>  SRC_URI +=3D " \
>              file://cross-xdetection.diff \
> @@ -33,8 +33,8 @@ do_configure_prepend() {
>  }
> =20
>  do_install_prepend() {
> -    mkdir -p ${D}/var/lib/gdm/.gconf.mandatory
> -    cp ${WORKDIR}/%gconf-tree.xml ${D}/var/lib/gdm/.gconf.mandatory/
> +    install -d ${D}/${localstatedir}/lib/gdm/.gconf.mandatory
> +    install ${WORKDIR}/%gconf-tree.xml ${D}/${localstatedir}/lib/gdm/.gc=
onf.mandatory/
>  }
> =20
>  do_install_append() {
> @@ -54,6 +54,9 @@ do_install_append() {
>      sed -e 's,%sbindir%,${sbindir},g' \
>          < ${WORKDIR}/gdm.service.in \
>          > ${D}${systemd_unitdir}/system/gdm.service
> +
> +    chown -R gdm:gdm ${D}${localstatedir}/lib/gdm
> +    chmod 0750 ${D}${localstatedir}/lib/gdm
>  }
> =20
>  FILES_${PN} +=3D "${datadir}/icon* \
> @@ -72,23 +75,13 @@ SYSTEMD_SERVICE_${PN} =3D "gdm.service"
>  INITSCRIPT_NAME =3D "gdm"
>  INITSCRIPT_PARAMS =3D "start 99 5 2 . stop 20 0 1 6 ."
> =20
> -pkg_postinst_${PN} () {
> -    # can't do this offline
> -    if [ "x$D" !=3D "x" ]; then
> -        exit 1
> -    fi
> -    grep "^gdm:" /etc/group > /dev/null || addgroup gdm
> -    grep "^gdm:" /etc/passwd > /dev/null || adduser --disabled-password =
--system --home /var/lib/gdm gdm --ingroup gdm -g gdm
> -
> -if [ -d /var/lib/gdm ]; then
> -    chown -R gdm:gdm /var/lib/gdm
> -    chmod 0750 /var/lib/gdm
> -fi
> +USERADD_PACKAGES =3D "${PN}"
> +USERADD_PARAM_${PN} =3D "--system --no-create-home --home ${localstatedi=
r}/lib/gdm --user-group gdm"
> =20
> +pkg_postinst_${PN} () {
>  # Register up as default dm
> -mkdir -p ${sysconfdir}/X11/
> -echo "${bindir}/gdm" > ${sysconfdir}/X11/default-display-manager
> -
> +mkdir -p $D${sysconfdir}/X11/
> +echo "${bindir}/gdm" > $D${sysconfdir}/X11/default-display-manager

Maybe we should use u-a for default-display-manager like we use x-window-ma=
nager for WMs.

but git grep display-manager shows only
meta-oe/recipes-graphics/nonworking/slim/slim_1.3.2.bb
doing the same as gdm

>  }
> =20
>  pkg_postrm_${PN} () {
> --=20
> 1.7.4.4
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--4VrXvz3cwkc87Wze
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlF8J38ACgkQN1Ujt2V2gBxgmACfddCxPQL1dfXMDa4ghBzqEA6q
9ocAoIPFCRN5IzVfbrFwVMjAseIb+v/x
=Kqbv
-----END PGP SIGNATURE-----

--4VrXvz3cwkc87Wze--
