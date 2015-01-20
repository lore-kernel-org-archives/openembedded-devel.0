Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f173.google.com (mail-we0-f173.google.com
	[74.125.82.173])
	by mail.openembedded.org (Postfix) with ESMTP id 8792771F1B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Jan 2015 15:10:21 +0000 (UTC)
Received: by mail-we0-f173.google.com with SMTP id q58so38023889wes.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Jan 2015 07:10:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ZQNClzi8FIfVxKy7Ks3C9teZmq7b20Vzq/wGGWgJajs=;
	b=Bp5cKXFiXMGpVhw6nfhfsXXS8bccj2YJjFQtnjRxPTCqPAoCpdatsVh4kGJN8L4Aob
	qce2bJx7U3rk3BRWncVzeX3NgNmi8ifScfd2C5GsqekJNzF3xftTUmW0sJvL3AwlnnWE
	M+y9B0wi3OsWUklBOwu+lVwqHQ8meFHFtcRuXXGnwix9Tb1BtWmap2U0VGTBNoo+uZdD
	vXGZWAix+Kc9ArH2VP6SfVM0DJ2eEsiJMc26WtjSY+ksVq3IwRVwhjaGd9sHWafodUVT
	zQSp5nJw5q7Ie8y33t5E0x9hK5QLgLfrgGMbfrXKpvvp3py1z34FLhn8I8Px3aXdVGvL
	Ka2w==
X-Received: by 10.194.10.68 with SMTP id g4mr14353839wjb.5.1421766621962;
	Tue, 20 Jan 2015 07:10:21 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	vs8sm21649415wjc.6.2015.01.20.07.10.20
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 20 Jan 2015 07:10:20 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 20 Jan 2015 16:10:22 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150120151022.GA2453@jama>
References: <1421739732-28362-1-git-send-email-kai.kang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1421739732-28362-1-git-send-email-kai.kang@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-networking][PATCH] lksctp-tools: add ptest subpackage and other updates
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
X-List-Received-Date: Tue, 20 Jan 2015 15:10:25 -0000
X-Groupsio-MsgNum: 53891
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BXVAT5kNtrzKuDFl"
Content-Disposition: inline

--BXVAT5kNtrzKuDFl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 20, 2015 at 03:42:12PM +0800, Kai Kang wrote:
> Some updates for lksctp-tools:
>=20
> * add ptest subpackage
> * only blacklist lksctp-tools when gold ld is used. Refer to:
> https://bugs.gentoo.org/show_bug.cgi?id=3D530318
> * update licenses and add homepage.
>=20
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  .../lksctp-tools/lksctp-tools/run-ptest             |  5 +++++
>  .../lksctp-tools/lksctp-tools/v4test.sh             | 11 +++++++++++
>  .../lksctp-tools/lksctp-tools/v6test.sh             | 11 +++++++++++
>  .../lksctp-tools/lksctp-tools_1.0.16.bb             | 21 +++++++++++++++=
++----
>  4 files changed, 44 insertions(+), 4 deletions(-)
>  create mode 100644 meta-networking/recipes-support/lksctp-tools/lksctp-t=
ools/run-ptest
>  create mode 100644 meta-networking/recipes-support/lksctp-tools/lksctp-t=
ools/v4test.sh
>  create mode 100644 meta-networking/recipes-support/lksctp-tools/lksctp-t=
ools/v6test.sh

OE @ ~/meta-openembedded $ pwam 87065
2015-01-20 16:08:10 URL:http://patchwork.openembedded.org/patch/87065/mbox/=
 [4796] -> "pw-am-87065.patch" [1]
Applying: lksctp-tools: add ptest subpackage and other updates
/OE/meta-openembedded/.git/rebase-apply/patch:21: new blank line at EOF.
+
error: patch failed: meta-networking/recipes-support/lksctp-tools/lksctp-to=
ols_1.0.16.bb:16
error: meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.16.bb:=
 patch does not apply
Patch failed at 0001 lksctp-tools: add ptest subpackage and other updates
The copy of the patch that failed is found in:
   /OE/meta-openembedded/.git/rebase-apply/patch
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".

most likely because the change was based on commit older than

OE @ ~/meta-openembedded $ git log meta-networking/recipes-support/lksctp-t=
ools/lksctp-tools_1.0.16.bb  =20
commit 96a92761c0a1bb2317fa4ea422c32e4473405103
Author: Martin Jansa <Martin.Jansa@gmail.com>
Date:   Sat Dec 6 08:01:57 2014 +0100

    PNBLACKLIST: use weak assignments

please rebase before sending

