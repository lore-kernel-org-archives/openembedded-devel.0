Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f45.google.com (mail-wg0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 760DF71E72
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Oct 2014 08:11:19 +0000 (UTC)
Received: by mail-wg0-f45.google.com with SMTP id x12so5048269wgg.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Oct 2014 01:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=1pgkLsBS/CTpjlnBA/A4wdm9JYorCQyBrFeXGL9Oq3M=;
	b=mWM/+cO1M4C5jNQ8lKvMv1efx/T3ATGmjv5cQsueDlvQVqYiALzhQDcsYA1QeR1Opl
	t8+nwdlaYOSt+00ix/D6DmQWH5oxADtCWZxHHKusxSEwTraXWx1GGmLyK+aSQuGPF+BJ
	gGLQSrc7O/23tdn5yGSnA0pTW1RMcT4NfyH/Hy2BMTYX0CKLa2Hy6m/CfSEAcfsljnLe
	/eWILU/gPxWmB2pxtYGB4cYKfRZY+D8oRdRE1+P4Tx2n6cjJ43wzjMuvCx/q6ScTjgNL
	LfYleawcBKdU7SkNM/qlrp9n+R59NOgli7bNcoJYA0TpnXghMAwK1hNHVCDHpclK3jO6
	xE+w==
X-Received: by 10.181.13.208 with SMTP id fa16mr41254723wid.61.1414656679061; 
	Thu, 30 Oct 2014 01:11:19 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	wl1sm7816919wjb.4.2014.10.30.01.11.18
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 30 Oct 2014 01:11:18 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 30 Oct 2014 09:11:23 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20141030081123.GD15148@jama>
References: <1413971847-8154-1-git-send-email-Hongjun.Yang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1413971847-8154-1-git-send-email-Hongjun.Yang@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH] tree: Add a new package
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
X-List-Received-Date: Thu, 30 Oct 2014 08:11:27 -0000
X-Groupsio-MsgNum: 52686
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3Pql8miugIZX0722"
Content-Disposition: inline

--3Pql8miugIZX0722
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 22, 2014 at 05:57:27PM +0800, Hongjun Yang wrote:
> From: "Hongjun.Yang" <hongjun.yang@windriver.com>
>=20
> Add tree command, some test scripts need it.

Fails

