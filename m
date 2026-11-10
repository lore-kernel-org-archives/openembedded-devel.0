Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7.1794324454532334713
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Nov 2026 07:27:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=fOVfLcpM;
 spf=pass (domain: konsulko.com, ip: 209.85.128.53, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a5036bbac7so14143345e9.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 10 Nov 2026 07:27:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1794324453; x=1794929253; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pg7SvTlJrEYpAWLkWS34AiaqfsHP68VWK34KQhj5Olc=;
        b=fOVfLcpMn/Ly3vw4K/r11l7Ccat4UESmAX502SaQhrYwjjiVXJ28Nlch6l4x0t4w8J
         eyXKsc6UZYb/UzIi2A0ZbW2XUVFRDKtHoxQZJopOu2raeKHlnPQluJITEVczJHw2I/Dl
         WL3/D8OeKMo8kaFM7+PE9A2C+s+7kM5iHtXBw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794324453; x=1794929253;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pg7SvTlJrEYpAWLkWS34AiaqfsHP68VWK34KQhj5Olc=;
        b=0u1ddbvyriimz+Cr4VhJGon6ojjC67TGYorlOKG7oieQdjZvAoVkvDL6CIy14oNIOK
         LzyEf66tpPtP5tWpRLhdVW+aJU8BxFUgWemBe9DRx9X+6vCcdGZ4gqV0oLkynniXrMaR
         QI/cAxahYkWo0jJsJdxVVc637gYFotIw3mq4UusPBrq94mmvs9+eIvb+pb+zjUaRl8x6
         ggysDcw2mCGOjJ3985QSN8NHhNdChUlHb/iw4Lh8uHHS7DfZRQPZxLM6rPrb944k1HY1
         h2iKJhxEG/2YbqN8vQXoZjCeh728gNuvPVWARAkQJORNFlqjMyAZ/Fd4Eg/44uL9XKLQ
         LeUg==
X-Gm-Message-State: APuU4Z8/ZZcCrmsnx4ey6MUVpXGTpv7xQACufkf7Xr0fu5jlpGLaClSj
	2+CWAbJ21939Gnpwno5e+mSBWN4DaIqqy1TpTo49dcTK7cK9uRqoGhVJnAE4RYfV/s6DYdN5i5x
	x4Pey
X-Gm-Gg: AYBFou1T6vnIj333X07glNPyRhgoiQlo3FI8MWIDDGTpAsdVcb4zEU4kAHjSA6TRqgG
	XIFDhwEE9DsPTWnCZlDsPo+T+cFHxnZtDthBxvtmoHFJDZhIVJaRj9QFqCcuxeTwetXM9RmZWVo
	7aha0nt+KSHhNh2l+X7s6Vp5iQ/p83jPWkcjAxcoUR5B+QTNnZg8HMRhDYYJ4bVtUCaDOdrmwLw
	sFdTVsbeO1Ca58Sadis8fdMbXNgSxI/I1tZW1S5lSq54vjcNmnmsWWkUyjc9IOtGi5XElMaRswM
	jZDlpMS7eQylcPkpqsATwBqPY7mdyd2UGAu54Mj2+LWDELhTjj5+B7hZBIXVgV1NSx2BDr5FibK
	XI9Cog4GAGiiTYaYsWNeyHwdYBwBR03+mGqYwpCw6EorjcdGvhUnuOnkiBRFHvppWNuOgLxNFka
	GFMc/aD5D9Vm8CItu15+LhYbSA1TuiamHlYoY/fUgi/8aIdiBrs03+wGbgDQHn2xfDs0SLO+AoY
	uY2fHJ8Ac56p/PILK5p0aXqwmsrwq+SaHMYTRQo7Lb6NVjd4EUc1DVc3N5cZ7iICyVstuIAmlnv
	kCg+IjsDgCNKbSplmXzy+o/HKC8whENQnbB9KWameeja+/cItzcXAjpZhOXddid0UYcDOSHzl2r
	5196BiGUR4+fkISNxy8/uWRh/BYL+s0s2diH4WP+LCKbS2VfAAck8Og==
X-Received: by 2002:a05:600c:4584:b0:4a2:167a:c946 with SMTP id 5b1f17b1804b1-4ba0233e77bmr50962765e9.13.1794324452205;
        Tue, 10 Nov 2026 07:27:32 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498369a3f4esm6064071f8f.53.2026.11.10.07.27.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 07:27:31 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 01/19] python3-cachetools: Upgrade 7.2.8 -> 8.0.0
Date: Tue, 10 Nov 2026 17:27:11 +0200
Message-ID: <20261110152729.1065911-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 10 Nov 2026 15:27:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132075
Content-Type: text/plain; charset="utf-8"

Upgrade to release 8.0.0:

- Drop Python 3.10 support (breaking change).
- Drop support for deprecated @cachedmethod features (breaking
  change).
- Drop support for @cached(cache=None) (breaking change).
- Require custom cache classes to support __len__ when used with
  info=True (breaking change).
- Refactor _CacheInfo and make it public as CacheInfo (potentially
  breaking change).
- Return callable objects instead of functions from @cached and the
  cachetools.func decorators (potentially breaking change).
- Do not set cache_info to None on @cached wrappers if info is not
  set (potentially breaking change).
- Raise TypeError for @cachedmethod descriptors assigned after
  class creation, i.e. without __set_name__ being called
  (potentially breaking change).
- Various performance improvements.
- Various documentation improvements.
- Various test improvements.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-cachetools_7.2.8.bb => python3-cachetools_8.0.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cachetools_7.2.8.bb => python3-cachetools_8.0.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-cachetools_7.2.8.bb b/meta-python/recipes-devtools/python/python3-cachetools_8.0.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-cachetools_7.2.8.bb
rename to meta-python/recipes-devtools/python/python3-cachetools_8.0.0.bb
index f5136743b9..e2c9158a64 100644
--- a/meta-python/recipes-devtools/python/python3-cachetools_7.2.8.bb
+++ b/meta-python/recipes-devtools/python/python3-cachetools_8.0.0.bb
@@ -18,6 +18,6 @@ RDEPENDS:${PN} += " \
 	python3-math \
 "
 
-SRC_URI[sha256sum] = "3f9b146b2160975da273e7c23ec882f3996b65df608150d52083c07de0682075"
+SRC_URI[sha256sum] = "5ed01bd676800d51f0025605e4fd8ad0891550513e7b0a4c3da478463764e5c3"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.47.3

