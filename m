Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7977.1793701470806605402
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Nov 2026 02:24:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Yj0Fovyc;
 spf=pass (domain: konsulko.com, ip: 209.85.128.44, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a208d93758so42433175e9.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 02:24:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793701469; x=1794306269; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j6JCtEy9Xgo2Rk6Qjy9P6Gz8A2/LAwCof5QR2KCnFVw=;
        b=Yj0FovycCpvmqqk03ZYBmzB+DhmSFOKdEQypErkieFgKYqZ8Tiu3oXFBPRBFWhQ6sH
         egJRe9KfdzIiQoE0/pw65sa66N0a4U8xtTqWSevtaWFxMue7dOT0/4/dgCPZAR9KQjKZ
         oHp5kExCLlFprwx3Bs5YTuGEuymSFqbZ9qOoc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793701469; x=1794306269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=j6JCtEy9Xgo2Rk6Qjy9P6Gz8A2/LAwCof5QR2KCnFVw=;
        b=sZTW5ygYwbj2zjvLx//G9sSthgQgMYjVATPhZqn3+3QjnjotAsB+DYzHoDP8vtPu+J
         d6rfddPebD0S8ByI33OM75KEoxcQ2v0n3he5jlfvqMlO0uwZDlXIG3wzRoEf2VdHtBqH
         7pYsHxSmB3VECqjG89XyG26k1tNHffyBuE0nFFMooV+4PimJVKxCNrUd4JII6b0zNp21
         mexRlRFFQbSKG4hBqVTvSFmLOtSp/5v4rse6g6MLDH/ADiiWGznWyTxTtg4n6UVdu49F
         C2gDZDYiUXdaAntC7mRMbWHhZ9wdfNo/1H6VXdXiPxBbm7zj8L3V8edN7cMRFwC8/Dug
         UQkw==
X-Gm-Message-State: APuU4Z/oyW5Ch8fkRsey83PCeY2/Ix+s2c/gxg5ZYh1vS3R021BidvcO
	P2txsPwiyT2E729RckrBhqi48Y6CziK2raGUgnUQi4YqeCG3ctZR7pl7/z4I6rUELhOmyzvVe1i
	VlOj0
X-Gm-Gg: AYBFou3w37JmfM5oCosWMFXXNbc/0rv4n7dIAvvFyW0S6IgByY9XXV6xgnvOiVfglBK
	EUKwLKhw6ASqCQzgMegwUrtgjEe/8QiCitYOnJS1WrJlSgLozq0tyQflp0f8z6qv1NY6dVMMxeV
	U1T+fkEuLQB/9u6UXzQsfHneBvLA8hBs6rertFjoioPaluP+K0X5bWWDbkuB/zBpdRxcZ+bnfS9
	IPuX+VRB3GtW3nyeUlCr2iQYjFYtht7ymIOzBzpHWfsSSa3WyamKtXAiqFDKLxVn4Ac+0T8DV8v
	2e7DrxrA0Uqwjm6AtfIfmJ7V2Kqtkv/ins6xhx/fnCOV5yg2ww7PRWR1qLWV1R8U66jrsQNSMVb
	anvA4PF7OgQ6d5jBRdeLeSDMXJGDoFg4BBmIQwPi7NCJdVTwoQ/6Z2rniPI+goOsMb2LKIT/14r
	hSRz4yXIFM48tj3aIsImfTH2A0SZL1MUahmoRse2FHAqJsSv4zpMwDlSSJj1bxyl2MzEhFdiD1H
	/VH1rgp/m6C0/R6O4C9NV+9WINjt57kAOljhFv3+BzKU7U/hymIaxIx3zy8vVFmFSAfwItCN9/M
	+bZdVm/s2kMg/lWpplwvokI8i47gbjjnNpdAdkLWLZZ5sDmXLxtyyWMN22Lvyqrz/Xh+KTv2/kU
	bPLdBzeAA7X7bVsssvkNHl15H+trzNKxC5WX7EyLXEK3PdhBzW5Gw5w==
X-Received: by 2002:a05:600c:1907:b0:4a2:1a:a116 with SMTP id 5b1f17b1804b1-4ac16fa15edmr292424695e9.0.1793701469117;
        Tue, 03 Nov 2026 02:24:29 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a9fafe08sm73017225e9.3.2026.11.03.02.24.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 02:24:28 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 20/22] python3-wrapt: Upgrade 2.5.1 -> 2.5.2
Date: Tue,  3 Nov 2026 12:23:48 +0200
Message-ID: <20261103102350.1952237-20-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261103102350.1952237-1-leon.anavi@konsulko.com>
References: <20261103102350.1952237-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 10:24:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131783
Content-Type: text/plain; charset="utf-8"

Upgrade to release 2.5.2:

- The special methods added to the class generated for an
  wrapt.AutoObjectProxy, and adjusted when __wrapped__ was
  reassigned, were determined by inspecting the wrapped object
  itself, rather than the type of the wrapped object. As special
  methods are only ever looked up on the type of an object, this
  gave the wrong result in several cases. When the wrapped object
  was a class, the special methods it defined for its instances
  were added to the proxy class, so a proxy for a class defining
  __set_name__() raised TypeError when assigned to an attribute in
  a class body, a proxy for a class defining __get__() was bound as
  a descriptor on attribute access, and a proxy for a class
  defining __await__() or __iter__() was reported as awaitable or
  iterable by inspect.isawaitable() and collections.abc checks,
  even though the class itself was not. Special methods provided by
  the metaclass of a wrapped class, such as __iter__(), were not
  added to the proxy class. When the wrapped object was an
  instance, instance attributes shadowing the dunder names were
  treated as special methods of the wrapped object, and special
  methods which a __dir__() method of the wrapped object did not
  report were missed. The special methods are now always determined
  from the type of the wrapped object, so a proxy behaves the same
  as the object it wraps. This also covers a wrapt.LazyObjectProxy
  whose factory returns an object, as resolving the wrapped object
  reassigns __wrapped__. With thanks to ybai08 for pull request
  #361 which identified the issue.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-wrapt_2.5.1.bb => python3-wrapt_2.5.2.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-wrapt_2.5.1.bb => python3-wrapt_2.5.2.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-wrapt_2.5.1.bb b/meta-python/recipes-devtools/python/python3-wrapt_2.5.2.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-wrapt_2.5.1.bb
rename to meta-python/recipes-devtools/python/python3-wrapt_2.5.2.bb
index 8c75c173c3..6d1f2cf4c9 100644
--- a/meta-python/recipes-devtools/python/python3-wrapt_2.5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-wrapt_2.5.2.bb
@@ -8,7 +8,7 @@ inherit pypi python_setuptools_build_meta ptest-python-pytest
 
 DEPENDS += "python3-wheel-native"
 
-SRC_URI[sha256sum] = "f595bb0185aab3e9dc31950c95d914f56ea8278810c3b928f3426e12ed6d27bc"
+SRC_URI[sha256sum] = "551cb49e88b3722faad780303833bc4fa70685fb1773270fb98b40d39d9fddbf"
 
 # python3-misc for 'this' module, python3-image for colorsys (test_deferred_patching)
 RDEPENDS:${PN}-ptest += " \
-- 
2.47.3

