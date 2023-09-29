Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50CF9E80ABC
	for <webhook@archiver.kernel.org>; Fri, 29 Sep 2023 11:26:47 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.14986.1695986796971045097
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Sep 2023 04:26:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YBm2oJDf;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-31427ddd3fbso12676864f8f.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 29 Sep 2023 04:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695986795; x=1696591595; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x5LHRTLseHYdGj1rO4OM60gK/Tvx6ptRAGnUanfNeCM=;
        b=YBm2oJDfoYl9a/BjOHJDcnytKKtyAj8MV0m/dDSW2tOisb1nVH/jN+wElSEXfKHuzp
         qwhShpY+Da8yKcYTEAxtpHbalZUNpjvcA3J1gSfafbhgNL3Zaj/X6ENFVCETzGqp6k+y
         bDqnGc/FW/cLXGwJQkx7B4ljRx47ifSDuwfkiR0kVbXZHE6U/4AsPizHJb7Sbz8k3Abu
         GuUoGHR1CnRuRJF+Uc2SMc5EluWKiemLHsVswoOZdHwVyqpu7kt6GZdDNpjuxLjpT2j5
         BzqzxaJPhUDGI2FRMTuUXJZ4zH78BocvWJzXIxO7wyl4MDHYto1u6EFlm44HibaANh/+
         M9LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695986795; x=1696591595;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x5LHRTLseHYdGj1rO4OM60gK/Tvx6ptRAGnUanfNeCM=;
        b=VikPEOQh3dDAc/wwDilMS0iC9LUtjSJds01qhll1MnHaEpuE2Tv3PbF3wIylBuDkhR
         ntOvfAQ0L/pjDM8WPJCWSirfC9QfjxEoQ9yfBUkcMDN7ay7DwbTQhv7qPCb2Sui32mE/
         BY7cX+2iyW1qyMw1Tp2lHG7BzwsjIkN9LnMaoUvQBiXy+PyTu85vNjAv3oXQcnBWIsto
         CRtxUKqHk2rU8Qypjki7bbPToqCNmrleDcKy+yv6WEkWuXdhUBQ2OsyKxptUOmXePukz
         P3VUj4jHwBUvriOnhd2EwgARe0oTu6eQrYPex0mPIpjvbH/QhC8voenMQnsfFa6Kggn9
         e8vg==
X-Gm-Message-State: AOJu0YwjEdAKlGwvJrWB32FeXwxMf6sTYaOi0BK3odSbbahRn2wi+d23
	Egyafx2Akb2zj2NAZniWP2csWsUiLnM=
X-Google-Smtp-Source: AGHT+IF7mr1cO1ocHWuTn2I8VWxuUYH5h0HsVnwX6E/6Yy7nXNJ9LznuKdoYc3U75aGa8NZWU+PKEg==
X-Received: by 2002:adf:f34a:0:b0:320:459:5a3 with SMTP id e10-20020adff34a000000b00320045905a3mr3455489wrp.33.1695986795114;
        Fri, 29 Sep 2023 04:26:35 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id r8-20020a5d4e48000000b00315af025098sm21151719wrt.46.2023.09.29.04.26.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 04:26:34 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][kirkstone][PATCH] packagegroup-meta-multimedia: restore x11 restriction for projucer
Date: Fri, 29 Sep 2023 13:26:28 +0200
Message-ID: <20230929112628.3839203-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Sep 2023 11:26:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105236

* it was removed in:
  https://git.openembedded.org/meta-openembedded/commit/?id=deb11a823c32d4090b3724a589641810e06df6bc
* but still needed as shown in world build without x11 in DISTRO_FEATURES:
ERROR: Nothing RPROVIDES 'projucer' (but /OE/build/luneos-nanbield/meta-openembedded/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb RDEPENDS on or otherwise requires it)
projucer was skipped: missing required distro feature 'x11' (not in DISTRO_FEATURES)
NOTE: Runtime target 'projucer' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['projucer']

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 .../packagegroups/packagegroup-meta-multimedia.bb               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb b/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
index 2b7a43b93d..b0fce73b53 100644
--- a/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
+++ b/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
@@ -55,7 +55,7 @@ RDEPENDS:packagegroup-meta-multimedia = "\
     tearsofsteel-1080p \
     schroedinger \
     pipewire \
-    ${@bb.utils.contains("LICENSE_FLAGS_ACCEPTED", "commercial", "projucer", "", d)} \
+    ${@bb.utils.contains("LICENSE_FLAGS_ACCEPTED", "commercial", bb.utils.contains("DISTRO_FEATURES", "x11", "projucer", "", d), "", d)} \
     libcamera \
     ${@bb.utils.contains("LICENSE_FLAGS_ACCEPTED", "commercial", "libde265 openh264", "", d)} \
     vorbis-tools \
-- 
2.42.0


