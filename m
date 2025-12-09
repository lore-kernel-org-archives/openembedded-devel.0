Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 399A5D1CDC6
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 09:31:10 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3729.1765272665717131496
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Dec 2025 01:31:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=I/mNCBg9;
 spf=pass (domain: smile.fr, ip: 209.85.221.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-42b3c5defb2so2982112f8f.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 01:31:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1765272664; x=1765877464; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3DxHssKFhjPA9StgnzuTLTxKdOsPDDF5QgSQMCG37Fk=;
        b=I/mNCBg9Cb5OqK1rIX5m3l5KtvDGFdzLNfL5qi9Dm3hIgW1HfhlistWq/tZos5lWQK
         OIfKiY33KdXSciLv1rl7EUm9Gm4tHu9OzhORKFJCnCacI0srmH6vOFtEmKe8C0J19vgE
         0051fCbFIqLBw6PyG+Sf0PARf5vjOw6ZgzXCw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765272664; x=1765877464;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3DxHssKFhjPA9StgnzuTLTxKdOsPDDF5QgSQMCG37Fk=;
        b=PPDuyO8IiicE+Evv0eLxxJHhRQd+s1Jflg+upRfNmajn8DdwZP1j2FM793NkAcYHFj
         2B2MTVGZlVxPIHsdKiEZ8lN3mHvG/4u44aoJ1g/kQ0n09u5QICbt53dHlX5FsHzS11E2
         UGaRhTICs0gylSko4re0cuFs7wCVSDSGo86xKRlucCUhpg0NSW6g7dy5/8xlkqjLoFJ5
         snFzw7QWNri+xQpO3J74eQdbZ9HG+44QvjGjT4yJH0R2KdH8SDdlQkx7rGvUCppvZKVq
         34X4xCYPujey7rykd+Qayq9aCBXll4gLMd2kVuCyVyErhXAClBAQXIeLOVHUHqvjTSgv
         u5MQ==
X-Gm-Message-State: AOJu0YzV2iMkSIbvQ2zGg4++kl6GPZftdrcU/aQ7L35vocatGnge1cad
	ANZQfrv0zztJUnkkypive0iLIgTYmH8tMSKlZMnSR2oaANjCzizbKnqtBjnSW6hXM8AsAFX7TQJ
	1kZ3paGGCr5TP3PaUFIT4LwwtKZkHIQTy0NtpnPAF/w==
X-Gm-Gg: ASbGncv/QT5BP7Z2tN3M/UNYqMWLIDo/lmK4ivltSIUNimuNLI32nYKtunWbGqOPVkd
	POQRdqqbNAcS/3RHsTNzSQOsMsFgJkjU5AFIqBD2idYpjjHwKHiu0XEXcJmqe0oJSRPKbx9vVN1
	tkXF3yBEesfxFyCis3HXV8ze8gFTmmaHfTss8LSoccHOv8A/kuGnEm3iS/BuKpS2rooqR3iAu96
	bLbMWBxWgX7F3WD/Fi+xqctg5AZiMCHYsKTsjx/kdJJd5ivnI2ojc0BmRjGtFvBYXjKb2WqEw==
X-Google-Smtp-Source: AGHT+IGLPzhoPEmjWZIUNPASTwSCxIzqiorQdKR63CPkn7qV6iQX2WOcDNK/wXzk1JDJVcyN4yk6KcyXyYIxQEr/z60=
X-Received: by 2002:a05:6000:2882:b0:42b:a40d:713d with SMTP id
 ffacd0b85a97d-42f89f0e1eamr10043266f8f.21.1765272663761; Tue, 09 Dec 2025
 01:31:03 -0800 (PST)
MIME-Version: 1.0
References: <20251209085645.1437344-1-Deepesh.Varatharajan@windriver.com> <20251209085645.1437344-2-Deepesh.Varatharajan@windriver.com>
In-Reply-To: <20251209085645.1437344-2-Deepesh.Varatharajan@windriver.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Tue, 9 Dec 2025 10:30:37 +0100
X-Gm-Features: AQt7F2qH3MOYja5VuOoYKjbvgZ2bbx2UmCnWeZU5p-8nHZiFfTasi1BZ9T2oFrM
Message-ID: <CAMSfU+7cCap3EYCCSudr1uW7tDciisXJcDtXPEcXM5qAPbinmw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 2/2] ripgrep: Add ripgrep recipe
To: deepesh.varatharajan@windriver.com
Cc: openembedded-devel@lists.openembedded.org, Sundeep.Kokkonda@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 09:31:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122404

