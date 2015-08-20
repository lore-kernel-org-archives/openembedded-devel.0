Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id 1F90265CBC
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Aug 2015 20:41:31 +0000 (UTC)
Received: by wicne3 with SMTP id ne3so163566wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Aug 2015 13:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=qyWz+9ZbyX7fmZ06k63zieVUkJuCH51p6CeeKNev3oE=;
	b=gORELpV7kts2/KDqMds9eRPGu4nwNz4pfM+JIrkJQNyoltt/lRhIURMMQYLU5mzzNc
	euqaHqbcaeYyk8mp5y+QDChkx3sp6NEUuQOzu64hCZ17NiN3u/Rgyk81CBYqcj3Li3xy
	TEl7/G685DYYuILwTSOeIOTPo96/bUjJdLkp3dGk7+Ad75TAnkaWd4oehloXrph5qJl4
	Y/aysguhe9eENYf3WjPJ4jPQ0HoRlWKa3Hedf1xOr/wzoQ1wwA0OjrgQ8bVIe4WuBwlJ
	bemCWxB2ToeDKCHHMSbNe12QqvflmG4crZaggF9uYzpyXgVADXt7RCc+zvqw9M5dtJhh
	4nVw==
X-Received: by 10.194.117.70 with SMTP id kc6mr9363066wjb.13.1440103291259;
	Thu, 20 Aug 2015 13:41:31 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id c7sm7073202wjb.19.2015.08.20.13.41.29
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 20 Aug 2015 13:41:29 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 20 Aug 2015 22:41:57 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150820204157.GB15465@jama>
References: <1440101942-6993-1-git-send-email-rudolf.streif@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1440101942-6993-1-git-send-email-rudolf.streif@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH] synergy: project has moved from synergy.googlecode.com
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
X-List-Received-Date: Thu, 20 Aug 2015 20:41:34 -0000
X-Groupsio-MsgNum: 56856
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JP+T4n/bALQSJXh8"
Content-Disposition: inline

--JP+T4n/bALQSJXh8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 20, 2015 at 01:19:02PM -0700, Rudolf J Streif wrote:
> The synergy project on synergy.googlecode.com is defunct. The
> sources cannot be downloaded from there anymore. The new project
> home is synergy-project.org, but sources can only be downloaded
> from ther with a login. The source code repo is on github.com/synergy.
>=20
> New recipe to check out the code from GitHub. The code contains
> zip archives for gmock and gtest, which need to be extracted before
> do_configure.
>=20
> Signed-off-by: Rudolf J Streif <rudolf.streif@gmail.com>
> ---
>  meta-oe/recipes-support/synergy/synergy_git.bb | 33 ++++++++++++++++++++=
++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 meta-oe/recipes-support/synergy/synergy_git.bb

Remove
meta-openembedded/meta-oe/recipes-support/synergy/synergy_1.3.8.bb
in the same commit.

>=20
> diff --git a/meta-oe/recipes-support/synergy/synergy_git.bb b/meta-oe/rec=
ipes-support/synergy/synergy_git.bb
> new file mode 100644
> index 0000000..8650685
> --- /dev/null
> +++ b/meta-oe/recipes-support/synergy/synergy_git.bb
> @@ -0,0 +1,33 @@
> +SUMMARY =3D "Synergy - control multiple computers with one keyboard and =
mouse"
> +HOMEPAGE =3D "http://synergy-project.org"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D0f366945b209c5523e39889f636af=
00a"

Add comment in commit message explaining why license checksum is
different in this version.

> +LICENSE =3D "GPL-2.0"
> +SECTION =3D "x11/utils"
> +
> +DEPENDS =3D "libx11 libxtst libxinerama"

Why did you drop virtual from libx11?

DEPENDS =3D "virtual/libx11 libxtst libxinerama"


> +
> +SRC_URI =3D "git://github.com/synergy/synergy.git;protocol=3Dhttp"
> +
> +# HEAD
> +SRCREV_pn-synergy ?=3D "${AUTOREV}"

NAK

> +
> +# Version 1.7.4-rc8
> +SRCREV_pn-synergy ?=3D "c734bab59ecb7703605e01438e6bff4338b5cb34"

Drop "_pn-synergy ?"

normal assignment is enough

Set PV "1.7.3+1.7.4-rc8+${SRCPV}"

> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit cmake

What happened with distro_features_check from original recipe?

inherit cmake distro_features_check
# depends on virtual/libx11
REQUIRED_DISTRO_FEATURES =3D "x11"


> +
> +do_unpack_extra() {
> +    cd ${S}/ext
> +    for file in *.zip; do
> +        fname=3D"${file##*/}"
> +        unzip $file -d ${fname%.*}
> +    done
> +}
> +addtask unpack_extra after do_unpack before do_patch
> +
> +do_install() {
> +    install -d ${D}/usr/bin
> +    install -m 0755 ${S}/bin/synergy* ${D}/usr/bin/
> +}
> --=20
> 2.1.0
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--JP+T4n/bALQSJXh8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlXWO5UACgkQN1Ujt2V2gBy7KACdEbyCaomEPW9CrcA8Fb5ScwkB
EZoAn3CIqwuHHPw8NXVdWzg+9WhV6g7E
=t+Pr
-----END PGP SIGNATURE-----

--JP+T4n/bALQSJXh8--
