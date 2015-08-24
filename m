Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id C11AD6AC1E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Aug 2015 21:39:35 +0000 (UTC)
Received: by widdq5 with SMTP id dq5so62528614wid.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Aug 2015 14:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=fmw2AeaKjQyNIwXfw7RwwabpXHgGfHm9eG4z5b4Wk+o=;
	b=IZGuUjdwgxxNdDxifiPB622oOsJ2vbAWPQh/o3pLNhxRmA81/f6TSLiYCwHtbRw0Z3
	i+sbKTILCy9FaqbZqwES3E5GKR8lknAVco7MClV+Z6dLJaDxdyKaXwpUFStomNVV7tp+
	qGxz7jcw/r9or6uZ/A198tYS4Y6Ajqtz0dm//GgE9HhWgCQhlxHPFpCACry9VUF9CPu8
	spVEZEw/d9G8syBgooEz7BBGcM95HjCldIl/w4eDSJQ7mgECyfDZXN5yUoulOBtyRtkO
	ICOul1tvbeO/0LhmeUuFrzXmyGOGtFIc+x0VwY/1l1m/bJft+S080AhAISZOZ10VCrDc
	33Mg==
MIME-Version: 1.0
X-Received: by 10.194.2.51 with SMTP id 19mr46253760wjr.40.1440452374978; Mon,
	24 Aug 2015 14:39:34 -0700 (PDT)
Received: by 10.28.64.196 with HTTP; Mon, 24 Aug 2015 14:39:34 -0700 (PDT)
In-Reply-To: <CAMKF1sq1uQ1e7HGQkEn-u3Q_xTXR=4wb9PEksonfP02tKjEkNw@mail.gmail.com>
References: <1440438239-19765-1-git-send-email-raj.khem@gmail.com>
	<CA+chaQe97q6R9sXY0Fcc5sC1fF6AdkNqf+GS8qDwYyiyO=862g@mail.gmail.com>
	<CAMKF1sq1uQ1e7HGQkEn-u3Q_xTXR=4wb9PEksonfP02tKjEkNw@mail.gmail.com>
Date: Mon, 24 Aug 2015 23:39:34 +0200
Message-ID: <CA+chaQeiPNcWQ+DHByrdnYAG6tj0eW+r_zwfBVms5H_ZX6mHSw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-qt5][PATCH V2 1/4] qtbase: Fix build with clang
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
X-List-Received-Date: Mon, 24 Aug 2015 21:39:36 -0000
Content-Type: text/plain; charset=UTF-8

It's added in "shared" section of SRC_URI patches, so for consistency it
should be applied in nativesdk-qtbase as well :).

On Mon, Aug 24, 2015 at 10:25 PM, Khem Raj <raj.khem@gmail.com> wrote:

