Return-Path: <sven.ebenfeld@gmail.com>
Received: from mail-ig0-f173.google.com (mail-ig0-f173.google.com
	[209.85.213.173])
	by mail.openembedded.org (Postfix) with ESMTP id EA1B7608B7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Aug 2015 11:53:27 +0000 (UTC)
Received: by igbjg10 with SMTP id jg10so102713816igb.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Aug 2015 04:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=FnqaS957IpEO/N0fUyhXw8SQnDYCq8+7Pm+sLUKvl8c=;
	b=rwtCV0cqKsCFgJkknnOpMUhI83cA7pDWIRIQ0PszEmLmLvbeVQG+2NkzwOVwuf6hL+
	Mb5isZBWBFOkMBNRm8iDn/f62pE0MtssET/Y5tNhlanYEWnI3MVLXIp4A4G3MnerwcnJ
	NS7uG3NpBcGgoSw3ZmONsLqcF4rzhb5qsFni4WAFb9qV69vTDtLIzjge8D3jEVVWUM3x
	W4KYOvdlk+aopSxcrwZspflIAXO41jX9cFKC0BPnneRL2XbPj/ek+L1KWhkjzi39NJAd
	RlOhgk/qWdB7gmJZ65a1/bKo1AIUm/YephimHP43rDGXle4gIv/m2ZJQb8GTZE6nvYf8
	BrMg==
MIME-Version: 1.0
X-Received: by 10.50.17.103 with SMTP id n7mr715237igd.95.1439985207362; Wed,
	19 Aug 2015 04:53:27 -0700 (PDT)
Received: by 10.107.170.21 with HTTP; Wed, 19 Aug 2015 04:53:27 -0700 (PDT)
In-Reply-To: <1439928871-17797-1-git-send-email-mario@ossystems.com.br>
References: <1439928871-17797-1-git-send-email-mario@ossystems.com.br>
Date: Wed, 19 Aug 2015 13:53:27 +0200
Message-ID: <CAD0=qkLXGaNYJ6X_sUXk3EEbi0EvoN1z0ufGvwB8V41Bo4ETyQ@mail.gmail.com>
From: Sven Ebenfeld <sven.ebenfeld@gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: Mario Domenech Goulart <mario@ossystems.com.br>
Subject: Re: [meta-java][PATCH 1/3] Don't depend on a hardcoded compiler
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
X-List-Received-Date: Wed, 19 Aug 2015 11:53:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

This patch creates a circular dependency for me:

ERROR: Unbuildable tasks were found.
These are usually caused by circular dependencies and any circular
dependency chains found will be printed below. Increase the debug
level to see a list of unbuildable tasks.

Identifying dependency loops (this may take a short while)...

