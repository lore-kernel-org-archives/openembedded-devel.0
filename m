Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1R3mYF-0004QA-Ba for openembedded-devel@lists.openembedded.org;
	Wed, 14 Sep 2011 12:18:43 +0200
Received: from f053036201.adsl.alicedsl.de ([78.53.36.201]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1R3mTM-0006uV-2Q for openembedded-devel@lists.openembedded.org;
	Wed, 14 Sep 2011 10:13:40 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 14 Sep 2011 12:13:27 +0200
In-Reply-To: <CAL9MRrnBVWmZ06rYdp-PomBj=n_4OSMSRx9ejdSJnfn5V7Hokw@mail.gmail.com>
References: <CAL9MRrnBVWmZ06rYdp-PomBj=n_4OSMSRx9ejdSJnfn5V7Hokw@mail.gmail.com>
X-Mailer: Evolution 3.0.3- 
Message-ID: <1315995214.6686.46.camel@mattotaupa>
Mime-Version: 1.0
Subject: Re: [PATCH] Add support for mini-box.com picoSAM9G45 board
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
X-List-Received-Date: Wed, 14 Sep 2011 10:18:43 -0000
X-Groupsio-MsgNum: 34214
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-P7QswmZcyoN1Vb1zTG1P"

--=-P7QswmZcyoN1Vb1zTG1P
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Nicu,


Am Mittwoch, den 14.09.2011, 11:35 +0300 schrieb Nicu Pavel:

> I attached a patch to add support for picoSAM9G45 board
> (http://www.mini-box.com/pico-SAM9G45-X)
>=20
> More information about this board and software support is available on
> the wiki here: http://arm.mini-box.com/index.php?title=3DMain_Page

thank you for your contribution.

> From 82f4c501dd63225cc37fec58a9c649ae9d542513 Mon Sep 17 00:00:00 2001
> From: Nicu Pavel <npavel@mini-box.com>
> Date: Wed, 14 Sep 2011 11:30:18 +0300
> Subject: [PATCH] Add support for mini-box.com picoSAM9G45 board

1. Unfortunately our policy [1] forbids out to commit your patch,
because you did not add your Signed-off-by line.

2. Also please add the information from your introduction to the commit
message.

3. The more information the better. Looking at your Wiki pages you seem
to use the =C8=A6ngstr=C3=B6m distribution. Please add that too and probabl=
y it is
also good to know what you have tested (ports, graphics, =E2=80=A6).

I guess when your patches are committed the image is exactly the same as
the one build by the instructions in your Wiki [3]?

> ---
>  conf/machine/picosam9.conf       |   13 +
>  recipes/linux/picosam9/defconfig | 1806 ++++++++++++++++++++++++++++++++=
++++++
>  recipes/linux/picosam9_git.bb    |   23 +
>  3 files changed, 1842 insertions(+), 0 deletions(-)
>  create mode 100644 conf/machine/picosam9.conf
>  create mode 100644 recipes/linux/picosam9/defconfig
>  create mode 100644 recipes/linux/picosam9_git.bb

4. Please split up your patch into two patches adding the Linux kernel
stuff first and then the machine. All the detailed description should go
into the second commit message. Take [2] as an example. The Linux kernel
commit message should contain what version this is based on and if you
have plans to update to newer versions or stay with 2.6.32.x.

> diff --git a/conf/machine/picosam9.conf b/conf/machine/picosam9.conf
> new file mode 100644
> index 0000000..71f2c84
> --- /dev/null
> +++ b/conf/machine/picosam9.conf
> @@ -0,0 +1,13 @@
> +#@TYPE: Machine
> +#@Name: pico-SAM9G45 (http://www.mini-box.com/pico-SAM9G45-X)
> +#@DESCRIPTION: Machine configuration for the picoSAM9G45 board with a at=
91sam9m10 processor
> +
> +TARGET_ARCH =3D "arm"
> +
> +PREFERRED_PROVIDER_virtual/kernel =3D "picosam9"
> +
> +PREFERRED_PROVIDER_xserver =3D "xserver-kdrive"
> +
> +MACHINE_FEATURES +=3D "usbhost kernel26 apm vfat screen touchscreen ethe=
rnet wifi bluetooth"
> +
> +require conf/machine/include/tune-arm926ejs.inc
> diff --git a/recipes/linux/picosam9/defconfig b/recipes/linux/picosam9/de=
fconfig
> new file mode 100644
> index 0000000..a816d93
> --- /dev/null
> +++ b/recipes/linux/picosam9/defconfig
> @@ -0,0 +1,1806 @@
> +#
> +# Automatically generated make config: don't edit
> +# Linux kernel version: 2.6.32.9
> +# Mon Aug 29 10:24:42 2011

[=E2=80=A6]

> diff --git a/recipes/linux/picosam9_git.bb b/recipes/linux/picosam9_git.b=
b
> new file mode 100644
> index 0000000..37cacb5
> --- /dev/null
> +++ b/recipes/linux/picosam9_git.bb
> @@ -0,0 +1,23 @@
> +DESCRIPTION =3D "Kernel for picoSAM9 board (http://www.mini-box.com/pico=
-SAM9G45-X)"
> +AUTHOR =3D "Nicu Pavel <npavel at mini-box.com>"

The author field in this case would be reserved for the upstream author
which is Linus and co I guess. We do not have a maintainer field so
please remove that line. The home page and the commit log currently have
to be enough to find the correct person to contact.

> +HOMEPAGE =3D "http://arm.mini-box.com"
> +KV =3D "2.6.32"
> +SRCREV =3D "5d564f090ee99a0570a2cc912ebc30b65922f7bb"
> +PV =3D "${KV}+gitr${SRCREV}"
> +PR =3D "r7"

Please start with "r0".

> +
> +require linux.inc
> +
> +# For Angstrom and Android Eclair=20

Please remove the trailing white space (`git diff --check`).

Please add to the commit message what these additional patches do and if
they are submitted upstream.

> +SRC_URI =3D "\
> +  git://gitorious.org/picopc-kernel/kernel.git;protocol=3Dgit;branch=3Dm=
inibox-picopc-2.6.32 \
> +  file://defconfig \
> +"
> +
> +S =3D "${WORKDIR}/git"
> +
> +COMPATIBLE_HOST =3D "arm.*-linux"
> +COMPATIBLE_MACHINE =3D "picosam9"
> +CMDLINE =3D "mem=3D128M@0x20000000 mem=3D128M@0x70000000 console=3DttyS0=
,115200 root=3D/dev/mmcblk0p2 rw init=3D/init rootdelay=3D1 rootwait=3D1 lo=
glevel=3D7 androidboot.hardware=3Dpicopc"

Please add a comment why especially the last four options are needed.

> +KERNEL_IMAGETYPE =3D "uImage"
> +ARM_KEEP_OABI =3D "1"
> --=20
> 1.7.1

Please resend with these comments addressed as [PATCH v2] [4].


Thanks again,

Paul


[1] http://www.openembedded.org/wiki/Commit_Policy
[2] http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-August/034=
645.html
[3] http://arm.mini-box.com/index.php?title=3DCompiling_Angstrom_for_pico-S=
AM9G45
[4] http://openembedded.org/index.php?title=3DHow_to_submit_a_patch_to_Open=
Embedded

--=-P7QswmZcyoN1Vb1zTG1P
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk5wfkoACgkQPX1aK2wOHVj/cQCfdUKSVVzeHCh4T85GRgxUJuuZ
Wo8AoIv3yr0NKYu5jlYk1Dt7z/PmPfez
=e13/
-----END PGP SIGNATURE-----

--=-P7QswmZcyoN1Vb1zTG1P--
