Return-Path: <martin.jansa@gmail.com>
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by mail.openembedded.org (Postfix) with ESMTP id 27C6D7D251
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Jun 2019 18:23:31 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id c26so27154079edt.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Jun 2019 11:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=45yTzxKVsJSrNQ9Ee+YZ4bF3Cofb4C1owIgFrRwYfO8=;
	b=J3eXnj45SaDfJrSwG/Pi3AZNfabS6gNnxRr+DxvfHHA2jjgwWzTXZ+pFrtA/A+JTTR
	RY2+f5XKBdLmcs/30eTJNUihaavDsILeqn+7m6UR9bsn4+aV1dL4L2p/NwPZNumaBmiD
	lUSyyQ8xMhARRDTsQWPUh4ABpP4vI/I97Riy1fvoVZ0szDzBtB7olYeOtxyzPG2xurXt
	8QZr8SP6RO6LPbk7Z69/xi+Y/53/qzEBtXxvzCOzZkqf68giviR9Zq1z5BNP89yGr1R6
	3TJNA8XYvTo41FvKLS1byzlap6/F5ZR6C3H6I1OYX4elRb6Ec8WyCpsaTkc43eeOeXll
	NPww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=45yTzxKVsJSrNQ9Ee+YZ4bF3Cofb4C1owIgFrRwYfO8=;
	b=lEI5CBPiBZ9dSIIVVCArr2FGCdAOTREaBYi2yvWRU76DgSVgyDobXZ7U0J9PFSwl9x
	uQIl2o4ZAAuU/2bpGYHsndZ2wS/XDyJ6Zez2BcUzD4VkZmURyN56YTJCPjclzs70PtNo
	7C+nZdqNlKSDU09odN1jX9MublZ7XQtXO87dZumGUt+eI1SjBScNOXo4R4lE3+AEzDXs
	bPlBhw24Viqe1DmqGY8O8jKQO0nwA3jHAF9PFG3dFv2T9wkecE3MX5ppsNpA8YnoI7Ca
	vQYGMzOplVSmFiqoSKwnYUwDrUsnMC/VlBAoVh9Jr9gOTcfpaAeOoeJ4u52T3lJlPGYa
	1psQ==
X-Gm-Message-State: APjAAAXzePrH4fOn73TGOLY0o1cguQsWes2mOmuLBjCvU3VFuYOAlES5
	JYRfiZHG+ueReGy9Fvgpq1Ja44+H11PswJtbq1A=
X-Google-Smtp-Source: APXvYqweFDAieWOoZofkKhXxrCsh6QlyTfVQemoGpHc+XguhSmFZ/DjQyfd4LcCJXdSuKJw8anq00idodrzHk/xYJss=
X-Received: by 2002:a17:906:a59:: with SMTP id
	x25mr28386726ejf.293.1560363811712; 
	Wed, 12 Jun 2019 11:23:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190606065308.23766-1-pascal.bach@siemens.com>
	<20190611153848.30239-1-pascal.bach@siemens.com>
	<20190611153848.30239-3-pascal.bach@siemens.com>
In-Reply-To: <20190611153848.30239-3-pascal.bach@siemens.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 12 Jun 2019 20:23:23 +0200
Message-ID: <CA+chaQeChtWCd3nnzMxy9OO0xbiwaPyM7kG=nf2JnnbcNeY3TQ@mail.gmail.com>
To: Pascal Bach <pascal.bach@siemens.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCHv3 2/2] protobuf-c: add patch for protobuf 3 compatibility
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 12 Jun 2019 18:23:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

It's not caused by this change, but if you're using protobuf-c aren't you
seeing random build failures due to race-condition between generated
test-full.pb.h and cxx-generate-packed-data.cc ?

I've rebuilt protobuf-c-native 100 times in 32 core system and got 4 failed
builds, each with slightly different errors (only first 5 shown for each):

