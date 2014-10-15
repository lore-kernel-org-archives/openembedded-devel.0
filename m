Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id CBCA265D56
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Oct 2014 10:36:29 +0000 (UTC)
Received: by mail-wi0-f181.google.com with SMTP id hi2so1456417wib.14
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Oct 2014 03:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=9795HXKRvzIBWYPw1GkDApH1EK/LQY9koy7IiSN2Jvs=;
	b=xkGgfnM0P5LnIEuBkSXgRAWe9d3QTCNMmHe9WSFfq6C4IrM25J3+NczjSTouCtUMh4
	okf2yJ5fg8Lf5yS1nHuCowPLXUTiRtEzVHjY0Ht1NxSSsFdxVW1UVixwQstVx33ZTEFA
	M7LJoxIW0mbFfWXGxLsmaVWKQhCmu2VfhB5qsTmpKVl3IXPCov39vAvv5Er0poyr1UXo
	aHbaxy6OnlNsIa/6LDjthbcHq13OxzNJc53Yfkaiay6KSEqejHB/djLvtKJREHvZdmsw
	KENVAmfb2ICIpRQYXZbpdaRVfuYaekoT2gSU9/EuKVGp7v7eB7dRvBC00ZaI/qoaPOBd
	SIlA==
X-Received: by 10.180.82.168 with SMTP id j8mr11517505wiy.57.1413369389141;
	Wed, 15 Oct 2014 03:36:29 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	fv2sm18020565wib.2.2014.10.15.03.36.27
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 15 Oct 2014 03:36:28 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 15 Oct 2014 12:38:18 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20141015103818.GP3000@jama>
References: <1413366811-1259-1-git-send-email-jackie.huang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1413366811-1259-1-git-send-email-jackie.huang@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH] vim: add recipe for vim-tiny
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
X-List-Received-Date: Wed, 15 Oct 2014 10:36:32 -0000
X-Groupsio-MsgNum: 52519
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tgGnixv3tJWXBxdL"
Content-Disposition: inline

--tgGnixv3tJWXBxdL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 15, 2014 at 05:53:31AM -0400, jackie.huang@windriver.com wrote:
> From: Jackie Huang <jackie.huang@windriver.com>
>=20
> Changes:
> - split the vim recipe to two files
> - add bb for vim-tiny based on PACKAGECONFIG defined in .inc file
> - use trim_version to get VIMDIR

If you really want to revert following 2 patches, then you need to provide
more justifications for your patch and also confirm that the recipes don't
stage conflicting files in sysroot anymore (I don't see any change in recipe
preventing that).


commit 72a1427f116cbb516aeced7931aedc891865bac7
Author: Martin Jansa <Martin.Jansa@gmail.com>
Date:   Mon Jan 28 12:38:19 2013 +0100

    vim: implement gvim, vim-tiny as PACKAGECONFIG
   =20
    * only one of those should be built in sysroot, otherwise they were
      overwritting files provided by other alternatives
    * define PACKAGECONFIG options
    * there are no RCONFLICTS/RREPLACES/RPROVIDES, because it depends on
      selected PACKAGECONFIGs
    * add PN to VIMDIR and use VIMDIR where undefined VIMVER was
      (e.g. "${PN}${VIMVER}")
    * move checksums from .inc to recipe
    * vim/gvim/vim-tiny conflict is now fatal, with
      http://patches.openembedded.org/patch/43105/
   =20
    Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

and

commit 7be78a939bde5228a7f92a58ac08dd10901a8a4f
Author: Paul Barker <paul@paulbarker.me.uk>
Date:   Fri Sep 13 20:08:22 2013 +0000

    vim: upgrade to v7.4.27 and refactor
   =20
    'vim.inc' is merged into the new recipe 'vim_7.4.27.bb', the recipe is =
