Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19869E67481
	for <webhook@archiver.kernel.org>; Sat, 20 Dec 2025 19:38:19 +0000 (UTC)
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.45857.1766259498233397694
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 20 Dec 2025 11:38:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dyPrOryD;
 spf=pass (domain: gmail.com, ip: 74.125.224.50, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-6446704997cso2322512d50.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 20 Dec 2025 11:38:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766259497; x=1766864297; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/Vb4zE4fHrLx7+BL9qIusbwyK3VGI7tt8Z/ONHRGSHo=;
        b=dyPrOryDM+G93p8f9Wt9gAQjkaPx5ILkMWvYWr8+003h9GRcSei2RfWozsoCyD+zzJ
         Vdnth7B09qg15F+ZCAGxIiYNHRK4cxB2L5kZ1gFD4ylM/ArVmQvxsDhVRmtNx4go6pvB
         munSq/sZ9MOXG0Mk6AbY/XaB7R5qPY8deRlcy+znqUXzAkqdAv+PMUPdTTgyyJTSK7Gn
         c0eTBwRlb2PoZTQI7KCAz/yWdB3ztKk1yLy7h1ynNEKyXUGhtjIaGCJMM/etDlOcmdrC
         n1Q1YZPRKlbV0yilfBDmkHuXY00T/DEPXf0OlXmtkTAZehjqNJhX6ytk8NHAugcSnDtA
         43yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766259497; x=1766864297;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Vb4zE4fHrLx7+BL9qIusbwyK3VGI7tt8Z/ONHRGSHo=;
        b=OqGFR7x3U5eLgCFaT1gq8tGjm2nht0J0N4oK5qvE00DvypAN352FGQIaAD/cATfe2o
         bHYllNFveWjl0F5e9ToU7mm72ulNz5kQSjI2n0O40cRbrDONq3nMRe14zmVQ4Rv9u3F4
         jPTkmUanGvoxlIPUbXZ8xu6/wxlMCLoof2mhyZTJnfwKIUo+xG3MdmstA/0dcT+8PJr0
         9r6lMSsBxSM9NWhoNItywpm4Qt6Lg0y1AOgHx7M5cvbnoa7mjAxuL1rvMkF0o3cxRnyC
         8i8IgDKIyJPOHl+WuRggm/CJzn4pkMcAuM+NKXHyvTZGGPNA05zg+IjcXnufR/FH83GH
         Aqxw==
X-Gm-Message-State: AOJu0YzPfQ+0KL3ZGaokmBxJv5e77Sgx+N9ieHFIV0rvTc2FV9LIXa4j
	xMCDKYTxOgoRIundF5vilEn4fETZKJDtGMNJzU/CvG73g9wMqvgZw/WoxXn4h5hQhtRXgtgk87T
	16LTn1CuRN9ih80Bjz9EN7BudZ8mG4P7dSXF5dog=
X-Gm-Gg: AY/fxX7hHQYqoGVN1EO98mtfCStAHDu1Hcf6AzjTeEJ2Ts/cH9P8msiVAlWgHQgqDql
	fqJIW5BK2NzT8HKD080h+g64ghimwIJmAwcuWY6DUTjm4bLHSsM8NFofubCrImC/lBmtGrYCXXa
	WctafCTR089BpeshtYwK4anlKN/zgfSNZbCZUDic+LrxrqBlUsW8OLBx936fWsCKvEmbPCImo9T
	BTCfdKzCWVFupdIA1F6XBmOFkAr6zoEMJbXl0jZUkYJ8YKvEQqjP2PjCqabudxhyiNiw6Ggzzza
	wWAg3xBNIFQlbdfJRZeSMrd4uP8M3BiQhb+zj+jqevQ849lHWQHuxrb64sWY5DlTzjTY6oVvqKu
	aA/n4SVaNJTAYHNkZe9aedWqyoYVE40Vuuf+tucCfJyc77A==
X-Google-Smtp-Source: AGHT+IGJgLH/z+GbxwcJRTHkKMTvPJrkkhQuWEkK5azXhjoPOmogYyiIWIfYrf432g7FMxO50LTetQSAUsA+DFrGHgU=
X-Received: by 2002:a05:690e:11c7:b0:63f:9448:e81 with SMTP id
 956f58d0204a3-6466a85b83amr5239818d50.39.1766259497210; Sat, 20 Dec 2025
 11:38:17 -0800 (PST)
MIME-Version: 1.0
References: <20251218090346.735-1-wangmy@fujitsu.com> <20251218090346.735-2-wangmy@fujitsu.com>
In-Reply-To: <20251218090346.735-2-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 20 Dec 2025 11:37:51 -0800
X-Gm-Features: AQt7F2rR7m9UJ3ZONbgAPystBIriI-QfoqcvKGcPghOBGTTxtgomk9jaDz5uZQU
Message-ID: <CAMKF1srW4LjWMJB3dPzDBQ0+FDPXrbmCrLEiYU+jNa2ENw_4oA@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH 02/20] fluentbit: upgrade 4.2.0 -> 4.2.1
To: wangmy@fujitsu.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000e9986006466755a8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 20 Dec 2025 19:38:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122777

