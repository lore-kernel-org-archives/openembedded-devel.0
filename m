Received: from mail-pd0-f174.google.com ([209.85.192.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UR2EU-0002Kj-W8
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Apr 2013 17:19:19 +0200
Received: by mail-pd0-f174.google.com with SMTP id p12so1846063pdj.5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Apr 2013 08:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=R7J+JVljqwoggtZQWUpjLLApD/0+5cJLLi55aUxP95c=;
	b=GZelpzCXMCFQxKMbJ46UFNG2e172PPXLHMlh7H9Yg4j7Js5cG2SqQXwJboSlK4EdiN
	DnAO9S3AjC41eHCUmjDa4V2EpT48GShZ6PcCRiR6GLymJS2RRo1CWUJ7aIcLKZ98yVkr
	t3dISMadcr9meZpPbxeW21SGdR89KG3ve46hNoNZGLXrEcF5l5FgfnM+OuEQLe8Uhtbt
	lshNSqh5J0SpaESqB8R/u5XC69AyFpdeSPvCzqBQeskI+63QqutMssCRdxQc3pDUl82r
	kbhw2m8McpFr+kZ927R306y7BzKhYNatI5t+5RI5U0sHKHGKaeNTAzFWq1eefh7IQ9C1
	dXvg==
X-Received: by 10.68.41.8 with SMTP id b8mr20547685pbl.102.1365865308293;
	Sat, 13 Apr 2013 08:01:48 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id yp2sm14136868pab.10.2013.04.13.08.01.45
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sat, 13 Apr 2013 08:01:47 -0700 (PDT)
Date: Sat, 13 Apr 2013 17:01:43 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130413150142.GH2477@jama>
References: <1360956138-30930-1-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1360956138-30930-1-git-send-email-raj.khem@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-networking][meta-systemd][PATCH] ntp: Create a separate package for sntp
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
X-List-Received-Date: Sat, 13 Apr 2013 15:19:28 -0000
X-Groupsio-MsgNum: 44150
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zuGyJ7KNSMOGsxcs"
Content-Disposition: inline

--zuGyJ7KNSMOGsxcs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 15, 2013 at 11:22:18AM -0800, Khem Raj wrote:
> sntp provides the functionality of obsoleted ntpdate
> so we have option of using ntpd as well as sntp
> sntp does the immediate one time sync with time
> server and corrects the tme immediately. it
> replaces ntpdate nicely.

Can you rebase this change on top of contrib/jansa/in-test and address
Paul's comment, when you have time?

Thanks

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
>=20
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
> index 0000000..9529cdf
> --- /dev/null
> +++ b/meta-systemd/meta-networking/recipes-support/ntp/ntp/sntp
> @@ -0,0 +1 @@
> +NTPSERVER=3D"pool.ntp.org"
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
> index 4580cf7..d9715bd 100644
> --- a/meta-systemd/meta-networking/recipes-support/ntp/ntp_4.2.6p5.bbappe=
nd
> +++ b/meta-systemd/meta-networking/recipes-support/ntp/ntp_4.2.6p5.bbappe=
nd
> @@ -4,19 +4,26 @@ PRINC :=3D "${@int(PRINC) + 1}"
> =20
>  FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
> =20
> -SYSTEMD_PACKAGES =3D "${PN} ntpdate"
> +SYSTEMD_PACKAGES =3D "${PN} ntpdate sntp"
>  SYSTEMD_SERVICE_${PN} =3D "ntpd.service"
> +SYSTEMD_SERVICE_sntp =3D "sntp.service"
>  SYSTEMD_SERVICE_ntpdate =3D "ntpdate.service"
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

--zuGyJ7KNSMOGsxcs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFpc1YACgkQN1Ujt2V2gBxe2QCdFBF6HqsAsgEysy3dLZ+Lk3xX
XvMAn1YmXJXV3GhY1LmOqaMnBvsKnQ+a
=s3zr
-----END PGP SIGNATURE-----

--zuGyJ7KNSMOGsxcs--
