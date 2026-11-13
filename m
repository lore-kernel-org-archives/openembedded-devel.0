Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.417.1794591238124619948
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Nov 2026 09:33:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=ad8R2fnS;
 spf=pass (domain: gmail.com, ip: 74.125.224.45, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-67d8221074dso1345671d50.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 13 Nov 2026 09:33:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794591237; cv=none;
        d=google.com; s=arc-20260327;
        b=KmXqh2WVwbPgPSi4Xke16tyStt94/k55QUrL0CCspp+BN7OP+jso0yIIlXOcLr7M8F
         j9tQfYP1aqaO92/IRSJFtLPkMPFNda+j/8TjrgTbkS+JvQft3sP7wtMS2pvbyJtCFp5R
         ElbYlOYjc3qPD3BiizDuCKy8O9LP0RuzvI1HxAFPzhc/mlKWQ7Z2xocc+CxUJGLydXjU
         kqNKfslYRhY/QFWD+eA1Sg830Foo82rMxIajcjbPd+/mlI68gcOuq3hRGizOEkOfbJZy
         o6sA8hf1rHZCiUHb8UJD3bXzIsj/p1kvxEIQrBx001+D/zrqQWC9G+y20uePsLDVf8Jq
         Ia6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=L0QDQF5xvfpP1thvLZz+xZ5EQsS+FTlqrin3I14i+0k=;
        fh=LZspYXC3IzyIN8FmVwz229n7pZIWt1HqVNc3WYXGu+o=;
        b=ZcVb/agRcNOw+rW3jBrQBE61p6UhR1I/MwDup9hoHVJ546Zna3VHzgKknA4E9E3vBm
         lzX1p/qX/T/y15rjFNZx174puw3Y6lj/9sdv3nEBix0VtJJwnXv3JDcIrczsDgjkFHzS
         EfugrQovZozDg29YoaT8FG7XQj2L/47FrcFnLizOgbd23Kbk7mWlSlxaJTkfBAy0pCZz
         7nBEeCIQtl/m0Vgm9p4szXVzQoIIBjDF5NqKFl3UHYEwwIDqLAgiNHEqnp5T7393Ee5A
         IvP/B80U0WphGG/Q7qClkLVPyLgmyTUoDU+XLoA2zsCGQxwK59wMJ9txDvbKeO0jfvDI
         Ch+Q==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794591237; x=1795196037; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L0QDQF5xvfpP1thvLZz+xZ5EQsS+FTlqrin3I14i+0k=;
        b=ad8R2fnSW32rk9hDBT69m9pR8/y5splEE4z4RUJpJ++Rfmvdo5mpMmv5Ms4klGQRB2
         T+5g9G1Qj1jWyMTnNwk6Jl4T83/kGeACJ8H6QQxp+8diHburEHi8uH9pkZosTVdWma3N
         51fJ5fmqPYfCJTXHo0jifswRReXPRbD5jOCxxBu4vgSr3l7HOVK6PYz8jpa1LH7gyWTi
         6qKswpRr7MCIRziLEROJG+XVh1hMlPVvCsHviyXH2Iw/95GhiLj/f4o0uKjKoiXE0FlK
         to40DMhJqrpZYqnVlazw3Yndb6f+S2ImTDE+ZeolGrBC5zwqDRMJyqB258oUCrjgq/ZU
         2l4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794591237; x=1795196037;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=L0QDQF5xvfpP1thvLZz+xZ5EQsS+FTlqrin3I14i+0k=;
        b=O8Qd3Ng62eXg3eADiivywXdxiTPqggh9mJZDXxXKWKpgwP5K+2DzdEOh/qqqfAHyFz
         gvLA65/c/4AhgAGRVEyTNpwzBSgPLnF/R9fYVl8E+Zh3lAcdk9tp77Lp7QK/NxuQbUNz
         beVUsDc5U/FclX4hVmhkU2nd6k5XUdrJP5YT9bQBWrEFsEbZrXP9k1/gbnTyIlQ89u0C
         4kgsgqEXByuhpriaGZCJSVuUbAV3DSEHcYMhAjvPaOVQjMpHr/D9+9J9kjgQ92jIRJtS
         HUS7ANkPuNhs0LLiS8WCOq4lMdGwWrwZscP/snnG6G4HWuNlmypwzAChgOjISYXicYvD
         PiaA==
X-Gm-Message-State: APuU4Z8csbt5xi8VlnCGHm3cqe4HrvqNE3hDqHLm3pFsAtMWo3c9jcI9
	E5mzjaS2PkHZ2NmMKLT5xA7Ww9Q9ZpCnZAoW5dCqRf2oPvkjiaNkhNt6EM1vNtbRwzzoFNTZ7x5
	FUjWP9J02opZJXiJyKGo0NluwhURJgVs=
X-Gm-Gg: AYBFou27ziiC51otiC7gA8/Y5anQje+tWParQ+39cQLfMYzj2fZou/EuRXGUkS1hWjD
	OBK/oxY8ifu7WBrPLxrqk9bMw5B7vQdYCWilVVkuTffOC6iebqFUiQO+3n18ja+sYKu4vVOTnD9
	hsK7Xial4fsV9tbnBfCIvRDceqZgtiPkksUnKzuBk1N0SFcLpX12AjOfZka5fmefs27G5NCGxLP
	Pb612ro0kC4s19s5nn7k6dHninwpoCOlWgP6HBpTvYmqnSV6QkhkL+i9RqbgHWvqaaPZR1JXIrb
	fr2j5Yo/eB8qtczX7rWTNomQpgXopENRTklNXHcE5c+8qsQ5rJzV5enAebrKLms57fbTgVaOYTG
	YVv57iRIT0PVP7PheZsNhczMfTD1GrCocj/KfhzhlIEzmg1wllqGb09QPCBCEt69qgksRG15r5G
	8HhN0qCypSr1OKjXMgfTagrii+48HsqU+UXgjpFyXhz2X1xMTYXSNqmalgw+255/Q1z5drWXj0x
	gXJlkYuM2zRXnyItReDKRV0TovMbJNVrGtUsYP/jBVATtLJLf26urGqZYs32/IxiCQK7jWsm94i
	mGhUl5Vu5dX48eZYKBg4TZtz+rm60UjOa7oubTzjjwAWrCZ+fYosTaTuuLdwGBp+c9D4lbEqs04
	tGaq45zAYNLB2mvqaYnOf2Q==
X-Received: by 2002:a05:690e:4012:b0:67d:92ed:e2b8 with SMTP id
 956f58d0204a3-67d92ede6eamr733225d50.53.1794591236930; Fri, 13 Nov 2026
 09:33:56 -0800 (PST)
MIME-Version: 1.0
References: <20261113092650.3890104-1-f_l_k@t-online.de>
In-Reply-To: <20261113092650.3890104-1-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 13 Nov 2026 09:33:29 -0800
X-Gm-Features: AclHuK98sp-d0mkQcHl0iQ-xeifhh6ibAvzlczPbvu9fi0hMNNby-9jAXbO_pkI
Message-ID: <CAMKF1sqXHPr40mOcXoOQG2EyHLdyZ0=0Y1w0k0aE4eqpCRpRBA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] udisks2: fetch 2.11.2 from the 2.11.x-branch
To: f_l_k@t-online.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000031c22706602bd5eb"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 13 Nov 2026 17:34:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132252

