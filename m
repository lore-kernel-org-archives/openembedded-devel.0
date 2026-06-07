Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CC2ECD8C8C
	for <webhook@archiver.kernel.org>; Sun,  7 Jun 2026 22:06:12 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.41954.1780869963599751874
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Jun 2026 15:06:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=pX/HZNcQ;
 spf=pass (domain: gmail.com, ip: 209.85.128.176, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-7dc2b658544so31625127b3.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Jun 2026 15:06:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780869963; cv=none;
        d=google.com; s=arc-20240605;
        b=NsKawE6o91bvnM/JS8eqCnfVQ2s/rMYtmvkJCk32o75UETwZfwuy4XR0FcbeP6bZwv
         96bEsaOtPe9dBPpnKkH9plLLsNmhA9JZ2V/GZ1Tg3+uB3QqPKTXIsk0KekxcrEhX90cc
         /IdE9jp+PMmlUJ5aUZmoGoGg3HS+hjNBVa9YZ4j+ERqLypODUwyJPxZABKDXtIU7g+vw
         OjCJTVKEVsxGO5CaRttuhGRfqWwyyzY4kHdwvy6iYoeLaL2jJCSc2RQUc+E3LTkGXWOz
         yFIxaHpG4ouG9gF6PYYhfyJsngq6L0xM2Qac1fMDjw9pIP3sXjGdP3eHEYL0rL83amtP
         3ZBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=PyZoLEewR++N6X+CCjojETjyhIBTdj/2nDY4did5MM8=;
        fh=TKJj+TQbOfhIZO+HJtRVqEbv76mR7gPejKPp/8pTfkM=;
        b=WvM5MjLPEPOkPBg1EtK3CNzfSPm50aWiK383UvAgM8KIJeBtjbEOntxyh5N8oCehps
         k/Fc5cNLzCk7762xHswPY7nYBoQoGLsyWFUTFT6dx6F6fNhABTUvdmswPu5HwhVfkrxk
         BXdU5yQIZJWxTffGc5L/M3uG+H1Y1ETeAVcUcJXqrVp8mcNbqs6qCOv24xG7WcRkYBV7
         ayYBa9NC2OdFmUkkoJyQofKRt8/aIyO2ySB7OpgTIRT2SGd9laJiEZl0mhzJMqYN6FLb
         XtmhytxNiBdh+LbrryBpP6c6eMcyrBWy/3KqQOO6iN1Gx1Mt51xpuKe10bCiaxanyvTZ
         iJYw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780869963; x=1781474763; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PyZoLEewR++N6X+CCjojETjyhIBTdj/2nDY4did5MM8=;
        b=pX/HZNcQFJ+2xE7rSnbv4Y1r6NuYWk/DZXnZSJJ+fDAua08cQpSKO70e6ohTjE0SJW
         fTJQ7CrHIliP3VT3fLK/+1MQ+O6FcSXEOII0RraYyoqqRzNIRMYmXYT4V0FJZ9lZ8xI2
         IeARazFMFv5kmvg9L5JGwkDPHG9UXzWssnWL0XO/YwI6bP3CMhSceppC9/kGnsZQokvJ
         ZdVbK34H+8ghmusiP7yqdXlZ8PKwO7uVATWahgMI4sX+DCUQay7OK568LKtEDlvsAFYf
         jJ7fT8h1awZW2c3xePb1UaiiPtQLDg5z4cweevEGw6hgMKRUcDqRYzlXlADC20ERnmG3
         UcQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780869963; x=1781474763;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PyZoLEewR++N6X+CCjojETjyhIBTdj/2nDY4did5MM8=;
        b=YJQeCRPMnN1nY0QESWk4FQ57ka9B42JRDCcNAu+PI2cRjuEMqRnFrqYbmtxRaiVB/n
         W21emMorVR2VpaGaWpKIFgokDZv7ejRctlXjRAEjP6ZBhoLN9LJtjzwkJjBsz9M1OpUP
         X4fhNdmyWH+6zVDkWghjXNzas4l4LW8NmcvpizVPqQL3AizrcYeuOiMRZmAcYVr45sg/
         6bsK4W1seSXgsITK6JFq5nK3oMAWLIaNHCLXaGWTX9lHyBmWjB59YDVixdlsTk4I8Dfy
         OMV01Q40dim9hlSKVGZprUeJRytJdNjRZ5K6eFxwCgna5y3NDR+Ck2+zTeJ8rrHBoIdJ
         To5Q==
X-Gm-Message-State: AOJu0YwyMQLj/CrU8Mj+0hqQwYZTI84zDYbyNUUtpH7nNEB1pUdFrLMc
	2C8Va5MF8XM3KEXJ3GJo3lDYbBUx4Tv5gUjkhQNdKmn4JnthhEr3EY2ZOopAx3LN3WWxUPyt9P7
	jqqF8kKL6yoXdYQrlMg62H3PLs8CZSV0=
X-Gm-Gg: Acq92OEkdq1aw/M+S6wWVePAL9HnY5UASHjnQpOq0xLQXgVNa4lt41UY9YenctpsvCj
	0NP2Yey5A/5g8yhwR1sTcUzsqm5NXaXEMbynTRRjLY1Y6P3BKWR/4qWBl+kvdMsKZ1/7kvJX/GP
	BDEkQ7mKaKb+s3bUBEMZ2C8PRoruJfSnrdegadnMnBQltsJ90BodSSMjWHxX7fYIljWixTht5Da
	Rw2GWziXYeB6SbYbioQWSwlJDoTNSsNfkewDd8Ow1l8F/3dnEjfe+X4pHp/AYxgYw8//yw7c8hA
	Sujoo9iRiJW4GmdauRQ+TrgxGCghlIYqtNdGIhCXCBw7CuJy6x7YjDARVaQSRjZg/V0zd1EGZEh
	gj1l+9aHiIxI3T9c1zC3EI47nB0/I4qkcg4rPCAWqSwwJzTKiuTJ98UMRbpex6uxNc82I8LgPzm
	3/ZGN+q+E8LixDjic=
X-Received: by 2002:a05:690e:169e:b0:660:54e4:5db5 with SMTP id
 956f58d0204a3-66106fb3615mr11115376d50.56.1780869962568; Sun, 07 Jun 2026
 15:06:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260530070830.1495792-1-f_l_k@t-online.de>
In-Reply-To: <20260530070830.1495792-1-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 7 Jun 2026 15:05:49 -0700
X-Gm-Features: AVVi8CejvjlKlLxksRaaYAdsMYJ-KOKII9zztFeAyKIDaHvf1t4eTmAv0X4lv6o
Message-ID: <CAMKF1sphShgfxzjW8bHopbEbPkpFqmAj09UjdYDVNATH2MTq_Q@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] jsoncpp: add a backport patch to fix build
 with gcc16
