Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f41.google.com (mail-ee0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id CF3C76F6E0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Mar 2014 14:14:16 +0000 (UTC)
Received: by mail-ee0-f41.google.com with SMTP id t10so3789362eei.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Mar 2014 07:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=xhTpxmrrNclueuUFADULGTBeNig2cqJ0rw8iVU+cCvw=;
	b=bjXUWOcsD+KAfktgQINEXH4Hh/LYMLIddad5tMo3nLVSMxLYeCxKgFVNUZfhyEFhZQ
	1Am3pB7MLAW/1ti2CAzHJ98hZqQNK2nVGJQoev68wZE3RQ+gh/hzOnMqjp/pRtsmaHVy
	NJVDkUp7mJYBDzCw4ZUPcyythDdrLkxgomFBf4oXXUfABzMUK996pCHoB5Pq5T/sXkVD
	/DvKDhcH46hoDl7VO6GyI3Iw7WcFtP34j1dqxCYm2KMqiz0/H/HhUhKmVHUmB89N0ual
	wHOT8Ld1rQOYeQV17/gz4tlNIds0lvr3QQeFnDGxMd9DtflxC48Y7dFTEwpXyS7QS12h
	LhBw==
X-Received: by 10.15.31.72 with SMTP id x48mr657135eeu.107.1394547256893;
	Tue, 11 Mar 2014 07:14:16 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	f45sm57972099eeg.5.2014.03.11.07.14.13
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Mar 2014 07:14:14 -0700 (PDT)
Date: Tue, 11 Mar 2014 15:14:26 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140311141426.GB2137@jama>
References: <lauren.post@freescale.com>
	<1394227575-27897-1-git-send-email-lauren.post@freescale.com>
	<1394227575-27897-5-git-send-email-lauren.post@freescale.com>
MIME-Version: 1.0
In-Reply-To: <1394227575-27897-5-git-send-email-lauren.post@freescale.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [meta-oe][PATCH 5/7] gtkperf: Create 0.40 version
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
X-List-Received-Date: Tue, 11 Mar 2014 14:14:17 -0000
X-Groupsio-MsgNum: 48592
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kXdP64Ggrk/fb43R"
Content-Disposition: inline

--kXdP64Ggrk/fb43R
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 07, 2014 at 03:26:13PM -0600, Lauren Post wrote:
> gtkperf is a GTK Performance tool
>=20
> Signed-off-by: Lauren Post <lauren.post@freescale.com>
> ---
>  meta-oe/recipes-graphics/gtkperf/gtkperf/Makevars |   25 +++++++++++++++=
+++++
>  meta-oe/recipes-graphics/gtkperf/gtkperf_0.40.bb  |   26 +++++++++++++++=
++++++
>  2 files changed, 51 insertions(+)
>  create mode 100644 meta-oe/recipes-graphics/gtkperf/gtkperf/Makevars
>  create mode 100644 meta-oe/recipes-graphics/gtkperf/gtkperf_0.40.bb
>=20
> diff --git a/meta-oe/recipes-graphics/gtkperf/gtkperf/Makevars b/meta-oe/=
recipes-graphics/gtkperf/gtkperf/Makevars
> new file mode 100644
> index 0000000..8b09f53
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/gtkperf/gtkperf/Makevars
> @@ -0,0 +1,25 @@
> +# Makefile variables for PO directory in any package using GNU gettext.
> +
> +# Usually the message domain is the same as the package name.
> +DOMAIN =3D $(PACKAGE)
> +
> +# These two variables depend on the location of this directory.
> +subdir =3D po
> +top_builddir =3D ..
> +
> +# These options get passed to xgettext.
> +XGETTEXT_OPTIONS =3D --keyword=3D_ --keyword=3DN_
> +
> +# This is the copyright holder that gets inserted into the header of the
> +# $(DOMAIN).pot file.  Set this to the copyright holder of the surroundi=
ng
> +# package.  (Note that the msgstr strings, extracted from the package's
> +# sources, belong to the copyright holder of the package.)  Translators =
are
> +# expected to transfer the copyright for their translations to this pers=
on
> +# or entity, or to disclaim their copyright.  The empty string stands for
> +# the public domain; in this case the translators are expected to discla=
im
> +# their copyright.
> +COPYRIGHT_HOLDER =3D Free Software Foundation, Inc.
> +
> +# This is the list of locale categories, beyond LC_MESSAGES, for which t=
he
> +# message catalogs shall be used.  It is usually empty.
> +EXTRA_LOCALE_CATEGORIES =3D
> diff --git a/meta-oe/recipes-graphics/gtkperf/gtkperf_0.40.bb b/meta-oe/r=
ecipes-graphics/gtkperf/gtkperf_0.40.bb
> new file mode 100644
> index 0000000..7e97a11
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/gtkperf/gtkperf_0.40.bb
> @@ -0,0 +1,26 @@
> +SUMMARY =3D "GTK Performance tool"
> +DESCRIPTION =3D "GTK Performance tools"

Don't duplicate SUMMARY (extra 's' doesn't count)

> +SECTION =3D "libs"
> +LICENSE =3D "LGPLv2.1"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae=
19f"
> +
> +SRC_URI =3D "http://prdownloads.sourceforge.net/gtkperf/gtkperf_${PV}.ta=
r.gz \

gtkperf -> ${BPN}

> +           file://Makevars"
> +
> +SRC_URI[md5sum] =3D "4331dde4bb83865e15482885fcb0cc53"
> +SRC_URI[sha256sum] =3D "9704344e732038eecbd007dd996a56293a6b027b5b76f3f0=
36273a3fae1ab27b"
> +
> +S =3D "${WORKDIR}/gtkperf"

gtkperf -> ${BPN}

> +
> +inherit autotools binconfig pkgconfig gettext
> +
> +do_configure_prepend () {
> +	rm -f ${S}/m4/init.m4
> +	cp -f ${WORKDIR}/Makevars ${S}/po/

Please use consistent indentation: tab -> 4 spaces

> +}
> +
> +do_install_append () {
> +     rm -rf ${WORKDIR}/image/usr/doc

Please use consistent indentation: 5 spaces -> 4 spaces

${WORKDIR}/image -> ${D}

> +}
> +
> +FILES_${PN} +=3D "${exec_prefix}/share/duck.png"

${exec_prefix}/share -> ${datadir}

I've made above modifications when cherry-picking from patchwork to
master-next, so don't send v2 (unless you need to change something else
as well)

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--kXdP64Ggrk/fb43R
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEUEARECAAYFAlMfGkIACgkQN1Ujt2V2gBxtDQCYxt/xfjRcPN8T9THdLdlIaqHY
kgCgjaEKqjPB7tbm68Z8d0J+zMo6hoY=
=+i/9
-----END PGP SIGNATURE-----

--kXdP64Ggrk/fb43R--
