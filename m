Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37CD9F3ED47
	for <webhook@archiver.kernel.org>; Sat, 11 Apr 2026 11:15:03 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.191320.1775906101064157989
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Apr 2026 04:15:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=gVLbPb0Q;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2b258576d8cso17182465ad.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 11 Apr 2026 04:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775906100; x=1776510900; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5iO1WDza3/HXp2IsSfZvOJOmE9sQrYRd0s3bLTsi9iw=;
        b=gVLbPb0QZuq4Wo1N2LhkghgOQ7iWrJnFfaAYhOrIYePFH5mhzxEJwvDpkAyfBm4Qcd
         Ft7nslLvW2HGSQgXkuWnr8wIwIN+Q2+Vig29CzXq93KftplZa6i70zTkAnyYR1YlF4qI
         T/oHGRT92N/oY+eC7im1JHH6aTIrLhZfpKcOYaxeVFpnk4VVGWBy+zNFRZXe5jYFKCLP
         1ePVtqszAlz+JYWmHbM/wKxrJR8OElPgvqnoUk8ACzSrMdvhvpzZm9SSwTuNyVei6FmJ
         xFuEuEg3qrmFomlf5v7s4sjYeTdoPu1cooK1mPBcse+3aa9iuBDgF+dkwDiPADQl8W10
         P2rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775906100; x=1776510900;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5iO1WDza3/HXp2IsSfZvOJOmE9sQrYRd0s3bLTsi9iw=;
        b=WQqN6RExG67F2biX1uyju/ptW+qz91n0iPAsqJ4Aem/hfyBryonAjcVcKrzBt8NaJH
         tSR8Xo4yTbyOsbHGItxsfk8giB6eiaCdWAR1pmzPOVC8f9PACI+aqjk5Lh1BEqgxmkGJ
         ltbw54fDDVgt0pyVX6Hx+D/Zuu4v6xpZpndW+dq2jVNyzLQWVV+Nv3YIIxiD1i1ETZI2
         Lu6skEVu/csrpbJOY+nFWnS/hvhbgmMgc8Lsexrd4nPwkJw7o2d+M0QhK8vZkdL4wSJ1
         Srfq0z7aGn1UdBzFI/WZLBYAhQrQhZrMgT7JuhyzXB7Pqjg3yBNE3E1DG3wlD7W2oI5J
         Cz4A==
X-Gm-Message-State: AOJu0YydxQB7Phy81GwYHqt41STRFXz+YZYVVVIuLkaI+oykwh8wCpIg
	XzdUcL/DduWWgW50MhIAUEv7bV+MLEsX1SUYqPyAAVBI5DuGgtwFChIIUHYzrg==
X-Gm-Gg: AeBDiev/tlfLgiv1BOmVmXI4+7AEE08Zk9InpC35T1LPre9bVmuhuSQXnzpiLBKFqv6
	LFgtyY4sCINKqHcrOVpbWY2NHNKm56uNvNYgIe5YSRBv1La+KH3jCE9GUE2uFPo60ZLOmvJX9VB
	Gkviq5p7C/GXdeKWxDY/CTSO9PGPzKcYuxJQaOmX0rc58ExtwRL3OuVCjA/O5hOMneBH0NRXT88
	mY2hE4M/iWkpf/lIkx9FySCfxImLRPkDZvEBA7T1C5d01Vv6OCP6HY2LWLW98yJrTM0iJRfGisC
	pjzBbUUKuPaZujNaWLYXIoF6HdeaL4DSJ65DV3oeM0S/qXUivPySqTvsGUkCqXUxIfbbfYizg2S
	/d/LvilMl4wk/VdjO9mdziToEO1Zq5Wo37jjaT6ik/E1cf8g4SMpWlOHXK9qKlkjwl9f1hLNCbH
	oc2uRzxWyhtpimKZHgH5KGLN3Zx6JpSvKq+UM9
X-Received: by 2002:a05:6a20:2451:b0:398:71e4:6282 with SMTP id adf61e73a8af0-39fe3c1a50amr7932316637.4.1775906099904;
        Sat, 11 Apr 2026 04:14:59 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.108.128])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c793488d824sm130447a12.16.2026.04.11.04.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 04:14:59 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][scarthgap][PATCH 1/5] python3-django: upgrade 4.2.29 -> 4.2.30
Date: Sat, 11 Apr 2026 23:14:45 +1200
Message-ID: <20260411111451.2739610-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 11 Apr 2026 11:15:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126253

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Release Notes:
https://docs.djangoproject.com/en/dev/releases/4.2.30/

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../0001-lower-setuptools-requirements.patch                    | 0
 .../{python3-django_4.2.29.bb => python3-django_4.2.30.bb}      | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-django-4.2.29 => python3-django-4.2.30}/0001-lower-setuptools-requirements.patch (100%)
 rename meta-python/recipes-devtools/python/{python3-django_4.2.29.bb => python3-django_4.2.30.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-django-4.2.29/0001-lower-setuptools-requirements.patch b/meta-python/recipes-devtools/python/python3-django-4.2.30/0001-lower-setuptools-requirements.patch
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-django-4.2.29/0001-lower-setuptools-requirements.patch
rename to meta-python/recipes-devtools/python/python3-django-4.2.30/0001-lower-setuptools-requirements.patch
diff --git a/meta-python/recipes-devtools/python/python3-django_4.2.29.bb b/meta-python/recipes-devtools/python/python3-django_4.2.30.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-django_4.2.29.bb
rename to meta-python/recipes-devtools/python/python3-django_4.2.30.bb
index c8d2c17589..146cd1eb90 100644
--- a/meta-python/recipes-devtools/python/python3-django_4.2.29.bb
+++ b/meta-python/recipes-devtools/python/python3-django_4.2.30.bb
@@ -2,7 +2,7 @@ require python-django.inc
 inherit python_setuptools_build_meta
 
 SRC_URI += "file://0001-lower-setuptools-requirements.patch"
-SRC_URI[sha256sum] = "86d91bc8086569c8d08f9c55888b583a921ac1f95ed3bdc7d5659d4709542014"
+SRC_URI[sha256sum] = "4ebc7a434e3819db6cf4b399fb5b3f536310a30e8486f08b66886840be84b37c"
 
 RDEPENDS:${PN} += "\
     python3-sqlparse \

