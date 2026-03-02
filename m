Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24647EA4E24
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 15:28:26 +0000 (UTC)
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.163226.1772465304859455404
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Mar 2026 07:28:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ddaQCmEh;
 spf=pass (domain: gmail.com, ip: 74.125.224.48, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-64ad79dfb6eso4334173d50.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 02 Mar 2026 07:28:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772465304; cv=none;
        d=google.com; s=arc-20240605;
        b=knVWf4OhINFH6hlX6NUPaUoop1rTejcdWo5ZdOm4gfPflznUgLHKv+27d7eo6K4Tuw
         CbjboqimMhQOlku+iXN1cmqy+Pe+4lIXTI+2qvdnMGCoVOInt0EsHwg1/6k0FCYvHQWG
         98B9T1KbOe5+4INHIoZi5skDNpr8EfVatSwyF2zwGIKTsSmu7KZEQVomFpWWbV9OcxDO
         1tSW3TTClcqbfyFPbyiKceqHwm7Rk4iYKyE8/o3a45g03wDwcJw+n8QCbYPkmOo2qHi5
         zK9P4yTY7FRqRr5uaizeyt355F8b4M3bD7xyUgIIn1tPfZqIqLK5fSEPBlczrJic7jIr
         lt9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4Vz/4Hrb3ZCbzYoqvMvdfsUL68OCfdwixrg7E2saSYE=;
        fh=80LF4KsQEHkVagsUBcOQVqnhtzy2PF8kdITniUGFpQ4=;
        b=YtbvsnbNrMC8aGVM7Z9r3dp9gceumDN1xOFNrgE8yuJh/qCF0lQclBwQJsveYYcv4Q
         G0HbPuggrOsp22vxQGFCbikLfF4e+eycDNWnf+J92+9sMwgQtheCKseF0HelbEqXVERd
         oxAMMY9HUEVqlaRG5iljulph44OGHi1RyPcv9DZu61eDOzP6qdvHNW632LY/CFK5Rz3b
         TSJK5sAoC7RZVYdQBNILd+7usnSYlWKrbJCJ7/h/V4ejdJV5YdHDRUpY06mh6Ee6MsKt
         Hhlls8pQTYA8N5pYX9LyKo4Afn1MELDY3Bc1NtRQFRe/1oeHSB71yvWbgPK3Lp1b7syb
         +KAw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772465304; x=1773070104; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4Vz/4Hrb3ZCbzYoqvMvdfsUL68OCfdwixrg7E2saSYE=;
        b=ddaQCmEh16mQcz8giQjKHtR+RjeknCtdFjRwOgRJznZ+pJQt283hSkJIv4z174nVzV
         TK9aSw9pR/6c2CZZy0XjlpA///k0kZS21px9pODv6/kEDk+B0IPKiVgdRZq6NHt1lOZa
         Mx9zLoX07EnwthWR/0zHuSmPbr17A2/sjk58e8PywQTmROpt7VKZmP6+YBuWsE9mOKcy
         wzTrUuq41XLGwPsNhMrTDUirH8DyYqkAmUHOgZ0PxA5Pp8soNf6yqiNQ/FbNoYdqAmjR
         S6nlRjGbvXScfMjAru7yxLpo+i44FAXu/n+ehP7KCmlbm6lMSmDny+BnR32qpGxLLGBO
         XA/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772465304; x=1773070104;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Vz/4Hrb3ZCbzYoqvMvdfsUL68OCfdwixrg7E2saSYE=;
        b=Mr7DCxONKvUIjfXyOGVCi3LmYxEwskbDZ1kSTr1Uj8MdrtU/RAMSSqywgAv9iljV+M
         kZFZKRT74o1I1SEGuJ7tIrnRYaxlRAHZjREgSJMsj0PtfM+HLWxqHhnZ5cm1Cl+3+GPh
         B+KFAlZHjGTGIWuRawu9/fXRUAW01+9ZpI7gvSP6J3hRdE3LfNCo40IZOgYaM70BdEGr
         g4ZYPkiJkeRUxkkAByUiC0lVyfRWtbEUBmO5dF/3sOnPln4riyJGHRTWsROcN8HC/LhT
         UpB3q3nWDOuWhVJVLjjQXPpinI/0qgKEBDNclDUZo2NUC4v2mYCWCBWB6Pvnnij/F0iz
         Gjiw==
X-Gm-Message-State: AOJu0YyPxFtz3leWyF+NHD5GR/9SySgwhYy6r5hS8/Z1El1WR/KjjBrh
	FnrQgx2rx5FOnyeJZ5rflsWOcFYPQ3vilf2ZnZfgLHM4MmgeE8S5t2+oSdipqCDrIiKSfw1NgJi
	0u2rOSXG67JinF94lUW80gIrqLLOY9Mc=
X-Gm-Gg: ATEYQzy3pArjf3fNyQP36LE3e4U0V3QgoW7vt8ZHKtDzf4hOWmQdd6W5ytbnR8loOoz
	Boccdx6mKwyrmbnLjzuJOM/BFJWAFhWPQHiynyC4tP+Z74mEw96Tj1UG+eRkKX4CAOL6OygmH/F
	7rp+2AB2PJZ6dmjJTtdJ8R1COEJ0YLTdb0m+Nm2mf0Jkb09u6nFMLIbWqWvHtZnA3CCLBYzJ5D5
	n98JBUMhgdLvtpidQvyCNl0Ryop5CNG8HChJbwgOWg4lUMJ9aNMOgbW9BM7kkqH2dgOEqyF4AFQ
	NE6O8TULxi+odQtty9hygZZQ3UnJV0pQ1ucHQmH/v0CyI5b2vS78yHTLkmE34TbOCeo3Za8QUlG
	VKiXCrDcFS3RfNzR1zy9+4aqJ
X-Received: by 2002:a05:690e:448f:b0:64a:f187:c984 with SMTP id
 956f58d0204a3-64cc2143819mr8188926d50.38.1772465303862; Mon, 02 Mar 2026
 07:28:23 -0800 (PST)
MIME-Version: 1.0
References: <20260302144634.835048-1-j-sahu@ti.com> <CAMKF1sqmBQjDuKWwhQ1gfkz8iqT=7ZDR3JWTXvjQ0e+mPiPQ7Q@mail.gmail.com>
 <1127752.1772464501134749224@lists.openembedded.org>
In-Reply-To: <1127752.1772464501134749224@lists.openembedded.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 2 Mar 2026 07:27:57 -0800
X-Gm-Features: AaiRm533GsXVUAs7ITmja5y1bFzG3jDJnNN_JDjL3Vx2egcWLOft8Cegj2Zu8Oo
Message-ID: <CAMKF1srYooP7OZa5TmNjt7RHG6c8iBmMg_UfF0vo2jz3_=giTg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] nodejs: fix NEON llhttp ctzll undefined behavior
To: j-sahu@ti.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000d044a0064c0c3c50"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Mar 2026 15:28:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124815

