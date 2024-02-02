Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DF9DC4828F
	for <webhook@archiver.kernel.org>; Fri,  2 Feb 2024 18:41:06 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web11.85.1706899257801757733
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 02 Feb 2024 10:40:57 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.222.169, mailfrom: straka.derek@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-783ef8ae70aso174724385a.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 02 Feb 2024 10:40:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706899256; x=1707504056;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BjJsYsrC57iCYswwHe8wfEgqkvSapN0RRDX05QU7xLY=;
        b=YgEpKUJzJMiGUxBAnLO6R5H8wWEo3Wp2huv3BKWjNhHu/PFklD+bKOrmxEtbZCNfR+
         19JOR+P3Eqn0FVAVyxoM3WvPNboySbHv2whzVvsfm5AIPQ/zYo5zxtvlbBbRQwytZYd4
         nSo6/U8ruKHIORflHgW0ZSSEGpfTGCPppC4BJYo1KmTOfRfdYNZ3sx6jfvEEU5zxYzPX
         afwOUyKaTcy/Igt1qXtagCzs6A0YJ6LQmvgNWiXdq2tifScnZOd1THC6FdEcG2hHO2yi
         UlInLr688TObt4DafFU43wguDM+seLwqyf9r94TWohoTC1XNIrLjW6cnn+i6xJ+7VWJx
         V2nQ==
X-Gm-Message-State: AOJu0Yw1Klg/8QYHPCrSUHr3CszuKfu7N2IVPrDBI/GMxDI7wUnOyTvy
	0IBxgIOSIDdAFxLmM1I1pP/YTygBbrArK32YumY1KCwCy1lqRD/AjQ9jRuXYnm5Yfw==
X-Google-Smtp-Source: AGHT+IEq34JbfLuvy4UK6fRFbX3V+nw+qKpIQy9044r42ecSjCw5iLlDuzeyFipu/HRxB7nZhsY8sg==
X-Received: by 2002:a05:6214:240f:b0:68c:45ad:4bb5 with SMTP id fv15-20020a056214240f00b0068c45ad4bb5mr11501895qvb.46.1706899255930;
        Fri, 02 Feb 2024 10:40:55 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id kx9-20020a05621453c900b0068c8bb77018sm289198qvb.127.2024.02.02.10.40.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Feb 2024 10:40:55 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-sentry-sdk: update to version 1.40.0
Date: Fri,  2 Feb 2024 18:40:41 +0000
Message-Id: <20240202184041.1551908-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 02 Feb 2024 18:41:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108537

Signed-off-by: Derek Straka <derek@asterius.io>
---
 ...ython3-sentry-sdk_1.39.2.bb => python3-sentry-sdk_1.40.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sentry-sdk_1.39.2.bb => python3-sentry-sdk_1.40.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-sentry-sdk_1.39.2.bb b/meta-python/recipes-devtools/python/python3-sentry-sdk_1.40.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-sentry-sdk_1.39.2.bb
rename to meta-python/recipes-devtools/python/python3-sentry-sdk_1.40.0.bb
index 9c3cf5860..ec59c712b 100644
--- a/meta-python/recipes-devtools/python/python3-sentry-sdk_1.39.2.bb
+++ b/meta-python/recipes-devtools/python/python3-sentry-sdk_1.40.0.bb
@@ -15,7 +15,7 @@ RDEPENDS:${PN} += "\
 	${PYTHON_PN}-datetime \
 "
 
-SRC_URI[sha256sum] = "24c83b0b41c887d33328a9166f5950dc37ad58f01c9f2fbff6b87a6f1094170c"
+SRC_URI[sha256sum] = "34ad8cfc9b877aaa2a8eb86bfe5296a467fffe0619b931a05b181c45f6da59bf"
 
 PYPI_PACKAGE = "sentry-sdk"
 
-- 
2.34.1


