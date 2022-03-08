Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8438CC433EF
	for <webhook@archiver.kernel.org>; Tue,  8 Mar 2022 18:02:19 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web09.11454.1646762538303499985
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Mar 2022 10:02:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kxE7F40X;
 spf=pass (domain: gmail.com, ip: 209.85.222.181,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id h196so1864363qke.12
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Mar 2022 10:02:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/EgjJYK2kI5eTYochOeD/ilw4iP8b7V3lVmbt0ljCbY=;
        b=kxE7F40XvrRPjIF1nROd/+B5ev302M4h3MBuOAjQ7yo3TTtiz+BB/wprFBp0h5z8kc
         GxvqEPB2KSTXMZH2W7sWlUjf/xw9EtEhwzpeL3bN7de9IpD/Dh25B35f1+oaaPntlQAV
         d7VMSkEaqcx/GyCBPhU29rx3T/5+r9fp6UObXSiJ4vvGidNYMElFMoKefQoObC3emehC
         phTf1pmS4wvFLZAYuhL0WjByBOYtKT+/7Q8rca8e5WAt5ME1w0lsvzmlWrzEWeh9Ad/J
         bwTB/oA7uyLclPQ8120HwrGKagR87VbW9G0QjXOvEEWE0stT0pQaBAqlllK2Ri3h4BvH
         ZLmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/EgjJYK2kI5eTYochOeD/ilw4iP8b7V3lVmbt0ljCbY=;
        b=HLdVUqsLmbP6GOO4rxw2oZ1M5pXhRFExFk7mR0nGcdNRXktKi0KcbllNtrjS+qw1FZ
         46ncLdIRthacoLUZZZdauBv9k6rkwZYmCOMz7lwLh7MNQW0d2PO2log7UGzGi4eXMl9+
         kv+h+00bArYIk6jqto2yLr+yon4hqk8iXWAK8SAusD6yJnIzoeyCJF+HjNSyYmGIQ119
         sYxXlKP8xVlJicwgrhFRXVeLCA8w/xlP/AHU6K+k6/oEFVsLtiMxcrTU3bmS7WvJZGx1
         gmN70+6FuAK8otyKZPAqSwACXl39LmCfhsbjN/kSseiTscJeZxV85Mxeu/VKaTEApRTY
         VCnA==
X-Gm-Message-State: AOAM531ryFU2Ibq/WfxomlOOMMueOJIxCf5ZbR8xRv+nHuNMYztTs4jl
	oEqeC1jm6jqPLIr9ZRlt0IMlXeLQtx4hEvxBZ+Y=
X-Google-Smtp-Source: 
 ABdhPJwNWKlqCO6X2QesToLAv0JPoDgp2sYVJ5MxocioV4RPfzyu0f9mD+GzbNdDppxuyXDGdcWcp90CnniUwnfqrzE=
X-Received: by 2002:a05:620a:4103:b0:67b:49f4:3ee4 with SMTP id
 j3-20020a05620a410300b0067b49f43ee4mr5353401qko.72.1646762537209; Tue, 08 Mar
 2022 10:02:17 -0800 (PST)
MIME-Version: 1.0
References: <20220218133121.222269-1-andrej.valek@siemens.com>
 <20220305131625.16138-1-andrej.valek@siemens.com>
 <1690792f-499a-6fcd-4938-52ed894fa052@gmail.com>
In-Reply-To: <1690792f-499a-6fcd-4938-52ed894fa052@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 8 Mar 2022 10:01:51 -0800
Message-ID: 
 <CAMKF1spFyhCD_yXvBqRv7EPV5Nr3b91oEgJvuz4b26V091J=JQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v2] nodejs: add option to use openssl legacy
 providers again
To: akuster808 <akuster808@gmail.com>
Cc: Andrej Valek <andrej.valek@siemens.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>,
	=?UTF-8?B?Wm9sdMOhbiBCw7ZzesO2cm3DqW55aQ==?= <zboszor@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Mar 2022 18:02:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95888

