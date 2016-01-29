Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id CC71971957
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jan 2016 17:59:32 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id l66so65038734wml.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jan 2016 09:59:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=wTusNMrshf/LQJ4IvOOw+K0H+6AWd8UbvMZjz3cFxlc=;
	b=N+OplrGXxqKwjyWjRHTlFT+g3n5xhjqOQFjNwR8M9ooKZ6QS73I6R92Zn11F9BgK7U
	hjXSoOz67PDbiGAoqx0kJmbXGcAbrm908bIfQ4/tZXf1UVAkhJTv3fG3BJZJamJIU2Yq
	ZovSJm3yO6RhvF7sPqHy8jDilq3/e8VNds0Gobp2kBg1p3veLQUCY+79/IYzWakJwsB9
	qoYIAapeJg+QRRoozCZP5pqpOSJnNxZUYP1Fn74jdwf7F/j7jeq2uNDa11LMOYUcBDSi
	8vHWZN4c8IPEH5kA6CWxSssVywLZLf+btq3dagGfG4gEesbWZjU5OypOaWNPqw3BhwVl
	M/bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=wTusNMrshf/LQJ4IvOOw+K0H+6AWd8UbvMZjz3cFxlc=;
	b=Sp+bB3KI6nObyvOsmIE7tDFofnYhT7w1nQQK8ny2fVqs/DQ5mxQa8w1Ip4fnIYt6Ke
	B0NR0K0mgl5Rfpu7k2Jrb1fE4Nz+69OZA9FWn3HXHhsMmV3cqRY/a1QA2bdAr4u2sScu
	z+Qjp19FZmbQ0QTJLYUmCYnU4GBM6kNKtRCqK9Gb0yMnvf9aDf/1PFtkRp8kxMPg832N
	IcIjHx3Q2xm8MRGpkJV8FICLoqQL04yJA6mkaINS01uNqZMrUeT8e6ZSXou1adhTqrM4
	s5U1Qgee4LsxmGNiuGZdaib7LvUi3lXFcswY2EElTGDGOCJ7b/vljoOWypJ+hVrrn/Z3
	QGVg==
X-Gm-Message-State: AG10YOTaYOUqD/o4DkafY8ZcnlbUZXNzGQJnIMfV2vSsMHuAy1AktodiBC/krUtmkiOQWw==
X-Received: by 10.194.157.3 with SMTP id wi3mr10062926wjb.30.1454090372927;
	Fri, 29 Jan 2016 09:59:32 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	c185sm8538765wma.5.2016.01.29.09.59.31
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 29 Jan 2016 09:59:31 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 29 Jan 2016 19:01:57 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160129180157.GA15053@jama>
References: <1453200318-25633-1-git-send-email-alexandru.but@ni.com>
MIME-Version: 1.0
In-Reply-To: <1453200318-25633-1-git-send-email-alexandru.but@ni.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-oe][PATCH] efivar: fix zero initializer compiler error
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
X-List-Received-Date: Fri, 29 Jan 2016 17:59:33 -0000
X-Groupsio-MsgNum: 59759
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wac7ysb48OaltWcw"
Content-Disposition: inline

--wac7ysb48OaltWcw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 19, 2016 at 12:45:18PM +0200, Alexandru But wrote:
> Patch based on commit a3606c0:
> Sometimes the compiler doesn't like { 0,} as an initializer

Probably not caused by this change, but efivar now fails to build in
world build for qemuarm:

| linux.c: In function 'eb_nvme_ns_id':
| linux.c:48:27: error: 'NVME_IOCTL_ID' undeclared (first use in this funct=
ion)
|   uint64_t ret =3D ioctl(fd, NVME_IOCTL_ID, NULL);
|                            ^
| linux.c:48:27: note: each undeclared identifier is reported only once for=
 each function it appears in
