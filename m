Received: from mail-ea0-f178.google.com ([209.85.215.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1ULYaK-0006it-FR
	for openembedded-devel@lists.openembedded.org;
	Fri, 29 Mar 2013 13:39:08 +0100
Received: by mail-ea0-f178.google.com with SMTP id o10so202092eaj.37
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Mar 2013 05:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=OpIav0IBJjQuTdF9ig5mmnW9PMabvEKCsRHN04zAshg=;
	b=rgSpSgxabRTTzd39m5V+satlnYZ+4sogOS34RDoPfjGdiy4eA+f9tGXOQ2hJTUkMNo
	adGrOkR8CvLhx5PTLJCbYl9u/tTMZx/B2ZxGBnZRFx+wCrFKVAL75jk9FJsjE5FCFFC3
	GOeXchT0inkQlj3WgVT2/gfBPgjWM7DYq9E/nzqINPTBHUC7RRK+BkARwl9bqc2YKuYx
	7O/StYOiwe4CbvFUcPl5jf1cDI3qbfFHhyjcsxKmfJJb9nvZnDwCELimvpiUFe21ty5x
	YejJQoNDruu/RZOZETignl6DYCKX1OlC7qZKU3ue9EaYV3i4/iiKs3NcFvOfXg2DIfbl
	yIOQ==
X-Received: by 10.14.179.201 with SMTP id h49mr7323464eem.26.1364559724796;
	Fri, 29 Mar 2013 05:22:04 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id s3sm3777953eem.4.2013.03.29.05.22.03
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 29 Mar 2013 05:22:04 -0700 (PDT)
Date: Fri, 29 Mar 2013 13:22:08 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130329122208.GF11120@jama>
References: <1364202218-30828-1-git-send-email-marcin.juszkiewicz@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1364202218-30828-1-git-send-email-marcin.juszkiewicz@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] glog: add 0.3.3 version
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
X-List-Received-Date: Fri, 29 Mar 2013 12:39:08 -0000
X-Groupsio-MsgNum: 43787
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="RE3pQJLXZi4fr8Xo"
Content-Disposition: inline

--RE3pQJLXZi4fr8Xo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 25, 2013 at 10:03:38AM +0100, Marcin Juszkiewicz wrote:
> The glog library implements application-level logging. This library
> provides logging APIs based on C++-style streams and various helper
> macros.
>=20
> glog.inc cause meta-linaro has glog_svn.bb recipe as well

Applied, thanks!

Hopefully in right (last) revision.

Would be great if you can update patchwork status and use PATCHvN for
next patches.

memcached/libmemcached are still pending (unresolved review comments=20
afaik).

>=20
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> ---
>  meta-oe/recipes-support/glog/glog.inc      | 9 +++++++++
>  meta-oe/recipes-support/glog/glog_0.3.3.bb | 6 ++++++
>  2 files changed, 15 insertions(+)
>  create mode 100644 meta-oe/recipes-support/glog/glog.inc
>  create mode 100644 meta-oe/recipes-support/glog/glog_0.3.3.bb
>=20
> diff --git a/meta-oe/recipes-support/glog/glog.inc b/meta-oe/recipes-supp=
ort/glog/glog.inc
> new file mode 100644
> index 0000000..97f3728
> --- /dev/null
> +++ b/meta-oe/recipes-support/glog/glog.inc
> @@ -0,0 +1,9 @@
> +DESCRIPTION =3D "The glog library implements application-level logging. =
This \
> +library provides logging APIs based on C++-style streams and various hel=
per \
> +macros."
> +HOMEPAGE =3D "https://code.google.com/p/google-glog/"
> +
> +LICENSE =3D "BSD"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Ddc9db360e0bbd4e46672f3fd91dd6=
c4b"
> +
> +inherit autotools pkgconfig
> diff --git a/meta-oe/recipes-support/glog/glog_0.3.3.bb b/meta-oe/recipes=
-support/glog/glog_0.3.3.bb
> new file mode 100644
> index 0000000..de3f076
> --- /dev/null
> +++ b/meta-oe/recipes-support/glog/glog_0.3.3.bb
> @@ -0,0 +1,6 @@
> +require glog.inc
> +
> +SRC_URI =3D "http://google-glog.googlecode.com/files/glog-${PV}.tar.gz"
> +
> +SRC_URI[md5sum] =3D "a6fd2c22f8996846e34c763422717c18"
> +SRC_URI[sha256sum] =3D "fbf90c2285ba0561db7a40f8a4eefb9aa963e7d399bd4503=
63e959929fe849d0"
> --=20
> 1.8.1.2
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--RE3pQJLXZi4fr8Xo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFVh3AACgkQN1Ujt2V2gBxvLwCfSPFYjEg/Es6kjCN2XT9uEIHT
JPoAn12H3p4p83vM916WwtUP/yYyzyFh
=0lfs
-----END PGP SIGNATURE-----

--RE3pQJLXZi4fr8Xo--
