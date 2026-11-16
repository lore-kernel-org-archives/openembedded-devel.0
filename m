Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33637.1794851672106015591
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2026 09:54:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=mTW0+vL/;
 spf=pass (domain: gmail.com, ip: 74.125.82.170, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso1139332eec.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 09:54:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851671; x=1795456471; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IpdnBreGeaJhGL7JvR5W1YQEqw06nELyOpIfH1upRfM=;
        b=mTW0+vL/X1IhGrdKJmhiiMalnRtG8w1N2Vt4L4wzWqb+T/m8e2Z71+P47kwl3gSAgl
         tei86ud+7d6QcR8dGCxgVTQ4to1DmCc3pVPt+/PGGvje8TN12Q/5iAGutvB/PpQf18ON
         8QrzH5dBaqY4q7IcZsfa8TGNuLDQ5TiJ7cCTDF7cdqo9u9seDCr0Eg8F7nEsNHnpigGN
         p+vAbHDYx2qKwRFO7fONEXbVZopaRc4inTPkpTO/m6H+riLqssgQgVij80dV5IPd9LSV
         Cy+bZBqrybBsC/g0mRYVYAWz6zSycxeqaYXO8TJN2AQMUGFJ5LSnd9YIz2zl8N/xzCaW
         NyGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851671; x=1795456471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IpdnBreGeaJhGL7JvR5W1YQEqw06nELyOpIfH1upRfM=;
        b=tOEaC/sDUP5AA3QriKZmDwHxAT8IK4pfRfBUWikeqJpFCiQh+/x1PfQNazmAoPvqK4
         rb9yyTbX/h1E8IPl2wrSVrnjyL1XjKUuJv4YMhb1tVh+qaplYC4QnWPxERBnLnzkglxm
         sn7IRZGx5kXWSDvSYx7SM4GtwQE80F769pbLYVFXyA8SApelsiJeApwR9UK8zMhDlUp1
         kO3dBdwEBV5FXuDeF0NU5AxUJM4yEJsfBzLYrG0n4d7sWBuUWbg20iRE373W5f6q36Mz
         LCBp8BExawIQTLxdCOe1fHkCze1Z4NJLel58Jgv+hl5KJ7JjDbhfVJO3ry01ziYGJaWK
         RIRw==
X-Gm-Message-State: APuU4Z/om2NioIumBbaPsLPq07RiunlJdCjovSxN8a2b/4EyTmVqT/W4
	lLRMuuuGz1cydyfLWoU24psm4hXfULTsbGwEDyYO7Kssny4DKqE5ByBLg+8aHEyC
X-Gm-Gg: AZFdTZdUXUjt7GsQ8KEy2U+rc7KROIqyCDICQ9CL413VGexvoGjWUjlOtZXpLY65lYS
	wbNUsnCQtxuQHV0TZ+e0RckuUcSSh3LuCJWAaTJoTVs8aQcjoCThcIxq8udfy5NhD/QNsHGQjTc
	NAYNnjiwvb1Kc4Gt9vq/w9hYFP3KaNtt8pYKYXKXxl0teDfLuKbKFvE0rODwk3o+tb0hh4KmOig
	29TS4gnq/mceYfiTLlQS3L46uWKPs51nQnFm+mfb6dd4vKWQXoQQkzF7FjQ3pfJmrpPRtcCJJoq
	co+y0AxSiJzhonWNNIKqSMSxHSjUXWJFVPoYV/6OC0aBt44UdIaAFZXX76eiJOMyPCg6ejFI7Hg
	xwpBc9VvF5+LB9e2Z5OyfnNeek5RcKvlG2ZZQuMLmJDGDVLqveBLvlOeHU7iZAAMB9LTLeJdP1R
	4PTVxicvQd6GNAgBAjfC3BDHGufL0X0/JzblHvNsy/zYeRlNJsnsffX7K/HXbKdBtUOoFSHAhm1
	uDEvQMUbkNNJ25fYF5RnlOrvVKFcowitCyI8V+27p+x/WLde2jufQcUXvC1bqmjZQvMSk4oatlb
	7yylGneANSR9gSOtAu/O4M33q2jbrTTrwtu2DVzF9Vb0n3RWyKo9vfSUKtj8Fm4+GQLgdX7sv58
	ExsWnhRC5Np+eYC/7bq+JRlbpboTYsaLu86c9JC/gNNZDQpzjWP8Zb3tthcoXr4GmRdZTgddbrY
	WTJrhdQfB4/5yrjIVFL4FfHKxq7LByBwrNaRXv6L+pJ/yYwmttyzqcWT9Iv4HSaaJgS8jTnQi5R
	Mo7G8CTVqQX+lfsB7MUCwc4kgosUaMhbGzTh5bMAecfqobIxWNavjDGjflK7XGfDNQ+7f5c8ipU
	O8xC8Nj5Uh1cWLYXAZjB+5NF3A==
X-Received: by 2002:a05:7301:658a:b0:381:1eb7:938e with SMTP id 5a478bee46e88-3811eb7b15bmr60296eec.4.1794851671304;
        Mon, 16 Nov 2026 09:54:31 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm48391884eec.19.2026.11.16.09.54.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:54:29 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 017/105] python3-croniter: upgrade 6.2.4 -> 7.0.0