--000000000000e9986006466755a8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 18, 2025 at 1:04=E2=80=AFAM wangmy via lists.openembedded.org <=
wangmy=3D
fujitsu.com@lists.openembedded.org> wrote:

> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../fluentbit/{fluentbit_4.2.0.bb =3D> fluentbit_4.2.1.bb}      | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-extended/fluentbit/{fluentbit_4.2.0.bb =3D>
> fluentbit_4.2.1.bb} (98%)
>
> diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit_4.2.0.bb
> b/meta-oe/recipes-extended/fluentbit/fluentbit_4.2.1.bb
> similarity index 98%
> rename from meta-oe/recipes-extended/fluentbit/fluentbit_4.2.0.bb
> rename to meta-oe/recipes-extended/fluentbit/fluentbit_4.2.1.bb
> index 2c9b874e50..4308cb3d89 100644
> --- a/meta-oe/recipes-extended/fluentbit/fluentbit_4.2.0.bb
> +++ b/meta-oe/recipes-extended/fluentbit/fluentbit_4.2.1.bb
> @@ -17,9 +17,9 @@ DEPENDS =3D "\
>  "
>  DEPENDS:append:libc-musl =3D " fts"
>
> -SRCREV =3D "6bc014390c5485b96521c56b98369b44b9faa08b"
> +SRCREV =3D "c06c12449f3d52a8688fb5ac8bac534c5fd1e6e0"
>  SRC_URI =3D "\
> -    git://github.com/fluent/fluent-bit.git;branch=3Dmaster;protocol=3Dht=
tps \
> +    git://
> github.com/fluent/fluent-bit.git;branch=3Dmaster;protocol=3Dhttps;tag=3Dv=
${PV}
> <http://github.com/fluent/fluent-bit.git;branch=3Dmaster;protocol=3Dhttps=
;tag=3Dv$%7BPV%7D>
> \
>

Tag and SRCREV do not match v4.2.1 corresponds to
https://github.com/fluent/fluent-bit/commit/909b1a917b4f46c40657a73821541fa=
03581a823

Please fix, test (bitbake -ccleanall <recipe> ) and resent.


>
>  file://0001-lib-Do-not-use-private-makefile-targets-in-CMakelist.patch \
>
>  file://0002-flb_info.h.in-Do-not-hardcode-compilation-directorie.patch \
>      file://0003-CMakeLists.txt-Revise-init-manager-deduction.patch \
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#122736):
> https://lists.openembedded.org/g/openembedded-devel/message/122736
> Mute This Topic: https://lists.openembedded.org/mt/116839774/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000e9986006466755a8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Dec 18,=
 2025 at 1:04=E2=80=AFAM wangmy via <a href=3D"http://lists.openembedded.or=
