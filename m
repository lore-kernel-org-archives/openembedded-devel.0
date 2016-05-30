Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3DF3A771EA
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 May 2016 10:30:22 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id e3so21184514wme.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 May 2016 03:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=+q5Y26A7INSfUdmBTAr0CkUWMkZe9o6XqV6EVVe0LZo=;
	b=By1KgBQRbe1JAWUjbuJNIqlPalOKZ/hwlmEy1hFoNM/Wcg3ipiK/zfsn7ciPreWDJW
	gPQYUzLQQkgsC/yqFtVJRMktUeyiSkhGQcup0SRCyf4oOweGM+6xshZ+TyKt9DY8bb+i
	TPw/nBSiQjZpCUyuk1PyfKGP24fD6+oNFGgomN7qfyt9qlG2CD3rfJqYuxgVakPPF2Ni
	WDeHeAy2QGtSWNfZePnOSSoN3Y5kAtPI5sZnHkMPAcXJCOZe3po+u55YWfmaLRUQV2aR
	c1xJ4z4n4zSq0mUxD80ib8XEJtJfu97NCj5P2e/B/63Hi77OP1pvEAe3EzJ8rn7ZwIO1
	0lDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=+q5Y26A7INSfUdmBTAr0CkUWMkZe9o6XqV6EVVe0LZo=;
	b=SuZcRAWwfw2JpZjh7VKuh3eagdus0pkxC2y5pbtcJfvmW8YbMuCL06UJ2xzYT5kAFB
	arL1HSN1lC/xJ8UKMqIb4AgO9w0pEh72jAuFfLSNjLvC9xJtxN+VIR3NzBrPN3CXGWKI
	V/y8xWwuSRXxuESiZBlRzcLGrOBCy210kRk4E6KV2Ll4qliffzvx5vwQ3Ab9DN4txE1u
	pjQkhfI93cxJLvaFauqlHXmZz4B5f/yAoNwF8+Vareh8HlHpc7LrkGYeOillzZdeQBX1
	ElM3cWF6ih2QguLcwxVEmjPWq3kor5H4/cLjH0y0eCTvbxde9gFRSbncSK6vFHLBtNgu
	WdPg==
X-Gm-Message-State: ALyK8tL6liLMTpv2B2/PJztQNmOP9/n7RrwlvLDGjRvbGThQYdAXj4CNeVI3sMsJFwq2pA==
X-Received: by 10.194.19.199 with SMTP id h7mr24959653wje.91.1464604222568;
	Mon, 30 May 2016 03:30:22 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	m8sm28309642wjd.34.2016.05.30.03.30.21
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 30 May 2016 03:30:21 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 30 May 2016 12:30:27 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160530103027.GD2588@jama>
References: <1463509939-25222-1-git-send-email-leimaohui@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1463509939-25222-1-git-send-email-leimaohui@cn.fujitsu.com>
User-Agent: Mutt/1.6.1 (2016-04-27)
Subject: Re: [meta-oe][PATCH] daemontools: Fix a warning
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
X-List-Received-Date: Mon, 30 May 2016 10:30:22 -0000
X-Groupsio-MsgNum: 61658
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4zI0WCX1RcnW9Hbu"
Content-Disposition: inline

--4zI0WCX1RcnW9Hbu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 17, 2016 at 11:32:19AM -0700, Lei Maohui wrote:
> To fix the warning as following:
>=20
> WARNING: daemontools-native-0.76-r0 do_populate_sysroot: File 'usr/bin/ch=
kshsgr' from daemontools-native was already stripped, this will prevent fut=
ure debugging!
>=20

ERROR: daemontools-0.76-r0 do_patch: Command Error: 'quilt --quiltrc sysroo=
ts/x86_64-linux/etc/quiltrc push' exited with 1  Output:
Applying patch cross-compile.patch
patching file src/conf-cc
patching file src/conf-ld
Hunk #1 FAILED at 1.
1 out of 1 hunk FAILED -- rejects in file src/conf-ld
patching file src/Makefile
Patch cross-compile.patch does not apply (enforce with -f)
ERROR: daemontools-0.76-r0 do_patch: Function failed: patch_do_patch

> Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
> ---
>  .../daemontools/0001-conf-ld-warning-fix.patch     | 26 ++++++++++++++++=
++++++
>  .../daemontools/daemontools_0.76.bb                |  3 ++-
>  2 files changed, 28 insertions(+), 1 deletion(-)
>  create mode 100644 meta-oe/recipes-support/daemontools/daemontools/0001-=
conf-ld-warning-fix.patch
>=20
> diff --git a/meta-oe/recipes-support/daemontools/daemontools/0001-conf-ld=
-warning-fix.patch b/meta-oe/recipes-support/daemontools/daemontools/0001-c=
onf-ld-warning-fix.patch
> new file mode 100644
> index 0000000..f7bce25
> --- /dev/null
> +++ b/meta-oe/recipes-support/daemontools/daemontools/0001-conf-ld-warnin=
g-fix.patch
> @@ -0,0 +1,26 @@
> +From aa246fb9055bdcb293e9daca571066b72adc1cb2 Mon Sep 17 00:00:00 2001
> +From: Li Xin <lixin.fnst@cn.fujitsu.com>
> +Date: Thu, 14 Jan 2016 17:54:27 +0900
> +Subject: [PATCH] conf-ld: warning fix
> +
> +WARNING: File 'usr/bin/chkshsgr' from daemontools-native was already str=
ipped, this will prevent future debugging!
> +
> +Upstream-Status: pending
> +
> +Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> +---
> + src/conf-ld | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/conf-ld b/src/conf-ld
> +index 59a0de7..1d0518a 100644
> +--- a/src/conf-ld
> ++++ b/src/conf-ld
> +@@ -1,3 +1,3 @@
> +-gcc -s
> ++gcc
> +=20
> + This will be used to link .o files into an executable.
> +--=20
> +1.8.4.2
> +
> diff --git a/meta-oe/recipes-support/daemontools/daemontools_0.76.bb b/me=
ta-oe/recipes-support/daemontools/daemontools_0.76.bb
> index 161f92f..c3ce5d3 100644
> --- a/meta-oe/recipes-support/daemontools/daemontools_0.76.bb
> +++ b/meta-oe/recipes-support/daemontools/daemontools_0.76.bb
> @@ -16,7 +16,8 @@ LICENSE =3D "PD"
> =20
>  SRC_URI =3D "http://cr.yp.to/daemontools/${BPN}-${PV}.tar.gz \
>             file://0001-error.h-include-errno.h-instead-of-extern-int.dif=
f \
> -           file://0002-supervise.c-.-supervise-may-be-a-symlink-if-it-s-=
da.diff "
> +           file://0002-supervise.c-.-supervise-may-be-a-symlink-if-it-s-=
da.diff \
> +           file://0001-conf-ld-warning-fix.patch "
> =20
>  SRC_URI_append_class-target =3D "file://cross-compile.patch"
> =20
> --=20
> 1.8.4.2
>=20
>=20
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--4zI0WCX1RcnW9Hbu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAldMFkIACgkQN1Ujt2V2gBwz7ACeIlYdlXFTFxhnQdMZSf/IQjFP
MVEAoIdwLuKWpV2VX3IxuiTLCpu4VrEA
=3mft
-----END PGP SIGNATURE-----

--4zI0WCX1RcnW9Hbu--