slightly
    reorganised and a minor omission in the comments is corrected.
   =20
    DESCRIPTION is replaced with SUMMARY. PR and INC_PR values are dropped.=
 The
    variable PV_MAJOR is also dropped as it isn't used.
   =20
    LIC_FILES_CHECKSUM is updated as an address and version number given in=
 the
    license have been modified. The main license text itself is unchanged.
   =20
    The setting of PARALLEL_MAKE to force single-threaded compilation is re=
moved as
    there is no justification in the git history for this being needed and =
the
    compilation completes fine without it.
   =20
    Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
    Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

>=20
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  meta-oe/recipes-support/vim/vim-tiny_7.4.373.bb | 15 ++++++
>  meta-oe/recipes-support/vim/vim.inc             | 65 +++++++++++++++++++=
+++
>  meta-oe/recipes-support/vim/vim_7.4.373.bb      | 71 ++-----------------=
------
>  3 files changed, 85 insertions(+), 66 deletions(-)
>  create mode 100644 meta-oe/recipes-support/vim/vim-tiny_7.4.373.bb
>  create mode 100644 meta-oe/recipes-support/vim/vim.inc
>=20
> diff --git a/meta-oe/recipes-support/vim/vim-tiny_7.4.373.bb b/meta-oe/re=
cipes-support/vim/vim-tiny_7.4.373.bb
> new file mode 100644
> index 0000000..f77a717
> --- /dev/null
> +++ b/meta-oe/recipes-support/vim/vim-tiny_7.4.373.bb
> @@ -0,0 +1,15 @@
> +require vim.inc
> +
> +PACKAGECONFIG +=3D "tiny"
> +
> +do_install() {
> +    install -d ${D}/${base_bindir}
> +    install -m 0755 ${S}/vim ${D}/${base_bindir}/${BPN}
> +    install -d ${D}/${datadir}/vim
> +    install -m 0644 ../runtime/vimrc_example.vim ${D}/${datadir}/vim/virc
> +}
> +
> +FILES_${PN} +=3D "${datadir}/vim/virc"
> +
> +ALTERNATIVE_PRIORITY =3D "90"
> +ALTERNATIVE_TARGET =3D "${base_bindir}/${BPN}"
> diff --git a/meta-oe/recipes-support/vim/vim.inc b/meta-oe/recipes-suppor=
t/vim/vim.inc
> new file mode 100644
> index 0000000..8729ee1
> --- /dev/null
> +++ b/meta-oe/recipes-support/vim/vim.inc
> @@ -0,0 +1,65 @@
> +SUMMARY =3D "Vi IMproved - enhanced vi editor"
> +SECTION =3D "console/utils"
> +DEPENDS =3D "ncurses gettext-native"
> +# vimdiff doesn't like busybox diff
> +RSUGGESTS_${PN} =3D "diffutils"
> +LICENSE =3D "vim"
> +LIC_FILES_CHKSUM =3D "file://../runtime/doc/uganda.txt;md5=3Db779e18be6e=
d77facc770691c967b8f8"
> +
> +SRC_URI =3D "hg://vim.googlecode.com/hg/;protocol=3Dhttps;module=3Dvim \
> +           file://disable_acl_header_check.patch;patchdir=3D.. \
> +           file://vim-add-knob-whether-elf.h-are-checked.patch;patchdir=
=3D.. \
> +"
> +SRCREV =3D "v${@d.getVar('PV', True).replace('.', '-')}"
> +
> +S =3D "${WORKDIR}/vim/src"
> +
> +VIMDIR =3D "vim${@oe.utils.trim_version('${PV}', 2).replace('.', '')}"
> +
> +inherit autotools update-alternatives
> +inherit autotools-brokensep
> +
> +# vim configure.in contains functions which got 'dropped' by autotools.b=
bclass
> +do_configure () {
> +    rm -f auto/*
> +    touch auto/config.mk
> +    aclocal
> +    autoconf
> +    oe_runconf
> +    touch auto/configure
> +    touch auto/config.mk auto/config.h
> +}
> +
> +#Available PACKAGECONFIG options are gtkgui, acl, x11, tiny
> +PACKAGECONFIG ??=3D ""
> +PACKAGECONFIG +=3D "${@base_contains('DISTRO_FEATURES', 'acl', 'acl', ''=
, d)}"
> +PACKAGECONFIG +=3D "${@base_contains('DISTRO_FEATURES', 'selinux', 'seli=
nux', '', d)}"
> +
> +PACKAGECONFIG[gtkgui] =3D "--enable-gtk2-test --enable-gui=3Dgtk2,--enab=
le-gui=3Dno,gtk+,"
> +PACKAGECONFIG[acl] =3D "--enable-acl,--disable-acl,acl,"
> +PACKAGECONFIG[x11] =3D "--with-x,--without-x,xt,"
> +PACKAGECONFIG[tiny] =3D "--with-features=3Dtiny,--with-features=3Dbig,,"
> +PACKAGECONFIG[selinux] =3D "--enable-selinux,--disable-selinux,libselinu=
x,"
> +PACKAGECONFIG[elfutils] =3D "--enable-elf-check,,elfutils,"
> +
> +EXTRA_OECONF =3D " \
> +    --disable-gpm \
> +    --disable-gtktest \
> +    --disable-xim \
> +    --disable-netbeans \
> +    --with-tlib=3Dncurses \
> +    ac_cv_small_wchar_t=3Dno \
> +    vim_cv_getcwd_broken=3Dno \
> +    vim_cv_memmove_handles_overlap=3Dyes \
> +    vim_cv_stat_ignores_slash=3Dno \
> +    vim_cv_terminfo=3Dyes \
> +    vim_cv_tgent=3Dnon-zero \
> +    vim_cv_toupper_broken=3Dno \
> +    vim_cv_tty_group=3Dworld \
> +    STRIP=3D/bin/true \
> +"
> +
> +PARALLEL_MAKEINST =3D ""
> +
> +ALTERNATIVE_${PN} =3D "vi"
> +ALTERNATIVE_LINK_NAME[vi] =3D "${base_bindir}/vi"
> diff --git a/meta-oe/recipes-support/vim/vim_7.4.373.bb b/meta-oe/recipes=
-support/vim/vim_7.4.373.bb
> index 81c0ddf..28e46c5 100644
> --- a/meta-oe/recipes-support/vim/vim_7.4.373.bb
> +++ b/meta-oe/recipes-support/vim/vim_7.4.373.bb
> @@ -1,63 +1,4 @@
> -SUMMARY =3D "Vi IMproved - enhanced vi editor"
> -SECTION =3D "console/utils"
> -DEPENDS =3D "ncurses gettext-native"
> -# vimdiff doesn't like busybox diff
> -RSUGGESTS_${PN} =3D "diffutils"
> -LICENSE =3D "vim"
> -LIC_FILES_CHKSUM =3D "file://../runtime/doc/uganda.txt;md5=3Db779e18be6e=
d77facc770691c967b8f8"
> -
> -SRC_URI =3D "hg://vim.googlecode.com/hg/;protocol=3Dhttps;module=3Dvim \
> -           file://disable_acl_header_check.patch;patchdir=3D.. \
> -           file://vim-add-knob-whether-elf.h-are-checked.patch;patchdir=
=3D.. \
> -"
> -SRCREV =3D "v7-4-373"
> -
> -S =3D "${WORKDIR}/${BPN}/src"
> -
> -VIMDIR =3D "${BPN}${@d.getVar('PV',1).split('.')[0]}${@d.getVar('PV',1).=
split('.')[1]}"
> -
> -inherit autotools update-alternatives
> -inherit autotools-brokensep
> -
> -# vim configure.in contains functions which got 'dropped' by autotools.b=
bclass
> -do_configure () {
> -    rm -f auto/*
> -    touch auto/config.mk
> -    aclocal
> -    autoconf
> -    oe_runconf
> -    touch auto/configure
> -    touch auto/config.mk auto/config.h
> -}
> -
> -#Available PACKAGECONFIG options are gtkgui, acl, x11, tiny
> -PACKAGECONFIG ??=3D ""
> -PACKAGECONFIG +=3D "${@base_contains('DISTRO_FEATURES', 'acl', 'acl', ''=
, d)}"
> -PACKAGECONFIG +=3D "${@base_contains('DISTRO_FEATURES', 'selinux', 'seli=
nux', '', d)}"
> -
> -PACKAGECONFIG[gtkgui] =3D "--enable-gtk2-test --enable-gui=3Dgtk2,--enab=
le-gui=3Dno,gtk+,"
> -PACKAGECONFIG[acl] =3D "--enable-acl,--disable-acl,acl,"
> -PACKAGECONFIG[x11] =3D "--with-x,--without-x,xt,"
> -PACKAGECONFIG[tiny] =3D "--with-features=3Dtiny,--with-features=3Dbig,,"
> -PACKAGECONFIG[selinux] =3D "--enable-selinux,--disable-selinux,libselinu=
x,"
> -PACKAGECONFIG[elfutils] =3D "--enable-elf-check,,elfutils,"
> -
> -EXTRA_OECONF =3D " \
> -    --disable-gpm \
> -    --disable-gtktest \
> -    --disable-xim \
> -    --disable-netbeans \
> -    --with-tlib=3Dncurses \
> -    ac_cv_small_wchar_t=3Dno \
> -    vim_cv_getcwd_broken=3Dno \
> -    vim_cv_memmove_handles_overlap=3Dyes \
> -    vim_cv_stat_ignores_slash=3Dno \
> -    vim_cv_terminfo=3Dyes \
> -    vim_cv_tgent=3Dnon-zero \
> -    vim_cv_toupper_broken=3Dno \
> -    vim_cv_tty_group=3Dworld \
> -    STRIP=3D/bin/true \
> -"
> +require vim.inc
> =20
>  do_install_append() {
>      # Work around rpm picking up csh or awk or perl as a dep
> @@ -69,8 +10,6 @@ do_install_append() {
>      install -m 0644 ../runtime/vimrc_example.vim ${D}/${datadir}/${BPN}/=
vimrc
>  }
> =20
> -PARALLEL_MAKEINST =3D ""
> -
>  PACKAGES =3D+ "${PN}-common ${PN}-syntax ${PN}-help ${PN}-tutor ${PN}-vi=
mrc"
>  FILES_${PN}-syntax =3D "${datadir}/${BPN}/${VIMDIR}/syntax"
>  FILES_${PN}-help =3D "${datadir}/${BPN}/${VIMDIR}/doc"
> @@ -96,7 +35,7 @@ FILES_${PN}-common =3D " \
>  # Recommend that runtime data is installed along with vim
>  RRECOMMENDS_${PN} =3D "${PN}-syntax ${PN}-help ${PN}-tutor ${PN}-vimrc $=
{PN}-common"
> =20
> -ALTERNATIVE_${PN} =3D "vi"
> -ALTERNATIVE_TARGET[vi] =3D "${bindir}/${BPN}"
> -ALTERNATIVE_LINK_NAME[vi] =3D "${base_bindir}/vi"
> -ALTERNATIVE_PRIORITY[vi] =3D "100"
> +RREPLACES_${PN} =3D "vim-tiny"
> +
> +ALTERNATIVE_PRIORITY =3D "100"
> +ALTERNATIVE_TARGET =3D "${bindir}/${BPN}"
> --=20
> 2.0.0
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--tgGnixv3tJWXBxdL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlQ+TpoACgkQN1Ujt2V2gBxvvwCfYfMJxOrL7RtSOCMp+/OPHFl+
jdMAn0LwMPNQd/rdTxZXl3g7xmMWiir1
=Pja1
-----END PGP SIGNATURE-----

--tgGnixv3tJWXBxdL--
