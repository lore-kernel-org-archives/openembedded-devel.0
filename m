Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76D6EEEEC3B
	for <webhook@archiver.kernel.org>; Fri, 13 Sep 2024 06:21:08 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.67535.1726208460546110501
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Sep 2024 23:21:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=i8XaSVTl;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-20551e2f1f8so5883995ad.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 12 Sep 2024 23:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726208460; x=1726813260; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ER0eB/cgNRUm3GAxRIlDk2XYq3ZCaARBCDOPvbVhje4=;
        b=i8XaSVTlptVCXPvbrR/L7D+u6VmEnUAlYqD4vbTTjkICMIwdyUXqUFfERrjwijBgyA
         ZRICH/fdoJE+fOORXtPVUePLisg5hdDDjx3bbxMh9B4KUQ1GOJzGUR0EdDlqBnk24Y+n
         X3tkToBUlaDcAi58+gNP0cgAH6Zd8agUSKN4jFroYKamkg/n0x8/lM+dM29SpbosMU3g
         uUI7mTPqrNr0tYeJpHHCdyX0CABtsM0to3NJeHddtc68o8HUmZilOnCBCYKS4mJQ1gP9
         hMzEdQ5lBbea3/oHkB83B47m01oepIVUxfYmKCVUhp8khvo5dIe9eXxv262JUPupea2f
         ARKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726208460; x=1726813260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ER0eB/cgNRUm3GAxRIlDk2XYq3ZCaARBCDOPvbVhje4=;
        b=ZH65w22EggWUgZ3V0j24KPRkPd+WMmML0qMNX3IWYrKpLDnVXgxIe51FDDTcj2NHJw
         qX/oacXUdulvkw8+SoB85J+veKZ8V7LF8BJF4ehevoH9bI2jNjdxTstVnFwsMUkEZvHP
         v64ti/XtM2XIxQSxLyMd/Tpvqa2Ty64HmW1xdtvCWNCsMKZBAFzGph31TUiov5xO2n93
         HqS6k9+LN+yarrad/9+ew5PigMO5TX6MgdLRPOwtzm37DMusnkdnhk0AsUGLLNMVNuKV
         sut3sDEn+lJLhXPl9lhaV2M/3w/oayGiNK7fuBhys8dkH+vlpnDl8mX/lbsErXmkyA/7
         S2Jw==
X-Gm-Message-State: AOJu0YyovHQpwRz+qredl21H6UGK+eIYcS+kV7Tc3YFoJRRRdGZ+BUyo
	XfxmjHhjuDXHDJTBbXghakqFVCyjXoDy2zTLU8V0sJ53zM6vjX3j6zhkCEeb
X-Google-Smtp-Source: AGHT+IEXzIH+VJFbZnYPxbMpplM9Z695UiB6C31In4cb8ag1tTf24NaMsV93bh4uN3m5wfRktlC7CQ==
X-Received: by 2002:a17:902:c94b:b0:207:5665:32b2 with SMTP id d9443c01a7336-20782a69ad1mr25166195ad.40.1726208459829;
        Thu, 12 Sep 2024 23:20:59 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::c5d8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2076afdd0edsm22401795ad.170.2024.09.12.23.20.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 23:20:59 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 08/10] python3-pyyaml-include: Add missing dependencies for ptests
Date: Thu, 12 Sep 2024 23:20:48 -0700
Message-ID: <20240913062050.2597921-8-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240913062050.2597921-1-raj.khem@gmail.com>
References: <20240913062050.2597921-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 Sep 2024 06:21:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112267

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/python/python3-pyyaml-include_2.1.bb      | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-pyyaml-include_2.1.bb b/meta-python/recipes-devtools/python/python3-pyyaml-include_2.1.bb
index 30dde5907b..058699fdf2 100644
--- a/meta-python/recipes-devtools/python/python3-pyyaml-include_2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pyyaml-include_2.1.bb
@@ -23,6 +23,9 @@ RDEPENDS:${PN} += " \
     python3-pyyaml \
 "
 RDEPENDS:${PN}-ptest += " \
+    python3-fsspec \
+    python3-aiohttp \
+    python3-requests \
     python3-pytest \
     python3-unittest-automake-output \
 "

