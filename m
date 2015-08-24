Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 6AB4076ABD
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Aug 2015 20:25:43 +0000 (UTC)
Received: by iods203 with SMTP id s203so162957401iod.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Aug 2015 13:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=DEvEdT8zFreUcSa1rToHE/nW8dKOnKcqQEgQWXcftFk=;
	b=i6uG7pb4+j2ZkEQRtAdwuIJbIdXV2I+oY4A6K8EJtDACWo9lnQdIGzqGiVYvKkRt10
	vBmy+U0sUQVaxU6sVamY9hcGV3FeaS9mL1DdLL0cIPel6sPlIZ0BSYNXkdncTQu1ubY7
	snPmudGj2dbZwuHkvlFOL/BL2Kn8jlEvxyJ58QJmJLFcG2Q/BE9ueAGc3NXztloS+m0z
	bxClqK6xVQy+U5Ycptk1aajRGNOodvl9eIWzn3JUmyHMFyM9R6otDW5dM7NPVRVnj0U2
	no4o/ttcnWatCmwEdaskUnu7aT362E6nwPdnQQ30jyytLWI3JtQt5NGOM0crR2D9KlL+
	Dqzw==
X-Received: by 10.107.14.203 with SMTP id 194mr24154611ioo.195.1440447944164; 
	Mon, 24 Aug 2015 13:25:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.3.135 with HTTP; Mon, 24 Aug 2015 13:25:14 -0700 (PDT)
In-Reply-To: <CA+chaQe97q6R9sXY0Fcc5sC1fF6AdkNqf+GS8qDwYyiyO=862g@mail.gmail.com>
References: <1440438239-19765-1-git-send-email-raj.khem@gmail.com>
	<CA+chaQe97q6R9sXY0Fcc5sC1fF6AdkNqf+GS8qDwYyiyO=862g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 24 Aug 2015 13:25:14 -0700
Message-ID: <CAMKF1sq1uQ1e7HGQkEn-u3Q_xTXR=4wb9PEksonfP02tKjEkNw@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Mon, 24 Aug 2015 20:25:44 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 24, 2015 at 1:13 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> Is it needed for nativesdk-qtbase as well?

one can still use clang-native to compile native packages, as of now I
do not enable clang for native packages by default but its possible
and for consistency, it will be better to have them in both native and
target recipes

