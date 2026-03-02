Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0459EA4E10
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 14:57:05 +0000 (UTC)
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.162210.1772463420839519259
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Mar 2026 06:57:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mOpMLh7Z;
 spf=pass (domain: gmail.com, ip: 74.125.224.46, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-64c9707fc11so3229903d50.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 02 Mar 2026 06:57:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772463420; cv=none;
        d=google.com; s=arc-20240605;
        b=XtLhzlFqIcJWOGumPiWBSW8BOkUjBXdEL/2+VDp28o182NGjyYfOdNl08I/StOVjhL
         r31mftNrkv15yGrgIoNt6l46CX+4PnW1XXkFLTw2KxhnasSPO6VA7MLUhnrY4Ypnc9vM
         MVFcpEwijJ5oKwOfAozE5bLRgL0bUM8rUBFdqir0Zl1M20c25bROIHRUso6aGx9UaUpc
         6bC/WyJGr7gEKUIiYUXfX3rNdlIBCjiTn+AiJDOlYbC6VHsM7inqcGdJbM0813FJZOaD
         /TP6aPuJujgHGvZSFjysHcYk6fgdF7+djIq7PBw3Zc3yGHinlTmVM6/gq26/RY00pn1t
         WFXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=KidhYmG1yjphDBa8hT27cYzmzH9KqRhR9cJ1zd5TRGE=;
        fh=80LF4KsQEHkVagsUBcOQVqnhtzy2PF8kdITniUGFpQ4=;
        b=WwD4mgA99BNOsN5tB5QoZtT5DPhnK9T4I8/OenilHMzAHgHmyNkXVSrbxGDl/UwEsS
         BwAufCN44kBkwEwcqr5cNdSYOaJkJt1rzNl2iFa8e7nH8j6De/40XQZDPzlGg8mdJQGx
         ldni+/5e1DP88TFqSIZ1BliTMiNzcp66a0YnXM77yn3yfjZwa05s/jQuP1Dyjc1oPTRI
         0c0+1dVI9EdR+SgjRHxrBu9QLxx7dX9SBnFoi80XXnBsD0zI1kju2dJ7OILa+cX6ZG6A
         HBJB5a5raTZQx/JzAT/dNfw5aW6TkP1J75vqWV8HFwnTpz9NyB9mJnChygLGVMZnaET2
         7+OA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772463420; x=1773068220; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KidhYmG1yjphDBa8hT27cYzmzH9KqRhR9cJ1zd5TRGE=;
        b=mOpMLh7ZCzmnOqwJmgFm5wQ39UFm78RyT8hPz6Lzpcpgxtm/4AEApXaOPiClxJvd+W
         S18on/o6bV7LU8trlAbZvCaOnW4Xn/eRRU6gQjEg+dTszqkNugFEiCPfIx01XgxXruh+
         esDo7yj8b/pgoCTIu2rXSbNGxlZay4M03ZsDZ3HXfnauP177pn3nZ1m6wSxdVt3WQLdK
         aq6Y5bKtMuO4Zm89MFJ1PUrjG7GOf3fQZRojWD8Y7/eO+a5QxolRJtJUmysNp53BhYNN
         SDeIv5CmYOtiLm06SS1OnzoAQPPZGx8UbojSeHCncGUzdO5kiBqU5xKZ3deeJ321G3Wq
         XSNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772463420; x=1773068220;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KidhYmG1yjphDBa8hT27cYzmzH9KqRhR9cJ1zd5TRGE=;
        b=K/H+zpIw/NIVjUEj5Pdm7/WUuOmnlxJ0y4yjmTP5+Di7+wfXYSqgYwt4kPKpxk4S+O
         3yWwOSRhHVJG7Fp8mG5kRA3bly2Q4cDFjtNi5RhrJs5e17w8RAMLw0wMN/ptn6FQtA6q
         oJezxFrK4ppLZjmHlGnAhLFb1Dhpa1BEHwi8gaFunpXTTlw9kXfuq63MQ3c8SJhFHm8+
         cQPn/L5ZzRgYIb7K9SuPwEZSKSE91WkgtDo5CACCsVtkjzvub6LUgS4tiy6hODZLaGwp
         XssigydghUNZ2Uez2rafpLzb1xsPe3uM4boyHMaSNLcPItLV4t8V1T+tRT4wmp9jzySO
         USrA==
X-Gm-Message-State: AOJu0YxZQUrFiyo4jCGlGU0Fgfn+M/acTC5JGdXySv2h4uZQXaq+q6d4
	04JIvF9kS2jMCUsn6+tIbqPxhU7aFP3h2FBCT342vsnysbxtV+zvKnI56akNPW4lAAst6gd+ne+
	l+bttH5p0fy7RPUtMXhDS2Q/fs9LoXuo=
X-Gm-Gg: ATEYQzzFPkkeUlIyhKfbQJXgKVKtFz27idQQWLGY9ZdtULhqqTv5skJsL4AK2v45dr5
	xWhZ7ps8goHKZyXzB5BVH+0puP+dPQBxtPja5HmngPkKVgtYvxw4qS6MwOBT4eIxgnX2sQD0/IK
	CALbQFwMu8cjAI4RGbx3s6rkvJqVbdsf+4kNvExjFkNho1Rl0Z1g5QUQ7n40owvUrSPByV76R65
	yBvTgniNzwXvCpvftjYWlBg4b7jMuN/1q/vJPdPFLNXx7FWBEqTvJpCRyS25jiVQxDzT7sBsMz6
	3dyGo7LeQ9VmSyvsK60m+ikwRatCjzO3h24EZ1ucqavkqrKkithJLQ+9dQ4JXmug2ItT3MlKXr4
	v8gVkOuEn/+M1nNprNnjkoKvz
X-Received: by 2002:a05:690e:e19:b0:64c:e767:7606 with SMTP id
 956f58d0204a3-64ce76779c9mr607135d50.85.1772463419678; Mon, 02 Mar 2026
 06:56:59 -0800 (PST)
MIME-Version: 1.0
References: <20260302144634.835048-1-j-sahu@ti.com>
In-Reply-To: <20260302144634.835048-1-j-sahu@ti.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 2 Mar 2026 06:56:32 -0800
X-Gm-Features: AaiRm50PfVDXVAULfXVetY03HTmV5IhzEX4iha2GtgHT3MVg-7SuKXZP2VibjE8
Message-ID: <CAMKF1sqmBQjDuKWwhQ1gfkz8iqT=7ZDR3JWTXvjQ0e+mPiPQ7Q@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] nodejs: fix NEON llhttp ctzll undefined behavior
To: j-sahu@ti.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000081f3e5064c0bcc90"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Mar 2026 14:57:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124810