Le mar. 9 d=C3=A9c. 2025 =C3=A0 09:57, Varatharajan, Deepesh via
lists.openembedded.org
<deepesh.varatharajan=3Dwindriver.com@lists.openembedded.org> a =C3=A9crit =
:
>
> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>
> ripgrep is a fast, line-oriented search tool written in Rust.
> Add recipe for the latest release (15.1.0)
>
> - Recursively searches the current directory using a regex pattern
> - Respects .gitignore rules
> - Provides first-class support on Linux
> - 'rg' is significantly faster than grep
>
> More information: https://crates.io/crates/ripgrep
>
> Upstream Benchmarks:
> Task                                 ripgrep               GNU grep      =
         Speedup vs grep
> Basic search (Unicode)          536 lines, 0.082s       536 lines, 0.273s=
       ripgrep ~3.3=C3=97 faster
> Ignoring gitignore files        447 lines, 0.063s       447 lines, 0.674s=
       ripgrep ~10=C3=97 faster
> Large single file (~13GB)       7882 lines, 1.042s      7882 lines, 6.577=
s      ripgrep ~6.3=C3=97 faster
>
> Bechmarks inside qemu (ripgrep built from this recipe):
> Tool & Command                      Real Time    User Time    Sys Time   =
 Speedup vs grep
> ripgrep (rg "printf" /usr)           0.496 s      0.511 s     0.604 s    =
   3.1=C3=97 faster
> grep (grep -R "printf" /usr)         1.533 s      0.633 s     0.897 s    =
        =E2=80=94
>
> Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Hello,

Thanks for the recipes!

We also started to work on those recipes but we wanted to have ptests.
We got stuck on ptests reproducibility, while we could patch each
recipe, I would rather have a generic solution.
I've created a BZ ticket to track the work on this:
16094 =E2=80=93 Generically improve cargo-based tests package reproducibili=
ty
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16094
I took the ticket but I won't have time to work on it soon (feel free
to take it if you want!).

