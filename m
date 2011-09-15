Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1R48Qj-0002YQ-9J for openembedded-devel@lists.openembedded.org;
	Thu, 15 Sep 2011 11:40:25 +0200
Received: from f053044184.adsl.alicedsl.de ([78.53.44.184]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1R48Lr-0003Dw-PR for openembedded-devel@lists.openembedded.org;
	Thu, 15 Sep 2011 09:35:23 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Sep 2011 11:35:14 +0200
In-Reply-To: <1316077931-7737-2-git-send-email-npavel@mini-box.com>
References: <1316077931-7737-1-git-send-email-npavel@mini-box.com>
	<1316077931-7737-2-git-send-email-npavel@mini-box.com>
X-Mailer: Evolution 3.0.3- 
Message-ID: <1316079316.4523.32.camel@mattotaupa>
Mime-Version: 1.0
Subject: Re: [PATCH v2 1/2] Add linux kernel recipe for picoSAM9G45 board
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
X-List-Received-Date: Thu, 15 Sep 2011 09:40:25 -0000
X-Groupsio-MsgNum: 34249
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-Y6wmU9rqBPQiZFIY2+n/"

--=-Y6wmU9rqBPQiZFIY2+n/
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Donnerstag, den 15.09.2011, 12:12 +0300 schrieb Nicu Pavel:
> Add linux kernel recipe for picoSAM9G45 board[1]. This kernel is based on
> stock 2.6.32 with AT91 patches[2], Android patches[3] and board specific =
patches.
> Some of the board specific patches had been submited upstream[4].Custom a=
ndroid
> related patches won't be submited upstream. Future updates are planned to=
 include
> patches from Android[3] and AT91 Linux tree[5].
>=20
>     1. http://www.mini-box.com/pico-SAM9G45-X
>     2. http://www.at91.com/linux4sam/bin/view/Linux4SAM/LinuxKernel
>     3. https://github.com/android/kernel_common
>     4. http://www.arm.linux.org.uk/developer/patches/search.php?summary=
=3DAT91
>     5. https://github.com/at91linux/linux-2.6-at91
>=20
> Signed-off-by: Nicu Pavel <npavel@mini-box.com>
> ---
>  recipes/linux/picosam9/defconfig | 1806 ++++++++++++++++++++++++++++++++=
++++++
>  recipes/linux/picosam9_git.bb    |   32 +
>  2 files changed, 1838 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/linux/picosam9/defconfig
>  create mode 100644 recipes/linux/picosam9_git.bb

[=E2=80=A6]

> diff --git a/recipes/linux/picosam9_git.bb b/recipes/linux/picosam9_git.b=
b
> new file mode 100644
> index 0000000..892c93d
> --- /dev/null
> +++ b/recipes/linux/picosam9_git.bb
> @@ -0,0 +1,32 @@
> +DESCRIPTION =3D "Kernel for picoSAM9 board (http://www.mini-box.com/pico=
-SAM9G45-X)"
> +HOMEPAGE =3D "http://arm.mini-box.com"
> +KV =3D "2.6.32"
> +SRCREV =3D "5d564f090ee99a0570a2cc912ebc30b65922f7bb"
> +PV =3D "${KV}+gitr${SRCREV}"
> +PR =3D "r0"
> +
> +require linux.inc
> +
> +# For Angstrom and Android Eclair (for a Android Gingerbread compatible =
kernel use
> +# branch=3Dminibox-picopc-2.6.32-gingerbread)
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
> +# mem=3D128M@xxxx - picoSAM9 has 2x128Mb memory banks at different adres=
ses and uses

ad*d*resses

> +#                 sparsemem memory model to use both banks=20
> +# rootwait=3D1  - wait for the root device to show up (picosam9 boots fr=
om microSD(MMC))
> +# rootdelay=3D1 - wait 1 second before mounting the root fs (some delay =
exists between
> +#               root device showing up and partition detection).
> +# androidboot.hardware=3Dpicopc - compatibility option for booting andro=
id=20
> +#                               (loading of init.picopc.rc and libhardwa=
re libs)
> +# init=3D/init  - compatibility option for starting android init.If not =
found standard /linuxrc is=20
> +#               executed
> +CMDLINE =3D "mem=3D128M@0x20000000 mem=3D128M@0x70000000 console=3DttyS0=
,115200 root=3D/dev/mmcblk0p2 rw init=3D/init rootdelay=3D1 rootwait=3D1 lo=
glevel=3D7 androidboot.hardware=3Dpicopc"

Is the increased(?) loglevel needed?

> +KERNEL_IMAGETYPE =3D "uImage"
> +ARM_KEEP_OABI =3D "1"

I will push this patch with the typo corrected. You do not need to
resend it.


Thanks,

Paul

--=-Y6wmU9rqBPQiZFIY2+n/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk5xxtMACgkQPX1aK2wOHVi83gCfYEPlhxX+lBjEObLzM+uS0mBg
q4QAn0qWBEU5a+/4Myuvg05/xLiLHLAP
=CsYa
-----END PGP SIGNATURE-----

--=-Y6wmU9rqBPQiZFIY2+n/--
