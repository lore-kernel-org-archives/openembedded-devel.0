Return-Path: <joe@deserted.net>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id B410E65D12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Apr 2014 01:34:23 +0000 (UTC)
Received: by mail-ig0-f172.google.com with SMTP id hn18so1636326igb.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Apr 2014 18:34:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=kGSUoZvzo5xHmAFwRI7kN1JBrmQG5Fud81qUMRz51qw=;
	b=Ddx79sZlhrzaUXA8ZCppienrvihi1tS6QDL0svV10VBj+cH94j7U0NytwropmO9f4h
	sBp+1yWGBvWbCAY3rDeAOVC+HngBtjWVx5SzuzyNAkuYTcmP9UbdNsI+cuC4egSBucBv
	iFHVJL9xX/7S7bq9tFORs4CIXCeBUA8G+IT7h0Q/pstAryFEbVWCX4fDsi0dTC+Ey/Af
	okLrfk9H7J3hY4BTeOUFAcRtoWuOMRvskf1m8bFAfxdBkO7wzjVePut9CdBzpLm/ptYq
	2+BkfEpsYXFhD8/+BqDrX4R7Us+JSUVmXuttd1Es49Jg15LKPIgrkH5u+kKO2nXrulo9
	EEtw==
X-Gm-Message-State: ALoCoQlpE0cGqtpeJoBV1c9dQRy7jRz+ZNkET+gdftk/paJG0l5c7g2SP5vTGFc00Qh8hgX753D6
X-Received: by 10.42.249.8 with SMTP id mi8mr4847947icb.4.1398389664514;
	Thu, 24 Apr 2014 18:34:24 -0700 (PDT)
Received: from deserted.net (24-246-4-250.cable.teksavvy.com. [24.246.4.250])
	by mx.google.com with ESMTPSA id
	rt10sm2111623igb.15.2014.04.24.18.34.23 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 24 Apr 2014 18:34:23 -0700 (PDT)
Date: Thu, 24 Apr 2014 21:34:21 -0400
From: Joe MacDonald <joe@deserted.net>
To: Amy Fong <amy.fong@windriver.com>
Message-ID: <20140425013419.GM10115@deserted.net>
References: <20140409173022.GA2661@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20140409173022.GA2661@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking] Uprev memcached from upstream
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
X-List-Received-Date: Fri, 25 Apr 2014 01:34:23 -0000
X-Groupsio-MsgNum: 49479
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="DXTueXWT3Da08pik"
Content-Disposition: inline

--DXTueXWT3Da08pik
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Amy,

Should I expect a v2 based on Martin and Khem's comments?  Also, if
you're doing the uprev, it's probably worth removing the old one at the
same time.

-J.

[[oe] [meta-networking] Uprev memcached from upstream] On 14.04.09 (Wed 13:=
30) Amy Fong wrote:

> commit 3d0b80c5667a2c1d8634173948048567d0bc9c36
> Author: Amy Fong <amy.fong@windriver.com>
> Date:   Tue Apr 8 14:29:19 2014 -0400
>=20
>     Uprev memcached from upstream
>    =20
>     memcached 1.4.15 has some configuration errors:
>     configure:5798: error: cannot run test program while cross compiling
>    =20
>     Uprev has the needed fix for the configuration error and some other f=
ixes.
>    =20
>     Signed-off-by: Amy Fong <amy.fong@windriver.com>
>=20
> diff --git a/recipes-support/memcached/memcached_1.4.17.bb b/recipes-supp=
ort/memcached/memcached_1.4.17.bb
> new file mode 100644
> index 0000000..906896c
> --- /dev/null
> +++ b/recipes-support/memcached/memcached_1.4.17.bb
> @@ -0,0 +1,50 @@
> +SUMMARY =3D "A high-performance memory object caching system"
> +DESCRIPTION =3D "\
> + Danga Interactive developed memcached to enhance the speed of LiveJourn=
al.com, \
> + a site which was already doing 20 million+ dynamic page views per day f=
or 1 \
> + million users with a bunch of webservers and a bunch of database server=
s. \
> + memcached dropped the database load to almost nothing, yielding faster =
page \
> + load times for users, better resource utilization, and faster access to=
 the \
> + databases on a memcache miss. \
> + . \
> + memcached optimizes specific high-load serving applications that are de=
signed \
> + to take advantage of its versatile no-locking memory access system. Cli=
ents \
> + are available in several different programming languages, to suit the n=
eeds \
> + of the specific application. Traditionally this has been used in mod_pe=
rl \
> + apps to avoid storing large chunks of data in Apache memory, and to sha=
re \
> + this burden across several machines."
> +
> +HOMEPAGE =3D "http://www.danga.com/memcached/"
> +LICENSE =3D "BSD"
> +
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D7e5ded7363d335e1bb18013ca0804=
6ff"
> +
> +inherit autotools
> +
> +DEPENDS +=3D "libevent"
> +RDEPENDS +=3D "perl perl-module-posix perl-module-autoloader perl-module=
-tie-hash"
> +
> +SRC_URI =3D "http://www.memcached.org/files/${PN}-${PV}.tar.gz"
> +
> +SRC_URI[md5sum] =3D "46402dfbd7faadf6182283dbbd18b1a6"
> +SRC_URI[sha256sum] =3D "d9173ef6d99ba798c982ea4566cb4f0e64eb23859fdbf992=
6a89999d8cdc0458"
> +
> +python __anonymous () {
> +    endianness =3D d.getVar('SITEINFO_ENDIANNESS', True)
> +    if endianness =3D=3D 'le':
> +        d.setVar('EXTRA_OECONF', "ac_cv_c_endian=3Dlittle")
> +    else:
> +        d.setVar('EXTRA_OECONF', "ac_cv_c_endian=3Dbig")
> +}
> +
> +inherit update-rc.d
> +
> +INITSCRIPT_NAME =3D "memcached"
> +INITSCRIPT_PARAMS =3D "defaults"
> +
> +do_install_append() {
> +	install -D -m 755 ${S}/scripts/memcached-init ${D}${sysconfdir}/init.d/=
memcached=20
> +	mkdir -p ${D}/usr/share/memcached/scripts
> +	install -m 755 ${S}/scripts/memcached-tool ${D}/usr/share/memcached/scr=
ipts
> +	install -m 755 ${S}/scripts/start-memcached ${D}/usr/share/memcached/sc=
ripts
> +}
--=20
-Joe MacDonald.
:wq

--DXTueXWT3Da08pik
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlNZu5sACgkQwFvcllog0Xzc6gCdFoTiKrni5n/m4KAN9lZeRWGa
JxUAoJewwub+VJIFLWQjuFMKfFlIr8Jd
=KP/S
-----END PGP SIGNATURE-----

--DXTueXWT3Da08pik--