--00000000000081f3e5064c0bcc90
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 2, 2026 at 6:47=E2=80=AFAM Jeevan via lists.openembedded.org <j=
-sahu=3D
ti.com@lists.openembedded.org> wrote:

> The NEON SIMD fast path in the bundled llhttp calls
> __builtin_ctzll(match_mask) without checking if match_mask is zero.
> When all 16 bytes in a NEON register are valid header value characters,
> match_mask is 0. Calling __builtin_ctzll(0) is undefined behavior.
>
> GCC at -O2 exploits this by optimizing "if (match_len !=3D 16)" to
> always-true, causing HTTP 400 Bad Request for any header value longer
> than 16 characters on ARM targets with NEON enabled.
>
> Fix by explicitly checking for match_mask =3D=3D 0 and setting
> match_len =3D 16. This bug affects both aarch64 and armv7 NEON targets.
>
> The code this patch modifies is generated, so the patch itself isn't
> suitable for upstream submission, as the root cause of the error is
> in the generator itself. The fix has been merged upstream[1] in
> llparse 7.3.1 and is included in llhttp 9.3.1. This patch can be
> dropped when nodejs updates its bundled llhttp to >=3D 9.3.1.
>
> [1]: https://github.com/nodejs/llparse/pull/83
>
> Signed-off-by: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
> ---
>  ...header-value-__builtin_ctzll-undefin.patch | 60 +++++++++++++++++++
>  .../recipes-devtools/nodejs/nodejs_22.22.0.bb |  1 +
>  2 files changed, 61 insertions(+)
>  create mode 100644
> meta-oe/recipes-devtools/nodejs/nodejs/0001-llhttp-fix-NEON-header-value-=
__builtin_ctzll-undefin.patch
>
> diff --git
> a/meta-oe/recipes-devtools/nodejs/nodejs/0001-llhttp-fix-NEON-header-valu=
e-__builtin_ctzll-undefin.patch
> b/meta-oe/recipes-devtools/nodejs/nodejs/0001-llhttp-fix-NEON-header-valu=
e-__builtin_ctzll-undefin.patch
> new file mode 100644
> index 0000000000..683dddcf04
> --- /dev/null
> +++
> b/meta-oe/recipes-devtools/nodejs/nodejs/0001-llhttp-fix-NEON-header-valu=
e-__builtin_ctzll-undefin.patch
> @@ -0,0 +1,60 @@
> +From a63a5faea54055973bf5f0a514444532563cc20d Mon Sep 17 00:00:00 2001
> +From: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
> +Date: Fri, 27 Feb 2026 20:58:43 +0530
> +Subject: [PATCH] llhttp: fix NEON header value __builtin_ctzll undefined
> + behavior
> +
> +When all 16 bytes match the allowed range, match_mask becomes 0 after
> +the bitwise NOT. Calling __builtin_ctzll(0) is undefined behavior per
> +the C standard.
> +
> +The code expects match_len =3D=3D 16 when all bytes match (so the branch
> +is skipped and p +=3D 16 continues the loop), but this relied on
> +ctzll(0) returning 64, which is not guaranteed.
> +
> +GCC at -O2 exploits this UB by deducing that __builtin_ctzll() result
> +is always in range [0, 63], and after >> 2 always in [0, 15], which
> +is never equal to 16. The compiler then optimizes
> +"if (match_len !=3D 16)" to always-true, causing every valid 16-byte
> +chunk to be falsely rejected as containing an invalid character.
> +
> +This manifests as HTTP 400 Bad Request (HPE_INVALID_HEADER_TOKEN) for
> +any HTTP header value longer than 16 characters on ARM targets with
> +NEON enabled.
> +
> +Fix by explicitly checking for match_mask =3D=3D 0 and setting
> +match_len =3D 16, avoiding the undefined behavior entirely. This bug
> +affects both aarch64 and armv7 NEON targets.
> +
> +The fix has been merged upstream in llparse 7.3.1 [1] and is included
> +in llhttp 9.3.1. This patch can be dropped when nodejs updates its
> +bundled llhttp to >=3D 9.3.1.
> +
> +[1]: https://github.com/nodejs/llparse/pull/83
> +
> +Upstream-Status: Inappropriate
>

