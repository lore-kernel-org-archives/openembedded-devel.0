Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S00A4-0007nJ-66
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Feb 2012 01:34:24 +0100
Received: by eekd41 with SMTP id d41so2467833eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Feb 2012 16:26:04 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.14.127.80 as permitted sender) client-ip=10.14.127.80; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.14.127.80 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.14.127.80])
	by 10.14.127.80 with SMTP id c56mr14373932eei.13.1329870364755
	(num_hops = 1); Tue, 21 Feb 2012 16:26:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=a1uqFp2cS1YfBlWV0plqJNe2j6uWeqVIS1VsivOA0sw=;
	b=FkU3Pt8FIvo8dL0l06L0kUUxE/CPk7jRJNH8oaiUR+qQsVaKVf0bF3/zvctuDnFysp
	0jLWNI/OYpj48NwjFEl7HuvYMCXC8efNH/GGHFA5DYdYVuH+VuMB7hY0EpKE1Y7PJ6Qz
	aJzdsbJOSPPBuwTlCxfeMuqq7eFasyIFC4R+Q=
Received: by 10.14.127.80 with SMTP id c56mr11482028eei.13.1329870364288;
	Tue, 21 Feb 2012 16:26:04 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id a58sm95981170eeb.8.2012.02.21.16.26.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 21 Feb 2012 16:26:03 -0800 (PST)
Date: Wed, 22 Feb 2012 01:26:01 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120222002601.GE3769@jama.jama.net>
References: <1329870032-4952-1-git-send-email-andrea.adami@gmail.com>
	<1329870032-4952-2-git-send-email-andrea.adami@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1329870032-4952-2-git-send-email-andrea.adami@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH 1/1] meta-initramfs: import linux-kexecboot_3.2 and _git from meta-handheld
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 22 Feb 2012 00:34:24 -0000
X-Groupsio-MsgNum: 37313
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="u5E4XgoOPWr4PD9E"
Content-Disposition: inline

--u5E4XgoOPWr4PD9E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 22, 2012 at 01:20:32AM +0100, Andrea Adami wrote:
> * bump PR
>=20
> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> ---
>  meta-initramfs/recipes-kernel/linux/linux-git.inc  |   23 ++++++++++++++=
++++++

is this ^^ intentional?

>  .../recipes-kernel/linux/linux-kexecboot_3.2.bb    |   13 +++++++++++
>  .../recipes-kernel/linux/linux-kexecboot_git.bb    |   23 ++++++++++++++=
++++++
>  3 files changed, 59 insertions(+), 0 deletions(-)
>  create mode 100644 meta-initramfs/recipes-kernel/linux/linux-git.inc
>  create mode 100644 meta-initramfs/recipes-kernel/linux/linux-kexecboot_3=
=2E2.bb
>  create mode 100644 meta-initramfs/recipes-kernel/linux/linux-kexecboot_g=
it.bb
>=20
> diff --git a/meta-initramfs/recipes-kernel/linux/linux-git.inc b/meta-ini=
tramfs/recipes-kernel/linux/linux-git.inc
> new file mode 100644
> index 0000000..32a6d47
> --- /dev/null
> +++ b/meta-initramfs/recipes-kernel/linux/linux-git.inc
> @@ -0,0 +1,23 @@
> +KERNEL_RELEASE =3D "3.2.0-rc7"
> +OLD_KERNEL_RELEASE =3D "3.1.99"
> +PV =3D "${OLD_KERNEL_RELEASE}+${KERNEL_RELEASE}+gitr${SRCPV}"
> +
> +SRCREV =3D "371de6e4e0042adf4f9b54c414154f57414ddd37"
> +
> +CMDLINE_DEBUG =3D "debug"
> +
> +SRC_URI =3D "git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linu=
x-2.6.git;protocol=3Dgit;branch=3Dmaster \
> +           file://defconfig"
> +S =3D "${WORKDIR}/git"
> +
> +do_configure_prepend() {
> +#otherwise it gets extra '+' "2.6.37+"
> +#because:
> +#$ scripts/setlocalversion . =3D> +
> +#$ make kernelversion =3D> 2.6.37
> +#$ make kernelrelease =3D> 2.6.37+
> +  rm -rf ${S}/.git
> +}
> +
> +# Mark archs/machines that this kernel supports
> +DEFAULT_PREFERENCE =3D "-2"
> diff --git a/meta-initramfs/recipes-kernel/linux/linux-kexecboot_3.2.bb b=
/meta-initramfs/recipes-kernel/linux/linux-kexecboot_3.2.bb
> new file mode 100644
> index 0000000..3207429
> --- /dev/null
> +++ b/meta-initramfs/recipes-kernel/linux/linux-kexecboot_3.2.bb
> @@ -0,0 +1,13 @@
> +require linux-kexecboot.inc
> +
> +PR =3D "${INC_PR}.1"
> +S =3D "${WORKDIR}/linux-${PV}"
> +
> +SRC_URI +=3D "${KERNELORG_MIRROR}/linux/kernel/v3.x/linux-${PV}.tar.bz2;=
name=3Dkernel \
> +           ${KERNELORG_MIRROR}/linux/kernel/v3.x/patch-${PV}.1.bz2;apply=
=3Dyes;name=3Dstablepatch \
> +           "
> +
> +SRC_URI[kernel.md5sum] =3D "7ceb61f87c097fc17509844b71268935"
> +SRC_URI[kernel.sha256sum] =3D "c881fc2b53cf0da7ca4538aa44623a7de043a41f7=
6fd5d0f51a31f6ed699d463"
> +SRC_URI[stablepatch.md5sum] =3D "31fc34340f11118873463a1d59d47b7f"
> +SRC_URI[stablepatch.sha256sum] =3D "e9a26dc5faa309ae5172e3c65081fa98b60b=
efab160fb14d9a75816bbde15626"
> diff --git a/meta-initramfs/recipes-kernel/linux/linux-kexecboot_git.bb b=
/meta-initramfs/recipes-kernel/linux/linux-kexecboot_git.bb
> new file mode 100644
> index 0000000..b1fc75b
> --- /dev/null
> +++ b/meta-initramfs/recipes-kernel/linux/linux-kexecboot_git.bb
> @@ -0,0 +1,23 @@
> +require linux-kexecboot.inc
> +
> +PR =3D "${INC_PR}.1"
> +
> +KERNEL_RELEASE =3D "3.2.0-rc7"
> +OLD_KERNEL_RELEASE =3D "3.1.99"
> +PV =3D "${OLD_KERNEL_RELEASE}+${KERNEL_RELEASE}+gitr${SRCPV}"
> +
> +SRCREV =3D "371de6e4e0042adf4f9b54c414154f57414ddd37"
> +
> +CMDLINE_DEBUG =3D "debug"
> +
> +S =3D "${WORKDIR}/git"
> +SRC_URI =3D "git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linu=
x-2.6.git;protocol=3Dgit;branch=3Dmaster"
> +
> +do_configure_prepend() {
> +#otherwise it gets extra '+' "2.6.37+"
> +#because:
> +#$ scripts/setlocalversion . =3D> +
> +#$ make kernelversion =3D> 2.6.37
> +#$ make kernelrelease =3D> 2.6.37+
> +  rm -rf ${S}/.git
> +}
> --=20
> 1.7.3.4
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--u5E4XgoOPWr4PD9E
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk9ENhkACgkQN1Ujt2V2gBxbawCfeQ++HicaPf99LEjQfUy4hWl/
4RMAoLRPFvSgqT70LbW4cEnRye93tmCF
=SARj
-----END PGP SIGNATURE-----

--u5E4XgoOPWr4PD9E--
