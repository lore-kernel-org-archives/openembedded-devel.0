Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14869.1793092902205308482
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 02:21:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=pHc1ANnR;
 spf=pass (domain: konsulko.com, ip: 209.85.128.48, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a2072b9832so4249895e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 02:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793092900; x=1793697700; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8k0qHWcXImpuCzPH/XsijuHAJomk9ZCrLIujgf3ZSAw=;
        b=pHc1ANnRU0eSOBdVLR2VnV3QeQcTPSMjOXDD+ZkBecRklHhWQldgIYWU77/+qK44wu
         X6iM6CoqPqEk186mlZg+K1iWAjiWjVo5wCV/5WGqSAjSqIgxPQ8ZHsEBQxplfeQ8+HY6
         1FnJ5urHYcpwSs2JFrzrC5U3WgplyZMu5yn24=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793092900; x=1793697700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8k0qHWcXImpuCzPH/XsijuHAJomk9ZCrLIujgf3ZSAw=;
        b=pTe+dOPOi3i+XTds/JcuAshax0YPHqLiX9L8Mh7FN1rs6xjCrjBlxtIMsZj/M+B08v
         1IpGS8hJzqrNwMCQvqpdAl2tp2XXA4atVg6gurFOSaZB12rMQxKaw68jCHaF6pjhRfz8
         YmADut1zchfAK14/qKp+vlJiBJlriFSaZgA3e7xNbJPN7g3mzI78CuLtlQwfCOp5/KHZ
         VtOLQ2mDqBMvcmYhaXqb7wtsLcVUPAmf+A2URfMRZvSIjktrIPgyQHEw2tlghMQf1Eu1
         jVR0SoGBDYDUuObUm/0auQQBco8b0kgBQfJF6TznUuhN/f7T0qkkiYNbAsJlKRBB6cYf
         e9Pg==
X-Gm-Message-State: AFq9FYKRf/T45DShY4oSA0mRjyCJ3UTGAzK7YoFoV9HgX9k1f/Q2jaUu
	0zp6mfMSXYJtKf4Sj0X43HVgLjtqlohxDkl9K9m+Yd0EMUepROpxyXgVCiYFBlVBiKj+grmEWWm
	o9HTm
X-Gm-Gg: AYBFou22zODzMR/7du6hBPd5jYrxkf8okOkw3Km9tGl2965ZtD2lMMMovA2FXi6vJVt
	KzJK+V6W+WtXpq8U9WNmmEuyBnt6GI4eVaI2Kyodj/WmS4CJ9074lCLgvoxflQvZLP6au0DhSvu
	DmdmhVPXQafWPf0ENcGvMOKFLyTLY4NU/0kyk75O+T5+kyPk/ZMqUvF+z7Zo6b/WcQg9s1GaQWz
	cfRGA0NBEFUGQ5aaw7QF9/kl9ntjGdeXmdqhxxEDzAwH8c2CUngPOHFt1c30p99KAp93r68ykT8
	JyvTK/y8FqQBPHzBQi1zdlIKUacy3stEma9tf15v24spTGPhDdYu1pethyH6Cc9Gs1wAupLeqNW
	ny4wkSuEXhj1PhLwNoMFQ+VDIAeDGx0+nOIIcyR1xcMicGS8z3h8FKxEEoliopH4Ft7bRYJZ+N0
	PSVUvnSDibt/o3hOS1gq5ZH8pCVpXYVEj3bF+DtcB6WdPcMJm+dbwWp8nLcVuU1Ao2/YX7qURUB
	CX2Y4jQRAvq6AbVw87y5gddlgOdNCUzDLWQwJVASt/Z1HSZqjov0jLa26C11cPDsYE4sCRrsfA2
	7/fp/LVm8twhqICCpxOODebn7nQ14/6b8UVYOGq3ym2C9YMDnkNqjub70MGUtx7I4g==
X-Received: by 2002:a05:600c:c84:b0:4a2:10f9:37db with SMTP id 5b1f17b1804b1-4a7c0a4b2efmr47889405e9.7.1793092900108;
        Tue, 27 Oct 2026 02:21:40 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a04ad39sm660086505e9.1.2026.10.27.02.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 02:21:37 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 55/61] python3-vector: Upgrade 1.8.1 -> 1.9.0
Date: Tue, 27 Oct 2026 11:20:22 +0200
Message-ID: <20261027092028.782979-55-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261027092028.782979-1-leon.anavi@konsulko.com>
References: <20261027092028.782979-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 09:21:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131519
Content-Type: text/plain; charset="utf-8"

Upgrade to release 1.9.0:

What's Changed:

Features:

- perf: cache coordinate-type and handler lookups in dispatch
- ci: run Awkward backend tests on GPU
- perf(awkward): gather each operand's coordinates with one carry
- feat: validate coordinate names in one place, for every backend
- feat: test on Python 3.15 and 3.15t
- fix: dot/eta closer to ROOT, compare vector results with ROOT's.

Fixes:

- fix: not_equal, is_perpendicular, and is_spacelike predicate
  logic
- fix: correct awkward backend field-leak, behavior, and dict-input
  bugs
- fix: correct multiple bugs in the NumPy backend
- fix: exports crash without optional deps, Vector.like() type
  safety, and docstring corrections
- fix: correct several Numba backend bugs
- fix: symbolic sign, Max/Min, and numeric copysign in the SymPy
  backend
- fix: correct overload param names, __array__ protocol,
  _wrap_result precedence, duplicate alias guard
- fix: align Lorentz/planar coordinate conventions across
  signatures
- fix: do not use Self on Python 3.10
- fix: give a useful error when ProjectionClass*D is missing

Documentation:

- feat(docs): add llms.txt and Markdown page versions

Maintenance:

- chore: fix noxfile, CI pass gate, and stale config
- Dependencies update
- chore: secure CI
- ci: use nox session for gpu ci

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-vector_1.8.1.bb => python3-vector_1.9.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-vector_1.8.1.bb => python3-vector_1.9.0.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-vector_1.8.1.bb b/meta-python/recipes-devtools/python/python3-vector_1.9.0.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-vector_1.8.1.bb
rename to meta-python/recipes-devtools/python/python3-vector_1.9.0.bb
index b04184cc88..0aa804fb58 100644
--- a/meta-python/recipes-devtools/python/python3-vector_1.8.1.bb
+++ b/meta-python/recipes-devtools/python/python3-vector_1.9.0.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=b9f683a957276148387db50971a7b3ef"
 
 DEPENDS += "python3-hatch-vcs-native"
 
-SRC_URI[sha256sum] = "1b7658a4fbc7b593342506a1b84eff3459745b09c98c3be83ed58df31fd29b43"
+SRC_URI[sha256sum] = "72128b48b6a72af965babd63dccc5a110f0729e6404dcd8c5c75eaac31b80d84"
 
 inherit pypi python_hatchling
 
-- 
2.47.3

