Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id 0623B76248
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Jul 2015 14:59:45 +0000 (UTC)
Received: by wicmv11 with SMTP id mv11so222810831wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Jul 2015 07:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=7KaHAE9KWnKdnjXzbJvFADAOHjDHV5RIzg0JrzwKrfE=;
	b=pZxkgYFBXm70pOl9AgEsfB3HTgIw6liIuKmCAPG3XJjOFqVru2wILMX4Q17d73gejI
	XeT+3KdQ8++buOv2loaReK2qJ/46rNh8C/uEG0qexbLWI8zpBmSwPKG4uH4UJeCi7iWG
	l/pNkOhhqvXfhXrDFf37Gxu4HNb7VgKkTgLKHd1GYerFAe3VlGvcVzuldt3VfULiWkkX
	lqj7DJ7UviwPcm5UyCB2p6kRmvL2DovCrBEHNkEAj6oNsaWI5E7wQUO4C+j247uop9ih
	GG56okWF5c5vF34xso9tMqrtmaYZMVo/z4tMC1x3DkAZ42QJaR5pnDA/7VrIisn7eVsA
	QKPw==
X-Received: by 10.180.20.198 with SMTP id p6mr18640587wie.38.1438181985362;
	Wed, 29 Jul 2015 07:59:45 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	dl10sm38981146wjb.42.2015.07.29.07.59.44
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 29 Jul 2015 07:59:44 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 29 Jul 2015 16:59:54 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150729145954.GC12478@jama>
References: <1437470344-1669-1-git-send-email-lixin.fnst@cn.fujitsu.com>
	<1437470344-1669-3-git-send-email-lixin.fnst@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1437470344-1669-3-git-send-email-lixin.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-networking][PATCH] crda: upgrade 3.13 -> 3.18
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
X-List-Received-Date: Wed, 29 Jul 2015 14:59:46 -0000
X-Groupsio-MsgNum: 56429
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="dkEUBIird37B8yKS"
Content-Disposition: inline

--dkEUBIird37B8yKS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 21, 2015 at 05:19:04PM +0800, Li xin wrote:
> Dropped backported patches(commit-id):
> -crda-Add-DESTDIR-support-in-install-libreg-rules-in-.patch(2cabb258)
> -crda-Fix-the-linking-order-to-avoid-compilation-erro.patch(fefefdb2)

Fails to build on jenkins
http://errors.yoctoproject.org/Errors/Build/7660/

