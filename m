Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Q0aXI-00029S-Ro
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Mar 2011 15:20:22 +0100
Received: by bwz10 with SMTP id 10so3169330bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Mar 2011 07:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=C92xg/CRXRNBHIA1ewtflUUIATqWLEYj+eAgHmKQ17s=;
	b=AkXyVIlYPY7Y+C24oGgQ79QOmtKiUZuO/MsppRLfzrJ6GdwalrdEfoe0lFM8DMBMAY
	uWg8VibHbKDBOwXwpCDxVwVSxxvAsgbs9TAxilA+RaOk85nZ8QzGijhv8BDwsNvnGXRr
	ssmWNUqOA7n6sp6nhHqxRST9B4eAnDQ6oar0I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=t97eCD0N5oIn2RbyH67Bd7ZqQr/q91cJNfS3zOja2A+RaYSoqGMgfkWoHhyOHxspHc
	Pvo+8Etos0wgWe69E+VE0woKOEBtsoQXv5GznSfSV4wnBHefoQmeGRfQ3Qx67t1Ex/7I
	DuNAvBbh5eMm/YVnc/OdSCVANBV/MtnylpyQ4=
Received: by 10.204.154.215 with SMTP id p23mr1045215bkw.113.1300457907777;
	Fri, 18 Mar 2011 07:18:27 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id u23sm2177709bkw.21.2011.03.18.07.18.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 18 Mar 2011 07:18:19 -0700 (PDT)
Date: Fri, 18 Mar 2011 15:18:12 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110318141812.GB17785@jama.jama.net>
References: <1300456829-25755-1-git-send-email-Martin.Jansa@gmail.com>
	<1300456829-25755-3-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1300456829-25755-3-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 03/12] libnl: add RREPLACES libnl2 for upgradable path
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
X-List-Received-Date: Fri, 18 Mar 2011 14:20:23 -0000
X-Groupsio-MsgNum: 30414
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/NkBOFFp2J2Af1nK"
Content-Disposition: inline

--/NkBOFFp2J2Af1nK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 18, 2011 at 03:00:20PM +0100, Martin Jansa wrote:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  recipes/libnl/libnl_2.0.bb |    7 +++++++
>  recipes/libnl/libnl_git.bb |    7 +++++++
>  2 files changed, 14 insertions(+), 0 deletions(-)

This one is probably not needed (don't have libnl1 installed here to test)

I've PATCHv2 with this:

+# for upgradable path from libnl_1.0 to libnl_2.0
+# old libnl2_2.0 already had same names so RREPLACES isn't needed
+# libnl2_2.0/libnl_2.0 with debian naming produces ie libnl-route2
+RREPLACES_${PN} =3D "libnl1"
+RREPLACES_${PN}-route =3D "libnl1"
+RREPLACES_${PN}-nf =3D "libnl1"
+RREPLACES_${PN}-genl =3D "libnl1"
+RREPLACES_${PN}-cli =3D "libnl1"

but still it looks like only libnl2-dev and libnl-dev have conflicting
files, so maybe RCONFLICTS will be better to let user to remove old
libnl1 before upgrade to libnl2?

> diff --git a/recipes/libnl/libnl_2.0.bb b/recipes/libnl/libnl_2.0.bb
> index 8b77d07..6614478 100644
> --- a/recipes/libnl/libnl_2.0.bb
> +++ b/recipes/libnl/libnl_2.0.bb
> @@ -23,3 +23,10 @@ FILES_${PN}-route =3D "${libdir}/libnl-route.so.*"
>  FILES_${PN}-nf    =3D "${libdir}/libnl-nf.so.*"
>  FILES_${PN}-genl  =3D "${libdir}/libnl-genl.so.*"
>  FILES_${PN}-cli   =3D "${libdir}/libnl-cli.so.*"
> +
> +# for upgradable path from libnl2_2.0 to libnl_2.0
> +RREPLACES_${PN} =3D "${PN}2"
> +RREPLACES_${PN}-route =3D "${PN}2-route"
> +RREPLACES_${PN}-nf =3D "${PN}2-nf"
> +RREPLACES_${PN}-genl =3D "${PN}2-genl"
> +RREPLACES_${PN}-cli =3D "${PN}2-cli"
> diff --git a/recipes/libnl/libnl_git.bb b/recipes/libnl/libnl_git.bb
> index b3bb749..b844bdd 100644
> --- a/recipes/libnl/libnl_git.bb
> +++ b/recipes/libnl/libnl_git.bb
> @@ -23,3 +23,10 @@ FILES_${PN}-route =3D "${libdir}/libnl-route.so.*"
>  FILES_${PN}-nf    =3D "${libdir}/libnl-nf.so.*"
>  FILES_${PN}-genl  =3D "${libdir}/libnl-genl.so.*"
>  FILES_${PN}-cli   =3D "${libdir}/libnl-cli.so.*"
> +
> +# for upgradable path from libnl2_2.0 to libnl_2.0
> +RREPLACES_${PN} =3D "${PN}2"
> +RREPLACES_${PN}-route =3D "${PN}2-route"
> +RREPLACES_${PN}-nf =3D "${PN}2-nf"
> +RREPLACES_${PN}-genl =3D "${PN}2-genl"
> +RREPLACES_${PN}-cli =3D "${PN}2-cli"
> --=20
> 1.7.4.1
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--/NkBOFFp2J2Af1nK
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk2DaaQACgkQN1Ujt2V2gByUcgCfRshrseEF88Ou56nLvh9Nbmqv
1qIAn3mJRzXQuSBTqYQH6/GcDUd6y10c
=VNk3
-----END PGP SIGNATURE-----

--/NkBOFFp2J2Af1nK--
