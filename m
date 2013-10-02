Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f174.google.com (mail-ea0-f174.google.com
	[209.85.215.174])
	by mail.openembedded.org (Postfix) with ESMTP id 309066CC49;
	Wed,  2 Oct 2013 23:11:00 +0000 (UTC)
Received: by mail-ea0-f174.google.com with SMTP id z15so720718ead.33
	for <multiple recipients>; Wed, 02 Oct 2013 16:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=GAi+lqQa0jXVNkhwzYVYtXvejcHCWe1X7Yp8zpKLOiE=;
	b=rqzWmaLffP74v6UIaSa/epWbe93SIMOYzV8xEEr88ohAMr15Xu59nhuqX+hr/rq11X
	Qblr8S62xh4HnLvYEfVPqlxB7NNuPTqzwsA7F9E25/wZHwPb32l2zKnxBeXnd7nNOLpD
	kU311EEKVWxxvCmrG1AzjCpKQ10kOV95AhYAUJZMH7HRoyjPD/T3QbA8OwLI9TSHJKfg
	3YteIbnGPSeegsqMKn790fdW6bY2NQxTnIv5AqkwGihiQeXQVtty1a0UL3uwW2txmLOD
	wnRMca374TyOV9wBNpnQQNTvWUeG7XeHNp6qj/DbzRVvDrver6k3QVGe5G2/ehckUQIW
	ztvQ==
X-Received: by 10.15.54.199 with SMTP id t47mr7436108eew.46.1380755461591;
	Wed, 02 Oct 2013 16:11:01 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	bn13sm8651531eeb.11.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 02 Oct 2013 16:11:00 -0700 (PDT)
Date: Thu, 3 Oct 2013 01:11:05 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	Muhammad Shakeel <muhammad_shakeel@mentor.com>
Message-ID: <20131002231105.GA6240@jama>
References: <20130910220329.45CB15043D@opal>
MIME-Version: 1.0
In-Reply-To: <20130910220329.45CB15043D@opal>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Muhammad Shakeel : openssh: Add systemd support
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
X-List-Received-Date: Wed, 02 Oct 2013 23:11:01 -0000
X-Groupsio-MsgNum: 46429
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="AhhlLboLdkugWU4S"
Content-Disposition: inline

--AhhlLboLdkugWU4S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 10, 2013 at 10:03:29PM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: 6e6445d487c033913a29763f8e3a7a339d5b612d
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3D6e6445d487c033913a29763f8e3a7a339d5b612d
>=20
> Author: Muhammad Shakeel <muhammad_shakeel@mentor.com>
> Date:   Wed Sep  4 11:04:59 2013 +0000
>=20
> openssh: Add systemd support
>=20
> -Remove dependency on meta-systemd
>=20
> Signed-off-by: Muhammad Shakeel <muhammad_shakeel@mentor.com>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>=20
> ---
>=20
>  .../openssh/openssh-6.2p2/sshd.socket              |   11 +++++++++++
>  .../openssh/openssh-6.2p2/sshd@.service            |    9 +++++++++
>  .../openssh/openssh-6.2p2/sshdgenkeys.service      |   10 ++++++++++
>  meta/recipes-connectivity/openssh/openssh_6.2p2.bb |   19 ++++++++++++++=
+++--
>  4 files changed, 47 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-connectivity/openssh/openssh_6.2p2.bb b/meta/re=
cipes-connectivity/openssh/openssh_6.2p2.bb
> index c76f9ac..3a7f50d 100644
> --- a/meta/recipes-connectivity/openssh/openssh_6.2p2.bb
> +++ b/meta/recipes-connectivity/openssh/openssh_6.2p2.bb
> @@ -26,14 +26,17 @@ SRC_URI =3D "ftp://ftp.openbsd.org/pub/OpenBSD/OpenSS=
H/portable/openssh-${PV}.tar.
>             file://init \
>             file://openssh-CVE-2011-4327.patch \
>             file://mac.patch \
> -           ${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', =
'', d)}"
> +           ${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', =
'', d)} \
> +           file://sshd.socket \
> +           file://sshd@.service \
> +           file://sshdgenkeys.service "
> =20
>  PAM_SRC_URI =3D "file://sshd"
> =20
>  SRC_URI[md5sum] =3D "be46174dcbb77ebb4ea88ef140685de1"
>  SRC_URI[sha256sum] =3D "7f29b9d2ad672ae0f9e1dcbff871fc5c2e60a194e90c7664=
32e32161b842313b"
> =20
> -inherit useradd update-rc.d update-alternatives
> +inherit useradd update-rc.d update-alternatives systemd
> =20
>  USERADD_PACKAGES =3D "${PN}-sshd"
>  USERADD_PARAM_${PN}-sshd =3D "--system --no-create-home --home-dir /var/=
run/sshd --shell /bin/false --user-group sshd"
> @@ -41,6 +44,9 @@ INITSCRIPT_PACKAGES =3D "${PN}-sshd"
>  INITSCRIPT_NAME_${PN}-sshd =3D "sshd"
>  INITSCRIPT_PARAMS_${PN}-sshd =3D "defaults 9"
> =20
> +SYSTEMD_PACKAGES =3D "${PN}-sshd"
> +SYSTEMD_SERVICE_${PN}-sshd =3D "sshd.socket sshd@.service sshdgenkeys.se=
rvice"

