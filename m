Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id 22AD16FF84
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Mar 2016 00:37:39 +0000 (UTC)
Received: by mail-pa0-f50.google.com with SMTP id fl4so101066155pad.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Feb 2016 16:37:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=1iIIfOk3z2o7uYCnZiQNznEkww0nW7vevopgHXf7UiQ=;
	b=PJoiJG/L0Dv0Lh7/h5WeWmgTA+wB+aTdqtWuPftJQlfV3li4UCgq63kKbHkPN7ZFbL
	qBvmYbkfBdFd6a/521gCjoXIWPc2bcgapKzTEEm1eNnbg++PwHBbWZY3ActOqBF0tLud
	rWWD1IS0zGFE1YRlsdAczwvL8YHrihoPkCgUII2JNAWrRk94vv2/MdwMRsRzDHxp8gwg
	e8G7CQlfy6VilmToGkwVVOn8CmZ4gnypYzYSRow2xEnlVjuK8XIU/Nlzd8CpRQy8ydKb
	KXfNVYHBpd/UMpFd/SQ9Cq78f2EZM4P1z1z06Xl2HJ/kTbcBbKTuSLDTHG9Six0lr7DP
	mBAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=1iIIfOk3z2o7uYCnZiQNznEkww0nW7vevopgHXf7UiQ=;
	b=NJYPucxYKxdBjmyIhQbi80Qbc90lFvtXltf0yfJJMhVkcqu0IrpeNPzEf1uHKNA8pu
	hlf30NINzJeSxYN1zyCsI3LQ/vQZnITYf6Xg5sLEeQcoLfG8GxFn7ivo6tnrIO7pSj7D
	P88Zz/+I0Fo4U0IHM3CWRII1TERuKw20o6TKzv2lDoB+75qxE/EM4S+SJjgoZayQ/Gdc
	RDtENYo97EgjxSyve4TO4FnZCtTJI4d+QShL+rR7j51qHPKE/X4kLpHDgtxT8GwTZPnZ
	/8/UW4pT1zaqbfHLqCP7/de/RcbYk/i1MZ3zSJYP4Qz5mbYdSiiHbrbHRJHlz2JvLV1c
	YlFA==
X-Gm-Message-State: AD7BkJJbc2jfbpkfpHNFpB1XdoVe4BDR39hfIqGSNZ+WZMCgWbwIMMKS9t7LNNWJFfP5hQ==
X-Received: by 10.66.154.233 with SMTP id vr9mr26207066pab.66.1456792660506;
	Mon, 29 Feb 2016 16:37:40 -0800 (PST)
Received: from [192.168.0.76] (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	s197sm40658284pfs.62.2016.02.29.16.37.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 29 Feb 2016 16:37:39 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1456791885-4062-2-git-send-email-rebecca.swee.fun.chang@intel.com>
Date: Mon, 29 Feb 2016 16:37:35 -0800
Message-Id: <E6FC597F-B384-416A-826C-6DCC6C32C968@gmail.com>
References: <1456791885-4062-1-git-send-email-rebecca.swee.fun.chang@intel.com>
	<1456791885-4062-2-git-send-email-rebecca.swee.fun.chang@intel.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.3112)
Cc: Rebecca Chang <rebecca.swee.fun.chang@intel.com>
Subject: Re: [meta-oe] [PATCH v2] libvpx: upgrade to version 1.5.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 01 Mar 2016 00:37:40 -0000
X-Groupsio-MsgNum: 60268
Content-Type: multipart/signed;
	boundary="Apple-Mail=_BEA220D7-F43A-4DD3-9BCF-ECB08FF070B9";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_BEA220D7-F43A-4DD3-9BCF-ECB08FF070B9
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Feb 29, 2016, at 4:24 PM, rebecca.swee.fun.chang@intel.com wrote:
>=20
> From: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
>=20
> This version had improved VP9 encoder and speeds up the encoding and
> decoding process.
>=20
> Signed-off-by: Chang Rebecca Swee Fun =
<rebecca.swee.fun.chang@intel.com>
> ---
> meta-oe/recipes-multimedia/webm/libvpx_1.4.0.bb | 51 =
-------------------------
> meta-oe/recipes-multimedia/webm/libvpx_1.5.0.bb | 50 =
++++++++++++++++++++++++
> 2 files changed, 50 insertions(+), 51 deletions(-)
> delete mode 100644 meta-oe/recipes-multimedia/webm/libvpx_1.4.0.bb
> create mode 100644 meta-oe/recipes-multimedia/webm/libvpx_1.5.0.bb
>=20

Can you force git to detect renames a bit harder and resend it ?

