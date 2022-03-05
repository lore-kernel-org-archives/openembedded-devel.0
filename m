Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36FE0C433EF
	for <webhook@archiver.kernel.org>; Sat,  5 Mar 2022 19:47:28 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web09.8815.1646509647478182624
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Mar 2022 11:47:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oePlbDvl;
 spf=pass (domain: gmail.com, ip: 209.85.216.47,
 mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id cx5so10009149pjb.1
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Mar 2022 11:47:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=62zd0hz8TzmYoCw4Jw8KHkxcIrs6L4xIxLYkcdpAddY=;
        b=oePlbDvlgERONbp0hz8RtB6/vjzFl7kYg3wRT/FKLuN1bc8Ib6EdN3DpmNpdW0kCUa
         E3SYb8+QIGn2BTlNlzd+nPvq9rZEUooGU4Q89d38HZ1uQhIPDAzUY6k3k0SObqBY2PLJ
         JjI8S4a7W+H6udMzKYa3DU22pIE6IOyG8H4vPG3la5jvcFM9XuZEGjJ8EuyzcRxhh93I
         RxDKibQijS2BgQpQ3luKUPXIqA/0t5+rToDDvRuYJi/0WMuIlu0K1NBkypqUzq8bMNTV
         ne36x+Ko3TmvcK7l3NfzVHxyWRekCeqaaAYHOr20PDGKDzK9UKnQTduFpLBh7mAkiL+o
         AxOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=62zd0hz8TzmYoCw4Jw8KHkxcIrs6L4xIxLYkcdpAddY=;
        b=ciEalSEpvFdY+S8oedx0mO0sPmX2hq/J/UyTySLrN6sz7fIq9+LpZtMDp0WeEkHvDv
         RTm6UrwRHA2U+E+BVEH2GadRw+xmaDNQs+g41HNkdzi0hbCyrKMi9etsWyshtMy2aO3z
         lHetQ6ny2mrJ9pA2HP9RQp9kzk51gh+pxPBeNErs6PfgwFHJ6CdrJVcjjo8fZNhu54AA
         McZ6VIZlx+WAiwrgW7bw2d2ynIYaHYDvwdg70xM800RBYgIVR6Jj5oFj86mjN7q9vP9g
         omblZdQtAeIVBd+omK3GxJGsuI/i1qyOWbS063MHcFCJKm0+7l66MZNxpmW/9igMvanz
         QWiw==
X-Gm-Message-State: AOAM532+qCaTfPIQzU1n2uhTKh+6QQpe1R5ZeRvRM7+xzIRTJxDE6jAn
	Y+OxWvg+v6HGd1ZABLKhZbw=
X-Google-Smtp-Source: 
 ABdhPJyM8p8lP4QadMz4BigO4teLxNzqtN8Rl5lMmvIeRX74sB6KNMH0wD4Xsjqp+GUDbPQTycz7AA==
X-Received: by 2002:a17:903:32c3:b0:151:58b1:adf8 with SMTP id
 i3-20020a17090332c300b0015158b1adf8mr4723806plr.29.1646509646746;
        Sat, 05 Mar 2022 11:47:26 -0800 (PST)
Received: from ?IPV6:2601:202:4180:a5c0:2999:fd67:72a5:6dc5?
 ([2601:202:4180:a5c0:2999:fd67:72a5:6dc5])
        by smtp.gmail.com with ESMTPSA id
 s33-20020a056a0017a100b004bf85a94ef2sm10833085pfg.183.2022.03.05.11.47.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Mar 2022 11:47:26 -0800 (PST)
Message-ID: <1690792f-499a-6fcd-4938-52ed894fa052@gmail.com>
Date: Sat, 5 Mar 2022 11:47:25 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [oe] [meta-oe][PATCH v2] nodejs: add option to use openssl legacy
 providers again
Content-Language: en-US
To: Andrej Valek <andrej.valek@siemens.com>,
 openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com, zboszor@gmail.com
References: <20220218133121.222269-1-andrej.valek@siemens.com>
 <20220305131625.16138-1-andrej.valek@siemens.com>
From: akuster808 <akuster808@gmail.com>
In-Reply-To: <20220305131625.16138-1-andrej.valek@siemens.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 05 Mar 2022 19:47:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95805



On 3/5/22 05:16, Andrej Valek wrote:
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
>   ...5-add-openssl-legacy-provider-option.patch | 151 ++++++++++++++++++
>   .../recipes-devtools/nodejs/nodejs_16.14.0.bb |   1 +
>   2 files changed, 152 insertions(+)
>   create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0005-add-openssl-legacy-provider-option.patch
>
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0005-add-openssl-legacy-provider-option.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0005-add-openssl-legacy-provider-option.patch
> new file mode 100644
> index 000000000..5af6c6114
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/nodejs/nodejs/0005-add-openssl-legacy-provider-option.patch
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

The patch is self is missing:

Signed-off-by: "you"
Upstream-Status: (see 
https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines)


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
> +@@ -687,6 +687,14 @@ Load an OpenSSL configuration file on startup. Among other uses, this can be
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
> + [libuv threadpool documentation]: https://docs.libuv.org/en/latest/threadpool.html
> ++[providers readme]: https://github.com/openssl/openssl/blob/openssl-3.0.0/README-PROVIDERS.md
> + [remote code execution]: https://www.owasp.org/index.php/Code_Injection
> + [security warning]: #warning-binding-inspector-to-a-public-ipport-combination-is-insecure
> + [timezone IDs]: https://en.wikipedia.org/wiki/List_of_tz_database_time_zones
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
> +@@ -43,6 +43,10 @@ for (const line of [...nodeOptionsLines, ...v8OptionsLines]) {
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
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_16.14.0.bb b/meta-oe/recipes-devtools/nodejs/nodejs_16.14.0.bb
> index 9514ec499..7b9644ec8 100644
> --- a/meta-oe/recipes-devtools/nodejs/nodejs_16.14.0.bb
> +++ b/meta-oe/recipes-devtools/nodejs/nodejs_16.14.0.bb
> @@ -20,6 +20,7 @@ SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
>              file://0001-Disable-running-gyp-files-for-bundled-deps.patch \
>              file://0002-Install-both-binaries-and-use-libdir.patch \
>              file://0004-v8-don-t-override-ARM-CFLAGS.patch \
> +           file://0005-add-openssl-legacy-provider-option.patch \
>              file://big-endian.patch \
>              file://mips-less-memory.patch \
>              file://system-c-ares.patch \
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#95799): https://lists.openembedded.org/g/openembedded-devel/message/95799
> Mute This Topic: https://lists.openembedded.org/mt/89569235/3616698
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [akuster808@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


