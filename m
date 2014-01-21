Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f176.google.com (mail-pd0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id 5346C6E702
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jan 2014 18:29:43 +0000 (UTC)
Received: by mail-pd0-f176.google.com with SMTP id w10so3269714pde.35
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jan 2014 10:29:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
	:references:mime-version:content-type;
	bh=nY56lUBc+cBUVvmx8iACvTMnmtGHzO2/lNB6YhR+/aQ=;
	b=k2nkLcQ0M0vYLE3fc/AHzfHjWFnHe/GJvMUd9JFxsOq9rw20SAzS4rZpOmvlpIhPfK
	s8BbF+X/AjF27cKOuXWxSr6SIc+K3tn1tzYv2GDj4Mxtwq4+h3Ul5fBuG3+gbACEyyi2
	pxCbKi5PslgYnwKxB768jA9e/QX8E/6RvQfZJTvhUtwf7OOG4Ac1igUrRzSN+oja11hu
	T0jBNfe7WROuHQ+jjnL7a0n3R3b9yj+wKWdBuLGOA9Pwu0zVQGZlyGBcQpP9a1LIpoPo
	wcJp12sOTRfGl5/vagp718D1RXxNMJrl5MXEUms8mW3xOyxRI5NvYcbSPE1UNtQ1Ta1Y
	yQmA==
X-Received: by 10.66.141.231 with SMTP id rr7mr25950556pab.41.1390328984301;
	Tue, 21 Jan 2014 10:29:44 -0800 (PST)
Received: from leo.localnet (99-57-140-30.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.30]) by mx.google.com with ESMTPSA id
	nv7sm14539693pbc.31.2014.01.21.10.29.42 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 Jan 2014 10:29:42 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 Jan 2014 10:29:55 -0800
Message-ID: <1688777.CYGoEHJ1ll@leo>
X-Face: (*D:+-|[O9m:a&dKxg#R`m^Nxy<HmNPV<Ic-_>RMPm0'o70t~39kUjcE\?l`>41l^%&x; O
	ss*RIK.m#<6OwX.R&K={4[\RYyqeUgI^7G0BRJfLXVkrEjSlX5rk\rOt"ur?`%"2}`hDBt
	QHQ|<@r6-hq"([T&r02ayw^tEXBwsh6g%qt!Q?)*H$OE6mk^BUm30s`G[u:_wi&vIUh&Lh
	L_.\+; 0Q:nB(8TJq\bWseix)aav+[*-wMDT5+55W^jS%u-J{Hv)&lSoaU^m_+*>]"
User-Agent: KMail/4.12.1 (Linux/3.12.7-2-ARCH; KDE/4.12.1; x86_64; ; )
In-Reply-To: <1390302526-3333-1-git-send-email-koen@dominion.thruhere.net>
References: <1390302526-3333-1-git-send-email-koen@dominion.thruhere.net>
MIME-Version: 1.0
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [meta-initramfs][PATCHv2] dracut: add git version
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
X-List-Received-Date: Tue, 21 Jan 2014 18:29:43 -0000
X-Groupsio-MsgNum: 47843
Content-Type: multipart/signed; boundary="nextPart30226028.oohlb9D3y2";
	micalg="pgp-sha1"; protocol="application/pgp-signature"

--nextPart30226028.oohlb9D3y2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

On Tuesday, January 21, 2014 12:08:46 PM Koen Kooi wrote:
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>=20
> Changes since v1:
> =09Fix PV
>=20
> To make it work properly in systemd mode you'll need
> http://patches.openembedded.org/patch/65317/ as well.
>=20
>  ...-xz-lzma-option-to-use-all-cores-for-mult.patch |   39
> +++++++++++++++++++ .../recipes-devtools/dracut/dracut_git.bb        =
  | =20
> 40 ++++++++++++++++++++ 2 files changed, 79 insertions(+)
>  create mode 100644

recipes-devtools does not sound appropriate location maybe recipes-core=
 is=20
better ?

> meta-initramfs/recipes-devtools/dracut/dracut/0001-Use-builtin-xz-lzm=
a-opti
> on-to-use-all-cores-for-mult.patch create mode 100644
> meta-initramfs/recipes-devtools/dracut/dracut_git.bb
>=20
> diff --git
> a/meta-initramfs/recipes-devtools/dracut/dracut/0001-Use-builtin-xz-l=
zma-op
> tion-to-use-all-cores-for-mult.patch
> b/meta-initramfs/recipes-devtools/dracut/dracut/0001-Use-builtin-xz-l=
zma-op
> tion-to-use-all-cores-for-mult.patch new file mode 100644
> index 0000000..7dc62de
> --- /dev/null
> +++
> b/meta-initramfs/recipes-devtools/dracut/dracut/0001-Use-builtin-xz-l=
zma-op
> tion-to-use-all-cores-for-mult.patch @@ -0,0 +1,39 @@
> +From c92ea797c43aa811e98b6bd8fb4aae921fa08592 Mon Sep 17 00:00:00 20=
01
> +From: Koen Kooi <koen@dominion.thruhere.net>
> +Date: Fri, 10 Jan 2014 21:11:40 +0100
> +Subject: [PATCH] Use builtin xz/lzma option to use all cores for
> multihreaded + compression
> +
> +This removes the dependency on 'getconf' as well, which is not insta=
lled by
> default on my embedded systems. +
> +Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> +Upstream-status: Submitted
> +
> +---
> + dracut.sh | 6 ++----
> + 1 file changed, 2 insertions(+), 4 deletions(-)
> +
> +diff --git a/dracut.sh b/dracut.sh
> +index 11dcd0e..2e6ea67 100755
> +--- a/dracut.sh
> ++++ b/dracut.sh
> +@@ -697,14 +697,12 @@ stdloglvl=3D$((stdloglvl + verbosity_mod_l))
> + # eliminate IFS hackery when messing with fw_dir
> + fw_dir=3D${fw_dir//:/ }
> +
> +-cpu_count=3D$(getconf _NPROCESSORS_ONLN)
> +-
> + # handle compression options.
> + [[ $compress ]] || compress=3D"gzip"
> + case $compress in
> +     bzip2) compress=3D"bzip2 -9";;
> +-    lzma)  compress=3D"lzma -9 ${cpu_count:+-T$cpu_count}";;
> +-    xz)    compress=3D"xz --check=3Dcrc32 --lzma2=3Ddict=3D1MiB
> ${cpu_count:+-T$cpu_count}";; ++    lzma)  compress=3D"lzma -9 -T0";;=