Date: Mon, 16 Nov 2026 09:52:29 -0800
Message-ID: <20261116175359.342679-17-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
References: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 17:54:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132473
Content-Type: text/plain; charset="utf-8"

Rework the build dependency pin patch to drop the pins; upstream now
pins hatchling==1.33.0, newer than OE has.

Changes:
- 7.0.0 is a major release: bug fixes change what some valid
  expressions mean; read the upstream "Upgrading to 7.0" section.
- Breaking: a step starting at the field maximum ("59/15") now means
  that single value, not the whole field; expand_from_start_time=True
  now keeps range bounds and reads phase in the start time's zone.
- Breaking: more invalid expressions raise CroniterBadCronError
  (non-ASCII digits, out-of-range H()/R() ranges, "1#0"); schedules
  with no match raise CroniterBadDateError.
- max_years_between_matches must now be an int >= 1 or None.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...r-versions-of-trove-classifiers-and-.patch | 31 +++++++++----------
 ...ter_6.2.4.bb => python3-croniter_7.0.0.bb} |  2 +-
 2 files changed, 16 insertions(+), 17 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-croniter_6.2.4.bb => python3-croniter_7.0.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-croniter/0001-Allow-using-newer-versions-of-trove-classifiers-and-.patch b/meta-python/recipes-devtools/python/python3-croniter/0001-Allow-using-newer-versions-of-trove-classifiers-and-.patch
index 9d8e400b3a..2c8170d8c5 100644
--- a/meta-python/recipes-devtools/python/python3-croniter/0001-Allow-using-newer-versions-of-trove-classifiers-and-.patch
+++ b/meta-python/recipes-devtools/python/python3-croniter/0001-Allow-using-newer-versions-of-trove-classifiers-and-.patch
@@ -5,15 +5,14 @@ Subject: [PATCH] Allow using newer versions of build dependencies
 
 The pyproject.toml pins exact (==) versions of all build-system
 requirements. When building with --no-isolation (as OE does), pip uses
-the build dependencies already present in the sysroot, which are newer
-than the pinned versions, e.g.:
+the build dependencies already present in the sysroot, which differ
+from the pinned versions, e.g.:
 
   ERROR Missing dependencies:
-        packaging==26.0
-        hatchling==1.29.0
+        hatchling==1.33.0
 
-Relax the exact pins to >= so that the (newer) provided versions
-satisfy the requirements.
+Drop the exact pins so that the provided versions satisfy the
+requirements.
 
 Upstream-Status: Pending
 
@@ -24,21 +23,21 @@ Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
  1 file changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/pyproject.toml b/pyproject.toml
-index 657cc21..d1b9ce3 100644
 --- a/pyproject.toml
 +++ b/pyproject.toml
 @@ -1,10 +1,10 @@
  [build-system]
  requires = [
--    "hatchling==1.30.1",
--    "packaging==26.2",
+-    "hatchling==1.33.0",
+-    "packaging==26.3",
 -    "pathspec==1.1.1",
--    "pluggy==1.6.0",
--    "trove-classifiers==2026.6.1.19",
-+    "hatchling>=1.30.1",
-+    "packaging>=26.2",
-+    "pathspec>=1.1.1",
-+    "pluggy>=1.6.0",
-+    "trove-classifiers>=2026.6.1.19",
+-    "pluggy==1.7.0",
+-    "trove-classifiers==2026.9.21.13",
++    "hatchling",
++    "packaging",
++    "pathspec",
++    "pluggy",
++    "trove-classifiers",
  ]
  build-backend = "hatchling.build"
+ 
diff --git a/meta-python/recipes-devtools/python/python3-croniter_6.2.4.bb b/meta-python/recipes-devtools/python/python3-croniter_7.0.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-croniter_6.2.4.bb
rename to meta-python/recipes-devtools/python/python3-croniter_7.0.0.bb
index 2058ec39b2..d691249dfa 100644
--- a/meta-python/recipes-devtools/python/python3-croniter_6.2.4.bb
+++ b/meta-python/recipes-devtools/python/python3-croniter_7.0.0.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b8ee59850b882cbf623188489ea748e2"
 
 SRC_URI += "file://0001-Allow-using-newer-versions-of-trove-classifiers-and-.patch"
-SRC_URI[sha256sum] = "fc124f751b1b04805c2a04b061898b436b45ab2320b045e1e052ea895de65189"
+SRC_URI[sha256sum] = "a0b2568303c774f6a4ea2d4ce2e72b1ee911029c7070d64a1befe05cdb107f5a"
 
 inherit pypi python_hatchling
 