--00000000000031c22706602bd5eb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Markus

Thanks for finding these problems, since all these upgrades are still in
staging, I have squashed these commits into respective
recipe upgrade patch to keep bisect-ability.

On Fri, Nov 13, 2026 at 1:27=E2=80=AFAM Markus Volk via openembedded-devel =
<f_l_k=3D
t-online.de@lists.openembedded.org> wrote:

> SRCREV caffebe56d82 is on 2.11.x-branch, not 2.10.x-branch, so the
> fetch failed. Tested by building udisks2 for corei7-64.
>
> AI-Generated: Uses Claude Code (Claude Opus 5.5)
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  meta-oe/recipes-support/udisks/udisks2_2.11.2.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-support/udisks/udisks2_2.11.2.bb
> b/meta-oe/recipes-support/udisks/udisks2_2.11.2.bb
> index 6faf2291ee..5cf6431154 100644
> --- a/meta-oe/recipes-support/udisks/udisks2_2.11.2.bb
> +++ b/meta-oe/recipes-support/udisks/udisks2_2.11.2.bb
> @@ -18,7 +18,7 @@ DEPENDS +=3D "${@bb.utils.filter('DISTRO_FEATURES',
> 'systemd', d)}"
>  RDEPENDS:${PN} =3D "acl"
>
>  SRC_URI =3D " \
> -    git://
> github.com/storaged-project/udisks.git;branch=3D2.10.x-branch;protocol=3D=
https
> \
> +    git://
> github.com/storaged-project/udisks.git;branch=3D2.11.x-branch;protocol=3D=
https
> \
>      file://0001-Makefile.am-Dont-include-buildpath.patch \
>  "
>  SRCREV =3D "caffebe56d8208365cf0d62e0d05d31260d91156"
> --
> 2.56.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#132229):
> https://lists.openembedded.org/g/openembedded-devel/message/132229
> Mute This Topic: https://lists.openembedded.org/mt/122244403/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000031c22706602bd5eb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Markus<div><br></div><div>Thanks=C2=A0for finding=C2=A0the=
se problems, since all these upgrades are still in staging, I have squashed=
 these commits into respective</div><div>recipe upgrade patch to keep bisec=
