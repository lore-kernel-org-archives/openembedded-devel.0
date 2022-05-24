Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67593C433EF
	for <webhook@archiver.kernel.org>; Tue, 24 May 2022 07:33:15 +0000 (UTC)
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
 [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web12.6729.1653377594401800142
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 May 2022 00:33:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20210112.gappssmtp.com header.s=20210112
 header.b=LHc+BBfs;
 spf=pass (domain: baylibre.com, ip: 209.85.128.66,
 mailfrom: jstephan@baylibre.com)
Received: by mail-wm1-f66.google.com with SMTP id o9so2376823wmd.0
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 May 2022 00:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5YwtBz2Wt4LH1LHLOVdFnSwpt7u2M6o51uhOBIyppfQ=;
        b=LHc+BBfsoagNcDgpP+VaVZPIiXWnlImHxiGXk90u1DFVH2i+h/KJKWIH3mbrH+VdWy
         TzH7iDJzf3wsd/AYWKscydvtTKlqi7IKlNLs/1b3G/D03nVESCjs3VXQEjEwUsRRIYuh
         RZvugWzolMFQ8RzUP6UN5IgIKa9teUMKqzWCi7BqYJKMZPnghCGCPmuZdarDjz7iJnGd
         IheJAWAteTvTZKxcQh9F5sGbnjHvcz+25RWbMrgfFe28iN0SfEo1rf7o7m0g6DRh/J97
         TFfnfDKiMVU9Ir3xdusfzSRP1hcCCp53vCQVNoy2cIjddU8vQDDNxPj+W6GKtAvcj+LY
         tJLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5YwtBz2Wt4LH1LHLOVdFnSwpt7u2M6o51uhOBIyppfQ=;
        b=XYlGQbQn65khnqg7S96k9AYvlVd4QZ8hvSQaylkHydudIeNyANPTj9U+T+4PuOl/jF
         pLX7rZRrw+deKIDExaOOPj3Kk9z0f85mrSwh+p6BlNNzydS37NHgOc5gPyl5K2cQHHY7
         CwioPbJNfx1X5N1gIks0cP+m+hfXLE8mM2pxiG0gyDsMC+lwahRStC052epxGkN4cCJS
         DOihP9lNL04G1zrrjMK+N76/p25X036PCdTEHM/W2VEOpVB1pbhpNKPUgXawAqmK53Xc
         jO/86PGl1ZqCqltak3BXuzzI81tzfqBMN+BKzYg741cv241MaXxCNMTzROkPVa1iM+7s
         1WyQ==
X-Gm-Message-State: AOAM530gvUnA0fmvjamodFF5o71SwagS6KBDDGXRozI0Ywp6huSphkSt
	aLpSythAfXl29Zi9I6vsnV1vyIeKTLCLfVEv
X-Google-Smtp-Source: 
 ABdhPJziEv+Ne0LOk48D4L2F9Bs1jb4fClG0MVIWRYOcZbmyAYRErf+RXa7RcE4PlBCk/JtqWB6CrQ==
X-Received: by 2002:a05:600c:4f4d:b0:397:4d0f:f92f with SMTP id
 m13-20020a05600c4f4d00b003974d0ff92fmr2505555wmq.36.1653377592420;
        Tue, 24 May 2022 00:33:12 -0700 (PDT)
Received: from localhost.localdomain (179.160.117.78.rev.sfr.net.
 [78.117.160.179])
        by smtp.gmail.com with ESMTPSA id
 v128-20020a1cac86000000b00397402ae674sm1271549wme.11.2022.05.24.00.33.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 May 2022 00:33:11 -0700 (PDT)
From: Julien STEPHAN <jstephan@baylibre.com>
To: openembedded-devel@lists.openembedded.org
Cc: Julien STEPHAN <jstephan@baylibre.com>
Subject: [meta-oe][dunfell][PATCH] opencl-headers: switch to main branch
Date: Tue, 24 May 2022 09:31:05 +0200
Message-Id: <20220524073105.1348926-1-jstephan@baylibre.com>
X-Mailer: git-send-email 2.35.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 May 2022 07:33:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97240

master branch was renamed main on upstream project, so update the URI

Signed-off-by: Julien STEPHAN <jstephan@baylibre.com>
---
 meta-oe/recipes-core/opencl-headers/opencl-headers_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/opencl-headers/opencl-headers_git.bb b/meta-oe/recipes-core/opencl-headers/opencl-headers_git.bb
index 67446ce57..1d86f48ae 100644
--- a/meta-oe/recipes-core/opencl-headers/opencl-headers_git.bb
+++ b/meta-oe/recipes-core/opencl-headers/opencl-headers_git.bb
@@ -6,7 +6,7 @@ SECTION = "base"
 
 S = "${WORKDIR}/git"
 SRCREV = "40c5d226c7c0706f0176884e9b94b3886679c983"
-SRC_URI = "git://github.com/KhronosGroup/OpenCL-Headers.git;branch=master;protocol=https"
+SRC_URI = "git://github.com/KhronosGroup/OpenCL-Headers.git;branch=main;protocol=https"
 
 do_configure[noexec] = "1"
 do_compile[noexec] = "1"
-- 
2.35.2


