Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36A38F436B7
	for <webhook@archiver.kernel.org>; Fri, 17 Apr 2026 15:19:50 +0000 (UTC)
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.47664.1776439185831666951
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Apr 2026 08:19:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=C5g8WpDj;
 spf=pass (domain: gmail.com, ip: 74.125.224.52, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-6501725d888so692961d50.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Apr 2026 08:19:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776439185; cv=none;
        d=google.com; s=arc-20240605;
        b=b2vJa72Q8X0CScS4O+P3PMaNv/AtB3mjqFXNFFIHCSQVOMAdbJXFAWJe/VhkfCb7Jo
         WIqrEakHt7vepC2mQmaLaLCaSsMljHWfenF0UPgzTgwmiV4XHJA07X1P4M6+7bG6J2pW
         jRLDnk0yJ7/AHneFGQott0BQIOJOGu3Gec0bBVRsa96RAvZxER0F+Wd9WDPlxUf9BrWh
         /P4MqEYxoA0X4H8nEyiOvXrEmN0ZidRSYFVGIuyMgtNqngescWdVIZVHrAwA77MS3N4E
         zPQlIJS34q0Uvjx+AL13WZokXkMuJhDHA8ANh028XmpPNOdStm0jN3WRfeR4x8CtWap4
         Nn1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=XMKmock5qKihGCj+h9wlJdb5ylJj/T/76yy9xFY+7OI=;
        fh=EqurzkJrV3YerIRHUmOhagtt9RyNYC/y4+Wee4x+VWM=;
        b=BMaLoXLaZjhvtHfvINx4RTsXiI5T8pXtCkWxoZPMsoB4dDO9wJX6xZ01Sf5ZJaNxON
         7AT2sxyMAm1kWqWG6v/0oLIWdasawADoFCQBYvgaAA2uDcDrixiD7UJmrCLTAzQuUVt/
         NfpOeCOfTBUaFQF1sXXC6O6Io3g3FAJUgUkrSC8i9L247YFP4vijLsWzK1aCcp607W1i
         5P/cxfI7KvIURmJz5zqZQG88JPACp0bHkuJXbIwghHATZdKWEfjmK1qn1uQysjP8AiBT
         sM0eUxfpwHiUkc/RqXJiqYykJ2C03PiBL6ZpOb09K1EheIseCZHC4wGDsvyqz7opzg9P
         b/gA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776439185; x=1777043985; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XMKmock5qKihGCj+h9wlJdb5ylJj/T/76yy9xFY+7OI=;
        b=C5g8WpDjZQkXlzeaj8W1BiDVlMDINyJWGs6wFefFJXcyZcKW2mM9dHR/5RQcT+hvdB
         M/UTXXmqNB/jadmxnNkyE64CRcMKshNbWuAord8fXZMyiAZ+zSyHHh9PXRCGv84Ux0jd
         clyVuakWQ7O6Bc9SmmnyKxHnocr4ebe/SvyEuMpJx7W6eNqPyWxhoLPM+F+2C4SsEd8W
         oab2AXMx8u1hzLzeHTydBVUiILS7H5XQUq5Bvgs0UtqgTU3pyL2qByg1Z8195OnnBcRM
         1PUxFihRPQ63KI+MhywSvtAXagyrrP0qSnLLPMzpkiXnjh9V2ZxK/l2cadIeCEdXWjRX
         ktRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776439185; x=1777043985;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XMKmock5qKihGCj+h9wlJdb5ylJj/T/76yy9xFY+7OI=;
        b=HoQLBTlTWyewSo4c+iBrY8lAaIFHOAt3IPLBlrgv0qau+hFL7I2+qhrXuXKsgdixYa
         u4+U4PzgXMCy5sm/CTY5NWQrDnadKHBNxFOsDcI8xvlWJdLNmlQ7/eE+NJznujwSpLbK
         zddgu8WjMdj3Fitzv4ZfFmBmk9fUauzxrIp02L1zVhzq++fcfm8qtbeDcCBQx+M/NXr1
         D40iwXqIoDB7x2jOEx0dHjx87jKeSMWUoq52MAzPvwADsecwV94G6EXdwaosh75Q9N4t
         PUwxzZ5JRUu+wPvaQoItEnftWGNIoQihUg+eKd94h57qyhiTzVOCWQfxgwxXA4kYfyv1
         Xu1w==
X-Gm-Message-State: AOJu0Yy4KEaZB8Sn7v2RnxTyf7dIzAClGNP6oxxMLUVEkPNbAQM8/LFG
	obLglaaTtWjS+x/trUEDwMKyKVGyz9P1M4MDdDiXSUM56C4G6J1NyW/cSVMUK0idxH7+nFcbDhb
	75SNr4E3PC4vWn2oej6IYhY5GZZaYieM=
X-Gm-Gg: AeBDiesx8+ZzIDzEt0ER5ClEK8X6nDq2k6bShg0FK6frvwkEcYBSVK+4znB+y+eqllf
	5vNsHWuxTMCD2ThM/P9SppSJqpwTaHw7djDq+C3pnfFISYp4Tecj7avTI6jkHVSxlPgyXTcGvk4
	iegekJXz8COYB9nb7SjbYVMBaXyQsfkF+ilXtTmKHZX+3o35k0CNcFcu++2opIz+4rqy1p2uoMc
	TfKVE46tNi6FYxl1CiQwjeHGa9icKVXVmIXVLYFcfAWluGeIdGla4kOSHJqJCRoUkDeowp8ATVC
	9ThMSPqHLZBPXKwsHWR2QMZJ0ykS012s8rkvZN+za0KYrprRD3nFuNMukqKC8kAq5PYXGMhvCdr
	JDKp2dcqn4tGpSUsPs71lvtWvfyck32xE4CvTtOVyqWetQEgNj+qOI5FYdRNLvRknU4pxdQwxBu
	6ZgqTWmVnuEzOZ0Ss=
X-Received: by 2002:a05:690e:d02:b0:652:e60a:17a6 with SMTP id
 956f58d0204a3-65314f8f9b7mr2536371d50.49.1776439184720; Fri, 17 Apr 2026
 08:19:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260416191754.3910026-1-hfranco@baylibre.com>
In-Reply-To: <20260416191754.3910026-1-hfranco@baylibre.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 17 Apr 2026 08:19:18 -0700
X-Gm-Features: AQROBzDSRi00XijnjzKO1HxDogkVAeFyeXMSbY8wSLaHJUSmYGAkVhZ2fnTDxx0
Message-ID: <CAMKF1srxGmeaMoWoyd1L27rwLX52LjOvtqMTN1qG03JryXt7qQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] uutils-coreutils: make selinux
 PACKAGECONFIG dependend on clang-layer
