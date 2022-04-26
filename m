Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5836C433F5
	for <webhook@archiver.kernel.org>; Tue, 26 Apr 2022 12:37:37 +0000 (UTC)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com
 [209.85.217.49])
 by mx.groups.io with SMTP id smtpd.web11.5705.1650976647621113428
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Apr 2022 05:37:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Cwy+wW7q;
 spf=pass (domain: gmail.com, ip: 209.85.217.49,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-vs1-f49.google.com with SMTP id i186so17246134vsc.9
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Apr 2022 05:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8eHKJv+w9gouS5ERXeTKGm5QJR3daPXk0teGeSkuMec=;
        b=Cwy+wW7qwcY5E4RmQDvk8O02OBQqnuocKrscSML0/XG5co0E3GoT7Fs/yTVx3+Q8K6
         9/128FFKv3Oi65017ZwOfyCk44uWaM8kRZ8ZP96wBVheLwJ6TXTvgkFZvS5+IDZmMxpo
         y2WqIm5fnhRDl4vCs0Wqhk7CFuTvkVkussXXjz6FTpRl0HT4XGqfX7UaffzM4GcYAfUQ
         zcX+88+Tq6GvpexvBb7nnoMuGqlsOSgVygA7JIPhcgoWghzsa7Akio9wuUlpvoB+Xjho
         UnhuF6rHRarZJG2mocRlNELUuQ7AzrsU0woES4dD9AT+mXi0DtPvmP5ibv5SEwjOI6HP
         ixhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8eHKJv+w9gouS5ERXeTKGm5QJR3daPXk0teGeSkuMec=;
        b=j8XHXSVIRoCdiTBZoa1wOLWajIoYRgsm7YuCKGzoQuTuuppCr1TyphgdJdYyGyA1vw
         wmeEF6vOjWgDdbgjVW83pJsdkPgy2uUdUq5esE5Nn4rhCn6TKcL6Yh2nQbdJuDy+0fbq
         YFBPLJEdham+ObkFqD705B0uoZSYTVNC4Vd8W7bDK1EuYf+JPQTJLH2u8SVLVGLW+1nw
         kmN7pb97XLEsP2OryNsI4V2vYcP5naflZt2O+ZLmo+DoW1pRIj5rzPdtYEehCFFfkvF3
         R5knTW4M6QdpNSz+LM+4dpcGIlhmcCx/kGqBa3dC/PSICvzEOlMdWoCeR5YbQzJx0FCc
         bQyw==
X-Gm-Message-State: AOAM532XaALMzrkmNg95FxFeMZF/IfgcQFZ4NT6TrxthixtEetaRYD4M
	9MxJ6PXxHySciWv2YdX848UyeCrk8h7vpBkQxUQ=
X-Google-Smtp-Source: 
 ABdhPJzzCIY8v8HQtyFINRrwnEvVh+KfNyc8X1EBd3gXh3UMkw/1BIoPIwDzGtGJGuWGZEdNlqLSqfjzIf9oHwJnO9M=
X-Received: by 2002:a05:6102:150f:b0:32c:e4f2:77b4 with SMTP id
 f15-20020a056102150f00b0032ce4f277b4mr779601vsv.51.1650976646578; Tue, 26 Apr
 2022 05:37:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220218133121.222269-1-andrej.valek@siemens.com>
 <20220305131625.16138-1-andrej.valek@siemens.com>
In-Reply-To: <20220305131625.16138-1-andrej.valek@siemens.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 26 Apr 2022 14:37:10 +0200
Message-ID: 
 <CA+chaQfZZOR_rLN-WeSpu=p9iLYohgFJuTHJj5+gwp8Zh7iZsQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v2] nodejs: add option to use openssl legacy
 providers again
To: Andrej Valek <andrej.valek@siemens.com>
Cc: openembedded-devel@lists.openembedded.org, raj.khem@gmail.com,
	zboszor@gmail.com
Content-Type: multipart/alternative; boundary="0000000000008d458805dd8df4d7"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Apr 2022 12:37:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96799

