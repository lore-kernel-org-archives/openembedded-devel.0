Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f41.google.com (mail-ee0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id CF06665DA8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 09:16:48 +0000 (UTC)
Received: by mail-ee0-f41.google.com with SMTP id t10so2894982eei.14
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 02:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=jRMHtwOUHYq/SkUVPC/BBamf8+CRnEludyolXODKX+8=;
	b=ynrP0mMAChYinjToRgfuHH2gqO7INdLTZvCVa2I9D1sNy9/pCcxl8S7v0BeAbAJ70E
	TaFNQd7UkyTgELE2UIpEbyHwb9htp1X72i4Gxf/XzEMWQuwx/kIJ82DjQGNYGMDx41pP
	q2iA2jHIUChBoWwbRojq45BdoPG8zhJI7ZauJ9I0ApOesFLvu4stDo5OhgFquaQWseNI
	g5xEzF9uVIriGJXlhEMb4kS5wo6p20l4OMKlXfdiAZw93bgnO2Z+Iqbp6oH3eTObevXZ
	wjmSL/IeuHdDhwpiLDmQes/5CxyfEhjWJwXlNZxtc31siVSZx0VRxGoPOw4CGOwYuufz
	OUpA==
X-Received: by 10.14.104.135 with SMTP id i7mr37193257eeg.34.1397985409224;
	Sun, 20 Apr 2014 02:16:49 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	p8sm92926012eef.26.2014.04.20.02.16.47
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 Apr 2014 02:16:48 -0700 (PDT)
Date: Sun, 20 Apr 2014 11:16:53 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140420091653.GX2486@jama>
References: <1397201877-5932-1-git-send-email-jackie.huang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1397201877-5932-1-git-send-email-jackie.huang@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH] liblockfile: set default mailgroup and install libnfslock
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
X-List-Received-Date: Sun, 20 Apr 2014 09:16:49 -0000
X-Groupsio-MsgNum: 49305
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7WMexqIhC8AwFtpM"
Content-Disposition: inline

--7WMexqIhC8AwFtpM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 11, 2014 at 03:37:57PM +0800, jackie.huang@windriver.com wrote:
> From: Jackie Huang <jackie.huang@windriver.com>

Merged, thanks.

