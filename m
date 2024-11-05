Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9273D40CF6
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 22:58:09 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.web11.30374.1730838906117482127
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 12:35:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=l6+QE3wJ;
 spf=pass (domain: gmail.com, ip: 209.85.128.175, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6ea11b32ab4so1642627b3.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 12:35:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730838905; x=1731443705; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lq5+aH/j9rADNZ2ceiIyw6Vr5pF8HAuvuw7LGuJq0aM=;
        b=l6+QE3wJ7pkHm7mqmrPk+ZiZwPEI3beQwFdU1WqKl4cBUSZyf0/Q5SDW5vnAQ1EK2X
         Wka0vEH+jeJ5KjtP9C/F0M9AACrgH32UARjBrcEZskziAYJwPN/kSSyYRVjoosCzQ0Jk
         JOBOpRbsq1+6qy4fnE1YyYL8WclQ4soGSz6z3l0wiAnyPFYEY5V07LEcUSIYswM4QLUC
         SHozakOq05/lZxmuxJbMOWBHtaxlpx3/snjkPSx4DtuFrKtGF/xNrhJgNMBq3dz0t6Ah
         rds0ctr+5hJtfGRwyCoMNMxq5nBPmfWkhC5BLaWZjz/YmLQPNZdZtI9kl49Bki+nB2LD
         YTNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730838905; x=1731443705;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lq5+aH/j9rADNZ2ceiIyw6Vr5pF8HAuvuw7LGuJq0aM=;
        b=f/JR3EY6YcjrtIGrSw67S7fEUXSns56bHnbHsmza77jgvxkrWy1KE4r1kvvxxXxP0C
         nP5UlSF6HiQCBhY45iPm2VcNqV+PCfUBImm/9ZzIqpnFEY4/26xgSS/xDqxOfmOaL/yo
         Y3D6K2zocbyv9Jio5BeesQpimA9OO52VvnnL2y3mpwdTs5Nm+AsPLqWrnT5E5N0sCBdM
         Y4iFBI7PtXs/XEa1x1zC6Tx7hyUGMiW1+jCTK24povHGVujrxgUrXpFKR/Ju66wVFeH7
         pMEt7GyufGCgb7JDMgcOwU/5eGquqXvBQdWegesZSw0lnMucAUc8tkxRWd/5FhuovDln
         00wg==
X-Gm-Message-State: AOJu0YysKAos1TAk2XnglmzJHmgzotRFSrkXrHGHmr7lAAdTIM1Xy3iA
	Yh/whZg3Krzmm67S2zjQbstw4ifqFp59M23JLNis+dD+Wd15Dx7NKUghvBZ/
X-Google-Smtp-Source: AGHT+IEMOb29TLHS2DW20cd5mQ4pSnU3/YTE8P8nQogdOiiTWjeb3dt1Y6imDlJv0b90axEpZrNdwg==
X-Received: by 2002:a05:690c:67c5:b0:6ea:6f5b:cdbd with SMTP id 00721157ae682-6ea778974a8mr120463657b3.14.1730838904750;
        Tue, 05 Nov 2024 12:35:04 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55ac9d34sm24295827b3.15.2024.11.05.12.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 12:35:04 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH 124/161] fbset: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 15:27:49 -0500
Message-ID: <20241105202827.3104-124-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105202827.3104-108-schonm@gmail.com>
References: <20241105202827.3104-108-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 22:58:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113641

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-support/fbset/fbset_2.1.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-support/fbset/fbset_2.1.bb b/meta-oe/recipes-support/fbset/fbset_2.1.bb
index 690fee0df..e6f357fd4 100644
--- a/meta-oe/recipes-support/fbset/fbset_2.1.bb
+++ b/meta-oe/recipes-support/fbset/fbset_2.1.bb
@@ -33,5 +33,4 @@ ALTERNATIVE_LINK_NAME[fbset] = "${sbindir}/fbset"
 ALTERNATIVE_TARGET[fbset] = "${sbindir}/fbset.real"
 ALTERNATIVE_PRIORITY[fbset] = "55"
 
-SRC_URI[md5sum] = "40ed9608f46d787bfb65fd1269f7f459"
 SRC_URI[sha256sum] = "517fa062d7b2d367f931a1c6ebb2bef84907077f0ce3f0c899e34490bbea9338"
-- 
2.43.0


