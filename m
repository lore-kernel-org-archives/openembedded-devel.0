Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id 6992965E14
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Aug 2014 10:06:28 +0000 (UTC)
Received: by mail-wi0-f181.google.com with SMTP id bs8so5011799wib.8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Aug 2014 03:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Drh0ZCZcmkTJfVMYCKIckAQ3ABxdwbPiDNxZuLYr/8o=;
	b=h4pZqaTYuCb6olmLcmnLHnF4Pw0BMEkrOTQA3r7kswwpNYSkQsz45ChUc2BYtKGJFM
	80QX9ZjHA3rYzZv6/i3FvcqAZ4rH0hCnkV6onIHJFX2sWxpSOGadRxME46v5FVF0a5oA
	vY0N7ZECKpYPunPT5Fz+mA1FR6wRmhXGSU2rDNcgHm2CTYm1OFnLZnK/iJkHWR3zobr4
	tmrPZkp9bRFaunBZ0Ry/cTM1tPvfkGRUX3jwQnUaLeYtUrdW9lRWHi3NpeFErvMIwfDA
	AdiEnik8QorIbksaZrlif1n+Og5nz+j6bpcJ/4Pfjm5XFm8nXbkv0x5v5/gbSzmXhJ2B
	VU1Q==
X-Received: by 10.194.78.170 with SMTP id c10mr49334186wjx.22.1408442789849;
	Tue, 19 Aug 2014 03:06:29 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ho7sm49239016wjb.2.2014.08.19.03.06.28
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Aug 2014 03:06:28 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 19 Aug 2014 12:06:30 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140819100630.GN3660@jama>
References: <1408411240-14009-1-git-send-email-fupan.li@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1408411240-14009-1-git-send-email-fupan.li@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [kernel.bbclass] [PATCH] let the multi-version kernel header files coexist on the target
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
X-List-Received-Date: Tue, 19 Aug 2014 10:06:32 -0000
X-Groupsio-MsgNum: 51771
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="eHmdSDY+kY2au76U"
Content-Disposition: inline

--eHmdSDY+kY2au76U
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 19, 2014 at 09:20:39AM +0800, fupan.li@windriver.com wrote:
> From: fupan li <fupan.li@windriver.com>
>=20
> When do RCPL upgrading, we want to keep the different RCPL's kernel heade=
r files coexist, just
> as the kernel image does.

This should go to oe-core ML.

>=20
> Signed-off-by: fupan li <fupan.li@windriver.com>
> ---
>  meta/classes/kernel.bbclass | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 6d9e646..e6ed716 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -75,9 +75,11 @@ EXTRA_OEMAKE =3D ""
> =20
>  KERNEL_ALT_IMAGETYPE ??=3D ""
> =20
> -# Define where the kernel headers are installed on the target as well as=
 where
> -# they are staged.
> -KERNEL_SRC_PATH =3D "/usr/src/kernel"
> +# Define where the kernel headers are staged.
> +KERNEL_SRC_EXPORT_PATH =3D "/usr/src/kernel"
> +#put the kernel headers in /usr/src/kernel-${@legitimize_package_name('$=
{KERNEL_VERSION}')} to
> +#let the different RCPL's kernel headers coexist.
> +KERNEL_SRC_PATH =3D "/usr/src/kernel-${@legitimize_package_name('${KERNE=
L_VERSION}')}"
> =20
>  KERNEL_IMAGETYPE_FOR_MAKE =3D "${@(lambda s: s[:-3] if s[-3:] =3D=3D ".g=
z" else s)(d.getVar('KERNEL_IMAGETYPE', True))}"
> =20
> @@ -313,7 +315,7 @@ kernelscripts_sstate_postinst () {
>  }
> =20
>  sysroot_stage_all_append() {
> -	sysroot_stage_dir ${D}${KERNEL_SRC_PATH} ${SYSROOT_DESTDIR}${KERNEL_SRC=
_PATH}
> +	sysroot_stage_dir ${D}${KERNEL_SRC_PATH} ${SYSROOT_DESTDIR}${KERNEL_SRC=
_EXPORT_PATH}
>  }
> =20
>  kernel_do_configure() {
> @@ -386,6 +388,14 @@ pkg_postrm_kernel-image () {
>  	update-alternatives --remove ${KERNEL_IMAGETYPE} ${KERNEL_IMAGETYPE}-${=
KERNEL_VERSION} || true
>  }
> =20
> +pkg_postinst_kernel-dev () {
> +        update-alternatives --install ${KERNEL_SRC_EXPORT_PATH} kernel-p=
ath kernel-${@legitimize_package_name('${KERNEL_VERSION}')} ${KERNEL_PRIORI=
TY} || true
> +}
> +
> +pkg_postrm_kernel-dev () {
> +        update-alternatives --remove kernel-path kernel-${@legitimize_pa=
ckage_name('${KERNEL_VERSION}')} || true
> +}
> +
>  PACKAGESPLITFUNCS_prepend =3D "split_kernel_packages "
> =20
>  python split_kernel_packages () {
> --=20
> 1.8.1.2
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--eHmdSDY+kY2au76U
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPzIaYACgkQN1Ujt2V2gBySqQCgqYXKHRw/wgm1Zh/z0IRzsPX1
ZoEAn0gDK5NO8vhkQKkmY4drBV8a+kvY
=xukS
-----END PGP SIGNATURE-----

--eHmdSDY+kY2au76U--