>
> On Mon, Aug 24, 2015 at 7:43 PM, Khem Raj <raj.khem@gmail.com> wrote:
>
>> This patch is a backport from upstream qt5 fixes building with clang
>> from meta-clang
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  recipes-qt/qt5/qtbase-native_git.bb                |  1 +
>>  .../qt5/qtbase/0015-Fix-build-with-clang-3.7.patch | 71
>> ++++++++++++++++++++++
>>  recipes-qt/qt5/qtbase_git.bb                       |  1 +
>>  3 files changed, 73 insertions(+)
>>  create mode 100644
>> recipes-qt/qt5/qtbase/0015-Fix-build-with-clang-3.7.patch
>>
>> diff --git a/recipes-qt/qt5/qtbase-native_git.bb b/recipes-qt/qt5/
>> qtbase-native_git.bb
>> index ebd7280..1d09a19 100644
>> --- a/recipes-qt/qt5/qtbase-native_git.bb
>> +++ b/recipes-qt/qt5/qtbase-native_git.bb
>> @@ -24,6 +24,7 @@ SRC_URI += "\
>>
>>  file://0005-qeglplatformintegration-Undefine-CursorShape-from-X..patch \
>>
>>  file://0006-configure-bump-path-length-from-256-to-512-character.patch \
>>      file://0008-QOpenGLPaintDevice-sub-area-support.patch \
>> +    file://0015-Fix-build-with-clang-3.7.patch \
>>  "
>>
>>  # common for qtbase-native and nativesdk-qtbase
>> diff --git a/recipes-qt/qt5/qtbase/0015-Fix-build-with-clang-3.7.patch
>> b/recipes-qt/qt5/qtbase/0015-Fix-build-with-clang-3.7.patch
>> new file mode 100644
>> index 0000000..181d63c
>> --- /dev/null
>> +++ b/recipes-qt/qt5/qtbase/0015-Fix-build-with-clang-3.7.patch
>> @@ -0,0 +1,71 @@
>> +This is backport of https://codereview.qt-project.org/#/c/121545/
>> +
>> +From 6a6acc496728ce96198d27f9ddd44c2367758d42 Mon Sep 17 00:00:00 2001
>> +From: Khem Raj <raj.khem@gmail.com>
>> +Date: Sun, 23 Aug 2015 15:19:41 -0700
>> +Subject: [PATCH] Fix build with clang 3.7
>> +
>> +Nullable is a language extension in clang 3.7 (indicating whether or
>> +not a pointer can be null).
>> +http://clang.llvm.org/docs/AttributeReference.html#nullable
>> +Using it as a class name breaks building with this compiler
>> +
>> +/mnt/home/kraj/work/angstrom/build/tmp-angstrom-glibc/work/armv7at2hf-vfp-neon-angstrom-linux-gnueabi/qtbase/5.4.2+gitAUTOINC+2cb17c1fb9-r0/git/src/tools/qlalr/lalr.cpp:241:1:
>> error: declaration of anonymous
>> +      struct must be a definition
>> +struct _Nullable: public std::unary_function<Name, bool>
>> +^
>> +/mnt/home/kraj/work/angstrom/build/tmp-angstrom-glibc/work/armv7at2hf-vfp-neon-angstrom-linux-gnueabi/qtbase/5.4.2+gitAUTOINC+2cb17c1fb9-r0/git/src/tools/qlalr/lalr.cpp:241:56:
>> error: expected unqualified-id
>> +struct _Nullable: public std::unary_function<Name, bool>
>> +                                                       ^
>> +/mnt/home/kraj/work/angstrom/build/tmp-angstrom-glibc/work/armv7at2hf-vfp-neon-angstrom-linux-gnueabi/qtbase/5.4.2+gitAUTOINC+2cb17c1fb9-r0/git/src/tools/qlalr/lalr.cpp:303:98:
>> error: expected expression
>> +          NameList::iterator nn = std::find_if (rule->rhs.begin (),
>> rule->rhs.end (), std::not1 (_Nullable (this)));
>> +
>>                        ^
>> +/mnt/home/kraj/work/angstrom/build/tmp-angstrom-glibc/work/armv7at2hf-vfp-neon-angstrom-linux-gnueabi/qtbase/5.4.2+gitAUTOINC+2cb17c1fb9-r0/git/src/tools/qlalr/lalr.cpp:638:107:
>> error: expected expression
>> +                  NameList::iterator first_not_nullable = std::find_if
>> (dot, rule->rhs.end (), std::not1 (_Nullable (this)));
>> +
>>                                 ^
>> +4 errors generated.
>> +
>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> +---
>> + src/tools/qlalr/lalr.cpp | 8 ++++----
>> + 1 file changed, 4 insertions(+), 4 deletions(-)
>> +
>> +diff --git a/src/tools/qlalr/lalr.cpp b/src/tools/qlalr/lalr.cpp
>> +index be1df7d..55ef056 100644
>> +--- a/src/tools/qlalr/lalr.cpp
>> ++++ b/src/tools/qlalr/lalr.cpp
>> +@@ -238,11 +238,11 @@ void Grammar::buildExtendedGrammar ()
>> +   non_terminals.insert (accept_symbol);
>> + }
>> +
>> +-struct _Nullable: public std::unary_function<Name, bool>
>> ++struct Nullable: public std::unary_function<Name, bool>
>> + {
>> +   Automaton *_M_automaton;
>> +
>> +-  _Nullable (Automaton *aut):
>> ++  Nullable (Automaton *aut):
>> +     _M_automaton (aut) {}
>> +
>> +   bool operator () (Name name) const
>> +@@ -300,7 +300,7 @@ void Automaton::buildNullables ()
>> +
>> +       for (RulePointer rule = _M_grammar->rules.begin (); rule !=
>> _M_grammar->rules.end (); ++rule)
>> +         {
>> +-          NameList::iterator nn = std::find_if (rule->rhs.begin (),
>> rule->rhs.end (), std::not1 (_Nullable (this)));
>> ++          NameList::iterator nn = std::find_if (rule->rhs.begin (),
>> rule->rhs.end (), std::not1 (Nullable (this)));
>> +
>> +           if (nn == rule->rhs.end ())
>> +             changed |= nullables.insert (rule->lhs).second;
>> +@@ -635,7 +635,7 @@ void Automaton::buildIncludesDigraph ()
>> +                   if (! _M_grammar->isNonTerminal (*A))
>> +                     continue;
>> +
>> +-                  NameList::iterator first_not_nullable = std::find_if
>> (dot, rule->rhs.end (), std::not1 (_Nullable (this)));
>> ++                  NameList::iterator first_not_nullable = std::find_if
>> (dot, rule->rhs.end (), std::not1 (Nullable (this)));
>> +                   if (first_not_nullable != rule->rhs.end ())
>> +                     continue;
>> +
>> +--
>> +2.1.4
>> +
>> diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
>> index f472c98..5603fb2 100644
>> --- a/recipes-qt/qt5/qtbase_git.bb
>> +++ b/recipes-qt/qt5/qtbase_git.bb
>> @@ -18,6 +18,7 @@ SRC_URI += "\
>>
>>  file://0005-qeglplatformintegration-Undefine-CursorShape-from-X..patch \
>>
>>  file://0006-configure-bump-path-length-from-256-to-512-character.patch \
>>      file://0008-QOpenGLPaintDevice-sub-area-support.patch \
>> +    file://0015-Fix-build-with-clang-3.7.patch \
>>  "
>>
>>  # specific for target qtbase
>> --
>> 2.1.4
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

