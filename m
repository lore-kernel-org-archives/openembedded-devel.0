Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f49.google.com (mail-ee0-f49.google.com [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id 46C446D170
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Oct 2013 08:25:50 +0000 (UTC)
Received: by mail-ee0-f49.google.com with SMTP id e52so1473541eek.36
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Oct 2013 01:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=S9CkmPaJQj/C8proKfiKE/113x7juAH97zD5/CsYPc0=;
	b=fS0DoUE7yPzK2aELbBzjsMIRzRs7tsUDtfyP+JKqCpq9iWQEJ5NVZDvA7yX+3yY+8h
	yIyzE9Nk9LlTDScj4WBmV9B5vJdnSVxGCLfq2d0kIp0RV4vpC71V4DSRYWOtwrm3bCIj
	VVeQFm+FAKmDt4PU8Ir/NX3W0xooniPTta06p9FFkzJdW8EuhTpt+TaLt8UHiV9ZXce0
	+Wf/6zaWihdLH49afXzODq2fVYySva4TKTblnH9OCmijgCpxfukKk8gi4VVjZ82sJDc/
	hvMMuwhREh1wc2EYuJQfZ7GKYMKM+Ill48swGM9vTfbRT0kcXPg576YUT8oDL73rnIXe
	Ie+w==
X-Received: by 10.15.50.68 with SMTP id k44mr1162613eew.54.1382948751680;
	Mon, 28 Oct 2013 01:25:51 -0700 (PDT)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id h45sm54274624eeg.5.2013.10.28.01.25.50
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 Oct 2013 01:25:51 -0700 (PDT)
Date: Mon, 28 Oct 2013 09:26:03 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20131028082603.GD3704@jama>
References: <1382105347-27538-1-git-send-email-anders.roxell@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1382105347-27538-1-git-send-email-anders.roxell@linaro.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: linaro-networking@linaro.org, patches@linaro.org
Subject: Re: [PATCH] libhugetlbfs: add support for armv7a
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
X-List-Received-Date: Mon, 28 Oct 2013 08:25:50 -0000
X-Groupsio-MsgNum: 46902
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ytoMbUMiTKPMT3hY"
Content-Disposition: inline

--ytoMbUMiTKPMT3hY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 18, 2013 at 04:09:07PM +0200, Anders Roxell wrote:
> Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
> ---
>  meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb | 10 ++++++++=
--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb b=
/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> index 24480c3..4f1bfa4 100644
> --- a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> +++ b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> @@ -20,10 +20,16 @@ SRC_URI =3D "git://git.code.sf.net/p/libhugetlbfs/cod=
e \
> =20
>  S =3D "${WORKDIR}/git"
> =20
> -COMPATIBLE_HOST =3D "(x86_64|powerpc|powerpc64|aarch64).*-linux*"
> +COMPATIBLE_HOST =3D "(x86_64|powerpc|powerpc64|arm|aarch64).*-linux*"
> =20
> +python __anonymous() {
> +    if base_contains('TARGET_ARCH', 'arm', True, False, d):
> +        d.setVar('ARCH', 'armv7l')
> +    else:
> +        d.setVar('ARCH', d.getVar('TARGET_ARCH'))
> +}
> =20
> -EXTRA_OEMAKE =3D "'ARCH=3D${TARGET_ARCH}' 'OPT=3D${CFLAGS}' 'CC=3D${CC}'=
 BUILDTYPE=3DNATIVEONLY ${LIBARGS}"
> +EXTRA_OEMAKE =3D "'ARCH=3D${ARCH}' 'OPT=3D${CFLAGS}' 'CC=3D${CC}' BUILDT=
YPE=3DNATIVEONLY ${LIBARGS}"
>  CFLAGS +=3D "-fexpensive-optimizations -frename-registers -fomit-frame-p=
ointer -g0"
> =20
>  TARGET_CC_ARCH +=3D "${LDFLAGS}"

It enables every arm* and fails for qemuarm:

|
/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_64-linu=
x/usr/libexec/armv5te-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.8.1/ld:
error: zero_filesize_segment.ld: SECTIONS seen after other input files;
try -T/--script
| collect2: error: ld returned 1 exit status
| 	 CC32 obj32/linkhuge.o
| 	 LD32 (hugelink test) obj32/linkhuge
| 	 CC32 obj32/linkhuge_nofd.o
| 	 LD32 (hugelink test) obj32/linkhuge_nofd
| 	 CC32 obj32/linkshare.o
| 	 LD32 (hugelink test) obj32/linkshare
| 	 CC32 obj32/linkhuge_rw.o
| 	 LD32 (hugelink_rw test) obj32/linkhuge_rw
| arm-oe-linux-gnueabi-ld: error: cannot open text-segment=3D2097152: No
such file or directory
| arm-oe-linux-gnueabi-ld: fatal error: unable to parse script file
text-segment=3D2097152
| collect2: error: ld returned 1 exit status
| make[1]: *** [obj32/linkhuge_rw] Error 1
| make: *** [tests/all] Error 2
| ERROR: oe_runmake failed
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_compile (log file is located at
/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-linu=
x-gnueabi/libhugetlbfs/git-r0/temp/log.do_compile.24357)
NOTE: recipe libhugetlbfs-git-r0: task do_compile: Failed
ERROR: Task 23498
(/home/jenkins/oe/shr-core-branches/shr-core/meta-openembedded/meta-oe/reci=
pes-benchmark/libhugetlbfs/libhugetlbfs_git.bb,
do_compile) failed with exit code '1'


> --=20
> 1.8.1.2
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ytoMbUMiTKPMT3hY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlJuH5sACgkQN1Ujt2V2gByhvQCggW1xRI32dybk+Ieff8dT9T4t
kOsAn14Od/XG2Yg1KKEwiwyIPk/O4/Mf
=yoFS
-----END PGP SIGNATURE-----

--ytoMbUMiTKPMT3hY--
