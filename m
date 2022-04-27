Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC439C433EF
	for <webhook@archiver.kernel.org>; Wed, 27 Apr 2022 06:20:34 +0000 (UTC)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com
 [209.85.222.53])
 by mx.groups.io with SMTP id smtpd.web08.5120.1651040429598856173
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Apr 2022 23:20:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dJofO5ld;
 spf=pass (domain: gmail.com, ip: 209.85.222.53,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-ua1-f53.google.com with SMTP id az13so250597uab.13
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Apr 2022 23:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PVeKiqI8pIi3hQqMJ70lQ7irkjCpxobRmxzAYLexFpU=;
        b=dJofO5ldeP93EtKOp/Yy1dYS5pXFO/oQTcZ9Ee6bk7a71obbhMpXT6O+DAvRTmO5Aj
         C/wYiJuW9o8GqEOAvuEcasRlQdGF3ZSB4aPxcxxX0XmUpfqQR0jZ7nQ/PdlTG4H5MbGA
         CEGEWogE1+4wip+tsWGYRGT/Lj1Dn1HooWBHIwLejQ7AsN5r6t88dKfAAQb1pdt4Dx+D
         0ND5iTR4Wy/iFvSUfx9Zv7FvoDoPS/ptqz65Tw1NqZGBLvLGYrLI5y8rW0R3SQ6WrhAk
         AcHuIDqKPWurigc95eL45J7c99XykwCK7rwU/hNOy31Bk/Cy7nPZAZae/6EOCxCKrqFN
         LHqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PVeKiqI8pIi3hQqMJ70lQ7irkjCpxobRmxzAYLexFpU=;
        b=s8N7TxRrMN7Cal36HyTDeCA3H38PTy7bcb2IMVcl5xJ+/dmrJL42ofgx3Xa1/zQNWo
         nmhi7OPmGxLmQm/d+h9rkLqH/BW5ZwkxW4aNl3z5rdmUwJd5F5lxZrnP+BJQhJBmvLsu
         Yln+Qay+EnDzR7ywU7lwSFfu1dd+H3IeGN/ziucnUkYhIreTwT6QDsVv/gC/pMm8L9Ye
         KxQRs1Y+L5gZp1BcAzEE03OkhtOBM2LSwbRKvJItdf+n+bccK2lV7bDGK0CWGMYXYDFg
         SrwVdFj7XgD6q9zvdkpnJEGC4YLR69Fue+Vqyj+HIGRsYucPW2Rhf8YDb2Cef+cjtcFV
         VLJA==
X-Gm-Message-State: AOAM531vVG6ljwzxexwtGsD6ocN+G/AAYZEnml0J3rS1lXfNkrehET/L
	k9XqE2YSDgUwpMc9D59BS66diKJKnIC0tr3iTao=
X-Google-Smtp-Source: 
 ABdhPJw3kCsZ+0Up3URTMEOGaRgcAC8NFtFrpu0/f90agqhT6hYK36HhmPcyguc/AQnAhPxEjKW8j/y3/e8se6SmNn0=
X-Received: by 2002:ab0:6288:0:b0:35f:b6cd:d5b3 with SMTP id
 z8-20020ab06288000000b0035fb6cdd5b3mr8182384uao.44.1651040428699; Tue, 26 Apr
 2022 23:20:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220218133121.222269-1-andrej.valek@siemens.com>
 <20220305131625.16138-1-andrej.valek@siemens.com>
 <CA+chaQfZZOR_rLN-WeSpu=p9iLYohgFJuTHJj5+gwp8Zh7iZsQ@mail.gmail.com>
 <564a202fefe67bc819b0eac49d9d4e25e7c24629.camel@siemens.com>
 <CA+chaQf-aDw4Fcs2seowOK9MAYSrdXMbMzaVbAGZM=zAOG1Mnw@mail.gmail.com>
 <a3d6fba2fff01ecfdd3c1fa1bbcc5348ed39c9bb.camel@siemens.com>
In-Reply-To: <a3d6fba2fff01ecfdd3c1fa1bbcc5348ed39c9bb.camel@siemens.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 27 Apr 2022 08:20:11 +0200
Message-ID: 
 <CA+chaQfv=JAL+omv4ykS4b+qnmHXMBv-NH7Ap=hVnBY_OdBJ5g@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v2] nodejs: add option to use openssl legacy
 providers again
