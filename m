Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f169.google.com (mail-ea0-f169.google.com
	[209.85.215.169])
	by mail.openembedded.org (Postfix) with ESMTP id 7D2586F7B2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Mar 2014 15:50:50 +0000 (UTC)
Received: by mail-ea0-f169.google.com with SMTP id h14so4459165eaj.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Mar 2014 08:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=5btT7RbFb/jfVX+MNV/2ZlaF8KbHbPgYtPc8/W0KPVo=;
	b=RF3cyVJzvKIObC66xUKC684J4sHs+p7rFeCZdqyakmDYWj5aUY/ZMoxfYGhviijgs/
	GILhuINpuMSKP1izYXcHyungWYePBiM2Ys+vvs9a+JjhU51of1+cRytNKtnA8oZleznl
	YVcMxZD3nZBovKU7Ih7nARhw98nGc6NhOWmwzyAWddd5FdnSH1k+sae8Y91BS+8871Ph
	gEhmp1EgRxKDoNQadnZcsQ+xy5Wyr4msHbQ37/kB84doa0Rq5wv83nlulEEsUCWaAV/q
	0ILVbKfpDEff5L5+m63lqLNgYkJxTSOYt9gS3CRUtcBGcsH2vUeqfz/kQW64oycQEZRA
	cQsw==
X-Received: by 10.15.81.197 with SMTP id x45mr41754028eey.28.1394553051769;
	Tue, 11 Mar 2014 08:50:51 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	m1sm58826653een.7.2014.03.11.08.50.50
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Mar 2014 08:50:50 -0700 (PDT)
Date: Tue, 11 Mar 2014 16:51:03 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140311155103.GI2137@jama>
References: <lauren.post@freescale.com>
	<1394227575-27897-1-git-send-email-lauren.post@freescale.com>
	<1394227575-27897-4-git-send-email-lauren.post@freescale.com>
MIME-Version: 1.0
In-Reply-To: <1394227575-27897-4-git-send-email-lauren.post@freescale.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [meta-oe][PATCH 4/7] glcompbench: Create 2012.08 version
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
X-List-Received-Date: Tue, 11 Mar 2014 15:50:51 -0000
X-Groupsio-MsgNum: 48600
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6b3yLyRKT1M6kiA0"
Content-Disposition: inline

