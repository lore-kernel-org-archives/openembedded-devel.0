Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f180.google.com (mail-pd0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id 0D4FE600B3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 May 2015 00:56:37 +0000 (UTC)
Received: by pdea3 with SMTP id a3so28900380pde.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 May 2015 17:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:message-id
	:references:to;
	bh=Vw76gz4E+LmzZbn+yD+YARmzmix/qLprYCk25YnElYo=;
	b=aAhMoUFFEASodZU3TF2IbAxzgM3E3TjLv4Aa5xfIqHOFjGOPoWYHrGVayxofe3/K0L
	n1jArrxJtvBFEtz3y4l4u2oZtFeXm0KUN8Sr/NCefoL7dcqRQ5f3HaW0VumSrZGn7em5
	qGZzjje3gKe2YkO0NbSCV4XHEOY2JlKmyv1z5deduzKZgzKtRJySMicTMDounTIVAVHo
	MHq3q3amuhvVsKTwioYmJwi/OlturzMfsp4GtKn3Ql/h0OU09ELI4/N1ieHQh3IV+l5b
	jNdWb4TQX3Vvkzl7QFlKGV+EhQ5F/+jQfbMvYV4Z/Y4YHUW5AC5Nl28FlhXYbkovDacT
	JJsQ==
X-Received: by 10.68.69.66 with SMTP id c2mr153755pbu.169.1432774597764;
	Wed, 27 May 2015 17:56:37 -0700 (PDT)
Received: from ?IPv6:2601:9:3580:84c:90eb:a06b:3186:ca08?
	([2601:9:3580:84c:90eb:a06b:3186:ca08])
	by mx.google.com with ESMTPSA id dk5sm360131pdb.88.2015.05.27.17.56.36
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 27 May 2015 17:56:37 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
X-Pgp-Agent: GPGMail 2.5b6
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAAzKXngGv=tmUgOnBvAaz37mdc5R8k6YPjaQNc2pYWJF+qAD=Q@mail.gmail.com>
Date: Wed, 27 May 2015 17:56:35 -0700
Message-Id: <34D595E1-BD07-4EA7-A4F7-7E75AB8249A1@gmail.com>
References: <CAAzKXngGv=tmUgOnBvAaz37mdc5R8k6YPjaQNc2pYWJF+qAD=Q@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.2098)
Subject: Re: [meta-browser] [PATCH 2/2] chromium, cef: fetch chromium source from git
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
X-List-Received-Date: Thu, 28 May 2015 00:56:38 -0000
X-Groupsio-MsgNum: 55672
Content-Type: multipart/signed;
	boundary="Apple-Mail=_9913DCEF-6F94-4331-94CC-53572441D810";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_9913DCEF-6F94-4331-94CC-53572441D810
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On May 27, 2015, at 10:37 AM, Zoltan Kuscsik =
<zoltan.kuscsik@linaro.org> wrote:
>=20
> Updated recipe to fetch Chromium from git.
> LASTCHANGE file is now created using the proper
> gclient hook.
>=20
> Change-Id: Ie1790abec002a0dd39c8d0aae3d03f5ebe6f46aa
> Signed-off-by: Zoltan Kuscsik <zoltan.kuscsik@linaro.org>
> ---
> .../cef3/01_get_svn_version_from_LASTCHANGE.patch  | 32 ------------
> recipes-browser/chromium/cef3_280796.bb            | 57
> ++++++++++++++++------
> 2 files changed, 43 insertions(+), 46 deletions(-)
> delete mode 100644
> recipes-browser/chromium/cef3/01_get_svn_version_from_LASTCHANGE.patch
>=20
> diff --git
> =
a/recipes-browser/chromium/cef3/01_get_svn_version_from_LASTCHANGE.patch
> =
b/recipes-browser/chromium/cef3/01_get_svn_version_from_LASTCHANGE.patch
> deleted file mode 100644
> index 9b14429..0000000
> --- =
a/recipes-browser/chromium/cef3/01_get_svn_version_from_LASTCHANGE.patch
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -Fetch the revision from LASTCHANGE file programmatically
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Zoltan Kuscsik <zoltan.kuscsik@linaro.org>
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> -diff --git a/cef/tools/make_version_header.py
> b/cef/tools/make_version_header.py
> -index 84d49f5..395c2cf 100644
> ---- a/cef/tools/make_version_header.py
> -+++ b/cef/tools/make_version_header.py
> -@@ -64,6 +64,8 @@ def write_svn_header(header, chrome_version,
> cef_version, cpp_header_dir):
> -       revision =3D svn.get_revision()
> -     elif git.is_checkout('.'):
> -       revision =3D git.get_svn_revision()
> -+    elif os.path.isfile("../build/util/LASTCHANGE"):
> -+      revision =3D
> open("../build/util/LASTCHANGE").read().split("=3D")[1].strip()
> -     else:
> -       raise Exception('Not a valid checkout')
> -
> -diff --git a/cef/tools/revision.py b/cef/tools/revision.py
> -index 1d94602..eb89e3b 100644
> ---- a/cef/tools/revision.py
> -+++ b/cef/tools/revision.py
> -@@ -16,6 +16,8 @@ if os.path.exists(os.path.join('.', '.svn')):
> -   sys.stdout.write(svn.get_revision())
> - elif os.path.exists(os.path.join('.', '.git')):
> -   sys.stdout.write(git.get_svn_revision())
> -+elif os.path.isfile("../build/util/LASTCHANGE"):
> -+  revision =3D =
open("../build/util/LASTCHANGE").read().split("=3D")[1].strip()
> - else:
> -   raise Exception('Not a valid checkout')
> diff --git a/recipes-browser/chromium/cef3_280796.bb
> b/recipes-browser/chromium/cef3_280796.bb
> index 9a9efe5..806a4ac 100644
> --- a/recipes-browser/chromium/cef3_280796.bb
> +++ b/recipes-browser/chromium/cef3_280796.bb
> @@ -7,21 +7,22 @@ RDEPENDS_${PN} +=3D "pango cairo fontconfig pciutils
> pulseaudio freetype fontconfi
> SRCREV_tools =3D "99bcb0e676eb396bcf8e1af3903aa4b578aeeee0"
> SRCREV_cef =3D "bbad53dfca9f98dddcb31a590410fece0a4f0234"
> SRCREV_egl =3D "a5b81b7617ba6757802b9b5f8c950034d5f961ec"
> -SRCREV_FORMAT =3D "cef_egl_tools"
> +SRCREV_FORMAT =3D "cef_egl"
>=20
> -SRC_URI =3D "
> =
http://people.linaro.org/~zoltan.kuscsik/chromium-browser/chromium_rev_${P=
V}.tar.xz
> \
> -           git://
> =
github.com/kuscsik/chromiumembedded.git;protocol=3Dhttps;destsuffix=3Dsrc/=
cef;branch=3Daura;name=3Dcef
> \
> -           git://
> =
github.com/kuscsik/ozone-egl.git;protocol=3Dhttps;destsuffix=3Dsrc/ui/ozon=
e/platform/egl;branch=3Dmaster;name=3Degl
> \
> -           git://
> =
chromium.googlesource.com/chromium/tools/depot_tools.git;protocol=3Dhttps;=
destsuffix=3Ddepot_tools;branch=3Dmaster;name=3Dtools
> \
> -           file://01_get_svn_version_from_LASTCHANGE.patch \
> -          file://cef-simple \
> -         "
> -SRC_URI[md5sum] =3D "9efbb50283b731042e62b9bd5e312b2f"
> -SRC_URI[sha256sum] =3D
> "f608e97dadf6ea4d885b24fd876896d46840fa39bf743ea2025075aee9fb348d"
> +SRC_URI =3D "git://
> =
chromium.googlesource.com/chromium/tools/depot_tools.git;protocol=3Dhttps;=
destsuffix=3Ddepot_tools;branch=3Dmaster;name=3Dtools
> \
> +           git://
> =
github.com/kuscsik/chromiumembedded.git;protocol=3Dhttps;destsuffix=3D${S}=
/src/cef;branch=3Daura;name=3Dcef
> \
> +           git://
> =
github.com/kuscsik/ozone-egl.git;protocol=3Dhttps;destsuffix=3D${S}/src/ui=
/ozone/platform/egl;branch=3Dmaster;name=3Degl\
> +           file://cef-simple\
> +  "
>=20
> -S =3D "${WORKDIR}/chromium_rev_${PV}"
> +export =
CHROMIUM_SRC_GIT_URL=3D"https://chromium.googlesource.com/chromium/src
> "
> +export =
CHROMIUM_SRC_GIT_COMMIT=3D"e800fe7470fa87dc1ca5b148a7c2c41f603fdcbd"
>=20
> -do_fetch[vardeps] +=3D "SRCREV_FORMAT SRCREV_cef SRCREV_egl =
SRCREV_tools"
> +S =3D "${WORKDIR}/chromium_rev_${PV}/"
> +
> +B =3D "${S}/src/"
> +
> +do_fetch[vardeps] +=3D "SRCREV_FORMAT SRCREV_cef SRCREV_egl"
>=20
> GYP_ARCH_DEFINES_armv7a =3D " target_arch=3Darm arm_float_abi=3Dhard"
> GYP_ARCH_DEFINES_i586 =3D " target_arch=3Dia32"
> @@ -30,14 +31,41 @@ export GYP_GENERATORS=3D"ninja"
> export BUILD_TARGET_ARCH=3D"${TARGET_ARCH}"
> export GYP_DEFINES=3D"${GYP_ARCH_DEFINES}
> release_extra_cflags=3D'-Wno-error=3Dunused-local-typedefs' =
sysroot=3D''"
>=20
> +do_fetch_chromium_source_from_git() {
> +  cd ${S}
> +  export PATH=3D${WORKDIR}/depot_tools:"$PATH"
> +
> +  # Note: --deps-file needs to set to .DEPS.git for syncing to old
> +  # chromium versions
> +  gclient config ${CHROMIUM_SRC_GIT_URL} --deps-file=3D".DEPS.git"
> +
> +  # Runhooks is disabled. Running the hooks will trigger the
> +  # gyp_chromium command replaced with cef_create_projects.sh by
> +  # cef3.
> +
> +  gclient sync -f --nohooks --revision src@${CHROMIUM_SRC_GIT_COMMIT}
> +
> +  # We need the lastchange hook to generate the LASTCHANGE revision =
info
> +  # file.
> +
> +  python src/build/util/lastchange.py -o src/build/util/LASTCHANGE
> +}


