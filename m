Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71ADDCCA490
	for <webhook@archiver.kernel.org>; Sun, 18 Oct 2026 17:20:19 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18251.1792344018711953519
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 18 Oct 2026 10:20:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=DpIYQRXZ;
 spf=pass (domain: konsulko.com, ip: 209.85.128.47, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a1e34ecb02so2909275e9.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 18 Oct 2026 10:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792344017; x=1792948817; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LWGHwCWhwKd/a/PmjefVaE7C8KsUuaH6iJedh71tPk4=;
        b=DpIYQRXZu+CVt1CEYIIszNOpPE2444DXPEI72WItaH55hqVXEXzFSw0oUHNhfOUB92
         tvhHA84ECRwClCTgz1PzQMZYd+f90ICyuUTqQtlm0/Mb8kRXmt0VzJCv0sF+7XxyBLDM
         BoCTJbvLlOr8Fr0dj2yhbknJZs/SNncNgrzkU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792344017; x=1792948817;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LWGHwCWhwKd/a/PmjefVaE7C8KsUuaH6iJedh71tPk4=;
        b=yf29k3+FoxFrdqBQsXRvuycn5OgcUcUBCzWwMp9I03WJfOMvDICcJG+/Ajp1tmlodb
         9imjMcSUKheL7bRS5wOqtGZVltZ96yYAJhCOp9j3K+Tu+ZD/8eQq9VeCRAkO6MCskBsB
         1GiauE6tu6LjC9B0l7hTbMVX8vbL6Ketl0TI5m9EwhpfJumjrScW7j5UeNpRIBUMmMzY
         pM0M4SMQhXV5ls90CX+DQcMRWwwHrRF1MC6/HYAE5i684xna/vJeCyruYVJZgUSiRsRU
         ouzyxoi/thwfb/lez+8uGyNWsaLe401MpLu+42W1BgH/B6N4Zl3ZvusnBhmeUDV0AlUO
         LhVg==
X-Gm-Message-State: AFq9FYJut648390KW4TV/i32mVm9ErWx2cePdgQRqHPcpNzIa67PWrNI
	ujAjjVwWLdSTHYU9WpTQC9x2WTt7HP5gWzzlpu3fI9SZ/tspxYdVh+DKbuBUwtDGLQWhZ6TKsyG
	KQa+g
X-Gm-Gg: AYBFou3btpLBJeWF2fKUEUTqYIm0Y2PVwCVFtXooRz6cqoAE93DOUvQtR7NgUSRVc6i
	aqMzszIJuRL6k96+MaGG31qL55HpSGGSKbmb1rZ4CtPP2ASd51LxwiwxEOm51XYVlhBrseN15FO
	kDs0cuQuuhR10CY/7B4VbVfAdH5pgedOhRYnqyysxFIdGDMSPw/lUClmdYahC3R8+tucLZainjT
	qsykXIunhSu80+9Rs5LSK6PzfnqVs/B+i38s7A/+O2rMuxLqfbYNeOzrviCOQLlnVz9Y209rmvr
	ZgxOAQiDDcuutjPebSXXj3P3QK0XFtGvo2cBC+rrTz9wMljsGkBPnseGyyF5w1s6cp9pUX8/7t4
	qRi4yDdXVQCj7P0W6D5/ynCtcd2O2YNS5sK9RaCXmKc9+ZHAhIfYvauYmkIzFDoVBFwbhb+LRAA
	b2aWfQlOK87cAfsXWmy30S46dASYXoPSd692Sg3U5KWe2okiMls0jMBmwrFouCihUQQEMz3EKPp
	UFfZmyNCPLYwmfioA6tF1CO61gt6a682henNIxbTcZQAEydL08vB0vQwljyAjhzy2ZvPSrQoSEk
	0Mk0f/iYwmmATzPgFC9qORo=
X-Received: by 2002:a05:600c:8709:b0:4a1:7e77:c382 with SMTP id 5b1f17b1804b1-4a1d75e6f32mr110857045e9.5.1792344016345;
        Sun, 18 Oct 2026 10:20:16 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1dc952d63sm156755155e9.2.2026.10.18.10.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 10:20:15 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/5] python3-wrapt: Upgrade 2.5.0 -> 2.5.1