>=20
> Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> ---
>  ...STDIR-support-in-install-libreg-rules-in-.patch | 35 ---------------
>  ...e-linking-order-to-avoid-compilation-erro.patch | 51 ----------------=
------
>  .../do-not-run-ldconfig-if-destdir-is-set.patch    |  0
>  .../fix-linking-of-libraries-used-by-reglib.patch  |  0
>  .../crda/{crda_3.13.bb =3D> crda_3.18.bb}            |  6 +--
>  5 files changed, 2 insertions(+), 90 deletions(-)
>  delete mode 100644 meta-networking/recipes-connectivity/crda/crda-3.13/c=
rda-Add-DESTDIR-support-in-install-libreg-rules-in-.patch
>  delete mode 100644 meta-networking/recipes-connectivity/crda/crda-3.13/c=
rda-Fix-the-linking-order-to-avoid-compilation-erro.patch
>  rename meta-networking/recipes-connectivity/crda/{crda-3.13 =3D> crda}/d=
o-not-run-ldconfig-if-destdir-is-set.patch (100%)
>  rename meta-networking/recipes-connectivity/crda/{crda-3.13 =3D> crda}/f=
ix-linking-of-libraries-used-by-reglib.patch (100%)
>  rename meta-networking/recipes-connectivity/crda/{crda_3.13.bb =3D> crda=
_3.18.bb} (82%)
>=20
> diff --git a/meta-networking/recipes-connectivity/crda/crda-3.13/crda-Add=
-DESTDIR-support-in-install-libreg-rules-in-.patch b/meta-networking/recipe=
s-connectivity/crda/crda-3.13/crda-Add-DESTDIR-support-in-install-libreg-ru=
les-in-.patch
> deleted file mode 100644
> index 3646400..0000000
> --- a/meta-networking/recipes-connectivity/crda/crda-3.13/crda-Add-DESTDI=
R-support-in-install-libreg-rules-in-.patch
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -From: "John W. Linville" <linville@tuxdriver.com>
> -Date: Fri, 14 Feb 2014 13:58:44 -0500
> -Subject: [PATCH] crda: Add DESTDIR support in install-libreg* rules in M=
akefile
> -Origin: https://git.kernel.org/?p=3Dlinux/kernel/git/mcgrof/crda.git/com=
mit?id=3D2cabb2588da56735369131b709f191453c080be0
> -
> -Upstream-Status: Backport
> -
> -Signed-off-by: John W. Linville <linville@tuxdriver.com>
> -Signed-off-by: Luis R. Rodriguez <mcgrof@do-not-panic.com>
> ----
> - Makefile | 8 ++++----
> - 1 file changed, 4 insertions(+), 4 deletions(-)
> -
> -diff --git a/Makefile b/Makefile
> -index 0b2f0d7..1f25509 100644
> ---- a/Makefile
> -+++ b/Makefile
> -@@ -120,13 +120,13 @@ $(LIBREG): regdb.h reglib.h reglib.c
> -=20
> - install-libreg-headers:
> - 	$(NQ) '  INSTALL  libreg-headers'
> --	$(Q)mkdir -p $(INCLUDE_DIR)
> --	$(Q)cp *.h $(INCLUDE_DIR)/
> -+	$(Q)mkdir -p $(DESTDIR)/$(INCLUDE_DIR)
> -+	$(Q)cp *.h $(DESTDIR)/$(INCLUDE_DIR)/
> -=20
> - install-libreg:
> - 	$(NQ) '  INSTALL  libreg'
> --	$(Q)mkdir -p $(LIBDIR)
> --	$(Q)cp $(LIBREG) $(LIBDIR)/
> -+	$(Q)mkdir -p $(DESTDIR)/$(LIBDIR)
> -+	$(Q)cp $(LIBREG) $(DESTDIR)/$(LIBDIR)/
> - 	$(Q)ldconfig
> -=20
> - %.o: %.c regdb.h $(LIBREG)
> diff --git a/meta-networking/recipes-connectivity/crda/crda-3.13/crda-Fix=
-the-linking-order-to-avoid-compilation-erro.patch b/meta-networking/recipe=
s-connectivity/crda/crda-3.13/crda-Fix-the-linking-order-to-avoid-compilati=
on-erro.patch
> deleted file mode 100644
> index 68b4b13..0000000
> --- a/meta-networking/recipes-connectivity/crda/crda-3.13/crda-Fix-the-li=
nking-order-to-avoid-compilation-erro.patch
> +++ /dev/null
> @@ -1,51 +0,0 @@
> -From: Krishna Chaitanya <chaitanya.mgit@gmail.com>
> -Date: Mon, 16 Dec 2013 21:57:39 +0530
> -Subject: [PATCH] crda: Fix the linking order to avoid compilation error
> -Origin: https://git.kernel.org/?p=3Dlinux/kernel/git/mcgrof/crda.git/com=
mit?id=3Dfefefdb2c52c8fbedbb339b4badb8226cad7e7e0
> -
> -While linking the crda.o and libreg.so, first put crda.o
> -and then -lreg. This fixed the below error:
> -
> -  GEN  keys-gcrypt.c
> -  Trusted pubkeys: pubkeys/linville.key.pub.pem
> -  CC   libreg.so
> -  CC   crda.o
> -  LD   crda
> -crda.o: In function `main':
> -crda/crda.c:196: undefined reference to `reglib_get_rd_alpha2'
> -collect2: ld returned 1 exit status
> -make: *** [crda] Error 1
> -
> -Note: This still doesn't fix the below error (will send another mail)
> -
> -  CHK  /usr/lib/crda/regulatory.bin
> -Database signature verification failed.
> -Invalid or empty regulatory file, note: a binary regulatory file should =
be used.
> -make: *** [verify] Error 234
> -
> -Upstream-Status: Backport
> -
> -Signed-off-by: Luis R. Rodriguez <mcgrof@do-not-panic.com>
> -Signed-off-by: Chaitanya T K <chaitanya.mgit@gmail.com>
> ----
> - Makefile | 5 +++--
> - 1 file changed, 3 insertions(+), 2 deletions(-)
> -
> -diff --git a/Makefile b/Makefile
> -index 4a351c6..0b2f0d7 100644
> ---- a/Makefile
> -+++ b/Makefile
> -@@ -28,10 +28,11 @@ RUNTIME_PUBKEY_DIR?=3D/etc/wireless-regdb/pubkeys
> - CFLAGS +=3D -O2 -fpic
> - CFLAGS +=3D -std=3Dgnu99 -Wall -Werror -pedantic
> - CFLAGS +=3D -Wall -g
> --LDLIBS +=3D -lm
> - LDLIBREG +=3D -lreg
> -+LDLIBS +=3D $(LDLIBREG)
> -+LDLIBS +=3D -lm
> - LIBREG +=3D libreg.so
> --LDFLAGS +=3D -L ./ $(LDLIBREG)
> -+LDFLAGS +=3D -L ./
> -=20
> - all: all_noverify verify
> -=20
> diff --git a/meta-networking/recipes-connectivity/crda/crda-3.13/do-not-r=
un-ldconfig-if-destdir-is-set.patch b/meta-networking/recipes-connectivity/=
crda/crda/do-not-run-ldconfig-if-destdir-is-set.patch
> similarity index 100%
> rename from meta-networking/recipes-connectivity/crda/crda-3.13/do-not-ru=
n-ldconfig-if-destdir-is-set.patch
> rename to meta-networking/recipes-connectivity/crda/crda/do-not-run-ldcon=
fig-if-destdir-is-set.patch
> diff --git a/meta-networking/recipes-connectivity/crda/crda-3.13/fix-link=
ing-of-libraries-used-by-reglib.patch b/meta-networking/recipes-connectivit=
y/crda/crda/fix-linking-of-libraries-used-by-reglib.patch
> similarity index 100%
> rename from meta-networking/recipes-connectivity/crda/crda-3.13/fix-linki=
ng-of-libraries-used-by-reglib.patch
> rename to meta-networking/recipes-connectivity/crda/crda/fix-linking-of-l=
ibraries-used-by-reglib.patch
> diff --git a/meta-networking/recipes-connectivity/crda/crda_3.13.bb b/met=
a-networking/recipes-connectivity/crda/crda_3.18.bb
> similarity index 82%
> rename from meta-networking/recipes-connectivity/crda/crda_3.13.bb
> rename to meta-networking/recipes-connectivity/crda/crda_3.18.bb
> index 12eefe0..931a053 100644
> --- a/meta-networking/recipes-connectivity/crda/crda_3.13.bb
> +++ b/meta-networking/recipes-connectivity/crda/crda_3.18.bb
> @@ -9,13 +9,11 @@ DEPENDS =3D "python-m2crypto-native python-native libgc=
rypt libnl"
> =20
>  SRC_URI =3D "https://www.kernel.org/pub/software/network/crda/${BP}.tar.=
xz;name=3Dcrda \
>             https://www.kernel.org/pub/software/network/wireless-regdb/wi=
reless-regdb-2014.11.18.tar.xz;name=3Dbin \
> -           file://crda-Fix-the-linking-order-to-avoid-compilation-erro.p=
atch \
> -           file://crda-Add-DESTDIR-support-in-install-libreg-rules-in-.p=
atch \
>             file://do-not-run-ldconfig-if-destdir-is-set.patch \
>             file://fix-linking-of-libraries-used-by-reglib.patch \
>  "
> -SRC_URI[crda.md5sum] =3D "66b1b0417c1ad19f0009a5c0c0c1aebc"
> -SRC_URI[crda.sha256sum] =3D "2f85da7ab0170b140d6ed62596c8f268d4a7dedecf8=
4cac7182ada979742ff59"
> +SRC_URI[crda.md5sum] =3D "0431fef3067bf503dfb464069f06163a"
> +SRC_URI[crda.sha256sum] =3D "43fcb9679f8b75ed87ad10944a506292def13e4afb1=
94afa7aa921b01e8ecdbf"
> =20
>  SRC_URI[bin.md5sum] =3D "d750c402c5510add7380edcb1d9b75b2"
>  SRC_URI[bin.sha256sum] =3D "eab6b50f30748a8b0065ba38cf3df05aac161a5861ae=
0a6c3cfd01d38a71c9dd"
> --=20
> 1.8.4.2
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--dkEUBIird37B8yKS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlW46mkACgkQN1Ujt2V2gBzk/wCfXZnC86BrEYOpsUZplZsigXL/
iNIAoI/PFCfbR0V+/c34MdIitMrpxKN0
=iOLJ
-----END PGP SIGNATURE-----

--dkEUBIird37B8yKS--
