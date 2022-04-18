Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B660C4321E
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 16:56:43 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web08.1724.1650300284805504857
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Apr 2022 09:44:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nTGGFSiQ;
 spf=pass (domain: gmail.com, ip: 209.85.128.47,
 mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id p189so9042987wmp.3
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Apr 2022 09:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nt4V1VnO6p9YoKTufUiJuUid2CqMHgaeSq+m6UGe/zo=;
        b=nTGGFSiQPkvA0WaEcV41uzs2qDTyT1zCSM5SjlHC0wffD9cK3Eq/NgInNRm+wZUjS7
         vjq/zBdTJEwssRNauv/Wy0HHG1uHzSOqnrqo/prsEbEM4GtXUF6xUS+2P2pO0sLZKCEi
         3zTbexhb7bBGC73zTWcJcylscRLV3oQ+40Uy25pxGY/fiiHLCN+bA1kIspWvZaAzJDEJ
         KaqVSbOkz5Y7ho12JsXYGjRg2Cnr7LyMp24n4wjS+WAMO2cep956MfK/vAmRWyYsQvgU
         5TMPP4kzpqGAFK8iKZnk2Zseh5QuGjAkfrS1mC6iJ09Pt2HJd8c4LwPnbpuofLxwp2pU
         QRgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nt4V1VnO6p9YoKTufUiJuUid2CqMHgaeSq+m6UGe/zo=;
        b=mVDSRRDV6HGOrFmKL2kVmwaKZ6d5SQ7eZGvrXxhYKRRFfGDswqmr5kUW5Ld9r904Fu
         wdojDReh9xP+QrehYKZ4q6TcSZcbidXGG73tL/RXdGuykVy4TJPx2A4+28OrwO0fdMrM
         iwmAFFgO+gmwiLqgJeqcCC10aFdyq2F3qrzjaOsPApEJ9pPzL+dqpZP+X4MH11CT0Fwb
         rHLp6ReMepGmB+8+23hmkntvVAVKkvXb9DtHzAAcEBmxEar3AlvNxFMb7of7T7AP0OCD
         6Gu9oE/AKm7BtAUqDHv/PX0/HOeUxGRKahEMzAncJMLK2BTf0yaoIpGxEjDo90OBTQ8b
         aFow==
X-Gm-Message-State: AOAM531yhKdVLDDj6AjSqg63hR/fzgvZ9j02Zm4V0pn2pGfn7lfFwvFL
	jhhA0VY6LeNvWmHW6qSdo8YSsdEqXrM=
X-Google-Smtp-Source: 
 ABdhPJxr1534OyNQP/YKx79KF/IpaFOYnY4hdADjT/1qZ83hiuiDcgLVqRHIV7RPlI+F3AwRS4JtoA==
X-Received: by 2002:a05:600c:354c:b0:38f:20d9:4f12 with SMTP id
 i12-20020a05600c354c00b0038f20d94f12mr12255557wmq.24.1650300282863;
        Mon, 18 Apr 2022 09:44:42 -0700 (PDT)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
 [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id
 t16-20020a5d5350000000b0020a99bc986bsm2533200wrv.28.2022.04.18.09.44.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Apr 2022 09:44:42 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
X-Google-Original-From: Alex Kiernan <alexk@zuma.ai>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alexk@zuma.ai>,
	Alex Kiernan <alex.kiernan@gmail.com>
Subject: [meta-oe][PATCH] audit: Upgrade 3.0.6 -> 3.0.7
Date: Mon, 18 Apr 2022 17:43:48 +0100
Message-Id: <20220418164347.10383-1-alexk@zuma.ai>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Apr 2022 16:56:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96685

Dependency on bash has been removed upstream.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
Signed-off-by: Alex Kiernan <alexk@zuma.ai>
---
 .../recipes-security/audit/{audit_3.0.6.bb => audit_3.0.7.bb}  | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-oe/recipes-security/audit/{audit_3.0.6.bb => audit_3.0.7.bb} (98%)

diff --git a/meta-oe/recipes-security/audit/audit_3.0.6.bb b/meta-oe/recipes-security/audit/audit_3.0.7.bb
similarity index 98%
rename from meta-oe/recipes-security/audit/audit_3.0.6.bb
rename to meta-oe/recipes-security/audit/audit_3.0.7.bb
index d99d9a87c924..d77aec296434 100644
--- a/meta-oe/recipes-security/audit/audit_3.0.6.bb
+++ b/meta-oe/recipes-security/audit/audit_3.0.7.bb
@@ -15,7 +15,7 @@ SRC_URI = "git://github.com/linux-audit/${BPN}-userspace.git;branch=master;proto
 "
 
 S = "${WORKDIR}/git"
-SRCREV = "b1b2728ccd83eeb0dffe29c01a5c97e14e6a0d8a"
+SRCREV = "f60b2d8f55c74be798a7f5bcbd6c587987f2578a"
 
 inherit autotools python3native update-rc.d systemd
 
@@ -70,7 +70,6 @@ FILES:${PN}-dbg += "${libdir}/python${PYTHON_BASEVERSION}/*/.debug"
 FILES:${PN}-python = "${libdir}/python${PYTHON_BASEVERSION}"
 
 CONFFILES:auditd = "${sysconfdir}/audit/audit.rules"
-RDEPENDS:auditd = "bash"
 
 do_install:append() {
 	rm -f ${D}/${libdir}/python${PYTHON_BASEVERSION}/site-packages/*.a
-- 
2.35.1


