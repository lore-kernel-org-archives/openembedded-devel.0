Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1S7eQf-00018Z-ET
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Mar 2012 03:59:09 +0100
Received: by lagw12 with SMTP id w12so1115326lag.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Mar 2012 19:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=m/GyaqFSLL9zJkATMdB+ACw3X5R2lCJwZZ16T3jSq/U=;
	b=w7RKbLz2TyCnirZS4Q74O8boJJFEgSnw7HZSaEcTaB636llTQHb2jsTlUR4dTvVFCW
	/BsmGPdofw2b3LZohn+nCupsFdsNN4jdkIpioJ5uCmSwpmvEHYzTdnIQFxvd+qlHo4D7
	zLF5SK41cYHNKiSlvB0QRSKVPGYZz6sRNLxdj2pA+64OnIMxyk75psgWXahvoMh5OVs8
	BNzYZrAnKU9ZGCBcwxaerqUmyBM1EWYsfO35uZSACqviBrElQdknOfE8ngZ6xyeaqXvw
	d9TMqkjH6Phqf2uzGb7Urk2n1aKEAASCPlwlBwKKDR/2+KE6jtAGHodVM/JhFW3Ee5eo
	NTNA==
Received: by 10.152.148.230 with SMTP id tv6mr681417lab.12.1331693424297; Tue,
	13 Mar 2012 19:50:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.27.109 with HTTP; Tue, 13 Mar 2012 19:49:54 -0700 (PDT)
In-Reply-To: <1331552887-13464-1-git-send-email-cheepeero@gmx.net>
References: <1331552887-13464-1-git-send-email-cheepeero@gmx.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 13 Mar 2012 19:49:54 -0700
Message-ID: <CAMKF1soUvaUkTYsEfP_3KMmeK7ckpxKEbV9H2LstEJEFpP6FPw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH v3] v4l-utils: skip qv4l2 instead of using host toolchain
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
X-List-Received-Date: Wed, 14 Mar 2012 02:59:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 12, 2012 at 4:48 AM, Ciprian Ciubotariu <cheepeero@gmx.net> wro=
te:
> The makefiles in the project attempt to use the host compilers if
> qmake is installed.

missing PR bump and patch headers as well as SOB
> ---
> =C2=A0.../v4l2apps/files/skip-qv4l2-0.8.4.patch =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| =C2=A0 37 ++++++++++++++++++++
> =C2=A0.../recipes-multimedia/v4l2apps/v4l-utils_0.8.4.bb | =C2=A0 =C2=A05=
 ++-
> =C2=A02 files changed, 40 insertions(+), 2 deletions(-)
> =C2=A0create mode 100644 meta-oe/recipes-multimedia/v4l2apps/files/skip-q=
v4l2-0.8.4.patch
>
> diff --git a/meta-oe/recipes-multimedia/v4l2apps/files/skip-qv4l2-0.8.4.p=
atch b/meta-oe/recipes-multimedia/v4l2apps/files/skip-qv4l2-0.8.4.patch
> new file mode 100644
> index 0000000..c8e8388
> --- /dev/null
> +++ b/meta-oe/recipes-multimedia/v4l2apps/files/skip-qv4l2-0.8.4.patch
> @@ -0,0 +1,37 @@
> +diff --git a/utils/Makefile b/utils/Makefile
> +index 71a3cb7..1d23c8b 100644
> +--- a/utils/Makefile
> ++++ b/utils/Makefile
> +@@ -11,19 +11,19 @@ all install:
> + =C2=A0 =C2=A0 =C2=A0 fi
> +
> + =C2=A0 =C2=A0 =C2=A0 # Test whether qmake is installed, and whether it =
is for qt4.
> +- =C2=A0 =C2=A0 =C2=A0@if which qmake-qt4 >/dev/null 2>&1; then \
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0QMAKE=3Dqmake-qt4; \
> +- =C2=A0 =C2=A0 =C2=A0else \
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0QMAKE=3Dqmake; \
> +- =C2=A0 =C2=A0 =C2=A0fi; \
> +- =C2=A0 =C2=A0 =C2=A0if which $$QMAKE >/dev/null 2>&1; then \
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if $$QMAKE --version 2=
>&1 | grep '4\.[0-9][0-9]*\.[0-9][0-9]*' >/dev/null; then \
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0if [ ! -f qv4l2/Makefile ]; then \
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(cd qv4l2 && $$QMAKE) || exit 1; \
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0fi; \
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0$(MAKE) -C qv4l2 -f Makefile.install $@; \
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi \
> +- =C2=A0 =C2=A0 =C2=A0fi
> ++# =C2=A0 =C2=A0 @if which qmake-qt4 >/dev/null 2>&1; then \
> ++# =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 QMAKE=3Dqmake-qt4; \
> ++# =C2=A0 =C2=A0 else \
> ++# =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 QMAKE=3Dqmake; \
> ++# =C2=A0 =C2=A0 fi; \
> ++# =C2=A0 =C2=A0 if which $$QMAKE >/dev/null 2>&1; then \
> ++# =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if $$QMAKE --version 2>&1 |=
 grep '4\.[0-9][0-9]*\.[0-9][0-9]*' >/dev/null; then \
> ++# =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 if [ ! -f qv4l2/Makefile ]; then \
> ++# =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (cd qv4l2 && $$QMAKE) || exit 1; \
> ++# =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 fi; \
> ++# =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 $(MAKE) -C qv4l2 -f Makefile.install $@; \
> ++# =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi \
> ++# =C2=A0 =C2=A0 fi
> +
> + sync-with-kernel:
> + =C2=A0 =C2=A0 =C2=A0 $(MAKE) -C keytable $@
> diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_0.8.4.bb b/met=
a-oe/recipes-multimedia/v4l2apps/v4l-utils_0.8.4.bb
> index 3252ae3..0e361de 100644
> --- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_0.8.4.bb
> +++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_0.8.4.bb
> @@ -1,5 +1,5 @@
> =C2=A0DESCRIPTION =3D "v4l2 and IR applications"
> -LICENSE =3D "GPLv2/LGPLv2.1"
> +LICENSE =3D "GPLv2 | LGPLv2.1"
> =C2=A0LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D48da9957849056017dc568bb=
c43d8975 \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fil=
e://COPYING.LIB;md5=3Dd749e86a105281d7a44c2328acebc4b0"
>
> @@ -8,7 +8,8 @@ DEPENDS =3D "jpeg"
> =C2=A0# libv4l was absorbed into this, let OE know that
> =C2=A0PROVIDES =3D "libv4l"
>
> -SRC_URI =3D "git://linuxtv.org/v4l-utils.git;protocol=3Dgit"
> +SRC_URI =3D "git://linuxtv.org/v4l-utils.git;protocol=3Dgit \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://skip-qv4l2-${PV}.patch"
> =C2=A0SRCREV =3D "v4l-utils-${PV}"
>
> =C2=A0S =3D "${WORKDIR}/git"
> --
> 1.7.3.4
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


