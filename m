Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AF48E77198
	for <webhook@archiver.kernel.org>; Sun,  5 Jan 2025 23:24:06 +0000 (UTC)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
 by mx.groups.io with SMTP id smtpd.web10.48448.1736119445277235914
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Jan 2025 15:24:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TbYqLlyW;
 spf=pass (domain: gmail.com, ip: 209.85.219.175, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e53a91756e5so18364237276.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Jan 2025 15:24:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736119444; x=1736724244; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K4FufNJ0+KNdlatmsjVfSFJqPvOpJQf4n4TcWvH9890=;
        b=TbYqLlyWoI8N+hUreNWfYE0K0gKzja/28KUeC2BiGatWHTCp1qWVcAR1vK8oepcFUv
         /D02kfjdvmCTSsbVvnEDQPb6ln4+/3QjAciuB6Def/ZsC0GN78tlXMs85YJZ5GVjmQdd
         z5jY69lgw2UIQ2XUgAzbJRIighsD9am8OgnEShtm8Wp5xU+55T3w/bwEk0TQnRy8uKM7
         B5s66QfWmd87nDEkqKEk6kZLi0AmulwSZhI8bwmAvbDJaF3l/LTEQdYi6yc4l8jVcAIl
         o74Mk5IIMtSbjNDCUYjdjQD+JTLTjfRtnZf5XlLobriubV4DpZX7eC6l61bDIscfTuHM
         peVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736119444; x=1736724244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K4FufNJ0+KNdlatmsjVfSFJqPvOpJQf4n4TcWvH9890=;
        b=r9vKnhi1vw6CWqKOUUQAnp/pDhN12vsteZbEICdaeQ4lrqsDLufELtsvsf+Hz4j0q5
         FyjBBmxR2dq4UB44pfFvwp6/oPbYoTnUMRxfWa62Mi/UNeqHgE8f/bnDoJFBrHTeANf+
         6a6iZOrrS/NNRMcv+q4HmPQ7QFhdYK4Y4iXmIbdf/dQs5014T82Qsh4yhvgnvn3HaBmt
         In7JDPHuh6eK8lN/HOJmIU1EmmwL0p2DviEJKhwTMc6+MZoZUt/ZW7E96MAg3u6kk+L0
         XA1Y8ucA70QnXR2cKxGq/4uynmXusGhA6Bf0EQG7dUuIflRuuKzhdbqBP00vMMusqIHS
         sQ3w==
X-Gm-Message-State: AOJu0YxK5dnTZzayLcBX3ZuSDNjWTSksS25nlv7aOa4Zm7VBDOYeMZ/l
	jMIvxB9uYykxxXgdlrbL30sHXXaZHWqxYzy599hmcuRYc/e6IQbBrnJqn/D/
X-Gm-Gg: ASbGncvAbHT/1CFw6hpV5F00+3ZK0fKyGVjRk1U2L3znz3VRI20bs4QJ0nsGz9TcP5o
	pGhAPTnZ22BhaBmpaV6qz/+RSK7af8YbnGKcqPqsHnRkaVQG84LE4sjo4egfFINZdqS+5V3ezga
	ZKqsM14biypIsBwjNTRSOMYAgUK0SveP6u7phhvxzbxliBUwn32V4hziazq5c5BEpp2rShUSMDA
	762gLi08KYAwvXobngjCEkMc6/plXxnLzaZlWkq4rCfa8KfmCr3yz2IIo688lR8Rm7FpA==
X-Google-Smtp-Source: AGHT+IE2z3sM5HZZWiSLq7NmQP79zWTbl1DdLvPvRt2mXlqavpXESNyDwhTA9wD62J6gAC1EB/Bizg==
X-Received: by 2002:a05:690c:6f92:b0:6db:c847:c8c5 with SMTP id 00721157ae682-6f3f812540bmr428347887b3.16.1736119444341;
        Sun, 05 Jan 2025 15:24:04 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000:fdb3:610:ea25:f87f])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e537cc1e91dsm9043004276.19.2025.01.05.15.24.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 15:24:04 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Benjamin Bouvier <benjamin.bouvier@ekinops.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 09/24] bridge-utils: add CVE_PRODUCT
Date: Sun,  5 Jan 2025 18:23:42 -0500
Message-ID: <20250105232358.1502946-9-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250105232358.1502946-1-akuster808@gmail.com>
References: <20250105232358.1502946-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 05 Jan 2025 23:24:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114638

From: Benjamin Bouvier <benjamin.bouvier@ekinops.com>

Add exact CPE name (from NVD database) in CVE_PRODUCT in order to ensure
CVE filtering and not be disturb by futur potential false-positive CVEs.

Signed-off-by: Benjamin Bouvier <benjamin.bouvier@ekinops.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit d03002f19cc56a7386db5a88217c59ea71fded05)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-support/bridge-utils/bridge-utils_1.7.1.bb          | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-support/bridge-utils/bridge-utils_1.7.1.bb b/meta-networking/recipes-support/bridge-utils/bridge-utils_1.7.1.bb
index cf0fc1c33d..66c8f2d053 100644
--- a/meta-networking/recipes-support/bridge-utils/bridge-utils_1.7.1.bb
+++ b/meta-networking/recipes-support/bridge-utils/bridge-utils_1.7.1.bb
@@ -19,6 +19,8 @@ S = "${WORKDIR}/git"
 
 DEPENDS = "sysfsutils"
 
+CVE_PRODUCT = "kernel:bridge-utils"
+
 inherit autotools-brokensep update-alternatives
 
 ALTERNATIVE:${PN} = "brctl"
-- 
2.43.0