> ---
>  .../ripgrep/ripgrep-crates.inc                | 116 ++++++++++++++++++
>  .../ripgrep/ripgrep_15.1.0.bb                 |  22 ++++
>  2 files changed, 138 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/ripgrep/ripgrep-crates.inc
>  create mode 100644 meta-oe/recipes-extended/ripgrep/ripgrep_15.1.0.bb
>
> diff --git a/meta-oe/recipes-extended/ripgrep/ripgrep-crates.inc b/meta-o=
e/recipes-extended/ripgrep/ripgrep-crates.inc
> new file mode 100644
> index 0000000000..aa7e3f9dd2
> --- /dev/null
> +++ b/meta-oe/recipes-extended/ripgrep/ripgrep-crates.inc
> @@ -0,0 +1,116 @@
> +# Autogenerated with 'bitbake -c update_crates ripgrep'
> +
> +# from Cargo.lock
> +SRC_URI +=3D " \
> +    crate://crates.io/aho-corasick/1.1.3 \
> +    crate://crates.io/anyhow/1.0.100 \
> +    crate://crates.io/bstr/1.12.0 \
> +    crate://crates.io/cc/1.2.41 \
> +    crate://crates.io/cfg-if/1.0.4 \
> +    crate://crates.io/crossbeam-deque/0.8.6 \
> +    crate://crates.io/crossbeam-epoch/0.9.18 \
> +    crate://crates.io/crossbeam-utils/0.8.21 \
> +    crate://crates.io/encoding_rs/0.8.35 \
> +    crate://crates.io/encoding_rs_io/0.1.7 \
> +    crate://crates.io/find-msvc-tools/0.1.4 \
> +    crate://crates.io/getrandom/0.3.4 \
> +    crate://crates.io/globset/0.4.18 \
> +    crate://crates.io/grep/0.4.1 \
> +    crate://crates.io/grep-cli/0.1.12 \
> +    crate://crates.io/grep-matcher/0.1.8 \
> +    crate://crates.io/grep-pcre2/0.1.9 \
> +    crate://crates.io/grep-printer/0.3.1 \
> +    crate://crates.io/grep-regex/0.1.14 \
> +    crate://crates.io/grep-searcher/0.1.16 \
> +    crate://crates.io/ignore/0.4.24 \
> +    crate://crates.io/itoa/1.0.15 \
> +    crate://crates.io/jobserver/0.1.34 \
> +    crate://crates.io/lexopt/0.3.1 \
> +    crate://crates.io/libc/0.2.177 \
> +    crate://crates.io/log/0.4.28 \
> +    crate://crates.io/memchr/2.7.6 \
> +    crate://crates.io/memmap2/0.9.9 \
> +    crate://crates.io/pcre2/0.2.11 \
> +    crate://crates.io/pcre2-sys/0.2.10 \
> +    crate://crates.io/pkg-config/0.3.32 \
> +    crate://crates.io/proc-macro2/1.0.101 \
> +    crate://crates.io/quote/1.0.41 \
> +    crate://crates.io/r-efi/5.3.0 \
> +    crate://crates.io/regex-automata/0.4.13 \
> +    crate://crates.io/regex-syntax/0.8.8 \
> +    crate://crates.io/ryu/1.0.20 \
> +    crate://crates.io/same-file/1.0.6 \
> +    crate://crates.io/serde/1.0.228 \
> +    crate://crates.io/serde_core/1.0.228 \
> +    crate://crates.io/serde_derive/1.0.228 \
> +    crate://crates.io/serde_json/1.0.145 \
> +    crate://crates.io/shlex/1.3.0 \
> +    crate://crates.io/syn/2.0.107 \
> +    crate://crates.io/termcolor/1.4.1 \
> +    crate://crates.io/textwrap/0.16.2 \
> +    crate://crates.io/tikv-jemalloc-sys/0.6.1+5.3.0-1-ge13ca993e8ccb9ba9=
847cc330696e02839f328f7 \
> +    crate://crates.io/tikv-jemallocator/0.6.1 \
> +    crate://crates.io/unicode-ident/1.0.20 \
> +    crate://crates.io/walkdir/2.5.0 \
> +    crate://crates.io/wasip2/1.0.1+wasi-0.2.4 \
> +    crate://crates.io/winapi-util/0.1.11 \
> +    crate://crates.io/windows-link/0.2.1 \
> +    crate://crates.io/windows-sys/0.61.2 \
> +    crate://crates.io/wit-bindgen/0.46.0 \
> +"
> +
> +SRC_URI[aho-corasick-1.1.3.sha256sum] =3D "8e60d3430d3a69478ad0993f19238=
d2df97c507009a52b3c10addcd7f6bcb916"
> +SRC_URI[anyhow-1.0.100.sha256sum] =3D "a23eb6b1614318a8071c9b2521f36b424=
b2c83db5eb3a0fead4a6c0809af6e61"
> +SRC_URI[bstr-1.12.0.sha256sum] =3D "234113d19d0d7d613b40e86fb654acf95891=
0802bcceab913a4f9e7cda03b1a4"
> +SRC_URI[cc-1.2.41.sha256sum] =3D "ac9fe6cdbb24b6ade63616c0a0688e45bb5673=
2262c158df3c0c4bea4ca47cb7"
> +SRC_URI[cfg-if-1.0.4.sha256sum] =3D "9330f8b2ff13f34540b44e946ef35111825=
727b38d33286ef986142615121801"
> +SRC_URI[crossbeam-deque-0.8.6.sha256sum] =3D "9dd111b7b7f7d55b72c0a6ae36=
1660ee5853c9af73f70c3c2ef6858b950e2e51"
> +SRC_URI[crossbeam-epoch-0.9.18.sha256sum] =3D "5b82ac4a3c2ca9c3460964f02=
0e1402edd5753411d7737aa39c3714ad1b5420e"
> +SRC_URI[crossbeam-utils-0.8.21.sha256sum] =3D "d0a5c400df2834b80a4c3327b=
3aad3a4c4cd4de0629063962b03235697506a28"
> +SRC_URI[encoding_rs-0.8.35.sha256sum] =3D "75030f3c4f45dafd7586dd6780965=
a8c7e8e285a5ecb86713e63a79c5b2766f3"
> +SRC_URI[encoding_rs_io-0.1.7.sha256sum] =3D "1cc3c5651fb62ab8aa3103998da=
de57efdd028544bd300516baa31840c252a83"
> +SRC_URI[find-msvc-tools-0.1.4.sha256sum] =3D "52051878f80a721bb68ebfbc93=
0e07b65ba72f2da88968ea5c06fd6ca3d3a127"
> +SRC_URI[getrandom-0.3.4.sha256sum] =3D "899def5c37c4fd7b2664648c28120ece=
c138e4d395b459e5ca34f9cce2dd77fd"
> +SRC_URI[globset-0.4.18.sha256sum] =3D "52dfc19153a48bde0cbd630453615c815=
1bce3a5adfac7a0aebfbf0a1e1f57e3"
> +SRC_URI[grep-0.4.1.sha256sum] =3D "309217bc53e2c691c314389c7fa91f9cd1a99=
8cda19e25544ea47d94103880c3"
> +SRC_URI[grep-cli-0.1.12.sha256sum] =3D "cf32d263c5d5cc2a23ce587097f5ddaf=
db188492ba2e6fb638eaccdc22453631"
> +SRC_URI[grep-matcher-0.1.8.sha256sum] =3D "36d7b71093325ab22d780b40d7df3=
066ae4aebb518ba719d38c697a8228a8023"
> +SRC_URI[grep-pcre2-0.1.9.sha256sum] =3D "667bb90a3ee51f8f6e2aadf1d0f106e=
a42efca4cf28f0e71f0fdec1137d7f9b0"
> +SRC_URI[grep-printer-0.3.1.sha256sum] =3D "fd76035e87871f51c1ee5b793e321=
22b3ccf9c692662d9622ef1686ff5321acb"
> +SRC_URI[grep-regex-0.1.14.sha256sum] =3D "0ce0c256c3ad82bcc07b812c15a45e=
c1d398122e8e15124f96695234db7112ef"
> +SRC_URI[grep-searcher-0.1.16.sha256sum] =3D "ac63295322dc48ebb20a2534814=
7905d816318888e64f531bfc2a2bc0577dc34"
> +SRC_URI[ignore-0.4.24.sha256sum] =3D "81776e6f9464432afcc28d03e52eb101c9=
3b6f0566f52aef2427663e700f0403"
> +SRC_URI[itoa-1.0.15.sha256sum] =3D "4a5f13b858c8d314ee3e8f639011f7ccefe7=
1f97f96e50151fb991f267928e2c"
> +SRC_URI[jobserver-0.1.34.sha256sum] =3D "9afb3de4395d6b3e67a780b6de64b51=
c978ecf11cb9a462c66be7d4ca9039d33"
> +SRC_URI[lexopt-0.3.1.sha256sum] =3D "9fa0e2a1fcbe2f6be6c42e342259976206b=
383122fc152e872795338b5a3f3a7"
> +SRC_URI[libc-0.2.177.sha256sum] =3D "2874a2af47a2325c2001a6e6fad9b16a53b=
802102b528163885171cf92b15976"
> +SRC_URI[log-0.4.28.sha256sum] =3D "34080505efa8e45a4b816c349525ebe327cea=
a8559756f0356cba97ef3bf7432"
> +SRC_URI[memchr-2.7.6.sha256sum] =3D "f52b00d39961fc5b2736ea853c9cc86238e=
165017a493d1d5c8eac6bdc4cc273"
> +SRC_URI[memmap2-0.9.9.sha256sum] =3D "744133e4a0e0a658e1374cf3bf8e415c40=
52a15a111acd372764c55b4177d490"
> +SRC_URI[pcre2-0.2.11.sha256sum] =3D "9e970b0fcce0c7ee6ef662744ff711f21cc=
d6f11b7cf03cd187a80e89797fc67"
> +SRC_URI[pcre2-sys-0.2.10.sha256sum] =3D "18b9073c1a2549bd409bf4a32c94d90=
3bb1a09bf845bc306ae148897fa0760a4"
> +SRC_URI[pkg-config-0.3.32.sha256sum] =3D "7edddbd0b52d732b21ad9a5fab5c70=
4c14cd949e5e9a1ec5929a24fded1b904c"
> +SRC_URI[proc-macro2-1.0.101.sha256sum] =3D "89ae43fd86e4158d6db51ad8e2b8=
0f313af9cc74f5c0e03ccb87de09998732de"
> +SRC_URI[quote-1.0.41.sha256sum] =3D "ce25767e7b499d1b604768e7cde645d14cc=
8584231ea6b295e9c9eb22c02e1d1"
> +SRC_URI[r-efi-5.3.0.sha256sum] =3D "69cdb34c158ceb288df11e18b4bd39de994f=
6657d83847bdffdbd7f346754b0f"
> +SRC_URI[regex-automata-0.4.13.sha256sum] =3D "5276caf25ac86c8d810222b3db=
b938e512c55c6831a10f3e6ed1c93b84041f1c"
> +SRC_URI[regex-syntax-0.8.8.sha256sum] =3D "7a2d987857b319362043e95f5353c=
0535c1f58eec5336fdfcf626430af7def58"
> +SRC_URI[ryu-1.0.20.sha256sum] =3D "28d3b2b1366ec20994f1fd18c3c594f05c5dd=
4bc44d8bb0c1c632c8d6829481f"
> +SRC_URI[same-file-1.0.6.sha256sum] =3D "93fc1dc3aaa9bfed95e02e6eadabb4ba=
f7e3078b0bd1b4d7b6b0b68378900502"
> +SRC_URI[serde-1.0.228.sha256sum] =3D "9a8e94ea7f378bd32cbbd37198a4a91436=
180c5bb472411e48b5ec2e2124ae9e"
> +SRC_URI[serde_core-1.0.228.sha256sum] =3D "41d385c7d4ca58e59fc732af25c39=
83b67ac852c1a25000afe1175de458b67ad"
> +SRC_URI[serde_derive-1.0.228.sha256sum] =3D "d540f220d3187173da220f885ab=
66608367b6574e925011a9353e4badda91d79"
> +SRC_URI[serde_json-1.0.145.sha256sum] =3D "402a6f66d8c709116cf22f558eab2=
10f5a50187f702eb4d7e5ef38d9a7f1c79c"
> +SRC_URI[shlex-1.3.0.sha256sum] =3D "0fda2ff0d084019ba4d7c6f371c95d8fd75c=
e3524c3cb8fb653a3023f6323e64"
> +SRC_URI[syn-2.0.107.sha256sum] =3D "2a26dbd934e5451d21ef060c018dae56fc07=
3894c5a7896f882928a76e6d081b"
> +SRC_URI[termcolor-1.4.1.sha256sum] =3D "06794f8f6c5c898b3275aebefa6b8a1c=
b24cd2c6c79397ab15774837a0bc5755"
> +SRC_URI[textwrap-0.16.2.sha256sum] =3D "c13547615a44dc9c452a8a534638acdf=
07120d4b6847c8178705da06306a3057"
> +SRC_URI[tikv-jemalloc-sys-0.6.1+5.3.0-1-ge13ca993e8ccb9ba9847cc330696e02=
839f328f7.sha256sum] =3D "cd8aa5b2ab86a2cefa406d889139c162cbb230092f7d1d7cb=
c1716405d852a3b"
> +SRC_URI[tikv-jemallocator-0.6.1.sha256sum] =3D "0359b4327f954e0567e69fb1=
91cf1436617748813819c94b8cd4a431422d053a"
> +SRC_URI[unicode-ident-1.0.20.sha256sum] =3D "462eeb75aeb73aea900253ce739=
c8e18a67423fadf006037cd3ff27e82748a06"
> +SRC_URI[walkdir-2.5.0.sha256sum] =3D "29790946404f91d9c5d06f9874efddea1d=
c06c5efe94541a7d6863108e3a5e4b"
> +SRC_URI[wasip2-1.0.1+wasi-0.2.4.sha256sum] =3D "0562428422c63773dad2c345=
a1882263bbf4d65cf3f42e90921f787ef5ad58e7"
> +SRC_URI[winapi-util-0.1.11.sha256sum] =3D "c2a7b1c03c876122aa43f3020e6c3=
c3ee5c05081c9a00739faf7503aeba10d22"
> +SRC_URI[windows-link-0.2.1.sha256sum] =3D "f0805222e57f7521d6a62e36fa916=
3bc891acd422f971defe97d64e70d0a4fe5"
> +SRC_URI[windows-sys-0.61.2.sha256sum] =3D "ae137229bcbd6cdf0f7b80a31df61=
766145077ddf49416a728b02cb3921ff3fc"
> +SRC_URI[wit-bindgen-0.46.0.sha256sum] =3D "f17a85883d4e6d00e8a97c586de76=
4dabcc06133f7f1d55dce5cdc070ad7fe59"
> diff --git a/meta-oe/recipes-extended/ripgrep/ripgrep_15.1.0.bb b/meta-oe=
/recipes-extended/ripgrep/ripgrep_15.1.0.bb
> new file mode 100644
> index 0000000000..7bb6be1cb6
> --- /dev/null
> +++ b/meta-oe/recipes-extended/ripgrep/ripgrep_15.1.0.bb
> @@ -0,0 +1,22 @@
> +SUMMARY =3D "ripgrep - Fast, recursive search tool like grep, written in=
 Rust"
