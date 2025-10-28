Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9F09CCF9E0
	for <webhook@archiver.kernel.org>; Tue, 28 Oct 2025 11:15:27 +0000 (UTC)
Subject: Re: [meta-oe][PATCH] nodejs: fix compile failed for 32 bit arm target
To: openembedded-devel@lists.openembedded.org
From: "hongxu" <hongxu.jia@eng.windriver.com>
X-Originating-Location: Beijing, CN (123.123.43.110)
X-Originating-Platform: Linux Chrome 141
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 28 Oct 2025 04:15:20 -0700
References: <CAMKF1spyayYnie=3TpxNSWWCZ_5Tqo_abCsZYKjdy2uj_Dv8oQ@mail.gmail.com>
In-Reply-To: <CAMKF1spyayYnie=3TpxNSWWCZ_5Tqo_abCsZYKjdy2uj_Dv8oQ@mail.gmail.com>
Message-ID: <27789.1761650120456579057@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="kwVw66k0c3JGhrRva4gg"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Oct 2025 11:15:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121076

--kwVw66k0c3JGhrRva4gg
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 27, 2025 at 11:09 PM, Khem Raj wrote:

>=20
>=20
>> +# Use '-flax-vector-conversions' to permit conversions between vectors
>> +# with differing element types or numbers of subparts
>> +CFLAGS:append:arm =3D " -flax-vector-conversions"
>=20
> I am not sure if this is the right thing to do in the general case.
> Please keep it limited to debug builds.

With further investigation, the failure remains when debug build is disable=
d,
sorry for mislead in the comments, I will update comments in v2

//Hongxu

>=20
>=20
>> +
>> def map_nodejs_arch(a, d):
>> import re
>=20
>

--kwVw66k0c3JGhrRva4gg
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>On Mon, Oct 27, 2025 at 11:09 PM, Khem Raj wrote:</div>
<div>
<blockquote>
<blockquote>+# Use '-flax-vector-conversions' to permit conversions between=
 vectors<br />+# with differing element types or numbers of subparts<br />+=
CFLAGS:append:arm =3D " -flax-vector-conversions"</blockquote>
I am not sure if this is the right thing to do in the general case.<br />Pl=
ease keep it limited to debug builds.</blockquote>
With further investigation, the failure remains when debug build is disable=
d,</div>
<div>sorry for mislead in the comments, I will update comments in v2</div>
<div>&nbsp;</div>
<div>//Hongxu<br />
<blockquote>
<blockquote>+<br />def map_nodejs_arch(a, d):<br />import re</blockquote>
</blockquote>
</div>

--kwVw66k0c3JGhrRva4gg--

