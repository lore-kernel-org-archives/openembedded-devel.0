Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 4D11C6E630
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 May 2016 10:55:33 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id g17so71510383wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 May 2016 03:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=tycIF5vITDz43UcjwMXsBNwyehZD5CqXer3YAsI9VbQ=;
	b=UexhP9CCtkBNwk+0+OvkbMX2H/nXIpy5ucqxnwxptY6jqR+VE59UJLHr9MHLV0EkrS
	OpXGxBxBoxkArjK0/IgHzfwFx/PjOqrrjBu4UTpcv08igC4WLCORJfGpi2lpkniM7bAn
	SK/w6C6+yku33s3EGxT6wD//Atg+mt35L+1jE5LaQM4SqSARoZL6kqsDvtUwlDgjt0eM
	/qvomSzlbVF+eHyv48uONNLWp2tBgeSYza5/T7JLGuDLyA1eshUuJ2MaLvvrJHx82mcd
	QU0oKkHLvL26B4nUX11qWLSqIW5+r7UGtG+dmWqLD0Qp/AvkUJw29EBmP/EFz/Hg786W
	JiYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=tycIF5vITDz43UcjwMXsBNwyehZD5CqXer3YAsI9VbQ=;
	b=j8MB+RqsR0QtqWo0tQjYHM/TuaqiH3pDzMhGLLTyVliDa5kn2LmgDSCnvRyeiJ/5kf
	JmAANnjoaY1H5ktOYZh/hfCcKbr4ein/0ldpVVlFB3b8W3BlsMW+8OwKRrtHEDm0alYc
	g8+zk4H0lvTKavMck4QM3TtF5jPB3cL082J05V6lNM84UfLFSnQ9ms2J6VmGb0O0pHLX
	YIz+LRFbEDjQHb+YfIxdnuqEo1POtKTlgnnpNNh2PopztnNwHzE9cik+VOGlqO4qxrVe
	c0iOF8rdD3hxOBeAMvv5Zxg+D537PEl3h3dm2+EPQY3sd4Lg32KOLb5NgtmVk/Thh2sG
	Jt+w==
X-Gm-Message-State: AOPr4FWclvUH62dzGE9vrdOt5oIeCDIGNWbwXihGoyna0GfUgudsvowSuLWulF9XRoBBVg==
X-Received: by 10.194.58.195 with SMTP id t3mr18473086wjq.97.1462532133870;
	Fri, 06 May 2016 03:55:33 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id n66sm7890620wmn.7.2016.05.06.03.55.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 May 2016 03:55:32 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 6 May 2016 12:57:03 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160506105703.GB2544@jama>
References: <1462309956-19552-1-git-send-email-otavio@ossystems.com.br>
	<VI1PR0401MB2031B157C831BDD836874B27E47B0@VI1PR0401MB2031.eurprd04.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <VI1PR0401MB2031B157C831BDD836874B27E47B0@VI1PR0401MB2031.eurprd04.prod.outlook.com>
User-Agent: Mutt/1.6.1 (2016-04-27)
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-oe master krogoth PATCH v2] opencv: Fix metapkg dependencies for opencv-java and opencv-locales
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
X-List-Received-Date: Fri, 06 May 2016 10:55:36 -0000
X-Groupsio-MsgNum: 61358
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="uZ3hkaAS1mZxFaxD"
Content-Disposition: inline

--uZ3hkaAS1mZxFaxD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 04, 2016 at 07:11:05PM +0000, Lauren Post wrote:
> This fixed our build break issues when including opencv and dev-pkgs in o=
ur development image.
>=20
> Can this be backported to krogoth branch?
>=20
> Acked-by: Lauren Post <lauren.post@nxp.com>

I've merged the version from master-next today (not sure if it was V2 or
V1) can someone please test it and if anything is missing (from the
other review as well) send follow-up patch?

Thanks

>=20
> -----Original Message-----
> From: Otavio Salvador [mailto:otavio@ossystems.com.br]=20
> Sent: Tuesday, May 03, 2016 4:13 PM
> To: Meta-OpenEmbedded Mailing listing <openembedded-devel@lists.openembed=
ded.org>
> Cc: Lauren Post <lauren.post@nxp.com>; Otavio Salvador <otavio@ossystems.=
com.br>
> Subject: [meta-oe master krogoth PATCH v2] opencv: Fix metapkg dependenci=
es for opencv-java and opencv-locales
>=20
> The opencv-java is not always generated so we ought to include it, only i=
f it is available. The opencv-locales is not available and ought to be skip=
ped.
>=20
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>=20
> Changes in v2:
> - Fix handling of package when java support is disabled
> - Avoids rdepends on -locale packages
> - Improve commit log
>=20
>  meta-oe/recipes-support/opencv/opencv_3.1.bb | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-oe/recipes-support/opencv/opencv_3.1.bb b/meta-oe/recip=
es-support/opencv/opencv_3.1.bb
> index c1f9802..789512f 100644
> --- a/meta-oe/recipes-support/opencv/opencv_3.1.bb
> +++ b/meta-oe/recipes-support/opencv/opencv_3.1.bb
> @@ -79,7 +79,8 @@ export ANT_DIR=3D"${STAGING_DIR_NATIVE}/usr/share/ant/"
> =20
>  TARGET_CC_ARCH +=3D "-I${S}/include "
> =20
> -PACKAGES +=3D "${PN}-java-dbg ${PN}-java ${PN}-samples-dbg ${PN}-samples=
 ${PN}-apps python-opencv"
> +PACKAGES +=3D "${PN}-samples-dbg ${PN}-samples ${PN}-apps python-opencv \
> +             ${@bb.utils.contains('PACKAGECONFIG', 'oracle-java', '${PN}=
-java-dbg ${PN}-java', '', d)}"
> =20
>  python populate_packages_prepend () {
>      cv_libdir =3D d.expand('${libdir}')
> @@ -104,7 +105,7 @@ python populate_packages_prepend () {
>      blacklist =3D [ metapkg ]
>      metapkg_rdepends =3D [ ]
>      for pkg in packages[1:]:
> -        if not pkg in blacklist and not pkg in metapkg_rdepends and not =
pkg.endswith('-dev') and not pkg.endswith('-dbg') and not pkg.endswith('-do=
c') :
> +        if not pkg in blacklist and not pkg in metapkg_rdepends and not =
pkg.endswith('-dev') and not pkg.endswith('-dbg') and not pkg.endswith('-do=
c') and not pkg.endswith('-locale'):
>              metapkg_rdepends.append(pkg)
>      bb.data.setVar('RDEPENDS_' + metapkg, ' '.join(metapkg_rdepends), d)
> =20
> --
> 2.8.2
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--uZ3hkaAS1mZxFaxD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlcseH8ACgkQN1Ujt2V2gBx4QACgqQTZcZ5dp3wdFD4R+uhrpXk0
0gQAn2NbOmD9h0PJ9fZjLQeVwoYAAlPv
=WQya
-----END PGP SIGNATURE-----

--uZ3hkaAS1mZxFaxD--