g">lists.openembedded.org</a> &lt;wangmy=3D<a href=3D"mailto:fujitsu.com@li=
sts.openembedded.org">fujitsu.com@lists.openembedded.org</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">From: Wang Mingyu &=
lt;<a href=3D"mailto:wangmy@fujitsu.com" target=3D"_blank">wangmy@fujitsu.c=
om</a>&gt;<br>
<br>
Signed-off-by: Wang Mingyu &lt;<a href=3D"mailto:wangmy@fujitsu.com" target=
=3D"_blank">wangmy@fujitsu.com</a>&gt;<br>
---<br>
=C2=A0.../fluentbit/{<a href=3D"http://fluentbit_4.2.0.bb" rel=3D"noreferre=
r" target=3D"_blank">fluentbit_4.2.0.bb</a> =3D&gt; <a href=3D"http://fluen=
tbit_4.2.1.bb" rel=3D"noreferrer" target=3D"_blank">fluentbit_4.2.1.bb</a>}=
=C2=A0 =C2=A0 =C2=A0 | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
=C2=A0rename meta-oe/recipes-extended/fluentbit/{<a href=3D"http://fluentbi=
t_4.2.0.bb" rel=3D"noreferrer" target=3D"_blank">fluentbit_4.2.0.bb</a> =3D=
&gt; <a href=3D"http://fluentbit_4.2.1.bb" rel=3D"noreferrer" target=3D"_bl=
ank">fluentbit_4.2.1.bb</a>} (98%)<br>
<br>
diff --git a/meta-oe/recipes-extended/fluentbit/<a href=3D"http://fluentbit=
_4.2.0.bb" rel=3D"noreferrer" target=3D"_blank">fluentbit_4.2.0.bb</a> b/me=
ta-oe/recipes-extended/fluentbit/<a href=3D"http://fluentbit_4.2.1.bb" rel=
=3D"noreferrer" target=3D"_blank">fluentbit_4.2.1.bb</a><br>
similarity index 98%<br>
rename from meta-oe/recipes-extended/fluentbit/<a href=3D"http://fluentbit_=
4.2.0.bb" rel=3D"noreferrer" target=3D"_blank">fluentbit_4.2.0.bb</a><br>
rename to meta-oe/recipes-extended/fluentbit/<a href=3D"http://fluentbit_4.=
2.1.bb" rel=3D"noreferrer" target=3D"_blank">fluentbit_4.2.1.bb</a><br>
index 2c9b874e50..4308cb3d89 100644<br>
--- a/meta-oe/recipes-extended/fluentbit/<a href=3D"http://fluentbit_4.2.0.=
bb" rel=3D"noreferrer" target=3D"_blank">fluentbit_4.2.0.bb</a><br>
+++ b/meta-oe/recipes-extended/fluentbit/<a href=3D"http://fluentbit_4.2.1.=
bb" rel=3D"noreferrer" target=3D"_blank">fluentbit_4.2.1.bb</a><br>
@@ -17,9 +17,9 @@ DEPENDS =3D &quot;\<br>
=C2=A0&quot;<br>
=C2=A0DEPENDS:append:libc-musl =3D &quot; fts&quot;<br>
<br>
-SRCREV =3D &quot;6bc014390c5485b96521c56b98369b44b9faa08b&quot;<br>
+SRCREV =3D &quot;c06c12449f3d52a8688fb5ac8bac534c5fd1e6e0&quot;<br>
=C2=A0SRC_URI =3D &quot;\<br>
-=C2=A0 =C2=A0 git://<a href=3D"http://github.com/fluent/fluent-bit.git;bra=
nch=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">github.=
com/fluent/fluent-bit.git;branch=3Dmaster;protocol=3Dhttps</a> \<br>
+=C2=A0 =C2=A0 git://<a href=3D"http://github.com/fluent/fluent-bit.git;bra=
nch=3Dmaster;protocol=3Dhttps;tag=3Dv$%7BPV%7D" rel=3D"noreferrer" target=
=3D"_blank">github.com/fluent/fluent-bit.git;branch=3Dmaster;protocol=3Dhtt=
ps;tag=3Dv${PV}</a> \<br></blockquote><div><br></div><div>Tag and SRCREV do=
 not match v4.2.1 corresponds to</div><div><a href=3D"https://github.com/fl=
uent/fluent-bit/commit/909b1a917b4f46c40657a73821541fa03581a823">https://gi=
thub.com/fluent/fluent-bit/commit/909b1a917b4f46c40657a73821541fa03581a823<=
/a></div><div><br></div><div>Please fix, test (bitbake -ccleanall=C2=A0&lt;=
recipe&gt; ) and resent.</div><div>=C2=A0</div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0file://0001-lib-Do-not-use-private-makefile-targets-in-=
CMakelist.patch \<br>
=C2=A0 =C2=A0 =C2=A0file://0002-flb_info.h.in-Do-not-hardcode-compilation-d=
irectorie.patch \<br>
=C2=A0 =C2=A0 =C2=A0file://0003-CMakeLists.txt-Revise-init-manager-deductio=
n.patch \<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#122736): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/122736" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/122736</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/116839774/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/116839774/1997914</a><br>
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

--000000000000e9986006466755a8--