Is it correct to use sshd@.service here?

meta-systemd .bbappend had only sshd.socket:
-SYSTEMD_PACKAGES =3D "${PN}-sshd"
-SYSTEMD_SERVICE_${PN}-sshd =3D "sshd.socket"

(re)starting sshd@service from postinst is failing with:
SHR root@pjama /etc $ bash -x /var/lib/opkg/info/openssh-sshd.postinst
+ OPTS=3D
+ '[' -n '' ']'
+ type systemctl
+ systemctl enable sshd.socket sshd@.service sshdgenkeys.service
+ '[' -z '' -a enable =3D enable ']'
+ systemctl restart sshd.socket sshd@.service sshdgenkeys.service
Failed to issue method call: Unit name sshd@.service is not valid.


> +
>  PACKAGECONFIG ??=3D "tcp-wrappers"
>  PACKAGECONFIG[tcp-wrappers] =3D "--with-tcp-wrappers,,tcp-wrappers"
> =20
> @@ -93,6 +99,15 @@ do_install_append () {
>  	echo "HostKey /var/run/ssh/ssh_host_rsa_key" >> ${D}${sysconfdir}/ssh/s=
shd_config_readonly
>  	echo "HostKey /var/run/ssh/ssh_host_dsa_key" >> ${D}${sysconfdir}/ssh/s=
shd_config_readonly
>  	echo "HostKey /var/run/ssh/ssh_host_ecdsa_key" >> ${D}${sysconfdir}/ssh=
/sshd_config_readonly
> +
> +	install -d ${D}${systemd_unitdir}/system
> +	install -c -m 0644 ${WORKDIR}/sshd.socket ${D}${systemd_unitdir}/system
> +	install -c -m 0644 ${WORKDIR}/sshd@.service ${D}${systemd_unitdir}/syst=
em
> +	install -c -m 0644 ${WORKDIR}/sshdgenkeys.service ${D}${systemd_unitdir=
}/system
> +	sed -i -e 's,@BASE_BINDIR@,${base_bindir},g' \
> +		-e 's,@SBINDIR@,${sbindir},g' \
> +		-e 's,@BINDIR@,${bindir},g' \
> +		${D}${systemd_unitdir}/system/sshd.socket ${D}${systemd_unitdir}/syste=
m/*.service
>  }
> =20
>  ALLOW_EMPTY_${PN} =3D "1"
>=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--AhhlLboLdkugWU4S
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlJMqAkACgkQN1Ujt2V2gBzH8wCgnC1ICSBC9ahhGB15Nbe4JZyw
JkoAoJPxfjG8IVrbagMPuVHQxDFwpBYc
=rT25
-----END PGP SIGNATURE-----

--AhhlLboLdkugWU4S--
