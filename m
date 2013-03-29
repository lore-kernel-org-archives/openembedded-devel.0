Received: from mail-ea0-f174.google.com ([209.85.215.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1ULYVX-0006IA-4c
	for openembedded-devel@lists.openembedded.org;
	Fri, 29 Mar 2013 13:34:11 +0100
Received: by mail-ea0-f174.google.com with SMTP id m14so195168eaj.19
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Mar 2013 05:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=Z/h0mVI4rSK8MpJqXSowmbKWwTHnulMdtWHrTxK2BjA=;
	b=eA/yvgn4lzvYslisD8KwQRWOliv8CmnNAPXqEHHlxrE6jfXRmdUjPhrYPyNduXnW1C
	+AaKvBEHesdyDHuqsX+ABV3FixtOVuJphiCkjTRRDcv7JmUDS4LYdqxHUWIdUYb+mgwA
	J5ZPtPZ4uPqcqAvb9EHR28MYI+socU0RLys1eFcdcaz7CLikInp7Q5Sv/1nEstltHmSG
	5azYQVjzVTAkNSWbyTvRyWD/kGXtNIYwEWAR15Yaekv5wfiBb0zgej7aot4pfZDS9kE1
	49fM9Bl1exq/mpQ1eqAJR5kC1vGKr6rFPBhrlaDvjdOU+aB/sRjMPd2uuEPlNIEWTFrk
	z0bg==
X-Received: by 10.14.109.71 with SMTP id r47mr7298483eeg.25.1364559427389;
	Fri, 29 Mar 2013 05:17:07 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id 44sm3741503eek.5.2013.03.29.05.17.06
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 29 Mar 2013 05:17:06 -0700 (PDT)
Date: Fri, 29 Mar 2013 13:17:10 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130329121710.GA11120@jama>
References: <1364412662-4159-1-git-send-email-koen@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <1364412662-4159-1-git-send-email-koen@dominion.thruhere.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [meta-oe][PATCHv2] multipath-tools: add recipe for git version
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
X-List-Received-Date: Fri, 29 Mar 2013 12:34:11 -0000
X-Groupsio-MsgNum: 43782
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ReaqsoxgOBHFXBhH"
Content-Disposition: inline

--ReaqsoxgOBHFXBhH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 27, 2013 at 08:31:02PM +0100, Koen Kooi wrote:
> Multipath-tools hasn't seen a release in 3 years, so grab latest git.
>=20
> 'kpartx' is subpackaged since that's the tool most people want.

Applied, thanks!

>=20
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  .../multipath-tools/multipath-tools_git.bb         | 30 ++++++++++++++++=
++++++
>  1 file changed, 30 insertions(+)
>  create mode 100644 recipes-support/multipath-tools/multipath-tools_git.bb
>=20
> diff --git a/recipes-support/multipath-tools/multipath-tools_git.bb b/rec=
ipes-support/multipath-tools/multipath-tools_git.bb
> new file mode 100644
> index 0000000..808bc28
> --- /dev/null
> +++ b/recipes-support/multipath-tools/multipath-tools_git.bb
> @@ -0,0 +1,30 @@
> +DESCRIPTION =3D "The upstream project used to drive the Device Mapper mu=
ltipathing driver."
> +
> +DEPENDS =3D "lvm2 libaio readline"
> +
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D7be2873b6270e45abacc503abbe2a=
a3d"
> +
> +
> +SRC_URI =3D "git://git.opensvc.com/multipath-tools/.git;protocol=3Dhttp"
> +SRCREV =3D "15fc23ffb2bd1bac6990eda3e23c3e8980e6cfa5"
> +
> +S =3D "${WORKDIR}/git"
> +
> +PV =3D "0.4.9+git"
> +
> +EXTRA_OEMAKE =3D "MULTIPATH_VERSION=3D${PV} DESTDIR=3D${D} syslibdir=3D$=
{base_libdir} libdir=3D${base_libdir}/multipath"
> +
> +do_install() {
> +	oe_runmake install
> +}
> +
> +FILES_${PN}-dbg +=3D "${base_libdir}/multipath/.debug"
> +FILES_${PN} +=3D "${base_libdir}/multipath \
> +                ${base_libdir}/systemd"
> +
> +PACKAGES =3D+ "kpartx"
> +FILES_kpartx =3D "${base_sbindir}/kpartx \
> +                ${base_libdir}/udev/kpartx_id"
> +
> +RDEPENDS_${PN} +=3D "kpartx"
> --=20
> 1.8.1.4
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ReaqsoxgOBHFXBhH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFVhkYACgkQN1Ujt2V2gBxbRQCfW0renMKc16uu+MkRNFYkO7XW
qo4An1fR1Aaqjnhzwg5JV3mJAKcddS3F
=UAXF
-----END PGP SIGNATURE-----

--ReaqsoxgOBHFXBhH--
