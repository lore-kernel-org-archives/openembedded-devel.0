Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39581.1793009965964596726
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Oct 2026 03:19:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=GoLdn0iV;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cc4be0e5351so859629a12.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 26 Oct 2026 03:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793009965; x=1793614765; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=75VYq1DXQg+OBSh6+P6xeaheaAaQsaT1yu2VLaj86xo=;
        b=GoLdn0iVMw6gsobiczJWq2N+B8Qb2H+WxEFA7lTexd7g2YhHKlXNicBW+lkbgMn0hF
         kg1gX1711PtFeQZ1bNUf1UjsR6IfIyRR7kOw/KZ1G+wLAgJDjLablcenIr3zSFDSAdgc
         /UzNeyl5ONpUZPzPWEQPmK47NR/93+9hGsCSD2L8uQ8bIkxsQxFTKzBpHmKY6+Ahfe5K
         OQSI92XFdLBxqVYfBCT3iqt06hgDNG9r5XmA+drsxN0v5ZsmP0yP7SwFWwKnFGG58qPb
         OTKlzTA/RmC9VhPGnzQBa981clVbvE8nPdZzJoHP5/bYRVRMAVwjhLrVtAGFtTpT6ELw
         HacQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793009965; x=1793614765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=75VYq1DXQg+OBSh6+P6xeaheaAaQsaT1yu2VLaj86xo=;
        b=ouxTfOd29hX8a4yH/cy+k6+g2UaNPfUnPX5fWxH9HU2980qpBKagDVl3Y96YGaL5O1
         FgJhbzyELLvcp9auBhSqAs9FqUumeahQppvOw5GWDOWmo1K1Nq38BAX12W/bBRGkySYZ
         4HnIP5MFjPFfhpqQ8M5MxwRpKhQdOlgfIfJy7rw65ZGGcD6jJUnVxH234GqfNvCNisX8
         K/MVqaejkZaRjzPJCdh/j8Qw5115FSS9TG8L/G38uh89+ZxCuwBrUdjmkoK5HMvX9czy
         YYYsssOX32iM5tjs6phT7w4+o/pLIVWZAEzjajA9+K+slzQnKbk1YS2HAhGwzaM11Cd4
         gxpg==
X-Gm-Message-State: AFq9FYJfG3ZOGeiA0FpA9CHydq0U9XdHTkuF8aMMFoDP0nwSrZnQzM6D
	agrXQha+m4iJ46gY+Ji9VWnWKc+LGjSRdOrPneHGG3Y3ty+tUIM3mB+jFvkH9g==
X-Gm-Gg: AYBFou0HT5q6pZUM1XxXY6Wg41iAwbaG/Z5rOZz3WTQ5bsPFhMtRzePiCnkxKansAHe
	9rCOG8n6+/pcAqg9bfPcFGdiWUxpxtw1RUICUnZG/o8Znw7sZChy5Tl6uOnXkIDPBcxUU/DK+Z6
	LdJ5yTCeHs0IBrs6K56zHwP1Eb8O+XtnrtIt/3DTVTpxdWajykQ5cqvTogNZBSxtvIrNC3czY5K
	ECmZX5SK3DZ5AwR4YzrP5tykqv3GBY4vyb188yq/Hvzk4oRLqx6xzB6MqIg8jHTtQgTWzLAtOZx
	3rie66la1G/3YgLv3tVAkrqNqZRPVgqMO4c3m6Cy669nvHeSWDeGOQikrnTvzzEuy/jtUznwCmg
	rXLNn47FinvzhkyIIoQEwcGCkh+vjySBjcpHjIvU6czPm9kkeGnyS0mhDVFnT//vkVqVLia2uYS
	HNBxfBAYsrh95mMUkRLtFcI+87X0WZtMlbVIcKqUaa/2l5219U9Kf5BIovso1IWqnrhWuXb41aq
	tOXewOSoqXia233vGp3MPeDM5l9MOocvMepOSvr2doA/+UeDSzMs4vI/YdbB8K4VlrNUvgsGHRH
	hn0usEjmEdRyuYeF6FKebBtOLY9RKk8=
X-Received: by 2002:a17:90b:5787:b0:3a0:a912:e759 with SMTP id 98e67ed59e1d1-3adeaae6cf0mr5460984a91.25.1793009965136;
        Mon, 26 Oct 2026 03:19:25 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ccc4648dsm1383583a12.14.2026.10.26.03.19.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 03:19:24 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][blacksail][PATCH 9/10] python3-brotli: upgrade 1.2.0 -> 1.2.1
Date: Mon, 26 Oct 2026 23:18:49 +1300
Message-ID: <20261026101850.1470035-9-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261026101850.1470035-1-ankur.tyagi85@gmail.com>
References: <20261026101850.1470035-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 26 Oct 2026 10:19:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131431
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/google/brotli/blob/v1.2.1/CHANGELOG.md#121---2026-10-21

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../python/{python3-brotli_1.2.0.bb => python3-brotli_1.2.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-brotli_1.2.0.bb => python3-brotli_1.2.1.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-brotli_1.2.0.bb b/meta-python/recipes-devtools/python/python3-brotli_1.2.1.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-brotli_1.2.0.bb
rename to meta-python/recipes-devtools/python/python3-brotli_1.2.1.bb
index 8e493fd0a0..2c1bf23f64 100644
--- a/meta-python/recipes-devtools/python/python3-brotli_1.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-brotli_1.2.1.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=941ee9cd1609382f946352712a319b4b"
 
 CVE_PRODUCT = "brotli"
 
-SRC_URI[sha256sum] = "e310f77e41941c13340a95976fe66a8a95b01e783d430eeaf7a2f87e0a57dd0a"
+SRC_URI[sha256sum] = "02b2f7b5a83485efe448a44ddf7983def05c3bb1dcf917d4f7154070260e13de"
 
 inherit pypi pkgconfig python_setuptools_build_meta
 