To: "Valek, Andrej" <andrej.valek@siemens.com>
Cc: "raj.khem@gmail.com" <raj.khem@gmail.com>,
	"openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>,
	"zboszor@gmail.com" <zboszor@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000043326e05dd9cce14"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Apr 2022 06:20:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96809

--00000000000043326e05dd9cce14
Content-Type: text/plain; charset="UTF-8"

We have such bbclass already:
https://github.com/webosose/meta-webosose/blob/master/meta-webos/classes/webos_npm_env.bbclass
but I didn't want to enable legacy providers globally, so I was adding it
only to recipes which needed it in over-optimistic hope that it will nudge
component owners to update webpack (or whatever else needed legacy) before
they get too comfortable with legacy being enabled by default.

:)

On Wed, Apr 27, 2022 at 8:11 AM Valek, Andrej <andrej.valek@siemens.com>
wrote:

> Maybe you can try to add it into global npm class with some enabling
> variable.
>
> Cheers,
> Andrej
>
> On Tue, 2022-04-26 at 14:59 +0200, Martin Jansa wrote:
>
> export OPENSSL_MODULES="${STAGING_LIBDIR_NATIVE}/ossl-modules"
> export NODE_OPTIONS="--openssl-legacy-provider"
>
> is what I'm doing in recipes which need it now.
>
> > you should have a legacy libraries in library loading path already
>
> here it tries to load it from openssl-native WORKDIR which is already
> removed, maybe that works on target (there I was assuming you were
> initially testing this), but in native case I need to explicitly set
> OPENSSL_MODULES.
>
> On Tue, Apr 26, 2022 at 2:45 PM Valek, Andrej <andrej.valek@siemens.com>
> wrote:
>
> Hi,
>
> of course, that i working. But if you're going to use
> --openssl-legacy-provider, you should have a legacy libraries in library
> loading path already. Other option is manually set variables in npm-class
> like:
>
> export OPENSSL_MODULES="${STAGING_LIBDIR_NATIVE}/ossl-modules"export NODE_OPTIONS="--openssl-legacy-provider"
>
>
> Regards,
> Andrej
>
> On Tue, 2022-04-26 at 14:37 +0200, Martin Jansa wrote:
>
> Hi,
>
> does this work correctly for you with nodejs-native?
>
> Here it fails to load legacy module:
> recipe-sysroot-native/usr/bin/node -p 'crypto.createHash("md4")'
> --openssl-legacy-provider
> Unable to load legacy provider.
> node:internal/crypto/hash:67
>   this[kHandle] = new _Hash(algorithm, xofLen);
>                   ^
>
> Error: error:12800067:DSO support routines::could not load the shared
> library
>     at new Hash (node:internal/crypto/hash:67:19)
>     at Object.createHash (node:crypto:130:10)
>     at [eval]:1:8
>     at Script.runInThisContext (node:vm:129:12)
>     at Object.runInThisContext (node:vm:305:38)
>     at node:internal/process/execution:76:19
>     at [eval]-wrapper:6:22
>     at evalScript (node:internal/process/execution:75:60)
>     at node:internal/main/eval_string:27:3 {
>   opensslErrorStack: [
>     'error:03000086:digital envelope routines::initialization error',
>     'error:0308010C:digital envelope routines::unsupported',
>     'error:078C0105:common libcrypto routines::init fail',
>     'error:12800067:DSO support routines::could not load the shared
> library'
>   ],
>   library: 'DSO support routines',
>   reason: 'could not load the shared library',
>   code: 'ERR_OSSL_DSO_COULD_NOT_LOAD_THE_SHARED_LIBRARY'
> }
>
> with LD_DEBUG I've found that it is trying to load legacy.so from
> openssl-native WORKDIR
> (work/x86_64-linux/openssl-native/3.0.2-r0/recipe-sysroot-native/usr/lib/ossl-modules/legacy.so)
> which is already removed by rm_work and as work around I need to
> set OPENSSL_MODULES=$(pwd)/recipe-sysroot-native/usr/lib/ossl-modules/ and
> then it works:
>
> OPENSSL_MODULES=$(pwd)/recipe-sysroot-native/usr/lib/ossl-modules/
> recipe-sysroot-native/usr/bin/node -p 'crypto.createHash("md4")'
> --openssl-legacy-provider
> Hash {
>   _options: undefined,
>   [Symbol(kHandle)]: Hash {},
>   [Symbol(kState)]: { [Symbol(kFinalized)]: false }
> }
>
> On Sat, Mar 5, 2022 at 2:17 PM Andrej Valek <andrej.valek@siemens.com>
> wrote:
>
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
>
>
>
>