--6b3yLyRKT1M6kiA0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 07, 2014 at 03:26:12PM -0600, Lauren Post wrote:
> glcompbench is a benchmark tool for GL(ES)2 based
> compositing operations
>=20
> Signed-off-by: Lauren Post <lauren.post@freescale.com>
> ---
>  .../glcompbench/glbench-compile-fix.patch          |   35 ++++++++++++++=
++++++
>  .../glcompbench/glcompbench_2012.08.bb             |   14 ++++++++
>  2 files changed, 49 insertions(+)
>  create mode 100644 meta-oe/recipes-graphics/glcompbench/glcompbench/glbe=
nch-compile-fix.patch
>  create mode 100644 meta-oe/recipes-graphics/glcompbench/glcompbench_2012=
=2E08.bb
>=20
> diff --git a/meta-oe/recipes-graphics/glcompbench/glcompbench/glbench-com=
pile-fix.patch b/meta-oe/recipes-graphics/glcompbench/glcompbench/glbench-c=
ompile-fix.patch
> new file mode 100644
> index 0000000..374a6cf
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/glcompbench/glcompbench/glbench-compile-fi=
x.patch
> @@ -0,0 +1,35 @@
> +From c4bc44c3abf69f26e4c2b7684f4da4670a51f993 Mon Sep 17 00:00:00 2001
> +From: Prabhu Sundararaj <prabhu.sundararaj@freescale.com>
> +Date: Tue, 5 Nov 2013 11:03:04 -0600
> +Subject: [PATCH] to make compilable
> +
> +Upstream Status: Inappropriate [workaround]
> +
> +Signed-off-by: Prabhu Sundararaj <prabhu.sundararaj@freescale.com>
> +---
> + src/composite-test-simple-blur.cc | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/src/composite-test-simple-blur.cc b/src/composite-test-simp=
le-blur.cc
> +index 170ad64..d7f77cf 100644
> +--- a/src/composite-test-simple-blur.cc
> ++++ b/src/composite-test-simple-blur.cc
> +@@ -347,6 +347,7 @@ CompositeTestSimpleBlur::CompositeTestSimpleBlur() :
> +=20
> + CompositeTestSimpleBlur::~CompositeTestSimpleBlur()
> + {
> ++#if 0
> +     for (BlurWindowMapType::iterator winIt =3D priv_->windowMap.begin();
> +          winIt !=3D priv_->windowMap.end();
> +          winIt++)
> +@@ -354,6 +355,7 @@ CompositeTestSimpleBlur::~CompositeTestSimpleBlur()
> +         RenderWindowBlur* ro =3D winIt->second;
> +         delete ro;
> +     }
> ++#endif
> +     delete priv_;
> + }
> +=20
> +--=20
> +1.8.1.2
> +
> diff --git a/meta-oe/recipes-graphics/glcompbench/glcompbench_2012.08.bb =
b/meta-oe/recipes-graphics/glcompbench/glcompbench_2012.08.bb
> new file mode 100644
> index 0000000..1adcc02
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/glcompbench/glcompbench_2012.08.bb
> @@ -0,0 +1,14 @@
> +SUMMARY =3D "GL Compositing Benchmark"
> +DESCRIPTION =3D "A benchmark for GL(ES)2 based compositing operations"
> +LICENSE =3D "GPLv3"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Df27defe1e96c2e1ecd4e0c9be8967=
949"
> +
> +DEPENDS +=3D "virtual/egl virtual/libgl virtual/libgal-x11 virtual/egl v=
irtual/libgles1 virtual/libgles2 "

ERROR: Nothing PROVIDES 'virtual/libgal-x11' (but /home/jenkins/oe/shr-core=
-branches/shr-core/meta-openembedded/meta-oe/recipes-graphics/glcompbench/g=
lcompbench_2012.08.bb DEPENDS on or otherwise requires it). Close matches:
  virtual/libx11
  virtual/libgl
  virtual/libgles1
ERROR: Nothing RPROVIDES 'glcompbench' (but /home/jenkins/oe/shr-core-branc=
hes/shr-core/meta-openembedded/meta-oe/recipes-graphics/glcompbench/glcompb=
ench_2012.08.bb RDEPENDS on or otherwise requires it)
ERROR: No eligible RPROVIDERs exist for 'glcompbench'
NOTE: Runtime target 'glcompbench' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['glcompbench']
ERROR: Nothing RPROVIDES 'glcompbench-dev' (but /home/jenkins/oe/shr-core-b=
ranches/shr-core/meta-openembedded/meta-oe/recipes-graphics/glcompbench/glc=
ompbench_2012.08.bb RDEPENDS on or otherwise requires it)
ERROR: No eligible RPROVIDERs exist for 'glcompbench-dev'
NOTE: Runtime target 'glcompbench-dev' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['glcompbench-dev']

> +
> +inherit pkgconfig waf
> +
> +SRC_URI =3D "https://launchpad.net/glcompbench/trunk/2012.08/+download/g=
lcompbench-2012.08.tar.gz \
> +           file://glbench-compile-fix.patch"
> +
> +SRC_URI[md5sum] =3D "c939d9156fe940960098f38707fea827"
> +SRC_URI[sha256sum] =3D "b04b738cec06c6786ceafa86e4735fd8b971c07826575485=
4ef356b0379542ee"
> --=20
> 1.7.9.5
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--6b3yLyRKT1M6kiA0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMfMOcACgkQN1Ujt2V2gBxxqgCcDDmOzZD8Is4e3hoWxmUqTm1J
HGYAoIGN+AqBXMf1zmfIFDUSOtnZbaHQ
=nA6k
-----END PGP SIGNATURE-----

--6b3yLyRKT1M6kiA0--
