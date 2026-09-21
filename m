Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F353C982F1
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 12:22:43 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.47604.1789993350462318963
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Sep 2026 05:22:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=qpzlkPoV;
 spf=pass (domain: konsulko.com, ip: 74.125.225.140, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e620fa473so17082115e9.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 21 Sep 2026 05:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1789993349; x=1790598149; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BdusSJkkgxeK6dqo5PrlUJMYbJI9mi5Qu2mdPoB/hq0=;
        b=qpzlkPoVP874RR9BBEX+sFGFaCHes9TPDhIHHkPRqKYSPlLCSQP6U+Nh+Yc+N4qzfT
         uo8Dy9b+05fuLmKI+e571SxQHcpd0vF0DBrJxB20al4M/BRH6FyH9I1mpbQXQo+a7/Eh
         sXgFCPhBP5rLraodD4B0n9ouZkb78+QicJLuA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789993349; x=1790598149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BdusSJkkgxeK6dqo5PrlUJMYbJI9mi5Qu2mdPoB/hq0=;
        b=rN7OYgFxbYBH5cg995FzFP4NBXSZ5BHsb2Bc1gfsq4zVtMZiMb8QRwKPcfRsAxnHXH
         cYyyPPhA6maW3boHBMHNHPyVPsMGwI5sO4ryit2K4qmrosNX0sbm6mbhzonS102BBzk1
         c1N9xxcHpUrWgumbtAqTSjsb1wqvkn7f+CE6nfvj+InuQ0XpatmH2npkg9EUmmLejX1R
         B9tQeb5xRSeQqVYZ4uCpJ7EQsWzvtzw56jXEtyOqo1mBFSEPnB8ChJoNvGja6Of7Yyeb
         FMqOpcNd+MzOFQ4Dfz0SgDY7/+1HGm+Fx5d2XA5vkipt4MU/mBjLa9uIcWomL5KVpGCD
         NYDw==
X-Gm-Message-State: AFuF++nJSczqNvBlU3D61fHp4o4tiKIe8RzZNSef5uH68pXRkxfWo9iW
	fytSg1y16vqaGTBl29pO55l92tMVo5zzr562f86C3W9+QGng/3cRZ34WC1YMvEvRfg/FBqz1Q9N
	SN3P6
X-Gm-Gg: AYBFou39Nk+7j9n1akWHQyN4J2a7LBCMCVkLdgLctDxEYk4qgSujW/XgZzF4uo2aGFM
	Rgl9TmdEpF673spNwRlUet5t79qgnas4Lpp7k+288HG3L98DLy4VtygSasmEa2D7rLnPUiktjpU
	sQzVaDXu4sl/9WNHpASuIYuiorkeFLRQ6jJ6N43ZP5yVfAjnLD8AVyOb5jFoyTGiqKNpLZn5/bg
	44AhOINjfGlWV3XLWHaY0U6/vBMVk/v8E+LDKXaYbA0bzY3PFM4wCpUGEK/5V/G8B4QpA+Gri2l
	DpSyvAmRQ6zAztRzoue4TIaipxbpQibNRMhiJqReYlytzw0aWdKPmEEspH78WSFCrm2N0LXNyTL
	g0a5d6bhGhxRIn03dGEjXOnuk47JN7wqHhRWyvQwxLeY8ki9np2PkShhv9zGt1UVKJ6jo7NxIjM
	31Oqi9jTiIEgJIxYQ6SWqt1rj6nZfX3PGytCBqrsVRYhmzNeEC1pMr64z/D3+HgZ6t/3GC4w+HV
	uaNYhuZsKKoFpwJJUcwW+orkUd7oj47fJ0pqsHPuorLmppLJ3WJ6RkRvLPbtAFWYm2T8qcZkJOS
	h1ZNMAlkYPx3KfNgRsCgrDoM
X-Received: by 2002:a05:600c:81c8:b0:49c:fc6c:be08 with SMTP id 5b1f17b1804b1-49fc58581bfmr134509115e9.31.1789993348673;
        Mon, 21 Sep 2026 05:22:28 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc58a1176sm208150005e9.2.2026.09.21.05.22.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 05:22:28 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/5] python3-nanobind: Upgrade 3.0.0 -> 3.1.0
Date: Mon, 21 Sep 2026 15:22:22 +0300
Message-ID: <20260921122224.4185627-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260921122224.4185627-1-leon.anavi@konsulko.com>
References: <20260921122224.4185627-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Sep 2026 12:22:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130164

Upgrade to release 3.1.0:

- Python subclasses can now combine one nanobind base with
  additional :ref:`Python mixins <python_mixins>`, including
  cooperative super() calls on CPython and PyPy. Inheriting from
  multiple nanobind bases remains unsupported.
- The low-level instance API gained
  :cpp:func:`nb::inst_python_derived() <inst_python_derived>`,
  which reports whether a nanobind instance belongs to a
  Python subclass of the bound type.
- Added new low-level functions :cpp:func:`nb::keep_alive_obj()
  <keep_alive_obj>` and :cpp:func:`nb::keep_alive_cb()
  <keep_alive_cb>`, which expose the mechanism behind the
  :cpp:class:`nb::keep_alive <keep_alive>` annotation.
- The new function :cpp:func:`intrusive_counter::ref_count()`
  returns the reference count of an intrusively reference-counted
  object while it is owned by C++.
- Fixed stale trampoline override caches on PyPy. Changing an
  attribute of a nanobind type now correctly invalidates the caches
  of its Python subclasses.
- The std::map/std::unordered_map and std::set type casters can now
  also handle containers like std::flat_map whose iterators return
  temporary values.
- The :ref:`Bazel documentation <bazel>` was rewritten and now
  presents an approach based on the Bazel Central Registry.
- Miscellaneous minor improvements.

This work was sponsored by GOVCERT.LU.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-nanobind_3.0.0.bb => python3-nanobind_3.1.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-nanobind_3.0.0.bb => python3-nanobind_3.1.0.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-nanobind_3.0.0.bb b/meta-python/recipes-devtools/python/python3-nanobind_3.1.0.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-nanobind_3.0.0.bb
rename to meta-python/recipes-devtools/python/python3-nanobind_3.1.0.bb
index ec264b3f5f..6bf0ce582a 100644
--- a/meta-python/recipes-devtools/python/python3-nanobind_3.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-nanobind_3.1.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/wjakob/nanobind"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7646f9ee25e49eaf53f89a10665c568c"
 
-SRC_URI[sha256sum] = "68583c41d58af77649b830407d2ba84627f21f07ad4ae2e32c6988fb96eaa71a"
+SRC_URI[sha256sum] = "6661e3dc1434d78781ccf7913442d90361dab395c3424efadb63bbb6ddea7ea3"
 
 inherit pypi cmake python_setuptools_build_meta
 
-- 
2.47.3


