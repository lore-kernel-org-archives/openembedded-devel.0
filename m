Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f176.google.com (mail-pd0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id CBC9475D37
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Jul 2015 17:27:37 +0000 (UTC)
Received: by pdbdz6 with SMTP id dz6so34622677pdb.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Jul 2015 10:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:message-id
	:references:to;
	bh=a3RQw77e2Wwq3x4zOZ4HlwzJc8MRDo4Uo4vh28rjVb4=;
	b=QrSz4kjTEv/cqLxE9yaIWuQ5EZGTOVXW/qfPlPxhHvw60p/D/9SRrBlAEWCpCVVQbM
	8QhWYcKQPPqgsiVrqnEAEVDbfgyDHRz7L16NiilyeHeaJo2VgJqed7xV/+qOxlsfL1/F
	kAKQub06aUVVCvL34zuq/KZKMYi9xdQms88rlM40A5s4Ant7BPx4+RoumJBWmE5HPrLc
	WK9oQjG5MnbrDNzW8hVRhpSmZ3wiMQyO/u1W7pwnb3gLUAl0aGn+9Ef4/ElPtrG608bv
	bPBQxN7+T5lXz3v+Zg+k1KFpeTfh7bUhzbpkFbUnI9Musdoz1QLqGYfxU2yN2hxD8aha
	cphg==
X-Received: by 10.68.225.42 with SMTP id rh10mr11189640pbc.158.1436290057466; 
	Tue, 07 Jul 2015 10:27:37 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:709e:7557:280f:f3a4?
	([2601:646:8601:4580:709e:7557:280f:f3a4])
	by mx.google.com with ESMTPSA id
	hf7sm22461734pbc.66.2015.07.07.10.27.36
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 07 Jul 2015 10:27:36 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2102\))
X-Pgp-Agent: GPGMail 2.5
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1433416089-1024-1-git-send-email-zoltan.kuscsik@linaro.org>
Date: Tue, 7 Jul 2015 10:27:31 -0700
Message-Id: <54A2E696-308F-43B2-ACAC-88E4D4A32B2C@gmail.com>
References: <1433416089-1024-1-git-send-email-zoltan.kuscsik@linaro.org>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.2102)
Subject: Re: [meta-browser][PATCH] chromium, cef: fetch chromium source from git
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
X-List-Received-Date: Tue, 07 Jul 2015 17:27:43 -0000
X-Groupsio-MsgNum: 56178
Content-Type: multipart/signed;
	boundary="Apple-Mail=_497EACD8-7765-4125-B259-7FC89342FD7C";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_497EACD8-7765-4125-B259-7FC89342FD7C
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Hi Zoltan

Sorry for late reply. The patch looks ok, there are few formatting nits. =
Please use tabs in shell functions
instead of 4 spaces as it seems to be done in this patch.


