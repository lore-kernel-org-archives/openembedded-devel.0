Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3E49C54798
	for <webhook@archiver.kernel.org>; Tue,  5 Mar 2024 09:58:43 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.18368.1709632713583047467
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Mar 2024 01:58:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=gdwGsFjQ;
 spf=pass (domain: smile.fr, ip: 209.85.221.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-33d28468666so3655655f8f.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Mar 2024 01:58:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1709632711; x=1710237511; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+73mU/dbuZS81NpIGn3cdj8sInHpLr3Vn/ULRc7LwGU=;
        b=gdwGsFjQJCYFIz4LDxePQbYhRrdRrG80kfd/84wX0HajPYqN2w85kiDRbyQdNpGT+m
         hx4OAcPrj3XwpidkkaghhxrufN1pcO0p7m4xqjkMZS0xTp2UZQ4jD0K/tvh8S9Z5i2ej
         kHVvA0SPJA/sMzcUph24/ZfckUnWi/ZC3QlWpj/GFrchTlCcNmKiKIWdoy2sPmOstbsE
         yJd0nn72j0R8xBPurqIVXCjYHtwzsE1shko/w3LdmkAya7DSiY6kNrem/iN1hsyedMRo
         hLDHIq+JRlYk9BMawv0Oy9U5TbVoU22JLQqd/8trZ3t8SqhsFzr/usSoH49Fa9soWPQN
         YP/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709632711; x=1710237511;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+73mU/dbuZS81NpIGn3cdj8sInHpLr3Vn/ULRc7LwGU=;
        b=XyyC8rjJMFfk8a/fnJm7FJLH52iUikLMQ2js5ryKZbfzJZ3oqXizMZitommflWUz5Z
         d4Orb/7V6AxhcgSP7MPuL2qKYrLGD7haFn9fp5AakXMIkjTqDD/wN1IXXWTAkWv6s6tJ
         dZfDuiGSTwovl7JX/PfHOG9UgTome9szsr4bE9Ig8Xtq4YgJ/5va1kiDQbtkXq5M4iDE
         5B+22RuW0/9InxB1frMoy2N/zDwhDFS1XoT6mm+LWI1tlfdhEFokTevWu9uUBkjHZf1t
         hHzIyjI7rX/t1h8EQZAjO/F0dZ8FrbWNPnmAbJ2jEDljwRr5d/r/gMKUDDowhfxiBcSF
         /Myw==
X-Gm-Message-State: AOJu0Yz/DhVMRxcFttN+79t8hmDEJ+dH1ihJ05AgJo6sI0638Hlbz0Cs
	WREj7pi6kMB68L/3vP2QvMfgM7n3lpINRcHpfdw6383xRjS5VhylayFc4CpyOwK7xHQE7LuhR4p
	478g=
X-Google-Smtp-Source: AGHT+IGZ6snJAx2y1HVUfkB23JggF/QcTvLcyJvyi1aArI+kgG1xXkNiWx9kjtg/T3jwELkrbAckXA==
X-Received: by 2002:a5d:4085:0:b0:33d:f1d8:7a1c with SMTP id o5-20020a5d4085000000b0033df1d87a1cmr8949626wrp.67.1709632711284;
        Tue, 05 Mar 2024 01:58:31 -0800 (PST)
Received: from P-ASN-ECS-830T8C3.numericable.fr ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id x3-20020a5d6503000000b0033e206a0a7asm11309792wru.26.2024.03.05.01.58.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Mar 2024 01:58:31 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-networking][PATCH v2 1/2] drbd-utils: Drop a duplicated line in DESCRIPTION
Date: Tue,  5 Mar 2024 10:57:50 +0100
Message-Id: <20240305095750.1667336-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Mar 2024 09:58:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109114

Line "DRBD mirrors a block device over the network to another machine"
is written twice in DESCRIPTION.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta-networking/recipes-support/drbd/drbd-utils_9.27.0.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-networking/recipes-support/drbd/drbd-utils_9.27.0.bb b/meta-networking/recipes-support/drbd/drbd-utils_9.27.0.bb
index e1fd8e448..c99717839 100644
--- a/meta-networking/recipes-support/drbd/drbd-utils_9.27.0.bb
+++ b/meta-networking/recipes-support/drbd/drbd-utils_9.27.0.bb
@@ -1,6 +1,5 @@
 SUMMARY = "Distributed block device driver for Linux"
 DESCRIPTION = "DRBD mirrors a block device over the network to another machine.\
-DRBD mirrors a block device over the network to another machine.\
 Think of it as networked raid 1. It is a building block for\
 setting up high availability (HA) clusters."
 HOMEPAGE = "http://www.drbd.org/"
-- 
2.39.2


