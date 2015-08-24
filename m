Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id D535776B8B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Aug 2015 12:42:16 +0000 (UTC)
Received: by wicja10 with SMTP id ja10so71103601wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Aug 2015 05:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=yd4ffE2A5h9L+xsPdmtPhC+hOLIJC2OuTjm9Aq5nD6k=;
	b=XCKp5XX1WV0SUz0AcS07Vn4K3S6/F3l+L+N7PuEPW/ZS9o9WDmIfzpN4lRflntyB77
	MhVqfLsW7A6Z4UP5MlzAKBW/jNlAA4waJvKHcO3ybd8Q3XbIQXEOtItsdsNP2LfW6TKI
	rYydAxtzQN9YSrczSYi+JHXPvS7K8+TKzf/oryU7a3Z96AaSQY3KTYpz87bUZeBcYN9z
	Q75vgLGrfgY9J+y4l3JVEfEhwkhiYOUAG4JJITiGMNufmgwpSSzFZBrsm6M8br3b7Osz
	5xqdFq09qFjXeAaSRekv4XRQx2NLjy73JDLmsLr96OsCO946FN0LYp5uzqfZArg0RvHy
	KvuA==
X-Received: by 10.180.85.233 with SMTP id k9mr29865366wiz.53.1440420136175;
	Mon, 24 Aug 2015 05:42:16 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	v9sm23018209wjq.41.2015.08.24.05.42.13
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Aug 2015 05:42:15 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 24 Aug 2015 14:42:18 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150824124218.GD2446@jama>
References: <1440391979-3469-1-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1440391979-3469-1-git-send-email-raj.khem@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-qt5][PATCH 1/3] qtbase: Fix build with clang
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
X-List-Received-Date: Mon, 24 Aug 2015 12:42:17 -0000
X-Groupsio-MsgNum: 56945
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1sNVjLsmu1MXqwQ/"
Content-Disposition: inline

--1sNVjLsmu1MXqwQ/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 23, 2015 at 09:52:57PM -0700, Khem Raj wrote:
> This patch is a backport from upstream qt5 fixes building with clang
> from meta-clang

I've just merged upgrade to 5.5 can you please rebase your changes and=20
re-submit?

Thanks

>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  recipes-qt/qt5/qtbase-native_git.bb                |  1 +
>  .../qt5/qtbase/0015-Fix-build-with-clang-3.7.patch | 71 ++++++++++++++++=
++++++
>  recipes-qt/qt5/qtbase_git.bb                       |  7 ++-
>  3 files changed, 76 insertions(+), 3 deletions(-)
>  create mode 100644 recipes-qt/qt5/qtbase/0015-Fix-build-with-clang-3.7.p=
atch
>=20
> diff --git a/recipes-qt/qt5/qtbase-native_git.bb b/recipes-qt/qt5/qtbase-=
native_git.bb
> index f84f38e..034a314 100644
> --- a/recipes-qt/qt5/qtbase-native_git.bb
> +++ b/recipes-qt/qt5/qtbase-native_git.bb
> @@ -27,6 +27,7 @@ SRC_URI +=3D "\
>      file://0008-eglfs-fix-egl-error-for-platforms-only-supporting-on.pat=
ch \
>      file://0009-QOpenGLPaintDevice-sub-area-support.patch \
>      file://0010-Make-Qt5GuiConfigExtras.cmake-find-gl-es-include-dir.pat=
ch \
> +    file://0015-Fix-build-with-clang-3.7.patch \
>  "
> =20
>  # common for qtbase-native and nativesdk-qtbase
> diff --git a/recipes-qt/qt5/qtbase/0015-Fix-build-with-clang-3.7.patch b/=
recipes-qt/qt5/qtbase/0015-Fix-build-with-clang-3.7.patch
> new file mode 100644
> index 0000000..181d63c
> --- /dev/null
> +++ b/recipes-qt/qt5/qtbase/0015-Fix-build-with-clang-3.7.patch
> @@ -0,0 +1,71 @@
> +This is backport of https://codereview.qt-project.org/#/c/121545/
> +
> +From 6a6acc496728ce96198d27f9ddd44c2367758d42 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Sun, 23 Aug 2015 15:19:41 -0700
> +Subject: [PATCH] Fix build with clang 3.7
> +
> +Nullable is a language extension in clang 3.7 (indicating whether or
> +not a pointer can be null).
> +http://clang.llvm.org/docs/AttributeReference.html#nullable
> +Using it as a class name breaks building with this compiler
> +
> +/mnt/home/kraj/work/angstrom/build/tmp-angstrom-glibc/work/armv7at2hf-vf=
p-neon-angstrom-linux-gnueabi/qtbase/5.4.2+gitAUTOINC+2cb17c1fb9-r0/git/src=
/tools/qlalr/lalr.cpp:241:1: error: declaration of anonymous
> +      struct must be a definition
> +struct _Nullable: public std::unary_function<Name, bool>
> +^
> +/mnt/home/kraj/work/angstrom/build/tmp-angstrom-glibc/work/armv7at2hf-vf=
p-neon-angstrom-linux-gnueabi/qtbase/5.4.2+gitAUTOINC+2cb17c1fb9-r0/git/src=
/tools/qlalr/lalr.cpp:241:56: error: expected unqualified-id
> +struct _Nullable: public std::unary_function<Name, bool>
> +                                                       ^
> +/mnt/home/kraj/work/angstrom/build/tmp-angstrom-glibc/work/armv7at2hf-vf=
p-neon-angstrom-linux-gnueabi/qtbase/5.4.2+gitAUTOINC+2cb17c1fb9-r0/git/src=
/tools/qlalr/lalr.cpp:303:98: error: expected expression
> +          NameList::iterator nn =3D std::find_if (rule->rhs.begin (), ru=
le->rhs.end (), std::not1 (_Nullable (this)));
> +                                                                        =
                         ^
