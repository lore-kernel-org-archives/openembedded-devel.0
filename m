Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05343CDB47C
	for <webhook@archiver.kernel.org>; Fri, 14 Nov 2025 03:04:46 +0000 (UTC)
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9890.1763089476461931609
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Nov 2025 19:04:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Qj1RPtAg;
 spf=pass (domain: gmail.com, ip: 74.125.224.47, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-641e4744e59so824675d50.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 19:04:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763089475; x=1763694275; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cuvxlrHyMvgP4t2aat2w1vnptseqRcwrVkrJyQxeU30=;
        b=Qj1RPtAgaFlqjP+t72mMyXO9Vzd3UfAk6CF6ZgV3A3ygfFW1pRymUPD8RbTeEsoq8C
         Hj9h87gCrlc9hbvuFAnjnPyUT0XJfkasjLrYaIwyqZCxUHcsHivRdC5uAAPEsPhBd8+H
         vtbP2rYuwcMB/WZmvWoCL05wirqNpwWGaRCZrOuDMsswcBK6IW0ZzLH4kXpWMWH0qBwH
         jwFPzGeBAH75K7MfOgSTTcBYFlwkrE2FyE6ihHw+oju+/asgBi0uiiRNuO7Q0grYam69
         NgTBRXjJ6Y/pbmvQBiBZve1VIWxtU65nSR6VFJVXGlOhJFkDCy56fwWcEZPyP77Oh+x9
         maZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763089475; x=1763694275;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cuvxlrHyMvgP4t2aat2w1vnptseqRcwrVkrJyQxeU30=;
        b=doGwmlpt+7zrBX23+GMTh0/i5XL4LkKDVOAznqeo6fgELTti5h6D26Da4p7403n3Na
         WOn3kUTsUzMwrcPQ7p68Ur/JXGowVbL/g3s7i6CvFAaqHZmlXfDx80CwoNMIEd3C7m+t
         YCITz8231mGFR/klYLr4trE17b59guxYtaKZ3G7RDKMWyWTS6anz4TGGXhw7MxGlnFUp
         xdae4mvMDGHbU1Wf9y3dmknG8xV5f9kEgRayPtOjiCxJl1+aP0ildMAEiIHDpc6o8CqL
         8DvmLMhjYdKJwZZg9pAE2XncjDtviJXYpKtoKY6eavddKOukPjuDsUQ6R4tL38fCovcL
         fByA==
X-Gm-Message-State: AOJu0YzqjuiDvAMe1hdit0qTpJqHXDoVh2+YUE7UM6eg9SIbAKYfLahs
	XGA2UhJVii/+rGV3jkTipdf2U9uBRkk6wx014dczFim+51KCUEyKu0H58Zk8KAAVIdPBu0VcCgk
	O3EckXQiyh7U7YsUlvrHCwMgSY6PFSwI=
X-Gm-Gg: ASbGncsAlfWgPC0H3aNgNqVISV5WVl8KrFT9dkyXK9Obun406YJdowQOwj42/etdQ7p
	nd5elwpTmYv4RtYWDLUdWzbfd6nH/158BzVBDyljy9JtXbk5ht6ngVjb78s6+RSuLYxOcOYxEtp
	lU6A/geItK5ffxO6ZUbBJSKH2K/KQBipSnPDxsDTtQXPj8SMzsuY2nbUh1qZKE9vzIz+k9CEY3t
	LzWxjsBXbTxllJC1R21rZrH6wnNFNU4vXmXuVaGL+93n+Qjd3sQ0mMRp4FX10itNf347Og4fFWE
	r3IahgzCPmiOXINx95bsJCyDHqLz3+QMuc7YmuitnNc8Pd0PUrGOh5/1kqHwEVW4ptyhcg6hRPz
	00WJ4rHEH3enCPnHt7UVvTiRBK1y0VOJUpExGivIQJ+jbOQ+0SI5rQyFP
X-Google-Smtp-Source: AGHT+IHDacBbCHyErWGVFaopgGX+STl+3T9M5bh8wVzQhNc3iJ6cEo5neMGIHPB662QkLks7Y0TNx31K+69uFpnopOk=
X-Received: by 2002:a53:c04a:0:10b0:640:6d2f:468d with SMTP id
 956f58d0204a3-641e76a1556mr1230190d50.43.1763089475469; Thu, 13 Nov 2025
 19:04:35 -0800 (PST)
MIME-Version: 1.0
References: <20251114023522.1449515-1-alistair.francis@wdc.com>
In-Reply-To: <20251114023522.1449515-1-alistair.francis@wdc.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 13 Nov 2025 19:04:08 -0800
X-Gm-Features: AWmQ_bn_i_MoaL-YYRcqE4X-4kW38EFFNVkPg2PL-KdC1yhBRJo78kQWAJSHgZE
Message-ID: <CAMKF1so-KwnHxBU6Bf5N1muRZ4MS4mo=9h13YqUpbXPyeS9iLg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] libspdm: upgrade 3.7.0 -> 3.8.1
To: alistair23@gmail.com
Cc: openembedded-devel@lists.openembedded.org, Archana.Kakani@ibm.com, 
	Alistair Francis <alistair.francis@wdc.com>