--00000000000043326e05dd9cce14
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">We have such bbclass already:<div><a href=3D"https://githu=
b.com/webosose/meta-webosose/blob/master/meta-webos/classes/webos_npm_env.b=
bclass">https://github.com/webosose/meta-webosose/blob/master/meta-webos/cl=
asses/webos_npm_env.bbclass</a><br></div><div>but I didn&#39;t want to enab=
le legacy providers globally, so I was adding it only to recipes which need=
ed it in over-optimistic hope that it will nudge component owners to update=
 webpack (or whatever else needed legacy) before they get too comfortable w=
ith legacy being enabled by default.</div><div><br></div><div>:)</div></div=
><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On We=
d, Apr 27, 2022 at 8:11 AM Valek, Andrej &lt;<a href=3D"mailto:andrej.valek=
@siemens.com">andrej.valek@siemens.com</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">



<div>
<div>Maybe you can try to add it into global npm class with some enabling v=
ariable.</div>
<div><br>
</div>
<div>Cheers,</div>
<div>Andrej</div>
<div><br>
</div>
<div>On Tue, 2022-04-26 at 14:59 +0200, Martin Jansa wrote:</div>
<blockquote type=3D"cite" style=3D"margin:0px 0px 0px 0.8ex;border-left:2px=
 solid rgb(114,159,207);padding-left:1ex">
<div dir=3D"ltr">export OPENSSL_MODULES=3D&quot;${STAGING_LIBDIR_NATIVE}/os=
sl-modules&quot;<br>
export NODE_OPTIONS=3D&quot;--openssl-legacy-provider&quot;<br>
<div><br>
</div>
<div>is what I&#39;m doing in recipes which need it now.</div>
<div><br>
</div>
<div>&gt; you should have a legacy libraries in library loading path alread=
y</div>
<div><br>
</div>
<div>here it tries to load it from openssl-native WORKDIR which is already =
removed, maybe that works on target (there I was assuming you were initiall=
y testing this), but in native case I need to explicitly set OPENSSL_MODULE=
S.</div>
</div>
<div><br>
</div>
<div class=3D"gmail_quote">
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Apr 26, 2022 at 2:45 PM Valek=
, Andrej &lt;<a href=3D"mailto:andrej.valek@siemens.com" target=3D"_blank">=
andrej.valek@siemens.com</a>&gt; wrote:<br>
</div>
<blockquote type=3D"cite" style=3D"margin:0px 0px 0px 0.8ex;border-left:2px=
 solid rgb(114,159,207);padding-left:1ex">