--0000000000008d458805dd8df4d7
Content-Type: text/plain; charset="UTF-8"

Hi,

does this work correctly for you with nodejs-native?

Here it fails to load legacy module:
recipe-sysroot-native/usr/bin/node -p 'crypto.createHash("md4")'
--openssl-legacy-provider
Unable to load legacy provider.
node:internal/crypto/hash:67
  this[kHandle] = new _Hash(algorithm, xofLen);
                  ^

Error: error:12800067:DSO support routines::could not load the shared
library
    at new Hash (node:internal/crypto/hash:67:19)
    at Object.createHash (node:crypto:130:10)
    at [eval]:1:8
    at Script.runInThisContext (node:vm:129:12)
    at Object.runInThisContext (node:vm:305:38)
    at node:internal/process/execution:76:19
    at [eval]-wrapper:6:22
    at evalScript (node:internal/process/execution:75:60)
    at node:internal/main/eval_string:27:3 {
  opensslErrorStack: [
    'error:03000086:digital envelope routines::initialization error',
    'error:0308010C:digital envelope routines::unsupported',
    'error:078C0105:common libcrypto routines::init fail',
    'error:12800067:DSO support routines::could not load the shared library'
  ],
  library: 'DSO support routines',
  reason: 'could not load the shared library',
  code: 'ERR_OSSL_DSO_COULD_NOT_LOAD_THE_SHARED_LIBRARY'
}

with LD_DEBUG I've found that it is trying to load legacy.so from
openssl-native WORKDIR
(work/x86_64-linux/openssl-native/3.0.2-r0/recipe-sysroot-native/usr/lib/ossl-modules/legacy.so)
which is already removed by rm_work and as work around I need to
set OPENSSL_MODULES=$(pwd)/recipe-sysroot-native/usr/lib/ossl-modules/ and
then it works:

OPENSSL_MODULES=$(pwd)/recipe-sysroot-native/usr/lib/ossl-modules/
recipe-sysroot-native/usr/bin/node -p 'crypto.createHash("md4")'
--openssl-legacy-provider
Hash {
  _options: undefined,
  [Symbol(kHandle)]: Hash {},
  [Symbol(kState)]: { [Symbol(kFinalized)]: false }
}

On Sat, Mar 5, 2022 at 2:17 PM Andrej Valek <andrej.valek@siemens.com>
wrote:

