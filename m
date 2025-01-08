Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B5ECE77188
	for <webhook@archiver.kernel.org>; Wed,  8 Jan 2025 19:09:53 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.28675.1736363392673478711
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Jan 2025 11:09:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HPiUsve+;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-216728b1836so1276665ad.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 08 Jan 2025 11:09:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736363392; x=1736968192; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6DnZ8Rg98s0uvDRxyoqNjE+nJXr+vaXgodLwYwjsTk0=;
        b=HPiUsve+o3QffnLYFArbPgpf03iXJUwB3zEZzh78clO0kV9S7ibGRek+Se8TouRnjI
         C6ZCqAhHTVyQQZD4SIjvma1jyeaPO+EpS6B+0GQT7Br0VRhYlKfON/k9a1A8lUPLtLpm
         i2vQCjhSn5BkDLp5Awuj4nxYwBHdQlv/Y41GQeIvVaZGp5/SGurcmGiC28wmD2bJCdLW
         TIW3pR/3Vs2j9mxMORvVnPrvQEYTvfyssrI1IgjLZC4MB/NQKGQOV7qE9d1MNozfY3q4
         tbMUUcRTvYG2lqofU2g8fp/VBik1LnQ05uGWcnLgzK29zwNEhW8/Y3yEI0Fh3ySLMn4Y
         rboQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736363392; x=1736968192;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6DnZ8Rg98s0uvDRxyoqNjE+nJXr+vaXgodLwYwjsTk0=;
        b=xFAtO1t9mqY8JokrdRt9/kKV9RAwWm+Oaj/QLEFnzJVSPBL7J7xO7YUHlw5HNog6/l
         hm3KEZqkcH24sC4dojCe2Jm8f8MGGIiFaujbYyKuU+gtofsEffhul5uFS61MBE83uoSD
         c6xQPeS2BKJHu87p/mNYEZyl+N72uCrwW3UY47jZl0raHmrZuTL62Qc+448YZQZUh/MG
         u1vfZyI1UfiKEsP0mJTknde0DcVa+0pDJaPOqZ1k6GVUtRnR2V9Zl2Kt+P5tkvgkPAhF
         +lXaSDhKpKAUitw3d/sh000gKUUT0QO0FjivhKFAOVkCZDTybNsgE9OLsnFNytMEpoyD
         7+CQ==
X-Gm-Message-State: AOJu0YxD1+oTZuWU0hnCkELf6lYodNXBPLOXGX5b8GYRd9Mxg/shNVEV
	arEjjPsKmTVoHZQnHQ1RwJ4euNFrv8FipK1sAmBbPzqgyMea7Sn5xHNdww==
X-Gm-Gg: ASbGncu+d0F4oK+mhYrpDD+p5HICbfiNaKSW2+59ARY99qCQfyV1KoU1Cl7BZxMWf45
	NF6XcJlTyzXU6DqCoaYEbhxi3vvoTk5DBJtBzGw5ACMdBea4j4ftLAPFtlAINdG+aHFURD8wGz8
	og7dJm23a7+KB22nl7Qdch5Y8F70I+guMmNyLJ1NtzUttuL2G0mnSxedWrY/nFga3Wio1faZFzV
	ID5HbwBLo3e0jhDSXSKax/nYhxFRtfSDoMPWhiOf7kWZiZF
X-Google-Smtp-Source: AGHT+IESSLOFA0HJ7erbR7Z+kQ3ItpI/txeMWxfRipg3hYpdOxFKfVYNecIu0RDKGaiEp5gukE91Fg==
X-Received: by 2002:a05:6a20:a10e:b0:1e0:c6c0:1e1f with SMTP id adf61e73a8af0-1e88d0c1e59mr6495798637.36.1736363391903;
        Wed, 08 Jan 2025 11:09:51 -0800 (PST)
Received: from apollo.localdomain ([2601:646:8201:fd20::e846])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8fb88asm35555679b3a.135.2025.01.08.11.09.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 11:09:51 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH v2] python3-argcomplete: Upgrade to 3.5.3
Date: Wed,  8 Jan 2025 11:09:46 -0800
Message-ID: <20250108190946.3228422-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Jan 2025 19:09:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114744

migrate to hatchling build backend

Changes for v3.5.3 (2024-12-31)
Use interactive shells and bind to make environment variable name completions work in older Bash versions (#506)

Changes for v3.5.2 (2024-12-06)
Fix _parse_known_args monkeypatching

Note: This fix is required to restore compatibility with Python 3.12.8 and 3.13.1.

CI improvements

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Migrate to hatchling build backend

 ...-argcomplete_3.5.1.bb => python3-argcomplete_3.5.3.bb} | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-argcomplete_3.5.1.bb => python3-argcomplete_3.5.3.bb} (68%)

diff --git a/meta-python/recipes-devtools/python/python3-argcomplete_3.5.1.bb b/meta-python/recipes-devtools/python/python3-argcomplete_3.5.3.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python3-argcomplete_3.5.1.bb
rename to meta-python/recipes-devtools/python/python3-argcomplete_3.5.3.bb
index 531399d364..a38a247b75 100644
--- a/meta-python/recipes-devtools/python/python3-argcomplete_3.5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-argcomplete_3.5.3.bb
@@ -3,15 +3,13 @@ HOMEPAGE = "https://github.com/kislyuk/argcomplete"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=2ee41112a44fe7014dce33e26468ba93"
 
-SRC_URI[sha256sum] = "eb1ee355aa2557bd3d0145de7b06b2a45b0ce461e1e7813f5d066039ab4177b4"
+SRC_URI[sha256sum] = "c12bf50eded8aebb298c7b7da7a5ff3ee24dffd9f5281867dfe1424b58c55392"
 
 PYPI_PACKAGE = "argcomplete"
 
-inherit pypi python_setuptools_build_meta
+inherit pypi python_hatchling
 
-DEPENDS += " \
-    python3-setuptools-scm-native \
-"
+DEPENDS += "python3-hatch-vcs-native"
 
 RDEPENDS:${PN} += "\
     python3-core \

