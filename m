Received: from mail-pd0-f177.google.com ([209.85.192.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UdyOF-0005gO-2q
	for openembedded-devel@lists.openembedded.org;
	Sun, 19 May 2013 09:50:51 +0200
Received: by mail-pd0-f177.google.com with SMTP id g10so4483049pdj.22
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 May 2013 00:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=IFkG3T06Oj9fd/9SflkNNNx4RiSHG8omF0a1PW/qeSY=;
	b=TJq1QGcgA7kSfCckT9SJled3oFZXbLM9QlMKUNyl+vQiiZahbx8E8bCy8kJnR3wO1C
	6fuXKihPz+tC6cc40KINs1/flt9B5BtZndgIc0QUuMfN/0fdxcCbjq+EL8gKdKI2Gyg9
	PlBFd0acgFKFaZhMxdi9A8zuFfPdMd3Pqix21fORBsziX7GHATsXilkPS4OLqRox7shZ
	kGTgiKWMvfmbQ2djxDMuTqNa9LUPv5vC7S9EWzKr7V2e04+nxH8UiU8Jt5IVlkw2OpX/
	l0mnW9v6UK8t1aO73kH932/Xay1yssrwOOMH5/GXjCwTryznQk5gQ2LnHOLZPr0wbd1s
	+bzg==
X-Received: by 10.68.129.234 with SMTP id nz10mr22851611pbb.181.1368948748074; 
	Sun, 19 May 2013 00:32:28 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	b7sm18699278pba.39.2013.05.19.00.32.25
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sun, 19 May 2013 00:32:26 -0700 (PDT)
Date: Sun, 19 May 2013 09:32:17 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130519073217.GA3196@jama>
References: <1368457185-8140-1-git-send-email-philip@balister.org>
MIME-Version: 1.0
In-Reply-To: <1368457185-8140-1-git-send-email-philip@balister.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH] gnuradio : Update recipe to build on all machines again.
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
X-List-Received-Date: Sun, 19 May 2013 07:51:06 -0000
X-Groupsio-MsgNum: 44770
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="huq684BweRXVnRxX"
Content-Disposition: inline

--huq684BweRXVnRxX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 13, 2013 at 10:59:45AM -0400, Philip Balister wrote:
> Also updated the git repo address after recent changes in hosting.
>=20
> The recipe failed to build for machines without neon as a tune feature.
> The cmake config options have been changed so that it configures properly
> now.
>=20
> Test on armv7a, x86, and x86-64.
>=20
> Signed-off-by: Philip Balister <philip@balister.org>
> ---
>  meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
>=20
> diff --git a/meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb b/meta=
-oe/recipes-connectivity/gnuradio/gnuradio_git.bb
> index edd4615..9e6998b 100644
> --- a/meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb
> +++ b/meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb
> @@ -70,7 +70,7 @@ SRCREV =3D "5f69899e059e9bea58f92af61f70fc3f63825087"
>  GIT_REPO =3D "gnuradio.git"
>  GIT_BRANCH =3D "master"
> =20
> -SRC_URI =3D "git://gnuradio.org/${GIT_REPO};branch=3D${GIT_BRANCH};proto=
col=3Dgit \
> +SRC_URI =3D "git://git.gnuradio.org/${GIT_REPO};branch=3D${GIT_BRANCH};p=
rotocol=3Dgit \
>  "
> =20
>  S=3D"${WORKDIR}/git"
> @@ -88,15 +88,11 @@ EXTRA_OECMAKE =3D "-DENABLE_GR_ATSC=3DFALSE \
>                   -DQT_LIBRARY_DIR=3D${STAGING_LIBDIR} \
>                   -DQT_QTCORE_LIBRARY_RELEASE=3D${STAGING_LIBDIR}/libQtCo=
re.so \
>                   -DQT_QTGUI_LIBRARY_RELEASE=3D${STAGING_LIBDIR}/libQtGui=
=2Eso \
> +                 ${@base_contains('TUNE_FEATURES', 'neon', \
> +                     '-Dhave_mfpu_neon=3D1', '-Dhave_mfpu_neon=3D0', d)}=
 \
>  "
> =20
>  inherit distutils-base cmake pkgconfig
> =20
>  EXTRA_OEMAKE =3D "-C ${OECMAKE_BUILDPATH}"
> =20
> -# Only builds for machines with neon instructions. Problem is in upstrea=
m cmake.
> -python () {
> -    if not oe.utils.contains ('TUNE_FEATURES', 'neon', True, False, d):
> -        raise bb.parse.SkipPackage("'neon' not in TUNE_FEATURES")
> -}

Hi,=20

this enables gnuradio to build on qemu* MACHINEs I'm testing and it
failed on all 3 because of docs generation, can you disable it?

| [ 20%] /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5t=
e-oe-linux-gnueabi/gnuradio/3.6.4.1-r0/git/gr-trellis/doc/gr-trellis.xml:6:=
 warning: failed to load external entity "/home/jenkins/oe/shr-core-branche=
s/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/gnuradio/3.6.4.1-r0/git=
/gr-trellis/doc/docbookx.dtd"
| ]>
|   ^
| warning: failed to load external entity "/home/jenkins/oe/shr-core-branch=
es/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/gnuradio/3.6.4.1-r0/gi=
t/gr-trellis/doc/docbookx.dtd"
| validity error : Could not load the external subset "docbookx.dtd"
| Document /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv=
5te-oe-linux-gnueabi/gnuradio/3.6.4.1-r0/git/gr-trellis/doc/gr-trellis.xml =
does not validate

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--huq684BweRXVnRxX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlGYgAEACgkQN1Ujt2V2gBxmGgCfQBdEY7w/Apds5Eav0I8fIxAe
0CEAmgPDOhxhgrubQChV6g1OVWdmI2t6
=Olu+
-----END PGP SIGNATURE-----

--huq684BweRXVnRxX--