Date: Sun, 18 Oct 2026 20:20:09 +0300
Message-ID: <20261018172013.925046-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 18 Oct 2026 17:20:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131095

Upgrade to release 2.5.1:

- A LazyObjectProxy created with an interface argument that declared
  a path-like type, such as os.PathLike or pathlib.Path, did not
  define the __fspath__() special method on the class it generated.
  Because os.fspath() looks up __fspath__() on the type of the
  object, passing such a proxy to os.fspath(), the builtin open()
  or other standard library functions accepting paths raised
  TypeError before the factory callable had been invoked to create
  the wrapped object. The __fspath__() special method is now added
  when the declared interface provides it, in the same way as is
  already done for the other special methods looked up on the type,
  so the first path conversion triggers creation of the wrapped
  object and succeeds. With thanks to Muneeb Sheikh.
- A callback passed to wrapt.WeakFunctionProxy which was callable
  but evaluated as false, such as an event emitter object which
  reports its number of subscribers via __len__() and is empty when
  first created, was passed the underlying weak reference object
  instead of the proxy when the wrapped function expired. Where the
  wrapped function was a bound method, such a callback could also
  be called twice, once each when the instance and the function
  expired. Only None is now treated as meaning no callback was
  supplied, which mirrors the behaviour of weakref.ref() and
  weakref.proxy() in the standard library, so these callbacks now
  receive the proxy and are called only once, as for any other
  callback. With thanks to Huanyi Xie.
- A wrapt.AdapterFactory instance passed as the adapter argument
  to wrapt.decorator was ignored, and so never called, if the
  instance evaluated as false, such as when the factory class
  defined __bool__() or __len__(). The decorated function then
  retained its original signature instead of that produced by the
  factory. Whether an adapter factory was supplied is now
  determined by type before the truth value of the adapter is
  considered, so such factories are always called. As a consequence
  of this change a factory can now also return None, or any other
  false value, to indicate that no adapter should be used for a
  particular function, where previously this failed with an obscure
  error. With thanks to Luochenchen.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-wrapt_2.5.0.bb => python3-wrapt_2.5.1.bb} | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-wrapt_2.5.0.bb => python3-wrapt_2.5.1.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-wrapt_2.5.0.bb b/meta-python/recipes-devtools/python/python3-wrapt_2.5.1.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-wrapt_2.5.0.bb
rename to meta-python/recipes-devtools/python/python3-wrapt_2.5.1.bb
index 588c123fda..8c75c173c3 100644
--- a/meta-python/recipes-devtools/python/python3-wrapt_2.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-wrapt_2.5.1.bb
@@ -8,7 +8,7 @@ inherit pypi python_setuptools_build_meta ptest-python-pytest
 
 DEPENDS += "python3-wheel-native"
 
-SRC_URI[sha256sum] = "c48cdb6c904dca76d9915a579e4a5fab6b0c25f650c1019ce78a78effaf7a345"
+SRC_URI[sha256sum] = "f595bb0185aab3e9dc31950c95d914f56ea8278810c3b928f3426e12ed6d27bc"
 
 # python3-misc for 'this' module, python3-image for colorsys (test_deferred_patching)
 RDEPENDS:${PN}-ptest += " \
@@ -19,6 +19,8 @@ RDEPENDS:${PN}-ptest += " \
 RDEPENDS:${PN}:append:class-target = " \
     python3-stringold \
     python3-threading \
+    python3-asyncio \
+    python3-json \
 "
 
 BBCLASSEXTEND = "native"
-- 
2.47.3