small nit. formatting is not correct for this shell function.
> +
> +addtask fetch_chromium_source_from_git after do_patch before =
do_configure
> +


so we will never patch chromium sources ? if we have to how will we do =
it ?


> do_configure_append() {
>        export PATH=3D${WORKDIR}/depot_tools:"$PATH"
>        # End of LD Workaround
>        #-----------------------
>        # Configure cef
>        #------------------------
> -       cd cef
> -       ./cef_create_projects.sh -I ${BUILD_TARGET_ARCH}_ozone.gypi =
--depth
> ../
> +       cd ${S}/src/cef
> +
> +  # Fatal linker warnings need to be disalbed to avoid linker issu
> +  # with GCC 4.9:
> +  #
> =
http://lists.openembedded.org/pipermail/openembedded-core/2014-August/0959=
47.html
> +
> +       ./cef_create_projects.sh -I ${BUILD_TARGET_ARCH}_ozone.gypi =
--depth
> ../ -Ddisable_fatal_linker_warnings=3D
>        cd -
> }
>=20
> @@ -47,5 +75,6 @@ do_qa_configure() {
> }
>=20
> do_compile() {
> + cd ${S}/src

formatting is inconsistent

>        ninja -C out/${CHROMIUM_BUILD_TYPE} cefsimple
> }
> --
> 1.9.1
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_9913DCEF-6F94-4331-94CC-53572441D810
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlVmZ8MACgkQuwUzVZGdMxR/pgCfQN7Q7VYv5QI2W6u5tkFX711y
+zYAnAsyIX4CAMtbi1BwohSsGmn7btdS
=8Xxj
-----END PGP SIGNATURE-----

--Apple-Mail=_9913DCEF-6F94-4331-94CC-53572441D810--