ERROR:
Dependency loop #1 found:
  Task 2 (virtual:native:/sources/meta-java/recipes-core/jamvm/jamvm_git.bb=
,
do_install) (dependent Tasks ['jamvm, do_compile'])
  Task 3 (virtual:native:/sources/meta-java/recipes-core/jamvm/jamvm_git.bb=
,
do_populate_sysroot) (dependent Tasks ['jamvm, do_install'])
  Task 68 (/sources/meta-java/recipes-core/ecj/ecj-bootstrap-native.bb,
do_configure) (dependent Tasks ['libecj-bootstrap-native,
do_populate_sysroot', 'ecj-bootstrap-native.bb, do_patch', 'jamvm,
do_populate_sysroot'])
  Task 69 (/sources/meta-java/recipes-core/ecj/ecj-bootstrap-native.bb,
do_compile) (dependent Tasks ['ecj-bootstrap-native.bb,
do_configure'])
  Task 65 (/sources/meta-java/recipes-core/ecj/ecj-bootstrap-native.bb,
do_install) (dependent Tasks ['ecj-bootstrap-native.bb, do_compile'])
  Task 66 (/sources/meta-java/recipes-core/ecj/ecj-bootstrap-native.bb,
do_populate_sysroot) (dependent Tasks ['ecj-bootstrap-native.bb,
do_install'])
  Task 5 (virtual:native:/sources/meta-java/recipes-core/jamvm/jamvm_git.bb=
,
do_configure) (dependent Tasks ['jamvm, do_patch',
'ecj-bootstrap-native.bb, do_populate_sysroot', 'libtool-native,
do_populate_sysroot', 'libffi, do_populate_sysroot', 'gnu-config,
do_populate_sysroot', 'pkgconfig, do_populate_sysroot', 'zlib,
do_populate_sysroot', 'autoconf, do_populate_sysroot',
'classpath-native, do_populate_sysroot', 'automake,
do_populate_sysroot'])
  Task 6 (virtual:native:/sources/meta-java/recipes-core/jamvm/jamvm_git.bb=
,
do_compile) (dependent Tasks ['jamvm, do_configure'])

Dependency loop #2 found:
  Task 2 (virtual:native:/sources/meta-java/recipes-core/jamvm/jamvm_git.bb=
,
do_install) (dependent Tasks ['jamvm, do_compile'])
  Task 3 (virtual:native:/sources/meta-java/recipes-core/jamvm/jamvm_git.bb=
,
do_populate_sysroot) (dependent Tasks ['jamvm, do_install'])
  Task 68 (/sources/meta-java/recipes-core/ecj/ecj-bootstrap-native.bb,
do_configure) (dependent Tasks ['libecj-bootstrap-native,
do_populate_sysroot', 'ecj-bootstrap-native.bb, do_patch', 'jamvm,
do_populate_sysroot'])
  Task 69 (/sources/meta-java/recipes-core/ecj/ecj-bootstrap-native.bb,
do_compile) (dependent Tasks ['ecj-bootstrap-native.bb,
do_configure'])
  Task 65 (/sources/meta-java/recipes-core/ecj/ecj-bootstrap-native.bb,
do_install) (dependent Tasks ['ecj-bootstrap-native.bb, do_compile'])
  Task 66 (/sources/meta-java/recipes-core/ecj/ecj-bootstrap-native.bb,
do_populate_sysroot) (dependent Tasks ['ecj-bootstrap-native.bb,
do_install'])
  Task 61 (/sources/meta-java/recipes-core/classpath/classpath-native_0.99.=
bb,
do_configure) (dependent Tasks ['ecj-bootstrap-native.bb,
do_populate_sysroot', 'libtool-native, do_populate_sysroot',
'gettext-minimal-native, do_populate_sysroot', 'gnu-config,
do_populate_sysroot', 'zip, do_populate_sysroot', 'fastjar,
do_populate_sysroot', 'autoconf, do_populate_sysroot',
'classpath-native, do_patch', 'automake, do_populate_sysroot'])
  Task 62 (/sources/meta-java/recipes-core/classpath/classpath-native_0.99.=
bb,
do_compile) (dependent Tasks ['classpath-native, do_configure'])
  Task 58 (/sources/meta-java/recipes-core/classpath/classpath-native_0.99.=
bb,
do_install) (dependent Tasks ['classpath-native, do_compile'])
  Task 59 (/sources/meta-java/recipes-core/classpath/classpath-native_0.99.=
bb,
do_populate_sysroot) (dependent Tasks ['classpath-native,
do_install'])
  Task 5 (virtual:native:/sources/meta-java/recipes-core/jamvm/jamvm_git.bb=
,
do_configure) (dependent Tasks ['jamvm, do_patch',
'ecj-bootstrap-native.bb, do_populate_sysroot', 'libtool-native,
do_populate_sysroot', 'libffi, do_populate_sysroot', 'gnu-config,
do_populate_sysroot', 'pkgconfig, do_populate_sysroot', 'zlib,
do_populate_sysroot', 'autoconf, do_populate_sysroot',
'classpath-native, do_populate_sysroot', 'automake,
do_populate_sysroot'])
  Task 6 (virtual:native:/sources/meta-java/recipes-core/jamvm/jamvm_git.bb=
,
do_compile) (dependent Tasks ['jamvm, do_configure'])


I have set PREFERRED_PROVIDER_virtual/java-native =3D "jamvm-native" and
PREFERRED_PROVIDER_virtual/javac-native =3D "ecj-bootstrap-native"

The recipe ecj-bootstrap-native now depends on virtual/java-native and
provides virtual/javac-native.
The recipe jamvm depends on virtual/javac-native and provides
java-native. So none of them can be built since this patch.

Shouldn't jamvm depend on javac-initial-native?

Mit freundlichen Gr=C3=BC=C3=9Fen,
Sven Ebenfeld


2015-08-18 22:14 GMT+02:00 Mario Domenech Goulart <mario@ossystems.com.br>:
> The recipes below depended on a hardcoded native compile
> (ecj-initial-native).  Since we may use another native compiler to
> build them, we set the dependency in virtual/javac-native instead.
>
> * cacao
> * classpath-native
> * jamvm
>
> Signed-off-by: Mario Domenech Goulart <mario@ossystems.com.br>
> ---
>  recipes-core/cacao/cacao_1.6.1.bb               | 2 +-
>  recipes-core/classpath/classpath-native_0.99.bb | 2 +-
>  recipes-core/jamvm/jamvm.inc                    | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/recipes-core/cacao/cacao_1.6.1.bb b/recipes-core/cacao/cacao=
_1.6.1.bb
> index 65aaf93..14ff019 100644
> --- a/recipes-core/cacao/cacao_1.6.1.bb
> +++ b/recipes-core/cacao/cacao_1.6.1.bb
> @@ -4,7 +4,7 @@ LICENSE  =3D "GPL-2.0"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D59530bdf33659b29e73d4adb9f9f6=
552"
>  SECTION  =3D "interpreters"
>
> -DEPENDS_class-native =3D "zlib-native libtool-native ecj-initial-native =
fastjar-native classpath-native bdwgc-native"
> +DEPENDS_class-native =3D "zlib-native libtool-native virtual/javac-nativ=
e fastjar-native classpath-native bdwgc-native"
>  PROVIDES_class-native =3D "virtual/java-native"
>
>  DEPENDS =3D "zlib libtool classpath virtual/javac-native bdwgc"
> diff --git a/recipes-core/classpath/classpath-native_0.99.bb b/recipes-co=
re/classpath/classpath-native_0.99.bb
> index 02951b9..cf297d9 100644
> --- a/recipes-core/classpath/classpath-native_0.99.bb
> +++ b/recipes-core/classpath/classpath-native_0.99.bb
> @@ -1,7 +1,7 @@
>  require classpath-native.inc
>
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Daf0004801732bc4b20d90f351cf80=
510"
> -DEPENDS +=3D "ecj-initial-native"
> +DEPENDS +=3D "virtual/javac-native"
>
>  PR =3D "${INC_PR}.0"
>
> diff --git a/recipes-core/jamvm/jamvm.inc b/recipes-core/jamvm/jamvm.inc
> index 5893cbc..bed1c5d 100644
> --- a/recipes-core/jamvm/jamvm.inc
> +++ b/recipes-core/jamvm/jamvm.inc
> @@ -4,7 +4,7 @@ LICENSE =3D "GPL-2.0"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D0636e73ff0215e8d672dc4c32c317=
bb3"
>
>  DEPENDS =3D "zlib classpath virtual/javac-native libffi"
> -DEPENDS_virtclass-native =3D "zlib-native classpath-native ecj-initial-n=
ative libffi-native"
> +DEPENDS_virtclass-native =3D "zlib-native classpath-native virtual/javac=
-native libffi-native"
>
>  RDEPENDS_${PN} =3D "classpath"
>  RDEPENDS_${PN}_virtclass-native =3D ""
> --
> 2.1.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

