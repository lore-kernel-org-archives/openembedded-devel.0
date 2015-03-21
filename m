Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f41.google.com (mail-wg0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 599A260034;
	Sat, 21 Mar 2015 15:31:31 +0000 (UTC)
Received: by wgbcc7 with SMTP id cc7so112152464wgb.0;
	Sat, 21 Mar 2015 08:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=HGsdjzzviQEaFgrECwr67tyFDB2TeIzIDGyeCFtW+TA=;
	b=LmAckinUpR+ekkkvJW5yGBPaew9pQ7H6ZRYke2j8D+3ptCg9pL4hMgE4HQr+pG7f81
	YRtkNmdxPcEe7dHm8uY6dXmaOSM2YIhfvnkxc2A0zVl6FaN/dkO50rLogpx1vmN5tiTz
	U6yXlupT0HSVl347LABGuH09gawbHNf6Y4BlpWX6XPdtxfyI7e32+ZlGuJwxESpsZDLO
	gSQp/7c69AyuTQqV7w+WsweOroMVROzfEEs4PMcs1YrzVdVbno5bkMJy6jU0BdLN04m4
	uSEKVq++wVbH2rvIT1nnagA+WJBEAfyw2CHByBSPDV7zt9rXnB1o9uSpBlZzGHSd2VYy
	sHRA==
X-Received: by 10.194.175.202 with SMTP id cc10mr170428540wjc.27.1426951892509;
	Sat, 21 Mar 2015 08:31:32 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	dq8sm2776137wib.9.2015.03.21.08.31.31
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 21 Mar 2015 08:31:31 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sat, 21 Mar 2015 16:31:42 +0100
To: openembedded-devel@lists.openembedded.org,
	Raphael Silva <raphael.philipe@ossystems.com.br>
Message-ID: <20150321153142.GJ4738@jama>
References: <20150303074258.E353A50433@opal.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <20150303074258.E353A50433@opal.openembedded.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Raphael Silva : fio: fix do_compile error
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
X-List-Received-Date: Sat, 21 Mar 2015 15:31:34 -0000
X-Groupsio-MsgNum: 54837
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="W/D3X8sky0X3AmG5"
Content-Disposition: inline

--W/D3X8sky0X3AmG5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 03, 2015 at 07:42:58AM +0000, git@git.openembedded.org wrote:
> Module: meta-openembedded.git
> Branch: master
> Commit: 9b35e07cabaf3ed9bd681423a758b9c0dc3945af
> URL:    http://git.openembedded.org/?p=3Dmeta-openembedded.git&a=3Dcommit=
;h=3D9b35e07cabaf3ed9bd681423a758b9c0dc3945af
>=20
> Author: Raphael Silva <rapphil@gmail.com>
> Date:   Sat Feb 28 20:15:16 2015 -0300
>=20
> fio: fix do_compile error
>=20
> * Update to v2.2.6

Please fix these issues:
fio-2.2.6: fio rdepends on numactl, but it isn't a build dependency? [build=
-deps]
fio-2.2.6: fio rdepends on zlib, but it isn't a build dependency? [build-de=
ps]
>=20
> Signed-off-by: Raphael Silva <raphael.philipe@ossystems.com.br>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>=20
> ---
>=20
>  ...eric-assembly-nop-and-barrier-code-for-ar.patch | 30 ----------------=
------
>  .../fio/{fio_2.0.5.bb =3D> fio_2.2.6.bb}             | 11 ++++----
>  2 files changed, 5 insertions(+), 36 deletions(-)
>=20
> diff --git a/meta-oe/recipes-benchmark/fio/fio/0001-ARM-Use-generic-assem=
bly-nop-and-barrier-code-for-ar.patch b/meta-oe/recipes-benchmark/fio/fio/0=
001-ARM-Use-generic-assembly-nop-and-barrier-code-for-ar.patch
> deleted file mode 100644
> index db97244..0000000
> --- a/meta-oe/recipes-benchmark/fio/fio/0001-ARM-Use-generic-assembly-nop=
-and-barrier-code-for-ar.patch
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -From 152b969cd4ff5b4b7e1c65eca1f9ab243b8a30c8 Mon Sep 17 00:00:00 2001
> -From: Otavio Salvador <otavio@ossystems.com.br>
> -Date: Sun, 14 Apr 2013 13:53:35 -0300
> -Subject: [PATCH] ARM: Use generic assembly nop and barrier code for armv6
> -
> -Upstream-Status: Submitted
> -
> -Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ----
> - arch/arch-arm.h |    4 +++-
> - 1 files changed, 3 insertions(+), 1 deletions(-)
> -
> -diff --git a/arch/arch-arm.h b/arch/arch-arm.h
> -index 658b688..7cd9502 100644
> ---- a/arch/arch-arm.h
> -+++ b/arch/arch-arm.h
> -@@ -18,7 +18,9 @@
> - #define __NR_sys_vmsplice	343
> - #endif
> -=20
> --#if defined (__ARM_ARCH_4__) || defined (__ARM_ARCH_4T__) || defined (_=
_ARM_ARCH_5__) || defined (__ARM_ARCH_5T__) || defined (__ARM_ARCH_5TE__) |=
| defined (__ARM_ARCH_5TEJ__)
> -+#if defined (__ARM_ARCH_4__) || defined (__ARM_ARCH_4T__) \
> -+	|| defined (__ARM_ARCH_5__) || defined (__ARM_ARCH_5T__) || defined (_=
_ARM_ARCH_5TE__) || defined (__ARM_ARCH_5TEJ__) \
> -+	|| defined(__ARM_ARCH_6__)  || defined(__ARM_ARCH_6J__) || defined(__A=
RM_ARCH_6Z__) || defined(__ARM_ARCH_6ZK__)
> - #define nop             __asm__ __volatile__("mov\tr0,r0\t@ nop\n\t")
> - #define read_barrier()	__asm__ __volatile__ ("" : : : "memory")
> - #define write_barrier()	__asm__ __volatile__ ("" : : : "memory")
> ---=20
> -1.7.2.5
> -
> diff --git a/meta-oe/recipes-benchmark/fio/fio_2.0.5.bb b/meta-oe/recipes=
-benchmark/fio/fio_2.2.6.bb
> similarity index 72%
> rename from meta-oe/recipes-benchmark/fio/fio_2.0.5.bb
> rename to meta-oe/recipes-benchmark/fio/fio_2.2.6.bb
> index 8dcf637..016b1f2 100644
> --- a/meta-oe/recipes-benchmark/fio/fio_2.0.5.bb
> +++ b/meta-oe/recipes-benchmark/fio/fio_2.2.6.bb
> @@ -12,17 +12,16 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D393a5ca445=
f6965873eca0259a17f833"
> =20
>  DEPENDS =3D "libaio"
> =20
> -# rev for v2.0.5
> -SRCREV =3D "02efadeb8b05144bcf2fc7796e1da2e7db211d00"
> -SRC_URI =3D "git://git.kernel.dk/fio.git \
> -           file://0001-ARM-Use-generic-assembly-nop-and-barrier-code-for=
-ar.patch"
> +# rev for v2.2.6
> +SRCREV =3D "f52c9691bc8c285f3445235c69acdfd6de7f9b82"
> +SRC_URI =3D "git://git.kernel.dk/fio.git"
> =20
>  S =3D "${WORKDIR}/git"
> =20
> -EXTRA_OEMAKE =3D "CC=3D'${CC}' CFLAGS=3D'${CFLAGS}' LDFLAGS=3D'${LDFLAGS=
}'"
> +EXTRA_OEMAKE =3D "CC=3D'${CC}' LDFLAGS=3D'${LDFLAGS}'"
> =20
>  do_install() {
> -    oe_runmake install DESTDIR=3D${D} bindir=3D${bindir} mandir=3D${mand=
ir}
> +    oe_runmake install DESTDIR=3D${D} prefix=3D${prefix} mandir=3D${mand=
ir}
>      install -d ${D}/${docdir}/${PN}
>      cp -a ${S}/examples ${D}/${docdir}/${PN}/
>  }
>=20
> --=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--W/D3X8sky0X3AmG5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlUNjt4ACgkQN1Ujt2V2gByRTgCfQ5kEStWOwk0EGKtChApxFJ0J
92YAnjxBlFRVFZoPUnbypmomBBFxNcfh
=k7xe
-----END PGP SIGNATURE-----

--W/D3X8sky0X3AmG5--