> ++    xz)    compress=3D"xz --check=3Dcrc32 --lzma2=3Ddict=3D1MiB -T0=
";;
> +     gzip)  compress=3D"gzip -9"; command -v pigz > /dev/null 2>&1 &=
&
> compress=3D"pigz -9";; +     lzo)   compress=3D"lzop -9";;
> +     lz4)   compress=3D"lz4 -9";;
> +--
> +1.8.0
> +
> diff --git a/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
> b/meta-initramfs/recipes-devtools/dracut/dracut_git.bb new file mode =
100644
> index 0000000..13181fe
> --- /dev/null
> +++ b/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
> @@ -0,0 +1,40 @@
> +SUMMARY =3D "Initramfs generator using udev"
> +DESCRIPTION =3D "Dracut is an event driven initramfs infrastructure.=
 dracut
> (the tool) is used to create an initramfs image by copying tools and =
files
> from an installed system and combining it with the dracut framework,
> usually found in /usr/lib/dracut/modules.d." +
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fda=
f4a4263"
> +
> +SRCREV =3D "bb1ba3a1ca9dd6284f6319eb197de4a757a7f99d"
> +SRC_URI =3D "git://git.kernel.org/pub/scm/boot/dracut/dracut.git \
> +         =20
> file://0001-Use-builtin-xz-lzma-option-to-use-all-cores-for-mult.patc=
h \ +=20
>         "
> +
> +PV =3D "0.34+git${SRCPV}"
> +
> +S =3D "${WORKDIR}/git"
> +
> +do_configure() {
> +    ./configure --prefix=3D${prefix} \
> +                --libdir=3D${libdir} \
> +                --datadir=3D${datadir} \
> +                --sysconfdir=3D${sysconfdir} \
> +                --sbindir=3D${sbindir} \
> +                --disable-documentation \
> +                --bindir=3D${bindir} \
> +                --includedir=3D${includedir} \
> +                --localstatedir=3D${localstatedir} \
> +}
> +
> +do_install() {
> +    oe_runmake install DESTDIR=3D${D}
> +}
> +
> +FILES_${PN} +=3D "${datadir}/bash-completion \
> +                ${libdir}/kernel \
> +               "
> +
> +RDEPENDS_${PN} =3D "systemd findutils cpio util-linux-blkid bash ldd=
"
> +# This could be optimized a bit, but let's avoid non-booting systems=
 :)
> +RRECOMMENDS_${PN} =3D " \
> +                     kernel-modules \
> +                    "

=2D-=20
=2DKhem

--nextPart30226028.oohlb9D3y2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEABECAAYFAlLevKMACgkQuwUzVZGdMxQ/JgCdGMfE+3HR63pWwFQJ4voqEgWu
8aAAnRdYHFrMnF1MNqYTIXgnd+B919Ok
=5tRK
-----END PGP SIGNATURE-----

--nextPart30226028.oohlb9D3y2--
