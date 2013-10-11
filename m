Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f176.google.com (mail-ea0-f176.google.com
	[209.85.215.176])
	by mail.openembedded.org (Postfix) with ESMTP id 92BAB6CE69
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Oct 2013 10:58:37 +0000 (UTC)
Received: by mail-ea0-f176.google.com with SMTP id q16so1751214ead.7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Oct 2013 03:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=r3v2AhP8/6WIUILoiODOzvsZ+Pok4LyAgXQhCtyo7CM=;
	b=d2TYgVY6A7lYEoaBhlU469qe8VlzBhYpYmKmggZDTlv0wUGqXv5Be9HHeQEeovd1CZ
	GDw+I97v6y6xZ0MkHIkW2SfQf920v4LtUnreNUW/u03ZkV1aNYCmXYLFXAgr92lp/xxX
	exnNZX3Qxwv/epLxJeJmDOyRuxMN9pvBfVSJIMv3288STjCboXtCqJ2ml1U+xUVe2oH3
	cFUFHrc7YOBeNXiYK/8o2fuYDP13O1u6Y9IJmoZCXyXIxFaQ97uUOorCqf5VySyoq4qq
	SZIFVTim0Vfn0x0XzXjb8W0xGjhBCc0dqVT0lnbOuGSMouJcD3P2bQ++T+Ndr24Sy+zG
	rpEQ==
X-Received: by 10.14.3.9 with SMTP id 9mr1423068eeg.72.1381489118624;
	Fri, 11 Oct 2013 03:58:38 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	a43sm113307201eep.9.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 11 Oct 2013 03:58:37 -0700 (PDT)
Date: Fri, 11 Oct 2013 12:58:50 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20131011105850.GJ2872@jama>
References: <1381176437-4382-1-git-send-email-mario@ossystems.com.br>
MIME-Version: 1.0
In-Reply-To: <1381176437-4382-1-git-send-email-mario@ossystems.com.br>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Mario Domenech Goulart <mario@ossystems.com.br>
Subject: Re: [meta-oe][PATCH] wvstreams: generate wvstreams-valgrind package
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
X-List-Received-Date: Fri, 11 Oct 2013 10:58:37 -0000
X-Groupsio-MsgNum: 46621
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+9faIjRurCDpBc7U"
Content-Disposition: inline

--+9faIjRurCDpBc7U
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 07, 2013 at 05:07:17PM -0300, Mario Domenech Goulart wrote:
> Explicitly set --with-valgrind in EXTRA_OECONF (since it doesn't add
> up dependencies) and generate the wvstreams-valgrind package.
>=20
> Fixes

Do we really need explicit valgrind dependency for all machines?

ERROR: Nothing RPROVIDES 'valgrind' (but
/home/jenkins/oe/shr-core-branches/shr-core/meta-openembedded/meta-oe/recip=
es-connectivity/wvdial/wvstreams_4.6.1.bb
RDEPENDS on or otherwise requires it)
ERROR: valgrind was skipped: incompatible with host arm-oe-linux-gnueabi
(not in COMPATIBLE_HOST)

This is from qemuarm build where host has -gnueabi suffix and isn't
included in valgrind's COMPATIBLE_HOST:
COMPATIBLE_HOST =3D '(i.86|x86_64|powerpc|powerpc64).*-linux'
COMPATIBLE_HOST_armv7a =3D 'arm.*-linux'

>   wvstreams-4.6.1: wvstreams: Files/directories were installed but not sh=
ipped
>     /usr/lib/valgrind
>     /usr/lib/valgrind/wvstreams.supp
>=20
> Signed-off-by: Mario Domenech Goulart <mario@ossystems.com.br>
> ---
>  meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb |    7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb b/met=
a-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
> index ce2b337..a1b38bd 100644
> --- a/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
> +++ b/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
> @@ -22,8 +22,9 @@ PARALLEL_MAKE =3D ""
> =20
>  LDFLAGS_append =3D " -Wl,-rpath-link,${CROSS_DIR}/${TARGET_SYS}/lib"
> =20
> -EXTRA_OECONF =3D " --without-tcl --without-qt --without-pam --without-va=
lgrind"
> +EXTRA_OECONF =3D " --without-tcl --without-qt --without-pam --with-valgr=
ind"
> =20
> +PACKAGES_prepend =3D "${PN}-valgrind "
>  PACKAGES_prepend =3D "libuniconf libuniconf-dbg "
>  PACKAGES_prepend =3D "uniconfd uniconfd-dbg "
>  PACKAGES_prepend =3D "libwvstreams-base libwvstreams-base-dbg "
> @@ -40,3 +41,7 @@ FILES_libwvstreams-base-dbg =3D "${libdir}/.debug/libwv=
utils.so.*"
> =20
>  FILES_libwvstreams-extras     =3D "${libdir}/libwvbase.so.* ${libdir}/li=
bwvstreams.so.*"
>  FILES_libwvstreams-extras-dbg =3D "${libdir}/.debug/libwvbase.so.* ${lib=
dir}/.debug/libwvstreams.so.*"
> +
> +FILES_${PN}-valgrind =3D "${libdir}/valgrind"
> +
> +RDEPENDS_${PN}-valgrind +=3D "valgrind"
> --=20
> 1.7.10.4
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--+9faIjRurCDpBc7U
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlJX2eoACgkQN1Ujt2V2gBws5QCfTFBpsUa9Pk13oIuXDQLrPCoe
YswAniCMP4sIj8LHIBZ1M9lPsXdOfeRc
=8y0j
-----END PGP SIGNATURE-----

--+9faIjRurCDpBc7U--