To: hfranco@baylibre.com
Cc: openembedded-devel@lists.openembedded.org, 
	Trevor Gamblin <tgamblin@baylibre.com>
Content-Type: multipart/alternative; boundary="0000000000009204a9064fa97a63"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Apr 2026 15:19:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126444

--0000000000009204a9064fa97a63
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 16, 2026 at 12:18=E2=80=AFPM Hiago De Franco via lists.openembe=
dded.org
<hfranco=3Dbaylibre.com@lists.openembedded.org> wrote:

> SELinux layer build fails if 'meta-clang' is not present, which
> shouldn't happen, since 'meta-clang' isn't a dependency.
>
> If 'selinux' is on DISTRO_FEATURES, PACKAGECONFIG calls
> 'clang-native' even if uutils-coreutils is not being used (this is
> enough to make the recipe fails on parsing time if meta-clang is not
> present).
>
> Make 'selinux' PACKAGECONFIG dependend on clang-layer, and print a
> warning if the user wants selinux support o uutils-coreutils but haven't
> add clang-layer.
>
> Signed-off-by: Hiago De Franco <hfranco@baylibre.com>
> ---
>  .../uutils-coreutils/uutils-coreutils_0.8.0.bb       | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-core/uutils-coreutils/
> uutils-coreutils_0.8.0.bb b/meta-oe/recipes-core/uutils-coreutils/
> uutils-coreutils_0.8.0.bb
> index 8b9b4dc199..99beb70104 100644
> --- a/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.8.0.bb
> +++ b/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.8.0.bb
> @@ -18,7 +18,17 @@ require ${BPN}-crates.inc
>  PROVIDES =3D "coreutils"
>  RPROVIDES:${PN} =3D "coreutils"
>
> -PACKAGECONFIG ?=3D "${@bb.utils.filter('DISTRO_FEATURES', 'selinux
> systemd', d)}"
> +PACKAGECONFIG ?=3D "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}=
"
> +# This is required since uutils-coreutils uses selinux features that
> require clang-layer
> +python __anonymous() {
> +    if bb.utils.contains('DISTRO_FEATURES', 'selinux', True, False, d):
> +        if bb.utils.contains('BBFILE_COLLECTIONS', 'clang-layer', True,
> False, d):
> +            d.appendVar('PACKAGECONFIG', ' selinux')
> +        else:
> +            bb.warn("selinux is enabled but clang-layer is not in
> BBFILE_COLLECTIONS, "
> +                "selinux support will be disabled. Add meta-clang to you=
r
> bblayers.conf "
> +                "if selinux support on uutils-coreutils is required.")
> +}
>

what does it need from meta-clang these days, we have merged clang compiler
infrastructure in
core layer on master.