BUILD-40/work/x86_64-linux/protobuf-c-native/1.3.1+gitAUTOINC+269771b4b4-r0=
/temp/log.do_compile
../git/t/generated-code2/cxx-generate-packed-data.cc:28:17: error: =E2=80=
=98foo=E2=80=99 is
not a namespace-name
../git/t/generated-code2/cxx-generate-packed-data.cc:28:20: error: expected
namespace-name before =E2=80=98;=E2=80=99 token
../git/t/generated-code2/cxx-generate-packed-data.cc:31:36: error:
=E2=80=98TestEnumSmall=E2=80=99 does not name a type
../git/t/generated-code2/cxx-generate-packed-data.cc:31:36: error:
=E2=80=98TestEnumSmall=E2=80=99 does not name a type
../git/t/generated-code2/cxx-generate-packed-data.cc:31:36: error:
=E2=80=98TestEnumSmall=E2=80=99 does not name a type

BUILD-76/work/x86_64-linux/protobuf-c-native/1.3.1+gitAUTOINC+269771b4b4-r0=
/temp/log.do_compile
./t/test-full.pb.h:4:0: error: unterminated #ifndef
/usr/include/inttypes.h:266:1: error: expected initializer before =E2=80=98=
extern=E2=80=99
../git/t/generated-code2/cxx-generate-packed-data.cc:1169:1: error:
expected =E2=80=98}=E2=80=99 at end of input