--000000000000d044a0064c0c3c50
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 2, 2026 at 7:15=E2=80=AFAM Jeevan via lists.openembedded.org <j=
-sahu=3D
ti.com@lists.openembedded.org> wrote:

> On Mon, Mar 2, 2026 at 08:27 PM, Khem Raj wrote:
>
>
>
> On Mon, Mar 2, 2026 at 6:47=E2=80=AFAM Jeevan via lists.openembedded.org =
<j-sahu=3D
> ti.com@lists.openembedded.org> wrote:
>
>> The NEON SIMD fast path in the bundled llhttp calls
>> __builtin_ctzll(match_mask) without checking if match_mask is zero.
>> When all 16 bytes in a NEON register are valid header value characters,
>> match_mask is 0. Calling __builtin_ctzll(0) is undefined behavior.
>>
>> GCC at -O2 exploits this by optimizing "if (match_len !=3D 16)" to
>> always-true, causing HTTP 400 Bad Request for any header value longer
>> than 16 characters on ARM targets with NEON enabled.
>>
>> Fix by explicitly checking for match_mask =3D=3D 0 and setting
>> match_len =3D 16. This bug affects both aarch64 and armv7 NEON targets.
>>
>> The code this patch modifies is generated, so the patch itself isn't
>> suitable for upstream submission, as the root cause of the error is
>> in the generator itself. The fix has been merged upstream[1] in
>> llparse 7.3.1 and is included in llhttp 9.3.1. This patch can be
>> dropped when nodejs updates its bundled llhttp to >=3D 9.3.1.
>>
>> [1]: https://github.com/nodejs/llparse/pull/83
>>
>> Signed-off-by: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
>> ---
>>  ...header-value-__builtin_ctzll-undefin.patch | 60 +++++++++++++++++++
>>  .../recipes-devtools/nodejs/nodejs_22.22.0.bb |  1 +
>>  2 files changed, 61 insertions(+)
>>  create mode 100644
>> meta-oe/recipes-devtools/nodejs/nodejs/0001-llhttp-fix-NEON-header-value=
-__builtin_ctzll-undefin.patch
>>
>> diff --git
>> a/meta-oe/recipes-devtools/nodejs/nodejs/0001-llhttp-fix-NEON-header-val=
ue-__builtin_ctzll-undefin.patch
>> b/meta-oe/recipes-devtools/nodejs/nodejs/0001-llhttp-fix-NEON-header-val=
ue-__builtin_ctzll-undefin.patch
>> new file mode 100644
>> index 0000000000..683dddcf04
>> --- /dev/null
>> +++
>> b/meta-oe/recipes-devtools/nodejs/nodejs/0001-llhttp-fix-NEON-header-val=
ue-__builtin_ctzll-undefin.patch
>> @@ -0,0 +1,60 @@
>> +From a63a5faea54055973bf5f0a514444532563cc20d Mon Sep 17 00:00:00 2001
>> +From: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
>> +Date: Fri, 27 Feb 2026 20:58:43 +0530
>> +Subject: [PATCH] llhttp: fix NEON header value __builtin_ctzll undefine=
d
>> + behavior
>> +
>> +When all 16 bytes match the allowed range, match_mask becomes 0 after
>> +the bitwise NOT. Calling __builtin_ctzll(0) is undefined behavior per
>> +the C standard.
>> +
>> +The code expects match_len =3D=3D 16 when all bytes match (so the branc=
h
>> +is skipped and p +=3D 16 continues the loop), but this relied on
>> +ctzll(0) returning 64, which is not guaranteed.
>> +
>> +GCC at -O2 exploits this UB by deducing that __builtin_ctzll() result
>> +is always in range [0, 63], and after >> 2 always in [0, 15], which
>> +is never equal to 16. The compiler then optimizes
>> +"if (match_len !=3D 16)" to always-true, causing every valid 16-byte
>> +chunk to be falsely rejected as containing an invalid character.
>> +
>> +This manifests as HTTP 400 Bad Request (HPE_INVALID_HEADER_TOKEN) for
>> +any HTTP header value longer than 16 characters on ARM targets with
>> +NEON enabled.
>> +
>> +Fix by explicitly checking for match_mask =3D=3D 0 and setting
>> +match_len =3D 16, avoiding the undefined behavior entirely. This bug
>> +affects both aarch64 and armv7 NEON targets.
>> +
>> +The fix has been merged upstream in llparse 7.3.1 [1] and is included
>> +in llhttp 9.3.1. This patch can be dropped when nodejs updates its
>> +bundled llhttp to >=3D 9.3.1.
>> +
>> +[1]: https://github.com/nodejs/llparse/pull/83
>> +
>> +Upstream-Status: Inappropriate
>
>
> If this fix is merged upstream then status should be 'Backport' with
> appropriate links to
> point to upstream fix.
>
>
>
>   This patch manually applies the logic to the generated C code. Upstream
> (llparse/llhttp/nodejs)
>   would never accept patches to generated files - they'd regenerate or
> update the bundled version.
>   That's why I used "Inappropriate" per Yocto guidelines.
>

