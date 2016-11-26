Return-Path: <martin.jansa@gmail.com>
Received: from mail-wj0-f195.google.com (mail-wj0-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id A077C607B3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Nov 2016 00:16:39 +0000 (UTC)
Received: by mail-wj0-f195.google.com with SMTP id jb2so7210305wjb.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Nov 2016 16:16:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=MJeIJ1O9agN2uhDXldPt+cfY2N3VVsBagW/oNtf6y5A=;
	b=KD23RByhez3lt/aqR1dOSw0aJDX92DyZ1OwTF72w3WRJEU/o4yVcbUcAYboK+GiLCi
	gzlL+vot9Kk1lpSBV8E35jXyjHLHR+0XF/8slzvOxa7FMvZRyngMgzZe8owXiRdNz4S/
	PdGHMXgGlnfzlSZmLb1NIKOaLoGXpp1C0z4pyEQG1S7QxDtFeNO4yljuo374afQ2EVpf
	nae9YriYFUzkIDh6KaAHFyi+50Y1S1B5lX+6HD5Rk2tYLP/d+zPgNUDHUbIlrgm8IRIs
	iL4/P/vbU6bbji+Zr23NBG399lIgSiCj2UWiH27/16dRahV/5DvGcBUEukgy50oe5iAW
	Kzlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=MJeIJ1O9agN2uhDXldPt+cfY2N3VVsBagW/oNtf6y5A=;
	b=Os7qt0D8HdE+NbZiYwwNOhADzvoPLV2Sj9fbAplD/y9x/p7tQF5d6k/39dIFtQi0HJ
	h5HUWSq663OvGs4beXNmwwt0wHvXbN2zVNkQZE+U59Cbt3IFhDvpqzauWci7kpunNHPc
	qnK5yXoYnXxiCm6zksdxdNcjM8iFe8itoATN1W3eyB8puPurxcQcYMvFYUsiQlPO1tKB
	SH0dxtx2lClRdWUQXu9jvNt7lhCxW3nLhkMrbtugkVuXGXFj/Qi762Rxm/G+h6fSiVTH
	3nhiWcV6isZOR2jNLIBhSYNTx1cwc5gar7hg+1ThzNd1DyLz3ZERs21deSJs9PUyx2R3
	BWtg==
X-Gm-Message-State: AKaTC024X0MglFECt68khyS4ZM8y2rb/xQ54CjTkQsuYHbvGCeQIGc5DBLxJFAN3Fmy2KQ==
X-Received: by 10.194.82.163 with SMTP id j3mr11006019wjy.232.1480119400403;
	Fri, 25 Nov 2016 16:16:40 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	138sm15856300wms.20.2016.11.25.16.16.39
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 25 Nov 2016 16:16:39 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sat, 26 Nov 2016 01:16:44 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20161126001644.GD8369@jama>
References: <20161123092209.23699-1-raj.khem@gmail.com>
	<20161123092209.23699-23-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20161123092209.23699-23-raj.khem@gmail.com>
User-Agent: Mutt/1.7.1 (2016-10-04)
Subject: Re: [meta-multimedia][PATCH 23/49] miniupnpd: Add recipe
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
X-List-Received-Date: Sat, 26 Nov 2016 00:16:39 -0000
X-Groupsio-MsgNum: 64046
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IDYEmSnFhs3mNXr+"
Content-Disposition: inline

--IDYEmSnFhs3mNXr+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 23, 2016 at 01:21:43AM -0800, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../miniupnpd/miniupnpd_2.0.bb                     | 38 ++++++++++++++++=
++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 meta-multimedia/recipes-connectivity/miniupnpd/miniup=
npd_2.0.bb
>=20
> diff --git a/meta-multimedia/recipes-connectivity/miniupnpd/miniupnpd_2.0=
=2Ebb b/meta-multimedia/recipes-connectivity/miniupnpd/miniupnpd_2.0.bb
> new file mode 100644
> index 0000000..dfa3fed
> --- /dev/null
> +++ b/meta-multimedia/recipes-connectivity/miniupnpd/miniupnpd_2.0.bb
> @@ -0,0 +1,38 @@
> +SUMMARY =3D "Lightweight UPnP IGD daemon"
> +DESCRIPTION =3D "The miniUPnP daemon is an UPnP IGD (internet gateway de=
vice) \
> +which provide NAT traversal services to any UPnP enabled client on \
> +the network."
> +
> +SECTION =3D "networking"
> +LICENSE =3D "BSD-3-Clause"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Daa71c78c373ccfe0ff207af0cd966=
d91"
> +
> +inherit autotools gettext pkgconfig
> +
> +DEPENDS +=3D "iptables net-tools util-linux"

Autodetects bunch of dependencies:
http://lists.openembedded.org/pipermail/openembedded-devel/2016-November/11=
0050.html

> +
> +SRC_URI =3D "http://miniupnp.tuxfamily.org/files/download.php?file=3D${P=
}.tar.gz \
> +"
> +SRC_URI[md5sum] =3D "1c07a215dd9b362e75a9efc05e2fb3b4"
> +SRC_URI[sha256sum] =3D "d96aa3a00e0f5490826bba3cb97e68cd27479e5839adac4b=
9bcb66eae786bfb7"
> +
> +IPV6 =3D "${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', '--ipv6', '', =
d)}"
> +
> +do_compile() {
> +    cd ${S}
> +    CONFIG_OPTIONS=3D"${IPV6} --leasefile" ./genconfig.sh
> +    oe_runmake -f Makefile.linux
> +}
> +
> +do_install() {
> +    install -d ${D}/${sbindir}
> +    install ${S}/miniupnpd ${D}/${sbindir}
> +    install -d ${D}/${sysconfdir}/${BPN}
> +    install ${S}/netfilter/iptables_init.sh ${D}/${sysconfdir}/${BPN}
> +    install ${S}/netfilter/iptables_removeall.sh ${D}/${sysconfdir}/${BP=
N}
> +    install ${S}/netfilter/ip6tables_init.sh ${D}/${sysconfdir}/${BPN}
> +    install ${S}/netfilter/ip6tables_removeall.sh ${D}/${sysconfdir}/${B=
PN}
> +    install -m 0644 -b ${S}/miniupnpd.conf ${D}/${sysconfdir}/${BPN}
> +    install -d ${D}/${sysconfdir}/init.d
> +    install ${S}/linux/miniupnpd.init.d.script ${D}/${sysconfdir}/init.d=
/miniupnpd
> +}
> --=20
> 2.10.2
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--IDYEmSnFhs3mNXr+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWDjUawAKCRA3VSO3ZXaA
HDTBAJ4xyS1bU1DoigAD8BDjj5QfJyjPsQCffT8WKw0PfWx57r7jwDfYYKwRImc=
=jXHR
-----END PGP SIGNATURE-----

--IDYEmSnFhs3mNXr+--
