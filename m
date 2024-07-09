Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5C13C2BD09
	for <webhook@archiver.kernel.org>; Tue,  9 Jul 2024 12:12:09 +0000 (UTC)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
 by mx.groups.io with SMTP id smtpd.web11.11394.1720527128810166541
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jul 2024 05:12:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UGXRbCXM;
 spf=pass (domain: gmail.com, ip: 209.85.219.177, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e02748b2402so5469899276.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 Jul 2024 05:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720527128; x=1721131928; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=umvM4rcZo+DOGUJkIzilLSQOaV0dKQKx0scrK/i5d+0=;
        b=UGXRbCXM3hncMxg59GyuL1OwCIIPvNGdtbsAIgpngem72ZHr2oTc0XXwwOGAOQepwy
         thzCKszHD76Ad570m9tErrkQpO5YG2fTXA7RI0vCY1/BLUcxLdgXa+vY6bNsX4pbKuD4
         ov+vDmreyd0JELfFrBoLxX1B7HxuP0cPLGqmXN69qSJmfYBjAYLnWe+U0etxMcm+k9zH
         srG1WRThZDZ/2dPF/qyGRzTQHeWazzAmHGxJhCK3r8bXl1N4FWG0Kgy6Mv/WFBL7Ko2I
         YEVSaFKeyqlyPg0fhvtetvVnqUH27yH/u7hbQonpaAVoz8UJZVUFZRMd/0CJpYCUePkI
         s4rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720527128; x=1721131928;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=umvM4rcZo+DOGUJkIzilLSQOaV0dKQKx0scrK/i5d+0=;
        b=Wxj+XXj2D03zoSY1/ltHRnKGe+CfqND00Y9qjpZJHaElf0TdyMUdwxihYactqp9oDo
         6E1eyI4BK5MAu3M14MbTDN9AIh92X37O8aai5bXlUc8HSVZfnVTXBD8QO1xxXCXCEnTu
         I18dxsuAwoLFeHK6BAKoF/OwGSuQfrS4J8W0NlU8flufyUpksGHjv8CRBZLijJmEAnXQ
         fKt4MV9qRT0GcnslfjNY1wC8Dk2DzaCqzzbvZ6BKOum83SIxkdk2XpFtN6xXt8XZ9qIw
         kPDDXl2+fpZfwA33dqTEkh2btPk7Trkg4+Eh8MhySasUuefANzTl2RTyr/zd+ggHF3F6
         1D/A==
X-Forwarded-Encrypted: i=1; AJvYcCXnIkgCmKx/QewyG7o0C4xySEbfpLzGWBc1fFVf1EM+x80lPmyE6PGEYOtkgc2GqMXFPU6Dfxlfrs89Y/b9dvDbkuPMuhnGDN32MQLARbwVfzEdEMVI0FLKpA==
X-Gm-Message-State: AOJu0Yw27VwT3rHdB+QcB+rZ1RzoGhdZ8eDzm2SmpE8wHvz4KVXEhwl6
	FBsMTQ3swA5Jj320B05Mh/AVQoIgBL3n2qA4NzVFP1MI2y3mMIwi
X-Google-Smtp-Source: AGHT+IH/bp07n7TQ/8yHC5HQ6WzWgL2cYl/6YoDK7K7umi7NTlx8Imk7N4HYm/QEWlja+ziZ7Blmig==
X-Received: by 2002:a05:690c:3403:b0:64a:d5fd:f198 with SMTP id 00721157ae682-658ee790d03mr33075297b3.6.1720527127525;
        Tue, 09 Jul 2024 05:12:07 -0700 (PDT)
Received: from ?IPV6:2600:1700:45dd:7000:62f2:f407:c2db:c6c3? ([2600:1700:45dd:7000:62f2:f407:c2db:c6c3])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-658e68e5195sm3175577b3.105.2024.07.09.05.12.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jul 2024 05:12:07 -0700 (PDT)
Message-ID: <26a61314-0aa1-4e5c-ac71-d0ece3591362@gmail.com>
Date: Tue, 9 Jul 2024 08:12:06 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-python][scarthgap][PATCH] python3-pydantic-core:
 upgrade 2.16.3 -> 2.18.1
To: dev@g0hl1n.net, openembedded-devel@lists.openembedded.org
References: <20240706180810.1707296-1-dev@g0hl1n.net>
Content-Language: en-US
From: akuster808 <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; keydata=
 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
 ApZ86eOP
In-Reply-To: <20240706180810.1707296-1-dev@g0hl1n.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Jul 2024 12:12:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111284

Hello Richard,

On 7/6/24 2:08 PM, Richard Leitner via lists.openembedded.org wrote:
> The currently available python-3-pydantic v2.7.0 requires
> python3-pydantic-core to be updated to v2.18.1.
I don't see the updated or later version in master? Am I missing something?

- Armin