Content-Type: multipart/alternative; boundary="000000000000e4861206438541a9"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Nov 2025 03:04:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121675

--000000000000e4861206438541a9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Please rebase it on the latest master-next and resend.

On Thu, Nov 13, 2025 at 6:35=E2=80=AFPM Alistair Francis via lists.openembe=
dded.org
<alistair23=3Dgmail.com@lists.openembedded.org> wrote:

> From: Alistair Francis <alistair.francis@wdc.com>
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  ...port-API-introduced-in-openssl-3.5.0.patch | 33 -------------------
>  .../{libspdm_3.7.0.bb =3D> libspdm_3.8.1.bb}    |  6 ++--
>  2 files changed, 2 insertions(+), 37 deletions(-)
>  delete mode 100644
> meta-oe/recipes-support/libspdm/libspdm/0001-Backport-API-introduced-in-o=
penssl-3.5.0.patch
>  rename meta-oe/recipes-support/libspdm/{libspdm_3.7.0.bb =3D>
> libspdm_3.8.1.bb} (92%)
>
> diff --git
> a/meta-oe/recipes-support/libspdm/libspdm/0001-Backport-API-introduced-in=
-openssl-3.5.0.patch
> b/meta-oe/recipes-support/libspdm/libspdm/0001-Backport-API-introduced-in=
-openssl-3.5.0.patch
> deleted file mode 100644
> index 2df9a18c68..0000000000
> ---
> a/meta-oe/recipes-support/libspdm/libspdm/0001-Backport-API-introduced-in=
-openssl-3.5.0.patch
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -From 92f6c3d8fa26d9019ba27e0c1aa894517ada93b9 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Fri, 11 Apr 2025 17:47:05 -0700
> -Subject: [PATCH] Backport API introduced in openssl 3.5.0
> -
> -This commit [1] introduced this new API which is used by pem.h from
> -openssl and it should be provided by asn1.h which is vendored here so
> -it goes out of sync and causes build errors e.g
> -
> -In file included from ./os_stub/cryptlib_openssl/pk/x509.c:18:
> -/usr/include/openssl/pem.h:399:28: error: unknown type name
> 'OSSL_i2d_of_void_ctx'
> -  399 | int PEM_ASN1_write_bio_ctx(OSSL_i2d_of_void_ctx *i2d, void *vctx=
,
> -
> -[1]
> https://github.com/openssl/openssl/commit/35f6e7ea02b599d5aaf220b4720cbad=
d946d8023
> -
> -Upstream-Status: Submitted [https://github.com/DMTF/libspdm/pull/3033]
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - os_stub/openssllib/openssl_gen/openssl/asn1.h | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/os_stub/openssllib/openssl_gen/openssl/asn1.h
> b/os_stub/openssllib/openssl_gen/openssl/asn1.h
> -index a90152ee..fcfbe42e 100644
> ---- a/os_stub/openssllib/openssl_gen/openssl/asn1.h
> -+++ b/os_stub/openssllib/openssl_gen/openssl/asn1.h
> -@@ -368,6 +368,7 @@ typedef struct ASN1_VALUE_st ASN1_VALUE;
> -
> - typedef void *d2i_of_void(void **, const unsigned char **, long);
> - typedef int i2d_of_void(const void *, unsigned char **);
> -+typedef int OSSL_i2d_of_void_ctx(const void *, unsigned char **, void
> *vctx);
> -
> - /*-
> -  * The following macros and typedefs allow an ASN1_ITEM
> diff --git a/meta-oe/recipes-support/libspdm/libspdm_3.7.0.bb
> b/meta-oe/recipes-support/libspdm/libspdm_3.8.1.bb
> similarity index 92%
> rename from meta-oe/recipes-support/libspdm/libspdm_3.7.0.bb
> rename to meta-oe/recipes-support/libspdm/libspdm_3.8.1.bb
> index c6bbd1716b..431eb8fd40 100644
> --- a/meta-oe/recipes-support/libspdm/libspdm_3.7.0.bb
> +++ b/meta-oe/recipes-support/libspdm/libspdm_3.8.1.bb
> @@ -9,10 +9,8 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE.md;md5=3D8f9b59a81a88da8e812af43728b72dd7"
>
>  DEPENDS =3D "openssl"
>
> -SRC_URI =3D "git://github.com/DMTF/libspdm.git;branch=3Dmain;protocol=3D=
https \
> -           file://0001-Backport-API-introduced-in-openssl-3.5.0.patch"
> -SRCREV =3D "1be116c7b7713fa9003e1bd53b53a34758549eb9"
> -
> +SRC_URI =3D "git://
> github.com/DMTF/libspdm.git;branch=3Drelease-3.8;protocol=3Dhttps"
> +SRCREV =3D "d7c8c8247b4d0bd8ed75d9f35a558a4df173a4c7"
>
>  inherit cmake
>
> --
> 2.51.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#121669):
> https://lists.openembedded.org/g/openembedded-devel/message/121669
> Mute This Topic: https://lists.openembedded.org/mt/116286670/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000e4861206438541a9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Please rebase it on the latest master-next and resend.</di=
v><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">On Thu, Nov 13, 2025 at 6:35=E2=80=AFPM Alistair Francis =
via <a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &l=
t;alistair23=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.co=
m@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">From: Alistair Francis &lt;<a href=3D"mailto:alista=
ir.francis@wdc.com" target=3D"_blank">alistair.francis@wdc.com</a>&gt;<br>
<br>
Signed-off-by: Alistair Francis &lt;<a href=3D"mailto:alistair.francis@wdc.=
com" target=3D"_blank">alistair.francis@wdc.com</a>&gt;<br>
---<br>
=C2=A0...port-API-introduced-in-openssl-3.5.0.patch | 33 ------------------=
-<br>
=C2=A0.../{<a href=3D"http://libspdm_3.7.0.bb" rel=3D"noreferrer" target=3D=
"_blank">libspdm_3.7.0.bb</a> =3D&gt; <a href=3D"http://libspdm_3.8.1.bb" r=
el=3D"noreferrer" target=3D"_blank">libspdm_3.8.1.bb</a>}=C2=A0 =C2=A0 |=C2=
=A0 6 ++--<br>
=C2=A02 files changed, 2 insertions(+), 37 deletions(-)<br>
=C2=A0delete mode 100644 meta-oe/recipes-support/libspdm/libspdm/0001-Backp=
ort-API-introduced-in-openssl-3.5.0.patch<br>
=C2=A0rename meta-oe/recipes-support/libspdm/{<a href=3D"http://libspdm_3.7=
.0.bb" rel=3D"noreferrer" target=3D"_blank">libspdm_3.7.0.bb</a> =3D&gt; <a=
 href=3D"http://libspdm_3.8.1.bb" rel=3D"noreferrer" target=3D"_blank">libs=
pdm_3.8.1.bb</a>} (92%)<br>
<br>
diff --git a/meta-oe/recipes-support/libspdm/libspdm/0001-Backport-API-intr=
oduced-in-openssl-3.5.0.patch b/meta-oe/recipes-support/libspdm/libspdm/000=
1-Backport-API-introduced-in-openssl-3.5.0.patch<br>
deleted file mode 100644<br>
index 2df9a18c68..0000000000<br>
--- a/meta-oe/recipes-support/libspdm/libspdm/0001-Backport-API-introduced-=
in-openssl-3.5.0.patch<br>
+++ /dev/null<br>
@@ -1,33 +0,0 @@<br>
-From 92f6c3d8fa26d9019ba27e0c1aa894517ada93b9 Mon Sep 17 00:00:00 2001<br>
-From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank"=
>raj.khem@gmail.com</a>&gt;<br>
-Date: Fri, 11 Apr 2025 17:47:05 -0700<br>
-Subject: [PATCH] Backport API introduced in openssl 3.5.0<br>
-<br>
-This commit [1] introduced this new API which is used by pem.h from<br>
-openssl and it should be provided by asn1.h which is vendored here so<br>
-it goes out of sync and causes build errors e.g<br>
-<br>
-In file included from ./os_stub/cryptlib_openssl/pk/x509.c:18:<br>
-/usr/include/openssl/pem.h:399:28: error: unknown type name &#39;OSSL_i2d_=
of_void_ctx&#39;<br>
-=C2=A0 399 | int PEM_ASN1_write_bio_ctx(OSSL_i2d_of_void_ctx *i2d, void *v=
ctx,<br>
-<br>
-[1] <a href=3D"https://github.com/openssl/openssl/commit/35f6e7ea02b599d5a=
af220b4720cbadd946d8023" rel=3D"noreferrer" target=3D"_blank">https://githu=
b.com/openssl/openssl/commit/35f6e7ea02b599d5aaf220b4720cbadd946d8023</a><b=
r>
-<br>
-Upstream-Status: Submitted [<a href=3D"https://github.com/DMTF/libspdm/pul=
l/3033" rel=3D"noreferrer" target=3D"_blank">https://github.com/DMTF/libspd=
m/pull/3033</a>]<br>
-Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
----<br>
- os_stub/openssllib/openssl_gen/openssl/asn1.h | 1 +<br>
- 1 file changed, 1 insertion(+)<br>
-<br>
-diff --git a/os_stub/openssllib/openssl_gen/openssl/asn1.h b/os_stub/opens=
sllib/openssl_gen/openssl/asn1.h<br>
-index a90152ee..fcfbe42e 100644<br>
---- a/os_stub/openssllib/openssl_gen/openssl/asn1.h<br>
-+++ b/os_stub/openssllib/openssl_gen/openssl/asn1.h<br>
-@@ -368,6 +368,7 @@ typedef struct ASN1_VALUE_st ASN1_VALUE;<br>
- <br>
- typedef void *d2i_of_void(void **, const unsigned char **, long);<br>
- typedef int i2d_of_void(const void *, unsigned char **);<br>
-+typedef int OSSL_i2d_of_void_ctx(const void *, unsigned char **, void *vc=
tx);<br>
- <br>
- /*-<br>
-=C2=A0 * The following macros and typedefs allow an ASN1_ITEM<br>
diff --git a/meta-oe/recipes-support/libspdm/<a href=3D"http://libspdm_3.7.=
0.bb" rel=3D"noreferrer" target=3D"_blank">libspdm_3.7.0.bb</a> b/meta-oe/r=
ecipes-support/libspdm/<a href=3D"http://libspdm_3.8.1.bb" rel=3D"noreferre=
r" target=3D"_blank">libspdm_3.8.1.bb</a><br>
similarity index 92%<br>
rename from meta-oe/recipes-support/libspdm/<a href=3D"http://libspdm_3.7.0=
.bb" rel=3D"noreferrer" target=3D"_blank">libspdm_3.7.0.bb</a><br>
rename to meta-oe/recipes-support/libspdm/<a href=3D"http://libspdm_3.8.1.b=
b" rel=3D"noreferrer" target=3D"_blank">libspdm_3.8.1.bb</a><br>
index c6bbd1716b..431eb8fd40 100644<br>
--- a/meta-oe/recipes-support/libspdm/<a href=3D"http://libspdm_3.7.0.bb" r=
el=3D"noreferrer" target=3D"_blank">libspdm_3.7.0.bb</a><br>
+++ b/meta-oe/recipes-support/libspdm/<a href=3D"http://libspdm_3.8.1.bb" r=
el=3D"noreferrer" target=3D"_blank">libspdm_3.8.1.bb</a><br>
@@ -9,10 +9,8 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE.md;md5=3D8f9b59a=
81a88da8e812af43728b72dd7&quot;<br>
<br>
=C2=A0DEPENDS =3D &quot;openssl&quot;<br>
<br>
-SRC_URI =3D &quot;git://<a href=3D"http://github.com/DMTF/libspdm.git;bran=
ch=3Dmain;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">github.com=
/DMTF/libspdm.git;branch=3Dmain;protocol=3Dhttps</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Backport-API-introduc=
ed-in-openssl-3.5.0.patch&quot;<br>
-SRCREV =3D &quot;1be116c7b7713fa9003e1bd53b53a34758549eb9&quot;<br>
-<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/DMTF/libspdm.git;bran=
ch=3Drelease-3.8;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">git=
hub.com/DMTF/libspdm.git;branch=3Drelease-3.8;protocol=3Dhttps</a>&quot;<br=
>
+SRCREV =3D &quot;d7c8c8247b4d0bd8ed75d9f35a558a4df173a4c7&quot;<br>
<br>
=C2=A0inherit cmake<br>
<br>
-- <br>
2.51.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#121669): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/121669" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/121669</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/116286670/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/116286670/1997914</a><br>
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

--000000000000e4861206438541a9--

