Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAFD8D3B990
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 19:22:04 +0000 (UTC)
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16081.1765308116472326450
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Dec 2025 11:21:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iJf4m2Yp;
 spf=pass (domain: gmail.com, ip: 74.125.224.50, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-64455a2a096so2012775d50.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 11:21:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765308115; x=1765912915; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jN29WHSNs5S1TP4Zgao/tZqN+5JN2cn4GfqSvaZiROc=;
        b=iJf4m2YpZKzlPz5NjmhoU1C4EQZFSB/0h3xJkGeY0Uza7m735IxGFpJ8nPT5WBTkFR
         o61qvmw9fsdD1xRr9+Y4G/we43SDg1RkcXUIkTlkG2/DnZOYFpGJntDLSMRkuDEgLxwk
         v8LKLLE5UALbjY7GhRCBCFLLdGbAIFVhiOqGCNDTP5N1gm8G779VLwzhxKyn2ndR7Nr1
         W4zzQW4cFnWMnfSZpo3MMRJZReI120kyg5OhsM/Xf5oFWTwQ1ppW+4dXKeold0myrnp0
         WRmrBEOBNIZF28aIJrGNAHP/nuWzbBMwrWKZant/7MLv6DixTZ16TyhzDDgjv/uSQrzO
         y9Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765308115; x=1765912915;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jN29WHSNs5S1TP4Zgao/tZqN+5JN2cn4GfqSvaZiROc=;
        b=dp8MBdJoKcGi2pGXn/vC6QS/OD5Oca6Hxyx/8mbSXlperoI98JDZA+m9RJaUY6Faw9
         E8m0rOwn6DlBcjESy+nfDrRUhuMVkYF9uXRtV09fVWxB8TUaY8v4a6YwyDjJpfqkW8JJ
         0v9Gm6/byyu9rfL79CzErTbwUQqZ6bDMq+u+IJkaMGDllRVqUjiBEUbSJp/sdKR9ngvA
         ABI5JjZat70A/jbB4xIJdlhIic2fTpRZk0Dku0j54rqs9fm9z+Wq3Sg9ft3+2AisFVfZ
         kmnfQgHMwbbYf6WyXaKQpra1zMTNGUDZXorZUccoCn+KG/UCIXktdeF8m31kUmE2gvhO
         3AAA==
X-Forwarded-Encrypted: i=1; AJvYcCVD9WcZrULn8Ax82pv3DWVDRlc/xvQJl7OMXDcWPcB58F5c+X8cYTzW76GJlMu0pQo0Xoyhp6s7HO4Knm8VrutgIrM=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx0oXk9rudtr9uo/VXp0XqtUy5V28yVKWf6/9OoGdQh3wfm3Xr0
	t5NzGi79qaNuzyaxiMdf/MtdUkSgiNzEd230OiRfKS+qtJkSBCXoInZT2hMOQ5S7Vy9+dBW5dfm
	b/UqyziI8sh8BPjPCRHsdfzruQjHNUPvSN7XwxKQ=
X-Gm-Gg: AY/fxX43/5k8gXR77/DzeCD/uG+OdlHHdygRjpw6wnldrDTtNVtZj9FozTdmwTUNpQ4
	4CCNiBhED0ZsEp8RPcG4ZQqXZnM1h/dZsAE28M2uWRu/bff02bO+LcLSVq/4TxwJIwIJTFQmO7B
	njo8e+YcBi8yt6PvDX5GQG1Jw9KzGPvfq64GG4lEWRCXIAPSY0ZCrvCB+O/VjI9rkVE7YpaPgGk
	9xwZkBMbLQHUmk7n/oscxwvJCveQMKuCFV2wJh4JZhe76RC6nTj4q6ZlKQdyBYQtnPA9uK+2TXS
	joL41KVTLjWwz06Rl9Pc5Z4OvZM3pHozvnyuH/Ui9u4AK0aegHLv/NtopNZJd239BNQ+fReRfWW
	ZgB3oMjBi+ZBCe5xJJi1bw5kwAUswMCpg/VAUfvtP
X-Google-Smtp-Source: AGHT+IFlr6vonNG/DlyjgyCSJ319XSkRb2pzPzhJkj7m1rnRRu+hDe/XcNwdfeGLmqNrBi5GeCHsAHA2/aX6c51IJ8w=
X-Received: by 2002:a05:690c:7306:b0:787:f2c3:7164 with SMTP id
 00721157ae682-78c339d1c77mr218200157b3.0.1765308115370; Tue, 09 Dec 2025
 11:21:55 -0800 (PST)
MIME-Version: 1.0
References: <20251209085645.1437344-1-Deepesh.Varatharajan@windriver.com>
 <20251209085645.1437344-2-Deepesh.Varatharajan@windriver.com>
 <CAMSfU+7cCap3EYCCSudr1uW7tDciisXJcDtXPEcXM5qAPbinmw@mail.gmail.com> <5861fa66-9d6e-487d-aed4-20649adddb90@windriver.com>
In-Reply-To: <5861fa66-9d6e-487d-aed4-20649adddb90@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 9 Dec 2025 11:21:29 -0800
X-Gm-Features: AQt7F2r-Zcvr1lck-EDSRR_bTlZ8ntTT4CkqosGFrScoQBcv1r_wnO6VNT_Dkf4
Message-ID: <CAMKF1sp-wo6FUTLduenPwmYvZA0a8CZikFq7=iF8=KFExC7+SA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 2/2] ripgrep: Add ripgrep recipe
To: deepesh.varatharajan@windriver.com
Cc: Yoann Congal <yoann.congal@smile.fr>, openembedded-devel@lists.openembedded.org, 
	Sundeep.Kokkonda@windriver.com
Content-Type: multipart/alternative; boundary="00000000000022c792064589d3e3"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 19:22:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122473

--00000000000022c792064589d3e3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 9, 2025 at 3:17=E2=80=AFAM Varatharajan, Deepesh via
lists.openembedded.org <deepesh.varatharajan=3D
windriver.com@lists.openembedded.org> wrote:

>
> On 09-12-2025 15:00, Yoann Congal wrote:
> > CAUTION: This email comes from a non Wind River email account!
> > Do not click links or open attachments unless you recognize the sender
> and know the content is safe.
> >
> > Le mar. 9 d=C3=A9c. 2025 =C3=A0 09:57, Varatharajan, Deepesh via
> > lists.openembedded.org
> > <deepesh.varatharajan=3Dwindriver.com@lists.openembedded.org> a =C3=A9c=
rit :
> >> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
> >>
> >> ripgrep is a fast, line-oriented search tool written in Rust.
> >> Add recipe for the latest release (15.1.0)
> >>
> >> - Recursively searches the current directory using a regex pattern
> >> - Respects .gitignore rules
> >> - Provides first-class support on Linux
> >> - 'rg' is significantly faster than grep
> >>
> >> More information: https://crates.io/crates/ripgrep
> >>
> >> Upstream Benchmarks:
> >> Task                                 ripgrep               GNU grep
>            Speedup vs grep
> >> Basic search (Unicode)          536 lines, 0.082s       536 lines,
> 0.273s       ripgrep ~3.3=C3=97 faster
> >> Ignoring gitignore files        447 lines, 0.063s       447 lines,
> 0.674s       ripgrep ~10=C3=97 faster
> >> Large single file (~13GB)       7882 lines, 1.042s      7882 lines,
> 6.577s      ripgrep ~6.3=C3=97 faster
> >>
> >> Bechmarks inside qemu (ripgrep built from this recipe):
> >> Tool & Command                      Real Time    User Time    Sys Time
>   Speedup vs grep
> >> ripgrep (rg "printf" /usr)           0.496 s      0.511 s     0.604 s
>      3.1=C3=97 faster
> >> grep (grep -R "printf" /usr)         1.533 s      0.633 s     0.897 s
>           =E2=80=94
> >>
> >> Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.co=
m
> >
> > Hello,
> >
> > Thanks for the recipes!
> >
> > We also started to work on those recipes but we wanted to have ptests.
>
> Thank you for the update!
>
> I understand the reproducibility issues with cargo-based ptests.
>
> For now, I think these recipes can be considered as they are. Once a
> generic solution
> for cargo-based ptest support to is available to address reproducibility
> issues, we can
> inherit it in these recipes and enable ptests accordingly.
>
> If you prefer to implement tests for these recipes now, I can look into
> adding test support.
>