BUILD-85/work/x86_64-linux/protobuf-c-native/1.3.1+gitAUTOINC+269771b4b4-r0=
/temp/log.do_compile
./t/test-full.pb.h:4:0: error: unterminated #ifndef
/usr/include/inttypes.h:266:1: error: expected =E2=80=98)=E2=80=99 before =
=E2=80=98extern=E2=80=99
../git/t/generated-code2/cxx-generate-packed-data.cc:42:1: error: a
function-definition is not allowed here before =E2=80=98{=E2=80=99 token
../git/t/generated-code2/cxx-generate-packed-data.cc:64:1: error: a
function-definition is not allowed here before =E2=80=98{=E2=80=99 token
../git/t/generated-code2/cxx-generate-packed-data.cc:70:1: error: a
function-definition is not allowed here before =E2=80=98{=E2=80=99 token

BUILD-86/work/x86_64-linux/protobuf-c-native/1.3.1+gitAUTOINC+269771b4b4-r0=
/temp/log.do_compile
./t/test-full.pb.h:4:0: error: unterminated #ifndef
./t/test-full.pb.h:21888:15: error: =E2=80=98s=E2=80=99 in namespace =E2=80=
=98std=E2=80=99 does not name a
type
../git/t/generated-code2/cxx-generate-packed-data.cc:1169:1: error:
expected =E2=80=98}=E2=80=99 at end of input

It was supposed to be fixed with;
https://github.com/protobuf-c/protobuf-c/commit/b0bb56303366e2c072ee38eb5f1=
f11251b07239c
but the fix either doesn't work at all or is actually causing this (I
haven't seen these failures with older protobuf-c-native).

Maybe we should switch from autotools to CMake when building protobuf-c.

There is also PR with meson support:
https://github.com/protobuf-c/protobuf-c/pull/340

If you're not really interested in protobuf-c-native then you can ignore
this, it's not caused by your change - I wasn't trying to hijack this
thread and block your change.

Cheers,

On Tue, Jun 11, 2019 at 5:39 PM Pascal Bach <pascal.bach@siemens.com> wrote=
:

> There is no release yet of protobuf-c that is compatible with protobuf 3.
> Master is already patched so this is just a straight backport of this
> patch.
>
> Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
> ---
>  .../protobuf-c/protobuf3-compatibility.patch       | 55
> ++++++++++++++++++++++
>  .../recipes-devtools/protobuf/protobuf-c_1.3.1.bb  |  4 +-
>  2 files changed, 58 insertions(+), 1 deletion(-)
>  create mode 100644
> meta-oe/recipes-devtools/protobuf/protobuf-c/protobuf3-compatibility.patc=
h
>
> diff --git
> a/meta-oe/recipes-devtools/protobuf/protobuf-c/protobuf3-compatibility.pa=
tch
> b/meta-oe/recipes-devtools/protobuf/protobuf-c/protobuf3-compatibility.pa=
tch
> new file mode 100644
> index 000000000..35914952d
> --- /dev/null
> +++
> b/meta-oe/recipes-devtools/protobuf/protobuf-c/protobuf3-compatibility.pa=
tch
> @@ -0,0 +1,55 @@
> +From 7456d1621223d425b8a3fd74e435a79c046169fb Mon Sep 17 00:00:00 2001
> +From: Robert Edmonds <edmonds@users.noreply.github.com>
> +Date: Wed, 10 Apr 2019 20:47:48 -0400
> +Subject: [PATCH] t/generated-code2/cxx-generate-packed-data.cc: Fix buil=
d
> + failure on newer protobuf
> +
> + Upstream-Status: Backport [
> https://github.com/protobuf-c/protobuf-c/pull/369]
> +
> +google::protobuf::Message::Reflection has been removed in newer versions
> +of protobuf. The replacement is google::protobuf::Reflection.
> +
> +protobuf in commit 779f61c6a3ce02a119e28e802f229e61b69b9046 ("Integrate
> +recent changes from google3.", from August 2008) changed the following
> +in message.h:
> +
> +    @@ -336,7 +337,8 @@ class LIBPROTOBUF_EXPORT Message {
> +
> +       // Introspection
> ---------------------------------------------------
> +
> +    -  class Reflection;  // Defined below.
> +    +  // Typedef for backwards-compatibility.
> +    +  typedef google::protobuf::Reflection Reflection;
> +
> +The "typedef for backwards-compatibility" apparently lasted ten years
> +until protobuf commit 6bbe197e9c1b6fc38cbdc45e3bf83fa7ced792a3
> +("Down-integrate from google3.", from August 2018) which finally removed
> +the typedef:
> +
> +    @@ -327,8 +344,6 @@ class LIBPROTOBUF_EXPORT Message : public
> MessageLite {
> +
> +       // Introspection
> ---------------------------------------------------
> +
> +    -  // Typedef for backwards-compatibility.
> +    -  typedef google::protobuf::Reflection Reflection;
> +
> +This commit updates the only use of this typedef (in the test suite) to
> +directly refer to the replacement, google::protobuf::Reflection. This
> +fixes the build failure in the test suite.
> +---
> + t/generated-code2/cxx-generate-packed-data.cc | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/t/generated-code2/cxx-generate-packed-data.cc
> b/t/generated-code2/cxx-generate-packed-data.cc
> +index 4fd3e25..0865d2e 100644
> +--- a/t/generated-code2/cxx-generate-packed-data.cc
> ++++ b/t/generated-code2/cxx-generate-packed-data.cc
> +@@ -998,7 +998,7 @@ static void dump_test_packed_repeated_enum (void)
> + static void dump_test_unknown_fields (void)
> + {
> +   EmptyMess mess;
> +-  const google::protobuf::Message::Reflection *reflection =3D
> mess.GetReflection();
> ++  const google::protobuf::Reflection *reflection =3D mess.GetReflection=
();
> +   google::protobuf::UnknownFieldSet *fs =3D
> reflection->MutableUnknownFields(&mess);
> +
> + #if GOOGLE_PROTOBUF_VERSION >=3D 2001000
> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.1.bb
> b/meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.1.bb
> index 7ef030092..1d1782306 100644
> --- a/meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.1.bb
> +++ b/meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.1.bb
> @@ -15,7 +15,9 @@ DEPENDS =3D "protobuf-native protobuf"
>  PV .=3D "+git${SRCPV}"
>  SRCREV =3D "269771b4b45d3aba04e59569f53600003db8d9ff"
>
> -SRC_URI =3D "git://github.com/protobuf-c/protobuf-c.git"
> +SRC_URI =3D "git://github.com/protobuf-c/protobuf-c.git \
> +           file://protobuf3-compatibility.patch \
> +          "
>
>  S =3D "${WORKDIR}/git"
>
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