t-ability.=C2=A0</div></div><br><div class=3D"gmail_quote gmail_quote_conta=
iner"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Nov 13, 2026 at 1:27=E2=
=80=AFAM Markus Volk via openembedded-devel &lt;f_l_k=3D<a href=3D"mailto:t=
-online.de@lists.openembedded.org">t-online.de@lists.openembedded.org</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">SRCREV=
 caffebe56d82 is on 2.11.x-branch, not 2.10.x-branch, so the<br>
fetch failed. Tested by building udisks2 for corei7-64.<br>
<br>
AI-Generated: Uses Claude Code (Claude Opus 5.5)<br>
Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=
=3D"_blank">f_l_k@t-online.de</a>&gt;<br>
---<br>
=C2=A0meta-oe/recipes-support/udisks/<a href=3D"http://udisks2_2.11.2.bb" r=
el=3D"noreferrer" target=3D"_blank">udisks2_2.11.2.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta-oe/recipes-support/udisks/<a href=3D"http://udisks2_2.11.=
2.bb" rel=3D"noreferrer" target=3D"_blank">udisks2_2.11.2.bb</a> b/meta-oe/=
recipes-support/udisks/<a href=3D"http://udisks2_2.11.2.bb" rel=3D"noreferr=
er" target=3D"_blank">udisks2_2.11.2.bb</a><br>
index 6faf2291ee..5cf6431154 100644<br>
--- a/meta-oe/recipes-support/udisks/<a href=3D"http://udisks2_2.11.2.bb" r=
el=3D"noreferrer" target=3D"_blank">udisks2_2.11.2.bb</a><br>
+++ b/meta-oe/recipes-support/udisks/<a href=3D"http://udisks2_2.11.2.bb" r=
el=3D"noreferrer" target=3D"_blank">udisks2_2.11.2.bb</a><br>
@@ -18,7 +18,7 @@ DEPENDS +=3D &quot;${@bb.utils.filter(&#39;DISTRO_FEATURE=
S&#39;, &#39;systemd&#39;, d)}&quot;<br>
=C2=A0RDEPENDS:${PN} =3D &quot;acl&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot; \<br>
-=C2=A0 =C2=A0 git://<a href=3D"http://github.com/storaged-project/udisks.g=
it;branch=3D2.10.x-branch;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_b=
lank">github.com/storaged-project/udisks.git;branch=3D2.10.x-branch;protoco=
l=3Dhttps</a> \<br>
+=C2=A0 =C2=A0 git://<a href=3D"http://github.com/storaged-project/udisks.g=
it;branch=3D2.11.x-branch;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_b=
lank">github.com/storaged-project/udisks.git;branch=3D2.11.x-branch;protoco=
l=3Dhttps</a> \<br>
=C2=A0 =C2=A0 =C2=A0file://0001-Makefile.am-Dont-include-buildpath.patch \<=
br>
=C2=A0&quot;<br>
=C2=A0SRCREV =3D &quot;caffebe56d8208365cf0d62e0d05d31260d91156&quot;<br>
-- <br>
2.56.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#132229): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/132229" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/132229</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/122244403/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/122244403/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--00000000000031c22706602bd5eb--
