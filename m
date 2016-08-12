Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id B69846014F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Aug 2016 12:08:20 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id i138so2480808wmf.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Aug 2016 05:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=32CjWf+OBJNXeiAEUAOWCe/CvuQuyGmOghfFIyFNkxA=;
	b=KQXES/8CzQynq2yZF6LYeS7YyFMAgbwCv7Q8pyytYo7Fa8g6+UWlKcVt/m8jm4bxpE
	jPM8jiObbhObT4H8pOYDmUTxmXzwEBBGl7i+7P4RoDFWar/DwVzs3UylNiEUN8OOsoHj
	iCq69Qjp1FcydEiJI0PHHcMIliaxRFyWrQp9f2uklqiC8dPutlmDlTBvl0AEtzrhjlp9
	uawhcWVxPF+0Iw+cnYWZjpt47Mk6+v0fgjqstGV2MsIRVuydOxQ6cDX3jxsq1kBTOD2p
	bmyxKdv1FhltFOvllB/o4y1Lb0yPIgpLt4vvG9VqBsFUuZHHRbQs50huQv6cxZ+8wISx
	xMVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=32CjWf+OBJNXeiAEUAOWCe/CvuQuyGmOghfFIyFNkxA=;
	b=dwDQNkVlCrL4HM6qJeAa8leTurFApmsV5/2ev0Yy5yz7McoGje+g2X60sUyDi822Xz
	erUDMsjrSVOe73noO6gSRbYqeBvLfKMQAAF364dGMpB9QAPQVlOT9licxGUwtjm1Gi44
	Hdrj6PndoX01BDk3Rf6xzzu8giDxHk5+/E00TmUW84/3fs4DjMt7LSHv4bRcWohtcuG7
	DcVkcvp5yUKtc1Jg9WdW7KyeplAtAzuH9UvzGn1Eorq5ywyJVu/WD88JmXPlD/A5LNze
	tMhPXzavgkC3wZELD/84lOWOqm1CdEzM65c68XrNkBeYnbXCjlc6k1ZylHKAj3KzP0Jn
	IFQA==
X-Gm-Message-State: AEkooutX3Yxjo4y73pbaMj04gALoKuLDXRFQRfEUwIHle9GOcNRYZbEY3Yf2csmeve8VNQ==
X-Received: by 10.194.98.139 with SMTP id ei11mr14805362wjb.19.1471003700676; 
	Fri, 12 Aug 2016 05:08:20 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169])
	by smtp.gmail.com with ESMTPSA id e65sm2311913wmg.3.2016.08.12.05.08.19
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 12 Aug 2016 05:08:19 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 12 Aug 2016 14:08:21 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160812120821.benxeb6zhtyiyiom@jama>
References: <1470924479-18304-1-git-send-email-terry.boese@vecima.com>
MIME-Version: 1.0
In-Reply-To: <1470924479-18304-1-git-send-email-terry.boese@vecima.com>
User-Agent: Mutt/1.6.2 (2016-06-11)
Subject: Re: [meta-networking][PATCH v2] dnsmasq: update to version 2.76
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
X-List-Received-Date: Fri, 12 Aug 2016 12:08:22 -0000
X-Groupsio-MsgNum: 62578
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pn5nn6tazaz3suwo"
Content-Disposition: inline

--pn5nn6tazaz3suwo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 11, 2016 at 08:07:59AM -0600, Terry Boese wrote:
> Change 'basecontains' to 'bb.utils.contain' to avoid warning.

That was already changed 4 months ago, please rebase and test in recent
master before sending.