On Sat, Mar 5, 2022 at 11:47 AM akuster808 <akuster808@gmail.com> wrote:
>
>
>
> On 3/5/22 05:16, Andrej Valek wrote:
> > Current nodejs version v16 does not fully support new OpenSSL, so add option
> > to use legacy provider.
> >
> > |   opensslErrorStack: [ 'error:03000086:digital envelope routines::initialization error' ],
> > |   library: 'digital envelope routines',
> > |   reason: 'unsupported',
> > |   code: 'ERR_OSSL_EVP_UNSUPPORTED'
> >
> > It was blindly removed by upgrade to 16.14.0 version
> >
> > Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> > ---
> >   ...5-add-openssl-legacy-provider-option.patch | 151 ++++++++++++++++++
> >   .../recipes-devtools/nodejs/nodejs_16.14.0.bb |   1 +
> >   2 files changed, 152 insertions(+)
> >   create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0005-add-openssl-legacy-provider-option.patch
> >
> > diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0005-add-openssl-legacy-provider-option.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0005-add-openssl-legacy-provider-option.patch
> > new file mode 100644
> > index 000000000..5af6c6114
> > --- /dev/null
> > +++ b/meta-oe/recipes-devtools/nodejs/nodejs/0005-add-openssl-legacy-provider-option.patch
> > @@ -0,0 +1,151 @@
> > +From 86d1c0cc6a5dcf57e413a1cc1c29203e87cf9a14 Mon Sep 17 00:00:00 2001
> > +From: Daniel Bevenius <daniel.bevenius@gmail.com>
> > +Date: Sat, 16 Oct 2021 08:50:16 +0200
> > +Subject: [PATCH] src: add --openssl-legacy-provider option
> > +
> > +This commit adds an option to Node.js named --openssl-legacy-provider
> > +and if specified will load OpenSSL 3.0 Legacy provider.
> > +
> > +$ ./node --help
> > +...
> > +--openssl-legacy-provider  enable OpenSSL 3.0 legacy provider
> > +
> > +Example usage:
> > +
> > +$ ./node --openssl-legacy-provider  -p 'crypto.createHash("md4")'
> > +Hash {
> > +  _options: undefined,
> > +  [Symbol(kHandle)]: Hash {},
> > +  [Symbol(kState)]: { [Symbol(kFinalized)]: false }
> > +}
> > +
> > +Co-authored-by: Richard Lau <rlau@redhat.com>
> > +
> > +Refs: https://github.com/nodejs/node/issues/40455
>
> The patch is self is missing:
>
> Signed-off-by: "you"
> Upstream-Status: (see
> https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines)
>

right, this time I have addressed this myself for once.

