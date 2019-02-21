Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
	[209.85.160.178])
	by mail.openembedded.org (Postfix) with ESMTP id 09D057CBB8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Feb 2019 15:14:07 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id v10so31844408qtp.8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Feb 2019 07:14:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=5W8WTndD6IsNfrfY8WBq8CYC5DLHP2TnY8FK5yDciHQ=;
	b=Ya/XDlVAOHNjQKcPXCwpEQ7ec+ACUGIDwKSgyaepDwQUXZXlEvNV7CpFJQvfAW6cOb
	MNbczgvqqdw0FGB5/s2suBD8npoMxQL1uFuRhLzAPEUSY31oeJOmypkxDzWhTPD3/HIH
	bnnqHE9UsvQsFYEHEcdiQohE/ftu60HJQMcQkg4Tl7xnni8Y43FV5/vAbPHvWkI4EFh/
	YDXG2JMTbE9/7lf2qO3/DlljzjLmxE9M5ODhWpWIdShFZcvCiMdU7BQKytVjgQPPaBds
	Kk5uz9inOXD9BT/2aA7IU3iKZ2YvEwAwbFvqQSbCNg+bMf+Zws71Tl3TCuvAe50Cbo+e
	zmgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=5W8WTndD6IsNfrfY8WBq8CYC5DLHP2TnY8FK5yDciHQ=;
	b=YQVi+zB4LUh3XmhssQekzl1vxK1s6FXKGzjiHQnpoJDaoT5ulfBsbjmzYiSJBSc+S1
	rfcKZiZNMC9lG+VYm/XuOVQ3t8ZD3wtyftinZkokNou+qKMD2ujXBNEc6IOyh2gutc7t
	EjutxCJuFD2I+J1IaCGINSfl3BJWlh10EpW8k7UTACujn04bVNdqztLF9Kq34D+NFFgn
	mgAGPnqHwb6JUs/8dfcJRg56MUrMo2bcikoyJrHdv3N7qJ0D6+t8Ejmb2wpxbO1PQisb
	cy68ZgNmPwEgX/iW1otDUm/VFBRV6ARVrXhBvpBEzA09ChQoB8+8tSTWaN4BPne2/tx4
	bKSA==
X-Gm-Message-State: AHQUAub2srd+PtP0imo9NLkLUFsocrD1kPEYfzi7NNCAZVHdXyvmKUTK
	3gKMvCNNgRcFpTjGl9EEQ/mnnJh5NMylmZdvvpA=
X-Google-Smtp-Source: AHgI3Ia9nKPr747S32VqvLgPNwpAqomexoeFT0VGC+K9xlFwPh2g10DP0yQBoM4bq+faRyzX+O+2zEbC5TUpUNJEIUc=
X-Received: by 2002:a0c:d80f:: with SMTP id h15mr30247838qvj.228.1550762048478;
	Thu, 21 Feb 2019 07:14:08 -0800 (PST)
MIME-Version: 1.0
References: <20190214145313.5406-1-andrej.valek@siemens.com>
	<20190217110321.10280-1-andrej.valek@siemens.com>
In-Reply-To: <20190217110321.10280-1-andrej.valek@siemens.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 21 Feb 2019 07:13:42 -0800
Message-ID: <CAMKF1soaeDseZTY8TuVa6tFz+0iUnThkADC7_9uTgMUHMCuWeA@mail.gmail.com>
To: Andrej Valek <andrej.valek@siemens.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v4] nodejs 8.15.0 -> 10.15.1
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
X-List-Received-Date: Thu, 21 Feb 2019 15:14:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Andrej

It still fails with gcc 4.8/ubuntu-14.04 native

https://errors.yoctoproject.org/Errors/Details/229576/