I see, we do not regenerate the file ? if that something lacking in the
build process in OE for this package then

>
>
>
>> +Signed-off-by: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
>> +---
>> + deps/llhttp/src/llhttp.c | 6 +++++-
>> + 1 file changed, 5 insertions(+), 1 deletion(-)
>> +
>> +diff --git a/deps/llhttp/src/llhttp.c b/deps/llhttp/src/llhttp.c
>> +index 14b731e..b0a46c6 100644
>> +--- a/deps/llhttp/src/llhttp.c
>> ++++ b/deps/llhttp/src/llhttp.c
>> +@@ -2651,7 +2651,11 @@ static llparse_state_t llhttp__internal__run(
>> +         mask =3D vorrq_u8(mask, single);
>> +         narrow =3D vshrn_n_u16(vreinterpretq_u16_u8(mask), 4);
>> +         match_mask =3D ~vget_lane_u64(vreinterpret_u64_u8(narrow), 0);
>> +-        match_len =3D __builtin_ctzll(match_mask) >> 2;
>> ++        if (match_mask =3D=3D 0) {
>> ++          match_len =3D 16;
>> ++        } else {
>> ++          match_len =3D __builtin_ctzll(match_mask) >> 2;
>> ++        }
>> +         if (match_len !=3D 16) {
>> +           p +=3D match_len;
>> +           goto s_n_llhttp__internal__n_header_value_otherwise;
>> +--
>> +2.34.1
>> +
>> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_22.22.0.bb
>> b/meta-oe/recipes-devtools/nodejs/nodejs_22.22.0.bb
>> index 05fa608047..d08c5d8318 100644
>> --- a/meta-oe/recipes-devtools/nodejs/nodejs_22.22.0.bb
>> +++ b/meta-oe/recipes-devtools/nodejs/nodejs_22.22.0.bb
>> @@ -33,6 +33,7 @@ SRC_URI =3D "
>> https://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
>>             file://0001-build-remove-redundant-mXX-flags-for-V8.patch \
>>             file://0001-fix-arm-Neon-intrinsics-types.patch \
>>             file://0001-detect-aarch64-Neon-correctly.patch \
>> +
>>  file://0001-llhttp-fix-NEON-header-value-__builtin_ctzll-undefin.patch =
\
>>             file://run-ptest \
>>             "
>>  SRC_URI:append:class-target =3D " \
>> --
>> 2.34.1
>>
>>
>>
>>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#124813):
> https://lists.openembedded.org/g/openembedded-devel/message/124813
> Mute This Topic: https://lists.openembedded.org/mt/118094533/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000d044a0064c0c3c50
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 2, =
2026 at 7:15=E2=80=AFAM Jeevan via <a href=3D"http://lists.openembedded.org=
">lists.openembedded.org</a> &lt;j-sahu=3D<a href=3D"mailto:ti.com@lists.op=
enembedded.org">ti.com@lists.openembedded.org</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex"><div>On Mon, Mar 2, 2026 at 08=
:27 PM, Khem Raj wrote:</div>
<div>
<blockquote>
<div dir=3D"ltr">
<div dir=3D"ltr">=C2=A0</div>
<br>
<div class=3D"gmail_quote">
<div class=3D"gmail_attr" dir=3D"ltr">On Mon, Mar 2, 2026 at 6:47=E2=80=AFA=
M Jeevan via <a href=3D"http://lists.openembedded.org" target=3D"_blank">li=
sts.openembedded.org</a> &lt;j-sahu=3D<a href=3D"mailto:ti.com@lists.openem=
bedded.org" target=3D"_blank">ti.com@lists.openembedded.org</a>&gt; wrote:<=
/div>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">The NEON SIMD fast path i=
n the bundled llhttp calls<br>__builtin_ctzll(match_mask) without checking =
if match_mask is zero.<br>When all 16 bytes in a NEON register are valid he=
ader value characters,<br>match_mask is 0. Calling __builtin_ctzll(0) is un=
defined behavior.<br><br>GCC at -O2 exploits this by optimizing &quot;if (m=
atch_len !=3D 16)&quot; to<br>always-true, causing HTTP 400 Bad Request for=
 any header value longer<br>than 16 characters on ARM targets with NEON ena=
bled.<br><br>Fix by explicitly checking for match_mask =3D=3D 0 and setting=
<br>match_len =3D 16. This bug affects both aarch64 and armv7 NEON targets.=
<br><br>The code this patch modifies is generated, so the patch itself isn&=
#39;t<br>suitable for upstream submission, as the root cause of the error i=
s<br>in the generator itself. The fix has been merged upstream[1] in<br>llp=
arse 7.3.1 and is included in llhttp 9.3.1. This patch can be<br>dropped wh=
en nodejs updates its bundled llhttp to &gt;=3D 9.3.1.<br><br>[1]: <a href=
=3D"https://github.com/nodejs/llparse/pull/83" rel=3D"noopener noreferrer" =
target=3D"_blank">https://github.com/nodejs/llparse/pull/83</a><br><br>Sign=
ed-off-by: Telukula Jeevan Kumar Sahu &lt;<a href=3D"mailto:j-sahu@ti.com" =
rel=3D"noopener" target=3D"_blank">j-sahu@ti.com</a>&gt;<br>---<br>=C2=A0..=
.header-value-__builtin_ctzll-undefin.patch | 60 +++++++++++++++++++<br>=C2=
=A0.../recipes-devtools/nodejs/<a href=3D"http://nodejs_22.22.0.bb" rel=3D"=
noopener noreferrer" target=3D"_blank">nodejs_22.22.0.bb</a> |=C2=A0 1 +<br=
>=C2=A02 files changed, 61 insertions(+)<br>=C2=A0create mode 100644 meta-o=
e/recipes-devtools/nodejs/nodejs/0001-llhttp-fix-NEON-header-value-__builti=
n_ctzll-undefin.patch<br><br>diff --git a/meta-oe/recipes-devtools/nodejs/n=
odejs/0001-llhttp-fix-NEON-header-value-__builtin_ctzll-undefin.patch b/met=
a-oe/recipes-devtools/nodejs/nodejs/0001-llhttp-fix-NEON-header-value-__bui=
ltin_ctzll-undefin.patch<br>new file mode 100644<br>index 0000000000..683dd=
dcf04<br>--- /dev/null<br>+++ b/meta-oe/recipes-devtools/nodejs/nodejs/0001=
-llhttp-fix-NEON-header-value-__builtin_ctzll-undefin.patch<br>@@ -0,0 +1,6=
0 @@<br>+From a63a5faea54055973bf5f0a514444532563cc20d Mon Sep 17 00:00:00 =
2001<br>+From: Telukula Jeevan Kumar Sahu &lt;<a href=3D"mailto:j-sahu@ti.c=
om" rel=3D"noopener" target=3D"_blank">j-sahu@ti.com</a>&gt;<br>+Date: Fri,=
 27 Feb 2026 20:58:43 +0530<br>+Subject: [PATCH] llhttp: fix NEON header va=
lue __builtin_ctzll undefined<br>+ behavior<br>+<br>+When all 16 bytes matc=
h the allowed range, match_mask becomes 0 after<br>+the bitwise NOT. Callin=
g __builtin_ctzll(0) is undefined behavior per<br>+the C standard.<br>+<br>=
+The code expects match_len =3D=3D 16 when all bytes match (so the branch<b=
r>+is skipped and p +=3D 16 continues the loop), but this relied on<br>+ctz=
ll(0) returning 64, which is not guaranteed.<br>+<br>+GCC at -O2 exploits t=
his UB by deducing that __builtin_ctzll() result<br>+is always in range [0,=
 63], and after &gt;&gt; 2 always in [0, 15], which<br>+is never equal to 1=
6. The compiler then optimizes<br>+&quot;if (match_len !=3D 16)&quot; to al=
ways-true, causing every valid 16-byte<br>+chunk to be falsely rejected as =
containing an invalid character.<br>+<br>+This manifests as HTTP 400 Bad Re=
quest (HPE_INVALID_HEADER_TOKEN) for<br>+any HTTP header value longer than =
16 characters on ARM targets with<br>+NEON enabled.<br>+<br>+Fix by explici=
tly checking for match_mask =3D=3D 0 and setting<br>+match_len =3D 16, avoi=
ding the undefined behavior entirely. This bug<br>+affects both aarch64 and=
 armv7 NEON targets.<br>+<br>+The fix has been merged upstream in llparse 7=
.3.1 [1] and is included<br>+in llhttp 9.3.1. This patch can be dropped whe=
n nodejs updates its<br>+bundled llhttp to &gt;=3D 9.3.1.<br>+<br>+[1]: <a =
href=3D"https://github.com/nodejs/llparse/pull/83" rel=3D"noopener noreferr=
er" target=3D"_blank">https://github.com/nodejs/llparse/pull/83</a><br>+<br=
>+Upstream-Status: Inappropriate</blockquote>
<div>=C2=A0</div>
<div>If this fix is merged upstream then status should be &#39;Backport&#39=
; with appropriate links to</div>
<div>point to upstream fix.</div>
<div>=C2=A0</div>
<div>=C2=A0</div>
</div>
</div>
</blockquote>
=C2=A0 This patch manually applies the logic to the generated C code. Upstr=
eam (llparse/llhttp/nodejs)</div>
<div>=C2=A0 would never accept patches to generated files - they&#39;d rege=
nerate or update the bundled version.</div>
<div>=C2=A0 That&#39;s why I used &quot;Inappropriate&quot; per Yocto guide=
lines.<br></div></blockquote><div><br></div><div>I see, we do not regenerat=
e the file ? if that something lacking in the build process in OE for this =
package then=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><=
div><br>
<blockquote>
<div dir=3D"ltr">
<div class=3D"gmail_quote">
<div>=C2=A0</div>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">+Signed-off-by: Telukula =
Jeevan Kumar Sahu &lt;<a href=3D"mailto:j-sahu@ti.com" rel=3D"noopener" tar=
get=3D"_blank">j-sahu@ti.com</a>&gt;<br>+---<br>+ deps/llhttp/src/llhttp.c =
| 6 +++++-<br>+ 1 file changed, 5 insertions(+), 1 deletion(-)<br>+<br>+dif=
f --git a/deps/llhttp/src/llhttp.c b/deps/llhttp/src/llhttp.c<br>+index 14b=
731e..b0a46c6 100644<br>+--- a/deps/llhttp/src/llhttp.c<br>++++ b/deps/llht=
tp/src/llhttp.c<br>+@@ -2651,7 +2651,11 @@ static llparse_state_t llhttp__i=
nternal__run(<br>+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mask =3D vorrq_u8(mask,=
 single);<br>+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0narrow =3D vshrn_n_u16(vrei=
nterpretq_u16_u8(mask), 4);<br>+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0match_mas=
k =3D ~vget_lane_u64(vreinterpret_u64_u8(narrow), 0);<br>+-=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 match_len =3D __builtin_ctzll(match_mask) &gt;&gt; 2;<br>++=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (match_mask =3D=3D 0) {<br>++=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 match_len =3D 16;<br>++=C2=A0 =C2=A0 =C2=A0 =C2=A0 } e=
lse {<br>++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 match_len =3D __builtin_ctzll=
(match_mask) &gt;&gt; 2;<br>++=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>+=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0if (match_len !=3D 16) {<br>+=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0p +=3D match_len;<br>+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0goto s_n_llhttp__internal__n_header_value_otherwise;<br>+-- <br>+=
2.34.1<br>+<br>diff --git a/meta-oe/recipes-devtools/nodejs/<a href=3D"http=
://nodejs_22.22.0.bb" rel=3D"noopener noreferrer" target=3D"_blank">nodejs_=
22.22.0.bb</a> b/meta-oe/recipes-devtools/nodejs/<a href=3D"http://nodejs_2=
2.22.0.bb" rel=3D"noopener noreferrer" target=3D"_blank">nodejs_22.22.0.bb<=
/a><br>index 05fa608047..d08c5d8318 100644<br>--- a/meta-oe/recipes-devtool=
s/nodejs/<a href=3D"http://nodejs_22.22.0.bb" rel=3D"noopener noreferrer" t=
arget=3D"_blank">nodejs_22.22.0.bb</a><br>+++ b/meta-oe/recipes-devtools/no=
dejs/<a href=3D"http://nodejs_22.22.0.bb" rel=3D"noopener noreferrer" targe=
t=3D"_blank">nodejs_22.22.0.bb</a><br>@@ -33,6 +33,7 @@ SRC_URI =3D &quot;<=
a href=3D"https://nodejs.org/dist/v$%7BPV%7D/node-v$%7BPV%7D.tar.xz" rel=3D=
"noopener noreferrer" target=3D"_blank">https://nodejs.org/dist/v${PV}/node=
-v${PV}.tar.xz</a> \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://00=
01-build-remove-redundant-mXX-flags-for-V8.patch \<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 file://0001-fix-arm-Neon-intrinsics-types.patch \<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-detect-aarch64-Neon-c=
orrectly.patch \<br>+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-l=
lhttp-fix-NEON-header-value-__builtin_ctzll-undefin.patch \<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://run-ptest \<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 &quot;<br>=C2=A0SRC_URI:append:class-target =3D &quot;=
 \<br>-- <br>2.34.1<br><br><br><br></blockquote>
</div>
</div>
</blockquote>
</div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#124813): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/124813" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/124813</a><br>
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

--000000000000d044a0064c0c3c50--

