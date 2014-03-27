Return-Path: <joe@deserted.net>
Received: from mail-qg0-f43.google.com (mail-qg0-f43.google.com
	[209.85.192.43])
	by mail.openembedded.org (Postfix) with ESMTP id 06C186F8BC
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Mar 2014 20:27:41 +0000 (UTC)
Received: by mail-qg0-f43.google.com with SMTP id f51so3433528qge.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Mar 2014 13:27:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=Vu0z7H3DYY2tR/3QcCZFsGX6N5asPtOMP+po0ZQMQxw=;
	b=LQe/AohXOp9mdkM9gq7CtMgHBDq/Eptrepb1CslU3AooImrqRo5HotQyCzn+weaznb
	8m+7+JS0uMVQq+n1JQXQXPDGqmdDW34o8q0lfRHHGT9LA76HpRhNtANjdLkARdBTAz1a
	kWHRdE/18dVaooT3UyxneO/hJHuPolkwtbNGmE+qsuz2YyG/mIIVAYDjD5c9B6CwlnVQ
	mmcf8RwiEqq9PtQWoPY8JEp5M94zbBFssprL6VgFECDwATQxfLCFkH4okrtxMQJqvz52
	b2ApcYQC5oKIaHI+/2Y9SdnwK4IDXgobkXY49MyvKlc93pHRE9aHuw9/txmFEwDkjpya
	YL0A==
X-Gm-Message-State: ALoCoQkijlKcVEDP9qJIK4GyQuJT/sFyeap3YZsQaI/iTz9r58IKx00gp8aaSMWqSgkhnoZ/VH9v
X-Received: by 10.140.98.233 with SMTP id o96mr4487908qge.86.1395952062736;
	Thu, 27 Mar 2014 13:27:42 -0700 (PDT)
Received: from deserted.net ([128.224.252.2])
	by mx.google.com with ESMTPSA id w2sm5772564qar.21.2014.03.27.13.27.41
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 27 Mar 2014 13:27:42 -0700 (PDT)
Date: Thu, 27 Mar 2014 16:27:39 -0400
From: Joe MacDonald <joe@deserted.net>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140327202738.GB15666@deserted.net>
References: <1395301457-20665-1-git-send-email-b40290@freescale.com>
MIME-Version: 1.0
In-Reply-To: <1395301457-20665-1-git-send-email-b40290@freescale.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [meta-networking][PATCH ] sethdlc : add recipe
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
X-List-Received-Date: Thu, 27 Mar 2014 20:27:44 -0000
X-Groupsio-MsgNum: 48870
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="SkvwRMAIpAhPCcCJ"
Content-Disposition: inline

--SkvwRMAIpAhPCcCJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Merged, thanks.
-J.

[[oe] [meta-networking][PATCH ] sethdlc : add recipe] On 14.03.20 (Thu 15:4=
4) b40290@freescale.com wrote:

> From: Chunrong Guo <B40290@freescale.com>
>=20
>    * sethdlc: get/set Linux HDLC packet radio modem driver port informati=
on
>    * sethdlc is  a  program designed to set and/or report the configurati=
on
>      information associated with a soundcard radio modem port. This infor=
mation
>      includes  the  modem type, what I/O port, IRQ and DMA channel a part=
icular
>      modem port is using, and where to output a transmitter  keying (PTT)=
 signal.
>=20
> Signed-off-by: Chunrong Guo <B40290@freescale.com>
> ---
>  .../recipes-connectivity/sethdlc/sethdlc.bb        | 30 ++++++++++++++++=
++++++
>  1 file changed, 30 insertions(+)
>  create mode 100644 meta-networking/recipes-connectivity/sethdlc/sethdlc.=
bb
>=20
> diff --git a/meta-networking/recipes-connectivity/sethdlc/sethdlc.bb b/me=
ta-networking/recipes-connectivity/sethdlc/sethdlc.bb
> new file mode 100644
> index 0000000..3a9692f
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/sethdlc/sethdlc.bb
> @@ -0,0 +1,30 @@
> +DESCRIPTION =3D "set Linux HDLC packet radio modem driver port informati=
on"
> +HOMEPAGE =3D "https://www.kernel.org/pub/linux/utils/net/hdlc"
> +LICENSE =3D "GPLv2 & GPLv2+ "
> +LIC_FILES_CHKSUM =3D "file://Makefile;md5=3D19aada31930b2be84bf7138420d7=
7263"
> +
> +
> +SRC_URI =3D "https://www.kernel.org/pub/linux/utils/net/hdlc/${BPN}-1.18=
=2Etar.gz \
> +"
> +SRC_URI[md5sum] =3D "9016878156a5eadb06c0bae71cc5c9ab"
> +SRC_URI[sha256sum] =3D "21b1e2e1cb0e288b0ec8fcfd9fed449914e0f8e6fc273706=
bd5b3d4f6ab6b04e"
> +
> +
> +S =3D "${WORKDIR}/${BPN}-1.18"
> +
> +DEPENDS=3D"virtual/kernel"
> +
> +EXTRA_OEMAKE=3D"CROSS_COMPILE=3D${TARGET_PREFIX} CC=3D'${CC} ${LDFLAGS}'=
 \
> +              KERNEL_DIR=3D${STAGING_KERNEL_DIR} "
> +
> +do_compile_prepend () {
> +    oe_runmake clean
> +}
> +
> +
> +do_install() {
> +    install -d ${D}/${bindir}
> +    install sethdlc ${D}/${bindir}/
> +}
> +
> +FILES_${PN} +=3D "${bindir}/sethdlc"
> --=20
> 1.8.3.2
>=20
>=20
--=20
-Joe MacDonald.
:wq

--SkvwRMAIpAhPCcCJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlM0iboACgkQwFvcllog0XzVmACgh5TVHF/EfR+kQmDxFaMzcfdn
tgkAn1nKONreNZXPfMb1FybsesTvbCJJ
=fCu0
-----END PGP SIGNATURE-----

--SkvwRMAIpAhPCcCJ--
