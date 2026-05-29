Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DD96CD6E45
	for <webhook@archiver.kernel.org>; Fri, 29 May 2026 09:34:35 +0000 (UTC)
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6601.1780047270013213342
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 May 2026 02:34:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=AT955xMp;
 spf=pass (domain: gmail.com, ip: 74.125.224.54, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-6587cee8b57so15116174d50.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 29 May 2026 02:34:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780047269; cv=none;
        d=google.com; s=arc-20240605;
        b=hPeH0tfiWGOSDaLh9mMYguQiUglA29GQNJ29a8Nplwjrdt4wJrZDZ/5diSuYlKpj7V
         +1wVHAWdrB2keJgT8e920QdvjO4slZjKujh3m2XTCKI6ITKDmpFSr2JAN8bv6ps3Ny1f
         aMSrV5Ac/82b/OGz8oR0ZjxMuZ0NB2IBDqDYUqQxlae3ZqCkS75vX0x5a4AZapyR9JcG
         Psan/8shHS5HCpj9VAVM1n3lEXuD3q+kaHkgH80pHOvp1k6rug38rETGPxtsOiCmTbia
         qXbS/Po05anDmkN5O/2B6pR8Bg4MB9YweSo+A7LyPW6eCW7MTIfl/GXG3TwXFae/OoeO
         40Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Db/qvndb7x3gONBgbpnwfY6scS9HZZCzeNVj43LOYM8=;
        fh=JcAd6HwccK4EvpxAMjP2bxYC3lCBqqBNJVhweROcESo=;
        b=bV1IxjN8X494AGWL/v4IEFW2AixXN/qg2oL5qBP7g+rSu9qFKPiMKeqVWV7StpqTdB
         bqKf21tlS4w+Et21r/H8RTtFK2+/dOLRxqzYPdFVHE0NQSWI4JCiUjPPhXmrnl6DCvv2
         ZzLSVyKTyiWIWrDlybM2iWs/RBYksVgGlZoXZgwOQiI92RGu5A6ZljPBO6sw3InwGLqb
         jp4VlNNajF+5rLatFvogooJ1dnhua+9JFV51ApjyV+EDwpgNA1UqyjVxPOW/N/4tUFWg
         DzsE02PJXOk8dWE3PtGMv0f2xSG51jSDooQD4xel/DfzhQbW1V3AQKLa3BdKWsAbuiBA
         snug==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780047269; x=1780652069; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Db/qvndb7x3gONBgbpnwfY6scS9HZZCzeNVj43LOYM8=;
        b=AT955xMpWY1JrARcuDvqAJaPNUwE8Y2weHl8nJS/g/xzXNngYX7ZUfnxSi4zCj7uto
         f1DTS0UZiCTf3PB/TGy93P/EP0qCXnUxWYFw//QM+PDHpBL2+GIaVjF/q/S8RDBonJ/q
         6BI3P1M6Aie3Xi4SNHSxHdZLcOwr2qrzvHiUmMnXyWaDKT/HT7tYmBrtsv+CuDuqr0Dg
         mpo8cTnXhpjKuOOtsol4k1mZu7atqPX00alZ5RDHPyPXNnPeCV1hrda1PlTNe59vNVpW
         w42QH1OhFR7xcJL5/nkVv1YSwxERagg4W973qyM0z++2RDEDbCqesFay5QoQjZ307pR3
         NnKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780047269; x=1780652069;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Db/qvndb7x3gONBgbpnwfY6scS9HZZCzeNVj43LOYM8=;
        b=oVifigLnYNWM8KqOnEtpdLfjdCUUY9De+JR+FdrcPA5S6OJU8C/oGGbhU4SxtivssP
         fOb4d9bjuJzeDirKND8Kx68oEAqB5yt7ZxeLcVg84ouUO7pKC0XZ6QYszLbZBaAUOoZ0
         VsDwRZDxhi7F7Buil/oCR1fdhXNONEy3gpJM08GLHc/gDR5D+rr3Ey7to/QU5I5j50SB
         POY3u4oiyOsZ2OAMAXAhcNJo0QVho/ropZ2GJYhRq6CazSIgpho+2tGoFYWNSxRYjlg1
         x2TrEMQvgIlpffU1u6UPhvfyNreZb4qxDDbvoJg7pTsmdp5ieqQ0WUCePevT3lEJXLVQ
         iV8g==
X-Gm-Message-State: AOJu0YxEB5IEYDTezuQHKy67EZr9+wOjh1WcLkSDruA5ZI4q6XXgkilV
	yAFlSb8/5JPBfyIqM1pdUzmrh5YKETuruhAgUZhIikWrskgVpcq9WM1a+gDFDn6s74lgBz2uPr0
	yX+mOz9EKdWPAhpQPxcD2zeQUTR3dpBg=
X-Gm-Gg: Acq92OE8jw49uQvp5TQfL8mx4t0btYwPPbZ+/SznCEwlttbbN8HwlMxS1Syzn6c8b9X
	eo3nSO4otMQ7xqZWyaI6mNi8Li3IhvC8OquCm9nT2HblSpB1HXtzGvQevYmXDmcemqhS1dTJxqu
	JNUEWUKWoo/4BcsKGY0jCy1BIFBF9HB8Z1R6HxHK9sh/iFhHoCXVhNI00NB9asmSqrSJ0AmVPoD
	hw1d7kCsmL73qhn3Lex0xVvc6b/+X9Bch7xO/HEV822O1c3eWzD4fEOniFperHV3YZEiPISZkrC
	qpwcA7o6dP8dN9ZdHP+KBqcXMyDFp1CvKHZTwCYgFkjevOi+0ESlXsPWze82irQY5mTOkcqSgQH
	jNJpuxst6E+0cr90j+SONpKJ0ykoMJwSSEF1wp89BFXeLOSePYyQS/CzlNaivCwqc63T7ag/Kgl
	ZsFS0Pi70a5/Q+jQXJ
X-Received: by 2002:a05:690e:d5a:b0:660:4c08:a826 with SMTP id
 956f58d0204a3-66052fa7e11mr1142291d50.62.1780047268556; Fri, 29 May 2026
 02:34:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260529070522.3737233-1-antonsk@axis.com>
In-Reply-To: <20260529070522.3737233-1-antonsk@axis.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 29 May 2026 11:34:16 +0200
X-Gm-Features: AVHnY4Lw2RGvi5It-enYVf2oBG9V9zxjLs9LVvjBAO8gl0chwuqBa976HMjO0YU
Message-ID: <CAMKF1sqMCYDK1D+ZiTrMBoyrg09XeVXPsmx_EEO3vcFJjm7EhQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] jq: patch CVE-2026-47770
To: antonsk@axis.com
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>, 
	Anton Skorup <anton@skorup.se>, Anton Skorup <anton.skorup@axis.com>
Content-Type: multipart/alternative; boundary="0000000000002034990652f18d5d"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 May 2026 09:34:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127285

--0000000000002034990652f18d5d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Please add appropriate upstream-status tag to the patch

On Fri, May 29, 2026, 9:24=E2=80=AFAM Anton Skorup via lists.openembedded.o=
rg
<antonsk=3Daxis.com@lists.openembedded.org> wrote:

