Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48054.1795411892409158402
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Nov 2026 21:31:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=dwdO/RMK;
 spf=pass (domain: gmail.com, ip: 74.125.82.181, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3282db206d3so8807519eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Nov 2026 21:31:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795411892; x=1796016692; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9Q+uwKbZX7QeOw4lse4/ANIaMZPiOsKqisJFwGgsGMw=;
        b=dwdO/RMKo7sijtLvfc7KuvzyFiCt6zJ0ZWsM/3oU5FJ7BPKi4lLLPjRXgMZYGWtx//
         PAEaCBuQc+YvZhYCc8EeQIruygXgu3KaG2tsNo66bW1G4LpNb+fINj2EeV612MSUdrOr
         uKpbRqKlUyzD1xhPgTuWnmWDCKTzNg6NBLAkiNQ0eIvpeHqus0a2XBKXBj5C9r5/nx7g
         mN7+KmwZDVehGftOknPXlbWCFphcY0o3Q9YHCBx9p2NOdrjkwAH/4iLV80s2wHsQGsAs
         vlDOMIi7HoQi+gKpc/HzXP7S3XxGlgBjjxXWkXZQlaQD/kHxvTG5FYJx/MX2Mrgf/QjL
         MNEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795411892; x=1796016692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9Q+uwKbZX7QeOw4lse4/ANIaMZPiOsKqisJFwGgsGMw=;
        b=ZjMdvkUu3gtrYbbvK0nhOuBlNteNk3k0J78HCFEgSHfGohGmMRn5ZsR2Oph2H+6GsU
         OI70ZCnBvLASC6SVDo62GH2F1zPu5DuiqxdezUndu9nqci37oR5UIej3H0yPRFB8Z5/e
         3v+cmN1HwOrmqSYfhPf1v7WGw43Vt0KkAJQZZfPzKF4S7m0p//+6L8YNtXk3Ma2qUv1Y
         anPD1cbO0o+iefT8DbMjcRQsZjZ7j4A4y8arO2tZx20XGGH/9pirbwpgmDP3bDQ2JvJr
         LrXSeZh+DS6O8h3H5R4YsQVfZ8yWJHgbILggIYrblctST8gSY1rTOj+ZXbLV9oYnvpJo
         jsDw==
X-Gm-Message-State: APuU4Z87g9FyZyObNM3zJJSJy69zWlGv1+dghnm1+o8/BrA5UGthDqBP
	G8JwkOpafjWiBp98UgXH4XtMfhCZn79cLk7cRzzxpe1dGxmlEyWgnhDZX+6hfVBn5LU=
X-Gm-Gg: AZFdTZetTWXRcZ5ZxSgXVPRT5tSihdvRtG+tP5X46wfHHq+OCtQ55HIW/2ZQw6CYUtG
	1L0kiiidCMT8Whyvkys6U35QWpFqLSg4jshXAwuc26MdutnSTF+/y2P1c/Nk/i8E2d6NVhdX61M
	O6WLYhZfZr+O+Nh7dt9NtooeXTiLVNz3G/6/sAWlMNf2OKH75OikILIk/+6TumsduA/gkw0VZLF
	ChBmzprQ/FLatp7ZRkdLogn9NLPfw4izxi2ESCNfOYfb+XVA02UhXx/4KvX23kN9j9NUXx3iWW5
	N7lHj/xm1qyFt8qwF9sBSsMukE6NWA/fdzcPyNBXVjMqXijpnvjdqyYjQ0Cw2HsJc5HNMLSLvQg
	al91rvv0W9cQavpnvd5Rp7kuDRvLK9elpmpGqPNd0RiVzGggxCzT3FbMtTQelHBuzXBpty6T4OC
	anjFX7yKRNJ0l4EGIUkOi1Qq9Suu7jqchjqWUww8YSLy0LduIyT5LdvNUz+yJ2zF/bVNfRAmeF0
	Y1d6DKhp/xKvRlGUsesQQNp0fSb7FoxTMpzNMddaTdbdphG+GKPiGrFiyoGO3SyNxMURLNTHKDC
	OsKFzxdyTIvT7nF4zSOnUO+JnYZdcsHg7/1xGpDWA9eAm07GGTheUCJcBodlA299i0qSKl3Z0U9
	p+8UGORjPLc6YWTduTjCe6lIkWLa8CYERDDo9+v38vMUBgGh4mP0hJw41m4gvY9pXDW75g4zfuh
	wyE5P/TQglySkqyEGDQ9gGprHpXRN7dmukaK1WJkR07m/Fv0T5W9gjEwVTj30rZA9SphBi7tk2N
	1woxi24tlozs6pweBVU2N79RAYulMoxL7igAN5xflgua1YsBhZMxuRWvjNyK98O8OuMVFHI56N9
	e7h3oyEtnVxFfCz2TavVAnDMbg==
X-Received: by 2002:a05:7301:a23:b0:386:9ad5:6641 with SMTP id 5a478bee46e88-3869ad56b0emr7549839eec.32.1795411891749;
        Sun, 22 Nov 2026 21:31:31 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm36573136eec.26.2026.11.22.21.31.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:31:31 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 04/16] python3-google-auth: upgrade 2.62.2 -> 2.63.1
Date: Sun, 22 Nov 2026 21:29:34 -0800
Message-ID: <20261123052953.3658549-78-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
References: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 05:31:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132865
Content-Type: text/plain; charset="utf-8"

- Gate regional access boundary lookups behind an experimental
  environment variable (2.63.0)
- Support universe_domain in jwt and _jwt_async credentials (2.63.1)

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...hon3-google-auth_2.62.2.bb => python3-google-auth_2.63.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-auth_2.62.2.bb => python3-google-auth_2.63.1.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-google-auth_2.62.2.bb b/meta-python/recipes-devtools/python/python3-google-auth_2.63.1.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-google-auth_2.62.2.bb
rename to meta-python/recipes-devtools/python/python3-google-auth_2.63.1.bb
index 3883345f68..269ab8ac81 100644
--- a/meta-python/recipes-devtools/python/python3-google-auth_2.62.2.bb
+++ b/meta-python/recipes-devtools/python/python3-google-auth_2.63.1.bb
@@ -9,7 +9,7 @@ SRC_URI += " \
         file://0001-python3-google-auth-Skip-mTLS-tests-in-ptest-environ.patch \
         file://run-ptest \
 "
-SRC_URI[sha256sum] = "046c61a72d3a847d6df6417a7f0d5cf054e3b82bbcb54fb1e69d47880964049c"
+SRC_URI[sha256sum] = "f69f387dba9abe536fec87483a749485f2ef0c81bfa79f609d9873e57054a1a5"
 
 RDEPENDS:${PN}-ptest += " \
         python3-aioresponses \