If this fix is merged upstream then status should be 'Backport' with
appropriate links to
point to upstream fix.


> +Signed-off-by: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
> +---
> + deps/llhttp/src/llhttp.c | 6 +++++-
> + 1 file changed, 5 insertions(+), 1 deletion(-)
> +
> +diff --git a/deps/llhttp/src/llhttp.c b/deps/llhttp/src/llhttp.c
> +index 14b731e..b0a46c6 100644
> +--- a/deps/llhttp/src/llhttp.c
> ++++ b/deps/llhttp/src/llhttp.c
> +@@ -2651,7 +2651,11 @@ static llparse_state_t llhttp__internal__run(
> +         mask =3D vorrq_u8(mask, single);
> +         narrow =3D vshrn_n_u16(vreinterpretq_u16_u8(mask), 4);
> +         match_mask =3D ~vget_lane_u64(vreinterpret_u64_u8(narrow), 0);
> +-        match_len =3D __builtin_ctzll(match_mask) >> 2;
> ++        if (match_mask =3D=3D 0) {
> ++          match_len =3D 16;
> ++        } else {
> ++          match_len =3D __builtin_ctzll(match_mask) >> 2;
> ++        }
> +         if (match_len !=3D 16) {
> +           p +=3D match_len;
> +           goto s_n_llhttp__internal__n_header_value_otherwise;
> +--
> +2.34.1
> +
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_22.22.0.bb
> b/meta-oe/recipes-devtools/nodejs/nodejs_22.22.0.bb
> index 05fa608047..d08c5d8318 100644
> --- a/meta-oe/recipes-devtools/nodejs/nodejs_22.22.0.bb
> +++ b/meta-oe/recipes-devtools/nodejs/nodejs_22.22.0.bb
> @@ -33,6 +33,7 @@ SRC_URI =3D "
> https://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
>             file://0001-build-remove-redundant-mXX-flags-for-V8.patch \
>             file://0001-fix-arm-Neon-intrinsics-types.patch \
>             file://0001-detect-aarch64-Neon-correctly.patch \
> +
>  file://0001-llhttp-fix-NEON-header-value-__builtin_ctzll-undefin.patch \
>             file://run-ptest \
>             "
>  SRC_URI:append:class-target =3D " \
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#124806):
> https://lists.openembedded.org/g/openembedded-devel/message/124806
> Mute This Topic: https://lists.openembedded.org/mt/118094533/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000081f3e5064c0bcc90
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 2, =
2026 at 6:47=E2=80=AFAM Jeevan via <a href=3D"http://lists.openembedded.org=
">lists.openembedded.org</a> &lt;j-sahu=3D<a href=3D"mailto:ti.com@lists.op=
enembedded.org">ti.com@lists.openembedded.org</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">The NEON SIMD fast path in the=
 bundled llhttp calls<br>
__builtin_ctzll(match_mask) without checking if match_mask is zero.<br>
When all 16 bytes in a NEON register are valid header value characters,<br>
match_mask is 0. Calling __builtin_ctzll(0) is undefined behavior.<br>
<br>
GCC at -O2 exploits this by optimizing &quot;if (match_len !=3D 16)&quot; t=
o<br>
always-true, causing HTTP 400 Bad Request for any header value longer<br>
than 16 characters on ARM targets with NEON enabled.<br>
<br>
Fix by explicitly checking for match_mask =3D=3D 0 and setting<br>
match_len =3D 16. This bug affects both aarch64 and armv7 NEON targets.<br>
<br>
The code this patch modifies is generated, so the patch itself isn&#39;t<br=
>
suitable for upstream submission, as the root cause of the error is<br>
in the generator itself. The fix has been merged upstream[1] in<br>
llparse 7.3.1 and is included in llhttp 9.3.1. This patch can be<br>
dropped when nodejs updates its bundled llhttp to &gt;=3D 9.3.1.<br>
<br>
[1]: <a href=3D"https://github.com/nodejs/llparse/pull/83" rel=3D"noreferre=
r" target=3D"_blank">https://github.com/nodejs/llparse/pull/83</a><br>
<br>
Signed-off-by: Telukula Jeevan Kumar Sahu &lt;<a href=3D"mailto:j-sahu@ti.c=
om" target=3D"_blank">j-sahu@ti.com</a>&gt;<br>
---<br>
=C2=A0...header-value-__builtin_ctzll-undefin.patch | 60 ++++++++++++++++++=
+<br>
=C2=A0.../recipes-devtools/nodejs/<a href=3D"http://nodejs_22.22.0.bb" rel=
=3D"noreferrer" target=3D"_blank">nodejs_22.22.0.bb</a> |=C2=A0 1 +<br>
=C2=A02 files changed, 61 insertions(+)<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0001-llhttp=
-fix-NEON-header-value-__builtin_ctzll-undefin.patch<br>
<br>
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0001-llhttp-fix-NEON-he=
ader-value-__builtin_ctzll-undefin.patch b/meta-oe/recipes-devtools/nodejs/=
nodejs/0001-llhttp-fix-NEON-header-value-__builtin_ctzll-undefin.patch<br>
new file mode 100644<br>
index 0000000000..683dddcf04<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/0001-llhttp-fix-NEON-header-va=
lue-__builtin_ctzll-undefin.patch<br>
@@ -0,0 +1,60 @@<br>
+From a63a5faea54055973bf5f0a514444532563cc20d Mon Sep 17 00:00:00 2001<br>
+From: Telukula Jeevan Kumar Sahu &lt;<a href=3D"mailto:j-sahu@ti.com" targ=
et=3D"_blank">j-sahu@ti.com</a>&gt;<br>
+Date: Fri, 27 Feb 2026 20:58:43 +0530<br>
+Subject: [PATCH] llhttp: fix NEON header value __builtin_ctzll undefined<b=
r>
+ behavior<br>
+<br>
+When all 16 bytes match the allowed range, match_mask becomes 0 after<br>
+the bitwise NOT. Calling __builtin_ctzll(0) is undefined behavior per<br>
+the C standard.<br>
+<br>
+The code expects match_len =3D=3D 16 when all bytes match (so the branch<b=
r>
+is skipped and p +=3D 16 continues the loop), but this relied on<br>
+ctzll(0) returning 64, which is not guaranteed.<br>
+<br>
+GCC at -O2 exploits this UB by deducing that __builtin_ctzll() result<br>
+is always in range [0, 63], and after &gt;&gt; 2 always in [0, 15], which<=
br>
+is never equal to 16. The compiler then optimizes<br>
+&quot;if (match_len !=3D 16)&quot; to always-true, causing every valid 16-=
byte<br>
+chunk to be falsely rejected as containing an invalid character.<br>
+<br>
+This manifests as HTTP 400 Bad Request (HPE_INVALID_HEADER_TOKEN) for<br>
+any HTTP header value longer than 16 characters on ARM targets with<br>
+NEON enabled.<br>
+<br>
+Fix by explicitly checking for match_mask =3D=3D 0 and setting<br>
+match_len =3D 16, avoiding the undefined behavior entirely. This bug<br>
+affects both aarch64 and armv7 NEON targets.<br>
+<br>
+The fix has been merged upstream in llparse 7.3.1 [1] and is included<br>
+in llhttp 9.3.1. This patch can be dropped when nodejs updates its<br>
+bundled llhttp to &gt;=3D 9.3.1.<br>
+<br>
+[1]: <a href=3D"https://github.com/nodejs/llparse/pull/83" rel=3D"noreferr=
er" target=3D"_blank">https://github.com/nodejs/llparse/pull/83</a><br>
+<br>
+Upstream-Status: Inappropriate<br></blockquote><div><br></div><div>If this=
 fix is merged upstream then status should be &#39;Backport&#39; with appro=
priate links to</div><div>point to upstream fix.</div><div>=C2=A0</div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">
+Signed-off-by: Telukula Jeevan Kumar Sahu &lt;<a href=3D"mailto:j-sahu@ti.=
com" target=3D"_blank">j-sahu@ti.com</a>&gt;<br>
+---<br>
+ deps/llhttp/src/llhttp.c | 6 +++++-<br>
+ 1 file changed, 5 insertions(+), 1 deletion(-)<br>
+<br>
+diff --git a/deps/llhttp/src/llhttp.c b/deps/llhttp/src/llhttp.c<br>
+index 14b731e..b0a46c6 100644<br>
+--- a/deps/llhttp/src/llhttp.c<br>
++++ b/deps/llhttp/src/llhttp.c<br>
+@@ -2651,7 +2651,11 @@ static llparse_state_t llhttp__internal__run(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mask =3D vorrq_u8(mask, single);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0narrow =3D vshrn_n_u16(vreinterpretq_u16=
_u8(mask), 4);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0match_mask =3D ~vget_lane_u64(vreinterpr=
et_u64_u8(narrow), 0);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 match_len =3D __builtin_ctzll(match_mask) &gt=
;&gt; 2;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (match_mask =3D=3D 0) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 match_len =3D 16;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 match_len =3D __builtin_ctzll(match_ma=
sk) &gt;&gt; 2;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (match_len !=3D 16) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0p +=3D match_len;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto s_n_llhttp__internal__n_head=
er_value_otherwise;<br>
+-- <br>
+2.34.1<br>
+<br>
diff --git a/meta-oe/recipes-devtools/nodejs/<a href=3D"http://nodejs_22.22=
.0.bb" rel=3D"noreferrer" target=3D"_blank">nodejs_22.22.0.bb</a> b/meta-oe=
/recipes-devtools/nodejs/<a href=3D"http://nodejs_22.22.0.bb" rel=3D"norefe=
rrer" target=3D"_blank">nodejs_22.22.0.bb</a><br>
index 05fa608047..d08c5d8318 100644<br>
--- a/meta-oe/recipes-devtools/nodejs/<a href=3D"http://nodejs_22.22.0.bb" =
rel=3D"noreferrer" target=3D"_blank">nodejs_22.22.0.bb</a><br>
+++ b/meta-oe/recipes-devtools/nodejs/<a href=3D"http://nodejs_22.22.0.bb" =
rel=3D"noreferrer" target=3D"_blank">nodejs_22.22.0.bb</a><br>
@@ -33,6 +33,7 @@ SRC_URI =3D &quot;<a href=3D"https://nodejs.org/dist/v$%7=
BPV%7D/node-v$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank">https:/=
/nodejs.org/dist/v${PV}/node-v${PV}.tar.xz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-build-remove-redundan=
t-mXX-flags-for-V8.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-fix-arm-Neon-intrinsi=
cs-types.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-detect-aarch64-Neon-c=
orrectly.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-llhttp-fix-NEON-heade=
r-value-__builtin_ctzll-undefin.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://run-ptest \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
=C2=A0SRC_URI:append:class-target =3D &quot; \<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#124806): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/124806" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/124806</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/118094533/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/118094533/1997914</a><br>
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

--00000000000081f3e5064c0bcc90--

