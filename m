Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4653DC433EF
	for <webhook@archiver.kernel.org>; Sat,  5 Mar 2022 01:41:51 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web11.1833.1646444510735444305
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Mar 2022 17:41:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KNH64LHs;
 spf=pass (domain: gmail.com, ip: 209.85.222.181,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id v5so7849605qkj.4
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Mar 2022 17:41:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zEvYrsoTOLqHqjPypsCoJDTSg0ISS2F/ndnjY1RndsM=;
        b=KNH64LHsCfr4ueoponlUQhOHujUOy/ovvBHkqsAa49Nx0QE2LFD+9TugXQgacCV1NC
         UliCp3BRmerxwMa74eJvBDQuWSZ1SZGN9gVeNcdySn0aa5FAnz76uq7mwMmLx42/Y3bb
         EOMYOM8G16xWoEcZLctiIyTALtF0IAi7LyAzrmhgSUpNJV+gGxV/u8gaIx6AX1VIEHcU
         ZUKnrVbtnLK0h7hNfdqYIthdwvsyStBqYYmZT1BabLykOOhreMWCajyHsbhSJfY0xTij
         EWWKQuiYcEWT1N1aHmpINM+tOXyTYXaCuaxNgJ/NVrfloL42Bcu26cr76BlUknasLJqe
         K7GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zEvYrsoTOLqHqjPypsCoJDTSg0ISS2F/ndnjY1RndsM=;
        b=pZAVvDp3Rb1jgLokw4KPds16GUV1YfLWeUPoDPTyWehimREW0kXGABbva9RVU1WnHW
         KVh60wIeMCYJPZtgnyjz/Fbw7voPlE593g80umXAuRY9UQCgiepOE3NqwkdDSF3sLScm
         P4O7Hg8oEPK2g7YcEzwg9Lz9SG1NwK1iOHaITKGRCdsghDQuUaKSZRNOixLv44fV1PVm
         jqMSA1gYAK1O9+QVaJnEWuAxTc3mxBLHijYbeZRoK7K8HcUCxm2DTrcc1r9gAYGeSp9k
         Vus1nsC6VTZZ9s6kANkDhcDM+yLGiLVkjzHgcsh5Sw/c+r6k784yIVU0TmBYfmAt6XwO
         g5ag==
X-Gm-Message-State: AOAM533Mmu014R/EpIFimELWGYp8pIDEcJU2gyvKC00ZS7ku9CDHFnnC
	ZjfPn45kp6LET0rwSaeKHglRrl/VsDMLkXSzj3Y=
X-Google-Smtp-Source: 
 ABdhPJxZv5MJDKzPiDYisYCqDsM9xhpT4mihbMW3WPCzvOqCUVN8CtgybYpWf1v8NyTtagHrGgfz8ZQTwovYgGIy4i0=
X-Received: by 2002:a05:620a:1593:b0:60a:b223:893a with SMTP id
 d19-20020a05620a159300b0060ab223893amr984204qkk.72.1646444509660; Fri, 04 Mar
 2022 17:41:49 -0800 (PST)
MIME-Version: 1.0
References: <20220304133822.68214-1-andrej.valek@siemens.com>
In-Reply-To: <20220304133822.68214-1-andrej.valek@siemens.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 4 Mar 2022 17:41:23 -0800
Message-ID: 
 <CAMKF1so86b5X3hOLUCLMuc_nGRRFqJwDG3YMbxEcKrX+=BB-6Q@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] nodejs: add option to use openssl legacy
 providers again
To: Andrej Valek <andrej.valek@siemens.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	=?UTF-8?B?Wm9sdMOhbiBCw7ZzesO2cm3DqW55aQ==?= <zboszor@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 05 Mar 2022 01:41:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95797

fails to apply

https://errors.yoctoproject.org/Errors/Details/651075/
https://errors.yoctoproject.org/Errors/Details/651076/