> On Mon, Aug 24, 2015 at 1:13 PM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
> > Is it needed for nativesdk-qtbase as well?
>
> one can still use clang-native to compile native packages, as of now I
> do not enable clang for native packages by default but its possible
> and for consistency, it will be better to have them in both native and
> target recipes
>
> >
> > On Mon, Aug 24, 2015 at 7:43 PM, Khem Raj <raj.khem@gmail.com> wrote:
> >
> >> This patch is a backport from upstream qt5 fixes building with clang
> >> from meta-clang
> >>
> >> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> ---
> >>  recipes-qt/qt5/qtbase-native_git.bb                |  1 +
> >>  .../qt5/qtbase/0015-Fix-build-with-clang-3.7.patch | 71
> >> ++++++++++++++++++++++
> >>  recipes-qt/qt5/qtbase_git.bb                       |  1 +
> >>  3 files changed, 73 insertions(+)
> >>  create mode 100644
> >> recipes-qt/qt5/qtbase/0015-Fix-build-with-clang-3.7.patch
> >>
> >> diff --git a/recipes-qt/qt5/qtbase-native_git.bb b/recipes-qt/qt5/
> >> qtbase-native_git.bb
> >> index ebd7280..1d09a19 100644
> >> --- a/recipes-qt/qt5/qtbase-native_git.bb
> >> +++ b/recipes-qt/qt5/qtbase-native_git.bb
> >> @@ -24,6 +24,7 @@ SRC_URI += "\
> >>
> >>  file://0005-qeglplatformintegration-Undefine-CursorShape-from-X..patch
> \
> >>
> >>  file://0006-configure-bump-path-length-from-256-to-512-character.patch
> \
> >>      file://0008-QOpenGLPaintDevice-sub-area-support.patch \
> >> +    file://0015-Fix-build-with-clang-3.7.patch \
> >>  "
> >>
> >>  # common for qtbase-native and nativesdk-qtbase
> >> diff --git a/recipes-qt/qt5/qtbase/0015-Fix-build-with-clang-3.7.patch
> >> b/recipes-qt/qt5/qtbase/0015-Fix-build-with-clang-3.7.patch
> >> new file mode 100644
> >> index 0000000..181d63c
> >> --- /dev/null
> >> +++ b/recipes-qt/qt5/qtbase/0015-Fix-build-with-clang-3.7.patch
> >> @@ -0,0 +1,71 @@
> >> +This is backport of https://codereview.qt-project.org/#/c/121545/
> >> +
> >> +From 6a6acc496728ce96198d27f9ddd44c2367758d42 Mon Sep 17 00:00:00 2001
> >> +From: Khem Raj <raj.khem@gmail.com>
> >> +Date: Sun, 23 Aug 2015 15:19:41 -0700
> >> +Subject: [PATCH] Fix build with clang 3.7
> >> +
> >> +Nullable is a language extension in clang 3.7 (indicating whether or
> >> +not a pointer can be null).
> >> +http://clang.llvm.org/docs/AttributeReference.html#nullable
> >> +Using it as a class name breaks building with this compiler
> >> +
> >>
> +/mnt/home/kraj/work/angstrom/build/tmp-angstrom-glibc/work/armv7at2hf-vfp-neon-angstrom-linux-gnueabi/qtbase/5.4.2+gitAUTOINC+2cb17c1fb9-r0/git/src/tools/qlalr/lalr.cpp:241:1:
> >> error: declaration of anonymous
> >> +      struct must be a definition
> >> +struct _Nullable: public std::unary_function<Name, bool>
> >> +^
> >>
> +/mnt/home/kraj/work/angstrom/build/tmp-angstrom-glibc/work/armv7at2hf-vfp-neon-angstrom-linux-gnueabi/qtbase/5.4.2+gitAUTOINC+2cb17c1fb9-r0/git/src/tools/qlalr/lalr.cpp:241:56:
> >> error: expected unqualified-id
> >> +struct _Nullable: public std::unary_function<Name, bool>
> >> +                                                       ^
> >>
> +/mnt/home/kraj/work/angstrom/build/tmp-angstrom-glibc/work/armv7at2hf-vfp-neon-angstrom-linux-gnueabi/qtbase/5.4.2+gitAUTOINC+2cb17c1fb9-r0/git/src/tools/qlalr/lalr.cpp:303:98:
> >> error: expected expression
> >> +          NameList::iterator nn = std::find_if (rule->rhs.begin (),
> >> rule->rhs.end (), std::not1 (_Nullable (this)));
> >> +
> >>                        ^
> >>
> +/mnt/home/kraj/work/angstrom/build/tmp-angstrom-glibc/work/armv7at2hf-vfp-neon-angstrom-linux-gnueabi/qtbase/5.4.2+gitAUTOINC+2cb17c1fb9-r0/git/src/tools/qlalr/lalr.cpp:638:107:
> >> error: expected expression
> >> +                  NameList::iterator first_not_nullable = std::find_if
> >> (dot, rule->rhs.end (), std::not1 (_Nullable (this)));
> >> +
> >>                                 ^
> >> +4 errors generated.
> >> +
> >> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> +---
> >> + src/tools/qlalr/lalr.cpp | 8 ++++----
> >> + 1 file changed, 4 insertions(+), 4 deletions(-)
> >> +
> >> +diff --git a/src/tools/qlalr/lalr.cpp b/src/tools/qlalr/lalr.cpp
> >> +index be1df7d..55ef056 100644
> >> +--- a/src/tools/qlalr/lalr.cpp
> >> ++++ b/src/tools/qlalr/lalr.cpp
> >> +@@ -238,11 +238,11 @@ void Grammar::buildExtendedGrammar ()
> >> +   non_terminals.insert (accept_symbol);
> >> + }
> >> +
> >> +-struct _Nullable: public std::unary_function<Name, bool>
> >> ++struct Nullable: public std::unary_function<Name, bool>
> >> + {
> >> +   Automaton *_M_automaton;
> >> +
> >> +-  _Nullable (Automaton *aut):
> >> ++  Nullable (Automaton *aut):
> >> +     _M_automaton (aut) {}
> >> +
> >> +   bool operator () (Name name) const
> >> +@@ -300,7 +300,7 @@ void Automaton::buildNullables ()
> >> +
> >> +       for (RulePointer rule = _M_grammar->rules.begin (); rule !=
> >> _M_grammar->rules.end (); ++rule)
> >> +         {
> >> +-          NameList::iterator nn = std::find_if (rule->rhs.begin (),
> >> rule->rhs.end (), std::not1 (_Nullable (this)));
> >> ++          NameList::iterator nn = std::find_if (rule->rhs.begin (),
> >> rule->rhs.end (), std::not1 (Nullable (this)));
> >> +
> >> +           if (nn == rule->rhs.end ())
> >> +             changed |= nullables.insert (rule->lhs).second;
> >> +@@ -635,7 +635,7 @@ void Automaton::buildIncludesDigraph ()
> >> +                   if (! _M_grammar->isNonTerminal (*A))
> >> +                     continue;
> >> +
> >> +-                  NameList::iterator first_not_nullable = std::find_if
> >> (dot, rule->rhs.end (), std::not1 (_Nullable (this)));
> >> ++                  NameList::iterator first_not_nullable = std::find_if
> >> (dot, rule->rhs.end (), std::not1 (Nullable (this)));
> >> +                   if (first_not_nullable != rule->rhs.end ())
> >> +                     continue;
> >> +
> >> +--
> >> +2.1.4
> >> +
> >> diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/
> qtbase_git.bb
> >> index f472c98..5603fb2 100644
> >> --- a/recipes-qt/qt5/qtbase_git.bb
> >> +++ b/recipes-qt/qt5/qtbase_git.bb
> >> @@ -18,6 +18,7 @@ SRC_URI += "\
> >>
> >>  file://0005-qeglplatformintegration-Undefine-CursorShape-from-X..patch
> \
> >>
> >>  file://0006-configure-bump-path-length-from-256-to-512-character.patch
> \
> >>      file://0008-QOpenGLPaintDevice-sub-area-support.patch \
> >> +    file://0015-Fix-build-with-clang-3.7.patch \
> >>  "
> >>
> >>  # specific for target qtbase
> >> --
> >> 2.1.4
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >>
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