>=20
> * Set the default mailgroup to 'mail' or it will use 'root'.
> * Set --with-libnfslock so it builds and install libnfslock.
> * The patch is to fix nfslib build failure and add missing soname lib.
> * No need to override the do_install, set EXTRA_OEMAKE instead.
>=20
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  .../liblockfile-fix-nfslib-and-soname.patch        |   54 ++++++++++++++=
++++++
>  .../liblockfile/liblockfile_1.09.bb                |   15 ++++--
>  2 files changed, 65 insertions(+), 4 deletions(-)
>  create mode 100644 meta-oe/recipes-extended/liblockfile/liblockfile-1.09=
/liblockfile-fix-nfslib-and-soname.patch
>=20
> diff --git a/meta-oe/recipes-extended/liblockfile/liblockfile-1.09/libloc=
kfile-fix-nfslib-and-soname.patch b/meta-oe/recipes-extended/liblockfile/li=
blockfile-1.09/liblockfile-fix-nfslib-and-soname.patch
> new file mode 100644
> index 0000000..ffd7a40
> --- /dev/null
> +++ b/meta-oe/recipes-extended/liblockfile/liblockfile-1.09/liblockfile-f=
ix-nfslib-and-soname.patch
> @@ -0,0 +1,54 @@
> +Upstream-Status: Inappropriate [no upstream]
> +
> +* nfslib should use NVER instead of VER
> +* install the missing soname library
> +
> +Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> +---
> + Makefile.in         |    9 ++++++---
> + 1 files changed, 5 insertions(+), 3 deletions(-)
> +
> +diff --git a/Makefile.in b/Makefile.in
> +index 836ca9b..a589fb8 100644
> +--- a/Makefile.in
> ++++ b/Makefile.in
> +@@ -27,7 +27,7 @@ install:	@INSTALL_TARGETS@
> +=20
> + static:		liblockfile.a dotlockfile
> + shared:		liblockfile.so dotlockfile
> +-nfslib:		nfslock.so.$(VER)
> ++nfslib:		nfslock.so.$(NVER)
> +=20
> + liblockfile.a:	lockfile.o
> + 		$(AR) rv liblockfile.a lockfile.o
> +@@ -36,7 +36,7 @@ liblockfile.so: liblockfile.a
> + 		$(CC) -fPIC -shared -Wl,-soname,liblockfile.so.1 \
> + 			-o liblockfile.so lockfile.o $(LDFLAGS) -lc
> +=20
> +-nfslock.so.$(VER):	nfslock.o
> ++nfslock.so.$(NVER):	nfslock.o
> + 		$(CC) -fPIC -shared -Wl,-soname,nfslock.so.0 \
> + 			-o nfslock.so.$(NVER) nfslock.o $(LDFLAGS)
> +=20
> +@@ -59,6 +59,7 @@ install_shared:	shared install_common
> + 		install -m 755 liblockfile.so \
> + 			$(ROOT)$(libdir)/liblockfile.so.$(VER)
> + 		ln -s liblockfile.so.$(VER) $(ROOT)$(libdir)/liblockfile.so
> ++		ln -s liblockfile.so.$(VER) $(ROOT)$(libdir)/liblockfile.so.1
> + 		if test "$(ROOT)" =3D ""; then @LDCONFIG@; fi
> +=20
> + install_common:
> +@@ -72,7 +73,9 @@ install_common:
> +=20
> + install_nfslib:	nfslib
> + 		install -d $(ROOT)$(nfslockdir)
> +-		install -m 755 nfslock.so.$(VER) $(ROOT)$(nfslockdir)
> ++		install -m 755 nfslock.so.$(NVER) $(ROOT)$(nfslockdir)
> ++		ln -sf nfslock.so.$(NVER) $(ROOT)$(libdir)/nfslock.so
> ++		ln -sf nfslock.so.$(NVER) $(ROOT)$(libdir)/nfslock.so.0
> + 		if test "$(ROOT)" =3D ""; then @LDCONFIG@; fi
> +=20
> + clean:
> +--=20
> +1.7.9.5
> +
> diff --git a/meta-oe/recipes-extended/liblockfile/liblockfile_1.09.bb b/m=
eta-oe/recipes-extended/liblockfile/liblockfile_1.09.bb
> index 3ef52cf..fa68fd0 100644
> --- a/meta-oe/recipes-extended/liblockfile/liblockfile_1.09.bb
> +++ b/meta-oe/recipes-extended/liblockfile/liblockfile_1.09.bb
> @@ -7,6 +7,7 @@ SRC_URI =3D "${DEBIAN_MIRROR}/main/libl/liblockfile/liblo=
ckfile_1.09.orig.tar.gz \
>      file://install.patch \
>      file://configure.patch \
>      file://ldflags.patch \
> +    file://liblockfile-fix-nfslib-and-soname.patch \
>  "
> =20
>  SRC_URI[md5sum] =3D "2aa269e4405ee8235ff17d1b357c6ae8"
> @@ -14,9 +15,15 @@ SRC_URI[sha256sum] =3D "16979eba05396365e1d6af7100431a=
e9d32f9bc063930d1de66298a069
> =20
>  inherit autotools
> =20
> -EXTRA_OECONF =3D "--enable-shared --enable-static"
> +# set default mailgroup to mail
> +# --with-libnfslock specify where to install nfslock.so.NVER
> +EXTRA_OECONF =3D "--enable-shared --enable-static \
> +                --with-mailgroup=3Dmail \
> +                --with-libnfslock=3D${libdir} \
> +"
> =20
> -do_install () {
> -    oe_runmake 'ROOT=3D${D}' INSTGRP=3D'' install
> -}
> +# Makefile using ROOT not DESTDIR
> +EXTRA_OEMAKE +=3D "ROOT=3D${D}"
> =20
> +FILES_${PN} +=3D "${libdir}/nfslock.so.*"
> +FILES_${PN}-dev +=3D "${libdir}/nfslock.so"
> --=20
> 1.7.9.5
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--7WMexqIhC8AwFtpM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNTkIUACgkQN1Ujt2V2gBzNfQCfexBLjYalMpQFfqRx2vPDKkwV
j98An3fRxlvoBRKsAgFpINo5u47EyLjc
=S67+
-----END PGP SIGNATURE-----

--7WMexqIhC8AwFtpM--