While adding ptest support for cargo based recipes is a broader area of
concern
I think it will be good to consider that to address while here. Adding a
recipe with
ptests sets it up for success in future upgrades and work as we now run the
recipe
ptests regularly. I would encourage you to work on fixing it once for all
while here.


>
> > We got stuck on ptests reproducibility, while we could patch each
> > recipe, I would rather have a generic solution.
> > I've created a BZ ticket to track the work on this:
> > 16094 =E2=80=93 Generically improve cargo-based tests package reproduci=
bility
> > https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16094
> > I took the ticket but I won't have time to work on it soon (feel free
> > to take it if you want!).
> At the moment we don't have time to work on this bug due to other priorit=
y
> work.
>
> Thanks,
> Deepesh
> >
> >> ---
> >>   .../ripgrep/ripgrep-crates.inc                | 116 ++++++++++++++++=
++
> >>   .../ripgrep/ripgrep_15.1.0.bb                 |  22 ++++
> >>   2 files changed, 138 insertions(+)
> >>   create mode 100644 meta-oe/recipes-extended/ripgrep/ripgrep-crates.i=
nc
> >>   create mode 100644 meta-oe/recipes-extended/ripgrep/ripgrep_15.1.0.b=
b
> >>
> >> diff --git a/meta-oe/recipes-extended/ripgrep/ripgrep-crates.inc
> b/meta-oe/recipes-extended/ripgrep/ripgrep-crates.inc
> >> new file mode 100644
> >> index 0000000000..aa7e3f9dd2
> >> --- /dev/null
> >> +++ b/meta-oe/recipes-extended/ripgrep/ripgrep-crates.inc
> >> @@ -0,0 +1,116 @@
> >> +# Autogenerated with 'bitbake -c update_crates ripgrep'
> >> +
> >> +# from Cargo.lock
> >> +SRC_URI +=3D " \
> >> +    crate://crates.io/aho-corasick/1.1.3 \
> >> +    crate://crates.io/anyhow/1.0.100 \
> >> +    crate://crates.io/bstr/1.12.0 \
> >> +    crate://crates.io/cc/1.2.41 \
> >> +    crate://crates.io/cfg-if/1.0.4 \
> >> +    crate://crates.io/crossbeam-deque/0.8.6 \
> >> +    crate://crates.io/crossbeam-epoch/0.9.18 \
> >> +    crate://crates.io/crossbeam-utils/0.8.21 \
> >> +    crate://crates.io/encoding_rs/0.8.35 \
> >> +    crate://crates.io/encoding_rs_io/0.1.7 \
> >> +    crate://crates.io/find-msvc-tools/0.1.4 \
> >> +    crate://crates.io/getrandom/0.3.4 \
> >> +    crate://crates.io/globset/0.4.18 \
> >> +    crate://crates.io/grep/0.4.1 \
> >> +    crate://crates.io/grep-cli/0.1.12 \
> >> +    crate://crates.io/grep-matcher/0.1.8 \
> >> +    crate://crates.io/grep-pcre2/0.1.9 \
> >> +    crate://crates.io/grep-printer/0.3.1 \
> >> +    crate://crates.io/grep-regex/0.1.14 \
> >> +    crate://crates.io/grep-searcher/0.1.16 \
> >> +    crate://crates.io/ignore/0.4.24 \
> >> +    crate://crates.io/itoa/1.0.15 \
> >> +    crate://crates.io/jobserver/0.1.34 \
> >> +    crate://crates.io/lexopt/0.3.1 \
> >> +    crate://crates.io/libc/0.2.177 \
> >> +    crate://crates.io/log/0.4.28 \
> >> +    crate://crates.io/memchr/2.7.6 \
> >> +    crate://crates.io/memmap2/0.9.9 \
> >> +    crate://crates.io/pcre2/0.2.11 \
> >> +    crate://crates.io/pcre2-sys/0.2.10 \
> >> +    crate://crates.io/pkg-config/0.3.32 \
> >> +    crate://crates.io/proc-macro2/1.0.101 \
> >> +    crate://crates.io/quote/1.0.41 \
> >> +    crate://crates.io/r-efi/5.3.0 \
> >> +    crate://crates.io/regex-automata/0.4.13 \
> >> +    crate://crates.io/regex-syntax/0.8.8 \
> >> +    crate://crates.io/ryu/1.0.20 \
> >> +    crate://crates.io/same-file/1.0.6 \
> >> +    crate://crates.io/serde/1.0.228 \
> >> +    crate://crates.io/serde_core/1.0.228 \
> >> +    crate://crates.io/serde_derive/1.0.228 \
> >> +    crate://crates.io/serde_json/1.0.145 \
> >> +    crate://crates.io/shlex/1.3.0 \
> >> +    crate://crates.io/syn/2.0.107 \
> >> +    crate://crates.io/termcolor/1.4.1 \
> >> +    crate://crates.io/textwrap/0.16.2 \
> >> +    crate://
> crates.io/tikv-jemalloc-sys/0.6.1+5.3.0-1-ge13ca993e8ccb9ba9847cc330696e0=
2839f328f7
> \
> >> +    crate://crates.io/tikv-jemallocator/0.6.1 \
> >> +    crate://crates.io/unicode-ident/1.0.20 \
> >> +    crate://crates.io/walkdir/2.5.0 \
> >> +    crate://crates.io/wasip2/1.0.1+wasi-0.2.4 \
> >> +    crate://crates.io/winapi-util/0.1.11 \
> >> +    crate://crates.io/windows-link/0.2.1 \
> >> +    crate://crates.io/windows-sys/0.61.2 \
> >> +    crate://crates.io/wit-bindgen/0.46.0 \
> >> +"
> >> +
> >> +SRC_URI[aho-corasick-1.1.3.sha256sum] =3D
> "8e60d3430d3a69478ad0993f19238d2df97c507009a52b3c10addcd7f6bcb916"
> >> +SRC_URI[anyhow-1.0.100.sha256sum] =3D
> "a23eb6b1614318a8071c9b2521f36b424b2c83db5eb3a0fead4a6c0809af6e61"
> >> +SRC_URI[bstr-1.12.0.sha256sum] =3D
> "234113d19d0d7d613b40e86fb654acf958910802bcceab913a4f9e7cda03b1a4"
> >> +SRC_URI[cc-1.2.41.sha256sum] =3D
> "ac9fe6cdbb24b6ade63616c0a0688e45bb56732262c158df3c0c4bea4ca47cb7"
> >> +SRC_URI[cfg-if-1.0.4.sha256sum] =3D
> "9330f8b2ff13f34540b44e946ef35111825727b38d33286ef986142615121801"
> >> +SRC_URI[crossbeam-deque-0.8.6.sha256sum] =3D
> "9dd111b7b7f7d55b72c0a6ae361660ee5853c9af73f70c3c2ef6858b950e2e51"
> >> +SRC_URI[crossbeam-epoch-0.9.18.sha256sum] =3D
> "5b82ac4a3c2ca9c3460964f020e1402edd5753411d7737aa39c3714ad1b5420e"
> >> +SRC_URI[crossbeam-utils-0.8.21.sha256sum] =3D
> "d0a5c400df2834b80a4c3327b3aad3a4c4cd4de0629063962b03235697506a28"
> >> +SRC_URI[encoding_rs-0.8.35.sha256sum] =3D
> "75030f3c4f45dafd7586dd6780965a8c7e8e285a5ecb86713e63a79c5b2766f3"
> >> +SRC_URI[encoding_rs_io-0.1.7.sha256sum] =3D
> "1cc3c5651fb62ab8aa3103998dade57efdd028544bd300516baa31840c252a83"
> >> +SRC_URI[find-msvc-tools-0.1.4.sha256sum] =3D
> "52051878f80a721bb68ebfbc930e07b65ba72f2da88968ea5c06fd6ca3d3a127"
> >> +SRC_URI[getrandom-0.3.4.sha256sum] =3D
> "899def5c37c4fd7b2664648c28120ecec138e4d395b459e5ca34f9cce2dd77fd"
> >> +SRC_URI[globset-0.4.18.sha256sum] =3D
> "52dfc19153a48bde0cbd630453615c8151bce3a5adfac7a0aebfbf0a1e1f57e3"
> >> +SRC_URI[grep-0.4.1.sha256sum] =3D
> "309217bc53e2c691c314389c7fa91f9cd1a998cda19e25544ea47d94103880c3"
> >> +SRC_URI[grep-cli-0.1.12.sha256sum] =3D
> "cf32d263c5d5cc2a23ce587097f5ddafdb188492ba2e6fb638eaccdc22453631"
> >> +SRC_URI[grep-matcher-0.1.8.sha256sum] =3D
> "36d7b71093325ab22d780b40d7df3066ae4aebb518ba719d38c697a8228a8023"
> >> +SRC_URI[grep-pcre2-0.1.9.sha256sum] =3D
> "667bb90a3ee51f8f6e2aadf1d0f106ea42efca4cf28f0e71f0fdec1137d7f9b0"
> >> +SRC_URI[grep-printer-0.3.1.sha256sum] =3D
> "fd76035e87871f51c1ee5b793e32122b3ccf9c692662d9622ef1686ff5321acb"
> >> +SRC_URI[grep-regex-0.1.14.sha256sum] =3D
> "0ce0c256c3ad82bcc07b812c15a45ec1d398122e8e15124f96695234db7112ef"
> >> +SRC_URI[grep-searcher-0.1.16.sha256sum] =3D
> "ac63295322dc48ebb20a25348147905d816318888e64f531bfc2a2bc0577dc34"
> >> +SRC_URI[ignore-0.4.24.sha256sum] =3D
> "81776e6f9464432afcc28d03e52eb101c93b6f0566f52aef2427663e700f0403"
> >> +SRC_URI[itoa-1.0.15.sha256sum] =3D
> "4a5f13b858c8d314ee3e8f639011f7ccefe71f97f96e50151fb991f267928e2c"
> >> +SRC_URI[jobserver-0.1.34.sha256sum] =3D
> "9afb3de4395d6b3e67a780b6de64b51c978ecf11cb9a462c66be7d4ca9039d33"
> >> +SRC_URI[lexopt-0.3.1.sha256sum] =3D
> "9fa0e2a1fcbe2f6be6c42e342259976206b383122fc152e872795338b5a3f3a7"
> >> +SRC_URI[libc-0.2.177.sha256sum] =3D
> "2874a2af47a2325c2001a6e6fad9b16a53b802102b528163885171cf92b15976"
> >> +SRC_URI[log-0.4.28.sha256sum] =3D
> "34080505efa8e45a4b816c349525ebe327ceaa8559756f0356cba97ef3bf7432"
> >> +SRC_URI[memchr-2.7.6.sha256sum] =3D
> "f52b00d39961fc5b2736ea853c9cc86238e165017a493d1d5c8eac6bdc4cc273"
> >> +SRC_URI[memmap2-0.9.9.sha256sum] =3D
> "744133e4a0e0a658e1374cf3bf8e415c4052a15a111acd372764c55b4177d490"
> >> +SRC_URI[pcre2-0.2.11.sha256sum] =3D
> "9e970b0fcce0c7ee6ef662744ff711f21ccd6f11b7cf03cd187a80e89797fc67"
> >> +SRC_URI[pcre2-sys-0.2.10.sha256sum] =3D
> "18b9073c1a2549bd409bf4a32c94d903bb1a09bf845bc306ae148897fa0760a4"
> >> +SRC_URI[pkg-config-0.3.32.sha256sum] =3D
> "7edddbd0b52d732b21ad9a5fab5c704c14cd949e5e9a1ec5929a24fded1b904c"
> >> +SRC_URI[proc-macro2-1.0.101.sha256sum] =3D
> "89ae43fd86e4158d6db51ad8e2b80f313af9cc74f5c0e03ccb87de09998732de"
> >> +SRC_URI[quote-1.0.41.sha256sum] =3D
> "ce25767e7b499d1b604768e7cde645d14cc8584231ea6b295e9c9eb22c02e1d1"
> >> +SRC_URI[r-efi-5.3.0.sha256sum] =3D
> "69cdb34c158ceb288df11e18b4bd39de994f6657d83847bdffdbd7f346754b0f"
> >> +SRC_URI[regex-automata-0.4.13.sha256sum] =3D
> "5276caf25ac86c8d810222b3dbb938e512c55c6831a10f3e6ed1c93b84041f1c"
> >> +SRC_URI[regex-syntax-0.8.8.sha256sum] =3D
> "7a2d987857b319362043e95f5353c0535c1f58eec5336fdfcf626430af7def58"
> >> +SRC_URI[ryu-1.0.20.sha256sum] =3D
> "28d3b2b1366ec20994f1fd18c3c594f05c5dd4bc44d8bb0c1c632c8d6829481f"
> >> +SRC_URI[same-file-1.0.6.sha256sum] =3D
> "93fc1dc3aaa9bfed95e02e6eadabb4baf7e3078b0bd1b4d7b6b0b68378900502"
> >> +SRC_URI[serde-1.0.228.sha256sum] =3D
> "9a8e94ea7f378bd32cbbd37198a4a91436180c5bb472411e48b5ec2e2124ae9e"
> >> +SRC_URI[serde_core-1.0.228.sha256sum] =3D
> "41d385c7d4ca58e59fc732af25c3983b67ac852c1a25000afe1175de458b67ad"
> >> +SRC_URI[serde_derive-1.0.228.sha256sum] =3D
> "d540f220d3187173da220f885ab66608367b6574e925011a9353e4badda91d79"
> >> +SRC_URI[serde_json-1.0.145.sha256sum] =3D
> "402a6f66d8c709116cf22f558eab210f5a50187f702eb4d7e5ef38d9a7f1c79c"
> >> +SRC_URI[shlex-1.3.0.sha256sum] =3D
> "0fda2ff0d084019ba4d7c6f371c95d8fd75ce3524c3cb8fb653a3023f6323e64"
> >> +SRC_URI[syn-2.0.107.sha256sum] =3D
> "2a26dbd934e5451d21ef060c018dae56fc073894c5a7896f882928a76e6d081b"
> >> +SRC_URI[termcolor-1.4.1.sha256sum] =3D
> "06794f8f6c5c898b3275aebefa6b8a1cb24cd2c6c79397ab15774837a0bc5755"
> >> +SRC_URI[textwrap-0.16.2.sha256sum] =3D
> "c13547615a44dc9c452a8a534638acdf07120d4b6847c8178705da06306a3057"
> >>
> +SRC_URI[tikv-jemalloc-sys-0.6.1+5.3.0-1-ge13ca993e8ccb9ba9847cc330696e02=
839f328f7.sha256sum]
> =3D "cd8aa5b2ab86a2cefa406d889139c162cbb230092f7d1d7cbc1716405d852a3b"
> >> +SRC_URI[tikv-jemallocator-0.6.1.sha256sum] =3D
> "0359b4327f954e0567e69fb191cf1436617748813819c94b8cd4a431422d053a"
> >> +SRC_URI[unicode-ident-1.0.20.sha256sum] =3D
> "462eeb75aeb73aea900253ce739c8e18a67423fadf006037cd3ff27e82748a06"
> >> +SRC_URI[walkdir-2.5.0.sha256sum] =3D
> "29790946404f91d9c5d06f9874efddea1dc06c5efe94541a7d6863108e3a5e4b"
> >> +SRC_URI[wasip2-1.0.1+wasi-0.2.4.sha256sum] =3D
> "0562428422c63773dad2c345a1882263bbf4d65cf3f42e90921f787ef5ad58e7"
> >> +SRC_URI[winapi-util-0.1.11.sha256sum] =3D
> "c2a7b1c03c876122aa43f3020e6c3c3ee5c05081c9a00739faf7503aeba10d22"
> >> +SRC_URI[windows-link-0.2.1.sha256sum] =3D
> "f0805222e57f7521d6a62e36fa9163bc891acd422f971defe97d64e70d0a4fe5"
> >> +SRC_URI[windows-sys-0.61.2.sha256sum] =3D
> "ae137229bcbd6cdf0f7b80a31df61766145077ddf49416a728b02cb3921ff3fc"
> >> +SRC_URI[wit-bindgen-0.46.0.sha256sum] =3D
> "f17a85883d4e6d00e8a97c586de764dabcc06133f7f1d55dce5cdc070ad7fe59"
> >> diff --git a/meta-oe/recipes-extended/ripgrep/ripgrep_15.1.0.bb
> b/meta-oe/recipes-extended/ripgrep/ripgrep_15.1.0.bb
> >> new file mode 100644
> >> index 0000000000..7bb6be1cb6
> >> --- /dev/null
> >> +++ b/meta-oe/recipes-extended/ripgrep/ripgrep_15.1.0.bb
> >> @@ -0,0 +1,22 @@
> >> +SUMMARY =3D "ripgrep - Fast, recursive search tool like grep, written=
 in