qemuarm:
ERROR: objcopy failed with exit code 256 (cmd was 'arm-oe-linux-gnueabi-obj=
copy' --only-keep-debug '/home/jenkins/oe/world/shr-core/tmp-glibc/work/arm=
v5te-oe-linux-gnueabi/tree/1.7.0-r0/package/usr/bin/tree' '/home/jenkins/oe=
/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/tree/1.7.0-r0/packa=
ge/usr/bin/.debug/tree'):
arm-oe-linux-gnueabi-objcopy:/home/jenkins/oe/world/shr-core/tmp-glibc/work=
/armv5te-oe-linux-gnueabi/tree/1.7.0-r0/package/usr/bin/tree: File format n=
ot recognized
ERROR: Function failed: split_and_strip_files
ERROR: Logfile of failure stored in: /home/jenkins/oe/world/shr-core/tmp-gl=
ibc/work/armv5te-oe-linux-gnueabi/tree/1.7.0-r0/temp/log.do_package.4732
NOTE: recipe tree-1.7.0-r0: task do_package: Failed
ERROR: Task 2994 (/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe=
/recipes-support/tree/tree_1.7.0.bb, do_package) failed with exit code '1'

qemux86:
NOTE: recipe tree-1.7.0-r0: task do_package_qa: Started
NOTE: recipe gnome-system-monitor-2.28.2-r2: task do_rm_work_all: Started
ERROR: QA Issue: Architecture did not match (3 to 62) on /work/i586-oe-linu=
x/tree/1.7.0-r0/packages-split/tree-dbg/usr/bin/.debug/tree [arch]
NOTE: recipe gnome-system-monitor-2.28.2-r2: task do_rm_work_all: Succeeded
NOTE: Running task 28653 of 30030 (ID: 2991, /home/jenkins/oe/world/shr-cor=
e/openembedded-core/meta/recipes-devtools/guile/guile_2.0.11.bb, do_populat=
e_lic)
ERROR: QA Issue: Architecture did not match (3 to 62) on /work/i586-oe-linu=
x/tree/1.7.0-r0/packages-split/tree/usr/bin/tree [arch]
WARNING: QA Issue: tree requires libc.so.6()(64bit), libc.so.6(GLIBC_2.2.5)=
(64bit), libc.so.6(GLIBC_2.4)(64bit), libc.so.6(GLIBC_2.3)(64bit), but no p=
roviders in its RDEPENDS [file-rdeps]
ERROR: QA run found fatal errors. Please consider fixing them.
ERROR: Function failed: do_package_qa
ERROR: Logfile of failure stored in: /home/jenkins/oe/world/shr-core/tmp-gl=
ibc/work/i586-oe-linux/tree/1.7.0-r0/temp/log.do_package_qa.2106
NOTE: recipe tree-1.7.0-r0: task do_package_qa: Failed
ERROR: Task 3008 (/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe=
/recipes-support/tree/tree_1.7.0.bb, do_package_qa) failed with exit code '=
1'

> Signed-off-by: Hongjun.Yang <hongjun.yang@windriver.com>
>=20
> ---
>  .../tree/tree-1.7.0/fix-cross-env.patch            | 32 ++++++++++++++++=
++++++
>  meta-oe/recipes-support/tree/tree_1.7.0.bb         | 16 +++++++++++
>  2 files changed, 48 insertions(+)
>  create mode 100644 meta-oe/recipes-support/tree/tree-1.7.0/fix-cross-env=
=2Epatch
>  create mode 100644 meta-oe/recipes-support/tree/tree_1.7.0.bb
>=20
> diff --git a/meta-oe/recipes-support/tree/tree-1.7.0/fix-cross-env.patch =
b/meta-oe/recipes-support/tree/tree-1.7.0/fix-cross-env.patch
> new file mode 100644
> index 0000000..ccdf635
> --- /dev/null
> +++ b/meta-oe/recipes-support/tree/tree-1.7.0/fix-cross-env.patch
> @@ -0,0 +1,32 @@
> +From 7ad835ae0c2b2b311002fda0be2dbf8f17c5a3d5 Mon Sep 17 00:00:00 2001
> +From: "Hongjun.Yang" <hongjun.yang@windriver.com>
> +Date: Wed, 22 Oct 2014 11:05:35 +0800
> +Subject: [PATCH] fix the install path change the install path for cross
> + compile environment.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Hongjun.Yang <hongjun.yang@windriver.com>
> +---
> + Makefile | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/Makefile b/Makefile
> +index e91f1f6..776f1f3 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -22,9 +22,9 @@ CC=3Dgcc
> +=20
> + VERSION=3D1.7.0
> + TREE_DEST=3Dtree
> +-BINDIR=3D${prefix}/bin
> ++BINDIR=3D${DESTDIR}/${prefix}/bin
> + MAN=3Dtree.1
> +-MANDIR=3D${prefix}/man/man1
> ++MANDIR=3D${DESTDIR}/${prefix}/man/man1
> + OBJS=3Dtree.o unix.o html.o xml.o json.o hash.o color.o
> +=20
> + # Uncomment options below for your particular OS:
> +--=20
> +1.9.1
> +
> diff --git a/meta-oe/recipes-support/tree/tree_1.7.0.bb b/meta-oe/recipes=
-support/tree/tree_1.7.0.bb
> new file mode 100644
> index 0000000..b7fc43b
> --- /dev/null
> +++ b/meta-oe/recipes-support/tree/tree_1.7.0.bb
> @@ -0,0 +1,16 @@
> +DESCRIPTION =3D "This is a handy little utility to display a tree view o=
f directories."
> +HOMEPAGE =3D "http://mama.indstate.edu/users/ice/tree/"
> +LICENSE=3D"GPLv2"
> +SECTION =3D "console/utils"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D393a5ca445f6965873eca0259a17f=
833"
> +
> +inherit autotools-brokensep
> +
> +FILES_${PN}-doc +=3D "${prefix}/man"
> +
> +SRC_URI =3D "http://mama.indstate.edu/users/ice/tree/src/tree-1.7.0.tgz \
> +	   file://fix-cross-env.patch \
> +	  "
> +
> +SRC_URI[md5sum] =3D "abe3e03e469c542d8e157cdd93f4d8a6"
> +SRC_URI[sha256sum] =3D "6957c20e82561ac4231638996e74f4cfa4e6faabc5a2f511=
f0b4e3940e8f7b12"
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

--3Pql8miugIZX0722
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlRR8qsACgkQN1Ujt2V2gBweUgCfTbA1LsPwZ/1ziez0vBjDKtJ9
gMcAnRiYAthKIF3taFSZLPckOrSxXs9V
=VWDU
-----END PGP SIGNATURE-----

--3Pql8miugIZX0722--