> +HOMEPAGE =3D "https://crates.io/crates/ripgrep"
> +DESCRIPTION =3D "ripgrep recursively searches directories for a regex pa=
ttern \
> +               while respecting .gitignore. It's fast, safe, and written=
 \
> +               entirely in Rust."
> +
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D " \
> +    file://LICENSE-MIT;md5=3D8d0d0aa488af0ab9aafa3b85a7fc8e12 \
> +"
> +
> +SRC_URI =3D "crate://crates.io/ripgrep/${PV};name=3Dripgrep"
> +SRC_URI[ripgrep.sha256sum] =3D "f388c4955f85477c28a8667355819844a06614b0=
83c23517f0e86bd1d6d82b73"
> +S =3D "${CARGO_VENDORING_DIRECTORY}/ripgrep-${PV}"
> +
> +inherit cargo cargo-update-recipe-crates
> +
> +DEPENDS +=3D "libstd-rs"
> +
> +require ${BPN}-crates.inc
> +
> +BBCLASSEXTEND =3D "native"
> --
> 2.49.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#122403): https://lists.openembedded.org/g/openembedde=
d-devel/message/122403
> Mute This Topic: https://lists.openembedded.org/mt/116691253/4316185
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [y=
oann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
Yoann Congal
Smile ECS