> Rust"
> >> +HOMEPAGE =3D "https://crates.io/crates/ripgrep"
> >> +DESCRIPTION =3D "ripgrep recursively searches directories for a regex
> pattern \
> >> +               while respecting .gitignore. It's fast, safe, and
> written \
> >> +               entirely in Rust."
> >> +
> >> +LICENSE =3D "MIT"
> >> +LIC_FILES_CHKSUM =3D " \
> >> +    file://LICENSE-MIT;md5=3D8d0d0aa488af0ab9aafa3b85a7fc8e12 \
> >> +"
> >> +
> >> +SRC_URI =3D "crate://crates.io/ripgrep/${PV};name=3Dripgrep
> <http://crates.io/ripgrep/$%7BPV%7D;name=3Dripgrep>"
> >> +SRC_URI[ripgrep.sha256sum] =3D
> "f388c4955f85477c28a8667355819844a06614b083c23517f0e86bd1d6d82b73"
> >> +S =3D "${CARGO_VENDORING_DIRECTORY}/ripgrep-${PV}"
> >> +
> >> +inherit cargo cargo-update-recipe-crates
> >> +
> >> +DEPENDS +=3D "libstd-rs"
> >> +
> >> +require ${BPN}-crates.inc
> >> +
> >> +BBCLASSEXTEND =3D "native"
> >> --
> >> 2.49.0
> >>
> >>
> >>
> >>
> >
> > --
> > Yoann Congal
> > Smile ECS
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#122444):
> https://lists.openembedded.org/g/openembedded-devel/message/122444
> Mute This Topic: https://lists.openembedded.org/mt/116691253/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000022c792064589d3e3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Dec 9, =
2025 at 3:17=E2=80=AFAM Varatharajan, Deepesh via <a href=3D"http://lists.o=
penembedded.org">lists.openembedded.org</a> &lt;deepesh.varatharajan=3D<a h=
ref=3D"mailto:windriver.com@lists.openembedded.org">windriver.com@lists.ope=
nembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex"><br>
On 09-12-2025 15:00, Yoann Congal wrote:<br>
&gt; CAUTION: This email comes from a non Wind River email account!<br>
&gt; Do not click links or open attachments unless you recognize the sender=
 and know the content is safe.<br>