> diff --git a/meta-oe/recipes-multimedia/webm/libvpx_1.4.0.bb =
b/meta-oe/recipes-multimedia/webm/libvpx_1.4.0.bb
> deleted file mode 100644
> index c963a9c..0000000
> --- a/meta-oe/recipes-multimedia/webm/libvpx_1.4.0.bb
> +++ /dev/null
> @@ -1,51 +0,0 @@
> -SUMMARY =3D "VPX multi-format codec"
> -DESCRIPTION =3D "The BSD-licensed libvpx reference implementation =
provides en- and decoders for VP8 and VP9 bitstreams."
> -HOMEPAGE =3D "http://www.webmproject.org/code/"
> -BUGTRACKER =3D "http://code.google.com/p/webm/issues/list"
> -SECTION =3D "libs/multimedia"
> -LICENSE =3D "BSD"
> -
> -LIC_FILES_CHKSUM =3D =
"file://LICENSE;md5=3Dd5b04755015be901744a78cc30d390d4"
> -
> -SRC_URI +=3D =
"http://storage.googleapis.com/downloads.webmproject.org/releases/webm/${B=
P}.tar.bz2 \
> -            file://libvpx-configure-support-blank-prefix.patch \
> -           "
> -SRC_URI[md5sum] =3D "63b1d7f59636a42eeeee9225cc14e7de"
> -SRC_URI[sha256sum] =3D =
"f582d9b2d60a592a4a3d8c32965ca2d2167e9ade38c6c30bac8801ff66a118e4"
> -
> -# ffmpeg links with this and fails
> -# =
sysroots/armv4t-oe-linux-gnueabi/usr/lib/libvpx.a(vpx_encoder.c.o)(.text+0=
xc4): unresolvable R_ARM_THM_CALL relocation against symbol =
`memcpy@@GLIBC_2.4'
> -ARM_INSTRUCTION_SET =3D "arm"
> -
> -CFLAGS +=3D "-fPIC"
> -
> -export CC
> -export LD =3D "${CC}"
> -
> -VPXTARGET_armv5te =3D "armv5te-linux-gcc"
> -VPXTARGET_armv6 =3D "armv6-linux-gcc"
> -VPXTARGET_armv7a =3D "armv7-linux-gcc"
> -VPXTARGET ?=3D "generic-gnu"
> -
> -CONFIGUREOPTS =3D " \
> -    --target=3D${VPXTARGET} \
> -    --enable-vp8 \
> -    --enable-vp9 \
> -    --enable-libs \
> -    --disable-install-docs \
> -    --disable-static \
> -    --enable-shared \
> -    --prefix=3D${prefix} \
> -    --libdir=3D${libdir} \
> -    --size-limit=3D16384x16384 \
> -"
> -
> -do_configure() {
> -    ${S}/configure ${CONFIGUREOPTS}
> -}
> -
> -do_install() {
> -    oe_runmake install DESTDIR=3D${D}
> -    chown -R root:root ${D}
> -}
> -
> diff --git a/meta-oe/recipes-multimedia/webm/libvpx_1.5.0.bb =
b/meta-oe/recipes-multimedia/webm/libvpx_1.5.0.bb
> new file mode 100644
> index 0000000..8ac178d
> --- /dev/null
> +++ b/meta-oe/recipes-multimedia/webm/libvpx_1.5.0.bb
> @@ -0,0 +1,50 @@
> +SUMMARY =3D "VPX multi-format codec"
> +DESCRIPTION =3D "The BSD-licensed libvpx reference implementation =
provides en- and decoders for VP8 and VP9 bitstreams."
> +HOMEPAGE =3D "http://www.webmproject.org/code/"
> +BUGTRACKER =3D "http://code.google.com/p/webm/issues/list"
> +SECTION =3D "libs/multimedia"
> +LICENSE =3D "BSD"
> +
> +LIC_FILES_CHKSUM =3D =
"file://LICENSE;md5=3Dd5b04755015be901744a78cc30d390d4"
> +
> +SRC_URI +=3D =
"http://storage.googleapis.com/downloads.webmproject.org/releases/webm/${B=
P}.tar.bz2 \
> +            file://libvpx-configure-support-blank-prefix.patch \
> +           "
> +SRC_URI[md5sum] =3D "49e59dd184caa255886683facea56fca"
> +SRC_URI[sha256sum] =3D =
"306d67908625675f8e188d37a81fbfafdf5068b09d9aa52702b6fbe601c76797"
> +
> +# ffmpeg links with this and fails
> +# =
sysroots/armv4t-oe-linux-gnueabi/usr/lib/libvpx.a(vpx_encoder.c.o)(.text+0=
xc4): unresolvable R_ARM_THM_CALL relocation against symbol =
`memcpy@@GLIBC_2.4'
> +ARM_INSTRUCTION_SET =3D "arm"
> +
> +CFLAGS +=3D "-fPIC"
> +
> +export CC
> +export LD =3D "${CC}"
> +
> +VPXTARGET_armv5te =3D "armv5te-linux-gcc"
> +VPXTARGET_armv6 =3D "armv6-linux-gcc"
> +VPXTARGET_armv7a =3D "armv7-linux-gcc"
> +VPXTARGET ?=3D "generic-gnu"
> +
> +CONFIGUREOPTS =3D " \
> +    --target=3D${VPXTARGET} \
> +    --enable-vp8 \
> +    --enable-vp9 \
> +    --enable-libs \
> +    --disable-install-docs \
> +    --disable-static \
> +    --enable-shared \
> +    --prefix=3D${prefix} \
> +    --libdir=3D${libdir} \
> +    --size-limit=3D16384x16384 \
> +"
> +
> +do_configure() {
> +    ${S}/configure ${CONFIGUREOPTS}
> +}
> +
> +do_install() {
> +    oe_runmake install DESTDIR=3D${D}
> +    chown -R root:root ${D}
> +}
> --
> 1.9.1
>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_BEA220D7-F43A-4DD3-9BCF-ECB08FF070B9
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlbU5FMACgkQuwUzVZGdMxRYRgCeIZe3CNvKUrD/tC7o8k2w1SI1
ejoAn15yK7Dw0Li/sodvk6RhvukUQYqD
=yFe7
-----END PGP SIGNATURE-----

--Apple-Mail=_BEA220D7-F43A-4DD3-9BCF-ECB08FF070B9--
