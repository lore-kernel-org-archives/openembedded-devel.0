Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id 62C497299C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Jan 2015 15:18:23 +0000 (UTC)
Received: by mail-wi0-f173.google.com with SMTP id r20so42657413wiv.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Jan 2015 07:18:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=RXemeLrhiP6yrwuZShReCVztYEpbF78z8EJReY34cA8=;
	b=FbuTbuGsBKkDAcErg4ymIf7yo6kBsgriFLchLRPCrS4WAIXAJ4KONNmkzLQvj3uXXX
	p+bUSIBucjTCBVPkAXfrQiN2GXpdAeawslBHWenpbwR5eGX9c8Yq3tlJYtaGM8slFMt/
	GL+On0YnKI61Y4JPnP9DhgIF5Z0uXG7j2pcE7wbZQZ2xIJ5DtHH0WLp/oH6tertbwnpD
	EqqaLEWJ/lL48YutGv/+8mMwxwROguMG5w5o3KeLx0soiaAKlOgdTz65DKDlBfVAYShl
	FXxFLgqRirrAO4dxg9Rvgk2jRvwHmK+uWC7+g9fZw4VBqI/gda2oHLDrmrRX9ts/j2wy
	HlmA==
X-Received: by 10.194.20.67 with SMTP id l3mr4196609wje.94.1421939904016;
	Thu, 22 Jan 2015 07:18:24 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id k1sm4379914wjn.9.2015.01.22.07.18.23
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 22 Jan 2015 07:18:23 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 22 Jan 2015 16:18:28 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150122151828.GC2456@jama>
References: <1421794902-18855-1-git-send-email-andrea.adami@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1421794902-18855-1-git-send-email-andrea.adami@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-initramfs][PATCH] kexec-tools-klibc_2.0.2: backport patch to fix build with separate B and S
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
X-List-Received-Date: Thu, 22 Jan 2015 15:18:24 -0000
X-Groupsio-MsgNum: 53929
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lMM8JwqTlfDpEaS6"
Content-Disposition: inline

--lMM8JwqTlfDpEaS6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 21, 2015 at 12:01:42AM +0100, Andrea Adami wrote:
> Catching up with oe-core commit 5fccfd0f0a9dd4dca96389f5d856d3fab21745e2
> ( kexec-tools: separate B and S) which removed autotools-brokensep for a =
newer
> version.
>=20
> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> ---
>  .../fix-out-of-tree-build.patch                    | 54 ++++++++++++++++=
++++++
>  .../kexec/kexec-tools-klibc_2.0.2.bb               |  2 +
>  2 files changed, 56 insertions(+)
>  create mode 100644 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc=
-2.0.2/fix-out-of-tree-build.patch
>=20
> diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/=
fix-out-of-tree-build.patch b/meta-initramfs/recipes-kernel/kexec/kexec-too=
ls-klibc-2.0.2/fix-out-of-tree-build.patch
> new file mode 100644
> index 0000000..ccbb24d
> --- /dev/null
> +++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/fix-out=
-of-tree-build.patch
> @@ -0,0 +1,54 @@
> +From 37737527725e465833be649101c4a6f8352c5d5e Mon Sep 17 00:00:00 2001
> +From: Tyler Hall <tylerwhall@gmail.com>
> +Date: Tue, 7 Feb 2012 18:50:05 -0500
> +Subject: Fix out-of-tree build
> +
> +Use automatic variables for prerequisites when copying man pages and
> +include a makefile relative to $(srcdir).
> +
> +Backported to 2.0.2-klibc
> +
> +Signed-off-by: Tyler Hall <tylerwhall@gmail.com>
> +Signed-off-by: Simon Horman <horms@verge.net.au>
> +
> +diff --git a/kdump/Makefile b/kdump/Makefile
> +index 1e2b72c..5dfa928 100644
> +--- a/kdump/Makefile
> ++++ b/kdump/Makefile
> +@@ -22,7 +22,7 @@ $(KDUMP): $(KDUMP_OBJS)
> +=20
> + $(KDUMP_MANPAGE): kdump/kdump.8
> + 	$(MKDIR) -p     $(MANDIR)/man8
> +-	cp kdump/kdump.8 $(KDUMP_MANPAGE)
> ++	cp $^ $(KDUMP_MANPAGE)
> + echo::
> + 	@echo "KDUMP_SRCS $(KDUMP_SRCS)"
> + 	@echo "KDUMP_DEPS $(KDUMP_DEPS)"
> +diff --git a/kexec/Makefile b/kexec/Makefile
> +index 2137cab..8c815b5 100644
> +--- a/kexec/Makefile
> ++++ b/kexec/Makefile
> +@@ -82,7 +82,7 @@ $(KEXEC): CPPFLAGS+=3D-I$(srcdir)/kexec/arch/$(ARCH)/i=
nclude
> +=20
> + $(KEXEC_MANPAGE): kexec/kexec.8
> + 	@$(MKDIR) -p     $(MANDIR)/man8
> +-	cp kexec/kexec.8 $(KEXEC_MANPAGE)
> ++	cp $^ $(KEXEC_MANPAGE)
> + echo::
> + 	@echo "KEXEC_SRCS $(KEXEC_SRCS)"
> + 	@echo "KEXEC_DEPS $(KEXEC_DEPS)"
> +diff --git a/kexec/arch/ppc/Makefile b/kexec/arch/ppc/Makefile
> +index 3dba7cf..41242a5 100644
> +--- a/kexec/arch/ppc/Makefile
> ++++ b/kexec/arch/ppc/Makefile
> +@@ -1,7 +1,7 @@
> + #
> + # kexec ppc (linux booting linux)
> + #
> +-include kexec/arch/ppc/libfdt/Makefile.libfdt
> ++include $(srcdir)/kexec/arch/ppc/libfdt/Makefile.libfdt
> +=20
> + ppc_KEXEC_SRCS =3D  kexec/arch/ppc/kexec-ppc.c
> + ppc_KEXEC_SRCS +=3D kexec/arch/ppc/kexec-elf-ppc.c
> +
> +
> diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.=
bb b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.bb
> index b1b6ffc..3c829fa 100644
> --- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.bb
> +++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.bb
> @@ -4,6 +4,7 @@ SUMMARY =3D "Kexec tools, statically compiled against kli=
bc"
>  SRC_URI[md5sum] =3D "92eff93b097475b7767f8c98df84408a"
>  SRC_URI[sha256sum] =3D "09e180ff36dee087182cdc939ba6c6917b6adbb5fc12d589=
f31fd3659b6471f2"
> =20
> +#inherit autotools-brokensep

I've removed this comment when cherry-picking to master-next.

>  inherit klibc
> =20
>  FILESPATH =3D. "${FILE_DIRNAME}/kexec-tools-${PV}:"
> @@ -17,6 +18,7 @@ SRC_URI +=3D " \
>              file://purgatory_string.patch \
>              file://sha256.patch \
>              file://sysconf_nrprocessors.patch \
> +            file://fix-out-of-tree-build.patch \
>              "
> =20
>  SRC_URI_append_arm =3D " file://arm_crashdump.patch"
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--lMM8JwqTlfDpEaS6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlTBFMQACgkQN1Ujt2V2gBz+jQCeIb8ntEgVjraJuqm6hrzt2AeZ
g3kAn27t6mMXbXGby9RcBIUA9V0tiKqH
=x4ny
-----END PGP SIGNATURE-----

--lMM8JwqTlfDpEaS6--
