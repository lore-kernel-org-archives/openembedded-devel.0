Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F357ECC6B08
	for <webhook@archiver.kernel.org>; Tue, 13 Oct 2026 09:18:34 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2962.1791883104040064036
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Oct 2026 02:18:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=n86o6rUH;
 spf=pass (domain: konsulko.com, ip: 209.85.221.48, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso1566964f8f.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 13 Oct 2026 02:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1791883102; x=1792487902; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1SH3PnANEkqWK8pg0zOoKg9bJT4QZwoXJ1QPdT+RMS0=;
        b=n86o6rUHiBR2O9/swywLk7jK7T6KSIDs2d0f+cq4BXTiRX7cn3pMyg2R0/pUXtHZhn
         UwCUs6iltoKLCcqvSpUpF12l/njRBfLEW7jF27fV6H7XrBcHJflyTnmCXLWbxP489KoU
         s2iIjRkdpNv21+tbthtg+6rdSh4hYXoZkbv+0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791883102; x=1792487902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1SH3PnANEkqWK8pg0zOoKg9bJT4QZwoXJ1QPdT+RMS0=;
        b=VM9J24fH5AkBWZIqNdVRJBxMqO7lPXJ2AJE/qjNXG0Y+phbanlvLe1APtU6dh7xKZw
         fIRCnpJ/RWs6HcL4tpBtCluwFtoxY3sXGN+4mQAMG+HraJSzR9on4c79T5R+XPIdPRV4
         peN1GnsIpk8M8vif+Nbb8E+8HrHikRbIT59Y04epEENRC9eTmuq4IU0gDMp3DTPrfnxJ
         c9TWcBhMhKmZMKuUZBquif9v648cLrAaocbvrlsOwD9/xCdOTtwfJ8LY7YEIhieiqYr7
         MPtJK6MtnD/2Aa2Mxw5oMJ856NNXMEPNL9k1iW0PCc6CSduY+bHKEVkWZvjfWYyxMgnE
         hOFA==
X-Gm-Message-State: AFq9FYLmjnr//X9n4l0/H5uHPDx/C5aEuFAsW0VslmW3wZgxkR1l41T+
	1TpLHGmk7L7qSDoRZ6MO42WGvN+1PtXECDuaBGWMQSP0/VOL4MGHptDn5F8dE/Stj7LKaaojTv7
	uEBUr
X-Gm-Gg: AYBFou2b55vRfRmQw++wxQVtJOlJ07tSx4RjE0yWxWq+v33+lySO1UOXlW8UkCVvxa0
	kZGx2AXlWZdEg+YVXRJIhnF69NU8NaaDTtAGfG2JSsaudZ/ZVpkssfv6UkJ+CHNZyc6yOLmE3b6
	UdtBRQx5vIxwtwbaZSsdHjllTEnlB2dSoR3cR6lO4NF2YLCgBKjhnrSIEtX3yv7qOJh7Jnf6Bfs
	1vH8aGEWk3Bz1sF9IHXSwg6lOASzx1I4TsnoejCmoX3qvZzbkkjsLIYjvJUzPD6LQkMn7fyBJdy
	nlg4ZudY7WsxA7oC6yOPt3lWZ2TSLYemioyhsRkDeJIi7Wmhf/pCmNRELGlK7B3XyveOt/WCsy4
	gr8ZyUlWDqEXg75dj68m3zZ1fU165ZSzfJOnHqUMTdvvLmc9GIO2hZjwbuD0bxqGWtm7W1Oh/+l
	K4dwtBOyJAI4LmTKGJQ6S1wHR8jSbsJ58wJZkKaz2l40gCdFw/JUP/PJUxVQcHgAm7mm/TxYLHh
	lDPA0CJvVuVHWoWY6mskdoFFl+vkJJCXHC+y61vsWiLIC2Cg5kMqL1lEh21iMEFCYJq9TB10Iyo
	N0MXySqMdM6aZujNy9lsgik=
X-Received: by 2002:a05:6000:400d:b0:487:b2b:457b with SMTP id ffacd0b85a97d-48dba9bda77mr23509683f8f.15.1791883102174;
        Tue, 13 Oct 2026 02:18:22 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0aaaa34sm4063113f8f.20.2026.10.13.02.18.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 02:18:21 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/2] python3-wrapt: Upgrade 2.4.0 -> 2.5.0
Date: Tue, 13 Oct 2026 12:18:18 +0300
Message-ID: <20261013091818.2843061-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261013091818.2843061-1-leon.anavi@konsulko.com>
References: <20261013091818.2843061-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Oct 2026 09:18:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130832

Upgrade to release 2.5.0:

- Added with_doc, a decorator for overriding the docstring that
  help(), pydoc and other introspection tools see for a wrapped
  callable without mutating the wrapped function itself. It is the
  companion of with_signature. The docstring can be supplied
  directly, or as a factory callable that derives it from the
  wrapped function at decoration time. When stacked above
  with_signature the factory sees the overridden signature and can
  embed it in the docstring. Assigning to __doc__ on the resulting
  wrapper replaces the override, and deleting it restores
  delegation to the wrapped function. Previously the only option
  was to assign to __doc__ on a wrapper, which writes through to
  the wrapped function since __doc__ on every proxy delegates to
  the wrapped object, and so changed what was reported for the
  wrapped function everywhere. The override is handled for instance
  methods, class methods and static methods, and propagates through
  outer wrapt decorators stacked on top. See the "Docstring
  Override" section of Bundled Decorators for details.
- with_signature now accepts a doc argument for overriding the
  docstring at the same time as the signature, and the factory
  callable may return a tuple of (signature_or_prototype,
  docstring) so that a single factory can derive both from the
  wrapped function in one pass. When doc is supplied, the docstring
  from the tuple is ignored. When neither is given, __doc__
  continues to delegate to the wrapped function as before,
  including for assignment and deletion.
- A class derived from wrapt.BaseObjectProxy may now define __doc__
  as a property, or other descriptor, in its class body, and that
  is used for instances of the class in place of the default
  delegation of __doc__ to the wrapped object. This works with both
  the pure Python implementation and the C extension, and the
  descriptor is inherited by further derived classes. Previously
  the pure Python metaclass overwrote such a descriptor with the
  default delegating property, and the C extension forwarded
  __doc__ to the wrapped object before consulting the type, so it
  was never used. Only __doc__ is affected, with __module__ always
  delegating to the wrapped object. This is the mechanism with_doc
  relies on.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-wrapt_2.4.0.bb => python3-wrapt_2.5.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-wrapt_2.4.0.bb => python3-wrapt_2.5.0.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-wrapt_2.4.0.bb b/meta-python/recipes-devtools/python/python3-wrapt_2.5.0.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-wrapt_2.4.0.bb
rename to meta-python/recipes-devtools/python/python3-wrapt_2.5.0.bb
index 18d533f6e1..588c123fda 100644
--- a/meta-python/recipes-devtools/python/python3-wrapt_2.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-wrapt_2.5.0.bb
@@ -8,7 +8,7 @@ inherit pypi python_setuptools_build_meta ptest-python-pytest
 
 DEPENDS += "python3-wheel-native"
 
-SRC_URI[sha256sum] = "7082fc1f94b020ac275870c4af71b09cff22876fe6e9c4c0ad01ea21d217b288"
+SRC_URI[sha256sum] = "c48cdb6c904dca76d9915a579e4a5fab6b0c25f650c1019ce78a78effaf7a345"
 
 # python3-misc for 'this' module, python3-image for colorsys (test_deferred_patching)
 RDEPENDS:${PN}-ptest += " \
-- 
2.47.3


