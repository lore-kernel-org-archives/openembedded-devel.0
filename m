Return-Path: <beniaminsandu@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 106ECC67861
	for <webhook@archiver.kernel.org>; Fri,  5 Apr 2024 15:07:08 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.14792.1712329626155548843
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Apr 2024 08:07:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=O342cCk0;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: beniaminsandu@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4162e8210b6so6641765e9.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 05 Apr 2024 08:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712329624; x=1712934424; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3FclziA3nnJu3zUR0kGAsXzyTHNYQj6F9TM9D7KtQ/w=;
        b=O342cCk0JNDBbU31/hQ6SsToGxTGEwroW1NJO5aYjWRFaCDEvpVqcdNvHMSe2jMzI5
         aRm+JevWqhE7RXKi/dhVbOcayukZ8+eLP0dQUYnUFrWBEMvc/+dGwmrFxTTXxxRfw+1A
         ekmHz9o8Cjgu3AOiMgsYZk5ZoXrltMXYw5g6Q7RHHsG1lvCbFdmkDRFx0ekaUQVRCCop
         8T66x0tbgfuW77QqEpjDPXvE3pCNdTVI6iZZ1YLMfWLbAMlW4PgdpWR9fNU0QpDYxUMe
         wyQ9BF5M5VFsRX/7KbEOrzq3AmUAPbAuleMF1En8D3r2RZoR+dyQuSXOoBP1xhTmWRw+
         Ih9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712329624; x=1712934424;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3FclziA3nnJu3zUR0kGAsXzyTHNYQj6F9TM9D7KtQ/w=;
        b=NjrVMkFh2dbv3RTRDQLza0pT1EnS3wpOuZD+y81TmKV9kAWVcYlOLbhP6+ttdQcnWX
         2GpR9GLX/g7uLWdzfLwiIKBGae07m3VV61C/n5k+Stqy3MQ0Le+SJZjMXSXbUzfeKtgG
         Zq1v1pDwZXA0wy9Go9e7K8RIP3CWuSowLcwkohgmAdOMrnIRoj7RhqtHHK8AssTlbRNQ
         C7mVozgXWdhsTs1XTsH+1KQKRZF2iYABfeppqHFl7iWBmQY458hjHRjMDLMup/6fGm+n
         OfFVYIbsXr+Lm5xGEfGs+rvofMmZ6Oc0/oyPHO8ODsvzdaIGleOJssOygIV8ategzueg
         sMQA==
X-Gm-Message-State: AOJu0YwfgUmQ7jXHYX2jdJgxesAGBnMVY2IvzN0sbL/VczKbwQTcnpNj
	dDucb0corNN1w/sYJL2rCfni5VAGmuaehnjAyzdTAq4deBvgNCasck1q010HKxY=
X-Google-Smtp-Source: AGHT+IGkHfD2gnFD2L3yaUNUgqJsjpXkYn5vVgFsXTEx941jiKtz/2BOp7htAswRG3os/lOvMe0jHw==
X-Received: by 2002:a05:600c:4ec8:b0:416:2ee4:3391 with SMTP id g8-20020a05600c4ec800b004162ee43391mr1259305wmq.11.1712329624429;
        Fri, 05 Apr 2024 08:07:04 -0700 (PDT)
Received: from swi-bsandu-l1.corp.ad.wrs.com ([2a01:4b00:8855:a800:3850:5dad:f4cb:5934])
        by smtp.gmail.com with ESMTPSA id p40-20020a05600c1da800b004162ed1662dsm2865541wms.48.2024.04.05.08.07.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 08:07:03 -0700 (PDT)
From: Beniamin Sandu <beniaminsandu@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Beniamin Sandu <beniaminsandu@gmail.com>
Subject: [meta-networking][PATCH] unbound: upgrade 1.19.1 -> 1.19.3
Date: Fri,  5 Apr 2024 16:06:46 +0100
Message-Id: <20240405150646.51942-1-beniaminsandu@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 05 Apr 2024 15:07:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109821

Includes security fixes for:
CVE-2024-1931 - Loop with Unreachable Exit Condition ('Infinite Loop')

Full release notes:
https://github.com/NLnetLabs/unbound/releases/tag/release-1.19.3

Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
---
 .../unbound/{unbound_1.19.1.bb => unbound_1.19.3.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/unbound/{unbound_1.19.1.bb => unbound_1.19.3.bb} (95%)

diff --git a/meta-networking/recipes-support/unbound/unbound_1.19.1.bb b/meta-networking/recipes-support/unbound/unbound_1.19.3.bb
similarity index 95%
rename from meta-networking/recipes-support/unbound/unbound_1.19.1.bb
rename to meta-networking/recipes-support/unbound/unbound_1.19.3.bb
index 2b87de3d1..ffdc78e9d 100644
--- a/meta-networking/recipes-support/unbound/unbound_1.19.1.bb
+++ b/meta-networking/recipes-support/unbound/unbound_1.19.3.bb
@@ -9,8 +9,8 @@ SECTION = "net"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5308494bc0590c0cb036afd781d78f06"
 
-SRC_URI = "git://github.com/NLnetLabs/unbound.git;protocol=https;branch=branch-1.19.1"
-SRCREV = "c6dd1e116df75242a0c032295c152f06c721b3cd"
+SRC_URI = "git://github.com/NLnetLabs/unbound.git;protocol=https;branch=branch-1.19.3"
+SRCREV = "48b6c60a24e9a5d6d369a7a37c9fe2a767f26abd"
 
 inherit autotools pkgconfig systemd update-rc.d
 
-- 
2.34.1