> From: Anton Skorup <anton@skorup.se>
>
> This patch adds the upstream patch for CVE-2026-47770.
>
> Details: https://ubuntu.com/security/CVE-2026-47770
> Reference:
> https://github.com/jqlang/jq/commit/7122866869960b55cea3646bc91334ef55787=
831
> Signed-off-by
> <https://github.com/jqlang/jq/commit/7122866869960b55cea3646bc91334ef5578=
7831Signed-off-by>:
> Anton Skorup <anton.skorup@axis.com>
> ---
>  .../jq/jq/CVE-2026-47770.patch                | 483 ++++++++++++++++++
>  meta-oe/recipes-devtools/jq/jq_1.8.1.bb       |   1 +
>  2 files changed, 484 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-47770.patch
>
> diff --git a/meta-oe/recipes-devtools/jq/jq/CVE-2026-47770.patch
> b/meta-oe/recipes-devtools/jq/jq/CVE-2026-47770.patch
> new file mode 100644
> index 0000000000..2c1eb04f76
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/jq/jq/CVE-2026-47770.patch
> @@ -0,0 +1,483 @@
> +From b4d48d83e7fe19a31824822da1393a367a59b7ba Mon Sep 17 00:00:00 2001
> +From: Yu-Fu Fu <yufu@yfu.tw>
> +Date: Fri, 22 May 2026 04:07:16 -0700
> +Subject: [PATCH] Guard deep structural equality and comparison recursion
> + (#3539)
> +
> +jv_equal and jv_cmp overflows the C stack on deeply nested
> +input. Cap recursion at 10000 with -1 / INT_MIN sentinels;
> +operators that compose user expressions surface this as
> +"Equality check too deep" / "Comparison too deep".
> +
> +Fixes CVE-2026-47770.
> +
> +Change-Id: I11794879105850d5e3cd48943b1ad31bfdd2d23a
> +---
> + src/builtin.c |  36 +++++++++++++++--
> + src/jv.c      |  46 +++++++++++++++++-----
> + src/jv_aux.c  | 105 ++++++++++++++++++++++++++++++++++++++++++--------
> + tests/jq.test |  40 +++++++++++++++++++
> + 4 files changed, 198 insertions(+), 29 deletions(-)
> +
> +diff --git a/src/builtin.c b/src/builtin.c
> +index ac56f9f..ac25f90 100644
> +--- a/src/builtin.c
> ++++ b/src/builtin.c
> +@@ -295,7 +295,15 @@ jv binop_minus(jv a, jv b) {
> +     jv_array_foreach(a, i, x) {
> +       int include =3D 1;
> +       jv_array_foreach(b, j, y) {
> +-        if (jv_equal(jv_copy(x), y)) {
> ++        int equal =3D jv_equal(jv_copy(x), y);
> ++        if (equal < 0) {
> ++          jv_free(out);
> ++          jv_free(x);
> ++          jv_free(a);
> ++          jv_free(b);
> ++          return jv_invalid_with_msg(jv_string("Equality check too
> deep"));
> ++        }
> ++        if (equal) {
> +           include =3D 0;
> +           break;
> +         }
> +@@ -379,11 +387,17 @@ jv binop_mod(jv a, jv b) {
> + #undef dtoi
> +
> + jv binop_equal(jv a, jv b) {
> +-  return jv_bool(jv_equal(a, b));
> ++  int r =3D jv_equal(a, b);
> ++  if (r < 0)
> ++    return jv_invalid_with_msg(jv_string("Equality check too deep"));
> ++  return jv_bool(r);
> + }
> +
> + jv binop_notequal(jv a, jv b) {
> +-  return jv_bool(!jv_equal(a, b));
> ++  int r =3D jv_equal(a, b);
> ++  if (r < 0)
> ++    return jv_invalid_with_msg(jv_string("Equality check too deep"));
> ++  return jv_bool(!r);
> + }
> +
> + enum cmp_op {
> +@@ -395,6 +409,8 @@ enum cmp_op {
> +
> + static jv order_cmp(jv a, jv b, enum cmp_op op) {
> +   int r =3D jv_cmp(a, b);
> ++  if (r =3D=3D INT_MIN)
> ++    return jv_invalid_with_msg(jv_string("Comparison too deep"));
> +   return jv_bool((op =3D=3D CMP_OP_LESS && r < 0) ||
> +                  (op =3D=3D CMP_OP_LESSEQ && r <=3D 0) ||
> +                  (op =3D=3D CMP_OP_GREATEREQ && r >=3D 0) ||
> +@@ -845,6 +861,12 @@ static jv f_bsearch(jq_state *jq, jv input, jv
> target) {
> +   while (start < end) {
> +     int mid =3D start + (end - start) / 2;
> +     int result =3D jv_cmp(jv_copy(target), jv_array_get(jv_copy(input),
> mid));
> ++    if (result =3D=3D INT_MIN) {
> ++      jv_free(answer);
> ++      jv_free(input);
> ++      jv_free(target);
> ++      return jv_invalid_with_msg(jv_string("Comparison too deep"));
> ++    }
> +     if (result =3D=3D 0) {
> +       answer =3D jv_number(mid);
> +       break;
> +@@ -1136,6 +1158,14 @@ static jv minmax_by(jv values, jv keys, int
> is_min) {
> +   for (int i=3D1; i<jv_array_length(jv_copy(values)); i++) {
> +     jv item =3D jv_array_get(jv_copy(keys), i);
> +     int cmp =3D jv_cmp(jv_copy(item), jv_copy(retkey));
> ++    if (cmp =3D=3D INT_MIN) {
> ++      jv_free(item);
> ++      jv_free(values);
> ++      jv_free(keys);
> ++      jv_free(retkey);
> ++      jv_free(ret);
> ++      return jv_invalid_with_msg(jv_string("Comparison too deep"));
> ++    }
> +     if ((cmp < 0) =3D=3D (is_min =3D=3D 1)) {
> +       jv_free(retkey);
> +       retkey =3D item;
> +diff --git a/src/jv.c b/src/jv.c
> +index f701b46..e079d08 100644
> +--- a/src/jv.c
> ++++ b/src/jv.c
> +@@ -912,16 +912,20 @@ static jv* jvp_array_write(jv* a, int i) {
> +   }
> + }
> +
> +-static int jvp_array_equal(jv a, jv b) {
> ++static int jvp_equal(jv a, jv b, int depth);
> ++
> ++static int jvp_array_equal(jv a, jv b, int depth) {
> +   if (jvp_array_length(a) !=3D jvp_array_length(b))
> +     return 0;
> +   if (jvp_array_ptr(a) =3D=3D jvp_array_ptr(b) &&
> +       jvp_array_offset(a) =3D=3D jvp_array_offset(b))
> +     return 1;
> +   for (int i=3D0; i<jvp_array_length(a); i++) {
> +-    if (!jv_equal(jv_copy(*jvp_array_read(a, i)),
> +-                  jv_copy(*jvp_array_read(b, i))))
> +-      return 0;
> ++    int r =3D jvp_equal(jv_copy(*jvp_array_read(a, i)),
> ++                      jv_copy(*jvp_array_read(b, i)),
> ++                      depth);
> ++    if (r <=3D 0)
> ++      return r;
> +   }
> +   return 1;
> + }
> +@@ -1071,7 +1075,14 @@ jv jv_array_indexes(jv a, jv b) {
> +   int alen =3D jv_array_length(jv_copy(a));
> +   for (int ai =3D 0; ai < alen; ++ai) {
> +     jv_array_foreach(b, bi, belem) {
> +-      if (!jv_equal(jv_array_get(jv_copy(a), ai + bi), belem))
> ++      int equal =3D jv_equal(jv_array_get(jv_copy(a), ai + bi), belem);
> ++      if (equal < 0) {
> ++        jv_free(res);
> ++        jv_free(a);
> ++        jv_free(b);
> ++        return jv_invalid_with_msg(jv_string("Equality check too deep")=
);
> ++      }
> ++      if (!equal)
> +         idx =3D -1;
> +       else if (bi =3D=3D 0 && idx =3D=3D -1)
> +         idx =3D ai;
> +@@ -1828,7 +1839,7 @@ static int jvp_object_length(jv object) {
> +   return n;
> + }
> +
> +-static int jvp_object_equal(jv o1, jv o2) {
> ++static int jvp_object_equal(jv o1, jv o2, int depth) {
> +   int len2 =3D jvp_object_length(o2);
> +   int len1 =3D 0;
> +   for (int i=3D0; i<jvp_object_size(o1); i++) {
> +@@ -1837,7 +1848,8 @@ static int jvp_object_equal(jv o1, jv o2) {
> +     jv* slot2 =3D jvp_object_read(o2, slot->string);
> +     if (!slot2) return 0;
> +     // FIXME: do less refcounting here
> +-    if (!jv_equal(jv_copy(slot->value), jv_copy(*slot2))) return 0;
> ++    int r =3D jvp_equal(jv_copy(slot->value), jv_copy(*slot2), depth);
> ++    if (r <=3D 0) return r;
> +     len1++;
> +   }
> +   return len1 =3D=3D len2;
> +@@ -2032,7 +2044,16 @@ int jv_get_refcnt(jv j) {
> +  * Higher-level operations
> +  */
> +
> +-int jv_equal(jv a, jv b) {
> ++#ifndef MAX_EQUAL_DEPTH
> ++#define MAX_EQUAL_DEPTH (10000)
> ++#endif
> ++
> ++static int jvp_equal(jv a, jv b, int depth) {
> ++  if (depth > MAX_EQUAL_DEPTH) {
> ++    jv_free(a);
> ++    jv_free(b);
> ++    return -1;
> ++  }
> +   int r;
> +   if (jv_get_kind(a) !=3D jv_get_kind(b)) {
> +     r =3D 0;
> +@@ -2048,13 +2069,13 @@ int jv_equal(jv a, jv b) {
> +       r =3D jvp_number_equal(a, b);
> +       break;
> +     case JV_KIND_ARRAY:
> +-      r =3D jvp_array_equal(a, b);
> ++      r =3D jvp_array_equal(a, b, depth + 1);
> +       break;
> +     case JV_KIND_STRING:
> +       r =3D jvp_string_equal(a, b);
> +       break;
> +     case JV_KIND_OBJECT:
> +-      r =3D jvp_object_equal(a, b);
> ++      r =3D jvp_object_equal(a, b, depth + 1);
> +       break;
> +     default:
> +       r =3D 1;
> +@@ -2066,6 +2087,11 @@ int jv_equal(jv a, jv b) {
> +   return r;
> + }
> +
> ++// Returns 1 if equal, 0 if not equal, or -1 if the comparison is too
> deep
> ++int jv_equal(jv a, jv b) {
> ++  return jvp_equal(a, b, 0);
> ++}
> ++
> + int jv_identical(jv a, jv b) {
> +   int r;
> +   if (a.kind_flags !=3D b.kind_flags
> +diff --git a/src/jv_aux.c b/src/jv_aux.c
> +index 594a21f..a39f1f1 100644
> +--- a/src/jv_aux.c
> ++++ b/src/jv_aux.c
> +@@ -16,6 +16,24 @@ static double jv_number_get_value_and_consume(jv
> number) {
> +   return value;
> + }
> +
> ++#ifndef MAX_CMP_DEPTH
> ++#define MAX_CMP_DEPTH (10000)
> ++#endif
> ++
> ++struct sort_cmp_state {
> ++  int too_deep;
> ++};
> ++
> ++#ifdef _MSC_VER
> ++static __declspec(thread) struct sort_cmp_state sort_cmp_state;
> ++#else
> ++#ifdef HAVE___THREAD
> ++static __thread struct sort_cmp_state sort_cmp_state;
> ++#else
> ++static struct sort_cmp_state sort_cmp_state;
> ++#endif
> ++#endif
> ++
> + static jv parse_slice(jv j, jv slice, int* pstart, int* pend) {
> +   // Array slices
> +   jv start_jv =3D jv_object_get(jv_copy(slice), jv_string("start"));
> +@@ -471,8 +489,7 @@ static jv delpaths_sorted(jv object, jv paths, int
> start) {
> +     int delkey =3D jv_array_length(jv_array_get(jv_copy(paths), i)) =3D=
=3D
> start + 1;
> +     jv key =3D jv_array_get(jv_array_get(jv_copy(paths), i), start);
> +     while (j < jv_array_length(jv_copy(paths)) &&
> +-           jv_equal(jv_copy(key),
> jv_array_get(jv_array_get(jv_copy(paths), j), start)))
> +-      j++;
> ++           jv_equal(jv_copy(key),
> jv_array_get(jv_array_get(jv_copy(paths), j), start)) =3D=3D 1);
> +     // if i <=3D entry < j, then entry starts with key
> +     if (delkey) {
> +       // deleting this entire key, we don't care about any more specifi=
c
> deletions
> +@@ -606,7 +623,13 @@ jv jv_keys(jv x) {
> +   }
> + }
> +
> +-int jv_cmp(jv a, jv b) {
> ++static int jvp_cmp(jv a, jv b, int depth) {
> ++  if (depth > MAX_CMP_DEPTH) {
> ++    jv_free(a);
> ++    jv_free(b);
> ++    return INT_MIN;
> ++  }
> ++
> +   if (jv_get_kind(a) !=3D jv_get_kind(b)) {
> +     int r =3D (int)jv_get_kind(a) - (int)jv_get_kind(b);
> +     jv_free(a);
> +@@ -621,14 +644,13 @@ int jv_cmp(jv a, jv b) {
> +   case JV_KIND_FALSE:
> +   case JV_KIND_TRUE:
> +     // there's only one of each of these values
> +-    r =3D 0;
> +     break;
> +
> +   case JV_KIND_NUMBER: {
> +     if (jvp_number_is_nan(a)) {
> +-      r =3D jv_cmp(jv_null(), jv_copy(b));
> ++      r =3D jvp_cmp(jv_null(), jv_copy(b), depth);
> +     } else if (jvp_number_is_nan(b)) {
> +-      r =3D jv_cmp(jv_copy(a), jv_null());
> ++      r =3D jvp_cmp(jv_copy(a), jv_null(), depth);
> +     } else {
> +       r =3D jvp_number_cmp(a, b);
> +     }
> +@@ -652,7 +674,9 @@ int jv_cmp(jv a, jv b) {
> +       }
> +       jv xa =3D jv_array_get(jv_copy(a), i);
> +       jv xb =3D jv_array_get(jv_copy(b), i);
> +-      r =3D jv_cmp(xa, xb);
> ++      r =3D jvp_cmp(xa, xb, depth + 1);
> ++      if (r =3D=3D INT_MIN)
> ++        break;
> +       i++;
> +     }
> +     break;
> +@@ -661,13 +685,14 @@ int jv_cmp(jv a, jv b) {
> +   case JV_KIND_OBJECT: {
> +     jv keys_a =3D jv_keys(jv_copy(a));
> +     jv keys_b =3D jv_keys(jv_copy(b));
> +-    r =3D jv_cmp(jv_copy(keys_a), keys_b);
> ++    r =3D jvp_cmp(jv_copy(keys_a), keys_b, depth + 1);
> +     if (r =3D=3D 0) {
> +       jv_array_foreach(keys_a, i, key) {
> +         jv xa =3D jv_object_get(jv_copy(a), jv_copy(key));
> +         jv xb =3D jv_object_get(jv_copy(b), key);
> +-        r =3D jv_cmp(xa, xb);
> +-        if (r) break;
> ++        r =3D jvp_cmp(xa, xb, depth + 1);
> ++        if (r !=3D 0)
> ++          break;
> +       }
> +     }
> +     jv_free(keys_a);
> +@@ -680,6 +705,11 @@ int jv_cmp(jv a, jv b) {
> +   return r;
> + }
> +
> ++// Returns <0, 0, >0 if a is less than, equal to, or greater than b, or
> ++// INT_MIN if the comparison is too deep
> ++int jv_cmp(jv a, jv b) {
> ++  return jvp_cmp(a, b, 0);
> ++}
> +
> + struct sort_entry {
> +   jv object;
> +@@ -687,19 +717,32 @@ struct sort_entry {
> +   int index;
> + };
> +
> ++static void sort_entry_array_free(struct sort_entry* entries, int start=
,
> int n) {
> ++  for (int i =3D start; i < n; i++) {
> ++    jv_free(entries[i].key);
> ++    jv_free(entries[i].object);
> ++  }
> ++  jv_mem_free(entries);
> ++}
> ++
> + static int sort_cmp(const void* pa, const void* pb) {
> +   const struct sort_entry* a =3D pa;
> +   const struct sort_entry* b =3D pb;
> +   int r =3D jv_cmp(jv_copy(a->key), jv_copy(b->key));
> ++  if (r =3D=3D INT_MIN) {
> ++    sort_cmp_state.too_deep =3D 1;
> ++    return 0;
> ++  }
> +   // comparing by index if r =3D=3D 0 makes the sort stable
> +   return r ? r : (a->index - b->index);
> + }
> +
> +-static struct sort_entry* sort_items(jv objects, jv keys) {
> ++static struct sort_entry* sort_items(jv objects, jv keys, int *too_deep=
)
> {
> +   assert(jv_get_kind(objects) =3D=3D JV_KIND_ARRAY);
> +   assert(jv_get_kind(keys) =3D=3D JV_KIND_ARRAY);
> +   assert(jv_array_length(jv_copy(objects)) =3D=3D
> jv_array_length(jv_copy(keys)));
> +   int n =3D jv_array_length(jv_copy(objects));
> ++  *too_deep =3D 0;
> +   if (n =3D=3D 0) {
> +     jv_free(objects);
> +     jv_free(keys);
> +@@ -713,7 +756,13 @@ static struct sort_entry* sort_items(jv objects, jv
> keys) {
> +   }
> +   jv_free(objects);
> +   jv_free(keys);
> ++  sort_cmp_state.too_deep =3D 0;
> +   qsort(entries, n, sizeof(struct sort_entry), sort_cmp);
> ++  if (sort_cmp_state.too_deep) {
> ++    sort_entry_array_free(entries, 0, n);
> ++    *too_deep =3D 1;
> ++    return NULL;
> ++  }
> +   return entries;
> + }
> +
> +@@ -722,7 +771,10 @@ jv jv_sort(jv objects, jv keys) {
> +   assert(jv_get_kind(keys) =3D=3D JV_KIND_ARRAY);
> +   assert(jv_array_length(jv_copy(objects)) =3D=3D
> jv_array_length(jv_copy(keys)));
> +   int n =3D jv_array_length(jv_copy(objects));
> +-  struct sort_entry* entries =3D sort_items(objects, keys);
> ++  int too_deep =3D 0;
> ++  struct sort_entry* entries =3D sort_items(objects, keys, &too_deep);
> ++  if (too_deep)
> ++    return jv_invalid_with_msg(jv_string("Comparison too deep"));
> +   jv ret =3D jv_array();
> +   for (int i=3D0; i<n; i++) {
> +     jv_free(entries[i].key);
> +@@ -737,13 +789,24 @@ jv jv_group(jv objects, jv keys) {
> +   assert(jv_get_kind(keys) =3D=3D JV_KIND_ARRAY);
> +   assert(jv_array_length(jv_copy(objects)) =3D=3D
> jv_array_length(jv_copy(keys)));
> +   int n =3D jv_array_length(jv_copy(objects));
> +-  struct sort_entry* entries =3D sort_items(objects, keys);
> ++  int too_deep =3D 0;
> ++  struct sort_entry* entries =3D sort_items(objects, keys, &too_deep);
> ++  if (too_deep)
> ++    return jv_invalid_with_msg(jv_string("Comparison too deep"));
> +   jv ret =3D jv_array();
> +   if (n > 0) {
> +     jv curr_key =3D entries[0].key;
> +     jv group =3D jv_array_append(jv_array(), entries[0].object);
> +     for (int i =3D 1; i < n; i++) {
> +-      if (jv_equal(jv_copy(curr_key), jv_copy(entries[i].key))) {
> ++      int equal =3D jv_equal(jv_copy(curr_key), jv_copy(entries[i].key)=
);
> ++      if (equal < 0) {
> ++        jv_free(curr_key);
> ++        jv_free(group);
> ++        sort_entry_array_free(entries, i, n);
> ++        jv_free(ret);
> ++        return jv_invalid_with_msg(jv_string("Equality check too deep")=
);
> ++      }
> ++      if (equal) {
> +         jv_free(entries[i].key);
> +       } else {
> +         jv_free(curr_key);
> +@@ -765,11 +828,21 @@ jv jv_unique(jv objects, jv keys) {
> +   assert(jv_get_kind(keys) =3D=3D JV_KIND_ARRAY);
> +   assert(jv_array_length(jv_copy(objects)) =3D=3D
> jv_array_length(jv_copy(keys)));
> +   int n =3D jv_array_length(jv_copy(objects));
> +-  struct sort_entry* entries =3D sort_items(objects, keys);
> ++  int too_deep =3D 0;
> ++  struct sort_entry* entries =3D sort_items(objects, keys, &too_deep);
> ++  if (too_deep)
> ++    return jv_invalid_with_msg(jv_string("Comparison too deep"));
> +   jv ret =3D jv_array();
> +   jv curr_key =3D jv_invalid();
> +   for (int i =3D 0; i < n; i++) {
> +-    if (jv_equal(jv_copy(curr_key), jv_copy(entries[i].key))) {
> ++    int equal =3D jv_equal(jv_copy(curr_key), jv_copy(entries[i].key));
> ++    if (equal < 0) {
> ++      jv_free(curr_key);
> ++      sort_entry_array_free(entries, i, n);
> ++      jv_free(ret);
> ++      return jv_invalid_with_msg(jv_string("Equality check too deep"));
> ++    }
> ++    if (equal) {
> +       jv_free(entries[i].key);
> +       jv_free(entries[i].object);
> +     } else {
> +diff --git a/tests/jq.test b/tests/jq.test
> +index 5013bce..f35ef94 100644
> +--- a/tests/jq.test
> ++++ b/tests/jq.test
> +@@ -2560,3 +2560,43 @@ null
> + try delpaths([[range(10001) | 0]]) catch .
> + null
> + "Path too deep"
> ++
> ++# regression test for CVE-2026-40612
> ++reduce range(10000) as $_ ([]; [.]) | contains([[]])
> ++null
> ++true
> ++
> ++try (reduce range(10001) as $_ ([]; [.]) as $x | $x | contains($x))
> catch .
> ++null
> ++"Containment check too deep"
> ++
> ++# regression test for CVE-2026-43896
> ++reduce range(10000) as $_ ({}; {a: .}) as $x | $x * $x | length
> ++null
> ++1
> ++
> ++try (reduce range(10001) as $_ ({}; {a: .}) as $x | $x * $x) catch .
> ++null
> ++"Object merge too deep"
> ++
> ++# regression test for deep structural equality recursion
> ++try ((reduce range(10001) as $_ ([]; [.])) as $x | (reduce range(10001)
> as $_ ([]; [.])) as $y | $x =3D=3D $y) catch .
> ++null
> ++"Equality check too deep"
> ++
> ++# regression tests for deep ordering comparisons
> ++try ((reduce range(10001) as $_ ([]; [.])) as $x | [$x, $x] | sort)
> catch .
> ++null
> ++"Comparison too deep"
> ++
> ++try ((reduce range(10001) as $_ ([]; [.])) as $x | [$x, $x] | unique)
> catch .
> ++null
> ++"Comparison too deep"
> ++
> ++try ((reduce range(10001) as $_ ({}; {a: .})) as $x | [$x, $x] | sort)
> catch .
> ++null
> ++"Comparison too deep"
> ++
> ++try ((reduce range(10001) as $_ ({}; {a: .})) as $x | [$x, $x] | unique=
)
> catch .
> ++null
> ++"Comparison too deep"
> +--
> +2.43.0
> +
> diff --git a/meta-oe/recipes-devtools/jq/jq_1.8.1.bb
> b/meta-oe/recipes-devtools/jq/jq_1.8.1.bb
> index 026f6bfa71..7665ba2511 100644
> --- a/meta-oe/recipes-devtools/jq/jq_1.8.1.bb
> +++ b/meta-oe/recipes-devtools/jq/jq_1.8.1.bb
> @@ -17,6 +17,7 @@ SRC_URI =3D "git://
> github.com/jqlang/jq.git;protocol=3Dhttps;branch=3Dmaster;tag=3Djq-${
> <http://github.com/jqlang/jq.git;protocol=3Dhttps;branch=3Dmaster;tag=3Dj=
q-$%7B>
>             file://CVE-2026-33947.patch \
>             file://CVE-2026-33948.patch \
>             file://CVE-2026-39979.patch \
> +           file://CVE-2026-47770.patch \
>             "
>
>  inherit autotools ptest
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#127282):
> https://lists.openembedded.org/g/openembedded-devel/message/127282
> Mute This Topic: https://lists.openembedded.org/mt/119543594/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000002034990652f18d5d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Please add appropriate upstream-status tag to the patch=
=C2=A0</div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=
=3D"ltr" class=3D"gmail_attr">On Fri, May 29, 2026, 9:24=E2=80=AFAM Anton S=
korup via <a href=3D"http://lists.openembedded.org">lists.openembedded.org<=
/a> &lt;antonsk=3D<a href=3D"mailto:axis.com@lists.openembedded.org">axis.c=
om@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">From: Anton Skorup &lt;<a href=3D"mailto:anton@sko=
rup.se" target=3D"_blank" rel=3D"noreferrer">anton@skorup.se</a>&gt;<br>
<br>
This patch adds the upstream patch for CVE-2026-47770.<br>
<br>
Details: <a href=3D"https://ubuntu.com/security/CVE-2026-47770" rel=3D"nore=
ferrer noreferrer" target=3D"_blank">https://ubuntu.com/security/CVE-2026-4=
7770</a><br>
Reference: <a href=3D"https://github.com/jqlang/jq/commit/7122866869960b55c=
ea3646bc91334ef55787831Signed-off-by" rel=3D"noreferrer noreferrer" target=
=3D"_blank">https://github.com/jqlang/jq/commit/7122866869960b55cea3646bc91=
334ef55787831<br>
Signed-off-by</a>: Anton Skorup &lt;<a href=3D"mailto:anton.skorup@axis.com=
" target=3D"_blank" rel=3D"noreferrer">anton.skorup@axis.com</a>&gt;<br>
---<br>
=C2=A0.../jq/jq/CVE-2026-47770.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 483 ++++++++++++++++++<br>
=C2=A0meta-oe/recipes-devtools/jq/<a href=3D"http://jq_1.8.1.bb" rel=3D"nor=
eferrer noreferrer" target=3D"_blank">jq_1.8.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A02 files changed, 484 insertions(+)<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-47770.patc=
h<br>
<br>
diff --git a/meta-oe/recipes-devtools/jq/jq/CVE-2026-47770.patch b/meta-oe/=
recipes-devtools/jq/jq/CVE-2026-47770.patch<br>
new file mode 100644<br>
index 0000000000..2c1eb04f76<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-devtools/jq/jq/CVE-2026-47770.patch<br>
@@ -0,0 +1,483 @@<br>
+From b4d48d83e7fe19a31824822da1393a367a59b7ba Mon Sep 17 00:00:00 2001<br>
+From: Yu-Fu Fu &lt;<a href=3D"mailto:yufu@yfu.tw" target=3D"_blank" rel=3D=
"noreferrer">yufu@yfu.tw</a>&gt;<br>
+Date: Fri, 22 May 2026 04:07:16 -0700<br>
+Subject: [PATCH] Guard deep structural equality and comparison recursion<b=
r>
+ (#3539)<br>
+<br>
+jv_equal and jv_cmp overflows the C stack on deeply nested<br>
+input. Cap recursion at 10000 with -1 / INT_MIN sentinels;<br>
+operators that compose user expressions surface this as<br>
+&quot;Equality check too deep&quot; / &quot;Comparison too deep&quot;.<br>
+<br>
+Fixes CVE-2026-47770.<br>
+<br>
+Change-Id: I11794879105850d5e3cd48943b1ad31bfdd2d23a<br>
+---<br>
+ src/builtin.c |=C2=A0 36 +++++++++++++++--<br>
+ src/jv.c=C2=A0 =C2=A0 =C2=A0 |=C2=A0 46 +++++++++++++++++-----<br>
+ src/jv_aux.c=C2=A0 | 105 ++++++++++++++++++++++++++++++++++++++++++------=
--<br>
+ tests/jq.test |=C2=A0 40 +++++++++++++++++++<br>
+ 4 files changed, 198 insertions(+), 29 deletions(-)<br>
+<br>
+diff --git a/src/builtin.c b/src/builtin.c<br>
+index ac56f9f..ac25f90 100644<br>
+--- a/src/builtin.c<br>
++++ b/src/builtin.c<br>
+@@ -295,7 +295,15 @@ jv binop_minus(jv a, jv b) {<br>
+=C2=A0 =C2=A0 =C2=A0jv_array_foreach(a, i, x) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int include =3D 1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0jv_array_foreach(b, j, y) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (jv_equal(jv_copy(x), y)) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 int equal =3D jv_equal(jv_copy(x), y);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (equal &lt; 0) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 jv_free(out);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 jv_free(x);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 jv_free(a);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 jv_free(b);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return jv_invalid_with_msg(jv_string(&=
quot;Equality check too deep&quot;));<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (equal) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0include =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+@@ -379,11 +387,17 @@ jv binop_mod(jv a, jv b) {<br>
+ #undef dtoi<br>
+ <br>
+ jv binop_equal(jv a, jv b) {<br>
+-=C2=A0 return jv_bool(jv_equal(a, b));<br>
++=C2=A0 int r =3D jv_equal(a, b);<br>
++=C2=A0 if (r &lt; 0)<br>
++=C2=A0 =C2=A0 return jv_invalid_with_msg(jv_string(&quot;Equality check t=
oo deep&quot;));<br>
++=C2=A0 return jv_bool(r);<br>
+ }<br>
+ <br>
+ jv binop_notequal(jv a, jv b) {<br>
+-=C2=A0 return jv_bool(!jv_equal(a, b));<br>
++=C2=A0 int r =3D jv_equal(a, b);<br>
++=C2=A0 if (r &lt; 0)<br>
++=C2=A0 =C2=A0 return jv_invalid_with_msg(jv_string(&quot;Equality check t=
oo deep&quot;));<br>
++=C2=A0 return jv_bool(!r);<br>
+ }<br>
+ <br>
+ enum cmp_op {<br>
+@@ -395,6 +409,8 @@ enum cmp_op {<br>
+ <br>
+ static jv order_cmp(jv a, jv b, enum cmp_op op) {<br>
+=C2=A0 =C2=A0int r =3D jv_cmp(a, b);<br>
++=C2=A0 if (r =3D=3D INT_MIN)<br>
++=C2=A0 =C2=A0 return jv_invalid_with_msg(jv_string(&quot;Comparison too d=
eep&quot;));<br>
+=C2=A0 =C2=A0return jv_bool((op =3D=3D CMP_OP_LESS &amp;&amp; r &lt; 0) ||=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (op =3D=3D =
CMP_OP_LESSEQ &amp;&amp; r &lt;=3D 0) ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (op =3D=3D =
CMP_OP_GREATEREQ &amp;&amp; r &gt;=3D 0) ||<br>
+@@ -845,6 +861,12 @@ static jv f_bsearch(jq_state *jq, jv input, jv target=
) {<br>
+=C2=A0 =C2=A0while (start &lt; end) {<br>
+=C2=A0 =C2=A0 =C2=A0int mid =3D start + (end - start) / 2;<br>
+=C2=A0 =C2=A0 =C2=A0int result =3D jv_cmp(jv_copy(target), jv_array_get(jv=
_copy(input), mid));<br>
++=C2=A0 =C2=A0 if (result =3D=3D INT_MIN) {<br>
++=C2=A0 =C2=A0 =C2=A0 jv_free(answer);<br>
++=C2=A0 =C2=A0 =C2=A0 jv_free(input);<br>
++=C2=A0 =C2=A0 =C2=A0 jv_free(target);<br>
++=C2=A0 =C2=A0 =C2=A0 return jv_invalid_with_msg(jv_string(&quot;Compariso=
n too deep&quot;));<br>
++=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0if (result =3D=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0answer =3D jv_number(mid);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+@@ -1136,6 +1158,14 @@ static jv minmax_by(jv values, jv keys, int is_min)=
 {<br>
+=C2=A0 =C2=A0for (int i=3D1; i&lt;jv_array_length(jv_copy(values)); i++) {=
<br>
+=C2=A0 =C2=A0 =C2=A0jv item =3D jv_array_get(jv_copy(keys), i);<br>
+=C2=A0 =C2=A0 =C2=A0int cmp =3D jv_cmp(jv_copy(item), jv_copy(retkey));<br=
>
++=C2=A0 =C2=A0 if (cmp =3D=3D INT_MIN) {<br>
++=C2=A0 =C2=A0 =C2=A0 jv_free(item);<br>
++=C2=A0 =C2=A0 =C2=A0 jv_free(values);<br>
++=C2=A0 =C2=A0 =C2=A0 jv_free(keys);<br>
++=C2=A0 =C2=A0 =C2=A0 jv_free(retkey);<br>
++=C2=A0 =C2=A0 =C2=A0 jv_free(ret);<br>
++=C2=A0 =C2=A0 =C2=A0 return jv_invalid_with_msg(jv_string(&quot;Compariso=
n too deep&quot;));<br>
++=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0if ((cmp &lt; 0) =3D=3D (is_min =3D=3D 1)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0jv_free(retkey);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0retkey =3D item;<br>
+diff --git a/src/jv.c b/src/jv.c<br>
+index f701b46..e079d08 100644<br>
+--- a/src/jv.c<br>
++++ b/src/jv.c<br>
+@@ -912,16 +912,20 @@ static jv* jvp_array_write(jv* a, int i) {<br>
+=C2=A0 =C2=A0}<br>
+ }<br>
+ <br>
+-static int jvp_array_equal(jv a, jv b) {<br>
++static int jvp_equal(jv a, jv b, int depth);<br>
++<br>
++static int jvp_array_equal(jv a, jv b, int depth) {<br>
+=C2=A0 =C2=A0if (jvp_array_length(a) !=3D jvp_array_length(b))<br>
+=C2=A0 =C2=A0 =C2=A0return 0;<br>
+=C2=A0 =C2=A0if (jvp_array_ptr(a) =3D=3D jvp_array_ptr(b) &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0jvp_array_offset(a) =3D=3D jvp_array_offset(b))=
<br>
+=C2=A0 =C2=A0 =C2=A0return 1;<br>
+=C2=A0 =C2=A0for (int i=3D0; i&lt;jvp_array_length(a); i++) {<br>
+-=C2=A0 =C2=A0 if (!jv_equal(jv_copy(*jvp_array_read(a, i)),<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 jv_copy(*j=
vp_array_read(b, i))))<br>
+-=C2=A0 =C2=A0 =C2=A0 return 0;<br>
++=C2=A0 =C2=A0 int r =3D jvp_equal(jv_copy(*jvp_array_read(a, i)),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 jv_copy(*jvp_array_read(b, i)),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 depth);<br>
++=C2=A0 =C2=A0 if (r &lt;=3D 0)<br>
++=C2=A0 =C2=A0 =C2=A0 return r;<br>
+=C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0return 1;<br>
+ }<br>
+@@ -1071,7 +1075,14 @@ jv jv_array_indexes(jv a, jv b) {<br>
+=C2=A0 =C2=A0int alen =3D jv_array_length(jv_copy(a));<br>
+=C2=A0 =C2=A0for (int ai =3D 0; ai &lt; alen; ++ai) {<br>
+=C2=A0 =C2=A0 =C2=A0jv_array_foreach(b, bi, belem) {<br>
+-=C2=A0 =C2=A0 =C2=A0 if (!jv_equal(jv_array_get(jv_copy(a), ai + bi), bel=
em))<br>
++=C2=A0 =C2=A0 =C2=A0 int equal =3D jv_equal(jv_array_get(jv_copy(a), ai +=
 bi), belem);<br>
++=C2=A0 =C2=A0 =C2=A0 if (equal &lt; 0) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 jv_free(res);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 jv_free(a);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 jv_free(b);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 return jv_invalid_with_msg(jv_string(&quot;Eq=
uality check too deep&quot;));<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 if (!equal)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0idx =3D -1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else if (bi =3D=3D 0 &amp;&amp; idx =3D=3D -1)<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0idx =3D ai;<br>
+@@ -1828,7 +1839,7 @@ static int jvp_object_length(jv object) {<br>
+=C2=A0 =C2=A0return n;<br>
+ }<br>
+ <br>
+-static int jvp_object_equal(jv o1, jv o2) {<br>
++static int jvp_object_equal(jv o1, jv o2, int depth) {<br>
+=C2=A0 =C2=A0int len2 =3D jvp_object_length(o2);<br>
+=C2=A0 =C2=A0int len1 =3D 0;<br>
+=C2=A0 =C2=A0for (int i=3D0; i&lt;jvp_object_size(o1); i++) {<br>
+@@ -1837,7 +1848,8 @@ static int jvp_object_equal(jv o1, jv o2) {<br>
+=C2=A0 =C2=A0 =C2=A0jv* slot2 =3D jvp_object_read(o2, slot-&gt;string);<br=
>
+=C2=A0 =C2=A0 =C2=A0if (!slot2) return 0;<br>
+=C2=A0 =C2=A0 =C2=A0// FIXME: do less refcounting here<br>
+-=C2=A0 =C2=A0 if (!jv_equal(jv_copy(slot-&gt;value), jv_copy(*slot2))) re=
turn 0;<br>
++=C2=A0 =C2=A0 int r =3D jvp_equal(jv_copy(slot-&gt;value), jv_copy(*slot2=
), depth);<br>
++=C2=A0 =C2=A0 if (r &lt;=3D 0) return r;<br>
+=C2=A0 =C2=A0 =C2=A0len1++;<br>
+=C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0return len1 =3D=3D len2;<br>
+@@ -2032,7 +2044,16 @@ int jv_get_refcnt(jv j) {<br>
+=C2=A0 * Higher-level operations<br>
+=C2=A0 */<br>
+ <br>
+-int jv_equal(jv a, jv b) {<br>
++#ifndef MAX_EQUAL_DEPTH<br>
++#define MAX_EQUAL_DEPTH (10000)<br>
++#endif<br>
++<br>
++static int jvp_equal(jv a, jv b, int depth) {<br>
++=C2=A0 if (depth &gt; MAX_EQUAL_DEPTH) {<br>
++=C2=A0 =C2=A0 jv_free(a);<br>
++=C2=A0 =C2=A0 jv_free(b);<br>
++=C2=A0 =C2=A0 return -1;<br>
++=C2=A0 }<br>
+=C2=A0 =C2=A0int r;<br>
+=C2=A0 =C2=A0if (jv_get_kind(a) !=3D jv_get_kind(b)) {<br>
+=C2=A0 =C2=A0 =C2=A0r =3D 0;<br>
+@@ -2048,13 +2069,13 @@ int jv_equal(jv a, jv b) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0r =3D jvp_number_equal(a, b);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0case JV_KIND_ARRAY:<br>
+-=C2=A0 =C2=A0 =C2=A0 r =3D jvp_array_equal(a, b);<br>
++=C2=A0 =C2=A0 =C2=A0 r =3D jvp_array_equal(a, b, depth + 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0case JV_KIND_STRING:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0r =3D jvp_string_equal(a, b);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0case JV_KIND_OBJECT:<br>
+-=C2=A0 =C2=A0 =C2=A0 r =3D jvp_object_equal(a, b);<br>
++=C2=A0 =C2=A0 =C2=A0 r =3D jvp_object_equal(a, b, depth + 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0r =3D 1;<br>
+@@ -2066,6 +2087,11 @@ int jv_equal(jv a, jv b) {<br>
+=C2=A0 =C2=A0return r;<br>
+ }<br>
+ <br>
++// Returns 1 if equal, 0 if not equal, or -1 if the comparison is too dee=
p<br>
++int jv_equal(jv a, jv b) {<br>
++=C2=A0 return jvp_equal(a, b, 0);<br>
++}<br>
++<br>
+ int jv_identical(jv a, jv b) {<br>
+=C2=A0 =C2=A0int r;<br>
+=C2=A0 =C2=A0if (a.kind_flags !=3D b.kind_flags<br>
+diff --git a/src/jv_aux.c b/src/jv_aux.c<br>
+index 594a21f..a39f1f1 100644<br>
+--- a/src/jv_aux.c<br>
++++ b/src/jv_aux.c<br>
+@@ -16,6 +16,24 @@ static double jv_number_get_value_and_consume(jv number=
) {<br>
+=C2=A0 =C2=A0return value;<br>
+ }<br>
+ <br>
++#ifndef MAX_CMP_DEPTH<br>
++#define MAX_CMP_DEPTH (10000)<br>
++#endif<br>
++<br>
++struct sort_cmp_state {<br>
++=C2=A0 int too_deep;<br>
++};<br>
++<br>
++#ifdef _MSC_VER<br>
++static __declspec(thread) struct sort_cmp_state sort_cmp_state;<br>
++#else<br>
++#ifdef HAVE___THREAD<br>
++static __thread struct sort_cmp_state sort_cmp_state;<br>
++#else<br>
++static struct sort_cmp_state sort_cmp_state;<br>
++#endif<br>
++#endif<br>
++<br>
+ static jv parse_slice(jv j, jv slice, int* pstart, int* pend) {<br>
+=C2=A0 =C2=A0// Array slices<br>
+=C2=A0 =C2=A0jv start_jv =3D jv_object_get(jv_copy(slice), jv_string(&quot=
;start&quot;));<br>
+@@ -471,8 +489,7 @@ static jv delpaths_sorted(jv object, jv paths, int sta=
rt) {<br>
+=C2=A0 =C2=A0 =C2=A0int delkey =3D jv_array_length(jv_array_get(jv_copy(pa=
ths), i)) =3D=3D start + 1;<br>
+=C2=A0 =C2=A0 =C2=A0jv key =3D jv_array_get(jv_array_get(jv_copy(paths), i=
), start);<br>
+=C2=A0 =C2=A0 =C2=A0while (j &lt; jv_array_length(jv_copy(paths)) &amp;&am=
p;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0jv_equal(jv_copy(key), jv_array_=
get(jv_array_get(jv_copy(paths), j), start)))<br>
+-=C2=A0 =C2=A0 =C2=A0 j++;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0jv_equal(jv_copy(key), jv_array_=
get(jv_array_get(jv_copy(paths), j), start)) =3D=3D 1);<br>
+=C2=A0 =C2=A0 =C2=A0// if i &lt;=3D entry &lt; j, then entry starts with k=
ey<br>
+=C2=A0 =C2=A0 =C2=A0if (delkey) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0// deleting this entire key, we don&#39;t care =
about any more specific deletions<br>
+@@ -606,7 +623,13 @@ jv jv_keys(jv x) {<br>
+=C2=A0 =C2=A0}<br>
+ }<br>
+ <br>
+-int jv_cmp(jv a, jv b) {<br>
++static int jvp_cmp(jv a, jv b, int depth) {<br>
++=C2=A0 if (depth &gt; MAX_CMP_DEPTH) {<br>
++=C2=A0 =C2=A0 jv_free(a);<br>
++=C2=A0 =C2=A0 jv_free(b);<br>
++=C2=A0 =C2=A0 return INT_MIN;<br>
++=C2=A0 }<br>
++<br>
+=C2=A0 =C2=A0if (jv_get_kind(a) !=3D jv_get_kind(b)) {<br>
+=C2=A0 =C2=A0 =C2=A0int r =3D (int)jv_get_kind(a) - (int)jv_get_kind(b);<b=
r>
+=C2=A0 =C2=A0 =C2=A0jv_free(a);<br>
+@@ -621,14 +644,13 @@ int jv_cmp(jv a, jv b) {<br>
+=C2=A0 =C2=A0case JV_KIND_FALSE:<br>
+=C2=A0 =C2=A0case JV_KIND_TRUE:<br>
+=C2=A0 =C2=A0 =C2=A0// there&#39;s only one of each of these values<br>
+-=C2=A0 =C2=A0 r =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0break;<br>
+ <br>
+=C2=A0 =C2=A0case JV_KIND_NUMBER: {<br>
+=C2=A0 =C2=A0 =C2=A0if (jvp_number_is_nan(a)) {<br>
+-=C2=A0 =C2=A0 =C2=A0 r =3D jv_cmp(jv_null(), jv_copy(b));<br>
++=C2=A0 =C2=A0 =C2=A0 r =3D jvp_cmp(jv_null(), jv_copy(b), depth);<br>
+=C2=A0 =C2=A0 =C2=A0} else if (jvp_number_is_nan(b)) {<br>
+-=C2=A0 =C2=A0 =C2=A0 r =3D jv_cmp(jv_copy(a), jv_null());<br>
++=C2=A0 =C2=A0 =C2=A0 r =3D jvp_cmp(jv_copy(a), jv_null(), depth);<br>
+=C2=A0 =C2=A0 =C2=A0} else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0r =3D jvp_number_cmp(a, b);<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+@@ -652,7 +674,9 @@ int jv_cmp(jv a, jv b) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0jv xa =3D jv_array_get(jv_copy(a), i);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0jv xb =3D jv_array_get(jv_copy(b), i);<br>
+-=C2=A0 =C2=A0 =C2=A0 r =3D jv_cmp(xa, xb);<br>
++=C2=A0 =C2=A0 =C2=A0 r =3D jvp_cmp(xa, xb, depth + 1);<br>
++=C2=A0 =C2=A0 =C2=A0 if (r =3D=3D INT_MIN)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0i++;<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0break;<br>
+@@ -661,13 +685,14 @@ int jv_cmp(jv a, jv b) {<br>
+=C2=A0 =C2=A0case JV_KIND_OBJECT: {<br>
+=C2=A0 =C2=A0 =C2=A0jv keys_a =3D jv_keys(jv_copy(a));<br>
+=C2=A0 =C2=A0 =C2=A0jv keys_b =3D jv_keys(jv_copy(b));<br>
+-=C2=A0 =C2=A0 r =3D jv_cmp(jv_copy(keys_a), keys_b);<br>
++=C2=A0 =C2=A0 r =3D jvp_cmp(jv_copy(keys_a), keys_b, depth + 1);<br>
+=C2=A0 =C2=A0 =C2=A0if (r =3D=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0jv_array_foreach(keys_a, i, key) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0jv xa =3D jv_object_get(jv_copy(a), jv_c=
opy(key));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0jv xb =3D jv_object_get(jv_copy(b), key)=
;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D jv_cmp(xa, xb);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (r) break;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D jvp_cmp(xa, xb, depth + 1);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (r !=3D 0)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0jv_free(keys_a);<br>
+@@ -680,6 +705,11 @@ int jv_cmp(jv a, jv b) {<br>
+=C2=A0 =C2=A0return r;<br>
+ }<br>
+ <br>
++// Returns &lt;0, 0, &gt;0 if a is less than, equal to, or greater than b=
, or<br>
++// INT_MIN if the comparison is too deep<br>
++int jv_cmp(jv a, jv b) {<br>
++=C2=A0 return jvp_cmp(a, b, 0);<br>
++}<br>
+ <br>
+ struct sort_entry {<br>
+=C2=A0 =C2=A0jv object;<br>
+@@ -687,19 +717,32 @@ struct sort_entry {<br>
+=C2=A0 =C2=A0int index;<br>
+ };<br>
+ <br>
++static void sort_entry_array_free(struct sort_entry* entries, int start, =
int n) {<br>
++=C2=A0 for (int i =3D start; i &lt; n; i++) {<br>
++=C2=A0 =C2=A0 jv_free(entries[i].key);<br>
++=C2=A0 =C2=A0 jv_free(entries[i].object);<br>
++=C2=A0 }<br>
++=C2=A0 jv_mem_free(entries);<br>
++}<br>
++<br>
+ static int sort_cmp(const void* pa, const void* pb) {<br>
+=C2=A0 =C2=A0const struct sort_entry* a =3D pa;<br>
+=C2=A0 =C2=A0const struct sort_entry* b =3D pb;<br>
+=C2=A0 =C2=A0int r =3D jv_cmp(jv_copy(a-&gt;key), jv_copy(b-&gt;key));<br>
++=C2=A0 if (r =3D=3D INT_MIN) {<br>
++=C2=A0 =C2=A0 sort_cmp_state.too_deep =3D 1;<br>
++=C2=A0 =C2=A0 return 0;<br>
++=C2=A0 }<br>
+=C2=A0 =C2=A0// comparing by index if r =3D=3D 0 makes the sort stable<br>
+=C2=A0 =C2=A0return r ? r : (a-&gt;index - b-&gt;index);<br>
+ }<br>
+ <br>
+-static struct sort_entry* sort_items(jv objects, jv keys) {<br>
++static struct sort_entry* sort_items(jv objects, jv keys, int *too_deep) =
{<br>
+=C2=A0 =C2=A0assert(jv_get_kind(objects) =3D=3D JV_KIND_ARRAY);<br>
+=C2=A0 =C2=A0assert(jv_get_kind(keys) =3D=3D JV_KIND_ARRAY);<br>
+=C2=A0 =C2=A0assert(jv_array_length(jv_copy(objects)) =3D=3D jv_array_leng=
th(jv_copy(keys)));<br>
+=C2=A0 =C2=A0int n =3D jv_array_length(jv_copy(objects));<br>
++=C2=A0 *too_deep =3D 0;<br>
+=C2=A0 =C2=A0if (n =3D=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0jv_free(objects);<br>
+=C2=A0 =C2=A0 =C2=A0jv_free(keys);<br>
+@@ -713,7 +756,13 @@ static struct sort_entry* sort_items(jv objects, jv k=
eys) {<br>
+=C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0jv_free(objects);<br>
+=C2=A0 =C2=A0jv_free(keys);<br>
++=C2=A0 sort_cmp_state.too_deep =3D 0;<br>
+=C2=A0 =C2=A0qsort(entries, n, sizeof(struct sort_entry), sort_cmp);<br>
++=C2=A0 if (sort_cmp_state.too_deep) {<br>
++=C2=A0 =C2=A0 sort_entry_array_free(entries, 0, n);<br>
++=C2=A0 =C2=A0 *too_deep =3D 1;<br>
++=C2=A0 =C2=A0 return NULL;<br>
++=C2=A0 }<br>
+=C2=A0 =C2=A0return entries;<br>
+ }<br>
+ <br>
+@@ -722,7 +771,10 @@ jv jv_sort(jv objects, jv keys) {<br>
+=C2=A0 =C2=A0assert(jv_get_kind(keys) =3D=3D JV_KIND_ARRAY);<br>
+=C2=A0 =C2=A0assert(jv_array_length(jv_copy(objects)) =3D=3D jv_array_leng=
th(jv_copy(keys)));<br>
+=C2=A0 =C2=A0int n =3D jv_array_length(jv_copy(objects));<br>
+-=C2=A0 struct sort_entry* entries =3D sort_items(objects, keys);<br>
++=C2=A0 int too_deep =3D 0;<br>
++=C2=A0 struct sort_entry* entries =3D sort_items(objects, keys, &amp;too_=
deep);<br>
++=C2=A0 if (too_deep)<br>
++=C2=A0 =C2=A0 return jv_invalid_with_msg(jv_string(&quot;Comparison too d=
eep&quot;));<br>
+=C2=A0 =C2=A0jv ret =3D jv_array();<br>
+=C2=A0 =C2=A0for (int i=3D0; i&lt;n; i++) {<br>
+=C2=A0 =C2=A0 =C2=A0jv_free(entries[i].key);<br>
+@@ -737,13 +789,24 @@ jv jv_group(jv objects, jv keys) {<br>
+=C2=A0 =C2=A0assert(jv_get_kind(keys) =3D=3D JV_KIND_ARRAY);<br>
+=C2=A0 =C2=A0assert(jv_array_length(jv_copy(objects)) =3D=3D jv_array_leng=
th(jv_copy(keys)));<br>
+=C2=A0 =C2=A0int n =3D jv_array_length(jv_copy(objects));<br>
+-=C2=A0 struct sort_entry* entries =3D sort_items(objects, keys);<br>
++=C2=A0 int too_deep =3D 0;<br>
++=C2=A0 struct sort_entry* entries =3D sort_items(objects, keys, &amp;too_=
deep);<br>
++=C2=A0 if (too_deep)<br>
++=C2=A0 =C2=A0 return jv_invalid_with_msg(jv_string(&quot;Comparison too d=
eep&quot;));<br>
+=C2=A0 =C2=A0jv ret =3D jv_array();<br>
+=C2=A0 =C2=A0if (n &gt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0jv curr_key =3D entries[0].key;<br>
+=C2=A0 =C2=A0 =C2=A0jv group =3D jv_array_append(jv_array(), entries[0].ob=
ject);<br>
+=C2=A0 =C2=A0 =C2=A0for (int i =3D 1; i &lt; n; i++) {<br>
+-=C2=A0 =C2=A0 =C2=A0 if (jv_equal(jv_copy(curr_key), jv_copy(entries[i].k=
ey))) {<br>
++=C2=A0 =C2=A0 =C2=A0 int equal =3D jv_equal(jv_copy(curr_key), jv_copy(en=
tries[i].key));<br>
++=C2=A0 =C2=A0 =C2=A0 if (equal &lt; 0) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 jv_free(curr_key);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 jv_free(group);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 sort_entry_array_free(entries, i, n);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 jv_free(ret);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 return jv_invalid_with_msg(jv_string(&quot;Eq=
uality check too deep&quot;));<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 if (equal) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0jv_free(entries[i].key);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0jv_free(curr_key);<br>
+@@ -765,11 +828,21 @@ jv jv_unique(jv objects, jv keys) {<br>
+=C2=A0 =C2=A0assert(jv_get_kind(keys) =3D=3D JV_KIND_ARRAY);<br>
+=C2=A0 =C2=A0assert(jv_array_length(jv_copy(objects)) =3D=3D jv_array_leng=
th(jv_copy(keys)));<br>
+=C2=A0 =C2=A0int n =3D jv_array_length(jv_copy(objects));<br>
+-=C2=A0 struct sort_entry* entries =3D sort_items(objects, keys);<br>
++=C2=A0 int too_deep =3D 0;<br>
++=C2=A0 struct sort_entry* entries =3D sort_items(objects, keys, &amp;too_=
deep);<br>
++=C2=A0 if (too_deep)<br>
++=C2=A0 =C2=A0 return jv_invalid_with_msg(jv_string(&quot;Comparison too d=
eep&quot;));<br>
+=C2=A0 =C2=A0jv ret =3D jv_array();<br>
+=C2=A0 =C2=A0jv curr_key =3D jv_invalid();<br>
+=C2=A0 =C2=A0for (int i =3D 0; i &lt; n; i++) {<br>
+-=C2=A0 =C2=A0 if (jv_equal(jv_copy(curr_key), jv_copy(entries[i].key))) {=
<br>
++=C2=A0 =C2=A0 int equal =3D jv_equal(jv_copy(curr_key), jv_copy(entries[i=
].key));<br>
++=C2=A0 =C2=A0 if (equal &lt; 0) {<br>
++=C2=A0 =C2=A0 =C2=A0 jv_free(curr_key);<br>
++=C2=A0 =C2=A0 =C2=A0 sort_entry_array_free(entries, i, n);<br>
++=C2=A0 =C2=A0 =C2=A0 jv_free(ret);<br>
++=C2=A0 =C2=A0 =C2=A0 return jv_invalid_with_msg(jv_string(&quot;Equality =
check too deep&quot;));<br>
++=C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 if (equal) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0jv_free(entries[i].key);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0jv_free(entries[i].object);<br>
+=C2=A0 =C2=A0 =C2=A0} else {<br>
+diff --git a/tests/jq.test b/tests/jq.test<br>
+index 5013bce..f35ef94 100644<br>
+--- a/tests/jq.test<br>
++++ b/tests/jq.test<br>
+@@ -2560,3 +2560,43 @@ null<br>
+ try delpaths([[range(10001) | 0]]) catch .<br>
+ null<br>
+ &quot;Path too deep&quot;<br>
++<br>
++# regression test for CVE-2026-40612<br>
++reduce range(10000) as $_ ([]; [.]) | contains([[]])<br>
++null<br>
++true<br>
++<br>
++try (reduce range(10001) as $_ ([]; [.]) as $x | $x | contains($x)) catch=
 .<br>
++null<br>
++&quot;Containment check too deep&quot;<br>
++<br>
++# regression test for CVE-2026-43896<br>
++reduce range(10000) as $_ ({}; {a: .}) as $x | $x * $x | length<br>
++null<br>
++1<br>
++<br>
++try (reduce range(10001) as $_ ({}; {a: .}) as $x | $x * $x) catch .<br>
++null<br>
++&quot;Object merge too deep&quot;<br>
++<br>
++# regression test for deep structural equality recursion<br>
++try ((reduce range(10001) as $_ ([]; [.])) as $x | (reduce range(10001) a=
s $_ ([]; [.])) as $y | $x =3D=3D $y) catch .<br>
++null<br>
++&quot;Equality check too deep&quot;<br>
++<br>
++# regression tests for deep ordering comparisons<br>
++try ((reduce range(10001) as $_ ([]; [.])) as $x | [$x, $x] | sort) catch=
 .<br>
++null<br>
++&quot;Comparison too deep&quot;<br>
++<br>
++try ((reduce range(10001) as $_ ([]; [.])) as $x | [$x, $x] | unique) cat=
ch .<br>
++null<br>
++&quot;Comparison too deep&quot;<br>
++<br>
++try ((reduce range(10001) as $_ ({}; {a: .})) as $x | [$x, $x] | sort) ca=
tch .<br>
++null<br>
++&quot;Comparison too deep&quot;<br>
++<br>
++try ((reduce range(10001) as $_ ({}; {a: .})) as $x | [$x, $x] | unique) =
catch .<br>
++null<br>
++&quot;Comparison too deep&quot;<br>
+-- <br>
+2.43.0<br>
+<br>
diff --git a/meta-oe/recipes-devtools/jq/<a href=3D"http://jq_1.8.1.bb" rel=
=3D"noreferrer noreferrer" target=3D"_blank">jq_1.8.1.bb</a> b/meta-oe/reci=
pes-devtools/jq/<a href=3D"http://jq_1.8.1.bb" rel=3D"noreferrer noreferrer=
" target=3D"_blank">jq_1.8.1.bb</a><br>
index 026f6bfa71..7665ba2511 100644<br>
--- a/meta-oe/recipes-devtools/jq/<a href=3D"http://jq_1.8.1.bb" rel=3D"nor=
eferrer noreferrer" target=3D"_blank">jq_1.8.1.bb</a><br>
+++ b/meta-oe/recipes-devtools/jq/<a href=3D"http://jq_1.8.1.bb" rel=3D"nor=
eferrer noreferrer" target=3D"_blank">jq_1.8.1.bb</a><br>
@@ -17,6 +17,7 @@ SRC_URI =3D &quot;git://<a href=3D"http://github.com/jqla=
ng/jq.git;protocol=3Dhttps;branch=3Dmaster;tag=3Djq-$%7B" rel=3D"noreferrer=
 noreferrer" target=3D"_blank">github.com/jqlang/jq.git;protocol=3Dhttps;br=
anch=3Dmaster;tag=3Djq-${</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2026-33947.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2026-33948.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2026-39979.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2026-47770.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0inherit autotools ptest<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#127282): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/127282" rel=3D"noreferrer noreferrer" target=3D"_b=
lank">https://lists.openembedded.org/g/openembedded-devel/message/127282</a=
><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/119543594/199=
7914" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openemb=
edded.org/mt/119543594/1997914</a><br>
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

--0000000000002034990652f18d5d--

