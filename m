Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f43.google.com (mail-wg0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 09ABE60167
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Dec 2014 15:43:38 +0000 (UTC)
Received: by mail-wg0-f43.google.com with SMTP id k14so4402958wgh.16
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Dec 2014 07:43:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=zY5whXkEYjEdKUplYmaArkZYB6KaxG42G2qo7r5pqSg=;
	b=wPdcnDmsuvd194Kn46JemX3OzQol7QoyI/2lNJu0gDz6AonzVn0X9Sc0gRrLhGv0Kd
	anK0U/5Z5OShDyU6MIyiaAokMoOJdlFZfyx0cneTa2YbShiFBFBuVildtlgSLmiTh3BW
	VHfdHDVcRNANC0GLMtGBOy79VDg2qxKoVSox8Bx64/FewqHsdYjTxGEY/mTv6R2fIu3c
	tcR/qoFcR7VkDhlB2sWt7JkBLsClChd+N3aNKka9918pZPIXizeyACUOV0NoJZGNRu5A
	8gZesUMIeav8yukucT1JyAdSrRsJOJv2MpgCN3nLCREsWKq0qP5B5DBPDcNpuhHzcDXC
	CyOg==
X-Received: by 10.194.60.19 with SMTP id d19mr127513828wjr.48.1420040618518;
	Wed, 31 Dec 2014 07:43:38 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	l9sm47478414wic.21.2014.12.31.07.43.37
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 31 Dec 2014 07:43:37 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 31 Dec 2014 16:43:39 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20141231154339.GD2469@jama>
References: <1419947615-27947-1-git-send-email-ross.burton@intel.com>
	<1419947615-27947-4-git-send-email-ross.burton@intel.com>
MIME-Version: 1.0
In-Reply-To: <1419947615-27947-4-git-send-email-ross.burton@intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH 4/5] telepathy-python: add (moved from oe-core)
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
X-List-Received-Date: Wed, 31 Dec 2014 15:43:41 -0000
X-Groupsio-MsgNum: 53543
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="eheScQNz3K90DVRs"
Content-Disposition: inline

