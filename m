Received: from host4.kei.pl ([195.149.226.213] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1NHYwx-0006oT-M6
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Dec 2009 09:28:10 +0100
Received: (qmail 13347 invoked by uid 813007); 7 Dec 2009 08:26:30 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 7 Dec 2009 08:26:30 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 7 Dec 2009 09:26:48 +0100
User-Agent: KMail/1.12.2 (Linux/2.6.32-rc7-00029-ga9366e6-dirty; KDE/4.3.2;
	x86_64; ; )
References: <1260139496-21442-1-git-send-email-leon@sidebranch.com>
	<1260139496-21442-17-git-send-email-leon@sidebranch.com>
	<1260139496-21442-18-git-send-email-leon@sidebranch.com>
In-Reply-To: <1260139496-21442-18-git-send-email-leon@sidebranch.com>
MIME-Version: 1.0
Message-Id: <200912070926.49072.marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] linux-nios2-2.6.28: Linux kernel for nios2 machines.
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
X-List-Received-Date: Mon, 07 Dec 2009 08:28:10 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Dnia niedziela, 6 grudnia 2009 o 23:44:53 Leon Woestenberg napisa=C5=82(a):

> diff --git a/recipes/linux/linux-nios2_2.6.28.bb
>  b/recipes/linux/linux-nios2_2.6.28.bb new file mode 100644
> index 0000000..031f4f5
> --- /dev/null
> +++ b/recipes/linux/linux-nios2_2.6.28.bb
> @@ -0,0 +1,36 @@
> +INHIBIT_DEFAULT_DEPS =3D "1"
> +DEPENDS +=3D "unifdef-native"
> +PR =3D "r3"
> +

> +FILESPATH =3D "${FILE_DIRNAME}/${PN}/${PV}"

drop that

> +
> +#SRC_URI =3D
>  "git://sopc.et.ntust.edu.tw/git/linux-2.6.git;branch=3Dtest-nios2;tags=
=3D3146b
> 39c185f8a436d430132457e84fa1d8f8208=20
> \ +SRC_URI =3D
>  "http://127.0.0.1/linux-nios2-2.6.28-git.tbz \

Can you put it online so other people can fetch and build it? I know that=20
hardware is yours but think autobuilders or weird build tests.

> +           file://procinfo.h \
> +           file://system.ptf"
> +SRC_URI +=3D "file://defconfig"
> +
> +S =3D "${WORKDIR}/linux-2.6"
> +
> +COMPATIBLE_HOST =3D 'nios2.*-linux.*'
> +COMPATIBLE_MACHINE =3D '(nios2|sygeg1)'

So which kernel supports "cyclone3-starter" machine? And you can use=20
COMPATIBLE_MACHINE without COMPATIBLE_HOST.

> +inherit kernel

Why not "require linux.inc"?

> +ARCH =3D "nios2"

Was not that set in machine config?

> +KERNEL_IMAGETYPE =3D "zImage"

This is default - drop.
> +
> +do_configure() {

> +        rm -f ${S}/.config
> +
> +        if [ ! -e ${WORKDIR}/defconfig ]; then
> +                die "No default configuration for ${MACHINE} available."
> +        fi

This part is already in linux.inc - use it?

> +	echo
>  "CONFIG_INITRAMFS_SOURCE=3D\"${DEPLOY_DIR_IMAGE}/initramfs_root.cpio\"" =
  >>
>  ${S}/.config +        sed -e '/CONFIG_INITRAMFS_SOURCE/d'
>  '${WORKDIR}/defconfig' >>'${S}/.config' +
> +	oe_runmake hwselect SYSPTF=3D../system.ptf CPU_SELECTION=3D1 MEM_SELECT=
ION=3D2
>  ARCH=3D$ARCH +        yes '' | oe_runmake oldconfig
> +}
>=20


Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




