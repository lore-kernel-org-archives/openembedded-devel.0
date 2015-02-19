Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id 779EE60556;
	Thu, 19 Feb 2015 15:22:47 +0000 (UTC)
Received: by mail-wi0-f173.google.com with SMTP id bs8so48870253wib.0;
	Thu, 19 Feb 2015 07:22:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=jBFUz/BCpRYOkQQFKmYvNMx67ybF/1ElsUWUWFB75Xc=;
	b=nYksFtOwdm56BOEZ54RXIPpgpitY4zQE4HcxVZ1G1yL6TiYY3vqVLzxyckOgyxF6mp
	o1Zvam3pcsXqzEgwNZlMRuiYneKOR0For9LxsuMFKPBPheqgXqyr+t9UIphYXUnfYUau
	Tx3/ZUJ96gkJ8qzLy1Omqfgj2fAozxFC7m9+/oF3FiUDXAxH9IEsER/HPqo6L+unZODC
	/EseihDFusJy1pGchOM7D/ppsF35asEhtkpJDoocmcunBxv45N9/YdPwRMCkunyrZv1I
	9Fa7Pk1zs0DUrQeyxyF7LVvwmIFYKK5HcOdEKIQn7nrjs6Jt3YKHcDVsKYFRH45lUH0i
	BEhw==
X-Received: by 10.194.110.69 with SMTP id hy5mr10025099wjb.121.1424359368776; 
	Thu, 19 Feb 2015 07:22:48 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	gz3sm18487581wib.1.2015.02.19.07.22.47
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 19 Feb 2015 07:22:47 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 19 Feb 2015 16:22:51 +0100
To: jackie.huang@windriver.com, openembedded-devel@lists.openembedded.org
Message-ID: <20150219152251.GC2311@jama>
References: <20150115153808.97C47501EF@opal.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <20150115153808.97C47501EF@opal.openembedded.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Jackie Huang : vim: add recipe for vim-tiny
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
X-List-Received-Date: Thu, 19 Feb 2015 15:22:49 -0000
X-Groupsio-MsgNum: 54402
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JWEK1jqKZ6MHAcjA"
Content-Disposition: inline

--JWEK1jqKZ6MHAcjA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 15, 2015 at 03:38:08PM +0000, git@git.openembedded.org wrote:
> Module: meta-openembedded.git
> Branch: master
> Commit: 95dc2ddce7a0ee4d16d6c69fd123e4e6921bdf2e
> URL:    http://git.openembedded.org/?p=3Dmeta-openembedded.git&a=3Dcommit=
;h=3D95dc2ddce7a0ee4d16d6c69fd123e4e6921bdf2e
>=20
> Author: Jackie Huang <jackie.huang@windriver.com>
> Date:   Thu Nov  6 03:22:27 2014 -0500
>=20
> vim: add recipe for vim-tiny
>=20
> Changes:
> - Add bb for vim-tiny based on vim.bb
> - Change PACKAGECONFIG and do_install for vim-tiny
> - Change BPN to vim in vim.bb so it works fine when required by vim-tiny
> - Add proper alternative links for vim and vim-tiny to avoid conflicts
> - Don't use do_install_append in vim.bb so it works fine when required by=
 vim-tiny