> +/mnt/home/kraj/work/angstrom/build/tmp-angstrom-glibc/work/armv7at2hf-vf=
p-neon-angstrom-linux-gnueabi/qtbase/5.4.2+gitAUTOINC+2cb17c1fb9-r0/git/src=
/tools/qlalr/lalr.cpp:638:107: error: expected expression
> +                  NameList::iterator first_not_nullable =3D std::find_if=
 (dot, rule->rhs.end (), std::not1 (_Nullable (this)));
> +                                                                        =
                                  ^
> +4 errors generated.
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + src/tools/qlalr/lalr.cpp | 8 ++++----
> + 1 file changed, 4 insertions(+), 4 deletions(-)
> +
> +diff --git a/src/tools/qlalr/lalr.cpp b/src/tools/qlalr/lalr.cpp
> +index be1df7d..55ef056 100644
> +--- a/src/tools/qlalr/lalr.cpp
> ++++ b/src/tools/qlalr/lalr.cpp
> +@@ -238,11 +238,11 @@ void Grammar::buildExtendedGrammar ()
> +   non_terminals.insert (accept_symbol);
> + }
> +=20
> +-struct _Nullable: public std::unary_function<Name, bool>
> ++struct Nullable: public std::unary_function<Name, bool>
> + {
> +   Automaton *_M_automaton;
> +=20
> +-  _Nullable (Automaton *aut):
> ++  Nullable (Automaton *aut):
> +     _M_automaton (aut) {}
> +=20
> +   bool operator () (Name name) const
> +@@ -300,7 +300,7 @@ void Automaton::buildNullables ()
> +=20
> +       for (RulePointer rule =3D _M_grammar->rules.begin (); rule !=3D _=
M_grammar->rules.end (); ++rule)
> +         {
> +-          NameList::iterator nn =3D std::find_if (rule->rhs.begin (), r=
ule->rhs.end (), std::not1 (_Nullable (this)));
> ++          NameList::iterator nn =3D std::find_if (rule->rhs.begin (), r=
ule->rhs.end (), std::not1 (Nullable (this)));
> +=20
> +           if (nn =3D=3D rule->rhs.end ())
> +             changed |=3D nullables.insert (rule->lhs).second;
> +@@ -635,7 +635,7 @@ void Automaton::buildIncludesDigraph ()
> +                   if (! _M_grammar->isNonTerminal (*A))
> +                     continue;
> +=20
> +-                  NameList::iterator first_not_nullable =3D std::find_i=
f (dot, rule->rhs.end (), std::not1 (_Nullable (this)));
> ++                  NameList::iterator first_not_nullable =3D std::find_i=
f (dot, rule->rhs.end (), std::not1 (Nullable (this)));
> +                   if (first_not_nullable !=3D rule->rhs.end ())
> +                     continue;
> +=20
> +--=20
> +2.1.4
> +
> diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
> index 33620cb..6814dbe 100644
> --- a/recipes-qt/qt5/qtbase_git.bb
> +++ b/recipes-qt/qt5/qtbase_git.bb
> @@ -22,8 +22,9 @@ SRC_URI +=3D "\
>      file://0009-QOpenGLPaintDevice-sub-area-support.patch \
>      file://0010-Make-Qt5GuiConfigExtras.cmake-find-gl-es-include-dir.pat=
ch \
>      file://0014-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.pat=
ch \
> +    file://0015-Fix-build-with-clang-3.7.patch \
>  "
> -=20
> +
>  # specific for qtbase
>  SRC_URI +=3D "\
>      file://0011-qmake-don-t-build-it-in-configure-but-allow-to-build.pat=
ch \
> @@ -199,9 +200,9 @@ do_configure() {
>          -hostbindir ${OE_QMAKE_PATH_HOST_BINS} \
>          -hostdatadir ${OE_QMAKE_PATH_HOST_DATA} \
>          -external-hostbindir ${OE_QMAKE_PATH_EXTERNAL_HOST_BINS} \
> +        ${QT_CONFIG_FLAGS} \
>          -platform ${OE_QMAKESPEC} \
> -        -xplatform linux-oe-g++ \
> -        ${QT_CONFIG_FLAGS}
> +        -xplatform linux-oe-g++
> =20
>      qmake5_base_do_configure
>  }
> --=20
> 2.1.4
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--1sNVjLsmu1MXqwQ/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlXbESkACgkQN1Ujt2V2gBxkewCgmwkBUqo1jzDG5V0s7aOtt9aF
ABEAnA6jPVsVQ+Es1J1gSkmCk2LhQqvL
=WM8d
-----END PGP SIGNATURE-----

--1sNVjLsmu1MXqwQ/--