> Current nodejs version v16 does not fully support new OpenSSL, so add
> option
> to use legacy provider.
>
> |   opensslErrorStack: [ 'error:03000086:digital envelope
> routines::initialization error' ],
> |   library: 'digital envelope routines',
> |   reason: 'unsupported',
> |   code: 'ERR_OSSL_EVP_UNSUPPORTED'
>
> It was blindly removed by upgrade to 16.14.0 version
>
> Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> ---
>  ...5-add-openssl-legacy-provider-option.patch | 151 ++++++++++++++++++
>  .../recipes-devtools/nodejs/nodejs_16.14.0.bb |   1 +
>  2 files changed, 152 insertions(+)
>  create mode 100644
> meta-oe/recipes-devtools/nodejs/nodejs/0005-add-openssl-legacy-provider-option.patch
>
> diff --git
> a/meta-oe/recipes-devtools/nodejs/nodejs/0005-add-openssl-legacy-provider-option.patch
> b/meta-oe/recipes-devtools/nodejs/nodejs/0005-add-openssl-legacy-provider-option.patch
> new file mode 100644
> index 000000000..5af6c6114
> --- /dev/null
> +++
> b/meta-oe/recipes-devtools/nodejs/nodejs/0005-add-openssl-legacy-provider-option.patch
> @@ -0,0 +1,151 @@
> +From 86d1c0cc6a5dcf57e413a1cc1c29203e87cf9a14 Mon Sep 17 00:00:00 2001
> +From: Daniel Bevenius <daniel.bevenius@gmail.com>
> +Date: Sat, 16 Oct 2021 08:50:16 +0200
> +Subject: [PATCH] src: add --openssl-legacy-provider option
> +
> +This commit adds an option to Node.js named --openssl-legacy-provider
> +and if specified will load OpenSSL 3.0 Legacy provider.
> +
> +$ ./node --help
> +...
> +--openssl-legacy-provider  enable OpenSSL 3.0 legacy provider
> +
> +Example usage:
> +
> +$ ./node --openssl-legacy-provider  -p 'crypto.createHash("md4")'
> +Hash {
> +  _options: undefined,
> +  [Symbol(kHandle)]: Hash {},
> +  [Symbol(kState)]: { [Symbol(kFinalized)]: false }
> +}
> +
> +Co-authored-by: Richard Lau <rlau@redhat.com>
> +
> +Refs: https://github.com/nodejs/node/issues/40455
> +---
> + doc/api/cli.md                                         | 10 ++++++++++
> + src/crypto/crypto_util.cc                              | 10 ++++++++++
> + src/node_options.cc                                    | 10 ++++++++++
> + src/node_options.h                                     |  7 +++++++
> + .../test-process-env-allowed-flags-are-documented.js   |  5 +++++
> + 5 files changed, 42 insertions(+)
> +
> +diff --git a/doc/api/cli.md b/doc/api/cli.md
> +index 74057706bf8d..608b9cdeddf1 100644
> +--- a/doc/api/cli.md
> ++++ b/doc/api/cli.md
> +@@ -687,6 +687,14 @@ Load an OpenSSL configuration file on startup. Among
> other uses, this can be
> + used to enable FIPS-compliant crypto if Node.js is built
> + against FIPS-enabled OpenSSL.
> +
> ++### `--openssl-legacy-provider`
> ++<!-- YAML
> ++added: REPLACEME
> ++-->
> ++
> ++Enable OpenSSL 3.0 legacy provider. For more information please see
> ++[providers readme][].
> ++
> + ### `--pending-deprecation`
> +
> + <!-- YAML
> +@@ -1544,6 +1552,7 @@ Node.js options that are allowed are:
> + * `--no-warnings`
> + * `--node-memory-debug`
> + * `--openssl-config`
> ++* `--openssl-legacy-provider`
> + * `--pending-deprecation`
> + * `--policy-integrity`
> + * `--preserve-symlinks-main`
> +@@ -1933,6 +1942,7 @@ $ node --max-old-space-size=1536 index.js
> + [emit_warning]: process.md#processemitwarningwarning-options
> + [jitless]: https://v8.dev/blog/jitless
> + [libuv threadpool documentation]:
> https://docs.libuv.org/en/latest/threadpool.html
> ++[providers readme]:
> https://github.com/openssl/openssl/blob/openssl-3.0.0/README-PROVIDERS.md
> + [remote code execution]: https://www.owasp.org/index.php/Code_Injection
> + [security warning]:
> #warning-binding-inspector-to-a-public-ipport-combination-is-insecure
> + [timezone IDs]:
> https://en.wikipedia.org/wiki/List_of_tz_database_time_zones
> +diff --git a/src/crypto/crypto_util.cc b/src/crypto/crypto_util.cc
> +index 7e0c8ba3eb60..796ea3025e41 100644
> +--- a/src/crypto/crypto_util.cc
> ++++ b/src/crypto/crypto_util.cc
> +@@ -148,6 +148,16 @@ void InitCryptoOnce() {
> +   }
> + #endif
> +
> ++#if OPENSSL_VERSION_MAJOR >= 3
> ++  // --openssl-legacy-provider
> ++  if (per_process::cli_options->openssl_legacy_provider) {
> ++    OSSL_PROVIDER* legacy_provider = OSSL_PROVIDER_load(nullptr,
> "legacy");
> ++    if (legacy_provider == nullptr) {
> ++      fprintf(stderr, "Unable to load legacy provider.\n");
> ++    }
> ++  }
> ++#endif
> ++
> +   OPENSSL_init_ssl(0, settings);
> +   OPENSSL_INIT_free(settings);
> +   settings = nullptr;
> +diff --git a/src/node_options.cc b/src/node_options.cc
> +index 00bdc6688a4c..3363860919a9 100644
> +--- a/src/node_options.cc
> ++++ b/src/node_options.cc
> +@@ -4,6 +4,9 @@
> + #include "env-inl.h"
> + #include "node_binding.h"
> + #include "node_internals.h"
> ++#if HAVE_OPENSSL
> ++#include "openssl/opensslv.h"
> ++#endif
> +
> + #include <errno.h>
> + #include <sstream>
> +diff --git a/src/node_options.h b/src/node_options.h
> +index fd772478d04d..1c0e018ab16f 100644
> +--- a/src/node_options.h
> ++++ b/src/node_options.h
> +@@ -11,6 +11,10 @@
> + #include "node_mutex.h"
> + #include "util.h"
> +
> ++#if HAVE_OPENSSL
> ++#include "openssl/opensslv.h"
> ++#endif
> ++
> + namespace node {
> +
> + class HostPort {
> +@@ -251,6 +255,9 @@ class PerProcessOptions : public Options {
> +   bool enable_fips_crypto = false;
> +   bool force_fips_crypto = false;
> + #endif
> ++#if OPENSSL_VERSION_MAJOR >= 3
> ++  bool openssl_legacy_provider = false;
> ++#endif
> +
> +   // Per-process because reports can be triggered outside a known V8
> context.
> +   bool report_on_fatalerror = false;
> +diff --git
> a/test/parallel/test-process-env-allowed-flags-are-documented.js
> b/test/parallel/test-process-env-allowed-flags-are-documented.js
> +index 64626b71f019..8a4e35997907 100644
> +--- a/test/parallel/test-process-env-allowed-flags-are-documented.js
> ++++ b/test/parallel/test-process-env-allowed-flags-are-documented.js
> +@@ -43,6 +43,10 @@ for (const line of [...nodeOptionsLines,
> ...v8OptionsLines]) {
> +   }
> + }
> +
> ++if (!common.hasOpenSSL3) {
> ++  documented.delete('--openssl-legacy-provider');
> ++}
> ++
> + // Filter out options that are conditionally present.
> + const conditionalOpts = [
> +   {
> +@@ -50,6 +54,7 @@ const conditionalOpts = [
> +     filter: (opt) => {
> +       return [
> +         '--openssl-config',
> ++        common.hasOpenSSL3 ? '--openssl-legacy-provider' : '',
> +         '--tls-cipher-list',
> +         '--use-bundled-ca',
> +         '--use-openssl-ca',
> +
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_16.14.0.bb
> b/meta-oe/recipes-devtools/nodejs/nodejs_16.14.0.bb
> index 9514ec499..7b9644ec8 100644
> --- a/meta-oe/recipes-devtools/nodejs/nodejs_16.14.0.bb
> +++ b/meta-oe/recipes-devtools/nodejs/nodejs_16.14.0.bb
> @@ -20,6 +20,7 @@ SRC_URI = "
> http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
>             file://0001-Disable-running-gyp-files-for-bundled-deps.patch \
>             file://0002-Install-both-binaries-and-use-libdir.patch \
>             file://0004-v8-don-t-override-ARM-CFLAGS.patch \
> +           file://0005-add-openssl-legacy-provider-option.patch \
>             file://big-endian.patch \
>             file://mips-less-memory.patch \
>             file://system-c-ares.patch \
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#95799):
> https://lists.openembedded.org/g/openembedded-devel/message/95799
> Mute This Topic: https://lists.openembedded.org/mt/89569235/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> Martin.Jansa@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000008d458805dd8df4d7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>does this work correctly for you wi=
th nodejs-native?</div><div><br></div><div>Here it fails to load legacy mod=
ule:</div><div>recipe-sysroot-native/usr/bin/node -p &#39;crypto.createHash=
(&quot;md4&quot;)&#39; --openssl-legacy-provider<br>Unable to load legacy p=
rovider.<br>node:internal/crypto/hash:67<br>=C2=A0 this[kHandle] =3D new _H=
ash(algorithm, xofLen);<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 ^<br><br>Error: error:12800067:DSO support routines::could n=
ot load the shared library<br>=C2=A0 =C2=A0 at new Hash (node:internal/cryp=
to/hash:67:19)<br>=C2=A0 =C2=A0 at Object.createHash (node:crypto:130:10)<b=
r>=C2=A0 =C2=A0 at [eval]:1:8<br>=C2=A0 =C2=A0 at Script.runInThisContext (=
node:vm:129:12)<br>=C2=A0 =C2=A0 at Object.runInThisContext (node:vm:305:38=
)<br>=C2=A0 =C2=A0 at node:internal/process/execution:76:19<br>=C2=A0 =C2=
=A0 at [eval]-wrapper:6:22<br>=C2=A0 =C2=A0 at evalScript (node:internal/pr=
ocess/execution:75:60)<br>=C2=A0 =C2=A0 at node:internal/main/eval_string:2=
7:3 {<br>=C2=A0 opensslErrorStack: [<br>=C2=A0 =C2=A0 &#39;error:03000086:d=
igital envelope routines::initialization error&#39;,<br>=C2=A0 =C2=A0 &#39;=
error:0308010C:digital envelope routines::unsupported&#39;,<br>=C2=A0 =C2=
=A0 &#39;error:078C0105:common libcrypto routines::init fail&#39;,<br>=C2=
=A0 =C2=A0 &#39;error:12800067:DSO support routines::could not load the sha=
red library&#39;<br>=C2=A0 ],<br>=C2=A0 library: &#39;DSO support routines&=
#39;,<br>=C2=A0 reason: &#39;could not load the shared library&#39;,<br>=C2=
=A0 code: &#39;ERR_OSSL_DSO_COULD_NOT_LOAD_THE_SHARED_LIBRARY&#39;<br>}<br>=
</div><div><br></div><div>with LD_DEBUG I&#39;ve found that it is trying to=
 load legacy.so from openssl-native WORKDIR (work/x86_64-linux/openssl-nati=
ve/3.0.2-r0/recipe-sysroot-native/usr/lib/ossl-modules/legacy.so) which is =
already removed by rm_work and as work around I need to set=C2=A0OPENSSL_MO=
DULES=3D$(pwd)/recipe-sysroot-native/usr/lib/ossl-modules/ and then it work=
s:</div><div><br></div><div>OPENSSL_MODULES=3D$(pwd)/recipe-sysroot-native/=
usr/lib/ossl-modules/ recipe-sysroot-native/usr/bin/node -p &#39;crypto.cre=
ateHash(&quot;md4&quot;)&#39; --openssl-legacy-provider<br>Hash {<br>=C2=A0=
 _options: undefined,<br>=C2=A0 [Symbol(kHandle)]: Hash {},<br>=C2=A0 [Symb=
ol(kState)]: { [Symbol(kFinalized)]: false }<br>}<br></div></div><br><div c=
lass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Mar 5, 2=
022 at 2:17 PM Andrej Valek &lt;<a href=3D"mailto:andrej.valek@siemens.com"=
>andrej.valek@siemens.com</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">Current nodejs version v16 does not fully support =
new OpenSSL, so add option<br>
to use legacy provider.<br>
<br>
|=C2=A0 =C2=A0opensslErrorStack: [ &#39;error:03000086:digital envelope rou=
tines::initialization error&#39; ],<br>
|=C2=A0 =C2=A0library: &#39;digital envelope routines&#39;,<br>
|=C2=A0 =C2=A0reason: &#39;unsupported&#39;,<br>
|=C2=A0 =C2=A0code: &#39;ERR_OSSL_EVP_UNSUPPORTED&#39;<br>
<br>
It was blindly removed by upgrade to 16.14.0 version<br>
<br>
Signed-off-by: Andrej Valek &lt;<a href=3D"mailto:andrej.valek@siemens.com"=
 target=3D"_blank">andrej.valek@siemens.com</a>&gt;<br>
---<br>
=C2=A0...5-add-openssl-legacy-provider-option.patch | 151 +++++++++++++++++=
+<br>
=C2=A0.../recipes-devtools/nodejs/<a href=3D"http://nodejs_16.14.0.bb" rel=
=3D"noreferrer" target=3D"_blank">nodejs_16.14.0.bb</a> |=C2=A0 =C2=A01 +<b=
r>
=C2=A02 files changed, 152 insertions(+)<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0005-add-op=
enssl-legacy-provider-option.patch<br>
<br>
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0005-add-openssl-legacy=
-provider-option.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0005-add-op=
enssl-legacy-provider-option.patch<br>
new file mode 100644<br>
index 000000000..5af6c6114<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/0005-add-openssl-legacy-provid=
er-option.patch<br>
@@ -0,0 +1,151 @@<br>
+From 86d1c0cc6a5dcf57e413a1cc1c29203e87cf9a14 Mon Sep 17 00:00:00 2001<br>
+From: Daniel Bevenius &lt;<a href=3D"mailto:daniel.bevenius@gmail.com" tar=
get=3D"_blank">daniel.bevenius@gmail.com</a>&gt;<br>
+Date: Sat, 16 Oct 2021 08:50:16 +0200<br>
+Subject: [PATCH] src: add --openssl-legacy-provider option<br>
+<br>
+This commit adds an option to Node.js named --openssl-legacy-provider<br>
+and if specified will load OpenSSL 3.0 Legacy provider.<br>
+<br>
+$ ./node --help<br>
+...<br>
+--openssl-legacy-provider=C2=A0 enable OpenSSL 3.0 legacy provider<br>
+<br>
+Example usage:<br>
+<br>
+$ ./node --openssl-legacy-provider=C2=A0 -p &#39;crypto.createHash(&quot;m=
d4&quot;)&#39;<br>
+Hash {<br>
+=C2=A0 _options: undefined,<br>
+=C2=A0 [Symbol(kHandle)]: Hash {},<br>
+=C2=A0 [Symbol(kState)]: { [Symbol(kFinalized)]: false }<br>
+}<br>
+<br>
+Co-authored-by: Richard Lau &lt;<a href=3D"mailto:rlau@redhat.com" target=
=3D"_blank">rlau@redhat.com</a>&gt;<br>
+<br>
+Refs: <a href=3D"https://github.com/nodejs/node/issues/40455" rel=3D"noref=
errer" target=3D"_blank">https://github.com/nodejs/node/issues/40455</a><br=
>
+---<br>
+ doc/api/cli.md=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 10 ++++++++++<br>
+ src/crypto/crypto_util.cc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 10 ++++++++++<br=
>
+ src/node_options.cc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
 10 ++++++++++<br>
+ src/node_options.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 7 +++++++<br>
+ .../test-process-env-allowed-flags-are-documented.js=C2=A0 =C2=A0|=C2=A0 =
5 +++++<br>
+ 5 files changed, 42 insertions(+)<br>
+<br>
+diff --git a/doc/api/cli.md b/doc/api/cli.md<br>
+index 74057706bf8d..608b9cdeddf1 100644<br>
+--- a/doc/api/cli.md<br>
++++ b/doc/api/cli.md<br>
+@@ -687,6 +687,14 @@ Load an OpenSSL configuration file on startup. Among =
other uses, this can be<br>
+ used to enable FIPS-compliant crypto if Node.js is built<br>
+ against FIPS-enabled OpenSSL.<br>
+ <br>
++### `--openssl-legacy-provider`<br>
++&lt;!-- YAML<br>
++added: REPLACEME<br>
++--&gt;<br>
++<br>
++Enable OpenSSL 3.0 legacy provider. For more information please see<br>
++[providers readme][].<br>
++<br>
+ ### `--pending-deprecation`<br>
+ <br>
+ &lt;!-- YAML<br>
+@@ -1544,6 +1552,7 @@ Node.js options that are allowed are:<br>
+ * `--no-warnings`<br>
+ * `--node-memory-debug`<br>
+ * `--openssl-config`<br>
++* `--openssl-legacy-provider`<br>
+ * `--pending-deprecation`<br>
+ * `--policy-integrity`<br>
+ * `--preserve-symlinks-main`<br>
+@@ -1933,6 +1942,7 @@ $ node --max-old-space-size=3D1536 index.js<br>
+ [emit_warning]: process.md#processemitwarningwarning-options<br>
+ [jitless]: <a href=3D"https://v8.dev/blog/jitless" rel=3D"noreferrer" tar=
get=3D"_blank">https://v8.dev/blog/jitless</a><br>
+ [libuv threadpool documentation]: <a href=3D"https://docs.libuv.org/en/la=
test/threadpool.html" rel=3D"noreferrer" target=3D"_blank">https://docs.lib=
uv.org/en/latest/threadpool.html</a><br>
++[providers readme]: <a href=3D"https://github.com/openssl/openssl/blob/op=
enssl-3.0.0/README-PROVIDERS.md" rel=3D"noreferrer" target=3D"_blank">https=
://github.com/openssl/openssl/blob/openssl-3.0.0/README-PROVIDERS.md</a><br=
>
+ [remote code execution]: <a href=3D"https://www.owasp.org/index.php/Code_=
Injection" rel=3D"noreferrer" target=3D"_blank">https://www.owasp.org/index=
.php/Code_Injection</a><br>
+ [security warning]: #warning-binding-inspector-to-a-public-ipport-combina=
tion-is-insecure<br>
+ [timezone IDs]: <a href=3D"https://en.wikipedia.org/wiki/List_of_tz_datab=
ase_time_zones" rel=3D"noreferrer" target=3D"_blank">https://en.wikipedia.o=
rg/wiki/List_of_tz_database_time_zones</a><br>
+diff --git a/src/crypto/crypto_util.cc b/src/crypto/crypto_util.cc<br>
+index 7e0c8ba3eb60..796ea3025e41 100644<br>
+--- a/src/crypto/crypto_util.cc<br>
++++ b/src/crypto/crypto_util.cc<br>
+@@ -148,6 +148,16 @@ void InitCryptoOnce() {<br>
+=C2=A0 =C2=A0}<br>
+ #endif<br>
+ <br>
++#if OPENSSL_VERSION_MAJOR &gt;=3D 3<br>
++=C2=A0 // --openssl-legacy-provider<br>
++=C2=A0 if (per_process::cli_options-&gt;openssl_legacy_provider) {<br>
++=C2=A0 =C2=A0 OSSL_PROVIDER* legacy_provider =3D OSSL_PROVIDER_load(nullp=
tr, &quot;legacy&quot;);<br>
++=C2=A0 =C2=A0 if (legacy_provider =3D=3D nullptr) {<br>
++=C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &quot;Unable to load legacy provider=
.\n&quot;);<br>
++=C2=A0 =C2=A0 }<br>
++=C2=A0 }<br>
++#endif<br>
++<br>
+=C2=A0 =C2=A0OPENSSL_init_ssl(0, settings);<br>
+=C2=A0 =C2=A0OPENSSL_INIT_free(settings);<br>
+=C2=A0 =C2=A0settings =3D nullptr;<br>
+diff --git a/src/node_options.cc b/src/node_options.cc<br>
+index 00bdc6688a4c..3363860919a9 100644<br>
+--- a/src/node_options.cc<br>
++++ b/src/node_options.cc<br>
+@@ -4,6 +4,9 @@<br>
+ #include &quot;env-inl.h&quot;<br>
+ #include &quot;node_binding.h&quot;<br>
+ #include &quot;node_internals.h&quot;<br>
++#if HAVE_OPENSSL<br>
++#include &quot;openssl/opensslv.h&quot;<br>
++#endif<br>
+ <br>
+ #include &lt;errno.h&gt;<br>
+ #include &lt;sstream&gt;<br>
+diff --git a/src/node_options.h b/src/node_options.h<br>
+index fd772478d04d..1c0e018ab16f 100644<br>
+--- a/src/node_options.h<br>
++++ b/src/node_options.h<br>
+@@ -11,6 +11,10 @@<br>
+ #include &quot;node_mutex.h&quot;<br>
+ #include &quot;util.h&quot;<br>
+ <br>
++#if HAVE_OPENSSL<br>
++#include &quot;openssl/opensslv.h&quot;<br>
++#endif<br>
++<br>
+ namespace node {<br>
+ <br>
+ class HostPort {<br>
+@@ -251,6 +255,9 @@ class PerProcessOptions : public Options {<br>
+=C2=A0 =C2=A0bool enable_fips_crypto =3D false;<br>
+=C2=A0 =C2=A0bool force_fips_crypto =3D false;<br>
+ #endif<br>
++#if OPENSSL_VERSION_MAJOR &gt;=3D 3<br>
++=C2=A0 bool openssl_legacy_provider =3D false;<br>
++#endif<br>
+ <br>
+=C2=A0 =C2=A0// Per-process because reports can be triggered outside a kno=
wn V8 context.<br>
+=C2=A0 =C2=A0bool report_on_fatalerror =3D false;<br>
+diff --git a/test/parallel/test-process-env-allowed-flags-are-documented.j=
s b/test/parallel/test-process-env-allowed-flags-are-documented.js<br>
+index 64626b71f019..8a4e35997907 100644<br>
+--- a/test/parallel/test-process-env-allowed-flags-are-documented.js<br>
++++ b/test/parallel/test-process-env-allowed-flags-are-documented.js<br>
+@@ -43,6 +43,10 @@ for (const line of [...nodeOptionsLines, ...v8OptionsLi=
nes]) {<br>
+=C2=A0 =C2=A0}<br>
+ }<br>
+ <br>
++if (!common.hasOpenSSL3) {<br>
++=C2=A0 documented.delete(&#39;--openssl-legacy-provider&#39;);<br>
++}<br>
++<br>
+ // Filter out options that are conditionally present.<br>
+ const conditionalOpts =3D [<br>
+=C2=A0 =C2=A0{<br>
+@@ -50,6 +54,7 @@ const conditionalOpts =3D [<br>
+=C2=A0 =C2=A0 =C2=A0filter: (opt) =3D&gt; {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;--openssl-config&#39;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 common.hasOpenSSL3 ? &#39;--openssl-legacy-pr=
ovider&#39; : &#39;&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;--tls-cipher-list&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;--use-bundled-ca&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;--use-openssl-ca&#39;,<br>
+<br>
diff --git a/meta-oe/recipes-devtools/nodejs/<a href=3D"http://nodejs_16.14=
.0.bb" rel=3D"noreferrer" target=3D"_blank">nodejs_16.14.0.bb</a> b/meta-oe=
/recipes-devtools/nodejs/<a href=3D"http://nodejs_16.14.0.bb" rel=3D"norefe=
rrer" target=3D"_blank">nodejs_16.14.0.bb</a><br>
index 9514ec499..7b9644ec8 100644<br>
--- a/meta-oe/recipes-devtools/nodejs/<a href=3D"http://nodejs_16.14.0.bb" =
rel=3D"noreferrer" target=3D"_blank">nodejs_16.14.0.bb</a><br>
+++ b/meta-oe/recipes-devtools/nodejs/<a href=3D"http://nodejs_16.14.0.bb" =
rel=3D"noreferrer" target=3D"_blank">nodejs_16.14.0.bb</a><br>
@@ -20,6 +20,7 @@ SRC_URI =3D &quot;<a href=3D"http://nodejs.org/dist/v$%7B=
PV%7D/node-v$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank">http://n=
odejs.org/dist/v${PV}/node-v${PV}.tar.xz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Disable-running-gyp-f=
iles-for-bundled-deps.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0002-Install-both-binaries=
-and-use-libdir.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0004-v8-don-t-override-ARM=
-CFLAGS.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0005-add-openssl-legacy-pr=
ovider-option.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://big-endian.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://mips-less-memory.patch \<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://system-c-ares.patch \<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#95799): <a href=3D"https://lists.openembedded.org/g/ope=
nembedded-devel/message/95799" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/g/openembedded-devel/message/95799</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/89569235/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/89569235/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:Martin.Jansa@gmail.com" =
target=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000008d458805dd8df4d7--