<div>
<div>Hi,</div>
<div><br>
</div>
<div>of course, that i working. But if you&#39;re going to use --openssl-le=
gacy-provider, you should have a legacy libraries in library loading path a=
lready. Other option is manually set variables in npm-class like:</div>
<div><br>
</div>
<pre lang=3D"plaintext"><span id=3D"gmail-m_-5984069740510898733gmail-m_563=
3578479040388319LC71" lang=3D"plaintext">export OPENSSL_MODULES=3D&quot;${S=
TAGING_LIBDIR_NATIVE}/ossl-modules&quot;</span>
<span id=3D"gmail-m_-5984069740510898733gmail-m_5633578479040388319LC72" la=
ng=3D"plaintext">export NODE_OPTIONS=3D&quot;--openssl-legacy-provider&quot=
;</span>
</pre>
<pre lang=3D"plaintext"><span lang=3D"plaintext"><div><span style=3D"font-f=
amily:Cantarell;font-size:14.6667px;white-space:normal"><br></span></div><d=
iv><span style=3D"font-family:Cantarell;font-size:14.6667px;white-space:nor=
mal">Regards,</span></div><div><span style=3D"font-family:Cantarell;font-si=
ze:14.6667px;white-space:normal">Andrej</span></div><div><br></div></span><=
/pre>
<div>On Tue, 2022-04-26 at 14:37 +0200, Martin Jansa wrote:</div>
<blockquote type=3D"cite" style=3D"margin:0px 0px 0px 0.8ex;border-left:2px=
 solid rgb(114,159,207);padding-left:1ex">
<div dir=3D"ltr">Hi,
<div><br>
</div>
<div>does this work correctly for you with nodejs-native?</div>
<div><br>
</div>
<div>Here it fails to load legacy module:</div>
<div>recipe-sysroot-native/usr/bin/node -p &#39;crypto.createHash(&quot;md4=
&quot;)&#39; --openssl-legacy-provider<br>
Unable to load legacy provider.<br>
node:internal/crypto/hash:67<br>
=C2=A0 this[kHandle] =3D new _Hash(algorithm, xofLen);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^<br>
<br>
Error: error:12800067:DSO support routines::could not load the shared libra=
ry<br>
=C2=A0 =C2=A0 at new Hash (node:internal/crypto/hash:67:19)<br>
=C2=A0 =C2=A0 at Object.createHash (node:crypto:130:10)<br>
=C2=A0 =C2=A0 at [eval]:1:8<br>
=C2=A0 =C2=A0 at Script.runInThisContext (node:vm:129:12)<br>
=C2=A0 =C2=A0 at Object.runInThisContext (node:vm:305:38)<br>
=C2=A0 =C2=A0 at node:internal/process/execution:76:19<br>
=C2=A0 =C2=A0 at [eval]-wrapper:6:22<br>
=C2=A0 =C2=A0 at evalScript (node:internal/process/execution:75:60)<br>
=C2=A0 =C2=A0 at node:internal/main/eval_string:27:3 {<br>
=C2=A0 opensslErrorStack: [<br>
=C2=A0 =C2=A0 &#39;error:03000086:digital envelope routines::initialization=
 error&#39;,<br>
=C2=A0 =C2=A0 &#39;error:0308010C:digital envelope routines::unsupported&#3=
9;,<br>
=C2=A0 =C2=A0 &#39;error:078C0105:common libcrypto routines::init fail&#39;=
,<br>
=C2=A0 =C2=A0 &#39;error:12800067:DSO support routines::could not load the =
shared library&#39;<br>
=C2=A0 ],<br>
=C2=A0 library: &#39;DSO support routines&#39;,<br>
=C2=A0 reason: &#39;could not load the shared library&#39;,<br>
=C2=A0 code: &#39;ERR_OSSL_DSO_COULD_NOT_LOAD_THE_SHARED_LIBRARY&#39;<br>
}<br>
</div>
<div><br>
</div>
<div>with LD_DEBUG I&#39;ve found that it is trying to load legacy.so from =
openssl-native WORKDIR (work/x86_64-linux/openssl-native/3.0.2-r0/recipe-sy=
sroot-native/usr/lib/ossl-modules/legacy.so) which is already removed by rm=
_work and as work around I need to set=C2=A0OPENSSL_MODULES=3D$(pwd)/recipe=
-sysroot-native/usr/lib/ossl-modules/
 and then it works:</div>
