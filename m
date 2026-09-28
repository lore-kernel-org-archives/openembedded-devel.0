Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7AA7CA5FA1
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 17:27:05 +0000 (UTC)
Received: from mail-yx2-f43.google.com (mail-yx2-f43.google.com [74.125.224.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.63106.1790616415743749256
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Sep 2026 10:26:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=e72uKNZ2;
 spf=pass (domain: gmail.com, ip: 74.125.224.171, mailfrom: raj.khem@gmail.com)
Received: by mail-yx2-f43.google.com with SMTP id 956f58d0204a3-670fee39d73so3473130d50.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 28 Sep 2026 10:26:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790616415; cv=none;
        d=google.com; s=arc-20260327;
        b=q2snUrfcllD+2fPBvi1m9mCY0FedV/R3KzFwLKcx+bFCODBHsGDYmDhepTWMRAfKUk
         4wN8UAFiRU7CrBabpkCqRcKTlqUA0HKPtbLcJ3lSYRdDF6HlsJdNlyQ1QgaaI1nOvKNb
         pNBOnIlGVfUjeUng2Fd8XpiaWlZ3ljja9jctTLgOiDPxEQW0PYDTPrqcgQYNLan7XT/y
         JULz5uPtQ8Gm5VrBhHkAy+UFBb6ct9CjJzJpDG7r86ZS5mvU+wWkjiuXkfc0u4uXw/Jk
         cGcd5y9CNYKXh1bkQqDas1i3NiDuEgEnRPCUv40x5Xfym+wwudX3DY4L41o/uFnxE4Aq
         SerQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=weEiiBOYK9m/4NA0R3+phuNyMf+fp4NrK6khFM3/fgg=;
        fh=OFle2CS3VNisdCAgSRXUV24N3cCDSB7jOnOizepy1to=;
        b=BIVjdeTtMekXengRx6yN3wYSlrn9IA30hCWgoUw6KsHOhk3SGkZO0qqy+pxHv1XUUp
         nmytei6963d4Itj+KIc7WPVWJdINiD4cPVVxbbrzXR1+p2ZW2daj2FwUEKOTxlpOxLss
         L0MYTld3vjvfxSjyY+JEb1m26PL2GhFPFm7tGSR6cPEVMZMx8DWnrejf1TLz7+vnfk2d
         n93VboCYWOCVrvkW610prWZ6wS2fL1fEV2krN3LbPqcdIT4S589O5HKuloRyb9ZSc2Hi
         Aai2M/SaGi7p0bZ00LvyL/D8pydDEdS5DqTxoZLpl3d3LwUJsfe4x+B0b5VAOQZE1DP9
         Q4hQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790616415; x=1791221215; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=weEiiBOYK9m/4NA0R3+phuNyMf+fp4NrK6khFM3/fgg=;
        b=e72uKNZ27qaMR5HRP9UO/x15ufrrOfxX9J+dZ0qDcqem6en4cqHCETn7m9zU4tFAEZ
         kS2F7AuY/QEcLKbBFS4boPEwLLj9CiAlxTuF24L/XBGsp8vm/jfYXcioTtUVeOiLYlud
         gWLU13FXFQ/nfgdhhgCQW55RWWQ9LbaWniHVv1VxbHkJE11Ks8de44Dy77p9EJewcDHk
         JiC45St5Fs1+VVtTx5hWAhyXMvmivkIDeaeS2CxeVXSTrREjDNA2kVlJUV8wkxQ1Kl0V
         EeYede27TDoTbfvJGZKbUzxs+iqlG3mbs/TkVuKKiDG/pbV7EnVf9uJkWAlsaCZiYQsd
         Rokg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790616415; x=1791221215;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=weEiiBOYK9m/4NA0R3+phuNyMf+fp4NrK6khFM3/fgg=;
        b=kkagG9zShTeiVgAhamhOcKjdP3ksWuNrzolDbOFXTZkyDxmfopAX60SQOz88zy73uZ
         In+MZMGC5HXIVSz1G2HQ1Nr7O8cTJFWLgVkR0mCrJ3ByJyUeTXCG7Cm5t4Fn+X+FluVX
         HgHxw2Tr1WmczgXuZfdPB+wnsdOEvQIPlfdGMD3QaTB2IdzgV5iYeOUJtoVWL9qpz88u
         kzjLUgtsqzCHTfioytoifnReyhF7tHWT4EFRtMcGeI2hLWueY2TJnwksu/vtPdCzpvPd
         UjBEWl8iQJJjEyEp69NwX9bwzk/tgqbs3s2YpqaV83465L4SPZAVVdpaDbOCLiq1trJ8
         LyEQ==
X-Gm-Message-State: AFq9FYIEn3PWGVY6UAN8uWY+grTEvk8nRMGnOioRjxRIbijRZd75Yn/A
	nPNm3HbD37uZRTIyOx2K5cGvLW42tVMdEwA0CT6SS1fbxhUUCaN6ZTeL7V5+kf5LKz1SDS6Z8OR
	Ij0D9xxDNVZXS1Qk5dyBdl3NWqR73BoQ=
X-Gm-Gg: AYBFou3hwuk98m9eSfNq+0Puxu/f84uJxdHBN/gPVXsUY+BV8sWUpWHRpE7e4sJgeRz
	ZcWT5aJBJp2NW/chCd4rc2dxJNupdJE4g/k30hMX4To3yNIBzwEVT3Ozw0Bje4lyLgBxEUiKKqf
	9RIBlYRNPPtqRpmDBgZ6cmMqP1T+HdlNQ0F1lkVpYCBTDWSAeEX4TyuB3SumFKg7AchOeqF2mGw
	1Yq78nB4Jz8HRLiAmWmAIswbGN71RlyKHJu9i1PZ+Oxo0XqkHPXKcGtQemrRSoVGyesyRqZHobw
	2aqzzfSSp1f7Fouij3w1Lt0P9JFA3ULDiAS/f2ArcRymTtZuNfL2WYUY0nmXNGAXOioQTbJT0ED
	GlNzQeDTHu+Oho1ksWLbtbQ7hO+ze8CaQtDC88UnQKkmeVXmYKUHuYDmuSrtuUSi4zRLyS/tBDQ
	c2AR4W5SqGTKyCnTBaC/zYOvo5RlYZxb/0r28sO0I6Ffl1w/+fE73Zrn3uZ34K6HkD+EUoQwFbz
	xU9TWbQLcn0/b5yxzBbCVugJBmB6YebNphWPfRJW69w7CeIocxUBji8OFaf5Mh1lX1LN0d2bWvx
	aM2t43qM
X-Received: by 2002:a05:690e:1248:b0:675:5b44:6941 with SMTP id
 956f58d0204a3-6755b446ba6mr975376d50.52.1790616414655; Mon, 28 Sep 2026
 10:26:54 -0700 (PDT)
MIME-Version: 1.0
References: <20260928092140.2252231-2-alex.kiernan@gmail.com>
In-Reply-To: <20260928092140.2252231-2-alex.kiernan@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 28 Sep 2026 10:26:28 -0700
X-Gm-Features: AclHuK_InzSQrDN9q7GEouib7e-gFR23-fiUvohjnQ0j0WM-RH61351caaEaxas
Message-ID: <CAMKF1sqoeV6AZqxpf+7eMTidtWiP_uD0jfT9Hmty0MkUVUV5Gg@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 1/2] python3-asyncvarlink: add recipe
To: alex.kiernan@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000053182c065c8e5fc3"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Sep 2026 17:27:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130444

--00000000000053182c065c8e5fc3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

its seems to have https://github.com/helmutg/asyncvarlink/tree/main/tests
please work on adding these as a ptest package

On Mon, Sep 28, 2026 at 2:22=E2=80=AFAM Alex Kiernan via lists.openembedded=
.org
<alex.kiernan=3Dgmail.com@lists.openembedded.org> wrote:

> asyncio Varlink binding with file-descriptor passing; interfaces are
> derived from annotated Python classes.
>
> AI-Generated: Claude Opus 5 (Claude Code)
> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> ---
>  .../packagegroups/packagegroup-meta-python.bb  |  1 +
>  .../python/python3-asyncvarlink_0.3.2.bb       | 18 ++++++++++++++++++
>  2 files changed, 19 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/
> python3-asyncvarlink_0.3.2.bb
>
> diff --git a/meta-python/recipes-core/packagegroups/
> packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/
> packagegroup-meta-python.bb
> index d9a91512763e..9d07fc44e27a 100644
> --- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> +++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> @@ -39,6 +39,7 @@ RDEPENDS:packagegroup-meta-python3 =3D "\
>      python3-asttokens \
>      python3-async-timeout \
>      python3-asyncio-glib \
> +    python3-asyncvarlink \
>      python3-attr \
>      python3-autobahn \
>      python3-automat \
> diff --git a/meta-python/recipes-devtools/python/
> python3-asyncvarlink_0.3.2.bb b/meta-python/recipes-devtools/python/
> python3-asyncvarlink_0.3.2.bb
> new file mode 100644
> index 000000000000..abbe50cab342
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-asyncvarlink_0.3.2.bb
> @@ -0,0 +1,18 @@
> +SUMMARY =3D "asyncio-compatible, type-driven Varlink implementation"
> +DESCRIPTION =3D "An asyncio Varlink binding supporting file-descriptor
> passing, \
> +with interfaces derived from annotated Python classes."
> +HOMEPAGE =3D "https://github.com/helmutg/asyncvarlink"
> +SECTION =3D "devel/python"
> +
> +LICENSE =3D "LGPL-2.0-or-later"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D9ec28527f3d544b51ceb0e1907d0b=
f3f"
> +
> +inherit python_flit_core
> +
> +RDEPENDS:${PN} =3D "\
> +    python3-asyncio \
> +    python3-core \
> +    python3-io \
> +    python3-json \
> +    python3-logging \
> +"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#130427):
> https://lists.openembedded.org/g/openembedded-devel/message/130427
> Mute This Topic: https://lists.openembedded.org/mt/121468542/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000053182c065c8e5fc3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">its seems to have=C2=A0<a href=3D"https://github.com/helmu=
tg/asyncvarlink/tree/main/tests">https://github.com/helmutg/asyncvarlink/tr=
ee/main/tests</a> please work on adding these as a ptest package=C2=A0</div=
><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" clas=
s=3D"gmail_attr">On Mon, Sep 28, 2026 at 2:22=E2=80=AFAM Alex Kiernan via <=
a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;ale=
x.kiernan=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@l=
ists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">asyncio Varlink binding with file-descriptor passing; =
interfaces are<br>
derived from annotated Python classes.<br>
<br>
AI-Generated: Claude Opus 5 (Claude Code)<br>
Signed-off-by: Alex Kiernan &lt;<a href=3D"mailto:alex.kiernan@gmail.com" t=
arget=3D"_blank">alex.kiernan@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../packagegroups/<a href=3D"http://packagegroup-meta-python.bb" rel=
=3D"noreferrer" target=3D"_blank">packagegroup-meta-python.bb</a>=C2=A0 |=
=C2=A0 1 +<br>
=C2=A0.../python/<a href=3D"http://python3-asyncvarlink_0.3.2.bb" rel=3D"no=
referrer" target=3D"_blank">python3-asyncvarlink_0.3.2.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 18 ++++++++++++++++++<br>
=C2=A02 files changed, 19 insertions(+)<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/<a href=3D"htt=
p://python3-asyncvarlink_0.3.2.bb" rel=3D"noreferrer" target=3D"_blank">pyt=
hon3-asyncvarlink_0.3.2.bb</a><br>
<br>
diff --git a/meta-python/recipes-core/packagegroups/<a href=3D"http://packa=
gegroup-meta-python.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-m=
eta-python.bb</a> b/meta-python/recipes-core/packagegroups/<a href=3D"http:=
//packagegroup-meta-python.bb" rel=3D"noreferrer" target=3D"_blank">package=
group-meta-python.bb</a><br>
index d9a91512763e..9d07fc44e27a 100644<br>
--- a/meta-python/recipes-core/packagegroups/<a href=3D"http://packagegroup=
-meta-python.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-meta-pyt=
hon.bb</a><br>
+++ b/meta-python/recipes-core/packagegroups/<a href=3D"http://packagegroup=
-meta-python.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-meta-pyt=
hon.bb</a><br>
@@ -39,6 +39,7 @@ RDEPENDS:packagegroup-meta-python3 =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0python3-asttokens \<br>
=C2=A0 =C2=A0 =C2=A0python3-async-timeout \<br>
=C2=A0 =C2=A0 =C2=A0python3-asyncio-glib \<br>
+=C2=A0 =C2=A0 python3-asyncvarlink \<br>
=C2=A0 =C2=A0 =C2=A0python3-attr \<br>
=C2=A0 =C2=A0 =C2=A0python3-autobahn \<br>
=C2=A0 =C2=A0 =C2=A0python3-automat \<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
asyncvarlink_0.3.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-asyncva=
rlink_0.3.2.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://=
python3-asyncvarlink_0.3.2.bb" rel=3D"noreferrer" target=3D"_blank">python3=
-asyncvarlink_0.3.2.bb</a><br>
new file mode 100644<br>
index 000000000000..abbe50cab342<br>
--- /dev/null<br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-asyncva=
rlink_0.3.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-asyncvarlink_0=
.3.2.bb</a><br>
@@ -0,0 +1,18 @@<br>
+SUMMARY =3D &quot;asyncio-compatible, type-driven Varlink implementation&q=
uot;<br>
+DESCRIPTION =3D &quot;An asyncio Varlink binding supporting file-descripto=
r passing, \<br>
+with interfaces derived from annotated Python classes.&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://github.com/helmutg/asyncvarlink" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/helmutg/asyncvarlink</=
a>&quot;<br>
+SECTION =3D &quot;devel/python&quot;<br>
+<br>
+LICENSE =3D &quot;LGPL-2.0-or-later&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D9ec28527f3d544b51ceb0e1907=
d0bf3f&quot;<br>
+<br>
+inherit python_flit_core<br>
+<br>
+RDEPENDS:${PN} =3D &quot;\<br>
+=C2=A0 =C2=A0 python3-asyncio \<br>
+=C2=A0 =C2=A0 python3-core \<br>
+=C2=A0 =C2=A0 python3-io \<br>
+=C2=A0 =C2=A0 python3-json \<br>
+=C2=A0 =C2=A0 python3-logging \<br>
+&quot;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#130427): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/130427" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/130427</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/121468542/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/121468542/1997914</a><br>
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

--00000000000053182c065c8e5fc3--

