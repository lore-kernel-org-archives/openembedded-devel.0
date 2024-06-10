Return-Path: <grembeter@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34FFBC27C55
	for <webhook@archiver.kernel.org>; Mon, 10 Jun 2024 19:35:33 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web11.28670.1718048132421963928
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Jun 2024 12:35:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HwrvJVIw;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: grembeter@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-579fa270e53so332209a12.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 10 Jun 2024 12:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718048130; x=1718652930; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i0w7NlhRCTWXD15zcvvlKa/niZcfouSOVn9UMFPMj+k=;
        b=HwrvJVIwW48uMdJC/s/9BtYjNG/lHN9MZq/PLvdXAG9OLGPDsja7tG9C2hcB+yLEQR
         u5E7b8gA/jNHtpscdf8oh8j/i0X3ohhADqSP7OnRQiniNotVUGldK0PZZT3jKhJVp/+9
         dXc9FaXPOYj3fdXZCNraRPaTia2O1AdnGt0NI4Uj/T6DMKanMP9rMGKImra6rw225yFK
         Zai0B3xqiDU2NKbMRQFG0v3qqzxAPn21H43y5AeBYn55S2hc7tmSYYscSj9SpGDNVtyC
         42gyc0McAZV/47ckElPbH+MYsD45TxyR3KtmAk9OZ/WNx2Iq1riXyBe2Wioj5NRWllc/
         MofA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718048130; x=1718652930;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i0w7NlhRCTWXD15zcvvlKa/niZcfouSOVn9UMFPMj+k=;
        b=bYWyhb9v2J1fM+9B9HpFRbx+j19aovldoBRilI/DQIkYN5sr3KszvjUiP6VhBQMtL7
         BZBAJ+/yoNNmkU3c7ALxjmHSjBu4oR4y7XyNhHRzRKLdRue6smj9pKyjN2Dq1JFWCZwA
         3zjTtNlDJjSl3JnGgdcdKaecSB3WmfGSRZSHScgsF/1i+rNoMAhxDdURXA3vJpxzHBcp
         lMYMNLXFgn0wULY76PNTgOIBDTR4nJseYDq7zSNN36mecX0qAsOCZ9dGu3WAJgWIAQsU
         biVycXMwgcIuroIeVkPBufax/TNtP/hTxQ7ChLApUiPwd8rnygoscLXrnBTjgtzbSTtR
         mNWw==
X-Gm-Message-State: AOJu0YymxsrFfwYsvv6mRo7NHbdjZgSwtk4X2gWgEWlAiSkc2sqDRblk
	8/orFbcn9RLH8hv5KPtdibKMntewOLb71hVU2zKppiZPMH9/mFevG2bWKw==
X-Google-Smtp-Source: AGHT+IEAqfc6UbG1swSc6O1JQueDocEgCeDERNESjLpRlzOIYbZvQXhPTEsPJ1zhVFPsd4TMTA88Vw==
X-Received: by 2002:a17:906:d105:b0:a6f:132a:8212 with SMTP id a640c23a62f3a-a6f132a8616mr404953866b.35.1718048129830;
        Mon, 10 Jun 2024 12:35:29 -0700 (PDT)
Received: from think.fritz.box (62.54.143.157.bbcs.as8758.net. [157.143.54.62])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a6f0557b1c3sm361293466b.209.2024.06.10.12.35.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 12:35:29 -0700 (PDT)
From: Grygorii Tertychnyi <grembeter@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	Khem Raj <raj.khem@gmail.com>
Cc: Grygorii Tertychnyi <grembeter@gmail.com>,
	Grygorii Tertychnyi <grygorii.tertychnyi@leica-geosystems.com>
Subject: [meta-python][scarthgap][PATCH] python3-pytest-html: add missing runtime dependencies
Date: Mon, 10 Jun 2024 21:35:06 +0200
Message-Id: <20240610193506.245050-1-grembeter@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Jun 2024 19:35:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110804

Upstream toml file mentions Jinja2 and pytest-metadata as runtime
dependencies.

Link: https://github.com/pytest-dev/pytest-html/blob/cfd32d08488e2c6fb72f0617db94ab41d3fca8d0/pyproject.toml#L42
Signed-off-by: Grygorii Tertychnyi <grygorii.tertychnyi@leica-geosystems.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit ca28badd147afdb11b8ee785b277bc9797d012fe)
Signed-off-by: Grygorii Tertychnyi <grembeter@gmail.com>
---
 .../recipes-devtools/python/python3-pytest-html_4.1.1.bb        | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-html_4.1.1.bb b/meta-python/recipes-devtools/python/python3-pytest-html_4.1.1.bb
index 37478ee0ae35..154ec255cb5d 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-html_4.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-html_4.1.1.bb
@@ -15,7 +15,9 @@ DEPENDS += "\
 "
 
 RDEPENDS:${PN} += " \
+    python3-jinja2 \
     python3-pytest \
+    python3-pytest-metadata \
 "
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.39.2