>
> > +---
> > + doc/api/cli.md                                         | 10 ++++++++++
> > + src/crypto/crypto_util.cc                              | 10 ++++++++++
> > + src/node_options.cc                                    | 10 ++++++++++
> > + src/node_options.h                                     |  7 +++++++
> > + .../test-process-env-allowed-flags-are-documented.js   |  5 +++++
> > + 5 files changed, 42 insertions(+)
> > +
> > +diff --git a/doc/api/cli.md b/doc/api/cli.md
> > +index 74057706bf8d..608b9cdeddf1 100644
> > +--- a/doc/api/cli.md
> > ++++ b/doc/api/cli.md
> > +@@ -687,6 +687,14 @@ Load an OpenSSL configuration file on startup. Among other uses, this can be
> > + used to enable FIPS-compliant crypto if Node.js is built
> > + against FIPS-enabled OpenSSL.
> > +
> > ++### `--openssl-legacy-provider`
> > ++<!-- YAML
> > ++added: REPLACEME
> > ++-->
> > ++
> > ++Enable OpenSSL 3.0 legacy provider. For more information please see
> > ++[providers readme][].
> > ++
> > + ### `--pending-deprecation`
> > +
> > + <!-- YAML
> > +@@ -1544,6 +1552,7 @@ Node.js options that are allowed are:
> > + * `--no-warnings`
> > + * `--node-memory-debug`
> > + * `--openssl-config`
> > ++* `--openssl-legacy-provider`
> > + * `--pending-deprecation`
> > + * `--policy-integrity`
> > + * `--preserve-symlinks-main`
> > +@@ -1933,6 +1942,7 @@ $ node --max-old-space-size=1536 index.js
> > + [emit_warning]: process.md#processemitwarningwarning-options
> > + [jitless]: https://v8.dev/blog/jitless
> > + [libuv threadpool documentation]: https://docs.libuv.org/en/latest/threadpool.html
> > ++[providers readme]: https://github.com/openssl/openssl/blob/openssl-3.0.0/README-PROVIDERS.md
> > + [remote code execution]: https://www.owasp.org/index.php/Code_Injection
> > + [security warning]: #warning-binding-inspector-to-a-public-ipport-combination-is-insecure
> > + [timezone IDs]: https://en.wikipedia.org/wiki/List_of_tz_database_time_zones
> > +diff --git a/src/crypto/crypto_util.cc b/src/crypto/crypto_util.cc
> > +index 7e0c8ba3eb60..796ea3025e41 100644
> > +--- a/src/crypto/crypto_util.cc
> > ++++ b/src/crypto/crypto_util.cc
> > +@@ -148,6 +148,16 @@ void InitCryptoOnce() {
> > +   }
> > + #endif
> > +
> > ++#if OPENSSL_VERSION_MAJOR >= 3
> > ++  // --openssl-legacy-provider
> > ++  if (per_process::cli_options->openssl_legacy_provider) {
> > ++    OSSL_PROVIDER* legacy_provider = OSSL_PROVIDER_load(nullptr, "legacy");
> > ++    if (legacy_provider == nullptr) {
> > ++      fprintf(stderr, "Unable to load legacy provider.\n");
> > ++    }
> > ++  }
> > ++#endif
> > ++
> > +   OPENSSL_init_ssl(0, settings);
> > +   OPENSSL_INIT_free(settings);
> > +   settings = nullptr;
> > +diff --git a/src/node_options.cc b/src/node_options.cc
> > +index 00bdc6688a4c..3363860919a9 100644
> > +--- a/src/node_options.cc
> > ++++ b/src/node_options.cc
> > +@@ -4,6 +4,9 @@
> > + #include "env-inl.h"
> > + #include "node_binding.h"
> > + #include "node_internals.h"
> > ++#if HAVE_OPENSSL
> > ++#include "openssl/opensslv.h"
> > ++#endif
> > +
> > + #include <errno.h>
> > + #include <sstream>
> > +diff --git a/src/node_options.h b/src/node_options.h
> > +index fd772478d04d..1c0e018ab16f 100644
> > +--- a/src/node_options.h
> > ++++ b/src/node_options.h
> > +@@ -11,6 +11,10 @@
> > + #include "node_mutex.h"
> > + #include "util.h"
> > +
> > ++#if HAVE_OPENSSL
> > ++#include "openssl/opensslv.h"
> > ++#endif
> > ++
> > + namespace node {
> > +
> > + class HostPort {
> > +@@ -251,6 +255,9 @@ class PerProcessOptions : public Options {
> > +   bool enable_fips_crypto = false;
> > +   bool force_fips_crypto = false;
> > + #endif
> > ++#if OPENSSL_VERSION_MAJOR >= 3
> > ++  bool openssl_legacy_provider = false;
> > ++#endif
> > +
> > +   // Per-process because reports can be triggered outside a known V8 context.
> > +   bool report_on_fatalerror = false;
> > +diff --git a/test/parallel/test-process-env-allowed-flags-are-documented.js b/test/parallel/test-process-env-allowed-flags-are-documented.js
> > +index 64626b71f019..8a4e35997907 100644
> > +--- a/test/parallel/test-process-env-allowed-flags-are-documented.js
> > ++++ b/test/parallel/test-process-env-allowed-flags-are-documented.js
> > +@@ -43,6 +43,10 @@ for (const line of [...nodeOptionsLines, ...v8OptionsLines]) {
> > +   }
> > + }
> > +
> > ++if (!common.hasOpenSSL3) {
> > ++  documented.delete('--openssl-legacy-provider');
> > ++}
> > ++
> > + // Filter out options that are conditionally present.
> > + const conditionalOpts = [
> > +   {
> > +@@ -50,6 +54,7 @@ const conditionalOpts = [
> > +     filter: (opt) => {
> > +       return [
> > +         '--openssl-config',
> > ++        common.hasOpenSSL3 ? '--openssl-legacy-provider' : '',
> > +         '--tls-cipher-list',
> > +         '--use-bundled-ca',
> > +         '--use-openssl-ca',
> > +
> > diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_16.14.0.bb b/meta-oe/recipes-devtools/nodejs/nodejs_16.14.0.bb
> > index 9514ec499..7b9644ec8 100644
> > --- a/meta-oe/recipes-devtools/nodejs/nodejs_16.14.0.bb
> > +++ b/meta-oe/recipes-devtools/nodejs/nodejs_16.14.0.bb
> > @@ -20,6 +20,7 @@ SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
> >              file://0001-Disable-running-gyp-files-for-bundled-deps.patch \
> >              file://0002-Install-both-binaries-and-use-libdir.patch \
> >              file://0004-v8-don-t-override-ARM-CFLAGS.patch \
> > +           file://0005-add-openssl-legacy-provider-option.patch \
> >              file://big-endian.patch \
> >              file://mips-less-memory.patch \
> >              file://system-c-ares.patch \
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#95799): https://lists.openembedded.org/g/openembedded-devel/message/95799
> > Mute This Topic: https://lists.openembedded.org/mt/89569235/3616698
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [akuster808@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>

