Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7B05E9A02C
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 15:42:02 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14750.1771429314169283693
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Feb 2026 07:41:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=VLKHP5bU;
 spf=pass (domain: konsulko.com, ip: 209.85.221.52, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43945763558so2433218f8f.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 18 Feb 2026 07:41:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1771429312; x=1772034112; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mMdhAtP+dCvfp86IcrBj8sk18zsgF2UXgl4EwUHSg7M=;
        b=VLKHP5bU6PcdDlVnYYJsLXssrCcIAFt2Fqy6UePzie+BIvHANfyJZhgqaNJCfG8CZz
         qk038Rx59hbJG2dUv02StHgTqRVChfqtd9cso29UY3Uko6Y44d2miiC54iaYniHGVQ/3
         3OdV3ig45aMrAVYggZpP1dTx0AXt2vFwG2j/I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771429312; x=1772034112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mMdhAtP+dCvfp86IcrBj8sk18zsgF2UXgl4EwUHSg7M=;
        b=ZSkAWV8R+pk7ADKxxDwH4DJg9HbewG5XYTn4UQ04PayayBFDWQL7LBZ2wAFTR0FiBM
         pkvhclra9v+j78uaSsn/I/Bwc2OpicLfKJQ+AuPL43H+y7o1Zbi5SX8t0HbcXB9dtG2H
         ER9ErJnpLvqCiK6NDEb4eCf0gDQHF0f3vKA9DgBNhEz5YbK+hBkwOCpbKbbCOAFib0HC
         Ho/k4OywCRwiT1P7z2SLW4Y97nH5N1QKQJbAUBwoctgtvM0dHz2qeGvzOz69+gQrApYO
         vaj/zwQ+mMV/Kyd3n/y6EawFn+Ozv6hv/hEFnP+aMpYpD8vIezigpavT5fx8VVxZs8Lv
         ppcQ==
X-Gm-Message-State: AOJu0YxBEKKuNnaJfiqc69XAq9ef0q90GWy06DIQf4AsuPgp+yGDWgqP
	YV31i9L0FTkQcm4pxuw0mb0nbEgec+lOX9JD47RNM9XhLUVU4p542gPklCkKCKNQzTFqgELkO36
	gfOqP
X-Gm-Gg: AZuq6aJff7IIzjX9GzXUWRe/Lfohrvq+WpUvZu0w84gvM+ZRFzkZG3d3G9iW7XWHk/m
	p7Wca9WzN/KJW8ZdeDxT2cgGJhgJOt+aSgM64dtbuFv5sUe4/wQ8beXRzuAXBgvLvQwzIxt0bwn
	xS1L0YaVKPZs/VpFHCVPcCzmRNWH69DZ6d+vLPD+/EHk6UFSTQCYYzKMZPAqALPTjD+MSuoom3d
	C2U5nm36fbwN7AJZ5Mq5oEGuc08p27a+HJrUVKmgxAaZKqAl2IjxoZWHiQr9L1z/llm7YJrgewj
	BynVdCC0z8XcCLwTYMQ5zY19Zka4J/dyg9pTmn6aQK+SfKmvG5zWZfLIjPKSx2qzh/Qm+qkTadd
	0+7cEwi7WQSc1jJtxfOmAm9U8zHpyJvhDSZ4j+GPOaTy6xQA9GQJYEbM9sO4F/6PvtRE48O93Tb
	2EScojTS03QGJc5pzBw5CxunbsJFU9+ArzDMrt
X-Received: by 2002:a05:6000:2502:b0:435:9f1b:8d19 with SMTP id ffacd0b85a97d-43796aefb41mr35864148f8f.38.1771429312131;
        Wed, 18 Feb 2026 07:41:52 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796a74704sm45102522f8f.16.2026.02.18.07.41.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 07:41:51 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/5] python3-astroid: Upgrade 4.0.3 -> 4.1.0
Date: Wed, 18 Feb 2026 17:41:45 +0200
Message-ID: <20260218154146.3267220-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260218154146.3267220-1-leon.anavi@konsulko.com>
References: <20260218154146.3267220-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 18 Feb 2026 15:42:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124489

Upgrade to release 4.1.0:

- Add support for equality constraints (``==``, ``!=``) in inference.
- Ensure ``ast.JoinedStr`` nodes are ``Uninferable`` when the
  ``ast.FormattedValue`` is ``Uninferable``. This prevents
  ``unexpected-keyword-arg`` messages in Pylint where the
  ``Uninferable`` string appeared in function arguments that were
  constructed dynamically.
- Add support for type constraints (`isinstance(x, y)`) in inference.
- Make `type.__new__()` raise clear errors instead of returning `None`.
- Move object dunder methods from ``FunctionModel`` to ``ObjectModel``
  to make them available on all object types, not just functions.
- ``lineno`` and ``end_lineno`` are now available on ``Arguments``.
- Add helper to iterate over all annotations nodes of function
  arguments, ``Arguments.get_annotations()``.
- Skip direct parent when determining the ``Decorator`` frame.
- Add simple command line interface for astroid to output generated
  AST. Use with ``python -m astroid``.
- Fix incorrect type inference for ``super().method()`` calls that
  return ``Self``. Previously, astroid would infer the parent class
  type instead of the child class type, causing pylint E1101 false
  positives in method chaining scenarios.
- Add missing ``dtype`` and ``casting`` parameters to
  ``numpy.concatenate`` brain.
- Fix ``random.sample`` inference crash when sequence contains
  uninferable elements.
- Fix ``random.sample`` crash when cloning ``ClassDef`` or
  ``FunctionDef`` nodes.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-astroid_4.0.3.bb => python3-astroid_4.1.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-astroid_4.0.3.bb => python3-astroid_4.1.0.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-astroid_4.0.3.bb b/meta-python/recipes-devtools/python/python3-astroid_4.1.0.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-astroid_4.0.3.bb
rename to meta-python/recipes-devtools/python/python3-astroid_4.1.0.bb
index efa59fc198..1303b0165d 100644
--- a/meta-python/recipes-devtools/python/python3-astroid_4.0.3.bb
+++ b/meta-python/recipes-devtools/python/python3-astroid_4.1.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a70cf540abf41acb644ac3b621b2fad1"
 
-SRC_URI[sha256sum] = "08d1de40d251cc3dc4a7a12726721d475ac189e4e583d596ece7422bc176bda3"
+SRC_URI[sha256sum] = "e2fbab37f205a651e6a168cb1e9a6a10677f6fa6a1c21833d113999855b04259"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.47.3


