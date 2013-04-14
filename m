Received: from mail-ea0-f174.google.com ([209.85.215.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UROZS-0005Ai-E2
	for openembedded-devel@lists.openembedded.org;
	Sun, 14 Apr 2013 17:10:27 +0200
Received: by mail-ea0-f174.google.com with SMTP id m14so1881392eaj.33
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Apr 2013 07:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=phOWNu5uoFOn+eNiRFEeV4J9AJ2grzFj6uOXOTNjqlA=;
	b=ThKqDliq79yClrIsNKXZ5DTFSNt95XVC3xh1Lg3SeqJo9SUIb5DY5qsXDc3DWVDj+n
	pETztynkiPTAI1ygjdyXiyiPvYM7Kf47vtA22QeDVPigv344NTCAMM/cbRtUfrUNzLsr
	pu+3rIkjepn/TUY4pT0AeCc32k5M4QAuxN9+Kk8amMnW0ULFQO06GIN9Bwi5PzNF8p8m
	6lwysaeAI0S8ukNerVKTglkdSQRBBe/FLt19ZwlwDKyQa4OclsrYNnuTKtlNfEGVy6pb
	wFwaeROSbLs0F7aptl0j10NF443x470OUKRk7q9USKHXMUCCxLKloYbnZQU95kHN91Xh
	/+Nw==
X-Received: by 10.14.149.141 with SMTP id x13mr19259540eej.31.1365951174908;
	Sun, 14 Apr 2013 07:52:54 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id cd3sm21906240eeb.6.2013.04.14.07.52.53
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sun, 14 Apr 2013 07:52:54 -0700 (PDT)
Date: Sun, 14 Apr 2013 16:52:59 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130414145259.GC2475@jama>
References: <1365859790-20947-1-git-send-email-Martin.Jansa@gmail.com>
	<1365859790-20947-14-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1365859790-20947-14-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-systemd][PATCH 14/33] dnsmasq: move systemd support from meta-systemd back to meta-oe
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
X-List-Received-Date: Sun, 14 Apr 2013 15:10:40 -0000
X-Groupsio-MsgNum: 44162
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="TYecfFk8j8mZq+dy"
Content-Disposition: inline

--TYecfFk8j8mZq+dy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 13, 2013 at 03:29:31PM +0200, Martin Jansa wrote:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-oe/recipes-connectivity/dnsmasq/dnsmasq.inc       | 14 ++++++++++++=
--
>  .../dnsmasq/dnsmasq/dnsmasq.service                    |  0
>  meta-oe/recipes-connectivity/dnsmasq/dnsmasq_2.55.bb   |  2 ++
>  .../recipes-connectivity/dnsmasq/dnsmasq_2.55.bbappend | 18 ------------=
------
>  4 files changed, 14 insertions(+), 20 deletions(-)
>  rename {meta-systemd/meta-oe =3D> meta-oe}/recipes-connectivity/dnsmasq/=
dnsmasq/dnsmasq.service (100%)
>  delete mode 100644 meta-systemd/meta-oe/recipes-connectivity/dnsmasq/dns=
masq_2.55.bbappend

this breaks dnsmasq-dbus which is using the same .inc. dnsmasq-dbus
removal is in separate patch.

>=20
> diff --git a/meta-oe/recipes-connectivity/dnsmasq/dnsmasq.inc b/meta-oe/r=
ecipes-connectivity/dnsmasq/dnsmasq.inc
> index d6f3a54..ef99f48 100644
> --- a/meta-oe/recipes-connectivity/dnsmasq/dnsmasq.inc
> +++ b/meta-oe/recipes-connectivity/dnsmasq/dnsmasq.inc
> @@ -9,9 +9,11 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D0636e73ff0215=
e8d672dc4c32c317bb3 \
>  #at least versions 2.15 and prior are moved to the archive folder on the=
 server
>  SRC_URI =3D "http://www.thekelleys.org.uk/dnsmasq/${@['archive/', ''][fl=
oat(d.getVar('PV',1).split('.')[1]) > 15]}dnsmasq-${PV}.tar.gz;name=3Ddnsma=
sq-${PV} \
>             file://init \
> -           file://dnsmasq.conf"
> +           file://dnsmasq.conf \
> +           file://dnsmasq.service \
> +"
> =20
> -inherit update-rc.d
> +inherit update-rc.d systemd
> =20
>  INITSCRIPT_NAME =3D "dnsmasq"
>  INITSCRIPT_PARAMS =3D "defaults"
> @@ -24,6 +26,14 @@ do_install () {
>          install -d ${D}${sysconfdir}/ ${D}${sysconfdir}/init.d ${D}${sys=
confdir}/dnsmasq.d
>          install -m 644 ${WORKDIR}/dnsmasq.conf ${D}${sysconfdir}/
>          install -m 755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/dnsmasq
> +
> +        install -d ${D}${systemd_unitdir}/system
> +        install -m 0644 ${WORKDIR}/dnsmasq.service ${D}${systemd_unitdir=
}/system
>  }
> =20
>  CONFFILES_${PN} =3D "${sysconfdir}/dnsmasq.conf"
> +
> +RPROVIDES_${PN} +=3D "${PN}-systemd"
> +RREPLACES_${PN} +=3D "${PN}-systemd"
> +RCONFLICTS_${PN} +=3D "${PN}-systemd"
> +SYSTEMD_SERVICE_${PN} =3D "dnsmasq.service"
> diff --git a/meta-systemd/meta-oe/recipes-connectivity/dnsmasq/dnsmasq/dn=
smasq.service b/meta-oe/recipes-connectivity/dnsmasq/dnsmasq/dnsmasq.service
> similarity index 100%
> rename from meta-systemd/meta-oe/recipes-connectivity/dnsmasq/dnsmasq/dns=
masq.service
> rename to meta-oe/recipes-connectivity/dnsmasq/dnsmasq/dnsmasq.service
> diff --git a/meta-oe/recipes-connectivity/dnsmasq/dnsmasq_2.55.bb b/meta-=
oe/recipes-connectivity/dnsmasq/dnsmasq_2.55.bb
> index 5f87704..ae37db7 100644
> --- a/meta-oe/recipes-connectivity/dnsmasq/dnsmasq_2.55.bb
> +++ b/meta-oe/recipes-connectivity/dnsmasq/dnsmasq_2.55.bb
> @@ -1,4 +1,6 @@
>  require dnsmasq.inc
> =20
> +PR =3D "r3"
> +
>  SRC_URI[dnsmasq-2.55.md5sum] =3D "b093d7c6bc7f97ae6fd35d048529232a"
>  SRC_URI[dnsmasq-2.55.sha256sum] =3D "cf63ecf5977f00474cbda98376a9d874350=
0a82fd98e13f43d7037bce9f9f929"
> diff --git a/meta-systemd/meta-oe/recipes-connectivity/dnsmasq/dnsmasq_2.=
55.bbappend b/meta-systemd/meta-oe/recipes-connectivity/dnsmasq/dnsmasq_2.5=
5.bbappend
> deleted file mode 100644
> index 148586e..0000000
> --- a/meta-systemd/meta-oe/recipes-connectivity/dnsmasq/dnsmasq_2.55.bbap=
pend
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
> -
> -PRINC :=3D "${@int(PRINC) + 2}"
> -
> -inherit systemd
> -
> -SRC_URI +=3D "file://dnsmasq.service"
> -
> -RPROVIDES_${PN} +=3D "${PN}-systemd"
> -RREPLACES_${PN} +=3D "${PN}-systemd"
> -RCONFLICTS_${PN} +=3D "${PN}-systemd"
> -SYSTEMD_SERVICE_${PN} =3D "dnsmasq.service"
> -
> -do_install_append() {
> -	install -d ${D}${systemd_unitdir}/system
> -	install -m 0644 ${WORKDIR}/dnsmasq.service ${D}${systemd_unitdir}/system
> -}
> -
> --=20
> 1.8.1.5
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--TYecfFk8j8mZq+dy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFqwssACgkQN1Ujt2V2gBz80ACcDH4cfqSIQ69+Nf0zsneRf88r
vAAAnRJN9iG9j9F649H0fq+R73eHuHZ1
=p9r9
-----END PGP SIGNATURE-----

--TYecfFk8j8mZq+dy--