On Fri, Mar 4, 2022 at 5:38 AM Andrej Valek <andrej.valek@siemens.com> wrote:
>
> Current nodejs version v16 does not fully support new OpenSSL, so add option
> to use legacy provider.
>
> |   opensslErrorStack: [ 'error:03000086:digital envelope routines::initialization error' ],
> |   library: 'digital envelope routines',
> |   reason: 'unsupported',
> |   code: 'ERR_OSSL_EVP_UNSUPPORTED'
>
> It was blindly removed by upgrade to 16.14.0 version
>
> Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> ---
>  ...5-add-openssl-legacy-provider-option.patch | 165 ++++++++++++++++++
>  .../recipes-devtools/nodejs/nodejs_16.14.0.bb |   1 +
>  2 files changed, 166 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0005-add-openssl-legacy-provider-option.patch
>
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0005-add-openssl-legacy-provider-option.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0005-add-openssl-legacy-provider-option.patch
> new file mode 100644
> index 000000000..2e66a0282
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/nodejs/nodejs/0005-add-openssl-legacy-provider-option.patch
> @@ -0,0 +1,165 @@
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
> +@@ -652,6 +652,14 @@ Load an OpenSSL configuration file on startup. Among other uses, this can be
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
> + <!-- YAML
> + added: v8.0.0
> +@@ -1444,6 +1452,7 @@ Node.js options that are allowed are:
> + * `--no-warnings`
> + * `--node-memory-debug`
> + * `--openssl-config`
> ++* `--openssl-legacy-provider`
> + * `--pending-deprecation`
> + * `--policy-integrity`
> + * `--preserve-symlinks-main`
> +@@ -1814,6 +1823,7 @@ $ node --max-old-space-size=1536 index.js
> + [emit_warning]: process.md#process_process_emitwarning_warning_type_code_ctor
> + [jitless]: https://v8.dev/blog/jitless
> + [libuv threadpool documentation]: https://docs.libuv.org/en/latest/threadpool.html
> ++[providers readme]: https://github.com/openssl/openssl/blob/openssl-3.0.0/README-PROVIDERS.md
> + [remote code execution]: https://www.owasp.org/index.php/Code_Injection
> + [timezone IDs]: https://en.wikipedia.org/wiki/List_of_tz_database_time_zones
> + [ways that `TZ` is handled in other environments]: https://www.gnu.org/software/libc/manual/html_node/TZ-Variable.html
> +diff --git a/src/crypto/crypto_util.cc b/src/crypto/crypto_util.cc
> +index 7e0c8ba3eb60..796ea3025e41 100644
> +--- a/src/crypto/crypto_util.cc
> ++++ b/src/crypto/crypto_util.cc
> +@@ -136,6 +136,16 @@ void InitCryptoOnce() {
> +   }
> + #endif
> +
> ++#if OPENSSL_VERSION_MAJOR >= 3
> ++  // --openssl-legacy-provider
> ++  if (per_process::cli_options->openssl_legacy_provider) {
> ++    OSSL_PROVIDER* legacy_provider = OSSL_PROVIDER_load(nullptr, "legacy");
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
> +@@ -809,6 +812,13 @@ PerProcessOptionsParser::PerProcessOptionsParser(
> +             &PerProcessOptions::secure_heap_min,
> +             kAllowedInEnvironment);
> + #endif
> ++#if OPENSSL_VERSION_MAJOR >= 3
> ++  AddOption("--openssl-legacy-provider",
> ++            "enable OpenSSL 3.0 legacy provider",
> ++            &PerProcessOptions::openssl_legacy_provider,
> ++            kAllowedInEnvironment);
> ++
> ++#endif  // OPENSSL_VERSION_MAJOR
> +   AddOption("--use-largepages",
> +             "Map the Node.js static code to large pages. Options are "
> +             "'off' (the default value, meaning do not map), "
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
> +   // Per-process because reports can be triggered outside a known V8 context.
> +   bool report_on_fatalerror = false;
> +diff --git a/test/parallel/test-process-env-allowed-flags-are-documented.js b/test/parallel/test-process-env-allowed-flags-are-documented.js
> +index 64626b71f019..8a4e35997907 100644
> +--- a/test/parallel/test-process-env-allowed-flags-are-documented.js
> ++++ b/test/parallel/test-process-env-allowed-flags-are-documented.js
> +@@ -40,6 +40,10 @@ for (const line of [...nodeOptionsLines, ...v8OptionsLines]) {
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
> +@@ -47,6 +51,7 @@ const conditionalOpts = [
> +     filter: (opt) => {
> +       return [
> +         '--openssl-config',
> ++        common.hasOpenSSL3 ? '--openssl-legacy-provider' : '',
> +         '--tls-cipher-list',
> +         '--use-bundled-ca',
> +         '--use-openssl-ca',
> +
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_16.14.0.bb b/meta-oe/recipes-devtools/nodejs/nodejs_16.14.0.bb
> index 9514ec499..7b9644ec8 100644
> --- a/meta-oe/recipes-devtools/nodejs/nodejs_16.14.0.bb
> +++ b/meta-oe/recipes-devtools/nodejs/nodejs_16.14.0.bb
> @@ -20,6 +20,7 @@ SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
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
> View/Reply Online (#95782): https://lists.openembedded.org/g/openembedded-devel/message/95782
> Mute This Topic: https://lists.openembedded.org/mt/89548688/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