<div><br>
</div>
<div>OPENSSL_MODULES=3D$(pwd)/recipe-sysroot-native/usr/lib/ossl-modules/ r=
ecipe-sysroot-native/usr/bin/node -p &#39;crypto.createHash(&quot;md4&quot;=
)&#39; --openssl-legacy-provider<br>
Hash {<br>
=C2=A0 _options: undefined,<br>
=C2=A0 [Symbol(kHandle)]: Hash {},<br>
=C2=A0 [Symbol(kState)]: { [Symbol(kFinalized)]: false }<br>
}<br>
</div>
</div>
<div><br>
</div>
<div class=3D"gmail_quote">
<div dir=3D"ltr" class=3D"gmail_attr">On Sat, Mar 5, 2022 at 2:17 PM Andrej=
 Valek &lt;<a href=3D"mailto:andrej.valek@siemens.com" target=3D"_blank">an=
drej.valek@siemens.com</a>&gt; wrote:<br>
</div>
<blockquote type=3D"cite" style=3D"margin:0px 0px 0px 0.8ex;border-left:2px=
 solid rgb(114,159,207);padding-left:1ex">
<div>Current nodejs version v16 does not fully support new OpenSSL, so add =
option<br>
to use legacy provider.<br>
</div>
<div><br>
|=C2=A0 =C2=A0opensslErrorStack: [ &#39;error:03000086:digital envelope rou=
tines::initialization error&#39; ],<br>
|=C2=A0 =C2=A0library: &#39;digital envelope routines&#39;,<br>
|=C2=A0 =C2=A0reason: &#39;unsupported&#39;,<br>
|=C2=A0 =C2=A0code: &#39;ERR_OSSL_EVP_UNSUPPORTED&#39;<br>
</div>
<div><br>
It was blindly removed by upgrade to 16.14.0 version<br>
</div>
<div><br>
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
</div>
<div><br>
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
errer" target=3D"_blank">
https://github.com/nodejs/node/issues/40455</a><br>
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
get=3D"_blank">
https://v8.dev/blog/jitless</a><br>
+ [libuv threadpool documentation]: <a href=3D"https://docs.libuv.org/en/la=
test/threadpool.html" rel=3D"noreferrer" target=3D"_blank">
https://docs.libuv.org/en/latest/threadpool.html</a><br>
++[providers readme]: <a href=3D"https://github.com/openssl/openssl/blob/op=
enssl-3.0.0/README-PROVIDERS.md" rel=3D"noreferrer" target=3D"_blank">
https://github.com/openssl/openssl/blob/openssl-3.0.0/README-PROVIDERS.md</=
a><br>
+ [remote code execution]: <a href=3D"https://www.owasp.org/index.php/Code_=
Injection" rel=3D"noreferrer" target=3D"_blank">
https://www.owasp.org/index.php/Code_Injection</a><br>
+ [security warning]: #warning-binding-inspector-to-a-public-ipport-combina=
tion-is-insecure<br>
+ [timezone IDs]: <a href=3D"https://en.wikipedia.org/wiki/List_of_tz_datab=
ase_time_zones" rel=3D"noreferrer" target=3D"_blank">
https://en.wikipedia.org/wiki/List_of_tz_database_time_zones</a><br>
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
</div>
</blockquote>
</div>
</blockquote>
<div><br>
</div>
<div><span></span></div>
</div>
</blockquote>
</div>
</blockquote>
<div><br>
</div>
<div><span></span></div>
</div>

</blockquote></div>

--00000000000043326e05dd9cce14--