>=20
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>=20
> ---
>=20
>  meta-oe/recipes-support/vim/vim-tiny_7.4.481.bb | 13 +++++++++++++
>  meta-oe/recipes-support/vim/vim_7.4.481.bb      | 20 +++++++++++++-------
>  2 files changed, 26 insertions(+), 7 deletions(-)
>=20
> diff --git a/meta-oe/recipes-support/vim/vim-tiny_7.4.481.bb b/meta-oe/re=
cipes-support/vim/vim-tiny_7.4.481.bb
> new file mode 100644
> index 0000000..bb8f2b7
> --- /dev/null
> +++ b/meta-oe/recipes-support/vim/vim-tiny_7.4.481.bb
> @@ -0,0 +1,13 @@
> +require vim_${PV}.bb
> +
> +SUMMARY +=3D " (with tiny features)"
> +
> +PACKAGECONFIG +=3D "tiny"
> +
> +do_install() {
> +    install -d ${D}/${bindir}
> +    install -m 0755 ${S}/vim ${D}/${bindir}/vim.tiny
> +}
> +
> +ALTERNATIVE_PRIORITY =3D "90"
> +ALTERNATIVE_TARGET =3D "${bindir}/vim.tiny"
> diff --git a/meta-oe/recipes-support/vim/vim_7.4.481.bb b/meta-oe/recipes=
-support/vim/vim_7.4.481.bb
> index b85ff63..7490229 100644
> --- a/meta-oe/recipes-support/vim/vim_7.4.481.bb
> +++ b/meta-oe/recipes-support/vim/vim_7.4.481.bb
> @@ -12,9 +12,9 @@ SRC_URI =3D "hg://vim.googlecode.com/hg/;protocol=3Dhtt=
ps;module=3Dvim \
>  "
>  SRCREV =3D "v7-4-481"
> =20
> -S =3D "${WORKDIR}/${BPN}/src"
> +S =3D "${WORKDIR}/vim/src"
> =20
> -VIMDIR =3D "${BPN}${@d.getVar('PV',1).split('.')[0]}${@d.getVar('PV',1).=
split('.')[1]}"
> +VIMDIR =3D "vim${@d.getVar('PV',1).split('.')[0]}${@d.getVar('PV',1).spl=
it('.')[1]}"
> =20
>  inherit autotools update-alternatives
>  inherit autotools-brokensep
> @@ -59,7 +59,9 @@ EXTRA_OECONF =3D " \
>      STRIP=3D/bin/true \
>  "
> =20
> -do_install_append() {
> +do_install() {
> +    autotools_do_install
> +
>      # Work around rpm picking up csh or awk or perl as a dep
>      chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/vim132
>      chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/mve.awk
> @@ -67,6 +69,9 @@ do_install_append() {
> =20
>      # Install example vimrc from runtime files
>      install -m 0644 ../runtime/vimrc_example.vim ${D}/${datadir}/${BPN}/=
vimrc
> +
> +    # we use --with-features=3Dbig as default
> +    mv ${D}${bindir}/${BPN} ${D}${bindir}/${BPN}.${BPN}
>  }
> =20
>  PARALLEL_MAKEINST =3D ""
> @@ -97,7 +102,8 @@ RDEPENDS_${PN} =3D "ncurses-terminfo-base"
>  # Recommend that runtime data is installed along with vim
>  RRECOMMENDS_${PN} =3D "${PN}-syntax ${PN}-help ${PN}-tutor ${PN}-vimrc $=
{PN}-common"
> =20
> -ALTERNATIVE_${PN} =3D "vi"
> -ALTERNATIVE_TARGET[vi] =3D "${bindir}/${BPN}"
> -ALTERNATIVE_LINK_NAME[vi] =3D "${base_bindir}/vi"
> -ALTERNATIVE_PRIORITY[vi] =3D "100"
> +ALTERNATIVE_${PN} =3D "vi vim"
> +ALTERNATIVE_TARGET =3D "${bindir}/${BPN}.${BPN}"
> +ALTERNATIVE_LINK_NAME[vi] =3D "${bindir}/vi"
> +ALTERNATIVE_LINK_NAME[vim] =3D "${bindir}/vim"

Why did you change ALTERNATIVE_LINK_NAME[vi] from base_bindir to bindir?

busybox still registers ${base_bindir}/vi so this breaks u-a

update-alternatives: Error: cannot register alternative vi to
/usr/bin/vi since it is already registered to /bin/vi
update-alternatives: Linking
/OE/build/shr-core/tmp-glibc/work/nokia900-oe-linux-gnueabi/shr-image/2.0-r=
20/rootfs/usr/bin/vim
to /usr/bin/vim.vim

> +ALTERNATIVE_PRIORITY =3D "100"
>=20
> --=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--JWEK1jqKZ6MHAcjA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlTl/8sACgkQN1Ujt2V2gBzugACeInnDH+kfwgTX1lFYCbbTrWaS
uZoAniXPA+QJ2w4DMYe4OIZhxVYe2C9y
=2SR8
-----END PGP SIGNATURE-----

--JWEK1jqKZ6MHAcjA--
