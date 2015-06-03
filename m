Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f182.google.com (mail-qk0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id A5AAD75716
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Jun 2015 19:50:36 +0000 (UTC)
Received: by qkoo18 with SMTP id o18so12134896qko.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Jun 2015 12:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:message-id
	:references:to;
	bh=S9DXssJSJOPF3Z2d6g7s+KiEkqevk6MGu9I14sxaPcs=;
	b=HKFP/M2s6ZuXWF6QRS7kwf0Gm5wnKi8BhcTMUdyHj99M2H7ByI7x3+xcdUs0I0+naq
	NnKQWW9KthKDV/kR2jpZQuQyQC+Yn6XfRHQe7i699AXR7LlF9fDVB6gX21Ufu3AI2px1
	fBCwoY6LIQ5zO/udOv/Ik0kVpxhUcdqEYgVzQoJRqw2H+5TCogF+q74Vh/ooIzB3KIwI
	Sv65olj0klXFvS46LZsM8Vg/YKBF7zJbcN557wi00XoFZyZsvGNxnpVPatYM8TRfnNUa
	FsdliYoDND6x7X2R70aBdyz8F21ihnBKAAlnLMcbk27LhO4NvjgkQ19fr7jHExaHINRr
	+HQg==
X-Received: by 10.55.18.104 with SMTP id c101mr63128528qkh.25.1433361037008;
	Wed, 03 Jun 2015 12:50:37 -0700 (PDT)
Received: from ?IPv6:2601:9:500:ece:d1e4:9e90:3fdd:134b?
	([2601:9:500:ece:d1e4:9e90:3fdd:134b])
	by mx.google.com with ESMTPSA id y195sm981879qky.24.2015.06.03.12.50.35
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 03 Jun 2015 12:50:35 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
X-Pgp-Agent: GPGMail 2.5b6
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAAzKXnghKgh7=j2sFkgOtbWdRu6Ds50siZMcVbDMTyMd0gZ3pA@mail.gmail.com>
Date: Wed, 3 Jun 2015 12:50:33 -0700
Message-Id: <74945B34-E7CB-4DD8-B5A3-19C509CE59D5@gmail.com>
References: <CAAzKXngGv=tmUgOnBvAaz37mdc5R8k6YPjaQNc2pYWJF+qAD=Q@mail.gmail.com>
	<34D595E1-BD07-4EA7-A4F7-7E75AB8249A1@gmail.com>
	<CAAzKXngfXaq4B87iQQXY0b-dxkncf8ROsYg4z0TnQFM5wNgxBw@mail.gmail.com>
	<20150528071458.GA2383@jama>
	<CAAzKXnghKgh7=j2sFkgOtbWdRu6Ds50siZMcVbDMTyMd0gZ3pA@mail.gmail.com>
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
X-List-Received-Date: Wed, 03 Jun 2015 19:50:37 -0000
X-Groupsio-MsgNum: 55751
Content-Type: multipart/signed;
	boundary="Apple-Mail=_B09E683C-98E4-4082-B0ED-0820B8B24404";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_B09E683C-98E4-4082-B0ED-0820B8B24404
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Jun 3, 2015, at 12:26 PM, Zoltan Kuscsik =
<zoltan.kuscsik@linaro.org> wrote:
>=20
> Updated recipe to fetch Chromium from git.
> LASTCHANGE file is now created using the proper
> gclient hook.
>=20

This patch seems to be badly formatted in patchwork. Can you send git =
format-patch + git send-mail
way. Alternatively, if your mailer is mutilating it then you can also =
send a github pull request.


> Change-Id: Ie1790abec002a0dd39c8d0aae3d03f5ebe6f46aa
> Signed-off-by: Zoltan Kuscsik <zoltan.kuscsik@linaro.org>
> ---
> .../cef3/01_get_svn_version_from_LASTCHANGE.patch  | 32 ----------
> recipes-browser/chromium/cef3_280796.bb            | 73
> +++++++++++++++-------
> 2 files changed, 51 insertions(+), 54 deletions(-)
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
> index 9a9efe5..a3a4eca 100644
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
> -   file://cef-simple \
> -  "
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
> @@ -30,22 +31,50 @@ export GYP_GENERATORS=3D"ninja"
> export BUILD_TARGET_ARCH=3D"${TARGET_ARCH}"
> export GYP_DEFINES=3D"${GYP_ARCH_DEFINES}
> release_extra_cflags=3D'-Wno-error=3Dunused-local-typedefs' =
sysroot=3D''"
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
> - export PATH=3D${WORKDIR}/depot_tools:"$PATH"
> - # End of LD Workaround
> - #-----------------------
> - # Configure cef
> - #------------------------
> - cd cef
> - ./cef_create_projects.sh -I ${BUILD_TARGET_ARCH}_ozone.gypi --depth =
../
> - cd -
> +    export PATH=3D${WORKDIR}/depot_tools:"$PATH"
> +    # End of LD Workaround
> +    #-----------------------
> +    # Configure cef
> +    #------------------------
> +    cd ${S}/src/cef
> +
> +    # Fatal linker warnings need to be disalbed to avoid linker issu
> +    # with GCC 4.9:
> +    #
> =
http://lists.openembedded.org/pipermail/openembedded-core/2014-August/0959=
47.html
> +
> +    ./cef_create_projects.sh -I ${BUILD_TARGET_ARCH}_ozone.gypi =
--depth
> ../ -Ddisable_fatal_linker_warnings=3D
> +    cd -
> }
>=20
> # Workaround to disable qa_configure
> do_qa_configure() {
> - echo "do_qa_configure"
> +    echo "do_qa_configure"
> }
>=20
> do_compile() {
> - ninja -C out/${CHROMIUM_BUILD_TYPE} cefsimple
> +    cd ${S}/src
> +    ninja -C out/${CHROMIUM_BUILD_TYPE} cefsimple
> }
> --
> 1.9.1
>=20
>=20
> On 28 May 2015 at 09:14, Martin Jansa <martin.jansa@gmail.com> wrote:
>=20
>> On Thu, May 28, 2015 at 09:09:24AM +0200, Zoltan Kuscsik wrote:
>>> On 28 May 2015 at 02:56, Khem Raj <raj.khem@gmail.com> wrote:
>>>>>=20
>>>>> +do_fetch_chromium_source_from_git() {
>>>>> +  cd ${S}
>>>>> +  export PATH=3D${WORKDIR}/depot_tools:"$PATH"
>>>>> +
>>>>> +  # Note: --deps-file needs to set to .DEPS.git for syncing to =
old
>>>>> +  # chromium versions
>>>>> +  gclient config ${CHROMIUM_SRC_GIT_URL} --deps-file=3D".DEPS.git"
>>>>> +
>>>>> +  # Runhooks is disabled. Running the hooks will trigger the
>>>>> +  # gyp_chromium command replaced with cef_create_projects.sh by
>>>>> +  # cef3.
>>>>> +
>>>>> +  gclient sync -f --nohooks --revision src@
>> ${CHROMIUM_SRC_GIT_COMMIT}
>>>>> +
>>>>> +  # We need the lastchange hook to generate the LASTCHANGE =
revision
>> info
>>>>> +  # file.
>>>>> +
>>>>> +  python src/build/util/lastchange.py -o =
src/build/util/LASTCHANGE
>>>>> +}
>>>>=20
>>>>=20
>>>> small nit. formatting is not correct for this shell function.
>>>>=20
>>>=20
>>> Z: Could you explain this in more details?
>>=20
>> Use 4 spaces for indentation (everywhere).
>>=20
>> --
>> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>=20
>=20
>=20
>=20
> --
> Zoltan Kuscsik
>=20
> Senior Software Developer, Linaro Digital Home Group
> email: zoltan.kuscsik@linaro.org
> IRC: zoli_ on irc.linaro.org
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_B09E683C-98E4-4082-B0ED-0820B8B24404
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlVvWokACgkQuwUzVZGdMxR7/gCbBWiwKsTiT4QgJm5m7+o/jQfX
uEUAn0I8XPwo4I0lPSZokds1tfxlnKJP
=94rF
-----END PGP SIGNATURE-----

--Apple-Mail=_B09E683C-98E4-4082-B0ED-0820B8B24404--
