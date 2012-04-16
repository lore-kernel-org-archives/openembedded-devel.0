Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1SJjdv-0002Px-QS
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Apr 2012 12:58:47 +0200
Received: by wibhj13 with SMTP id hj13so7393391wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Apr 2012 03:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=vY5+RxQTv1/o2L7SvvTccvQHrWM8Kaq2nOtXoqApw7k=;
	b=tMZdSK/VhOCaN4xIdtMdhaxTsOZs/cnoRNI+IQZgIg5zOI4hu1yUNyBlb13gR4IBJI
	tKvU0FWJtX/FaNFKx8NJ7LbtjdGt+6wlN2ktDk8bdknGfePfYH2Bdb8GLwk63jUyECQN
	AhC3eBBYthhF29eRmeiUH6FKRYJp8F5fnfNAcXrOpFrp9eigKYj3qx2eqBHKsj/7ylkK
	PyavDKArDBDkrofGY++AdcV8F2s8skmNbaaG6TkgjdmOUmxClcHfs/KPvx1ubFynqguG
	FJP18i9+G5LdfMrAnMhkMPV5Ud+ZLpn05UBmlg6Sc5SdA7vHd7tvTh0HT7op2MvEgNoV
	KtbA==
MIME-Version: 1.0
Received: by 10.180.100.230 with SMTP id fb6mr15809257wib.3.1334573363161;
	Mon, 16 Apr 2012 03:49:23 -0700 (PDT)
Received: by 10.223.14.149 with HTTP; Mon, 16 Apr 2012 03:49:23 -0700 (PDT)
In-Reply-To: <1334542833-27552-4-git-send-email-kai.kang@windriver.com>
References: <1334542833-27552-1-git-send-email-kai.kang@windriver.com>
	<1334542833-27552-4-git-send-email-kai.kang@windriver.com>
Date: Mon, 16 Apr 2012 12:49:23 +0200
Message-ID: <CAGiJk9fNdxQ38qgUOMYMXPiD_WOMXttc-NN0oFcjQTJZGgh0XA@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: Kang Kai <kai.kang@windriver.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 3/3] kdelib4-native: build makekdewidgets
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 16 Apr 2012 10:58:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

2012/4/16 Kang Kai <kai.kang@windriver.com>:
> qt4-native has been updated and open phonon and openssl support,
> makekdewidgets could be successfully build. So build it.
>
> Signed-off-by: Kang Kai <kai.kang@windriver.com>
> ---
> =C2=A0recipes-kde-base/kdelibs4-native_git.bb | =C2=A0 14 ++++++--------
> =C2=A01 files changed, 6 insertions(+), 8 deletions(-)
>
> diff --git a/recipes-kde-base/kdelibs4-native_git.bb b/recipes-kde-base/k=
delibs4-native_git.bb
> index decba41..36241fa 100644
> --- a/recipes-kde-base/kdelibs4-native_git.bb
> +++ b/recipes-kde-base/kdelibs4-native_git.bb
> @@ -2,18 +2,15 @@ LICENSE =3D "GPLv2"
>
> =C2=A0LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D5c213a7de3f013310bd272cd=
b6eb7a24"
>
> -DEPENDS =3D "automoc4-native giflib-native attica-native perl-native"
> -#strigi-native
> -#soprano-native
> -# jpeg-native libpng-native
> -
> +DEPENDS =3D "automoc4-native giflib-native attica-native perl-native lib=
dbusmenu-qt-native"
>
> =C2=A0inherit kde_cmake kde_without_docs mime native perlnative
>
> -
> =C2=A0SRC_URI =3D "git://anongit.kde.org/kdelibs.git;branch=3Dv4.8.0 \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Don-t-build-documentation-d=
isable-Strigi.patch \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-Fix-openssl-check.patch \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0003-Fix-FindKDE4Internals-cmake-fil=
e.patch \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0004-Fix-the-path-to-Icemaker.patch =
\
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0005-Remove-docs-so-they-don-t-g=
et-pulled-in-elsewhere.patch \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"
>
> @@ -32,12 +29,13 @@ EXTRA_OECMAKE =3D+ "\
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-DKJS_FORCE=
_DISABLE_PCRE=3DTRUE \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-DSTRIGI_RE=
QUIRED=3DFALSE \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-DSTRIGI_IN=
CLUDE_DIR=3DTRUE \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -DOE_CROSSCOMPI=
LING=3DFALSE \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "
>
> =C2=A0do_compile() {
> =C2=A0 cd ${S}/build && make -C kdecore/kconfig_compiler
> =C2=A0 cd ${S}/build && make -C kjs icemaker
> -# =C2=A0cd ${S}/build && oe_runmake CC=3D"${CC}" CXX=3D"${CXX}"
> + =C2=A0cd ${S}/build && make -C kdewidgets makekdewidgets
> =C2=A0}
>
> =C2=A0do_install() {
> @@ -45,5 +43,5 @@ do_install() {
>
> =C2=A0 install -m 0755 ${S}/build/bin/icemaker ${D}${bindir}
> =C2=A0 install -m 0755 ${S}/build/bin/kconfig_compiler ${D}${bindir}
> -# =C2=A0install -m 0755 ${S}/build/bin/makekdewidgets ${D}${bindir}
> + =C2=A0install -m 0755 ${S}/build/bin/makekdewidgets ${D}${bindir}
> =C2=A0}
> --
> 1.7.5.4
>

Hi Kai,
looks good.

I applied this patch together with the adjustment of kdelibs4 and
kde_cmake.bbclass.

--=20
Regards
Samuel