>
> Removed patch: 0001-Bumps-pyo3-https-github.com-pyo3-pyo3-from-0.20.2-to:
>   The pyo3 version bump patch is dropped as the pyo3 version in
>   python3-pydantic-core was updated to a newer one.
>
> Added patch: 0001-Lower-MSRV-to-1.75-1316:
>   This patch for lowering the MSRV to 1.75 (from 1.76) is backported to
>   fix the build (as scarthgap provides rust 1.75).
>
> Added patch: 0001-Fix-generate_self_schema-for-Python-3.12-1299:
>   This patch fixes following build error for python 3.12+ (which we have):
>   TypeError: ForwardRef._evaluate() missing 1 required keyword-only argument: 'recursive_guard'
>
> Updated crate dependencies:
>   ahash: 0.8.7 -> 0.8.10
>   enum_dispatch: 0.3.12 -> 0.3.13
>   indexmap: 2.0.0 -> 2.2.2
>   jiter: 0.0.6 -> 0.2.1
>   pyo3: 0.20.3 -> 0.21.1
>   regex: 1.10.2 -> 1.10.3
>   regex-automata: 0.4.3 -> 0.4.5
>   serde: 1.0.195 -> 1.0.197
>   serde_derive: 1.0.195 -> 1.0.197
>   serde_json: 1.0.109 -> 1.0.114
>   smallvec: 1.11.2 -> 1.13.2
>   speedate: 0.13.0 -> 0.14.0
>   uuid: 1.6.1 -> 1.7.0
>
> Added new crate dependencies:
>   strum_macros: 0.26.1
>
> Removed crate dependencies:
>   allocator-api2
>   lexical-core
>   lexical-write-float
>   lexical-write-integer
>
> Changelog:
>   https://github.com/pydantic/pydantic-core/releases
>
> Signed-off-by: Richard Leitner <dev@g0hl1n.net>
> ---
>   .../python/python3-pydantic-core-crates.inc   |  78 +++++------
>   ...-github.com-pyo3-pyo3-from-0.20.2-to.patch | 126 ------------------
>   ...ate_self_schema-for-Python-3.12-1299.patch |  32 +++++
>   .../0001-Lower-MSRV-to-1.75-1316.patch        |  25 ++++
>   ...6.3.bb => python3-pydantic-core_2.18.1.bb} |   7 +-
>   5 files changed, 98 insertions(+), 170 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python3-pydantic-core/0001-Bumps-pyo3-https-github.com-pyo3-pyo3-from-0.20.2-to.patch
>   create mode 100644 meta-python/recipes-devtools/python/python3-pydantic-core/0001-Fix-generate_self_schema-for-Python-3.12-1299.patch
>   create mode 100644 meta-python/recipes-devtools/python/python3-pydantic-core/0001-Lower-MSRV-to-1.75-1316.patch
>   rename meta-python/recipes-devtools/python/{python3-pydantic-core_2.16.3.bb => python3-pydantic-core_2.18.1.bb} (87%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pydantic-core-crates.inc b/meta-python/recipes-devtools/python/python3-pydantic-core-crates.inc
> index dd2027948..866cd9cf0 100644
> --- a/meta-python/recipes-devtools/python/python3-pydantic-core-crates.inc
> +++ b/meta-python/recipes-devtools/python/python3-pydantic-core-crates.inc
> @@ -2,31 +2,27 @@
>   
>   # from Cargo.lock
>   SRC_URI += " \
> -    crate://crates.io/ahash/0.8.7 \
> +    crate://crates.io/ahash/0.8.10 \
>       crate://crates.io/aho-corasick/1.0.2 \
> -    crate://crates.io/allocator-api2/0.2.16 \
>       crate://crates.io/autocfg/1.1.0 \
>       crate://crates.io/base64/0.21.7 \
>       crate://crates.io/bitflags/1.3.2 \
>       crate://crates.io/cc/1.0.79 \
>       crate://crates.io/cfg-if/1.0.0 \
> -    crate://crates.io/enum_dispatch/0.3.12 \
> +    crate://crates.io/enum_dispatch/0.3.13 \
>       crate://crates.io/equivalent/1.0.1 \
>       crate://crates.io/form_urlencoded/1.2.1 \
>       crate://crates.io/getrandom/0.2.10 \
>       crate://crates.io/hashbrown/0.14.3 \
>       crate://crates.io/heck/0.4.1 \
>       crate://crates.io/idna/0.5.0 \
> -    crate://crates.io/indexmap/2.0.0 \
> +    crate://crates.io/indexmap/2.2.2 \
>       crate://crates.io/indoc/2.0.4 \
>       crate://crates.io/itoa/1.0.8 \
> -    crate://crates.io/jiter/0.0.6 \
> -    crate://crates.io/lexical-core/0.8.5 \
> +    crate://crates.io/jiter/0.2.1 \
>       crate://crates.io/lexical-parse-float/0.8.5 \
>       crate://crates.io/lexical-parse-integer/0.8.6 \
>       crate://crates.io/lexical-util/0.8.5 \
> -    crate://crates.io/lexical-write-float/0.8.5 \
> -    crate://crates.io/lexical-write-integer/0.8.5 \
>       crate://crates.io/libc/0.2.147 \
>       crate://crates.io/lock_api/0.4.10 \
>       crate://crates.io/memchr/2.6.3 \
> @@ -40,28 +36,29 @@ SRC_URI += " \
>       crate://crates.io/percent-encoding/2.3.1 \
>       crate://crates.io/portable-atomic/1.6.0 \
>       crate://crates.io/proc-macro2/1.0.76 \
> -    crate://crates.io/pyo3/0.20.3 \
> -    crate://crates.io/pyo3-build-config/0.20.3 \
> -    crate://crates.io/pyo3-ffi/0.20.3 \
> -    crate://crates.io/pyo3-macros/0.20.3 \
> -    crate://crates.io/pyo3-macros-backend/0.20.3 \
> +    crate://crates.io/pyo3/0.21.1 \
> +    crate://crates.io/pyo3-build-config/0.21.1 \
> +    crate://crates.io/pyo3-ffi/0.21.1 \
> +    crate://crates.io/pyo3-macros/0.21.1 \
> +    crate://crates.io/pyo3-macros-backend/0.21.1 \
>       crate://crates.io/python3-dll-a/0.2.9 \
>       crate://crates.io/quote/1.0.35 \
>       crate://crates.io/redox_syscall/0.3.5 \
> -    crate://crates.io/regex/1.10.2 \
> -    crate://crates.io/regex-automata/0.4.3 \
> +    crate://crates.io/regex/1.10.3 \
> +    crate://crates.io/regex-automata/0.4.5 \
>       crate://crates.io/regex-syntax/0.8.2 \
>       crate://crates.io/rustversion/1.0.13 \
>       crate://crates.io/ryu/1.0.14 \
>       crate://crates.io/scopeguard/1.1.0 \
> -    crate://crates.io/serde/1.0.195 \
> -    crate://crates.io/serde_derive/1.0.195 \
> -    crate://crates.io/serde_json/1.0.109 \
> -    crate://crates.io/smallvec/1.11.2 \
> -    crate://crates.io/speedate/0.13.0 \
> +    crate://crates.io/serde/1.0.197 \
> +    crate://crates.io/serde_derive/1.0.197 \
> +    crate://crates.io/serde_json/1.0.114 \
> +    crate://crates.io/smallvec/1.13.2 \
> +    crate://crates.io/speedate/0.14.0 \
>       crate://crates.io/static_assertions/1.1.0 \
>       crate://crates.io/strum/0.25.0 \
>       crate://crates.io/strum_macros/0.25.3 \
> +    crate://crates.io/strum_macros/0.26.1 \
>       crate://crates.io/syn/2.0.48 \
>       crate://crates.io/target-lexicon/0.12.9 \
>       crate://crates.io/tinyvec/1.6.0 \
> @@ -71,7 +68,7 @@ SRC_URI += " \
>       crate://crates.io/unicode-normalization/0.1.22 \
>       crate://crates.io/unindent/0.2.3 \
>       crate://crates.io/url/2.5.0 \
> -    crate://crates.io/uuid/1.6.1 \
> +    crate://crates.io/uuid/1.7.0 \
>       crate://crates.io/version_check/0.9.4 \
>       crate://crates.io/wasi/0.11.0+wasi-snapshot-preview1 \
>       crate://crates.io/windows-targets/0.48.1 \
> @@ -86,31 +83,27 @@ SRC_URI += " \
>       crate://crates.io/zerocopy-derive/0.7.32 \
>   "
>   
> -SRC_URI[ahash-0.8.7.sha256sum] = "77c3a9648d43b9cd48db467b3f87fdd6e146bcc88ab0180006cef2179fe11d01"
> +SRC_URI[ahash-0.8.10.sha256sum] = "8b79b82693f705137f8fb9b37871d99e4f9a7df12b917eed79c3d3954830a60b"
>   SRC_URI[aho-corasick-1.0.2.sha256sum] = "43f6cb1bf222025340178f382c426f13757b2960e89779dfcb319c32542a5a41"
> -SRC_URI[allocator-api2-0.2.16.sha256sum] = "0942ffc6dcaadf03badf6e6a2d0228460359d5e34b57ccdc720b7382dfbd5ec5"
>   SRC_URI[autocfg-1.1.0.sha256sum] = "d468802bab17cbc0cc575e9b053f41e72aa36bfa6b7f55e3529ffa43161b97fa"
>   SRC_URI[base64-0.21.7.sha256sum] = "9d297deb1925b89f2ccc13d7635fa0714f12c87adce1c75356b39ca9b7178567"
>   SRC_URI[bitflags-1.3.2.sha256sum] = "bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a"
>   SRC_URI[cc-1.0.79.sha256sum] = "50d30906286121d95be3d479533b458f87493b30a4b5f79a607db8f5d11aa91f"
>   SRC_URI[cfg-if-1.0.0.sha256sum] = "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd"
> -SRC_URI[enum_dispatch-0.3.12.sha256sum] = "8f33313078bb8d4d05a2733a94ac4c2d8a0df9a2b84424ebf4f33bfc224a890e"
> +SRC_URI[enum_dispatch-0.3.13.sha256sum] = "aa18ce2bc66555b3218614519ac839ddb759a7d6720732f979ef8d13be147ecd"
>   SRC_URI[equivalent-1.0.1.sha256sum] = "5443807d6dff69373d433ab9ef5378ad8df50ca6298caf15de6e52e24aaf54d5"
>   SRC_URI[form_urlencoded-1.2.1.sha256sum] = "e13624c2627564efccf4934284bdd98cbaa14e79b0b5a141218e507b3a823456"
>   SRC_URI[getrandom-0.2.10.sha256sum] = "be4136b2a15dd319360be1c07d9933517ccf0be8f16bf62a3bee4f0d618df427"
>   SRC_URI[hashbrown-0.14.3.sha256sum] = "290f1a1d9242c78d09ce40a5e87e7554ee637af1351968159f4952f028f75604"
>   SRC_URI[heck-0.4.1.sha256sum] = "95505c38b4572b2d910cecb0281560f54b440a19336cbbcb27bf6ce6adc6f5a8"
>   SRC_URI[idna-0.5.0.sha256sum] = "634d9b1461af396cad843f47fdba5597a4f9e6ddd4bfb6ff5d85028c25cb12f6"
> -SRC_URI[indexmap-2.0.0.sha256sum] = "d5477fe2230a79769d8dc68e0eabf5437907c0457a5614a9e8dddb67f65eb65d"
> +SRC_URI[indexmap-2.2.2.sha256sum] = "824b2ae422412366ba479e8111fd301f7b5faece8149317bb81925979a53f520"
>   SRC_URI[indoc-2.0.4.sha256sum] = "1e186cfbae8084e513daff4240b4797e342f988cecda4fb6c939150f96315fd8"
>   SRC_URI[itoa-1.0.8.sha256sum] = "62b02a5381cc465bd3041d84623d0fa3b66738b52b8e2fc3bab8ad63ab032f4a"
> -SRC_URI[jiter-0.0.6.sha256sum] = "87db066a99f69382be06d02313f8ce989996b53a04a8a70cfd1a6483a56227f7"
> -SRC_URI[lexical-core-0.8.5.sha256sum] = "2cde5de06e8d4c2faabc400238f9ae1c74d5412d03a7bd067645ccbc47070e46"
> +SRC_URI[jiter-0.2.1.sha256sum] = "8e1177860adcf80c1ae7d7c1d41561f008c7530664caebbfa5ddd8a7f7316b98"
>   SRC_URI[lexical-parse-float-0.8.5.sha256sum] = "683b3a5ebd0130b8fb52ba0bdc718cc56815b6a097e28ae5a6997d0ad17dc05f"
>   SRC_URI[lexical-parse-integer-0.8.6.sha256sum] = "6d0994485ed0c312f6d965766754ea177d07f9c00c9b82a5ee62ed5b47945ee9"
>   SRC_URI[lexical-util-0.8.5.sha256sum] = "5255b9ff16ff898710eb9eb63cb39248ea8a5bb036bea8085b1a767ff6c4e3fc"
> -SRC_URI[lexical-write-float-0.8.5.sha256sum] = "accabaa1c4581f05a3923d1b4cfd124c329352288b7b9da09e766b0668116862"
> -SRC_URI[lexical-write-integer-0.8.5.sha256sum] = "e1b6f3d1f4422866b68192d62f77bc5c700bee84f3069f2469d7bc8c77852446"
>   SRC_URI[libc-0.2.147.sha256sum] = "b4668fb0ea861c1df094127ac5f1da3409a82116a4ba74fca2e58ef927159bb3"
>   SRC_URI[lock_api-0.4.10.sha256sum] = "c1cc9717a20b1bb222f333e6a92fd32f7d8a18ddc5a3191a11af45dcbf4dcd16"
>   SRC_URI[memchr-2.6.3.sha256sum] = "8f232d6ef707e1956a43342693d2a31e72989554d58299d7a88738cc95b0d35c"
> @@ -124,28 +117,29 @@ SRC_URI[parking_lot_core-0.9.8.sha256sum] = "93f00c865fe7cabf650081affecd3871070
>   SRC_URI[percent-encoding-2.3.1.sha256sum] = "e3148f5046208a5d56bcfc03053e3ca6334e51da8dfb19b6cdc8b306fae3283e"
>   SRC_URI[portable-atomic-1.6.0.sha256sum] = "7170ef9988bc169ba16dd36a7fa041e5c4cbeb6a35b76d4c03daded371eae7c0"
>   SRC_URI[proc-macro2-1.0.76.sha256sum] = "95fc56cda0b5c3325f5fbbd7ff9fda9e02bb00bb3dac51252d2f1bfa1cb8cc8c"
> -SRC_URI[pyo3-0.20.3.sha256sum] = "53bdbb96d49157e65d45cc287af5f32ffadd5f4761438b527b055fb0d4bb8233"
> -SRC_URI[pyo3-build-config-0.20.3.sha256sum] = "deaa5745de3f5231ce10517a1f5dd97d53e5a2fd77aa6b5842292085831d48d7"
> -SRC_URI[pyo3-ffi-0.20.3.sha256sum] = "62b42531d03e08d4ef1f6e85a2ed422eb678b8cd62b762e53891c05faf0d4afa"
> -SRC_URI[pyo3-macros-0.20.3.sha256sum] = "7305c720fa01b8055ec95e484a6eca7a83c841267f0dd5280f0c8b8551d2c158"
> -SRC_URI[pyo3-macros-backend-0.20.3.sha256sum] = "7c7e9b68bb9c3149c5b0cade5d07f953d6d125eb4337723c4ccdb665f1f96185"
> +SRC_URI[pyo3-0.21.1.sha256sum] = "a7a8b1990bd018761768d5e608a13df8bd1ac5f678456e0f301bb93e5f3ea16b"
> +SRC_URI[pyo3-build-config-0.21.1.sha256sum] = "650dca34d463b6cdbdb02b1d71bfd6eb6b6816afc708faebb3bac1380ff4aef7"
> +SRC_URI[pyo3-ffi-0.21.1.sha256sum] = "09a7da8fc04a8a2084909b59f29e1b8474decac98b951d77b80b26dc45f046ad"
> +SRC_URI[pyo3-macros-0.21.1.sha256sum] = "4b8a199fce11ebb28e3569387228836ea98110e43a804a530a9fd83ade36d513"
> +SRC_URI[pyo3-macros-backend-0.21.1.sha256sum] = "93fbbfd7eb553d10036513cb122b888dcd362a945a00b06c165f2ab480d4cc3b"
>   SRC_URI[python3-dll-a-0.2.9.sha256sum] = "d5f07cd4412be8fa09a721d40007c483981bbe072cd6a21f2e83e04ec8f8343f"
>   SRC_URI[quote-1.0.35.sha256sum] = "291ec9ab5efd934aaf503a6466c5d5251535d108ee747472c3977cc5acc868ef"
>   SRC_URI[redox_syscall-0.3.5.sha256sum] = "567664f262709473930a4bf9e51bf2ebf3348f2e748ccc50dea20646858f8f29"
> -SRC_URI[regex-1.10.2.sha256sum] = "380b951a9c5e80ddfd6136919eef32310721aa4aacd4889a8d39124b026ab343"
> -SRC_URI[regex-automata-0.4.3.sha256sum] = "5f804c7828047e88b2d32e2d7fe5a105da8ee3264f01902f796c8e067dc2483f"
> +SRC_URI[regex-1.10.3.sha256sum] = "b62dbe01f0b06f9d8dc7d49e05a0785f153b00b2c227856282f671e0318c9b15"
> +SRC_URI[regex-automata-0.4.5.sha256sum] = "5bb987efffd3c6d0d8f5f89510bb458559eab11e4f869acb20bf845e016259cd"
>   SRC_URI[regex-syntax-0.8.2.sha256sum] = "c08c74e62047bb2de4ff487b251e4a92e24f48745648451635cec7d591162d9f"
>   SRC_URI[rustversion-1.0.13.sha256sum] = "dc31bd9b61a32c31f9650d18add92aa83a49ba979c143eefd27fe7177b05bd5f"
>   SRC_URI[ryu-1.0.14.sha256sum] = "fe232bdf6be8c8de797b22184ee71118d63780ea42ac85b61d1baa6d3b782ae9"
>   SRC_URI[scopeguard-1.1.0.sha256sum] = "d29ab0c6d3fc0ee92fe66e2d99f700eab17a8d57d1c1d3b748380fb20baa78cd"
> -SRC_URI[serde-1.0.195.sha256sum] = "63261df402c67811e9ac6def069e4786148c4563f4b50fd4bf30aa370d626b02"
> -SRC_URI[serde_derive-1.0.195.sha256sum] = "46fe8f8603d81ba86327b23a2e9cdf49e1255fb94a4c5f297f6ee0547178ea2c"
> -SRC_URI[serde_json-1.0.109.sha256sum] = "cb0652c533506ad7a2e353cce269330d6afd8bdfb6d75e0ace5b35aacbd7b9e9"
> -SRC_URI[smallvec-1.11.2.sha256sum] = "4dccd0940a2dcdf68d092b8cbab7dc0ad8fa938bf95787e1b916b0e3d0e8e970"
> -SRC_URI[speedate-0.13.0.sha256sum] = "242f76c50fd18cbf098607090ade73a08d39cfd84ea835f3796a2c855223b19b"
> +SRC_URI[serde-1.0.197.sha256sum] = "3fb1c873e1b9b056a4dc4c0c198b24c3ffa059243875552b2bd0933b1aee4ce2"
> +SRC_URI[serde_derive-1.0.197.sha256sum] = "7eb0b34b42edc17f6b7cac84a52a1c5f0e1bb2227e997ca9011ea3dd34e8610b"
> +SRC_URI[serde_json-1.0.114.sha256sum] = "c5f09b1bd632ef549eaa9f60a1f8de742bdbc698e6cee2095fc84dde5f549ae0"
> +SRC_URI[smallvec-1.13.2.sha256sum] = "3c5e1a9a646d36c3599cd173a41282daf47c44583ad367b8e6837255952e5c67"
> +SRC_URI[speedate-0.14.0.sha256sum] = "c323c4e6fece5a5a1a2a7f726d243144cce9fbcfe3ce4d9f3c6ede726a2bc780"
>   SRC_URI[static_assertions-1.1.0.sha256sum] = "a2eb9349b6444b326872e140eb1cf5e7c522154d69e7a0ffb0fb81c06b37543f"
>   SRC_URI[strum-0.25.0.sha256sum] = "290d54ea6f91c969195bdbcd7442c8c2a2ba87da8bf60a7ee86a235d4bc1e125"
>   SRC_URI[strum_macros-0.25.3.sha256sum] = "23dc1fa9ac9c169a78ba62f0b841814b7abae11bdd047b9c58f893439e309ea0"
> +SRC_URI[strum_macros-0.26.1.sha256sum] = "7a3417fc93d76740d974a01654a09777cb500428cc874ca9f45edfe0c4d4cd18"
>   SRC_URI[syn-2.0.48.sha256sum] = "0f3531638e407dfc0814761abb7c00a5b54992b849452a0646b7f65c9f770f3f"
>   SRC_URI[target-lexicon-0.12.9.sha256sum] = "df8e77cb757a61f51b947ec4a7e3646efd825b73561db1c232a8ccb639e611a0"
>   SRC_URI[tinyvec-1.6.0.sha256sum] = "87cc5ceb3875bb20c2890005a4e226a4651264a5c75edb2421b52861a0a0cb50"
> @@ -155,7 +149,7 @@ SRC_URI[unicode-ident-1.0.10.sha256sum] = "22049a19f4a68748a168c0fc439f9516686aa
>   SRC_URI[unicode-normalization-0.1.22.sha256sum] = "5c5713f0fc4b5db668a2ac63cdb7bb4469d8c9fed047b1d0292cc7b0ce2ba921"
>   SRC_URI[unindent-0.2.3.sha256sum] = "c7de7d73e1754487cb58364ee906a499937a0dfabd86bcb980fa99ec8c8fa2ce"
>   SRC_URI[url-2.5.0.sha256sum] = "31e6302e3bb753d46e83516cae55ae196fc0c309407cf11ab35cc51a4c2a4633"
> -SRC_URI[uuid-1.6.1.sha256sum] = "5e395fcf16a7a3d8127ec99782007af141946b4795001f876d54fb0d55978560"
> +SRC_URI[uuid-1.7.0.sha256sum] = "f00cc9702ca12d3c81455259621e676d0f7251cec66a21e98fe2e9a37db93b2a"
>   SRC_URI[version_check-0.9.4.sha256sum] = "49874b5167b65d7193b8aba1567f5c7d93d001cafc34600cee003eda787e483f"
>   SRC_URI[wasi-0.11.0+wasi-snapshot-preview1.sha256sum] = "9c8d87e72b64a3b4db28d11ce29237c246188f4f51057d65a7eab63b7987e423"
>   SRC_URI[windows-targets-0.48.1.sha256sum] = "05d4b17490f70499f20b9e791dcf6a299785ce8af4d709018206dc5b4953e95f"
> diff --git a/meta-python/recipes-devtools/python/python3-pydantic-core/0001-Bumps-pyo3-https-github.com-pyo3-pyo3-from-0.20.2-to.patch b/meta-python/recipes-devtools/python/python3-pydantic-core/0001-Bumps-pyo3-https-github.com-pyo3-pyo3-from-0.20.2-to.patch
> deleted file mode 100644
> index 32777e1d0..000000000
> --- a/meta-python/recipes-devtools/python/python3-pydantic-core/0001-Bumps-pyo3-https-github.com-pyo3-pyo3-from-0.20.2-to.patch
> +++ /dev/null
> @@ -1,126 +0,0 @@
> -From a5690f973384bf8cbf4deb3b83d822b7aaefbdd8 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Tue, 27 Feb 2024 11:00:46 -0800
> -Subject: [PATCH] Bumps [pyo3](https://github.com/pyo3/pyo3) from 0.20.2 to
> - 0.20.3.
> -
> -Upstream-Status: Pending
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - Cargo.lock | 26 +++++++++++++++++---------
> - Cargo.toml |  2 +-
> - 2 files changed, 18 insertions(+), 10 deletions(-)
> -
> ---- a/Cargo.lock
> -+++ b/Cargo.lock
> -@@ -322,6 +322,12 @@ source = "registry+https://github.com/ru
> - checksum = "e3148f5046208a5d56bcfc03053e3ca6334e51da8dfb19b6cdc8b306fae3283e"
> -
> - [[package]]
> -+name = "portable-atomic"
> -+version = "1.6.0"
> -+source = "registry+https://github.com/rust-lang/crates.io-index"
> -+checksum = "7170ef9988bc169ba16dd36a7fa041e5c4cbeb6a35b76d4c03daded371eae7c0"
> -+
> -+[[package]]
> - name = "proc-macro2"
> - version = "1.0.76"
> - source = "registry+https://github.com/rust-lang/crates.io-index"
> -@@ -357,9 +363,9 @@ dependencies = [
> -
> - [[package]]
> - name = "pyo3"
> --version = "0.20.2"
> -+version = "0.20.3"
> - source = "registry+https://github.com/rust-lang/crates.io-index"
> --checksum = "9a89dc7a5850d0e983be1ec2a463a171d20990487c3cfcd68b5363f1ee3d6fe0"
> -+checksum = "53bdbb96d49157e65d45cc287af5f32ffadd5f4761438b527b055fb0d4bb8233"
> - dependencies = [
> -  "cfg-if",
> -  "indoc",
> -@@ -367,6 +373,7 @@ dependencies = [
> -  "memoffset",
> -  "num-bigint",
> -  "parking_lot",
> -+ "portable-atomic",
> -  "pyo3-build-config",
> -  "pyo3-ffi",
> -  "pyo3-macros",
> -@@ -375,9 +382,9 @@ dependencies = [
> -
> - [[package]]
> - name = "pyo3-build-config"
> --version = "0.20.2"
> -+version = "0.20.3"
> - source = "registry+https://github.com/rust-lang/crates.io-index"
> --checksum = "07426f0d8fe5a601f26293f300afd1a7b1ed5e78b2a705870c5f30893c5163be"
> -+checksum = "deaa5745de3f5231ce10517a1f5dd97d53e5a2fd77aa6b5842292085831d48d7"
> - dependencies = [
> -  "once_cell",
> -  "python3-dll-a",
> -@@ -386,9 +393,9 @@ dependencies = [
> -
> - [[package]]
> - name = "pyo3-ffi"
> --version = "0.20.2"
> -+version = "0.20.3"
> - source = "registry+https://github.com/rust-lang/crates.io-index"
> --checksum = "dbb7dec17e17766b46bca4f1a4215a85006b4c2ecde122076c562dd058da6cf1"
> -+checksum = "62b42531d03e08d4ef1f6e85a2ed422eb678b8cd62b762e53891c05faf0d4afa"
> - dependencies = [
> -  "libc",
> -  "pyo3-build-config",
> -@@ -396,9 +403,9 @@ dependencies = [
> -
> - [[package]]
> - name = "pyo3-macros"
> --version = "0.20.2"
> -+version = "0.20.3"
> - source = "registry+https://github.com/rust-lang/crates.io-index"
> --checksum = "05f738b4e40d50b5711957f142878cfa0f28e054aa0ebdfc3fd137a843f74ed3"
> -+checksum = "7305c720fa01b8055ec95e484a6eca7a83c841267f0dd5280f0c8b8551d2c158"
> - dependencies = [
> -  "proc-macro2",
> -  "pyo3-macros-backend",
> -@@ -408,12 +415,13 @@ dependencies = [
> -
> - [[package]]
> - name = "pyo3-macros-backend"
> --version = "0.20.2"
> -+version = "0.20.3"
> - source = "registry+https://github.com/rust-lang/crates.io-index"
> --checksum = "0fc910d4851847827daf9d6cdd4a823fbdaab5b8818325c5e97a86da79e8881f"
> -+checksum = "7c7e9b68bb9c3149c5b0cade5d07f953d6d125eb4337723c4ccdb665f1f96185"
> - dependencies = [
> -  "heck",
> -  "proc-macro2",
> -+ "pyo3-build-config",
> -  "quote",
> -  "syn",
> - ]
> ---- a/Cargo.toml
> -+++ b/Cargo.toml
> -@@ -26,7 +26,7 @@ include = [
> - ]
> -
> - [dependencies]
> --pyo3 = { version = "0.20.2", features = ["generate-import-lib", "num-bigint"] }
> -+pyo3 = { version = "0.20.3", features = ["generate-import-lib", "num-bigint"] }
> - regex = "1.10.2"
> - strum = { version = "0.25.0", features = ["derive"] }
> - strum_macros = "0.25.3"
> -@@ -70,12 +70,12 @@ debug = true
> - strip = false
> -
> - [dev-dependencies]
> --pyo3 = { version = "0.20.2", features = ["auto-initialize"] }
> -+pyo3 = { version = "0.20.3", features = ["auto-initialize"] }
> -
> - [build-dependencies]
> - version_check = "0.9.4"
> - # used where logic has to be version/distribution specific, e.g. pypy
> --pyo3-build-config = { version = "0.20.2" }
> -+pyo3-build-config = { version = "0.20.3" }
> -
> - [lints.clippy]
> - dbg_macro = "warn"
> diff --git a/meta-python/recipes-devtools/python/python3-pydantic-core/0001-Fix-generate_self_schema-for-Python-3.12-1299.patch b/meta-python/recipes-devtools/python/python3-pydantic-core/0001-Fix-generate_self_schema-for-Python-3.12-1299.patch
> new file mode 100644
> index 000000000..e795c8bfb
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-pydantic-core/0001-Fix-generate_self_schema-for-Python-3.12-1299.patch
> @@ -0,0 +1,32 @@
> +From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
> +From: Jelle Zijlstra <jelle.zijlstra@gmail.com>
> +Date: Wed, 22 May 2024 07:44:10 -0700
> +Subject: [PATCH] Fix generate_self_schema for Python 3.12+ (#1299)
> +
> +Upstream-Status: Backport [https://github.com/pydantic/pydantic-core/commit/a7620419383a69bd2b28ab953c9a17f6ed35bb9a]
> +
> +---
> + generate_self_schema.py | 7 ++++++-
> + 1 file changed, 6 insertions(+), 1 deletion(-)
> +
> +diff --git a/generate_self_schema.py b/generate_self_schema.py
> +index 3aef99b..acecf19 100644
> +--- a/generate_self_schema.py
> ++++ b/generate_self_schema.py
> +@@ -190,7 +190,12 @@ def all_literal_values(type_: type[core_schema.Literal]) -> list[any]:
> +
> + def eval_forward_ref(type_: Any) -> Any:
> +     try:
> +-        return type_._evaluate(core_schema.__dict__, None, set())
> ++        try:
> ++            # Python 3.12+
> ++            return type_._evaluate(core_schema.__dict__, None, type_params=set(), recursive_guard=set())
> ++        except TypeError:
> ++            # Python 3.9+
> ++            return type_._evaluate(core_schema.__dict__, None, set())
> +     except TypeError:
> +         # for Python 3.8
> +         return type_._evaluate(core_schema.__dict__, None)
> +--
> +2.43.0
> +
> diff --git a/meta-python/recipes-devtools/python/python3-pydantic-core/0001-Lower-MSRV-to-1.75-1316.patch b/meta-python/recipes-devtools/python/python3-pydantic-core/0001-Lower-MSRV-to-1.75-1316.patch
> new file mode 100644
> index 000000000..29d14fd05
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-pydantic-core/0001-Lower-MSRV-to-1.75-1316.patch
> @@ -0,0 +1,25 @@
> +From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
> +From: Christian Heimes <christian@python.org>
> +Date: Wed, 5 Jun 2024 11:34:52 +0200
> +Subject: [PATCH] Lower MSRV to 1.75 (#1316)
> +
> +Upstream-Status: Backport [https://github.com/pydantic/pydantic-core/commit/ebef5bdf92707f5e1739931150893ae6c7ccc531]
> +
> +Signed-off-by: Christian Heimes <christian@python.org>
> +---
> + Cargo.toml | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/Cargo.toml b/Cargo.toml
> +index 88470c5..f8170a2 100644
> +--- a/Cargo.toml
> ++++ b/Cargo.toml
> +@@ -24,7 +24,7 @@ include = [
> +     "!tests/.pytest_cache",
> +     "!*.so",
> + ]
> +-rust-version = "1.76"
> ++rust-version = "1.75"
> +
> + [dependencies]
> + pyo3 = { version = "0.21.1", features = ["generate-import-lib", "num-bigint"] }
> diff --git a/meta-python/recipes-devtools/python/python3-pydantic-core_2.16.3.bb b/meta-python/recipes-devtools/python/python3-pydantic-core_2.18.1.bb
> similarity index 87%
> rename from meta-python/recipes-devtools/python/python3-pydantic-core_2.16.3.bb
> rename to meta-python/recipes-devtools/python/python3-pydantic-core_2.18.1.bb
> index faa291ea6..fca40b5c8 100644
> --- a/meta-python/recipes-devtools/python/python3-pydantic-core_2.16.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-pydantic-core_2.18.1.bb
> @@ -8,14 +8,17 @@ HOMEPAGE = "https://github.com/pydantic/pydantic-core"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=ab599c188b4a314d2856b3a55030c75c"
>   
> -SRC_URI += "file://0001-Bumps-pyo3-https-github.com-pyo3-pyo3-from-0.20.2-to.patch"
> -SRC_URI[sha256sum] = "1cac689f80a3abab2d3c0048b29eea5751114054f032a941a32de4c852c59cad"
> +SRC_URI[sha256sum] = "de9d3e8717560eb05e28739d1b35e4eac2e458553a52a301e51352a7ffc86a35"
>   
>   DEPENDS = "python3-maturin-native python3-typing-extensions"
>   
>   require ${BPN}-crates.inc
>   
>   inherit pypi cargo-update-recipe-crates python_maturin
> +SRC_URI += "\
> +    file://0001-Lower-MSRV-to-1.75-1316.patch \
> +    file://0001-Fix-generate_self_schema-for-Python-3.12-1299.patch \
> +"
>   
>   PYPI_PACKAGE = "pydantic_core"
>   
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#111261): https://lists.openembedded.org/g/openembedded-devel/message/111261
> Mute This Topic: https://lists.openembedded.org/mt/107073841/3616698
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [akuster808@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


