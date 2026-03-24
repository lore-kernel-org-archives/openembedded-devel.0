Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8677AF54ADE
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 17:10:23 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2536.1774372216453548181
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Mar 2026 10:10:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=AU3ZNNdI;
 spf=pass (domain: gmail.com, ip: 209.85.128.174, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-79a2ee65171so42208547b3.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 10:10:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774372215; cv=none;
        d=google.com; s=arc-20240605;
        b=UFQZndG1+I3ecsjB9JiGWo+j7EbWnpp6sXCUAJo5Jp5A8w6cYtO5awEr9gLMvjS69/
         hrsHVouQe/qOyMe70JM72es+XKk3nmFSvA8T6hoYoLRORfYMOYxSMrRj4oJaj/4c63Ww
         7NcWdZ4wf4D4OfLca84F8mEYzY7qR9l8ACf+iozy20yNpWOEoiTA8CZq6XT0nT0j9Buo
         FI1wQbkFvf+DbyiB/H5POwde99wmi9st0/ai+gAsOjjjFWHzCGVKgp32HV7SymdQevWB
         abxlRGGf9wvN05y4ZW2GsOIVKb2rrVbBR8VCuy41lcZeJZ2wmiancjXs4dU3LZOMwDW3
         WJaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=ww8J9R4W4mNPfQtsfUB8/FI4I/fmdFG8AFRHBijc7hg=;
        fh=pgSuNtBd9WV+mTof3gYKFZAQkk03g+8G5+Acac4ed14=;
        b=Yo8McnqnfEbGiD1DIRIa8ymA3P3Bs47RzQqBrZnqY6m6kyeg/kczua/2cF3U6TkyE0
         4TmDGe/k4/6fgOrnSUVLXj7LOHoO+FNCR9+zGIWXHpcgTUf9EN+gia8ZCR4ftjzglEjv
         EnbnsgSbKk6lzVDSYz0/8fbsmBvihBSsjg7/UUMC8cvwVRqsQk1rHNyJbq3o1BPU/maD
         +f9Im8jvUpo2Ksf7wwZZcW9BtTkIvhVRXe7a6lrBxlscCG6C4yBhlCWre2vb/IIpLGZ/
         w++Ys3ZFikgCYNh84rEXRrJkAgmvofYZn+/FgRuXwCt8C82exPuBPvSXMYyjSnQHxtKL
         D1AQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774372215; x=1774977015; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ww8J9R4W4mNPfQtsfUB8/FI4I/fmdFG8AFRHBijc7hg=;
        b=AU3ZNNdIjWJbRL9bG+mCywLxAZVr6Zb9S+n5r3XeFzPMypix+T1+zq3amAMJPGIHgi
         TSTeKtneId+QBgnNfj4q++tqAHOmXDc778OL87IWcZf6UzYB8z1i6iO8j2vnBoTRUtdi
         W8VcaxCp16CHKeRheCebw6aEJYYLo3wqft5mVUU/6VgAWSD7Wfc+Hgw4YzmlqT4Cq1Hb
         7j0GYKBUyTipFWceyVTPVVv4/gNzTEV/03uiABXEmXVXMJ+JPMYnH8xUUMHtY1BqgSvp
         8sUr2/1cnZR6GOKdrHqVOV6L7WoNaYW5UmOHc1RcNYhrPGBlU4BB8GMnc4rKpsW+FBOC
         TgOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774372215; x=1774977015;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ww8J9R4W4mNPfQtsfUB8/FI4I/fmdFG8AFRHBijc7hg=;
        b=I0ouxcFsmRl+OXqLhTV0KQbOj17lfjlNwQ85wcFJyhDZxXZabF+M07q5P5VTFlOjDg
         7Ny9F9XYXaceMai27KlLleEvmP368hEskGxQrK5XkPJeR+EcdBScxE6cGiFlQ28efQvN
         sbVjTDfuuiThtU5rVTha3GTgAYLORrF/cRQ6kLBWxjwY/40IyGY1PbkFEHKud5wRWJX6
         NRT89f5jx6poJS0nt8NRpCmrv+4awMzaC9gifIqSmgd0CbjJvKNmUpOotp5t9lBFkEiq
         TToHeIX9wrXItit2yqVcvFGZfK13OvubaJm6HMegt37Vd1O6qwzRh8bgvGKgqLITpKaC
         LqXw==
X-Gm-Message-State: AOJu0YzEQbBH7ufRdk6+R5P02lS6PBZgKS+mXs1WcbDzqcGfJQZh8fqY
	uPBWhFI9riw1Qa/c+FwnG6RS8TcP0dW/cxk6RuRcRV1fl0rwLCp4INm7wZcpjARfPuZhjZR4nZ9
	BlXmOM8Ks2jNTjxDHT25v4oXJDDTA1lwUKw==
X-Gm-Gg: ATEYQzyiefhaN4kvis536s0SV+S/2/ox29BT0Qjo/PXNXi0Eh5656QIDmjQaCIqoPAu
	2X3mq02qUUSk/xHVTIUR/4YenLVD5LJu0Vp8cSu5VYXgU7RDavyQWjm4aa1kS1EKCmA0fnnP+Qh
	8qSd/Q8Skua7x0LgnQzQYmn8/t9CPT4uS6aeEv5BENWLpb+jjah78+UoO+GxrXKUCnW3OxPH/Ex
	j8AB13OQL2UO3XKYS79vs76kusDals5W+u1rXqv8+CRlJl6ZgF4+XPtlPYLV8Yd9de5FHxeGuol
	lR/ly+YYgGEiIHmRSk1411KNOz527qPGO92Cy2YZCslFr01eRevzsE41yTlamZDywl78Sns9NxN
	3E3uOCiHmeMUlFEG7urp6VZtS
X-Received: by 2002:a05:690c:968f:b0:798:613a:2efa with SMTP id
 00721157ae682-79acf65e4a9mr5302887b3.40.1774372214973; Tue, 24 Mar 2026
 10:10:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260324162643.1960073-1-khem.raj@oss.qualcomm.com>
In-Reply-To: <20260324162643.1960073-1-khem.raj@oss.qualcomm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 24 Mar 2026 10:09:48 -0700
X-Gm-Features: AaiRm52VG6RfzhggBn0fH0MUTcRD3u95XCdoEcntUkHysBuGaptumU6VAgv9544
Message-ID: <CAMKF1sp-6xDX812B8Dtn_m0yhWu0TEKsOUNx13-E_Fe1V6L6OQ@mail.gmail.com>
Subject: Re: [meta-oe][PATCH] canopenterm: Upgrade to 1.0.14
To: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000092ab83064dc839b4"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 17:10:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125580

--00000000000092ab83064dc839b4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This does not really work as it tries to fetch sources during do_compile. I
will send a fix to get 1.0.13 working with latest cmake and lua

On Tue, Mar 24, 2026 at 9:26=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrote=
:

> From: Khem Raj <raj.khem@gmail.com>
>
> License-Update: Changed Copyright years [1]
> Changes [2]
>
> [1]
> https://github.com/CANopenTerm/CANopenTerm/commit/e4062f675908c4d23881736=
4c492ac4f0b52af30
> [2] https://github.com/CANopenTerm/CANopenTerm/releases/tag/v1.0.14
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../{canopenterm_1.0.13.bb =3D> canopenterm_1.0.14.bb}       | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>  rename meta-oe/recipes-extended/canopenterm/{canopenterm_1.0.13.bb =3D>
> canopenterm_1.0.14.bb} (84%)
>
> diff --git a/meta-oe/recipes-extended/canopenterm/canopenterm_1.0.13.bb
> b/meta-oe/recipes-extended/canopenterm/canopenterm_1.0.14.bb
> similarity index 84%
> rename from meta-oe/recipes-extended/canopenterm/canopenterm_1.0.13.bb
> rename to meta-oe/recipes-extended/canopenterm/canopenterm_1.0.14.bb
> index a81ed30f72..ed59c7d8cd 100644
> --- a/meta-oe/recipes-extended/canopenterm/canopenterm_1.0.13.bb
> +++ b/meta-oe/recipes-extended/canopenterm/canopenterm_1.0.14.bb
> @@ -11,14 +11,13 @@ HOMEPAGE =3D "https://canopenterm.de"
>  BUGTRACKER =3D "https://github.com/CANopenTerm/CANopenTerm/issues"
>
>  LICENSE =3D "MIT"
> -LIC_FILES_CHKSUM =3D
> "file://LICENSE.md;md5=3D5f8a62fabd50ce3f1d7794bc849ae7a5"
> +LIC_FILES_CHKSUM =3D
> "file://LICENSE.md;md5=3Dbd2edc721b4a0289efe949bdbe7dda79"
>
>  DEPENDS =3D "cjson libinih libsdl3 lua libsocketcan pocketpy"
>
> -SRC_URI =3D "git://
> github.com/CANopenTerm/CANopenTerm.git;protocol=3Dhttps;branch=3Dmain"
> -
> -SRCREV  =3D "b0555360e5e8b444a2a9e14088fd253412184eb8"
> +SRC_URI =3D "git://
> github.com/CANopenTerm/CANopenTerm.git;protocol=3Dhttps;branch=3Dmain;tag=
=3Dv${PV}
> <http://github.com/CANopenTerm/CANopenTerm.git;protocol=3Dhttps;branch=3D=
main;tag=3Dv$%7BPV%7D>
> "
>
> +SRCREV  =3D "012e48af26b483ead9df1004cfc92e6908b66b24"
>
>  inherit cmake ptest
>
>

--00000000000092ab83064dc839b4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This does not really work as it tries to fetch sources dur=
ing do_compile. I will send a fix to get 1.0.13 working with latest cmake a=
nd lua</div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=
=3D"ltr" class=3D"gmail_attr">On Tue, Mar 24, 2026 at 9:26=E2=80=AFAM Khem =
Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Khem =
Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gm=
ail.com</a>&gt;<br>
<br>
License-Update: Changed Copyright years [1]<br>
Changes [2]<br>
<br>
[1] <a href=3D"https://github.com/CANopenTerm/CANopenTerm/commit/e4062f6759=
08c4d238817364c492ac4f0b52af30" rel=3D"noreferrer" target=3D"_blank">https:=
//github.com/CANopenTerm/CANopenTerm/commit/e4062f675908c4d238817364c492ac4=
f0b52af30</a><br>
[2] <a href=3D"https://github.com/CANopenTerm/CANopenTerm/releases/tag/v1.0=
.14" rel=3D"noreferrer" target=3D"_blank">https://github.com/CANopenTerm/CA=
NopenTerm/releases/tag/v1.0.14</a><br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D=
"_blank">raj.khem@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../{<a href=3D"http://canopenterm_1.0.13.bb" rel=3D"noreferrer" targ=
et=3D"_blank">canopenterm_1.0.13.bb</a> =3D&gt; <a href=3D"http://canopente=
rm_1.0.14.bb" rel=3D"noreferrer" target=3D"_blank">canopenterm_1.0.14.bb</a=
>}=C2=A0 =C2=A0 =C2=A0 =C2=A0| 7 +++----<br>
=C2=A01 file changed, 3 insertions(+), 4 deletions(-)<br>
=C2=A0rename meta-oe/recipes-extended/canopenterm/{<a href=3D"http://canope=
nterm_1.0.13.bb" rel=3D"noreferrer" target=3D"_blank">canopenterm_1.0.13.bb=
</a> =3D&gt; <a href=3D"http://canopenterm_1.0.14.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">canopenterm_1.0.14.bb</a>} (84%)<br>
<br>
diff --git a/meta-oe/recipes-extended/canopenterm/<a href=3D"http://canopen=
term_1.0.13.bb" rel=3D"noreferrer" target=3D"_blank">canopenterm_1.0.13.bb<=
/a> b/meta-oe/recipes-extended/canopenterm/<a href=3D"http://canopenterm_1.=
0.14.bb" rel=3D"noreferrer" target=3D"_blank">canopenterm_1.0.14.bb</a><br>
similarity index 84%<br>
rename from meta-oe/recipes-extended/canopenterm/<a href=3D"http://canopent=
erm_1.0.13.bb" rel=3D"noreferrer" target=3D"_blank">canopenterm_1.0.13.bb</=
a><br>
rename to meta-oe/recipes-extended/canopenterm/<a href=3D"http://canopenter=
m_1.0.14.bb" rel=3D"noreferrer" target=3D"_blank">canopenterm_1.0.14.bb</a>=
<br>
index a81ed30f72..ed59c7d8cd 100644<br>
--- a/meta-oe/recipes-extended/canopenterm/<a href=3D"http://canopenterm_1.=
0.13.bb" rel=3D"noreferrer" target=3D"_blank">canopenterm_1.0.13.bb</a><br>
+++ b/meta-oe/recipes-extended/canopenterm/<a href=3D"http://canopenterm_1.=
0.14.bb" rel=3D"noreferrer" target=3D"_blank">canopenterm_1.0.14.bb</a><br>
@@ -11,14 +11,13 @@ HOMEPAGE =3D &quot;<a href=3D"https://canopenterm.de" r=
el=3D"noreferrer" target=3D"_blank">https://canopenterm.de</a>&quot;<br>
=C2=A0BUGTRACKER =3D &quot;<a href=3D"https://github.com/CANopenTerm/CANope=
nTerm/issues" rel=3D"noreferrer" target=3D"_blank">https://github.com/CANop=
enTerm/CANopenTerm/issues</a>&quot;<br>
<br>
=C2=A0LICENSE =3D &quot;MIT&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://LICENSE.md;md5=3D5f8a62fabd50ce3f1d7794b=
c849ae7a5&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE.md;md5=3Dbd2edc721b4a0289efe949b=
dbe7dda79&quot;<br>
<br>
=C2=A0DEPENDS =3D &quot;cjson libinih libsdl3 lua libsocketcan pocketpy&quo=
t;<br>
<br>
-SRC_URI =3D &quot;git://<a href=3D"http://github.com/CANopenTerm/CANopenTe=
rm.git;protocol=3Dhttps;branch=3Dmain" rel=3D"noreferrer" target=3D"_blank"=
>github.com/CANopenTerm/CANopenTerm.git;protocol=3Dhttps;branch=3Dmain</a>&=
quot;<br>
-<br>
-SRCREV=C2=A0 =3D &quot;b0555360e5e8b444a2a9e14088fd253412184eb8&quot;<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/CANopenTerm/CANopenTe=
rm.git;protocol=3Dhttps;branch=3Dmain;tag=3Dv$%7BPV%7D" rel=3D"noreferrer" =
target=3D"_blank">github.com/CANopenTerm/CANopenTerm.git;protocol=3Dhttps;b=
ranch=3Dmain;tag=3Dv${PV}</a>&quot;<br>
<br>
+SRCREV=C2=A0 =3D &quot;012e48af26b483ead9df1004cfc92e6908b66b24&quot;<br>
<br>
=C2=A0inherit cmake ptest<br>
<br>
</blockquote></div>

--00000000000092ab83064dc839b4--