> On Jun 4, 2015, at 4:08 AM, Zoltan Kuscsik <zoltan.kuscsik@linaro.org> =
wrote:
>=20
> Updated recipe to fetch Chromium from git.
> LASTCHANGE file is now created using the proper
> gclient hook.
>=20
> Change-Id: Ie1790abec002a0dd39c8d0aae3d03f5ebe6f46aa
> Signed-off-by: Zoltan Kuscsik <zoltan.kuscsik@linaro.org>
> ---
> .../cef3/01_get_svn_version_from_LASTCHANGE.patch  | 32 ----------
> recipes-browser/chromium/cef3_280796.bb            | 73 =
+++++++++++++++-------
> 2 files changed, 51 insertions(+), 54 deletions(-)
> delete mode 100644 =
recipes-browser/chromium/cef3/01_get_svn_version_from_LASTCHANGE.patch
>=20
> diff --git =
a/recipes-browser/chromium/cef3/01_get_svn_version_from_LASTCHANGE.patch =
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
> -diff --git a/cef/tools/make_version_header.py =
b/cef/tools/make_version_header.py
> -index 84d49f5..395c2cf 100644
> ---- a/cef/tools/make_version_header.py
> -+++ b/cef/tools/make_version_header.py
> -@@ -64,6 +64,8 @@ def write_svn_header(header, chrome_version, =
cef_version, cpp_header_dir):
> -       revision =3D svn.get_revision()
> -     elif git.is_checkout('.'):
> -       revision =3D git.get_svn_revision()
> -+    elif os.path.isfile("../build/util/LASTCHANGE"):
> -+      revision =3D =
open("../build/util/LASTCHANGE").read().split("=3D")[1].strip()
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
> diff --git a/recipes-browser/chromium/cef3_280796.bb =
b/recipes-browser/chromium/cef3_280796.bb
> index 9a9efe5..a3a4eca 100644
> --- a/recipes-browser/chromium/cef3_280796.bb
> +++ b/recipes-browser/chromium/cef3_280796.bb
> @@ -7,21 +7,22 @@ RDEPENDS_${PN} +=3D "pango cairo fontconfig pciutils =
pulseaudio freetype fontconfi
> SRCREV_tools =3D "99bcb0e676eb396bcf8e1af3903aa4b578aeeee0"
> SRCREV_cef =3D "bbad53dfca9f98dddcb31a590410fece0a4f0234"
> SRCREV_egl =3D "a5b81b7617ba6757802b9b5f8c950034d5f961ec"
> -SRCREV_FORMAT =3D "cef_egl_tools"
> +SRCREV_FORMAT =3D "cef_egl"
>=20
> -SRC_URI =3D =
"http://people.linaro.org/~zoltan.kuscsik/chromium-browser/chromium_rev_${=
PV}.tar.xz \
> -           =
git://github.com/kuscsik/chromiumembedded.git;protocol=3Dhttps;destsuffix=3D=
src/cef;branch=3Daura;name=3Dcef \
> -           =
git://github.com/kuscsik/ozone-egl.git;protocol=3Dhttps;destsuffix=3Dsrc/u=
i/ozone/platform/egl;branch=3Dmaster;name=3Degl \
> -           =
git://chromium.googlesource.com/chromium/tools/depot_tools.git;protocol=3D=
https;destsuffix=3Ddepot_tools;branch=3Dmaster;name=3Dtools \
> -           file://01_get_svn_version_from_LASTCHANGE.patch \
> -	   file://cef-simple \
> -	  "
> -SRC_URI[md5sum] =3D "9efbb50283b731042e62b9bd5e312b2f"
> -SRC_URI[sha256sum] =3D =
"f608e97dadf6ea4d885b24fd876896d46840fa39bf743ea2025075aee9fb348d"
> +SRC_URI =3D =
"git://chromium.googlesource.com/chromium/tools/depot_tools.git;protocol=3D=
https;destsuffix=3Ddepot_tools;branch=3Dmaster;name=3Dtools \
> +           =
git://github.com/kuscsik/chromiumembedded.git;protocol=3Dhttps;destsuffix=3D=
${S}/src/cef;branch=3Daura;name=3Dcef \
> +           =
git://github.com/kuscsik/ozone-egl.git;protocol=3Dhttps;destsuffix=3D${S}/=
src/ui/ozone/platform/egl;branch=3Dmaster;name=3Degl\
> +           file://cef-simple\
> +  "
>=20
> -S =3D "${WORKDIR}/chromium_rev_${PV}"
> +export =
CHROMIUM_SRC_GIT_URL=3D"https://chromium.googlesource.com/chromium/src"
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
> @@ -30,22 +31,50 @@ export GYP_GENERATORS=3D"ninja"
> export BUILD_TARGET_ARCH=3D"${TARGET_ARCH}"
> export GYP_DEFINES=3D"${GYP_ARCH_DEFINES} =
release_extra_cflags=3D'-Wno-error=3Dunused-local-typedefs' sysroot=3D''"
>=20
> +do_fetch_chromium_source_from_git() {
> +    cd ${S}
> +    export PATH=3D${WORKDIR}/depot_tools:"$PATH"
> +
> +    # Note: --deps-file needs to set to .DEPS.git for syncing to old
> +    # chromium versions
> +    gclient config ${CHROMIUM_SRC_GIT_URL} --deps-file=3D".DEPS.git"
> +
> +    # Runhooks is disabled. Running the hooks will trigger the
> +    # gyp_chromium command replaced with cef_create_projects.sh by
> +    # cef3.
> +
> +    gclient sync -f --nohooks --revision =
src@${CHROMIUM_SRC_GIT_COMMIT}
> +
> +    # We need the lastchange hook to generate the LASTCHANGE revision =
info
> +    # file.
> +
> +    python src/build/util/lastchange.py -o src/build/util/LASTCHANGE
> +}
> +
> +addtask fetch_chromium_source_from_git after do_patch before =
do_configure
> +
> do_configure_append() {
> -	export PATH=3D${WORKDIR}/depot_tools:"$PATH"
> -	# End of LD Workaround
> -	#-----------------------
> -	# Configure cef
> -	#------------------------
> -	cd cef
> -	./cef_create_projects.sh -I ${BUILD_TARGET_ARCH}_ozone.gypi =
--depth ../
> -	cd -
> +    export PATH=3D${WORKDIR}/depot_tools:"$PATH"
> +    # End of LD Workaround
> +    #-----------------------
> +    # Configure cef
> +    #------------------------
> +    cd ${S}/src/cef
> +
> +    # Fatal linker warnings need to be disalbed to avoid linker issu
> +    # with GCC 4.9:
> +    # =
http://lists.openembedded.org/pipermail/openembedded-core/2014-August/0959=
47.html
> +
> +    ./cef_create_projects.sh -I ${BUILD_TARGET_ARCH}_ozone.gypi =
--depth ../ -Ddisable_fatal_linker_warnings=3D
> +    cd -
> }
>=20
> # Workaround to disable qa_configure
> do_qa_configure() {
> -	echo "do_qa_configure"
> +    echo "do_qa_configure"
> }
>=20
> do_compile() {
> -	ninja -C out/${CHROMIUM_BUILD_TYPE} cefsimple
> +    cd ${S}/src
> +    ninja -C out/${CHROMIUM_BUILD_TYPE} cefsimple
> }
> --
> 1.9.1
>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_497EACD8-7765-4125-B259-7FC89342FD7C
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlWcDAcACgkQuwUzVZGdMxRTdQCeOzfRf9TRNC3stwxISLAy0TsL
uigAoJLHkODxVG55FgL9Amuj4uDN/dhQ
=MbrK
-----END PGP SIGNATURE-----

--Apple-Mail=_497EACD8-7765-4125-B259-7FC89342FD7C--
