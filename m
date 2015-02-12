Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id 7955473419
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Feb 2015 20:44:08 +0000 (UTC)
Received: by mail-wi0-f169.google.com with SMTP id em10so7864924wid.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Feb 2015 12:44:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=JuYvhNBGuX32th/TGB9NGq8B8gvJ3Kf4jvyje7onKeE=;
	b=QeG22ef0AHz/KNQW5Hzn0oT+xSOuG+tQnIR3xdhjSe2sd2aTBsPX/rOJQ4ehZdJEw5
	XXj+Wi5aqsq7pw2j6XqDayPe7EV+/ZQI8R7hUVVieY80gmsbI1ichN2OelDL/YwIIMsx
	DFJtu17+mEsmhqetJOz5l+ULYFFkdIx6SYXTPdcX5CB18IeXsBA+kSFX+rd1DM6Bmdaa
	G6lg5DTH8a3orduYCOD7q8i3ZePnsjhzm/u6IAZSNsZUcBzxXPX6L/D3jTYCt2sa2GsD
	dQEjR8AazAjr6IXfL/Olh/McUpPe3ZoJQwS9tCWuVMEWTPggUmO77JF4kkYt31qU78Bm
	o3aA==
X-Received: by 10.194.6.228 with SMTP id e4mr11360223wja.63.1423773849805;
	Thu, 12 Feb 2015 12:44:09 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	kr5sm2223823wjc.1.2015.02.12.12.44.08
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Feb 2015 12:44:09 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 12 Feb 2015 21:44:13 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150212204413.GG2272@jama>
References: <1423751798-25797-1-git-send-email-philip@balister.org>
MIME-Version: 1.0
In-Reply-To: <1423751798-25797-1-git-send-email-philip@balister.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-python][PATCH] python-pyzmq : Add recipe for Python Zero Message Queue bindings.
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
X-List-Received-Date: Thu, 12 Feb 2015 20:44:13 -0000
X-Groupsio-MsgNum: 54216
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1XWsVB21DFCvn2e8"
Content-Disposition: inline

--1XWsVB21DFCvn2e8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 12, 2015 at 09:36:38AM -0500, Philip Balister wrote:
> Signed-off-by: Philip Balister <philip@balister.org>

Drop space before ":" in subject.

> ---
>  .../python/python-pyzmq/club-rpath-out.patch       | 26 ++++++++++++++++=
+++++
>  .../recipes-devtools/python/python-pyzmq_14.5.0.bb | 27 ++++++++++++++++=
++++++
>  2 files changed, 53 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python-pyzmq/club=
-rpath-out.patch
>  create mode 100644 meta-python/recipes-devtools/python/python-pyzmq_14.5=
=2E0.bb
>=20
> diff --git a/meta-python/recipes-devtools/python/python-pyzmq/club-rpath-=
out.patch b/meta-python/recipes-devtools/python/python-pyzmq/club-rpath-out=
=2Epatch
> new file mode 100644
> index 0000000..2dc3b73
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-pyzmq/club-rpath-out.pat=
ch
> @@ -0,0 +1,26 @@
> +diff --git a/setup.py b/setup.py
> +index 62df445..1fdbdeb 100755
> +--- a/setup.py
> ++++ b/setup.py
> +@@ -213,12 +213,6 @@ def settings_from_prefix(prefix=3DNone, bundle_libz=
mq_dylib=3DFalse):
> +                 pass
> +                 # unused rpath args for OS X:
> +                 # settings['extra_link_args'] =3D ['-Wl,-rpath','-Wl,$O=
RIGIN/..']
> +-            else:
> +-                settings['runtime_library_dirs'] +=3D ['$ORIGIN/..']
> +-        elif sys.platform !=3D 'darwin':
> +-            settings['runtime_library_dirs'] +=3D [
> +-                os.path.abspath(x) for x in settings['library_dirs']
> +-            ]
> +    =20
> +     return settings
> +=20
> +@@ -592,8 +586,6 @@ class Configure(build_ext):
> +                 pass
> +                 # unused rpath args for OS X:
> +                 # settings['extra_link_args'] =3D ['-Wl,-rpath','-Wl,$O=
RIGIN/../zmq']
> +-            else:
> +-                settings['runtime_library_dirs'] =3D [ os.path.abspath(=
pjoin('.', 'zmq')) ]
> +        =20
> +         line()
> +         info("Configure: Autodetecting ZMQ settings...")
> diff --git a/meta-python/recipes-devtools/python/python-pyzmq_14.5.0.bb b=
/meta-python/recipes-devtools/python/python-pyzmq_14.5.0.bb
> new file mode 100644
> index 0000000..8b921b5
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-pyzmq_14.5.0.bb
> @@ -0,0 +1,27 @@
> +SUMMARY =3D "Pyzmq provides Zero message queue access for the Python lan=
guage"
> +HOMEPAGE =3D "http://zeromq.org/bindings:python"
> +SECTION =3D "devel/python"
> +LICENSE =3D "BSD"
> +LIC_FILES_CHKSUM =3D "file://COPYING.BSD;md5=3D11c65680f637c3df7f58bbc8d=
133e96e"
> +DEPENDS =3D "zeromq"
> +
> +SRC_URI =3D "https://pypi.python.org/packages/source/p/pyzmq/pyzmq-${PV}=
=2Etar.gz \
> +           file://club-rpath-out.patch \
> +"
> +SRC_URI[md5sum] =3D "8d3351a8ca2ca2a272a3f96bcb963e41"
> +SRC_URI[sha256sum] =3D "5d6e045634456cf5496f50871fd3e3a5ede2b90433284dbf=
e985bb67c97f77bd"
> +
> +S =3D "${WORKDIR}/pyzmq-${PV}"
> +
> +inherit setuptools pkgconfig
> +
> +FILES_${PN}-dbg =3D+ "${PYTHON_SITEPACKAGES_DIR}/zmq/backend/cython/.deb=
ug"
> +
> +do_compile_prepend() {
> +	echo [global] > ${S}/setup.cfg
> +	echo zmq_prefix =3D ${STAGING_DIR_HOST} >> ${S}/setup.cfg
> +	echo have_sys_un_h =3D True >> ${S}/setup.cfg
> +	echo skip_check_zmq =3D True >> ${S}/setup.cfg
> +	echo libzmq_extension =3D False >> ${S}/setup.cfg
> +	echo no_libzmq_extension =3D True >> ${S}/setup.cfg

Use 4 spaces for indentation, no tabs in meta-oe and other sane layers!

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

--1XWsVB21DFCvn2e8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlTdEJ0ACgkQN1Ujt2V2gBw1RACfXxnODCVpYSJcYuroML4T7lIE
ZZAAn0+MFfWQ1Y22XjPQvUepyrtdOoeQ
=oYoQ
-----END PGP SIGNATURE-----

--1XWsVB21DFCvn2e8--