To: Markus Volk <f_l_k@t-online.de>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000008296b80653b11950"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 07 Jun 2026 22:06:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127415

--0000000000008296b80653b11950
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I had to move the patch status tag to patch itself not the commit message

On Sat, May 30, 2026, 12:08=E2=80=AFAM Markus Volk via lists.openembedded.o=
rg
<f_l_k=3Dt-online.de@lists.openembedded.org> wrote:

> Partially backport
> https://github.com/open-source-parsers/jsoncpp/commit/71d46ca38e90dc902e8=
178ba484af4f27fa11947.patch
>
> This fixes build with gcc 16
>
> Upstream-Status: Backport [
> https://github.com/open-source-parsers/jsoncpp/commit/71d46ca38e90dc902e8=
178ba484af4f27fa11947
> ]
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  ...6ca38e90dc902e8178ba484af4f27fa11947.patch | 59 +++++++++++++++++++
>  .../recipes-devtools/jsoncpp/jsoncpp_1.9.7.bb |  1 +
>  2 files changed, 60 insertions(+)
>  create mode 100644
> meta-oe/recipes-devtools/jsoncpp/jsoncpp/71d46ca38e90dc902e8178ba484af4f2=
7fa11947.patch
>
> diff --git
> a/meta-oe/recipes-devtools/jsoncpp/jsoncpp/71d46ca38e90dc902e8178ba484af4=
f27fa11947.patch
> b/meta-oe/recipes-devtools/jsoncpp/jsoncpp/71d46ca38e90dc902e8178ba484af4=
f27fa11947.patch
> new file mode 100644
> index 0000000000..3f7ca7bd66
> --- /dev/null
> +++
> b/meta-oe/recipes-devtools/jsoncpp/jsoncpp/71d46ca38e90dc902e8178ba484af4=
f27fa11947.patch
> @@ -0,0 +1,59 @@
> +From 71d46ca38e90dc902e8178ba484af4f27fa11947 Mon Sep 17 00:00:00 2001
> +From: Jordan Bayles <bayles.jordan@gmail.com>
> +Date: Thu, 14 May 2026 15:57:53 -0700
> +Subject: [PATCH] fix: GCC 16 / C++20 build failure with u8 string litera=
ls
> + (#1685)
> +
> +* fix: GCC 16 / C++20 build failure with u8 string literals (#1684)
> +
> +In C++20, the `u8""` string literal prefix was changed to evaluate to
> `const char8_t[]` instead of `const char[]`. This caused compilation erro=
rs
> when these literals were implicitly converted to `std::string` or passed =
to
> functions expecting `const char*`.
> +
> +This commit adds `reinterpret_cast<const char*>` around the `u8` string
> literals in the test suite to resolve the build errors while maintaining
> the intended UTF-8 semantics.
> +
> +Additionally, this adds C++20 to the GitHub Actions CMake test matrix to
> ensure we don't regress on newer standards.
> +
> +Fixes #1684
> +
> +* style: run clang-format
> +---
> + .github/workflows/cmake.yml |  2 +-
> + src/test_lib_json/main.cpp  | 12 +++++++-----
> + 2 files changed, 8 insertions(+), 6 deletions(-)
> +
> +diff --git a/src/test_lib_json/main.cpp b/src/test_lib_json/main.cpp
> +index 501aba10e..08731f66a 100644
> +--- a/src/test_lib_json/main.cpp
> ++++ b/src/test_lib_json/main.cpp
> +@@ -1993,7 +1993,8 @@ JSONTEST_FIXTURE_LOCAL(ValueTest, StaticString) {
> +
> + JSONTEST_FIXTURE_LOCAL(ValueTest, WideString) {
> +   // https://github.com/open-source-parsers/jsoncpp/issues/756
> +-  const std::string uni =3D u8"\u5f0f\uff0c\u8fdb"; // "=E5=BC=8F=EF=BC=
=8C=E8=BF=9B"
> ++  const std::string uni =3D
> ++      reinterpret_cast<const char*>(u8"\u5f0f\uff0c\u8fdb"); // "=E5=BC=
=8F=EF=BC=8C=E8=BF=9B"
> +   std::string styled;
> +   {
> +     Json::Value v;
> +@@ -3109,9 +3110,9 @@ JSONTEST_FIXTURE_LOCAL(ReaderTest,
> strictModeParseNumber) {
> + }
> +
> + JSONTEST_FIXTURE_LOCAL(ReaderTest, parseChineseWithOneError) {
> +-  checkParse(R"({ "pr)"
> +-             u8"\u4f50\u85e4" // =E4=BD=90=E8=97=A4
> +-             R"(erty" :: "value" })",
> ++  checkParse(reinterpret_cast<const char*>(R"({ "pr)"
> ++                                           u8"\u4f50\u85e4" // =E4=BD=
=90=E8=97=A4
> ++                                           R"(erty" :: "value" })"),
> +              {{18, 19, "Syntax error: value, object or array
> expected."}},
> +              "* Line 1, Column 19\n  Syntax error: value, object or
> array "
> +              "expected.\n");
> +@@ -3223,7 +3224,8 @@ JSONTEST_FIXTURE_LOCAL(CharReaderTest, parseString=
)
> {
> +     bool ok =3D reader->parse(doc, doc + std::strlen(doc), &root, &errs=
);
> +     JSONTEST_ASSERT(ok);
> +     JSONTEST_ASSERT(errs.empty());
> +-    JSONTEST_ASSERT_EQUAL(u8"\u8A2a", root[0].asString()); // "=E8=A8=
=AA"
> ++    JSONTEST_ASSERT_EQUAL(reinterpret_cast<const char*>(u8"\u8A2a"),
> ++                          root[0].asString()); // "=E8=A8=AA"
> +   }
> +   {
> +     char const doc[] =3D R"([ "\uD801" ])";
> diff --git a/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.7.bb
> b/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.7.bb
> index 354f4e9115..bf91f8eff4 100644
> --- a/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.7.bb
> +++ b/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.7.bb
> @@ -16,6 +16,7 @@ PE =3D "1"
>  SRCREV =3D "3455302847cf1e4671f1d8f5fa953fd46a7b1404"
>  SRC_URI =3D "git://
> github.com/open-source-parsers/jsoncpp;branch=3Dmaster;protocol=3Dhttps;t=
ag=3D${PV}
> <http://github.com/open-source-parsers/jsoncpp;branch=3Dmaster;protocol=
=3Dhttps;tag=3D$%7BPV%7D>
> \
>
> file://0001-Fix-C-11-ABI-breakage-when-compiled-with-C-17-1668-1.patch \
> +           file://71d46ca38e90dc902e8178ba484af4f27fa11947.patch \
>             file://run-ptest \
>             "
>
> --
> 2.54.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#127292):
> https://lists.openembedded.org/g/openembedded-devel/message/127292
> Mute This Topic: https://lists.openembedded.org/mt/119559219/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000008296b80653b11950
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">I had to move the patch status tag to patch itself not th=
e commit message=C2=A0</div><br><div class=3D"gmail_quote gmail_quote_conta=
iner"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, May 30, 2026, 12:08=E2=
=80=AFAM Markus Volk via <a href=3D"http://lists.openembedded.org">lists.op=
enembedded.org</a> &lt;f_l_k=3D<a href=3D"mailto:t-online.de@lists.openembe=
dded.org">t-online.de@lists.openembedded.org</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">Partially backport <a href=3D"h=
ttps://github.com/open-source-parsers/jsoncpp/commit/71d46ca38e90dc902e8178=
ba484af4f27fa11947.patch" rel=3D"noreferrer noreferrer" target=3D"_blank">h=
ttps://github.com/open-source-parsers/jsoncpp/commit/71d46ca38e90dc902e8178=
ba484af4f27fa11947.patch</a><br>
<br>
This fixes build with gcc 16<br>
<br>
Upstream-Status: Backport [<a href=3D"https://github.com/open-source-parser=
s/jsoncpp/commit/71d46ca38e90dc902e8178ba484af4f27fa11947" rel=3D"noreferre=
r noreferrer" target=3D"_blank">https://github.com/open-source-parsers/json=
cpp/commit/71d46ca38e90dc902e8178ba484af4f27fa11947</a>]<br>
<br>
Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=
=3D"_blank" rel=3D"noreferrer">f_l_k@t-online.de</a>&gt;<br>
---<br>
=C2=A0...6ca38e90dc902e8178ba484af4f27fa11947.patch | 59 ++++++++++++++++++=
+<br>
=C2=A0.../recipes-devtools/jsoncpp/<a href=3D"http://jsoncpp_1.9.7.bb" rel=
=3D"noreferrer noreferrer" target=3D"_blank">jsoncpp_1.9.7.bb</a> |=C2=A0 1=
 +<br>
=C2=A02 files changed, 60 insertions(+)<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/jsoncpp/jsoncpp/71d46ca38=
e90dc902e8178ba484af4f27fa11947.patch<br>
<br>
diff --git a/meta-oe/recipes-devtools/jsoncpp/jsoncpp/71d46ca38e90dc902e817=
8ba484af4f27fa11947.patch b/meta-oe/recipes-devtools/jsoncpp/jsoncpp/71d46c=
a38e90dc902e8178ba484af4f27fa11947.patch<br>
new file mode 100644<br>
index 0000000000..3f7ca7bd66<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-devtools/jsoncpp/jsoncpp/71d46ca38e90dc902e8178ba484a=
f4f27fa11947.patch<br>
@@ -0,0 +1,59 @@<br>
+From 71d46ca38e90dc902e8178ba484af4f27fa11947 Mon Sep 17 00:00:00 2001<br>
+From: Jordan Bayles &lt;<a href=3D"mailto:bayles.jordan@gmail.com" target=
=3D"_blank" rel=3D"noreferrer">bayles.jordan@gmail.com</a>&gt;<br>
+Date: Thu, 14 May 2026 15:57:53 -0700<br>
+Subject: [PATCH] fix: GCC 16 / C++20 build failure with u8 string literals=
<br>
+ (#1685)<br>
+<br>
+* fix: GCC 16 / C++20 build failure with u8 string literals (#1684)<br>
+<br>
+In C++20, the `u8&quot;&quot;` string literal prefix was changed to evalua=
te to `const char8_t[]` instead of `const char[]`. This caused compilation =
errors when these literals were implicitly converted to `std::string` or pa=
ssed to functions expecting `const char*`.<br>
+<br>
+This commit adds `reinterpret_cast&lt;const char*&gt;` around the `u8` str=
ing literals in the test suite to resolve the build errors while maintainin=
g the intended UTF-8 semantics.<br>
+<br>
+Additionally, this adds C++20 to the GitHub Actions CMake test matrix to e=
nsure we don&#39;t regress on newer standards.<br>
+<br>
+Fixes #1684<br>
+<br>
+* style: run clang-format<br>
+---<br>
+ .github/workflows/cmake.yml |=C2=A0 2 +-<br>
+ src/test_lib_json/main.cpp=C2=A0 | 12 +++++++-----<br>
+ 2 files changed, 8 insertions(+), 6 deletions(-)<br>
+<br>
+diff --git a/src/test_lib_json/main.cpp b/src/test_lib_json/main.cpp<br>
+index 501aba10e..08731f66a 100644<br>
+--- a/src/test_lib_json/main.cpp<br>
++++ b/src/test_lib_json/main.cpp<br>
+@@ -1993,7 +1993,8 @@ JSONTEST_FIXTURE_LOCAL(ValueTest, StaticString) {<br=
>
+ <br>
+ JSONTEST_FIXTURE_LOCAL(ValueTest, WideString) {<br>
+=C2=A0 =C2=A0// <a href=3D"https://github.com/open-source-parsers/jsoncpp/=
issues/756" rel=3D"noreferrer noreferrer" target=3D"_blank">https://github.=
com/open-source-parsers/jsoncpp/issues/756</a><br>
+-=C2=A0 const std::string uni =3D u8&quot;\u5f0f\uff0c\u8fdb&quot;; // &qu=
ot;=E5=BC=8F=EF=BC=8C=E8=BF=9B&quot;<br>
++=C2=A0 const std::string uni =3D<br>
++=C2=A0 =C2=A0 =C2=A0 reinterpret_cast&lt;const char*&gt;(u8&quot;\u5f0f\u=
ff0c\u8fdb&quot;); // &quot;=E5=BC=8F=EF=BC=8C=E8=BF=9B&quot;<br>
+=C2=A0 =C2=A0std::string styled;<br>
+=C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0Json::Value v;<br>
+@@ -3109,9 +3110,9 @@ JSONTEST_FIXTURE_LOCAL(ReaderTest, strictModeParseNu=
mber) {<br>
+ }<br>
+ <br>
+ JSONTEST_FIXTURE_LOCAL(ReaderTest, parseChineseWithOneError) {<br>
+-=C2=A0 checkParse(R&quot;({ &quot;pr)&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u8&quot;\u4f50\u85e4&quot=
; // =E4=BD=90=E8=97=A4<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0R&quot;(erty&quot; :: &qu=
ot;value&quot; })&quot;,<br>
++=C2=A0 checkParse(reinterpret_cast&lt;const char*&gt;(R&quot;({ &quot;pr)=
&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0u8&quot;\u4f50\u85e4&quot; // =E4=BD=90=E8=97=A4<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0R&quot;(erty&quot; :: &quot;value&quot; })&quot;),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {{18, 19, &quot;Syntax er=
ror: value, object or array expected.&quot;}},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;* Line 1, Column 19=
\n=C2=A0 Syntax error: value, object or array &quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;expected.\n&quot;);=
<br>
+@@ -3223,7 +3224,8 @@ JSONTEST_FIXTURE_LOCAL(CharReaderTest, parseString) =
{<br>
+=C2=A0 =C2=A0 =C2=A0bool ok =3D reader-&gt;parse(doc, doc + std::strlen(do=
c), &amp;root, &amp;errs);<br>
+=C2=A0 =C2=A0 =C2=A0JSONTEST_ASSERT(ok);<br>
+=C2=A0 =C2=A0 =C2=A0JSONTEST_ASSERT(errs.empty());<br>
+-=C2=A0 =C2=A0 JSONTEST_ASSERT_EQUAL(u8&quot;\u8A2a&quot;, root[0].asStrin=
g()); // &quot;=E8=A8=AA&quot;<br>
++=C2=A0 =C2=A0 JSONTEST_ASSERT_EQUAL(reinterpret_cast&lt;const char*&gt;(u=
8&quot;\u8A2a&quot;),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 root[0].asString()); // &quot;=E8=A8=AA&quot;<br>
+=C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0char const doc[] =3D R&quot;([ &quot;\uD801&quot; ])&q=
uot;;<br>
diff --git a/meta-oe/recipes-devtools/jsoncpp/<a href=3D"http://jsoncpp_1.9=
.7.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">jsoncpp_1.9.7.bb</a>=
 b/meta-oe/recipes-devtools/jsoncpp/<a href=3D"http://jsoncpp_1.9.7.bb" rel=
=3D"noreferrer noreferrer" target=3D"_blank">jsoncpp_1.9.7.bb</a><br>
index 354f4e9115..bf91f8eff4 100644<br>
--- a/meta-oe/recipes-devtools/jsoncpp/<a href=3D"http://jsoncpp_1.9.7.bb" =
rel=3D"noreferrer noreferrer" target=3D"_blank">jsoncpp_1.9.7.bb</a><br>
+++ b/meta-oe/recipes-devtools/jsoncpp/<a href=3D"http://jsoncpp_1.9.7.bb" =
rel=3D"noreferrer noreferrer" target=3D"_blank">jsoncpp_1.9.7.bb</a><br>
@@ -16,6 +16,7 @@ PE =3D &quot;1&quot;<br>
=C2=A0SRCREV =3D &quot;3455302847cf1e4671f1d8f5fa953fd46a7b1404&quot;<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/open-source-pars=
ers/jsoncpp;branch=3Dmaster;protocol=3Dhttps;tag=3D$%7BPV%7D" rel=3D"norefe=
rrer noreferrer" target=3D"_blank">github.com/open-source-parsers/jsoncpp;b=
ranch=3Dmaster;protocol=3Dhttps;tag=3D${PV}</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Fix-C-11-ABI-breakage=
-when-compiled-with-C-17-1668-1.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://71d46ca38e90dc902e8178ba48=
4af4f27fa11947.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://run-ptest \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
-- <br>
2.54.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#127292): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/127292" rel=3D"noreferrer noreferrer" target=3D"_b=
lank">https://lists.openembedded.org/g/openembedded-devel/message/127292</a=
><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/119559219/199=
7914" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openemb=
edded.org/mt/119559219/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank" rel=3D"noreferrer">openembedded-devel+owner@lists.=
openembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.opene=
mbedded.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmai=
l.com" target=3D"_blank" rel=3D"noreferrer">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000008296b80653b11950--

