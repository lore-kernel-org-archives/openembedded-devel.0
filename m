Received: from mail-ea0-f181.google.com ([209.85.215.181])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UROWx-0004wg-Di
	for openembedded-devel@lists.openembedded.org;
	Sun, 14 Apr 2013 17:08:13 +0200
Received: by mail-ea0-f181.google.com with SMTP id z10so1802736ead.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Apr 2013 07:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=nzzNMawCFNqM1ka5iy+354EYoIe2b4R/mywoZt0qox4=;
	b=y1J0LvTUCAOB60TbXXcVNWQaWYLjgP5J+aiKjEocP4QltM5jr+UW7g7dkT8mifcusI
	/bn+cvnrPsY5cIrOMs+/J+wXovKXk7ekOgZKFeIcWupTn8d463W2UpT7KZEten1Mmxej
	IUfOcULUeHH00Vfx2vX0Lt73ndO9gwfCinLMS72VSDjoJ1GMBM64Dpp/EHLvhGHWSfHM
	urKLAr2mukJ3gAQU8qeYy3a5w9Y228GirvlXc/u5F3S6DrcWLQ8EDSvrcOhcKdxmdsun
	Kot/JtXEgNRWfXfPsPR3C+SA6mktKyj3Xz/9zSjBsAZeKjSAt4rbD74mnkPEqnSWNEb0
	vnbA==
X-Received: by 10.14.215.193 with SMTP id e41mr32608735eep.32.1365951020242;
	Sun, 14 Apr 2013 07:50:20 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id cd3sm21896025eeb.6.2013.04.14.07.50.19
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sun, 14 Apr 2013 07:50:19 -0700 (PDT)
Date: Sun, 14 Apr 2013 16:50:24 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130414145024.GB2475@jama>
References: <1365859790-20947-1-git-send-email-Martin.Jansa@gmail.com>
	<1365859790-20947-7-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1365859790-20947-7-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-systemd][PATCH 07/33] gdm: move systemd support from meta-systemd back to meta-gnome
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
X-List-Received-Date: Sun, 14 Apr 2013 15:08:27 -0000
X-Groupsio-MsgNum: 44161
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="b5gNqxB1S1yM7hjW"
Content-Disposition: inline

--b5gNqxB1S1yM7hjW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 13, 2013 at 03:29:24PM +0200, Martin Jansa wrote:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  .../recipes-gnome/gdm/gdm                            |  0
>  meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb           | 17 +++++++++++---=
---
>  .../meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bbappend | 20 --------------=
------
>  3 files changed, 11 insertions(+), 26 deletions(-)
>  rename meta-systemd/meta-gnome/recipes-gnome/gdm/gdm/gdm.service.in =3D>=
 meta-gnome/recipes-gnome/gdm/gdm (100%)
>  delete mode 100644 meta-systemd/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.=
bbappend
>=20
> diff --git a/meta-systemd/meta-gnome/recipes-gnome/gdm/gdm/gdm.service.in=
 b/meta-gnome/recipes-gnome/gdm/gdm
> similarity index 100%
> rename from meta-systemd/meta-gnome/recipes-gnome/gdm/gdm/gdm.service.in
> rename to meta-gnome/recipes-gnome/gdm/gdm

#       renamed:    gdm -> gdm/gdm.service.in

In my local branch

> diff --git a/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb b/meta-gnome/reci=
pes-gnome/gdm/gdm_2.32.2.bb
> index 863db2e..45bddc8 100644
> --- a/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb
> +++ b/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb
> @@ -4,9 +4,9 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba3=
6caa9b7df079bae19f"
> =20
>  DEPENDS =3D "xinput gnome-panel tcp-wrappers libcanberra libxklavier gre=
p consolekit libpam gnome-doc-utils gtk+ xrdb"
> =20
> -PR =3D "r10"
> +PR =3D "r15"
> =20
> -inherit gnome update-rc.d
> +inherit gnome update-rc.d systemd
> =20
>  SRC_URI +=3D " \
>              file://cross-xdetection.diff \
> @@ -17,6 +17,7 @@ SRC_URI +=3D " \
>              file://gdm.conf \
>              file://gdm-pam \
>              file://Default \
> +            file://gdm.service.in \
>             "
> =20
>  SRC_URI[archive.md5sum] =3D "dbe5187a2e17881cc454e313e0ae8d1e"
> @@ -49,6 +50,10 @@ do_install_append() {
>  	install -d ${D}/${sysconfdir}/gdm/Init
>  	install -m 0755 ${WORKDIR}/Default ${D}/${sysconfdir}/gdm/Init
> =20
> +	install -d ${D}${systemd_unitdir}/system
> +	sed -e 's,%sbindir%,${sbindir},g' \
> +		< ${WORKDIR}/gdm.service.in \
> +		> ${D}${systemd_unitdir}/system/gdm.service
>  }
> =20
>  FILES_${PN} +=3D "${datadir}/icon* \
> @@ -60,6 +65,10 @@ RDEPENDS_${PN} +=3D "grep dbus-x11 shadow"
>  CONFFILES_${PN} +=3D "${sysconfdir}/gdm/gdm.conf ${sysconfdir}/init.d/gd=
m"
>  RRECOMMENDS_${PN} +=3D "openssh-misc desktop-file-utils glib-2.0-utils m=
etacity gnome-session polkit-gnome consolekit"
> =20
> +RREPLACES_${PN} +=3D "${PN}-systemd"
> +RCONFLICTS_${PN} +=3D "${PN}-systemd"
> +SYSTEMD_SERVICE_${PN} =3D "gdm.service"
> +
>  INITSCRIPT_NAME =3D "gdm"
>  INITSCRIPT_PARAMS =3D "start 99 5 2 . stop 20 0 1 6 ."
> =20
> @@ -87,7 +96,3 @@ pkg_postrm_${PN} () {
>      delgroup gdm || true
>  	sed -i /gdm/d ${sysconfdir}/X11/default-display-manager || true
>  }
> -
> -
> -
> -
> diff --git a/meta-systemd/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bbappen=
d b/meta-systemd/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bbappend
> deleted file mode 100644
> index 6201352..0000000
> --- a/meta-systemd/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bbappend
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -# look for files in the layer first
> -FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
> -
> -PRINC :=3D "${@int(PRINC) + 4}"
> -
> -inherit systemd
> -
> -SRC_URI +=3D "file://gdm.service.in"
> -
> -do_install_append() {
> -	install -d ${D}${systemd_unitdir}/system
> -	sed -e 's,%sbindir%,${sbindir},g' \
> -		< ${WORKDIR}/gdm.service.in \
> -		> ${D}${systemd_unitdir}/system/gdm.service
> -}
> -
> -RPROVIDES_${PN} +=3D "${PN}-systemd"
> -RREPLACES_${PN} +=3D "${PN}-systemd"
> -RCONFLICTS_${PN} +=3D "${PN}-systemd"
> -SYSTEMD_SERVICE_${PN} =3D "gdm.service"
> --=20
> 1.8.1.5
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--b5gNqxB1S1yM7hjW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFqwjAACgkQN1Ujt2V2gBxOygCcCBFOLri7gr/PjEVQZYuCoLjr
Td4AnijxxVW4Drdmy9NXjfLW7LMvCXYB
=os9X
-----END PGP SIGNATURE-----

--b5gNqxB1S1yM7hjW--