>  PACKAGECONFIG[selinux] =3D "--features feat_selinux,,clang-native
> libselinux-native libselinux"
>  PACKAGECONFIG[systemd] =3D "--features feat_systemd_logind,,systemd"
>
> --
> 2.51.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#126407):
> https://lists.openembedded.org/g/openembedded-devel/message/126407
> Mute This Topic: https://lists.openembedded.org/mt/118863961/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000009204a9064fa97a63
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Apr 16,=
 2026 at 12:18=E2=80=AFPM Hiago De Franco via <a href=3D"http://lists.opene=
mbedded.org">lists.openembedded.org</a> &lt;hfranco=3D<a href=3D"mailto:bay=
libre.com@lists.openembedded.org">baylibre.com@lists.openembedded.org</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">SELinu=
x layer build fails if &#39;meta-clang&#39; is not present, which<br>
shouldn&#39;t happen, since &#39;meta-clang&#39; isn&#39;t a dependency.<br=
>
<br>
If &#39;selinux&#39; is on DISTRO_FEATURES, PACKAGECONFIG calls<br>
&#39;clang-native&#39; even if uutils-coreutils is not being used (this is<=
br>
enough to make the recipe fails on parsing time if meta-clang is not<br>
present).<br>
<br>
Make &#39;selinux&#39; PACKAGECONFIG dependend on clang-layer, and print a<=
br>
warning if the user wants selinux support o uutils-coreutils but haven&#39;=
t<br>
add clang-layer.<br>
<br>
Signed-off-by: Hiago De Franco &lt;<a href=3D"mailto:hfranco@baylibre.com" =
target=3D"_blank">hfranco@baylibre.com</a>&gt;<br>
---<br>
=C2=A0.../uutils-coreutils/<a href=3D"http://uutils-coreutils_0.8.0.bb" rel=
=3D"noreferrer" target=3D"_blank">uutils-coreutils_0.8.0.bb</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 12 +++++++++++-<br>
=C2=A01 file changed, 11 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta-oe/recipes-core/uutils-coreutils/<a href=3D"http://uutils=
-coreutils_0.8.0.bb" rel=3D"noreferrer" target=3D"_blank">uutils-coreutils_=
0.8.0.bb</a> b/meta-oe/recipes-core/uutils-coreutils/<a href=3D"http://uuti=
ls-coreutils_0.8.0.bb" rel=3D"noreferrer" target=3D"_blank">uutils-coreutil=
s_0.8.0.bb</a><br>
index 8b9b4dc199..99beb70104 100644<br>
--- a/meta-oe/recipes-core/uutils-coreutils/<a href=3D"http://uutils-coreut=
ils_0.8.0.bb" rel=3D"noreferrer" target=3D"_blank">uutils-coreutils_0.8.0.b=
b</a><br>
+++ b/meta-oe/recipes-core/uutils-coreutils/<a href=3D"http://uutils-coreut=
ils_0.8.0.bb" rel=3D"noreferrer" target=3D"_blank">uutils-coreutils_0.8.0.b=
b</a><br>
@@ -18,7 +18,17 @@ require ${BPN}-crates.inc<br>
=C2=A0PROVIDES =3D &quot;coreutils&quot;<br>
=C2=A0RPROVIDES:${PN} =3D &quot;coreutils&quot;<br>
<br>
-PACKAGECONFIG ?=3D &quot;${@bb.utils.filter(&#39;DISTRO_FEATURES&#39;, &#3=
9;selinux systemd&#39;, d)}&quot;<br>
+PACKAGECONFIG ?=3D &quot;${@bb.utils.filter(&#39;DISTRO_FEATURES&#39;, &#3=
9;systemd&#39;, d)}&quot;<br>
+# This is required since uutils-coreutils uses selinux features that requi=
re clang-layer<br>
+python __anonymous() {<br>
+=C2=A0 =C2=A0 if bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;selinux=
&#39;, True, False, d):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if bb.utils.contains(&#39;BBFILE_COLLECTIONS&#=
39;, &#39;clang-layer&#39;, True, False, d):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.appendVar(&#39;PACKAGECONFIG&#=
39;, &#39; selinux&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.warn(&quot;selinux is enabled=
 but clang-layer is not in BBFILE_COLLECTIONS, &quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;selinux supp=
ort will be disabled. Add meta-clang to your bblayers.conf &quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;if selinux s=
upport on uutils-coreutils is required.&quot;)<br>
+}<br></blockquote><div><br></div><div>what does it need from meta-clang th=
ese days, we have merged clang compiler infrastructure in</div><div>core la=
yer on master.=C2=A0</div><div>=C2=A0</div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">
=C2=A0PACKAGECONFIG[selinux] =3D &quot;--features feat_selinux,,clang-nativ=
e libselinux-native libselinux&quot;<br>
=C2=A0PACKAGECONFIG[systemd] =3D &quot;--features feat_systemd_logind,,syst=
emd&quot;<br>
<br>
-- <br>
2.51.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#126407): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/126407" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/126407</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/118863961/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/118863961/1997914</a><br>
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

--0000000000009204a9064fa97a63--