&gt;<br>
&gt; Le mar. 9 d=C3=A9c. 2025 =C3=A0 09:57, Varatharajan, Deepesh via<br>
&gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D=
"_blank">lists.openembedded.org</a><br>
&gt; &lt;deepesh.varatharajan=3D<a href=3D"mailto:windriver.com@lists.opene=
mbedded.org" target=3D"_blank">windriver.com@lists.openembedded.org</a>&gt;=
 a =C3=A9crit :<br>
&gt;&gt; From: Deepesh Varatharajan &lt;<a href=3D"mailto:Deepesh.Varathara=
jan@windriver.com" target=3D"_blank">Deepesh.Varatharajan@windriver.com</a>=
&gt;<br>
&gt;&gt;<br>
&gt;&gt; ripgrep is a fast, line-oriented search tool written in Rust.<br>
&gt;&gt; Add recipe for the latest release (15.1.0)<br>
&gt;&gt;<br>
&gt;&gt; - Recursively searches the current directory using a regex pattern=
<br>
&gt;&gt; - Respects .gitignore rules<br>
&gt;&gt; - Provides first-class support on Linux<br>
&gt;&gt; - &#39;rg&#39; is significantly faster than grep<br>
&gt;&gt;<br>
&gt;&gt; More information: <a href=3D"https://crates.io/crates/ripgrep" rel=
=3D"noreferrer" target=3D"_blank">https://crates.io/crates/ripgrep</a><br>
&gt;&gt;<br>
&gt;&gt; Upstream Benchmarks:<br>
&gt;&gt; Task=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ripgrep=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GNU grep=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Speedup vs grep<br>
&gt;&gt; Basic search (Unicode)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 536 lines=
, 0.082s=C2=A0 =C2=A0 =C2=A0 =C2=A0536 lines, 0.273s=C2=A0 =C2=A0 =C2=A0 =
=C2=A0ripgrep ~3.3=C3=97 faster<br>
&gt;&gt; Ignoring gitignore files=C2=A0 =C2=A0 =C2=A0 =C2=A0 447 lines, 0.0=
63s=C2=A0 =C2=A0 =C2=A0 =C2=A0447 lines, 0.674s=C2=A0 =C2=A0 =C2=A0 =C2=A0r=
ipgrep ~10=C3=97 faster<br>
&gt;&gt; Large single file (~13GB)=C2=A0 =C2=A0 =C2=A0 =C2=A07882 lines, 1.=
042s=C2=A0 =C2=A0 =C2=A0 7882 lines, 6.577s=C2=A0 =C2=A0 =C2=A0 ripgrep ~6.=
3=C3=97 faster<br>
&gt;&gt;<br>
&gt;&gt; Bechmarks inside qemu (ripgrep built from this recipe):<br>
&gt;&gt; Tool &amp; Command=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Real Time=C2=A0 =C2=A0 User Time=C2=A0 =C2=A0 =
Sys Time=C2=A0 =C2=A0 Speedup vs grep<br>
&gt;&gt; ripgrep (rg &quot;printf&quot; /usr)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A00.496 s=C2=A0 =C2=A0 =C2=A0 0.511 s=C2=A0 =C2=A0 =C2=A00.604 s=
=C2=A0 =C2=A0 =C2=A0 =C2=A03.1=C3=97 faster<br>
&gt;&gt; grep (grep -R &quot;printf&quot; /usr)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A01.533 s=C2=A0 =C2=A0 =C2=A0 0.633 s=C2=A0 =C2=A0 =C2=A00.897 s=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =E2=80=94<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Deepesh Varatharajan &lt;<a href=3D"mailto:Deepesh.=
Varatharajan@windriver.com" target=3D"_blank">Deepesh.Varatharajan@windrive=
r.com</a>&gt;<br>
&gt; Hello,<br>
&gt;<br>
&gt; Thanks for the recipes!<br>
&gt;<br>
&gt; We also started to work on those recipes but we wanted to have ptests.=
<br>
<br>
Thank you for the update!<br>
<br>
I understand the reproducibility issues with cargo-based ptests.<br>
<br>
For now, I think these recipes can be considered as they are. Once a <br>
generic solution<br>
for cargo-based ptest support to is available to address reproducibility <b=
r>
issues, we can<br>
inherit it in these recipes and enable ptests accordingly.<br>
<br>
If you prefer to implement tests for these recipes now, I can look into <br=
>
adding test support.<br></blockquote><div><br></div><div>While adding ptest=
 support for cargo based recipes is a broader area of concern</div><div>I t=
