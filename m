Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f177.google.com (mail-we0-f177.google.com
	[74.125.82.177])
	by mail.openembedded.org (Postfix) with ESMTP id 28D7B65CD0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Mar 2015 12:05:46 +0000 (UTC)
Received: by wegp1 with SMTP id p1so5917115weg.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Mar 2015 05:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=QSuneEv6s6KP28rC6N4TLpCxL6akTQmGUUSYPNxLZdU=;
	b=jQfGJuoqQqzIgZjRPqREb2GQW9g5IGMNfvYuq9zQLg4m8C16JtzJ1s+tjsdlcJXuZP
	7gf9zHp8ewO+VRe/qqMkBOepN5EpQBU0qMMzqvNrNNdyyLZNZd0d7ryBGZuzni/7B1Gy
	ajl3/3rUIKcf8CV1H5ntSbhd00mroaareQO30zlRQYdQGQ3gvsBNqyUco/Kc0TtFbtob
	tcmaR+4ELAmRl/GiVRa2A+4qaSLj74I9OEr1jJLY0+6fM3XqIiR70xb1OYFaccxQCA7m
	7U8XYR0irEdY8hxTLwRaibLZ5l7bW8msJy7l1WqaIfRRkmk0gBz6rc5BJFdd23BPKR25
	3tUg==
X-Received: by 10.195.12.71 with SMTP id eo7mr134207891wjd.3.1426593947381;
	Tue, 17 Mar 2015 05:05:47 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	n3sm19659737wja.36.2015.03.17.05.05.46
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Mar 2015 05:05:46 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 17 Mar 2015 13:05:52 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150317120552.GA4738@jama>
References: <1426528097-14698-1-git-send-email-kaiu@gmx.de>
MIME-Version: 1.0
In-Reply-To: <1426528097-14698-1-git-send-email-kaiu@gmx.de>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: kulrich <ulrich.kai@gmail.com>
Subject: Re: [meta-oe][PATCH] Add smstools3 http://smstools3.kekekasvi.com to meta-oe recipes-connectivity.
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
X-List-Received-Date: Tue, 17 Mar 2015 12:05:51 -0000
X-Groupsio-MsgNum: 54812
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PEIAKu/WMn1b1Hv9"
Content-Disposition: inline

--PEIAKu/WMn1b1Hv9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


subject should start with smstools3:

On Mon, Mar 16, 2015 at 06:48:17PM +0100, Kai Ulrich wrote:
> From: kulrich <ulrich.kai@gmail.com>
>=20
> Signed-off-by: kulrich <ulrich.kai@gmail.com>
> ---
>  .../smstools3/sms_binpath_and_psops.patch          | 19 ++++++++++
>  .../smstools3/smstools3_3.1.15.bb                  | 44 ++++++++++++++++=
++++++
>  2 files changed, 63 insertions(+)
>  create mode 100644 meta-oe/recipes-connectivity/smstools3/smstools3/sms_=
binpath_and_psops.patch
>  create mode 100644 meta-oe/recipes-connectivity/smstools3/smstools3_3.1.=
15.bb
>=20
> diff --git a/meta-oe/recipes-connectivity/smstools3/smstools3/sms_binpath=
_and_psops.patch b/meta-oe/recipes-connectivity/smstools3/smstools3/sms_bin=
path_and_psops.patch
> new file mode 100644
> index 0000000..ffcaa09
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/smstools3/smstools3/sms_binpath_and_ps=
ops.patch
> @@ -0,0 +1,19 @@
> +Index: smstools3/scripts/sms3
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- smstools3.orig/scripts/sms3	2010-05-04 11:21:44.000000000 +0200
> ++++ smstools3/scripts/sms3	2015-02-22 20:05:51.615074469 +0100
> +@@ -24,11 +24,11 @@
> + # Logfile can also be defined in here:
> + LOGFILE=3D"/var/log/smsd.log"
> +=20
> +-DAEMON=3D/usr/local/bin/smsd
> ++DAEMON=3D/usr/bin/smsd
> + # A program which turns power off for couple of seconds:
> +-RESETMODEMS=3D/usr/local/bin/smsd_resetmodems
> ++RESETMODEMS=3D/usr/bin/smsd_resetmodems
> + NAME=3Dsmsd
> +-PSOPT=3D"-e"
> ++PSOPT=3D""
> + ECHO=3Decho
> + case `uname` in
> +   *BSD|Darwin)
> diff --git a/meta-oe/recipes-connectivity/smstools3/smstools3_3.1.15.bb b=
/meta-oe/recipes-connectivity/smstools3/smstools3_3.1.15.bb
> new file mode 100644
> index 0000000..55a2583
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/smstools3/smstools3_3.1.15.bb
> @@ -0,0 +1,44 @@
> +SUMMARY =3D "The SMS Server Tools 3 is a SMS Gateway software which can =
send and receive short messages through GSM modems and mobile phones."

SUMMARY should be short, split to SUMMARY and DESCRIPTION.

> +SECTION =3D "network"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D4d21efa1bb2a186360dde4035f860=
682"
> +HOMEPAGE =3D "http://smstools3.kekekasvi.com"
> +
> +SRC_URI =3D "http://smstools3.kekekasvi.com/packages/${PN}-${PV}.tar.gz \

${PN}-${PV} -> ${BP}

> +           file://sms_binpath_and_psops.patch"
> +
> +SRC_URI[md5sum] =3D "0241ef60e646fac1a06254a848e61ed7"
> +SRC_URI[sha256sum] =3D "ed00ffaeaa312a5b4f969f4e97a64603a866bbe16e393ea0=
2f5bf05234814d59"
> +
> +
> +S =3D "${WORKDIR}/${PN}"
> +
> +RDEPENDS_${PN} =3D " bash "

drop unnecessary spaces around bash.

> +INITSCRIPT_NAME =3D "sms3"
> +INITSCRIPT_PARAMS =3D "defaults"
> +
> +inherit update-rc.d
> +
> +do_install () {
> +=09
> +	install -d ${D}${bindir}=09
> +	install -m 755 ${S}/src/smsd "${D}${bindir}/smsd"
> +=09
> +	install -m 755 ${S}/scripts/sendsms "${D}${bindir}/sendsms"
> +	install -m 755 ${S}/scripts/sms2html "${D}${bindir}/sms2html"
> +	install -m 755 ${S}/scripts/sms2unicode "${D}${bindir}/sms2unicode"=20
> +	install -m 755 ${S}/scripts/unicode2sms "${D}${bindir}/unicode2sms"
> +
> +	install -d ${D}${sysconfdir}=09
> +	install -m 644 ${S}/examples/smsd.conf.easy "${D}${sysconfdir}/smsd.con=
f"
> +
> +	install -d "${D}${localstatedir}/spool"
> +	install -d "${D}${localstatedir}/spool/sms"
> +	install -d "${D}${localstatedir}/spool/sms/incoming"
> +	install -d "${D}${localstatedir}/spool/sms/outgoing"
> +	install -d "${D}${localstatedir}/spool/sms/checked"
> +
> +	install -d ${D}${sysconfdir}/init.d
> +	install -m 755 ${S}/scripts/sms3 "${D}${sysconfdir}/init.d/${INITSCRIPT=
_NAME}"
> +
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

--PEIAKu/WMn1b1Hv9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlUIGKAACgkQN1Ujt2V2gBxfZQCeJaIQB3XVCxaqW7ARggHQi/4I
XdMAoIXCsJzPKia3qBppzvI0623iW9jW
=SWmM
-----END PGP SIGNATURE-----

--PEIAKu/WMn1b1Hv9--