> Correct do_compile_append(), as the location of the DHCP lease
> tools has changed.
>=20
> Signed-off-by: Terry Boese <terry.boese@vecima.com>
> ---
>  meta-networking/recipes-support/dnsmasq/dnsmasq.inc    | 18 +++++++++---=
------
>  .../dnsmasq/{dnsmasq_2.75.bb =3D> dnsmasq_2.76.bb}       |  5 ++---
>  2 files changed, 11 insertions(+), 12 deletions(-)
>  rename meta-networking/recipes-support/dnsmasq/{dnsmasq_2.75.bb =3D> dns=
masq_2.76.bb} (27%)
>=20
> diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq.inc b/meta-n=
etworking/recipes-support/dnsmasq/dnsmasq.inc
> index cc7f9e3..9ef54fe 100644
> --- a/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
> +++ b/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
> @@ -26,10 +26,10 @@ PACKAGECONFIG[conntrack] =3D ",,libnetfilter-conntrac=
k"
>  PACKAGECONFIG[lua] =3D ",,lua"
>  PACKAGECONFIG[resolvconf] =3D ",,,resolvconf"
>  EXTRA_OEMAKE =3D "\
> -    'COPTS=3D${@base_contains('PACKAGECONFIG', 'dbus', '-DHAVE_DBUS', ''=
, d)} \
> -           ${@base_contains('PACKAGECONFIG', 'idn', '-DHAVE_IDN', '', d)=
} \
> -           ${@base_contains('PACKAGECONFIG', 'conntrack', '-DHAVE_CONNTR=
ACK', '', d)} \
> -           ${@base_contains('PACKAGECONFIG', 'lua', '-DHAVE_LUASCRIPT', =
'', d)}' \
> +    'COPTS=3D${@bb.utils.contains('PACKAGECONFIG', 'dbus', '-DHAVE_DBUS'=
, '', d)} \
> +           ${@bb.utils.contains('PACKAGECONFIG', 'idn', '-DHAVE_IDN', ''=
, d)} \
> +           ${@bb.utils.contains('PACKAGECONFIG', 'conntrack', '-DHAVE_CO=
NNTRACK', '', d)} \
> +           ${@bb.utils.contains('PACKAGECONFIG', 'lua', '-DHAVE_LUASCRIP=
T', '', d)}' \
>      'CFLAGS=3D${CFLAGS}' \
>      'LDFLAGS=3D${LDFLAGS}' \
>  "
> @@ -38,7 +38,7 @@ SRC_URI +=3D "${@bb.utils.contains('PACKAGECONFIG', 're=
solvconf', 'file://dnsmasq.
> =20
>  do_compile_append() {
>      # build dhcp_release
> -    cd ${S}/contrib/wrt
> +    cd ${S}/contrib/lease-tools
>      oe_runmake
>  }
> =20
> @@ -53,19 +53,19 @@ do_install () {
> =20
>      install -d ${D}${systemd_unitdir}/system
> =20
> -    if [ "${@base_contains('PACKAGECONFIG', 'resolvconf', 'resolvconf', =
'', d)}" !=3D "" ]; then
> +    if [ "${@bb.utils.contains('PACKAGECONFIG', 'resolvconf', 'resolvcon=
f', '', d)}" !=3D "" ]; then
>          install -m 0644 ${WORKDIR}/dnsmasq-resolvconf.service ${D}${syst=
emd_unitdir}/system/dnsmasq.service
>      else
>          install -m 0644 ${WORKDIR}/dnsmasq-noresolvconf.service ${D}${sy=
stemd_unitdir}/system/dnsmasq.service
>      fi
> =20
> -    install -m 0755 ${S}/contrib/wrt/dhcp_release ${D}${bindir}
> +    install -m 0755 ${S}/contrib/lease-tools/dhcp_release ${D}${bindir}
> =20
> -    if [ "${@base_contains('PACKAGECONFIG', 'dbus', 'dbus', '', d)}" !=
=3D "" ]; then
> +    if [ "${@bb.utils.contains('PACKAGECONFIG', 'dbus', 'dbus', '', d)}"=
 !=3D "" ]; then
>          install -d ${D}${sysconfdir}/dbus-1/system.d
>          install -m 644 dbus/dnsmasq.conf ${D}${sysconfdir}/dbus-1/system=
=2Ed/
>      fi
> -    if [ "${@base_contains('PACKAGECONFIG', 'resolvconf', 'resolvconf', =
'', d)}" !=3D "" ]; then
> +    if [ "${@bb.utils.contains('PACKAGECONFIG', 'resolvconf', 'resolvcon=
f', '', d)}" !=3D "" ]; then
>          install -d ${D}${sysconfdir}/resolvconf/update.d/
>          install -m 0755 ${WORKDIR}/dnsmasq.resolvconf ${D}${sysconfdir}/=
resolvconf/update.d/dnsmasq
> =20
> diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.75.bb b/me=
ta-networking/recipes-support/dnsmasq/dnsmasq_2.76.bb
> similarity index 27%
> rename from meta-networking/recipes-support/dnsmasq/dnsmasq_2.75.bb
> rename to meta-networking/recipes-support/dnsmasq/dnsmasq_2.76.bb
> index a11aabb..41573d9 100644
> --- a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.75.bb
> +++ b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.76.bb
> @@ -4,6 +4,5 @@ SRC_URI +=3D "\
>      file://lua.patch \
>  "
> =20
> -SRC_URI[dnsmasq-2.75.md5sum] =3D "d99ac126d4fe910c679d88430559669b"
> -SRC_URI[dnsmasq-2.75.sha256sum] =3D "f8252c0a0ba162c2cd45f81140c7c17cc40=
a5fca2b869d1a420835b74acad294"
> -
> +SRC_URI[dnsmasq-2.76.md5sum] =3D "6610f8233ca89b15a1bb47c788ffb84f"
> +SRC_URI[dnsmasq-2.76.sha256sum] =3D "777c4762d2fee3738a0380401f2d087b47f=
aa41db2317c60660d69ad10a76c32"
> --=20
> 2.7.4
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--pn5nn6tazaz3suwo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAletvDAACgkQN1Ujt2V2gBw4NQCcDeFmTBiFpGnSYS7jwk/Yoh8u
oH0Anis050gTmTFWiSYhC/Qf1H/tBdcX
=9IdT
-----END PGP SIGNATURE-----

--pn5nn6tazaz3suwo--