>=20
> diff --git a/meta-networking/recipes-support/lksctp-tools/lksctp-tools/ru=
n-ptest b/meta-networking/recipes-support/lksctp-tools/lksctp-tools/run-pte=
st
> new file mode 100644
> index 0000000..e67f18e
> --- /dev/null
> +++ b/meta-networking/recipes-support/lksctp-tools/lksctp-tools/run-ptest
> @@ -0,0 +1,5 @@
> +#!/bin/sh
> +
> +sh v4test.sh
> +sh v6test.sh
> +
> diff --git a/meta-networking/recipes-support/lksctp-tools/lksctp-tools/v4=
test.sh b/meta-networking/recipes-support/lksctp-tools/lksctp-tools/v4test.=
sh
> new file mode 100644
> index 0000000..5130856
> --- /dev/null
> +++ b/meta-networking/recipes-support/lksctp-tools/lksctp-tools/v4test.sh
> @@ -0,0 +1,11 @@
> +#!/bin/sh
> +echo "v4test starting:"
> +for t in $(find -maxdepth 1 -type f \! -name test\*_v6 -name test\*); do
> +  echo "$t";
> +  if $t; then
> +    echo "PASS: $t"; echo "";
> +  else
> +    echo "FAIL: $t"; echo "";
> +  fi
> +  sleep 1;
> +done
> diff --git a/meta-networking/recipes-support/lksctp-tools/lksctp-tools/v6=
test.sh b/meta-networking/recipes-support/lksctp-tools/lksctp-tools/v6test.=
sh
> new file mode 100644
> index 0000000..3a667df
> --- /dev/null
> +++ b/meta-networking/recipes-support/lksctp-tools/lksctp-tools/v6test.sh
> @@ -0,0 +1,11 @@
> +#!/bin/sh
> +echo "v6test starting:"
> +for t in $(find -maxdepth 1 -name test\*_v6); do
> +  echo "$t";
> +  if $t; then
> +    echo "PASS: $t"; echo "";
> +  else
> +    echo "FAIL: $t"; echo "";
> +  fi
> +  sleep 1;
> +done
> diff --git a/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.=
0.16.bb b/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.16.=
bb
> index e2551e1..b756dd7 100644
> --- a/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.16.bb
> +++ b/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.16.bb
> @@ -1,13 +1,18 @@
>  SUMMARY =3D "The Linux Kernel Stream Control Transmission Protocol (lksc=
tp) project"
> +HOMEPAGE =3D "http://lksctp.org"
>  SECTION =3D "libs"
> -LICENSE =3D "LGPLv2"
> +LICENSE =3D "LGPLv2.1 & GPLv2"
> =20
>  LIC_FILES_CHKSUM =3D " \
>      file://COPYING.lib;md5=3D0a1b79af951c42a9c8573533fbba9a92 \
>      file://COPYING;md5=3D0c56db0143f4f80c369ee3af7425af6e \
>  "
> =20
> -SRC_URI =3D "${SOURCEFORGE_MIRROR}/lksctp/${BP}.tar.gz"
> +SRC_URI =3D "${SOURCEFORGE_MIRROR}/lksctp/${BP}.tar.gz \
> +           file://run-ptest \
> +           file://v4test.sh \
> +           file://v6test.sh \
> +          "
> =20
>  SRC_URI[md5sum] =3D "708bb0b5a6806ad6e8d13c55b067518e"
>  SRC_URI[sha256sum] =3D "0903dd526b7f30a89d5031aa2c82757612becc38ed7bc6e4=
f972f8deae351f26"
> @@ -16,13 +21,21 @@ SRC_URI[sha256sum] =3D "0903dd526b7f30a89d5031aa2c827=
57612becc38ed7bc6e4f972f8deae
>  #| /home/jenkins/oe/world/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/=
libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.0/ld: error: symb=
ol sctp_connectx has undefined version
>  #| collect2: error: ld returned 1 exit status
>  #| make[4]: *** [libsctp.la] Error 1
> -PNBLACKLIST[lksctp-tools] =3D "BROKEN: fails to link against sctp_connec=
tx symbol"
> +PNBLACKLIST[lksctp-tools] =3D "${@base_contains('DISTRO_FEATURES', 'ld-i=
s-gold', "BROKEN: fails to link against sctp_connectx symbol", '', d)}"
> =20
>  S =3D "${WORKDIR}/${BP}"
> =20
>  BBCLASSEXTEND =3D "native"
> =20
> -inherit autotools pkgconfig binconfig
> +inherit autotools pkgconfig binconfig ptest
> +
> +do_install_ptest () {
> +	install -m 0755 ${WORKDIR}/v4test.sh ${D}${PTEST_PATH}
> +	install -m 0755 ${WORKDIR}/v6test.sh ${D}${PTEST_PATH}
> +	for testcase in `find ${B}/src/apps/.libs ${B}/src/func_tests/.libs -ma=
xdepth 1 -type f -executable`; do
> +		install $testcase ${D}${PTEST_PATH}
> +	done
> +}
> =20
>  SOLIBVERSION=3D"${PV}"
>  SOLIBMAJORVERSION=3D"1"
> --=20
> 2.1.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--BXVAT5kNtrzKuDFl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlS+b94ACgkQN1Ujt2V2gByJewCcD9eBZTRLhZhB7U2kJFQIDxTv
YxAAoJwRZb+USOP0GnDW3XqCmwmyA7p2
=bD3m
-----END PGP SIGNATURE-----

--BXVAT5kNtrzKuDFl--