| make[1]: *** [linux.o] Error 1
| make[1]: Leaving directory `/home/jenkins/oe/world/shr-core/tmp-glibc/wor=
k/armv5te-oe-linux-gnueabi/efivar/0.21-r0/git/src'
| make: *** [src] Error 2
| ERROR: oe_runmake failed
| ERROR: Function failed: do_compile (log file is located at /home/jenkins/=
oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/efivar/0.21-r0/te=
mp/log.do_compile.8376)
NOTE: recipe efivar-0.21-r0: task do_compile: Failed
ERROR: Task 5672 (/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe=
/recipes-extended/efivar/efivar_0.21.bb, do_compile) failed with exit code =
'1'

>=20
> Signed-off-by: Alexandru But <alexandru.but@ni.com>
> ---
>  ...he-compiler-doesn-t-like-0-as-an-initiali.patch | 42 ++++++++++++++++=
++++++
>  meta-oe/recipes-extended/efivar/efivar_0.21.bb     |  3 +-
>  2 files changed, 44 insertions(+), 1 deletion(-)
>  create mode 100644 meta-oe/recipes-extended/efivar/efivar/0001-Sometimes=
-the-compiler-doesn-t-like-0-as-an-initiali.patch
>=20
> diff --git a/meta-oe/recipes-extended/efivar/efivar/0001-Sometimes-the-co=
mpiler-doesn-t-like-0-as-an-initiali.patch b/meta-oe/recipes-extended/efiva=
r/efivar/0001-Sometimes-the-compiler-doesn-t-like-0-as-an-initiali.patch
> new file mode 100644
> index 0000000..68cabd6
> --- /dev/null
> +++ b/meta-oe/recipes-extended/efivar/efivar/0001-Sometimes-the-compiler-=
doesn-t-like-0-as-an-initiali.patch
> @@ -0,0 +1,42 @@
> +From a3606c02fd271d32e364fcc540e34ba1899309f6 Mon Sep 17 00:00:00 2001
> +From: Peter Jones <pjones@redhat.com>
> +Date: Tue, 14 Jul 2015 09:33:54 -0400
> +Subject: [PATCH] Sometimes the compiler doesn't like { 0, } as an
> + initializer...
> +
> +Because it really wants to be { {0, },} or something, and sometimes the
> +compiler, knowing full well what we're trying to do, likes to complain
> +about the rigor applied to our technique in doing it.
> +
> +memset() the struct ifreq to 0 instead so I don't need to figure out its
> +internal structure just to zero it out.
> +
> +Resolves #28
> +
> +Signed-off-by: Peter Jones <pjones@redhat.com>
> +---
> + src/linux.c | 3 ++-
> + 1 file changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/src/linux.c b/src/linux.c
> +index 57f71f3..817b8e6 100644
> +--- a/src/linux.c
> ++++ b/src/linux.c
> +@@ -847,12 +847,13 @@ ssize_t
> + __attribute__((__visibility__ ("hidden")))
> + make_mac_path(uint8_t *buf, ssize_t size, const char * const ifname)
> + {
> +-	struct ifreq ifr =3D { 0, };
> ++	struct ifreq ifr;
> + 	struct ethtool_drvinfo drvinfo =3D { 0, };
> + 	int fd, rc;
> + 	ssize_t ret =3D -1, sz, off=3D0;
> + 	char busname[PATH_MAX+1] =3D "";
> +=20
> ++	memset(&ifr, 0, sizeof (ifr));
> + 	strncpy(ifr.ifr_name, ifname, IF_NAMESIZE);
> + 	drvinfo.cmd =3D ETHTOOL_GDRVINFO;
> + 	ifr.ifr_data =3D (caddr_t)&drvinfo;
> +--=20
> +2.6.1
> +
> diff --git a/meta-oe/recipes-extended/efivar/efivar_0.21.bb b/meta-oe/rec=
ipes-extended/efivar/efivar_0.21.bb
> index b5ef90a..1684a10 100644
> --- a/meta-oe/recipes-extended/efivar/efivar_0.21.bb
> +++ b/meta-oe/recipes-extended/efivar/efivar_0.21.bb
> @@ -8,7 +8,8 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6626bb1e20189c=
fa95f2c508ba286393"
>  DEPENDS_class-target =3D "popt efivar-native"
> =20
>  SRCREV =3D "aab6c2a64d90b6e5a63661fb5bd6be8d878b0784"
> -SRC_URI =3D "git://github.com/rhinstaller/efivar.git"
> +SRC_URI =3D "git://github.com/rhinstaller/efivar.git \
> +           file://0001-Sometimes-the-compiler-doesn-t-like-0-as-an-initi=
ali.patch"
>  SRC_URI_append_class-target =3D " file://0001-efivar-fix-for-cross-compi=
le.patch"
>  SRC_URI_append_class-native =3D " file://efivar-drop-options-not-support=
ed-by-lower-version-gcc.patch"
> =20
> --=20
> 2.6.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--wac7ysb48OaltWcw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlarqRQACgkQN1Ujt2V2gByZ5wCgmK/2v4ZfUkuTWc6YWz2kGdH/
CuYAnjANvGoLiC+uG3KPSUJ0prr3JfCI
=wSHT
-----END PGP SIGNATURE-----

--wac7ysb48OaltWcw--
