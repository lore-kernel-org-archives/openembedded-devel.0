Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 0786E60124
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Nov 2015 16:11:58 +0000 (UTC)
Received: by wmec201 with SMTP id c201so22203900wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Nov 2015 08:11:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=nXiaMVFpurvZuMaBlWO5o3ZwmgPWYnDYrOI2f4yuYtQ=;
	b=qJmTsk6vaL8cbi71p2qS7lejYx/7yFL4gAjbDxRSxM0La+QKLe0HGp2GNfPZ1sHoql
	UqIbL3JLGKA5HQMm2kxQoec/G1e998tUINC3KAPM5IxwEf2EzVCENywwzKaewoEy+lh8
	wl47Tqnmye/rsbYh2BQULkSGJUAgNdVurqpvXlN+DFKcbkXeFWclMxrmQ0AX39aYODj3
	MXxgyfudRztyEOOX5HJKCcoKFd05HtaA+KluU8kwJWgsLeAMVNQTnGEwWRIHeW1sEf3Y
	tbrWRLgzLsjB0yzO45ylpbYWFeYeV1SmKTyukxOGKmZC4S18849mUBDXFWYI6E3CuYFd
	WKHA==
X-Received: by 10.28.19.7 with SMTP id 7mr11786770wmt.89.1446826318646;
	Fri, 06 Nov 2015 08:11:58 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id r5sm814651wjf.18.2015.11.06.08.11.57
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Nov 2015 08:11:57 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 6 Nov 2015 17:12:15 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151106161215.GB2550@jama>
References: <1446817092-9386-1-git-send-email-Martin.Jansa@gmail.com>
	<1446817092-9386-5-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1446817092-9386-5-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [PATCH][meta-qt5 5/7] qtwebengine: add dependency on yasm-native and use it
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
X-List-Received-Date: Fri, 06 Nov 2015 16:12:00 -0000
X-Groupsio-MsgNum: 58384
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xXmbgvnjoT4axfJE"
Content-Disposition: inline

--xXmbgvnjoT4axfJE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 06, 2015 at 02:38:10PM +0100, Martin Jansa wrote:
> * latest chromium is failing to build yasm, because it's mixing native
>   (x86_64) with target (x86 qemux86) libraries during the build:
>   FAILED: /OE/build/oe-core/tmp-glibc/sysroots/x86_64-linux/usr/bin/i586-=
oe-linux/i586-oe-linux-g++ -m32 -march=3Di586 --sysroot=3D/OE/build/oe-core=
/tmp-glibc/sysroots/qemux86 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed =
-Wl,-z,now -Wl,-z,relro -Wl,--fatal-warnings -Wl,-z,defs -pthread -Wl,-z,no=
execstack -fPIC -Wl,--disable-new-dtags -Wl,--gc-sections -o genstring -Wl,=
--start-group obj.host/src/3rdparty/chromium/third_party/yasm/source/patche=
d-yasm/genstring.genstring.o -Wl,--end-group
>   /OE/build/oe-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/i586-oe-l=
inux/gcc/i586-oe-linux/5.2.0/ld: i386:x86-64 architecture of input file `ob=
j.host/src/3rdparty/chromium/third_party/yasm/source/patched-yasm/genstring=
=2Egenstring.o' is incompatible with i386 output
>   /OE/build/oe-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/i586-oe-l=
inux/gcc/i586-oe-linux/5.2.0/ld: obj.host/src/3rdparty/chromium/third_party=
/yasm/source/patched-yasm/genstring.genstring.o: file class ELFCLASS64 inco=
mpatible with ELFCLASS32
>   /OE/build/oe-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/i586-oe-l=
inux/gcc/i586-oe-linux/5.2.0/ld: final link failed: File in wrong format
>   collect2: error: ld returned 1 exit status
>   ninja: build stopped: subcommand failed.
>   Makefile.gyp_run:262: recipe for target 'invoke_ninja' failed
>   make[3]: *** [invoke_ninja] Error 1
>=20
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  recipes-qt/qt5/qtwebengine_git.bb | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/qtwebengi=
ne_git.bb
> index f02c4d6..e4427c3 100644
> --- a/recipes-qt/qt5/qtwebengine_git.bb
> +++ b/recipes-qt/qt5/qtwebengine_git.bb
> @@ -23,6 +23,9 @@ DEPENDS +=3D " \
>  # xscreensaver isn't covered in qtbase DEPENDS
>  DEPENDS +=3D "${@base_contains('DISTRO_FEATURES', 'x11', 'libxscrnsaver'=
, '', d)}"
> =20
> +DEPENDS +=3D "yasm-native"
> +EXTRA_QMAKEVARS_PRE +=3D "WEBENGINE_CONFIG+=3Duse_system_yasm"

This should be GYP_CONFIG, I've sent wrong version of the patch, correct
version is in master-next and jansa/master branches.

There are some issues when system nss is detected and used, I'll look
into it later.

> +
>  COMPATIBLE_MACHINE =3D "(-)"
>  COMPATIBLE_MACHINE_x86 =3D "(.*)"
>  COMPATIBLE_MACHINE_x86-64 =3D "(.*)"
> --=20
> 2.6.2
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--xXmbgvnjoT4axfJE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlY80V4ACgkQN1Ujt2V2gByA3ACcDTE6HpaCBhje4rHRJ/VhwpNn
XZsAoKyR4jipnuGaRg8Wa7tmeJ3L49p9
=2aCN
-----END PGP SIGNATURE-----

--xXmbgvnjoT4axfJE--