hink it will be good to consider that to address while here. Adding a recip=
e with</div><div>ptests sets it up for success in future upgrades and work =
as we now run the recipe</div><div>ptests=C2=A0regularly. I would encourage=
 you to work on fixing it once for all while here.</div><div>=C2=A0</div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; We got stuck on ptests reproducibility, while we could patch each<br>
&gt; recipe, I would rather have a generic solution.<br>
&gt; I&#39;ve created a BZ ticket to track the work on this:<br>
&gt; 16094 =E2=80=93 Generically improve cargo-based tests package reproduc=
ibility<br>
&gt; <a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16094" =
rel=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctoproject.org/show=
_bug.cgi?id=3D16094</a><br>
&gt; I took the ticket but I won&#39;t have time to work on it soon (feel f=
ree<br>
&gt; to take it if you want!).<br>
At the moment we don&#39;t have time to work on this bug due to other prior=
ity<br>
work.<br>
<br>
Thanks,<br>
Deepesh<br>
&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 =C2=A0.../ripgrep/ripgrep-crates.inc=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 116 ++++++++++++++++++<br>
&gt;&gt;=C2=A0 =C2=A0.../ripgrep/<a href=3D"http://ripgrep_15.1.0.bb" rel=
=3D"noreferrer" target=3D"_blank">ripgrep_15.1.0.bb</a>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 22 ++++<br>
&gt;&gt;=C2=A0 =C2=A02 files changed, 138 insertions(+)<br>
&gt;&gt;=C2=A0 =C2=A0create mode 100644 meta-oe/recipes-extended/ripgrep/ri=
pgrep-crates.inc<br>
&gt;&gt;=C2=A0 =C2=A0create mode 100644 meta-oe/recipes-extended/ripgrep/<a=
 href=3D"http://ripgrep_15.1.0.bb" rel=3D"noreferrer" target=3D"_blank">rip=
grep_15.1.0.bb</a><br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta-oe/recipes-extended/ripgrep/ripgrep-crates.inc b=
/meta-oe/recipes-extended/ripgrep/ripgrep-crates.inc<br>
&gt;&gt; new file mode 100644<br>
&gt;&gt; index 0000000000..aa7e3f9dd2<br>
&gt;&gt; --- /dev/null<br>
&gt;&gt; +++ b/meta-oe/recipes-extended/ripgrep/ripgrep-crates.inc<br>
&gt;&gt; @@ -0,0 +1,116 @@<br>
&gt;&gt; +# Autogenerated with &#39;bitbake -c update_crates ripgrep&#39;<b=
r>
&gt;&gt; +<br>
&gt;&gt; +# from Cargo.lock<br>
&gt;&gt; +SRC_URI +=3D &quot; \<br>
&gt;&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/aho-corasick/1.=
1.3" rel=3D"noreferrer" target=3D"_blank">crates.io/aho-corasick/1.1.3</a> =
\<br>
&gt;&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/anyhow/1.0.100"=
 rel=3D"noreferrer" target=3D"_blank">crates.io/anyhow/1.0.100</a> \<br>
&gt;&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/bstr/1.12.0" re=
l=3D"noreferrer" target=3D"_blank">crates.io/bstr/1.12.0</a> \<br>
&gt;&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/cc/1.2.41" rel=
=3D"noreferrer" target=3D"_blank">crates.io/cc/1.2.41</a> \<br>
&gt;&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/cfg-if/1.0.4" r=
el=3D"noreferrer" target=3D"_blank">crates.io/cfg-if/1.0.4</a> \<br>
&gt;&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/crossbeam-deque=
/0.8.6" rel=3D"noreferrer" target=3D"_blank">crates.io/crossbeam-deque/0.8.=
6</a> \<br>
&gt;&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/crossbeam-epoch=
/0.9.18" rel=3D"noreferrer" target=3D"_blank">crates.io/crossbeam-epoch/0.9=
.18</a> \<br>
&gt;&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/crossbeam-utils=
/0.8.21" rel=3D"noreferrer" target=3D"_blank">crates.io/crossbeam-utils/0.8=
.21</a> \<br>
&gt;&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/encoding_rs/0.8=
.35" rel=3D"noreferrer" target=3D"_blank">crates.io/encoding_rs/0.8.35</a> =
\<br>
&gt;&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/encoding_rs_io/=
0.1.7" rel=3D"noreferrer" target=3D"_blank">crates.io/encoding_rs_io/0.1.7<=
/a> \<br>
&gt;&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/find-msvc-tools=
/0.1.4" rel=3D"noreferrer" target=3D"_blank">crates.io/find-msvc-tools/0.1.=
4</a> \<br>
&gt;&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/getrandom/0.3.4=
" rel=3D"noreferrer" target=3D"_blank">crates.io/getrandom/0.3.4</a> \<br>
&gt;&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/globset/0.4.18"=
 rel=3D"noreferrer" target=3D"_blank">crates.io/globset/0.4.18</a> \<br>
