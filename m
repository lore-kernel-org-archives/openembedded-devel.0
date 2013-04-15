Received: from mail-ee0-f51.google.com ([74.125.83.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1URkRE-00014q-FZ
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Apr 2013 16:31:28 +0200
Received: by mail-ee0-f51.google.com with SMTP id c4so2226962eek.38
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Apr 2013 07:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=JiWtdgR2DIHAi1qI2ga/q6uU58opJO4fslH3jnQI3Ho=;
	b=zyH/FezgTurcjtIn6WUjbBW85cRyyL2F9meetC3WhoD06hz5ON9karFa8L4AXzYjHQ
	g04pHVdmt3WPA1Pzv1j0lz9bOt/QBEB4VkGu8t8m56VqsDVNR5PFBAnitkapav60uE7e
	c4fwWpS2h3MOvv4iQQ7KthKOH/nFKGFL3UCqPJvsZ88ZNPA02zZKjnnMhFwQeIdKhar7
	eEIJNyt4sE2LrDKdhT2a0fUHokIUvQnt92U9iu8zJMwjHduGCc2aWJzWFqFCz0f/rkOS
	uPeMddTvVLEnTn4z2T3AFxwBAOYPFtWpLxl+USljogfTXigRafyBOhqHwgP2Acc/X4Ml
	XGjQ==
X-Received: by 10.15.22.76 with SMTP id e52mr63026997eeu.7.1366035228218;
	Mon, 15 Apr 2013 07:13:48 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id x42sm7812884eee.0.2013.04.15.07.13.46
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 15 Apr 2013 07:13:46 -0700 (PDT)
Date: Mon, 15 Apr 2013 16:13:53 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130415141353.GD10628@jama.dyndns-home.com>
References: <1366033969-21963-1-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1366033969-21963-1-git-send-email-raj.khem@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-systemd][PATCH] ntp: Create a separate package for sntp
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
X-List-Received-Date: Mon, 15 Apr 2013 14:31:34 -0000
X-Groupsio-MsgNum: 44200
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xB0nW4MQa6jZONgY"
Content-Disposition: inline

--xB0nW4MQa6jZONgY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 15, 2013 at 06:52:49AM -0700, Khem Raj wrote:
> sntp provides the functionality of obsoleted ntpdate
> so we have option of using ntpd as well as sntp
> sntp does the immediate one time sync with time
> server and corrects the tme immediately. it
> replaces ntpdate nicely.
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-networking/recipes-support/ntp/ntp.inc        |    3 ++-
>  .../meta-networking/recipes-support/ntp/ntp/sntp   |    1 +
>  .../recipes-support/ntp/ntp/sntp.service           |   11 +++++++++++
>  .../recipes-support/ntp/ntp_4.2.6p5.bbappend       |    9 ++++++++-
>  4 files changed, 22 insertions(+), 2 deletions(-)
>  create mode 100644 meta-systemd/meta-networking/recipes-support/ntp/ntp/=
sntp
>  create mode 100644 meta-systemd/meta-networking/recipes-support/ntp/ntp/=
sntp.service

It shouldn't create new .bbappends in meta-systemd.

> diff --git a/meta-networking/recipes-support/ntp/ntp.inc b/meta-networkin=
g/recipes-support/ntp/ntp.inc
> index d93f22d..cec0f22 100644
> --- a/meta-networking/recipes-support/ntp/ntp.inc
> +++ b/meta-networking/recipes-support/ntp/ntp.inc
> @@ -54,7 +54,7 @@ do_install_append() {
>  	ln -s ${bindir}/ntpdate-sync ${D}/${sysconfdir}/network/if-up.d
>  }
> =20
> -PACKAGES +=3D "ntpdate ${PN}-tickadj ${PN}-utils"
> +PACKAGES +=3D "ntpdate sntp ${PN}-tickadj ${PN}-utils"
>  # NOTE: you don't need ntpdate, use "ntpd -q -g -x"
> =20
>  # ntp originally includes tickadj. It's split off for inclusion in small=
 firmware images on platforms
> @@ -69,6 +69,7 @@ RSUGGESTS_${PN} =3D "iana-etc"
> =20
>  FILES_${PN} =3D "${bindir}/ntpd ${sysconfdir}/ntp.conf ${sysconfdir}/ini=
t.d/ntpd ${sbindir} ${libdir}"
>  FILES_${PN}-tickadj =3D "${bindir}/tickadj"
> +FILES_sntp =3D "${bindir}/sntp"
>  FILES_${PN}-utils =3D "${bindir}"
>  FILES_ntpdate =3D "${bindir}/ntpdate ${sysconfdir}/network/if-up.d/ntpda=
te-sync ${bindir}/ntpdate-sync ${sysconfdir}/default/ntpdate"
> =20
> diff --git a/meta-systemd/meta-networking/recipes-support/ntp/ntp/sntp b/=
meta-systemd/meta-networking/recipes-support/ntp/ntp/sntp
> new file mode 100644
> index 0000000..f8c5895
> --- /dev/null
> +++ b/meta-systemd/meta-networking/recipes-support/ntp/ntp/sntp
> @@ -0,0 +1 @@
> +NTPSERVER=3D"ntpserver.example.org"
> diff --git a/meta-systemd/meta-networking/recipes-support/ntp/ntp/sntp.se=
rvice b/meta-systemd/meta-networking/recipes-support/ntp/ntp/sntp.service
> new file mode 100644
> index 0000000..0f09e43
> --- /dev/null
> +++ b/meta-systemd/meta-networking/recipes-support/ntp/ntp/sntp.service
> @@ -0,0 +1,11 @@
> +[Unit]
> +Description=3DSimple Network Time Service Client
> +After=3Dnetwork.target
> +
> +[Service]
> +Type=3Doneshot
> +EnvironmentFile=3D-/etc/default/sntp
> +ExecStart=3D/usr/bin/sntp -s $NTPSERVER
> +
> +[Install]
> +WantedBy=3Dmulti-user.target
> diff --git a/meta-systemd/meta-networking/recipes-support/ntp/ntp_4.2.6p5=
=2Ebbappend b/meta-systemd/meta-networking/recipes-support/ntp/ntp_4.2.6p5.=
bbappend
> index 7f2a796..c34bc96 100644
> --- a/meta-systemd/meta-networking/recipes-support/ntp/ntp_4.2.6p5.bbappe=
nd
> +++ b/meta-systemd/meta-networking/recipes-support/ntp/ntp_4.2.6p5.bbappe=
nd
> @@ -4,8 +4,9 @@ PRINC :=3D "${@int(PRINC) + 2}"
> =20
>  FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
> =20
> -SYSTEMD_PACKAGES =3D "${PN} ntpdate"
> +SYSTEMD_PACKAGES =3D "${PN} ntpdate sntp"
>  SYSTEMD_SERVICE_${PN} =3D "ntpd.service"
> +SYSTEMD_SERVICE_sntp =3D "sntp.service"
>  SYSTEMD_SERVICE_ntpdate =3D "ntpdate.service"
>  RPROVIDES_${PN} +=3D "${PN}-systemd"
>  RREPLACES_${PN} +=3D "${PN}-systemd"
> @@ -15,14 +16,20 @@ RREPLACES_ntpdate +=3D "ntpdate-systemd"
>  RCONFLICTS_ntpdate +=3D "ntpdate-systemd"
> =20
>  FILES_ntpdate +=3D "${systemd_unitdir}/system/ntpdate.service"
> +FILES_sntp +=3D "${sysconfdir}/default/sntp"
> =20
>  SRC_URI +=3D " \
>  	file://ntpdate.service \
>          file://ntpd.service \
> +        file://sntp.service \
> +        file://sntp \
>  "
> =20
>  do_install_append() {
>  	install -d ${D}${systemd_unitdir}/system
> +	install -d ${D}${sysconfdir}/default
>  	install -m 0644 ${WORKDIR}/ntpdate.service ${D}${systemd_unitdir}/syste=
m/
>  	install -m 0644 ${WORKDIR}/ntpd.service ${D}${systemd_unitdir}/system/
> +	install -m 0644 ${WORKDIR}/sntp.service ${D}${systemd_unitdir}/system/
> +	install -m 0644 ${WORKDIR}/sntp ${D}${sysconfdir}/default/
>  }
> --=20
> 1.7.9.5
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--xB0nW4MQa6jZONgY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFsCyEACgkQN1Ujt2V2gBzO2QCgk59Yg6Rxay5PyUNUm4LaLDBq
TbcAn0SGNkzJALby0bA5jUHaAppM9UG/
=5UTv
-----END PGP SIGNATURE-----

--xB0nW4MQa6jZONgY--
