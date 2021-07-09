Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web12.12218.1625842881644890505
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Jul 2021 08:01:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VQcXDJkn;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: changhyeok.bae@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id a2so10215182pgi.6
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Jul 2021 08:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ta72ZesfyJ4+UEnd3KNz/SmMaHUhaazzLzHCbJTrq7c=;
        b=VQcXDJknWYzRy5yZj3Vmw8lyOqm02BiowW5oGqHKbPbVTFxLTiQHgTsnZJ1gLNmgxz
         uk8kjdXrmS04HRb15R78HVXDPp/MqrpPqzdWOR1EX7KwfuOlOLxHg281A8XgWzXqhQ0u
         i4CP2QkRBGqg0e27CjBi3BTze/mnHCTINo5Xxjan/p7gc9qBOq1w4DRuCTa0mTJUW27c
         SumsaWzo3AuSjyv9wsfxJBIAGD9R2octwVWQssqC4QVuopX73z2ocWoe/S4mUesAmCEx
         ejg88tEUF4R9f4D0qf9Uq6ab/8DpJYWb/tluwkE/Ttsb6KubDhKnSIC2l7aGyFjWzsEW
         +EFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ta72ZesfyJ4+UEnd3KNz/SmMaHUhaazzLzHCbJTrq7c=;
        b=QkuSg4smF744DfTKHvLFEhzYCwJ/GRBsBnFIWTw859b0KJXf270Emrp6l+HP/tmlO1
         EAAjhYFYQo5O/v1vCc0y90xkrpq+w6HFNjM/5b5qWEGxiI7EHqg72tKPSOT1Yg1GkG2s
         zHItvTcCNNK59jmimZyU59xmXN5kiVFUH/KaGdX0M1GbcYIIFY/HoFuJkbd0ToKpNEYs
         S5FCdjTm9JiGhUPI7wgSa9P27x0Bee3/5dXei5TGf+1oJPKzwFAvsUOwxTlBIvN14bDj
         vDvUcJXXXkUML2n/A25uWSGex9mhCK/h/fp16vx9Uc0udm55oJHd3Xy0Cym0ayzsPQK1
         +mrw==
X-Gm-Message-State: AOAM530uS/Spc+XVu2WEvtCD5i3RumSr53lPQ7zE6hMIOtBimPdcpZPA
	mE52XKBa6c9kElUg0zVAq/Z8eVaScpVwEQ==
X-Google-Smtp-Source: ABdhPJyN17593d4jLgRc0rNtX6LjB9dGMtpuY0XulTBbQKRREjQn6+8xZUj6/9EIAqqIt3EpocTXGw==
X-Received: by 2002:a63:cf02:: with SMTP id j2mr38631240pgg.411.1625842880698;
        Fri, 09 Jul 2021 08:01:20 -0700 (PDT)
Return-Path: <changhyeok.bae@gmail.com>
Received: from localhost.localdomain ([49.172.34.84])
        by smtp.gmail.com with ESMTPSA id y16sm6699886pfe.70.2021.07.09.08.01.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 08:01:20 -0700 (PDT)
From: "Changhyeok Bae" <changhyeok.bae@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Changhyeok <changhyeok.bae@gmail.com>
Subject: [oe][meta-virt][dunfell][PATCH] skopeo: switch to main as specified branch
Date: Sat, 10 Jul 2021 00:00:59 +0900
Message-Id: <20210709150059.921-1-changhyeok.bae@gmail.com>
X-Mailer: git-send-email 2.32.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The upstream project has moved from master to main, so we adjust
our recipe accordingly.

Signed-off-by: Changhyeok <changhyeok.bae@gmail.com>
---
 recipes-containers/skopeo/skopeo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-containers/skopeo/skopeo_git.bb b/recipes-containers/skopeo/skopeo_git.bb
index f5a6231..b14c293 100644
--- a/recipes-containers/skopeo/skopeo_git.bb
+++ b/recipes-containers/skopeo/skopeo_git.bb
@@ -20,7 +20,7 @@ RDEPENDS_${PN} = " \
 "
 
 SRC_URI = " \
-    git://github.com/containers/skopeo \
+    git://github.com/containers/skopeo;branch=main \
     file://storage.conf \
     file://registries.conf \
 "
-- 
2.32.0.windows.2

