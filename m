Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CF76C77B7C
	for <webhook@archiver.kernel.org>; Sun, 28 May 2023 19:02:29 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web11.35161.1685300541961974915
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 May 2023 12:02:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=jvc2SFA5;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-25665d2a8bdso414022a91.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 May 2023 12:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685300541; x=1687892541;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WD/Sq6ufD+f0R7LvjsMjs4nZ/UvMi4H+D/HVSYkJrk0=;
        b=jvc2SFA5NXGRAdfhzdsdNb7TdKEvsnP/OsBlmijg7U8p4+kBhlpZGu79bwwo0JLSh3
         VRZ151VOj63tS5bHF8AaSGDlX5bmi/6nJksFgwplc4HJjTV5OGoFy6bjxNmVZbY98kMC
         weEwNBrI/qemX8Wt0I1U/9bvqOghnNFrJYntKhztC3f8nQUr+rB0oqrVNPqT7kCZs0fV
         T4l/tHswTANjQ/QkMerkvJzAyGE/jbH15VyEkyZ5bsrbeOh3DYI/8p/ZSOqzKzcawrkP
         Bv38JBWA74yjHQnLIpT3ARgge+nBcJZW2FnG7M6uq4FWqsCvenSMJB087B+2SDKYsVFn
         F83Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685300541; x=1687892541;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WD/Sq6ufD+f0R7LvjsMjs4nZ/UvMi4H+D/HVSYkJrk0=;
        b=F0lqH1NMss0yiQNoe2+kI/2+AVyuVHg3uSBcz00fGJSuRjTvcPVU/t3CdbqoUbVGbe
         mqvVrmwRaJK0unWtzp9gUi4H+vH0irU74da8/eUpa/adeogJq+1/0ExLXmNAbHQyAxv7
         JYO6m2Eqeyv4tkQNddTLBTEl/vp8gAdk+o0OlyzCaKuKBzC+5P8EPvIJI3nZv1h8hddJ
         jiakQxSn0c5zo7z3ugpvQNRoU9l7J92pDarZzXX+jYZy9ckQSBlVcRPAVQa6aMsGCcfg
         yji2t1mdMIuEJwJM77AEpxIfz0kec4W5MPpeal2wTRzGE+RsXf9X/8eB8DiYpNLksIpw
         HC5g==
X-Gm-Message-State: AC+VfDyaIKx9CflmHZ4puj3Wga/tVe6fn0sckEWz8CrqS0GaT4FTCSx/
	AMkj3urZhF9tx6grVw2R1ygjqIApyK0=
X-Google-Smtp-Source: ACHHUZ4sZCwfIto+LHlZTtG10kHSNEg4JyNnjxF8hpZrQvC/8LNjzFIummxgUA8lw0nczLeXyjsVeg==
X-Received: by 2002:a17:902:a50d:b0:1ae:2b97:f387 with SMTP id s13-20020a170902a50d00b001ae2b97f387mr7274170plq.21.1685300541019;
        Sun, 28 May 2023 12:02:21 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::89af])
        by smtp.gmail.com with ESMTPSA id jb15-20020a170903258f00b001acae973449sm6587059plb.162.2023.05.28.12.02.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 May 2023 12:02:20 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/2] doxygen: Do not generate #line directive with flex/bison
Date: Sun, 28 May 2023 12:02:17 -0700
Message-Id: <20230528190218.1875233-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 May 2023 19:02:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102890

This ensures that buildpaths are not emitted into generated C
sourcefiles fixes.

WARNING: doxygen-1.9.3-r0 do_package_qa: QA Issue: File /usr/src/debug/doxygen/1.9.3-r0/generated_src/xmlcode.cpp in package doxygen-src contains reference to TMPDIR

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/doxygen/doxygen_1.9.3.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-devtools/doxygen/doxygen_1.9.3.bb b/meta-oe/recipes-devtools/doxygen/doxygen_1.9.3.bb
index 92fea981e1..8bd0992bd6 100644
--- a/meta-oe/recipes-devtools/doxygen/doxygen_1.9.3.bb
+++ b/meta-oe/recipes-devtools/doxygen/doxygen_1.9.3.bb
@@ -14,4 +14,8 @@ SRC_URI[sha256sum] = "f352dbc3221af7012b7b00935f2dfdc9fb67a97d43287d2f6c81c50449
 
 inherit cmake python3native
 
+EXTRA_OECMAKE += "\
+    -DFLEX_TARGET_ARG_COMPILE_FLAGS='--noline' \
+    -DBISON_TARGET_ARG_COMPILE_FLAGS='--no-lines' \
+"
 BBCLASSEXTEND = "native nativesdk"
-- 
2.40.1