&gt;&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/grep/0.4.1" rel=
=3D"noreferrer" target=3D"_blank">crates.io/grep/0.4.1</a> \<br>
&gt;&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/grep-cli/0.1.12=
" rel=3D"noreferrer" target=3D"_blank">crates.io/grep-cli/0.1.12</a> \<br>
&gt;&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/grep-matcher/0.=
1.8" rel=3D"noreferrer" target=3D"_blank">crates.io/grep-matcher/0.1.8</a> =
\<br>
&gt;&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/grep-pcre2/0.1.=
9" rel=3D"noreferrer" target=3D"_blank">crates.io/grep-pcre2/0.1.9</a> \<br=
>
&gt;&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/grep-printer/0.=
3.1" rel=3D"noreferrer" target=3D"_blank">crates.io/grep-printer/0.3.1</a> =
\<br>
&gt;&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/grep-regex/0.1.=
14" rel=3D"noreferrer" target=3D"_blank">crates.io/grep-regex/0.1.14</a> \<=
br>
&gt;&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/grep-searcher/0=
.1.16" rel=3D"noreferrer" target=3D"_blank">crates.io/grep-searcher/0.1.16<=
/a> \<br>
&gt;&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/ignore/0.4.24" =
rel=3D"noreferrer" target=3D"_blank">crates.io/ignore/0.4.24</a> \<br>
&gt;&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/itoa/1.0.15" re=
l=3D"noreferrer" target=3D"_blank">crates.io/itoa/1.0.15</a> \<br>
&gt;&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/jobserver/0.1.3=
4" rel=3D"noreferrer" target=3D"_blank">crates.io/jobserver/0.1.34</a> \<br=
>
&gt;&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/lexopt/0.3.1" r=
el=3D"noreferrer" target=3D"_blank">crates.io/lexopt/0.3.1</a> \<br>
&gt;&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/libc/0.2.177" r=
el=3D"noreferrer" target=3D"_blank">crates.io/libc/0.2.177</a> \<br>
&gt;&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/log/0.4.28" rel=
=3D"noreferrer" target=3D"_blank">crates.io/log/0.4.28</a> \<br>
&gt;&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/memchr/2.7.6" r=
el=3D"noreferrer" target=3D"_blank">crates.io/memchr/2.7.6</a> \<br>
&gt;&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/memmap2/0.9.9" =
rel=3D"noreferrer" target=3D"_blank">crates.io/memmap2/0.9.9</a> \<br>
&gt;&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pcre2/0.2.11" r=
el=3D"noreferrer" target=3D"_blank">crates.io/pcre2/0.2.11</a> \<br>
&gt;&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pcre2-sys/0.2.1=
0" rel=3D"noreferrer" target=3D"_blank">crates.io/pcre2-sys/0.2.10</a> \<br=
>
&gt;&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pkg-config/0.3.=
32" rel=3D"noreferrer" target=3D"_blank">crates.io/pkg-config/0.3.32</a> \<=
br>
&gt;&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/proc-macro2/1.0=
.101" rel=3D"noreferrer" target=3D"_blank">crates.io/proc-macro2/1.0.101</a=
> \<br>
&gt;&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/quote/1.0.41" r=
el=3D"noreferrer" target=3D"_blank">crates.io/quote/1.0.41</a> \<br>
&gt;&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/r-efi/5.3.0" re=
l=3D"noreferrer" target=3D"_blank">crates.io/r-efi/5.3.0</a> \<br>
&gt;&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/regex-automata/=
0.4.13" rel=3D"noreferrer" target=3D"_blank">crates.io/regex-automata/0.4.1=
3</a> \<br>
&gt;&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/regex-syntax/0.=
8.8" rel=3D"noreferrer" target=3D"_blank">crates.io/regex-syntax/0.8.8</a> =
\<br>
&gt;&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/ryu/1.0.20" rel=
=3D"noreferrer" target=3D"_blank">crates.io/ryu/1.0.20</a> \<br>
&gt;&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/same-file/1.0.6=
" rel=3D"noreferrer" target=3D"_blank">crates.io/same-file/1.0.6</a> \<br>
&gt;&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/serde/1.0.228" =
rel=3D"noreferrer" target=3D"_blank">crates.io/serde/1.0.228</a> \<br>
&gt;&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/serde_core/1.0.=
228" rel=3D"noreferrer" target=3D"_blank">crates.io/serde_core/1.0.228</a> =
\<br>
&gt;&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/serde_derive/1.=
0.228" rel=3D"noreferrer" target=3D"_blank">crates.io/serde_derive/1.0.228<=
/a> \<br>
&gt;&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/serde_json/1.0.=
145" rel=3D"noreferrer" target=3D"_blank">crates.io/serde_json/1.0.145</a> =
\<br>
&gt;&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/shlex/1.3.0" re=
l=3D"noreferrer" target=3D"_blank">crates.io/shlex/1.3.0</a> \<br>
&gt;&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/syn/2.0.107" re=
l=3D"noreferrer" target=3D"_blank">crates.io/syn/2.0.107</a> \<br>
&gt;&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/termcolor/1.4.1=
" rel=3D"noreferrer" target=3D"_blank">crates.io/termcolor/1.4.1</a> \<br>
&gt;&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/textwrap/0.16.2=
" rel=3D"noreferrer" target=3D"_blank">crates.io/textwrap/0.16.2</a> \<br>
&gt;&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/tikv-jemalloc-s=
ys/0.6.1+5.3.0-1-ge13ca993e8ccb9ba9847cc330696e02839f328f7" rel=3D"noreferr=
er" target=3D"_blank">crates.io/tikv-jemalloc-sys/0.6.1+5.3.0-1-ge13ca993e8=
ccb9ba9847cc330696e02839f328f7</a> \<br>
&gt;&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/tikv-jemallocat=
or/0.6.1" rel=3D"noreferrer" target=3D"_blank">crates.io/tikv-jemallocator/=
0.6.1</a> \<br>
&gt;&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/unicode-ident/1=
.0.20" rel=3D"noreferrer" target=3D"_blank">crates.io/unicode-ident/1.0.20<=
/a> \<br>
&gt;&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/walkdir/2.5.0" =
rel=3D"noreferrer" target=3D"_blank">crates.io/walkdir/2.5.0</a> \<br>
&gt;&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/wasip2/1.0.1+wa=
si-0.2.4" rel=3D"noreferrer" target=3D"_blank">crates.io/wasip2/1.0.1+wasi-=
0.2.4</a> \<br>
&gt;&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/winapi-util/0.1=
.11" rel=3D"noreferrer" target=3D"_blank">crates.io/winapi-util/0.1.11</a> =
\<br>
&gt;&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows-link/0.=
2.1" rel=3D"noreferrer" target=3D"_blank">crates.io/windows-link/0.2.1</a> =
\<br>
&gt;&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows-sys/0.6=
1.2" rel=3D"noreferrer" target=3D"_blank">crates.io/windows-sys/0.61.2</a> =
\<br>
&gt;&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/wit-bindgen/0.4=
6.0" rel=3D"noreferrer" target=3D"_blank">crates.io/wit-bindgen/0.46.0</a> =
\<br>
&gt;&gt; +&quot;<br>
&gt;&gt; +<br>
&gt;&gt; +SRC_URI[aho-corasick-1.1.3.sha256sum] =3D &quot;8e60d3430d3a69478=
ad0993f19238d2df97c507009a52b3c10addcd7f6bcb916&quot;<br>
&gt;&gt; +SRC_URI[anyhow-1.0.100.sha256sum] =3D &quot;a23eb6b1614318a8071c9=
b2521f36b424b2c83db5eb3a0fead4a6c0809af6e61&quot;<br>
&gt;&gt; +SRC_URI[bstr-1.12.0.sha256sum] =3D &quot;234113d19d0d7d613b40e86f=
b654acf958910802bcceab913a4f9e7cda03b1a4&quot;<br>
&gt;&gt; +SRC_URI[cc-1.2.41.sha256sum] =3D &quot;ac9fe6cdbb24b6ade63616c0a0=
688e45bb56732262c158df3c0c4bea4ca47cb7&quot;<br>
&gt;&gt; +SRC_URI[cfg-if-1.0.4.sha256sum] =3D &quot;9330f8b2ff13f34540b44e9=
46ef35111825727b38d33286ef986142615121801&quot;<br>
&gt;&gt; +SRC_URI[crossbeam-deque-0.8.6.sha256sum] =3D &quot;9dd111b7b7f7d5=
5b72c0a6ae361660ee5853c9af73f70c3c2ef6858b950e2e51&quot;<br>
&gt;&gt; +SRC_URI[crossbeam-epoch-0.9.18.sha256sum] =3D &quot;5b82ac4a3c2ca=
9c3460964f020e1402edd5753411d7737aa39c3714ad1b5420e&quot;<br>
&gt;&gt; +SRC_URI[crossbeam-utils-0.8.21.sha256sum] =3D &quot;d0a5c400df283=
4b80a4c3327b3aad3a4c4cd4de0629063962b03235697506a28&quot;<br>
&gt;&gt; +SRC_URI[encoding_rs-0.8.35.sha256sum] =3D &quot;75030f3c4f45dafd7=
586dd6780965a8c7e8e285a5ecb86713e63a79c5b2766f3&quot;<br>
&gt;&gt; +SRC_URI[encoding_rs_io-0.1.7.sha256sum] =3D &quot;1cc3c5651fb62ab=
8aa3103998dade57efdd028544bd300516baa31840c252a83&quot;<br>
&gt;&gt; +SRC_URI[find-msvc-tools-0.1.4.sha256sum] =3D &quot;52051878f80a72=
1bb68ebfbc930e07b65ba72f2da88968ea5c06fd6ca3d3a127&quot;<br>
&gt;&gt; +SRC_URI[getrandom-0.3.4.sha256sum] =3D &quot;899def5c37c4fd7b2664=
648c28120ecec138e4d395b459e5ca34f9cce2dd77fd&quot;<br>
&gt;&gt; +SRC_URI[globset-0.4.18.sha256sum] =3D &quot;52dfc19153a48bde0cbd6=
30453615c8151bce3a5adfac7a0aebfbf0a1e1f57e3&quot;<br>
&gt;&gt; +SRC_URI[grep-0.4.1.sha256sum] =3D &quot;309217bc53e2c691c314389c7=
fa91f9cd1a998cda19e25544ea47d94103880c3&quot;<br>
&gt;&gt; +SRC_URI[grep-cli-0.1.12.sha256sum] =3D &quot;cf32d263c5d5cc2a23ce=
587097f5ddafdb188492ba2e6fb638eaccdc22453631&quot;<br>
&gt;&gt; +SRC_URI[grep-matcher-0.1.8.sha256sum] =3D &quot;36d7b71093325ab22=
d780b40d7df3066ae4aebb518ba719d38c697a8228a8023&quot;<br>
&gt;&gt; +SRC_URI[grep-pcre2-0.1.9.sha256sum] =3D &quot;667bb90a3ee51f8f6e2=
aadf1d0f106ea42efca4cf28f0e71f0fdec1137d7f9b0&quot;<br>
&gt;&gt; +SRC_URI[grep-printer-0.3.1.sha256sum] =3D &quot;fd76035e87871f51c=
1ee5b793e32122b3ccf9c692662d9622ef1686ff5321acb&quot;<br>
&gt;&gt; +SRC_URI[grep-regex-0.1.14.sha256sum] =3D &quot;0ce0c256c3ad82bcc0=
7b812c15a45ec1d398122e8e15124f96695234db7112ef&quot;<br>
&gt;&gt; +SRC_URI[grep-searcher-0.1.16.sha256sum] =3D &quot;ac63295322dc48e=
bb20a25348147905d816318888e64f531bfc2a2bc0577dc34&quot;<br>
&gt;&gt; +SRC_URI[ignore-0.4.24.sha256sum] =3D &quot;81776e6f9464432afcc28d=
03e52eb101c93b6f0566f52aef2427663e700f0403&quot;<br>
&gt;&gt; +SRC_URI[itoa-1.0.15.sha256sum] =3D &quot;4a5f13b858c8d314ee3e8f63=
9011f7ccefe71f97f96e50151fb991f267928e2c&quot;<br>
&gt;&gt; +SRC_URI[jobserver-0.1.34.sha256sum] =3D &quot;9afb3de4395d6b3e67a=
780b6de64b51c978ecf11cb9a462c66be7d4ca9039d33&quot;<br>
&gt;&gt; +SRC_URI[lexopt-0.3.1.sha256sum] =3D &quot;9fa0e2a1fcbe2f6be6c42e3=
42259976206b383122fc152e872795338b5a3f3a7&quot;<br>
&gt;&gt; +SRC_URI[libc-0.2.177.sha256sum] =3D &quot;2874a2af47a2325c2001a6e=
6fad9b16a53b802102b528163885171cf92b15976&quot;<br>
&gt;&gt; +SRC_URI[log-0.4.28.sha256sum] =3D &quot;34080505efa8e45a4b816c349=
525ebe327ceaa8559756f0356cba97ef3bf7432&quot;<br>
&gt;&gt; +SRC_URI[memchr-2.7.6.sha256sum] =3D &quot;f52b00d39961fc5b2736ea8=
53c9cc86238e165017a493d1d5c8eac6bdc4cc273&quot;<br>
&gt;&gt; +SRC_URI[memmap2-0.9.9.sha256sum] =3D &quot;744133e4a0e0a658e1374c=
f3bf8e415c4052a15a111acd372764c55b4177d490&quot;<br>
&gt;&gt; +SRC_URI[pcre2-0.2.11.sha256sum] =3D &quot;9e970b0fcce0c7ee6ef6627=
44ff711f21ccd6f11b7cf03cd187a80e89797fc67&quot;<br>
&gt;&gt; +SRC_URI[pcre2-sys-0.2.10.sha256sum] =3D &quot;18b9073c1a2549bd409=
bf4a32c94d903bb1a09bf845bc306ae148897fa0760a4&quot;<br>
&gt;&gt; +SRC_URI[pkg-config-0.3.32.sha256sum] =3D &quot;7edddbd0b52d732b21=
ad9a5fab5c704c14cd949e5e9a1ec5929a24fded1b904c&quot;<br>
&gt;&gt; +SRC_URI[proc-macro2-1.0.101.sha256sum] =3D &quot;89ae43fd86e4158d=
6db51ad8e2b80f313af9cc74f5c0e03ccb87de09998732de&quot;<br>
&gt;&gt; +SRC_URI[quote-1.0.41.sha256sum] =3D &quot;ce25767e7b499d1b604768e=
7cde645d14cc8584231ea6b295e9c9eb22c02e1d1&quot;<br>
&gt;&gt; +SRC_URI[r-efi-5.3.0.sha256sum] =3D &quot;69cdb34c158ceb288df11e18=
b4bd39de994f6657d83847bdffdbd7f346754b0f&quot;<br>
&gt;&gt; +SRC_URI[regex-automata-0.4.13.sha256sum] =3D &quot;5276caf25ac86c=
8d810222b3dbb938e512c55c6831a10f3e6ed1c93b84041f1c&quot;<br>
&gt;&gt; +SRC_URI[regex-syntax-0.8.8.sha256sum] =3D &quot;7a2d987857b319362=
043e95f5353c0535c1f58eec5336fdfcf626430af7def58&quot;<br>
&gt;&gt; +SRC_URI[ryu-1.0.20.sha256sum] =3D &quot;28d3b2b1366ec20994f1fd18c=
3c594f05c5dd4bc44d8bb0c1c632c8d6829481f&quot;<br>
&gt;&gt; +SRC_URI[same-file-1.0.6.sha256sum] =3D &quot;93fc1dc3aaa9bfed95e0=
2e6eadabb4baf7e3078b0bd1b4d7b6b0b68378900502&quot;<br>
&gt;&gt; +SRC_URI[serde-1.0.228.sha256sum] =3D &quot;9a8e94ea7f378bd32cbbd3=
7198a4a91436180c5bb472411e48b5ec2e2124ae9e&quot;<br>
&gt;&gt; +SRC_URI[serde_core-1.0.228.sha256sum] =3D &quot;41d385c7d4ca58e59=
fc732af25c3983b67ac852c1a25000afe1175de458b67ad&quot;<br>
&gt;&gt; +SRC_URI[serde_derive-1.0.228.sha256sum] =3D &quot;d540f220d318717=
3da220f885ab66608367b6574e925011a9353e4badda91d79&quot;<br>
&gt;&gt; +SRC_URI[serde_json-1.0.145.sha256sum] =3D &quot;402a6f66d8c709116=
cf22f558eab210f5a50187f702eb4d7e5ef38d9a7f1c79c&quot;<br>
&gt;&gt; +SRC_URI[shlex-1.3.0.sha256sum] =3D &quot;0fda2ff0d084019ba4d7c6f3=
71c95d8fd75ce3524c3cb8fb653a3023f6323e64&quot;<br>
&gt;&gt; +SRC_URI[syn-2.0.107.sha256sum] =3D &quot;2a26dbd934e5451d21ef060c=
018dae56fc073894c5a7896f882928a76e6d081b&quot;<br>
&gt;&gt; +SRC_URI[termcolor-1.4.1.sha256sum] =3D &quot;06794f8f6c5c898b3275=
aebefa6b8a1cb24cd2c6c79397ab15774837a0bc5755&quot;<br>
&gt;&gt; +SRC_URI[textwrap-0.16.2.sha256sum] =3D &quot;c13547615a44dc9c452a=
8a534638acdf07120d4b6847c8178705da06306a3057&quot;<br>
&gt;&gt; +SRC_URI[tikv-jemalloc-sys-0.6.1+5.3.0-1-ge13ca993e8ccb9ba9847cc33=
0696e02839f328f7.sha256sum] =3D &quot;cd8aa5b2ab86a2cefa406d889139c162cbb23=
0092f7d1d7cbc1716405d852a3b&quot;<br>
&gt;&gt; +SRC_URI[tikv-jemallocator-0.6.1.sha256sum] =3D &quot;0359b4327f95=
4e0567e69fb191cf1436617748813819c94b8cd4a431422d053a&quot;<br>
&gt;&gt; +SRC_URI[unicode-ident-1.0.20.sha256sum] =3D &quot;462eeb75aeb73ae=
a900253ce739c8e18a67423fadf006037cd3ff27e82748a06&quot;<br>
&gt;&gt; +SRC_URI[walkdir-2.5.0.sha256sum] =3D &quot;29790946404f91d9c5d06f=
9874efddea1dc06c5efe94541a7d6863108e3a5e4b&quot;<br>
&gt;&gt; +SRC_URI[wasip2-1.0.1+wasi-0.2.4.sha256sum] =3D &quot;0562428422c6=
3773dad2c345a1882263bbf4d65cf3f42e90921f787ef5ad58e7&quot;<br>
&gt;&gt; +SRC_URI[winapi-util-0.1.11.sha256sum] =3D &quot;c2a7b1c03c876122a=
a43f3020e6c3c3ee5c05081c9a00739faf7503aeba10d22&quot;<br>
&gt;&gt; +SRC_URI[windows-link-0.2.1.sha256sum] =3D &quot;f0805222e57f7521d=
6a62e36fa9163bc891acd422f971defe97d64e70d0a4fe5&quot;<br>
&gt;&gt; +SRC_URI[windows-sys-0.61.2.sha256sum] =3D &quot;ae137229bcbd6cdf0=
f7b80a31df61766145077ddf49416a728b02cb3921ff3fc&quot;<br>
&gt;&gt; +SRC_URI[wit-bindgen-0.46.0.sha256sum] =3D &quot;f17a85883d4e6d00e=
8a97c586de764dabcc06133f7f1d55dce5cdc070ad7fe59&quot;<br>
&gt;&gt; diff --git a/meta-oe/recipes-extended/ripgrep/<a href=3D"http://ri=
pgrep_15.1.0.bb" rel=3D"noreferrer" target=3D"_blank">ripgrep_15.1.0.bb</a>=
 b/meta-oe/recipes-extended/ripgrep/<a href=3D"http://ripgrep_15.1.0.bb" re=
