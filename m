Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92E72C4828F
	for <webhook@archiver.kernel.org>; Fri,  2 Feb 2024 19:55:06 +0000 (UTC)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
 by mx.groups.io with SMTP id smtpd.web11.2006.1706903700359366273
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 02 Feb 2024 11:55:00 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.167.170, mailfrom: straka.derek@gmail.com)
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3beab443a63so1746580b6e.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 02 Feb 2024 11:55:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706903699; x=1707508499;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t0tFQGElkHAq9p2lH4oE6kLIcytQ80LTVMC+HXNGXBo=;
        b=ZB416PzJugUky2tNQ+DLRV+BxVCFGGllFI4UPDxBx+EUTFHRLpEHvMfvpaFd8478FR
         KdEX1PVWdMvL+3rGTYbc5I66nOAsiAS6Rqym9N5nWSyXLnH6wqdIKnaRjTXTgKLedeiC
         0TNU/LJCqW8WrmeHOvxnOdwHU3SGgTLv+eP9SFqe828PEX9f4cSYdBGkoIaU1wKIQynz
         p0ADJKI9XEtM4698yls7tgvBi9aKm5ZyPRpnpgrLC1E3SQSOHrC5v+bdhUedBwGaCq4z
         ON/cEq3FwWQD/HRTyGaRokIeTyv5hGUMCFCaro28Aca3jOWbcP+4/639+JXfTCFhFHlq
         RaWg==
X-Gm-Message-State: AOJu0YzpYQScNwULJZr7qWSCy9LsuqK/F4JWDTk0hlY/K1NtNd7gSFH5
	XXMuc58dV80tHVC8jX40q2CDmwKvF33Gvg1Wr2g0ag50RvPKkCI2pbf0CVmbreF0jA==
X-Google-Smtp-Source: AGHT+IHjq5wYT8eWsqsdDrRX9rcceoE4jQLzFk2o1rjqqNdn412P0cRLwAvwQ8NXJQPMbnFVhIVp4Q==
X-Received: by 2002:a05:6870:ac0d:b0:219:22a9:2266 with SMTP id kw13-20020a056870ac0d00b0021922a92266mr755185oab.42.1706903698674;
        Fri, 02 Feb 2024 11:54:58 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id c2-20020ac86e82000000b0042994f83b25sm1114430qtv.35.2024.02.02.11.54.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Feb 2024 11:54:58 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-pytest-asyncio: update to version 0.23.4
Date: Fri,  2 Feb 2024 19:54:42 +0000
Message-Id: <20240202195442.1559097-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 02 Feb 2024 19:55:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108538

Signed-off-by: Derek Straka <derek@asterius.io>
---
 ...ytest-asyncio_0.23.3.bb => python3-pytest-asyncio_0.23.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pytest-asyncio_0.23.3.bb => python3-pytest-asyncio_0.23.4.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-asyncio_0.23.3.bb b/meta-python/recipes-devtools/python/python3-pytest-asyncio_0.23.4.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-pytest-asyncio_0.23.3.bb
rename to meta-python/recipes-devtools/python/python3-pytest-asyncio_0.23.4.bb
index 85f69ac3a..6def54187 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-asyncio_0.23.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-asyncio_0.23.4.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "pytest-asyncio is an Apache2 licensed library, written in Python,
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=136e4f49dbf29942c572a3a8f6e88a77"
 
-SRC_URI[sha256sum] = "af313ce900a62fbe2b1aed18e37ad757f1ef9940c6b6a88e2954de38d6b1fb9f"
+SRC_URI[sha256sum] = "2143d9d9375bf372a73260e4114541485e84fca350b0b6b92674ca56ff5f7ea2"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


