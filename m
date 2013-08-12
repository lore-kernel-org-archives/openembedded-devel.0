Return-Path: <Joe.MacDonald@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6479761222
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Aug 2013 11:28:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r7CBSp2K025601
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Aug 2013 04:28:51 -0700 (PDT)
Received: from yow-jmacdona-d1.ottawa.wrs.com (128.224.146.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Mon, 12 Aug 2013 04:28:50 -0700
Received: from yow-jmacdona-l1 (yow-jmacdona-d2.wrs.com [128.224.146.166])	by
	yow-jmacdona-d1.ottawa.wrs.com (Postfix) with ESMTP id C86287FE3;
	Mon, 12 Aug 2013 07:28:19 -0400 (EDT)
Received: by yow-jmacdona-l1 (Postfix, from userid 1000)	id 0F71240498; Mon,
	12 Aug 2013 07:28:49 -0400 (EDT)
Date: Mon, 12 Aug 2013 07:28:49 -0400
From: Joe MacDonald <Joe.MacDonald@windriver.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Message-ID: <20130812112849.GA3634@windriver.com>
References: <1376187025-22368-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1376187025-22368-1-git-send-email-mark.asselstine@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] dnsmasq: don't expect systemd support to be set
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
X-List-Received-Date: Mon, 12 Aug 2013 11:28:55 -0000
X-Groupsio-MsgNum: 45648
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="d6Gm4EdcadzBjdND"
Content-Disposition: inline

--d6Gm4EdcadzBjdND
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Mark,

[[meta-networking][PATCH] dnsmasq: don't expect systemd support to be set] =
On 13.08.10 (Sat 22:10) Mark Asselstine wrote:

> If you don't have 'systemd' set in your DISTRO_FEATURES 'dnsmasq' will
> fail to package due to a QA error;
>=20
> ERROR: QA Issue: dnsmasq: Files/directories were installed but not shipped
>   /lib
>=20
> Check for systemd in DISTRO_FEATURES before performing installation
> instructions related to systemd.
>=20
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>  meta-networking/recipes-support/dnsmasq/dnsmasq.inc | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq.inc b/meta-n=
etworking/recipes-support/dnsmasq/dnsmasq.inc
> index 0f5b273..b9e7ff6 100644
> --- a/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
> +++ b/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
> @@ -31,8 +31,10 @@ do_install () {
>      install -m 644 ${WORKDIR}/dnsmasq.conf ${D}${sysconfdir}/
>      install -m 755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/dnsmasq
> =20
> -    install -d ${D}${systemd_unitdir}/system
> -    install -m 0644 ${WORKDIR}/dnsmasq.service ${D}${systemd_unitdir}/sy=
stem
> +    if ${@base_contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d=
)}; then
> +        install -d ${D}${systemd_unitdir}/system
> +        install -m 0644 ${WORKDIR}/dnsmasq.service ${D}${systemd_unitdir=
}/system
> +    fi
> =20
>      if [ "${@base_contains('PACKAGECONFIG', 'dbus', 'dbus', '', d)}" !=
=3D "" ]; then
>          install -d ${D}${sysconfdir}/dbus-1/system.d

My first reaction to this was we just had it fixed in oe-core quite
recently, but Martin identified a condition that's not covered (yet) in
the oe-core fix.  That said, I'm going to wait for the oe-core fix,
since right now I'd rather weed out any systemd on/off handling in
meta-networking.

--=20
-Joe MacDonald.
:wq

--d6Gm4EdcadzBjdND
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlIIxu4ACgkQPN8S4W6ZZnchzwCeKvHkW5qK4Vt/Znf3GI81gasS
oakAnRc1jZ645TthhxFmqIPfENi+aT2j
=EudY
-----END PGP SIGNATURE-----

--d6Gm4EdcadzBjdND--
