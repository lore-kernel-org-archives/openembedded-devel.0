Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 946B4CF9C77
	for <webhook@archiver.kernel.org>; Wed, 25 Sep 2024 06:24:43 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.9071.1727245473642578409
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Sep 2024 23:24:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Sll33oWL;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-208cf673b8dso62572865ad.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 24 Sep 2024 23:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727245473; x=1727850273; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ebJeyYIDgb7s7/GBGZFXFNPq5yQvRWkhPrG2ekeq7I=;
        b=Sll33oWLqTX3yH8Y99ISX0iXy+oYolHUctdJeD5FyVTbawegu80PLVKQHf3n/G6cde
         98vOrd6BlucgVwXC1AyxPxneGVNlbnO14YC3LPrefZ2ynXGSSNxVGDdwUZQy8Z4MP0Ad
         UkJp0/CPzqzNubd4N6daFL6IbBhIwV5lyBbOfts7TWKqwTW0oijIpXvU/FFaVnr4nfP5
         NL+j4kD8gzh1Ci5KEgvsV0liZheLNSHEurmddTJahzm9AtXhkHFSKEZRZmQAHBQB5Dmn
         XBzc1ni2pncmkaXoYk28KUehA+Z8efrXAgIHK4cBwARIG3LLv+uLOAwugucoMCNW+iYz
         f+1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727245473; x=1727850273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1ebJeyYIDgb7s7/GBGZFXFNPq5yQvRWkhPrG2ekeq7I=;
        b=BGiMr8tSSdMksLtxCyPY3+sNczapT0fPgI219dX+Sz21xBlhUSRKQXDZ6azOalwJtM
         ebxvb5PA9qXGIpZIe8p1Nhp87PEKZUvaR0BUbYsypPQK19EZQykLv5+cbiNEbzKdZd6z
         Z58NyBu8atiLSlPYE95wgODw4xyyN7wkoZeN0+G4uHDCCNZQj7thOwc3hhroYMxXuBtn
         s+/iwiu7eeBFIjuDWmgRx3gwwE1HBhQxluuUtOTiJDy5wOTTuiGjAmE5ZtGo9MnLM5D6
         bfLeFi2bX3vzcv23OolUHwDAMr5tfIBHdxe8sVqNh2MURo1bucOzPW9349067AUtozB3
         T0Tg==
X-Gm-Message-State: AOJu0YwlrtfWGO7sUX4eiwIRPxtd0x9GCREQwWvyWpRRda5dTEi5qtUV
	b6M3m9vt1A55ZBP8AYJodkzEmn4VKZYnwPUaEfdrXM3SrM3YTWwZKbNsfBc4
X-Google-Smtp-Source: AGHT+IFksDf5zaG3n6C3FOJahdJWq+/BtG+bgumYafbdsUVB06zbQv84WvsobW2IT/c6VTGLYqHC3w==
X-Received: by 2002:a17:902:f601:b0:202:51ca:9823 with SMTP id d9443c01a7336-20afc4ca033mr26515505ad.46.1727245472781;
        Tue, 24 Sep 2024 23:24:32 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::f72b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7e6b7c46f04sm2106309a12.38.2024.09.24.23.24.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 23:24:32 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 7/9] python3-outcome: Add recipe
Date: Tue, 24 Sep 2024 23:24:20 -0700
Message-ID: <20240925062422.3146738-7-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20240925062422.3146738-1-raj.khem@gmail.com>
References: <20240925062422.3146738-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Sep 2024 06:24:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112490

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/python3-outcome_1.3.0.post0.bb        | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-outcome_1.3.0.post0.bb

diff --git a/meta-python/recipes-devtools/python/python3-outcome_1.3.0.post0.bb b/meta-python/recipes-devtools/python/python3-outcome_1.3.0.post0.bb
new file mode 100644
index 0000000000..89c0da470e
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-outcome_1.3.0.post0.bb
@@ -0,0 +1,16 @@
+SUMMARY = "Capture the outcome of Python function calls."
+HOMEPAGE = "https://github.com/python-trio/outcome"
+LICENSE = "Apache-2.0 & MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=fa7b86389e58dd4087a8d2b833e5fe96 \
+                    file://LICENSE.APACHE2;md5=3b83ef96387f14655fc854ddc3c6bd57 \
+                    file://LICENSE.MIT;md5=e62ba5042d5983462ad229f5aec1576c"
+
+SRC_URI[sha256sum] = "9dcf02e65f2971b80047b377468e72a268e15c0af3cf1238e6ff14f7f91143b8"
+
+inherit pypi setuptools3
+
+RDEPENDS:${PN} += "python3-attrs"
+
+RDEPENDS:${PN} += "python3-asyncio python3-core python3-pytest python3-typing-extensions"
+
+PYPI_PACKAGE = "outcome"

