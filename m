Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by mail.openembedded.org (Postfix) with ESMTP id 0D10F6158B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Sep 2013 12:09:11 +0000 (UTC)
Received: by mail-ee0-f48.google.com with SMTP id l10so4066996eei.7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Sep 2013 05:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=+aicHRoE9350gGFIulOB6ZIvdpxvLlzVG6ti/d6+dFk=;
	b=nKqE6x+T3hf9c9p9VHl8UMaMDw5WbkTRU5zOWi5NedimopGs/bnCAsLHdn2Tq3rFXI
	Pu1J1sx9uCm69UGmrUZQfIwVBGMOarh0pobmcExhi9Fmgm5EJgE4xqykJhUYecDUzvq4
	kzNuPv0rHZGr5gE34/Hr5o1iTaSEjc1Lc9+GlJGMCyNZDHBvXHghCLeMy8E279REyWNk
	3K4AW+AGM32nzDR6a/bykycecpZjrMGxnl6F6FFeLLQuCjjNZlS9nl3xRsOLIppiQWRH
	b4L6BtY05jX297LjoUJw4lO/wrmqngiQ1PrVr63ciaacjrrx75Etd1ji7jmnWWClcVld
	WTCQ==
X-Received: by 10.14.4.1 with SMTP id 1mr1832863eei.21.1379592553606;
	Thu, 19 Sep 2013 05:09:13 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	f49sm10813699eec.7.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 19 Sep 2013 05:09:12 -0700 (PDT)
Date: Thu, 19 Sep 2013 14:10:51 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130919121051.GC18414@jama>
References: <1379102902-3192-1-git-send-email-paul@paulbarker.me.uk>
MIME-Version: 1.0
In-Reply-To: <1379102902-3192-1-git-send-email-paul@paulbarker.me.uk>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH] vim: upgrade to v7.4.27 and refactor
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
X-List-Received-Date: Thu, 19 Sep 2013 12:09:12 -0000
X-Groupsio-MsgNum: 46248
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="E/DnYTRukya0zdZ1"
Content-Disposition: inline

--E/DnYTRukya0zdZ1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 13, 2013 at 09:08:22PM +0100, Paul Barker wrote:
> 'vim.inc' is merged into the new recipe 'vim_7.4.27.bb', the recipe is sl=
ightly
> reorganised and a minor omission in the comments is corrected.
>=20
> DESCRIPTION is replaced with SUMMARY. PR and INC_PR values are dropped. T=
he
> variable PV_MAJOR is also dropped as it isn't used.
>=20
> LIC_FILES_CHECKSUM is updated as an address and version number given in t=
he
> license have been modified. The main license text itself is unchanged.
>=20
> The setting of PARALLEL_MAKE to force single-threaded compilation is remo=
ved as
> there is no justification in the git history for this being needed and the
> compilation completes fine without it.

Merged, thanks!

>=20
> Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
> ---
>  meta-oe/recipes-support/vim/vim_7.3.1314.bb           |  7 -------
>  .../recipes-support/vim/{vim.inc =3D> vim_7.4.27.bb}    | 19 ++++++++---=
--------
>  2 files changed, 8 insertions(+), 18 deletions(-)
>  delete mode 100644 meta-oe/recipes-support/vim/vim_7.3.1314.bb
>  rename meta-oe/recipes-support/vim/{vim.inc =3D> vim_7.4.27.bb} (87%)
>=20
> diff --git a/meta-oe/recipes-support/vim/vim_7.3.1314.bb b/meta-oe/recipe=
s-support/vim/vim_7.3.1314.bb
> deleted file mode 100644
> index 1be5a91..0000000
> --- a/meta-oe/recipes-support/vim/vim_7.3.1314.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -require ${PN}.inc
> -
> -PR =3D "${INC_PR}.0"
> -
> -SRCREV =3D "v7-3-1314"
> -
> -SRC_URI +=3D "file://configure.in_remove_CC_quotes.patch;patchdir=3D.."
> diff --git a/meta-oe/recipes-support/vim/vim.inc b/meta-oe/recipes-suppor=
t/vim/vim_7.4.27.bb
> similarity index 87%
> rename from meta-oe/recipes-support/vim/vim.inc
> rename to meta-oe/recipes-support/vim/vim_7.4.27.bb
> index 991ba74..77507d4 100644
> --- a/meta-oe/recipes-support/vim/vim.inc
> +++ b/meta-oe/recipes-support/vim/vim_7.4.27.bb
> @@ -1,20 +1,19 @@
> -DESCRIPTION =3D "Vi IMproved - enhanced vi editor"
> +SUMMARY =3D "Vi IMproved - enhanced vi editor"
>  SECTION =3D "console/utils"
>  DEPENDS =3D "ncurses"
>  # vimdiff doesn't like busybox diff
>  RSUGGESTS_${PN} =3D "diffutils"
>  LICENSE =3D "vim"
> -LIC_FILES_CHKSUM =3D "file://../runtime/doc/uganda.txt;md5=3D4c91d841bb7=
b75f68b5bb8ad7118f5b8"
> +LIC_FILES_CHKSUM =3D "file://../runtime/doc/uganda.txt;md5=3Db779e18be6e=
d77facc770691c967b8f8"
> =20
> -PV_MAJOR =3D "${@d.getVar('PV',1).split('.')[0]}.${@d.getVar('PV',1).spl=
it('.')[1]}"
> -VIMDIR =3D "${PN}${@d.getVar('PV',1).split('.')[0]}${@d.getVar('PV',1).s=
plit('.')[1]}"
> -
> -INC_PR =3D "r13"
> -
> -SRC_URI =3D "hg://vim.googlecode.com/hg/;protocol=3Dhttps;module=3Dvim"
> +SRC_URI =3D "hg://vim.googlecode.com/hg/;protocol=3Dhttps;module=3Dvim \
> +	file://configure.in_remove_CC_quotes.patch;patchdir=3D.."
> +SRCREV =3D "v7-4-027"
> =20
>  S =3D "${WORKDIR}/${PN}/src"
> =20
> +VIMDIR =3D "${PN}${@d.getVar('PV',1).split('.')[0]}${@d.getVar('PV',1).s=
plit('.')[1]}"
> +
>  inherit autotools update-alternatives
> =20
>  # vim configure.in contains functions which got 'dropped' by autotools.b=
bclass
> @@ -28,7 +27,7 @@ do_configure () {
>      touch auto/config.mk auto/config.h
>  }
> =20
> -#Available PACKAGECONFIG options are gtkgui, x11, tiny
> +#Available PACKAGECONFIG options are gtkgui, acl, x11, tiny
>  PACKAGECONFIG ??=3D ""
> =20
>  PACKAGECONFIG[gtkgui] =3D "--enable-gtk2-test --enable-gui=3Dgtk2,--enab=
le-gui=3Dno,gtk+,"
> @@ -76,5 +75,3 @@ ALTERNATIVE_${PN} =3D "vi"
>  ALTERNATIVE_TARGET[vi] =3D "${bindir}/${PN}"
>  ALTERNATIVE_LINK_NAME[vi] =3D "${base_bindir}/vi"
>  ALTERNATIVE_PRIORITY[vi] =3D "100"
> -
> -PARALLEL_MAKE =3D ""
> --=20
> 1.8.4
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--E/DnYTRukya0zdZ1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlI66csACgkQN1Ujt2V2gBw2lwCfem3ig45QKsCSFbHtrSXaWcHd
kjwAoKBOB37FY/OYpN8WlQItxfrDVRu5
=lKTO
-----END PGP SIGNATURE-----

--E/DnYTRukya0zdZ1--