../src/inspector_agent.cc: In member function =E2=80=98int
node::inspector::NodeInspectorClient::connectFrontend(std::unique_ptr<node:=
:inspector::InspectorSessionDelegate>,
bool)=E2=80=99:
../src/inspector_agent.cc:479:9: error: =E2=80=98make_unique=E2=80=99 is no=
t a member of =E2=80=98std=E2=80=99
         std::make_unique<ChannelImpl>(env_, client_, getWorkerManager(),
         ^
../src/inspector_agent.cc:479:37: error: expected primary-expression
before =E2=80=98>=E2=80=99 token
         std::make_unique<ChannelImpl>(env_, client_, getWorkerManager(),
                                     ^
../src/inspector_agent.cc:479:45: warning: left operand of comma
operator has no effect [-Wunused-value]
         std::make_unique<ChannelImpl>(env_, client_, getWorkerManager(),
                                             ^
../src/inspector_agent.cc:479:71: warning: right operand of comma
operator has no effect [-Wunused-value]
         std::make_unique<ChannelImpl>(env_, client_, getWorkerManager(),
                                                                       ^

can you see if there is a way out ?

On Sun, Feb 17, 2019 at 3:04 AM Andrej Valek <andrej.valek@siemens.com> wro=
te:
>
> Update nodejs to active 10.x LTS release 10.15.1.
> - link atomic library
> - make it compatible with gcc < 4.9
>
> Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> ---
>  ...isable-running-gyp-files-for-bundled-deps.patch |  23 ++--
>  .../nodejs/nodejs/0002-Using-native-torque.patch   |  36 ++++++
>  ...3-Crypto-reduce-memory-usage-of-SignFinal.patch | 122 +++++++++++++++=
++++++
>  .../0004-Make-compatibility-with-gcc-4.8.patch     |  26 +++++
>  .../nodejs/nodejs/0005-Link-atomic-library.patch   |  20 ++++
>  .../nodejs/{nodejs_8.15.0.bb =3D> nodejs_10.15.1.bb} |  20 +++-
>  6 files changed, 230 insertions(+), 17 deletions(-)
>  create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0002-Using-nat=
ive-torque.patch
>  create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0003-Crypto-re=
duce-memory-usage-of-SignFinal.patch
>  create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0004-Make-comp=
atibility-with-gcc-4.8.patch
>  create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0005-Link-atom=
ic-library.patch
>  rename meta-oe/recipes-devtools/nodejs/{nodejs_8.15.0.bb =3D> nodejs_10.=
15.1.bb} (83%)
>
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0001-Disable-running-=
gyp-files-for-bundled-deps.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0=
001-Disable-running-gyp-files-for-bundled-deps.patch
> index 324a4683d..5d0dc03b6 100644
> --- a/meta-oe/recipes-devtools/nodejs/nodejs/0001-Disable-running-gyp-fil=
es-for-bundled-deps.patch
> +++ b/meta-oe/recipes-devtools/nodejs/nodejs/0001-Disable-running-gyp-fil=
es-for-bundled-deps.patch
> @@ -4,26 +4,23 @@ Date: Thu, 27 Apr 2017 14:25:42 +0200
>  Subject: [PATCH] Disable running gyp on shared deps
>
>  ---
> - Makefile | 7 +++----
> - 1 file changed, 3 insertions(+), 4 deletions(-)
> + Makefile | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
>
>  diff --git a/Makefile b/Makefile
> -index 0a217bd893..e1229ad07f 100644
> +index a98772f..f5663e2 100644
>  --- a/Makefile
>  +++ b/Makefile
> -@@ -79,10 +79,9 @@ $(NODE_G_EXE): config.gypi out/Makefile
> -       $(MAKE) -C out BUILDTYPE=3DDebug V=3D$(V)
> -       if [ ! -r $@ -o ! -L $@ ]; then ln -fs out/Debug/$(NODE_EXE) $@; =
fi
> +@@ -123,8 +123,8 @@ with-code-cache:
> + test-code-cache: with-code-cache
> +       $(PYTHON) tools/test.py $(PARALLEL_ARGS) --mode=3D$(BUILDTYPE_LOW=
ER) code-cache
>
>  -out/Makefile: common.gypi deps/uv/uv.gyp deps/http_parser/http_parser.g=
yp \
>  -              deps/zlib/zlib.gyp deps/v8/gypfiles/toolchain.gypi \
> --              deps/v8/gypfiles/features.gypi deps/v8/src/v8.gyp node.gy=
p \
> --              config.gypi
>  +out/Makefile: common.gypi deps/http_parser/http_parser.gyp \
> -+              deps/v8/gypfiles/toolchain.gypi deps/v8/gypfiles/features=
.gypi \
> -+                        deps/v8/src/v8.gyp node.gyp config.gypi
> ++              deps/v8/gypfiles/toolchain.gypi \
> +               deps/v8/gypfiles/features.gypi deps/v8/gypfiles/v8.gyp no=
de.gyp \
> +               config.gypi
>         $(PYTHON) tools/gyp_node.py -f make
> -
> - config.gypi: configure
>  --
> -2.12.2
> +2.19.2
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0002-Using-native-tor=
que.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0002-Using-native-torque=
.patch
> new file mode 100644
> index 000000000..e9035f9eb
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/nodejs/nodejs/0002-Using-native-torque.pat=
ch
> @@ -0,0 +1,36 @@
> +From 4bbee5e3d58bc4911999f3ec2cc5aab8ded6717b Mon Sep 17 00:00:00 2001
> +From: "Winker Matthias (TT-CA/ENG1)" <Matthias.Winker@de.bosch.com>
> +Date: Tue, 11 Dec 2018 10:44:29 +0100
> +Subject: [PATCH] Using native torque
> +
> +---
> + deps/v8/gypfiles/v8.gyp | 6 ++++--
> + 1 file changed, 4 insertions(+), 2 deletions(-)
> +
> +diff --git a/deps/v8/gypfiles/v8.gyp b/deps/v8/gypfiles/v8.gyp
> +index 8c78f02255..434168844e 100644
> +--- a/deps/v8/gypfiles/v8.gyp
> ++++ b/deps/v8/gypfiles/v8.gyp
> +@@ -2831,7 +2831,6 @@
> +         {
> +           'action_name': 'run_torque',
> +           'inputs': [  # Order matters.
> +-            '<(PRODUCT_DIR)/<(EXECUTABLE_PREFIX)torque<(EXECUTABLE_SUFF=
IX)',
> +             '../src/builtins/base.tq',
> +             '../src/builtins/array.tq',
> +             '../src/builtins/typed-array.tq',
> +@@ -2845,7 +2844,10 @@
> +             '<(SHARED_INTERMEDIATE_DIR)/torque-generated/builtins-typed=
-array-from-dsl-gen.cc',
> +             '<(SHARED_INTERMEDIATE_DIR)/torque-generated/builtins-typed=
-array-from-dsl-gen.h',
> +           ],
> +-          'action': ['<@(_inputs)', '-o', '<(SHARED_INTERMEDIATE_DIR)/t=
orque-generated'],
> ++          'action': [
> ++            'torque',
> ++            '<@(_inputs)',
> ++            '-o', '<(SHARED_INTERMEDIATE_DIR)/torque-generated'],
> +         },
> +       ],
> +     }, # torque
> +--
> +2.19.2
> +
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0003-Crypto-reduce-me=
mory-usage-of-SignFinal.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0003=
-Crypto-reduce-memory-usage-of-SignFinal.patch
> new file mode 100644
> index 000000000..ed3bac39b
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/nodejs/nodejs/0003-Crypto-reduce-memory-us=
age-of-SignFinal.patch
> @@ -0,0 +1,122 @@
> +From 20282b1cb0389553421c4c5b14de198c5dfff50b Mon Sep 17 00:00:00 2001
> +From: Anna Henningsen <anna@addaleax.net>
> +Date: Sat, 20 Oct 2018 05:24:54 +0200
> +Subject: [PATCH] src: use more explicit return type in Sign::SignFinal()
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Using the non-indexed variant of `std::get<>` broke Travis CI.
> +Also, this allows us to be a bit more concise when returning
> +from `SignFinal()` due to some error condition.
> +
> +Refs: https://github.com/nodejs/node/pull/23427
> +
> +PR-URL: https://github.com/nodejs/node/pull/23779
> +Reviewed-By: Joyee Cheung <joyeec9h3@gmail.com>
> +Reviewed-By: Tobias Nie=C3=9Fen <tniessen@tnie.de>
> +Reviewed-By: Refael Ackermann <refack@gmail.com>
> +Reviewed-By: Colin Ihrig <cjihrig@gmail.com>
> +---
> + src/node_crypto.cc | 23 +++++++++++------------
> + src/node_crypto.h  | 12 +++++++++++-
> + 2 files changed, 22 insertions(+), 13 deletions(-)
> +
> +diff --git a/src/node_crypto.cc b/src/node_crypto.cc
> +index bd8d9e032554..ec7d4f2bb5be 100644
> +--- a/src/node_crypto.cc
> ++++ b/src/node_crypto.cc
> +@@ -3562,22 +3562,20 @@ static MallocedBuffer<unsigned char> Node_SignFi=
nal(EVPMDPointer&& mdctx,
> +   return MallocedBuffer<unsigned char>();
> + }
> +
> +-std::pair<SignBase::Error, MallocedBuffer<unsigned char>> Sign::SignFin=
al(
> ++Sign::SignResult Sign::SignFinal(
> +     const char* key_pem,
> +     int key_pem_len,
> +     const char* passphrase,
> +     int padding,
> +     int salt_len) {
> +-  MallocedBuffer<unsigned char> buffer;
> +-
> +   if (!mdctx_)
> +-    return std::make_pair(kSignNotInitialised, std::move(buffer));
> ++    return SignResult(kSignNotInitialised);
> +
> +   EVPMDPointer mdctx =3D std::move(mdctx_);
> +
> +   BIOPointer bp(BIO_new_mem_buf(const_cast<char*>(key_pem), key_pem_len=
));
> +   if (!bp)
> +-    return std::make_pair(kSignPrivateKey, std::move(buffer));
> ++    return SignResult(kSignPrivateKey);
> +
> +   EVPKeyPointer pkey(PEM_read_bio_PrivateKey(bp.get(),
> +                                              nullptr,
> +@@ -3588,7 +3586,7 @@ std::pair<SignBase::Error, MallocedBuffer<unsigned=
 char>> Sign::SignFinal(
> +   // without `pkey` being set to nullptr;
> +   // cf. the test of `test_bad_rsa_privkey.pem` for an example.
> +   if (!pkey || 0 !=3D ERR_peek_error())
> +-    return std::make_pair(kSignPrivateKey, std::move(buffer));
> ++    return SignResult(kSignPrivateKey);
> +
> + #ifdef NODE_FIPS_MODE
> +   /* Validate DSA2 parameters from FIPS 186-4 */
> +@@ -3612,9 +3610,10 @@ std::pair<SignBase::Error, MallocedBuffer<unsigne=
d char>> Sign::SignFinal(
> +   }
> + #endif  // NODE_FIPS_MODE
> +
> +-  buffer =3D Node_SignFinal(std::move(mdctx), pkey, padding, salt_len);
> ++  MallocedBuffer<unsigned char> buffer =3D
> ++      Node_SignFinal(std::move(mdctx), pkey, padding, salt_len);
> +   Error error =3D buffer.is_empty() ? kSignPrivateKey : kSignOk;
> +-  return std::make_pair(error, std::move(buffer));
> ++  return SignResult(error, std::move(buffer));
> + }
> +
> +
> +@@ -3639,18 +3638,18 @@ void Sign::SignFinal(const FunctionCallbackInfo<=
Value>& args) {
> +
> +   ClearErrorOnReturn clear_error_on_return;
> +
> +-  std::pair<Error, MallocedBuffer<unsigned char>> ret =3D sign->SignFin=
al(
> ++  SignResult ret =3D sign->SignFinal(
> +       buf,
> +       buf_len,
> +       len >=3D 2 && !args[1]->IsNull() ? *passphrase : nullptr,
> +       padding,
> +       salt_len);
> +
> +-  if (std::get<Error>(ret) !=3D kSignOk)
> +-    return sign->CheckThrow(std::get<Error>(ret));
> ++  if (ret.error !=3D kSignOk)
> ++    return sign->CheckThrow(ret.error);
> +
> +   MallocedBuffer<unsigned char> sig =3D
> +-      std::move(std::get<MallocedBuffer<unsigned char>>(ret));
> ++      std::move(ret.signature);
> +
> +   Local<Object> rc =3D
> +       Buffer::New(env, reinterpret_cast<char*>(sig.release()), sig.size=
)
> +diff --git a/src/node_crypto.h b/src/node_crypto.h
> +index 6fcf737f6c43..0c26c1f6ff1d 100644
> +--- a/src/node_crypto.h
> ++++ b/src/node_crypto.h
> +@@ -518,7 +518,17 @@ class Sign : public SignBase {
> +  public:
> +   static void Initialize(Environment* env, v8::Local<v8::Object> target=
);
> +
> +-  std::pair<Error, MallocedBuffer<unsigned char>> SignFinal(
> ++  struct SignResult {
> ++    Error error;
> ++    MallocedBuffer<unsigned char> signature;
> ++
> ++    explicit SignResult(
> ++        Error err,
> ++        MallocedBuffer<unsigned char>&& sig =3D MallocedBuffer<unsigned=
 char>())
> ++      : error(err), signature(std::move(sig)) {}
> ++  };
> ++
> ++  SignResult SignFinal(
> +       const char* key_pem,
> +       int key_pem_len,
> +       const char* passphrase,
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0004-Make-compatibili=
ty-with-gcc-4.8.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0004-Make-co=
mpatibility-with-gcc-4.8.patch
> new file mode 100644
> index 000000000..2b325b675
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/nodejs/nodejs/0004-Make-compatibility-with=
-gcc-4.8.patch
> @@ -0,0 +1,26 @@
> +Implement function as wrapper for std::make_unique
> +method to be compatible with gcc < 4.9 .
> +"error::make_unique is not a member of 'std'"
> +
> +Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> +
> +diff -Naur node-v10.15.1/src/cares_wrap.cc node-v10.15.1/src/cares_wrap.=
cc
> +--- node-v10.15.1/src/cares_wrap.cc    2019-02-17 09:40:36.040538319 +01=
00
> ++++ node-v10.15.1/src/cares_wrap.cc    2019-02-17 09:39:57.883668702 +01=
00
> +@@ -52,6 +52,16 @@
> + # define AI_V4MAPPED 0
> + #endif
> +
> ++#ifndef __cpp_lib_make_unique
> ++  namespace std {
> ++    /// make_unique implementation
> ++    template<typename T, typename... Args>
> ++    std::unique_ptr<T> make_unique(Args&&... args) {
> ++      return std::unique_ptr<T>(new T(std::forward<Args>(args)...));
> ++    }
> ++  }
> ++#endif
> ++
> + namespace node {
> + namespace cares_wrap {
> +
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0005-Link-atomic-libr=
ary.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0005-Link-atomic-library=
.patch
> new file mode 100644
> index 000000000..66ff18b4a
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/nodejs/nodejs/0005-Link-atomic-library.pat=
ch
> @@ -0,0 +1,20 @@
> +Link atomic library to fix missing undefined referrences
> +like "undefined reference to `__atomic_fetch_add_8'"
> +
> +Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> +
> +diff -Naur node-v10.15.1/deps/v8/gypfiles/v8.gyp node-v10.15.1/deps/v8/g=
ypfiles/v8.gyp
> +--- node-v10.15.1/deps/v8/gypfiles/v8.gyp      2019-02-13 09:02:21.00000=
0000 +0100
> ++++ node-v10.15.1/deps/v8/gypfiles/v8.gyp      2019-02-15 21:27:11.75567=
9660 +0100
> +@@ -452,6 +452,11 @@
> +         '<(DEPTH)',
> +         '<(SHARED_INTERMEDIATE_DIR)'
> +       ],
> ++      'link_settings': {
> ++        'libraries': [
> ++          '-latomic'
> ++        ],
> ++      },
> +       'sources': [
> +         '<@(inspector_all_sources)',
> +         '../include//v8-inspector-protocol.h',
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_8.15.0.bb b/meta-oe/r=
ecipes-devtools/nodejs/nodejs_10.15.1.bb
> similarity index 83%
> rename from meta-oe/recipes-devtools/nodejs/nodejs_8.15.0.bb
> rename to meta-oe/recipes-devtools/nodejs/nodejs_10.15.1.bb
> index 44eaee974..17c9bb0c4 100644
> --- a/meta-oe/recipes-devtools/nodejs/nodejs_8.15.0.bb
> +++ b/meta-oe/recipes-devtools/nodejs/nodejs_10.15.1.bb
> @@ -1,9 +1,10 @@
>  DESCRIPTION =3D "nodeJS Evented I/O for V8 JavaScript"
>  HOMEPAGE =3D "http://nodejs.org"
>  LICENSE =3D "MIT & BSD & Artistic-2.0"
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dfde91d5c5bbd1e0389623e1ac018d=
9e8"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D9ceeba79eb2ea1067b7b3ed16fff8=
bab"
>
>  DEPENDS =3D "openssl zlib icu"
> +DEPENDS_append_class-target =3D " nodejs-native"
>
>  inherit pkgconfig
>
> @@ -13,9 +14,16 @@ COMPATIBLE_MACHINE_mips64 =3D "(!.*mips64).*"
>
>  SRC_URI =3D "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
>             file://0001-Disable-running-gyp-files-for-bundled-deps.patch =
\
> -"
> -SRC_URI[md5sum] =3D "bfc5da493c72ded3a7f43b5662bfc53c"
> -SRC_URI[sha256sum] =3D "968523333947cc3f769d73dedc6c9c60580826d8714bc0e6=
2ca4589de6a7c633"
> +           file://0003-Crypto-reduce-memory-usage-of-SignFinal.patch \
> +           file://0004-Make-compatibility-with-gcc-4.8.patch \
> +           file://0005-Link-atomic-library.patch \
> +           "
> +SRC_URI_append_class-target =3D " \
> +           file://0002-Using-native-torque.patch \
> +           "
> +
> +SRC_URI[md5sum] =3D "1cad7963255de53509bfa560221bdc88"
> +SRC_URI[sha256sum] =3D "1a55f7b9fb80442182d9e1eba4fca4dac3c781cdcb25d6be=
37b24d253f61c858"
>
>  S =3D "${WORKDIR}/node-v${PV}"
>
> @@ -74,6 +82,10 @@ do_install_append_class-native() {
>      # use sed on npm-cli.js because otherwise symlink is replaced with n=
ormal file and
>      # npm-cli.js continues to use old shebang
>      sed "1s^.*^#\!/usr/bin/env node^g" -i ${D}${exec_prefix}/lib/node_mo=
dules/npm/bin/npm-cli.js
> +
> +    # Install the native torque to provide it within sysroot for the tar=
get compilation
> +    install -d ${D}${bindir}
> +    install -m 0755 ${S}/out/Release/torque ${D}${bindir}/torque
>  }
>
>  do_install_append_class-target() {
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

