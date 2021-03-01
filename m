Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web12.153.1614635110739702677
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Mar 2021 13:45:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=izSDZEMh;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id n10so12458292pgl.10
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 Mar 2021 13:45:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fgJG8pLF1Ere6oc4Xsmoy3CK+ofvDx2M3QAodgkTLzk=;
        b=izSDZEMhgx6gpdz+09Xyry2yHAbo3YiddGrTRcAm4G89W7Kn3iNRMtX05oENdv36A9
         oR8Ir4qGQQQ2cNvNhDCTbp4M0rsRsdF19ntisBGUGXrvKffV3ruiujNNk0JAiVzlCAlQ
         qGplsDZNUK/4hnY1qvkXe0PBd+3sGu9a7+BXZQoRckGPtE+NQy9pNB2j6sbBcCYXNWWF
         KJs2PPIRH7OjTp3+UnDhSUzVszUT1kAP2tKJ4FyOPc6Z+nNHLD8h0ZZeZ1dRLjiis6VJ
         06DSYHSMfGqKO+YOcXa6Qou0cqRl8VtQ9TnMmxCVUPvQBIi9q3i3AH+KfTtzpaXiE6pS
         033A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fgJG8pLF1Ere6oc4Xsmoy3CK+ofvDx2M3QAodgkTLzk=;
        b=tBCR9QtwVT5rLYnmAil0YInJOsHrORp9e++DpZdyBcQm40oo7KysC2s+jGYYxFqWwA
         z8d/DknhmgJlRJaCkERcOs/b7bh5z7CAn07iS+RytVfWNIM2YD/IW15l177swDtKebTE
         5NN5W3er1X1ml8lsFkeocazrwFhRAye6lCMHBlUSE2xLaiX0AoFqqIRk8J1HatoBztkn
         VHNitA0kwLuO0sCPxvRSRiOw0vZ6gopHmI/D3EVMqIF9s8WHwhMWxYcnjJovDjxvyF2Y
         4hF0YpLQWaohiBEFuk7zKdJAJ2Mbr8boV/JsW0seo2VYXQvlwqVxND6ZX1o3ViQQfIZk
         Ew6g==
X-Gm-Message-State: AOAM531ozIMpRTnfXtNfEpugEHel0RJ1MvXZsQ0/KceAezdYM+Bv29N8
	kcPqnxyl3lj6WeAi1ZEkOccR3VNIJ5ecWQ==
X-Google-Smtp-Source: ABdhPJy3bI68kIT5LfhldA9OMTvBj5x3XDlQg4iF/40195rzf6iPlawAPznPZypeRQHNlP4pOmjtMg==
X-Received: by 2002:a63:3441:: with SMTP id b62mr286568pga.182.1614635110004;
        Mon, 01 Mar 2021 13:45:10 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::b3bf])
        by smtp.gmail.com with ESMTPSA id z28sm18925091pfr.38.2021.03.01.13.45.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Mar 2021 13:45:09 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] packagegroup-meta-python: Add python3-semantic-version
Date: Mon,  1 Mar 2021 13:45:07 -0800
Message-Id: <20210301214507.1950660-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-core/packagegroups/packagegroup-meta-python.bb       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index 635dee1942..d22656eb15 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -361,6 +361,7 @@ RDEPENDS_packagegroup-meta-python3 = "\
     python3-scrypt \
     python3-sdnotify \
     python3-semver \
+    python3-semantic-version \
     python3-send2trash \
     python3-sentry-sdk \
     python3-serpent \
-- 
2.30.1