l=3D"noreferrer" target=3D"_blank">ripgrep_15.1.0.bb</a><br>
&gt;&gt; new file mode 100644<br>
&gt;&gt; index 0000000000..7bb6be1cb6<br>
&gt;&gt; --- /dev/null<br>
&gt;&gt; +++ b/meta-oe/recipes-extended/ripgrep/<a href=3D"http://ripgrep_1=
5.1.0.bb" rel=3D"noreferrer" target=3D"_blank">ripgrep_15.1.0.bb</a><br>
&gt;&gt; @@ -0,0 +1,22 @@<br>
&gt;&gt; +SUMMARY =3D &quot;ripgrep - Fast, recursive search tool like grep=
, written in Rust&quot;<br>
&gt;&gt; +HOMEPAGE =3D &quot;<a href=3D"https://crates.io/crates/ripgrep" r=
el=3D"noreferrer" target=3D"_blank">https://crates.io/crates/ripgrep</a>&qu=
ot;<br>
&gt;&gt; +DESCRIPTION =3D &quot;ripgrep recursively searches directories fo=
r a regex pattern \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0while resp=
ecting .gitignore. It&#39;s fast, safe, and written \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0entirely i=
n Rust.&quot;<br>
&gt;&gt; +<br>
&gt;&gt; +LICENSE =3D &quot;MIT&quot;<br>
&gt;&gt; +LIC_FILES_CHKSUM =3D &quot; \<br>
&gt;&gt; +=C2=A0 =C2=A0 file://LICENSE-MIT;md5=3D8d0d0aa488af0ab9aafa3b85a7=
fc8e12 \<br>
&gt;&gt; +&quot;<br>
&gt;&gt; +<br>
&gt;&gt; +SRC_URI =3D &quot;crate://<a href=3D"http://crates.io/ripgrep/$%7=
BPV%7D;name=3Dripgrep" rel=3D"noreferrer" target=3D"_blank">crates.io/ripgr=
ep/${PV};name=3Dripgrep</a>&quot;<br>
&gt;&gt; +SRC_URI[ripgrep.sha256sum] =3D &quot;f388c4955f85477c28a866735581=
9844a06614b083c23517f0e86bd1d6d82b73&quot;<br>
&gt;&gt; +S =3D &quot;${CARGO_VENDORING_DIRECTORY}/ripgrep-${PV}&quot;<br>
&gt;&gt; +<br>
&gt;&gt; +inherit cargo cargo-update-recipe-crates<br>
&gt;&gt; +<br>
&gt;&gt; +DEPENDS +=3D &quot;libstd-rs&quot;<br>
&gt;&gt; +<br>
&gt;&gt; +require ${BPN}-crates.inc<br>
&gt;&gt; +<br>
&gt;&gt; +BBCLASSEXTEND =3D &quot;native&quot;<br>
&gt;&gt; --<br>
&gt;&gt; 2.49.0<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; <br>
&gt;&gt;<br>
&gt;<br>
&gt; --<br>
&gt; Yoann Congal<br>
&gt; Smile ECS<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#122444): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/122444" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/122444</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/116691253/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/116691253/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--00000000000022c792064589d3e3--

