Return-Path: <j-sahu@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1928EA4E20
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 15:15:05 +0000 (UTC)
Subject: Re: [meta-oe][PATCH] nodejs: fix NEON llhttp ctzll undefined behavior
To: openembedded-devel@lists.openembedded.org
From: "Jeevan" <j-sahu@ti.com>
X-Originating-Location: IN (103.146.116.9)
X-Originating-Platform: Linux Firefox 147
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 02 Mar 2026 07:15:01 -0800
References: <20260302144634.835048-1-j-sahu@ti.com> <CAMKF1sqmBQjDuKWwhQ1gfkz8iqT=7ZDR3JWTXvjQ0e+mPiPQ7Q@mail.gmail.com>
In-Reply-To: <CAMKF1sqmBQjDuKWwhQ1gfkz8iqT=7ZDR3JWTXvjQ0e+mPiPQ7Q@mail.gmail.com>
Message-ID: <1127752.1772464501134749224@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="nSAY8ZsRAILd7cgUhf0a"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Mar 2026 15:15:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124813

--nSAY8ZsRAILd7cgUhf0a
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 2, 2026 at 08:27 PM, Khem Raj wrote:

>=20
>=20
>=20
> On Mon, Mar 2, 2026 at 6:47=E2=80=AFAM Jeevan via lists.openembedded.org =
(
> http://lists.openembedded.org ) <j-sahu=3D ti.com@lists.openembedded.org =
>
> wrote:
>=20
>> The NEON SIMD fast path in the bundled llhttp calls
>> __builtin_ctzll(match_mask) without checking if match_mask is zero.
>> When all 16 bytes in a NEON register are valid header value characters,
>> match_mask is 0. Calling __builtin_ctzll(0) is undefined behavior.
>>=20
>> GCC at -O2 exploits this by optimizing "if (match_len !=3D 16)" to
>> always-true, causing HTTP 400 Bad Request for any header value longer
>> than 16 characters on ARM targets with NEON enabled.
>>=20
>> Fix by explicitly checking for match_mask =3D=3D 0 and setting
>> match_len =3D 16. This bug affects both aarch64 and armv7 NEON targets.
>>=20
>> The code this patch modifies is generated, so the patch itself isn't
>> suitable for upstream submission, as the root cause of the error is
>> in the generator itself. The fix has been merged upstream[1] in
>> llparse 7.3.1 and is included in llhttp 9.3.1. This patch can be
>> dropped when nodejs updates its bundled llhttp to >=3D 9.3.1.
>>=20
>> [1]: https://github.com/nodejs/llparse/pull/83
>>=20
>> Signed-off-by: Telukula Jeevan Kumar Sahu < j-sahu@ti.com >
>> ---
>> ...header-value-__builtin_ctzll-undefin.patch | 60 +++++++++++++++++++
>> .../recipes-devtools/nodejs/ nodejs_22.22.0.bb ( http://nodejs_22.22.0.b=
b )
>> |=C2=A0 1 +
>> 2 files changed, 61 insertions(+)
>> create mode 100644
>> meta-oe/recipes-devtools/nodejs/nodejs/0001-llhttp-fix-NEON-header-value=
-__builtin_ctzll-undefin.patch
>>=20
>>=20
>> diff --git
>> a/meta-oe/recipes-devtools/nodejs/nodejs/0001-llhttp-fix-NEON-header-val=
ue-__builtin_ctzll-undefin.patch
>> b/meta-oe/recipes-devtools/nodejs/nodejs/0001-llhttp-fix-NEON-header-val=
ue-__builtin_ctzll-undefin.patch
>>=20
>> new file mode 100644
>> index 0000000000..683dddcf04
>> --- /dev/null
>> +++
>> b/meta-oe/recipes-devtools/nodejs/nodejs/0001-llhttp-fix-NEON-header-val=
ue-__builtin_ctzll-undefin.patch
>>=20
>> @@ -0,0 +1,60 @@
>> +From a63a5faea54055973bf5f0a514444532563cc20d Mon Sep 17 00:00:00 2001
>> +From: Telukula Jeevan Kumar Sahu < j-sahu@ti.com >
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
>=20
>=20
> If this fix is merged upstream then status should be 'Backport' with
> appropriate links to
> point to upstream fix.
>=20
>=20
>=20

This patch manually applies the logic to the generated C code. Upstream (ll=
parse/llhttp/nodejs)
would never accept patches to generated files - they'd regenerate or update=
 the bundled version.
That's why I used "Inappropriate" per Yocto guidelines.

>=20
>=20
>=20
>> +Signed-off-by: Telukula Jeevan Kumar Sahu < j-sahu@ti.com >
>> +---
>> + deps/llhttp/src/llhttp.c | 6 +++++-
>> + 1 file changed, 5 insertions(+), 1 deletion(-)
>> +
>> +diff --git a/deps/llhttp/src/llhttp.c b/deps/llhttp/src/llhttp.c
>> +index 14b731e..b0a46c6 100644
>> +--- a/deps/llhttp/src/llhttp.c
>> ++++ b/deps/llhttp/src/llhttp.c
>> +@@ -2651,7 +2651,11 @@ static llparse_state_t llhttp__internal__run(
>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mask =3D vorrq_u8(mask, single);
>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0narrow =3D vshrn_n_u16(vreinterpretq_=
u16_u8(mask), 4);
>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0match_mask =3D ~vget_lane_u64(vreinte=
rpret_u64_u8(narrow), 0);
>> +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 match_len =3D __builtin_ctzll(match_mask) =
>> 2;
>> ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (match_mask =3D=3D 0) {
>> ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 match_len =3D 16;
>> ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {
>> ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 match_len =3D __builtin_ctzll(match=
_mask) >> 2;
>> ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 }
>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (match_len !=3D 16) {
>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0p +=3D match_len;
>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto s_n_llhttp__internal__n_h=
eader_value_otherwise;
>> +--
>> +2.34.1
>> +
>> diff --git a/meta-oe/recipes-devtools/nodejs/ nodejs_22.22.0.bb (
>> http://nodejs_22.22.0.bb ) b/meta-oe/recipes-devtools/nodejs/ nodejs_22.=
22.0.bb
>> ( http://nodejs_22.22.0.bb )
>> index 05fa608047..d08c5d8318 100644
>> --- a/meta-oe/recipes-devtools/nodejs/ nodejs_22.22.0.bb (
>> http://nodejs_22.22.0.bb )
>> +++ b/meta-oe/recipes-devtools/nodejs/ nodejs_22.22.0.bb (
>> http://nodejs_22.22.0.bb )
>> @@ -33,6 +33,7 @@ SRC_URI =3D " https://nodejs.org/dist/v${PV}/node-v${P=
V}.tar.xz
>> ( https://nodejs.org/dist/v$%7BPV%7D/node-v$%7BPV%7D.tar.xz ) \
>> file://0001-build-remove-redundant-mXX-flags-for-V8.patch \
>> file://0001-fix-arm-Neon-intrinsics-types.patch \
>> file://0001-detect-aarch64-Neon-correctly.patch \
>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=20
>> file://0001-llhttp-fix-NEON-header-value-__builtin_ctzll-undefin.patch \
>> file://run-ptest \
>> "
>> SRC_URI:append:class-target =3D " \
>> --
>> 2.34.1
>>=20
>>=20
>>=20
>>=20
>=20
>=20
>

--nSAY8ZsRAILd7cgUhf0a
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>On Mon, Mar 2, 2026 at 08:27 PM, Khem Raj wrote:</div>
<div>
<blockquote>
<div dir=3D"ltr">
<div dir=3D"ltr">&nbsp;</div>
<br />
<div class=3D"gmail_quote gmail_quote_container">
<div class=3D"gmail_attr" dir=3D"ltr">On Mon, Mar 2, 2026 at 6:47=E2=80=AFA=
M Jeevan via <a href=3D"http://lists.openembedded.org">lists.openembedded.o=
rg</a> &lt;j-sahu=3D<a href=3D"mailto:ti.com@lists.openembedded.org">ti.com=
@lists.openembedded.org</a>&gt; wrote:</div>
<blockquote class=3D"gmail_quote" style=3D"margin: 0px 0px 0px 0.8ex; borde=
r-left: 1px solid #cccccc; padding-left: 1ex;">The NEON SIMD fast path in t=
he bundled llhttp calls<br />__builtin_ctzll(match_mask) without checking i=
f match_mask is zero.<br />When all 16 bytes in a NEON register are valid h=
eader value characters,<br />match_mask is 0. Calling __builtin_ctzll(0) is=
 undefined behavior.<br /><br />GCC at -O2 exploits this by optimizing "if =
(match_len !=3D 16)" to<br />always-true, causing HTTP 400 Bad Request for =
any header value longer<br />than 16 characters on ARM targets with NEON en=
abled.<br /><br />Fix by explicitly checking for match_mask =3D=3D 0 and se=
tting<br />match_len =3D 16. This bug affects both aarch64 and armv7 NEON t=
argets.<br /><br />The code this patch modifies is generated, so the patch =
itself isn't<br />suitable for upstream submission, as the root cause of th=
e error is<br />in the generator itself. The fix has been merged upstream[1=
] in<br />llparse 7.3.1 and is included in llhttp 9.3.1. This patch can be<=
br />dropped when nodejs updates its bundled llhttp to &gt;=3D 9.3.1.<br />=
<br />[1]: <a href=3D"https://github.com/nodejs/llparse/pull/83" target=3D"=
_blank" rel=3D"noopener noreferrer">https://github.com/nodejs/llparse/pull/=
83</a><br /><br />Signed-off-by: Telukula Jeevan Kumar Sahu &lt;<a href=3D"=
mailto:j-sahu@ti.com" target=3D"_blank" rel=3D"noopener">j-sahu@ti.com</a>&=
gt;<br />---<br />&nbsp;...header-value-__builtin_ctzll-undefin.patch | 60 =
+++++++++++++++++++<br />&nbsp;.../recipes-devtools/nodejs/<a href=3D"http:=
//nodejs_22.22.0.bb" target=3D"_blank" rel=3D"noopener noreferrer">nodejs_2=
2.22.0.bb</a> |&nbsp; 1 +<br />&nbsp;2 files changed, 61 insertions(+)<br /=
>&nbsp;create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0001-llhtt=
p-fix-NEON-header-value-__builtin_ctzll-undefin.patch<br /><br />diff --git=
 a/meta-oe/recipes-devtools/nodejs/nodejs/0001-llhttp-fix-NEON-header-value=
-__builtin_ctzll-undefin.patch b/meta-oe/recipes-devtools/nodejs/nodejs/000=
1-llhttp-fix-NEON-header-value-__builtin_ctzll-undefin.patch<br />new file =
mode 100644<br />index 0000000000..683dddcf04<br />--- /dev/null<br />+++ b=
/meta-oe/recipes-devtools/nodejs/nodejs/0001-llhttp-fix-NEON-header-value-_=
_builtin_ctzll-undefin.patch<br />@@ -0,0 +1,60 @@<br />+From a63a5faea5405=
5973bf5f0a514444532563cc20d Mon Sep 17 00:00:00 2001<br />+From: Telukula J=
eevan Kumar Sahu &lt;<a href=3D"mailto:j-sahu@ti.com" target=3D"_blank" rel=
=3D"noopener">j-sahu@ti.com</a>&gt;<br />+Date: Fri, 27 Feb 2026 20:58:43 +=
0530<br />+Subject: [PATCH] llhttp: fix NEON header value __builtin_ctzll u=
ndefined<br />+ behavior<br />+<br />+When all 16 bytes match the allowed r=
ange, match_mask becomes 0 after<br />+the bitwise NOT. Calling __builtin_c=
tzll(0) is undefined behavior per<br />+the C standard.<br />+<br />+The co=
de expects match_len =3D=3D 16 when all bytes match (so the branch<br />+is=
 skipped and p +=3D 16 continues the loop), but this relied on<br />+ctzll(=
0) returning 64, which is not guaranteed.<br />+<br />+GCC at -O2 exploits =
this UB by deducing that __builtin_ctzll() result<br />+is always in range =
[0, 63], and after &gt;&gt; 2 always in [0, 15], which<br />+is never equal=
 to 16. The compiler then optimizes<br />+"if (match_len !=3D 16)" to alway=
s-true, causing every valid 16-byte<br />+chunk to be falsely rejected as c=
ontaining an invalid character.<br />+<br />+This manifests as HTTP 400 Bad=
 Request (HPE_INVALID_HEADER_TOKEN) for<br />+any HTTP header value longer =
than 16 characters on ARM targets with<br />+NEON enabled.<br />+<br />+Fix=
 by explicitly checking for match_mask =3D=3D 0 and setting<br />+match_len=
 =3D 16, avoiding the undefined behavior entirely. This bug<br />+affects b=
oth aarch64 and armv7 NEON targets.<br />+<br />+The fix has been merged up=
stream in llparse 7.3.1 [1] and is included<br />+in llhttp 9.3.1. This pat=
ch can be dropped when nodejs updates its<br />+bundled llhttp to &gt;=3D 9=
.3.1.<br />+<br />+[1]: <a href=3D"https://github.com/nodejs/llparse/pull/8=
3" target=3D"_blank" rel=3D"noopener noreferrer">https://github.com/nodejs/=
llparse/pull/83</a><br />+<br />+Upstream-Status: Inappropriate</blockquote=
>
<div>&nbsp;</div>
<div>If this fix is merged upstream then status should be 'Backport' with a=
ppropriate links to</div>
<div>point to upstream fix.</div>
<div>&nbsp;</div>
<div>&nbsp;</div>
</div>
</div>
</blockquote>
&nbsp; This patch manually applies the logic to the generated C code. Upstr=
eam (llparse/llhttp/nodejs)</div>
<div>&nbsp; would never accept patches to generated files - they'd regenera=
te or update the bundled version.</div>
<div>&nbsp; That's why I used "Inappropriate" per Yocto guidelines.<br /><b=
r />
<blockquote>
<div dir=3D"ltr">
<div class=3D"gmail_quote gmail_quote_container">
<div>&nbsp;</div>
<blockquote class=3D"gmail_quote" style=3D"margin: 0px 0px 0px 0.8ex; borde=
r-left: 1px solid #cccccc; padding-left: 1ex;">+Signed-off-by: Telukula Jee=
van Kumar Sahu &lt;<a href=3D"mailto:j-sahu@ti.com" target=3D"_blank" rel=
=3D"noopener">j-sahu@ti.com</a>&gt;<br />+---<br />+ deps/llhttp/src/llhttp=
.c | 6 +++++-<br />+ 1 file changed, 5 insertions(+), 1 deletion(-)<br />+<=
br />+diff --git a/deps/llhttp/src/llhttp.c b/deps/llhttp/src/llhttp.c<br /=
>+index 14b731e..b0a46c6 100644<br />+--- a/deps/llhttp/src/llhttp.c<br />+=
+++ b/deps/llhttp/src/llhttp.c<br />+@@ -2651,7 +2651,11 @@ static llparse_=
state_t llhttp__internal__run(<br />+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;mask=
 =3D vorrq_u8(mask, single);<br />+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;narrow=
 =3D vshrn_n_u16(vreinterpretq_u16_u8(mask), 4);<br />+&nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp;match_mask =3D ~vget_lane_u64(vreinterpret_u64_u8(narrow), 0)=
;<br />+-&nbsp; &nbsp; &nbsp; &nbsp; match_len =3D __builtin_ctzll(match_ma=
sk) &gt;&gt; 2;<br />++&nbsp; &nbsp; &nbsp; &nbsp; if (match_mask =3D=3D 0)=
 {<br />++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; match_len =3D 16;<br />++&nbsp=
; &nbsp; &nbsp; &nbsp; } else {<br />++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; m=
atch_len =3D __builtin_ctzll(match_mask) &gt;&gt; 2;<br />++&nbsp; &nbsp; &=
nbsp; &nbsp; }<br />+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (match_len !=3D 1=
6) {<br />+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;p +=3D match_len;<br />=
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;goto s_n_llhttp__internal__n_head=
er_value_otherwise;<br />+-- <br />+2.34.1<br />+<br />diff --git a/meta-oe=
/recipes-devtools/nodejs/<a href=3D"http://nodejs_22.22.0.bb" target=3D"_bl=
ank" rel=3D"noopener noreferrer">nodejs_22.22.0.bb</a> b/meta-oe/recipes-de=
vtools/nodejs/<a href=3D"http://nodejs_22.22.0.bb" target=3D"_blank" rel=3D=
"noopener noreferrer">nodejs_22.22.0.bb</a><br />index 05fa608047..d08c5d83=
18 100644<br />--- a/meta-oe/recipes-devtools/nodejs/<a href=3D"http://node=
js_22.22.0.bb" target=3D"_blank" rel=3D"noopener noreferrer">nodejs_22.22.0=
.bb</a><br />+++ b/meta-oe/recipes-devtools/nodejs/<a href=3D"http://nodejs=
_22.22.0.bb" target=3D"_blank" rel=3D"noopener noreferrer">nodejs_22.22.0.b=
b</a><br />@@ -33,6 +33,7 @@ SRC_URI =3D "<a href=3D"https://nodejs.org/dis=
t/v$%7BPV%7D/node-v$%7BPV%7D.tar.xz" target=3D"_blank" rel=3D"noopener nore=
ferrer">https://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz</a> \<br />&nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; file://0001-build-remove-redundant-mXX-=
flags-for-V8.patch \<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; file://=
0001-fix-arm-Neon-intrinsics-types.patch \<br />&nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; file://0001-detect-aarch64-Neon-correctly.patch \<br />+&nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;file://0001-llhttp-fix-NEON-header-val=
ue-__builtin_ctzll-undefin.patch \<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; file://run-ptest \<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; "<=
br />&nbsp;SRC_URI:append:class-target =3D " \<br />-- <br />2.34.1<br /><b=
r /><br /><br /></blockquote>
</div>
</div>
</blockquote>
</div>

--nSAY8ZsRAILd7cgUhf0a--