--eheScQNz3K90DVRs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 30, 2014 at 01:53:34PM +0000, Ross Burton wrote:
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  .../telepathy-python-0.15.19/parallel_make.patch   |   43 ++++++++++++++=
++++++
>  .../remove_duplicate_install.patch                 |   26 ++++++++++++
>  .../telepathy-python_fix_for_automake_1.12.patch   |   26 ++++++++++++
>  .../telepathy/telepathy-python_0.15.19.bb          |   32 +++++++++++++++
>  4 files changed, 127 insertions(+)
>  create mode 100644 meta-oe/recipes-connectivity/telepathy/telepathy-pyth=
on-0.15.19/parallel_make.patch
>  create mode 100644 meta-oe/recipes-connectivity/telepathy/telepathy-pyth=
on-0.15.19/remove_duplicate_install.patch
>  create mode 100644 meta-oe/recipes-connectivity/telepathy/telepathy-pyth=
on-0.15.19/telepathy-python_fix_for_automake_1.12.patch
>  create mode 100644 meta-oe/recipes-connectivity/telepathy/telepathy-pyth=
on_0.15.19.bb
>=20
> diff --git a/meta-oe/recipes-connectivity/telepathy/telepathy-python-0.15=
=2E19/parallel_make.patch b/meta-oe/recipes-connectivity/telepathy/telepath=
y-python-0.15.19/parallel_make.patch
> new file mode 100644
> index 0000000..2488246
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/telepathy/telepathy-python-0.15.19/par=
allel_make.patch
> @@ -0,0 +1,43 @@
> +Add dependency of __init__.py
> +
> +Tasks must be done after exec of __init__, which creates the
> +src/_generated directory that tasks are based on.
> +
> +Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
> +
> +Upstream-Status: Submitted
> +(However it seems that this project is out of maintanence.)
> +
> +diff -ruN telepathy-python-0.15.19-orig/src/Makefile.am telepathy-python=
-0.15.19/src/Makefile.am
> +--- telepathy-python-0.15.19-orig/src/Makefile.am	2011-03-10 08:51:49.00=
0000000 +0800
> ++++ telepathy-python-0.15.19/src/Makefile.am	2011-03-10 08:54:45.0000000=
00 +0800
> +@@ -39,17 +39,17 @@
> + XSLTPROC_OPTS =3D --nonet --novalid --xinclude
> + tools_dir =3D $(top_srcdir)/tools
> +=20
> +-_generated/interfaces.py: $(tools_dir)/python-interfaces-generator.xsl =
$(wildcard $(spec_dir)/*.xml)
> ++_generated/interfaces.py: _generated/__init__.py $(tools_dir)/python-in=
terfaces-generator.xsl $(wildcard $(spec_dir)/*.xml)
> + 	$(AM_V_GEN)$(XSLTPROC) $(XSLTPROC_OPTS) -o $@ \
> + 	    $(tools_dir)/python-interfaces-generator.xsl \
> + 	    $(spec_dir)/all.xml
> +=20
> +-_generated/constants.py: $(tools_dir)/python-constants-generator.xsl $(=
wildcard $(spec_dir)/*.xml)
> ++_generated/constants.py: _generated/__init__.py $(tools_dir)/python-con=
stants-generator.xsl $(wildcard $(spec_dir)/*.xml)
> + 	$(AM_V_GEN)$(XSLTPROC) $(XSLTPROC_OPTS) -o $@ \
> + 	    $(tools_dir)/python-constants-generator.xsl \
> + 	    $(spec_dir)/all.xml
> +=20
> +-_generated/errors.py: $(tools_dir)/python-errors-generator.xsl $(wildca=
rd $(spec_dir)/*.xml)
> ++_generated/errors.py: _generated/__init__.py $(tools_dir)/python-errors=
-generator.xsl $(wildcard $(spec_dir)/*.xml)
> + 	$(AM_V_GEN)$(XSLTPROC) $(XSLTPROC_OPTS) -o $@ \
> + 	    $(tools_dir)/python-errors-generator.xsl \
> + 	    $(spec_dir)/all.xml
> +@@ -58,7 +58,7 @@
> + 	$(AM_V_GEN)$(mkdir_p) $(dir $@)
> + 	@echo "# Placeholder for package" > $@
> +=20
> +-_generated/%.py: $(tools_dir)/spec-to-python.xsl $(spec_dir)/%.xml
> ++_generated/%.py: _generated/__init__.py $(tools_dir)/spec-to-python.xsl=
 $(spec_dir)/%.xml
> + 	$(AM_V_GEN)$(XSLTPROC) $(XSLTPROC_OPTS) -o $@ \
> + 	    $(tools_dir)/spec-to-python.xsl \
> + 	    $(spec_dir)/$*.xml
> diff --git a/meta-oe/recipes-connectivity/telepathy/telepathy-python-0.15=
=2E19/remove_duplicate_install.patch b/meta-oe/recipes-connectivity/telepat=
hy/telepathy-python-0.15.19/remove_duplicate_install.patch
> new file mode 100644
> index 0000000..df95a4c
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/telepathy/telepathy-python-0.15.19/rem=
ove_duplicate_install.patch
> @@ -0,0 +1,26 @@
> +commit f6c67662145de889055a86a6b3b12c70a45fc8d5
> +Author: Dongxiao Xu <dongxiao.xu@intel.com>
> +Date:   Wed Sep 7 16:02:20 2011 +0800
> +
> +    Avoid duplicated installation of errors.py
> +   =20
> +    newer version of autotools don't seem to like listing files to insta=
ll
> +    twice. Remove one errors.py from the installation list.
> +   =20
> +    Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
> +   =20
> +    Upstream-Status: Inappropirate [upstream inactive]
> +   =20
> +diff --git a/src/Makefile.am b/src/Makefile.am
> +index 5c27dfe..7536e43 100644
> +--- a/src/Makefile.am
> ++++ b/src/Makefile.am
> +@@ -11,7 +11,7 @@ telepathy_PYTHON =3D \
> +=20
> + # telepathy._generated.* auto-generated modules
> + spec_dir =3D $(top_srcdir)/spec
> +-spec_files :=3D $(patsubst $(spec_dir)%.xml,_generated%.py,$(wildcard $=
(spec_dir)/*.xml))
> ++spec_files :=3D $(filter-out _generated/errors.py, $(patsubst $(spec_di=
r)%.xml,_generated%.py,$(wildcard $(spec_dir)/*.xml)))
> +=20
> + BUILT_SOURCES =3D \
> + 	_generated/interfaces.py \
> diff --git a/meta-oe/recipes-connectivity/telepathy/telepathy-python-0.15=
=2E19/telepathy-python_fix_for_automake_1.12.patch b/meta-oe/recipes-connec=
tivity/telepathy/telepathy-python-0.15.19/telepathy-python_fix_for_automake=
_1.12.patch
> new file mode 100644
> index 0000000..f613fdc
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/telepathy/telepathy-python-0.15.19/tel=
epathy-python_fix_for_automake_1.12.patch
> @@ -0,0 +1,26 @@
> +Upstream-Status: Pending
> +
> +automake 1.12 has deprecated use of mkdir_p, and it recommends
> +use of MKDIR_P instead. Changed the code to avoid these kind=20
> +of warning-errors.
> +
> +| make[1]: _generated/: Command not found
> +| make[1]: *** [_generated/__init__.py] Error 127
> +| make[1]: Leaving directory `/srv/home/nitin/builds2/build0/tmp/work/i5=
86-poky-linux/telepathy-python-0.15.19-r4/telepathy-python-0.15.19/src'
> +| make: *** [all-recursive] Error 1
> +
> +Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
> +2012/07/10
> +Index: telepathy-python-0.15.19/src/Makefile.am
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- telepathy-python-0.15.19.orig/src/Makefile.am
> ++++ telepathy-python-0.15.19/src/Makefile.am
> +@@ -55,7 +55,7 @@ _generated/errors.py: _generated/__init_
> + 	    $(spec_dir)/all.xml
> +=20
> + _generated/__init__.py:
> +-	$(AM_V_GEN)$(mkdir_p) $(dir $@)
> ++	$(AM_V_GEN)$(MKDIR_P) $(dir $@)
> + 	@echo "# Placeholder for package" > $@
> +=20
> + _generated/%.py: _generated/__init__.py $(tools_dir)/spec-to-python.xsl=
 $(spec_dir)/%.xml
> diff --git a/meta-oe/recipes-connectivity/telepathy/telepathy-python_0.15=
=2E19.bb b/meta-oe/recipes-connectivity/telepathy/telepathy-python_0.15.19.=
bb
> new file mode 100644
> index 0000000..1716702
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/telepathy/telepathy-python_0.15.19.bb
> @@ -0,0 +1,32 @@
> +SUMMARY =3D "Telepathy IM framework - Python package"
> +HOMEPAGE =3D "http://telepathy.freedesktop.org/wiki/"
> +LICENSE =3D "LGPLv2.1+"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D2d5025d4aa3495befef8f17206a5b=
0a1 \
> +                    file://src/utils.py;beginline=3D1;endline=3D17;md5=
=3D9a07d1a9791a7429a14e7b25c6c86822"
> +
> +DEPENDS =3D "libxslt-native"
> +RDEPENDS_${PN} +=3D "python-dbus"
> +
> +SRC_URI =3D "http://telepathy.freedesktop.org/releases/${BPN}/${BPN}-${P=
V}.tar.gz \
> +           file://parallel_make.patch \
> +           file://remove_duplicate_install.patch \
> +           file://telepathy-python_fix_for_automake_1.12.patch"
> +
> +PR =3D "r6"
> +
> +inherit autotools pythonnative
> +
> +SRC_URI[md5sum] =3D "f7ca25ab3c88874015b7e9728f7f3017"
> +SRC_URI[sha256sum] =3D "244c0e1bf4bbd78ae298ea659fe10bf3a73738db55015676=
7cc2477aedf72376"
> +
> +FILES_${PN} +=3D "\
> +    ${libdir}/python*/site-packages/telepathy/*.py \
> +    ${libdir}/python*/site-packages/telepathy/*/*.py \
> +    "
> +
> +do_install_append () {
> +	rm -f ${D}${libdir}/python*/site-packages/telepathy/*.pyc
> +	rm -f ${D}${libdir}/python*/site-packages/telepathy/*.pyo
> +	rm -f ${D}${libdir}/python*/site-packages/telepathy/*/*.pyc
> +	rm -f ${D}${libdir}/python*/site-packages/telepathy/*/*.pyo
> +}

I've fixed indentation when cherry-picking this to master-next.

> --=20
> 1.7.10.4
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--eheScQNz3K90DVRs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlSkGasACgkQN1Ujt2V2gBx3SgCgtG20AkNFCFHi2Qe52nquzIrY
uKgAoJCUIfmHFL4QwnYlun3xYTZSua2g
=Qd6d
-----END PGP SIGNATURE-----

--eheScQNz3K90DVRs--
