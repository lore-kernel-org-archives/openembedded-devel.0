Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web12.56620.1629301175916499404
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Aug 2021 08:39:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=t7Qw9pE/;
 spf=pass (domain: linaro.org, ip: 209.85.167.42, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lf1-f42.google.com with SMTP id w20so5533133lfu.7
        for <openembedded-devel@lists.openembedded.org>; Wed, 18 Aug 2021 08:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uo2uh2+hinlPzIrQTCyNX0wAt/RexVqeauGYMxo/kYE=;
        b=t7Qw9pE/QDvEfFGg1Rgpk4FcWZ6pU88xgfOg0BtYcpZI4UEY3aFMAeO3F0rU2m+jc2
         mgZGL4cLXnimIin0L6/Wx3E5AIXFmzBY5+K9TPp8isinIS/CZR24pYRMs5JJRF3epaSR
         Uw9ncYMFSz+atFVBWt1k3yZaN1m8hlBS5yKwqVP2YAsRX1FhqD6RW2WD0H61n52sX1iq
         LSqk65bIjBsUd3LxJDTq0qB/gi4M3sviAs+sBMxKo9BocnX4+bomJWVHZlwFJGl+NwEN
         6wZQa8m+zXAR86JJTpdgdv9R6HD2/WxTJqqrNZY38z7zHDx/ZxvDhnw/KPqxJyCx2e1B
         1YsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uo2uh2+hinlPzIrQTCyNX0wAt/RexVqeauGYMxo/kYE=;
        b=pgJXE1DLr+FLd7Bj6QxrTyAiymR2d8Bg5HTNSa8Nj/vA+koEEo4qNICR2FFiBxQPii
         uFJYlMdZZaIT/XK/9HrwdVr27YzR6OhuvVFSlu45h72ohqjSBJ8oLNa+iwwI4ZUdy7zv
         ex9hfCUaQeJDDcM4y3OmrmmhzGtS/0klX1HgyEDlb1nlDmG9TTcjW9vvTOUezhxs2QJu
         LH2wmaeKRR200xpB1y5D8ax5SQvEkIHGjSkn2TK9q41IqE6hvPqxzPrzoglELNF86xfA
         7iGvYNPknjb1rYzSYt9mfFm76MCwk9QHtljtfDlIoXikpVO/cTfDPV2Pwy0TBcpvCfzd
         WGzw==
X-Gm-Message-State: AOAM5339DsDWOeahxCX20QCNTJaiNvEvUOGptQep2DahEXbA7cW6Uk7I
	TGpBRmJW0ZtsYOMtgIcLLBSiuQN4j2VX4A==
X-Google-Smtp-Source: ABdhPJyQUpL1agAKJqgTwf8glPM2kkGF1Z/D6Ob1BITL2Tk0BeJul0kD6XZD2iyQrsjuuPyr8KDgHA==
X-Received: by 2002:a05:6512:33c7:: with SMTP id d7mr6918047lfg.545.1629301173545;
        Wed, 18 Aug 2021 08:39:33 -0700 (PDT)
Return-Path: <dmitry.baryshkov@linaro.org>
Received: from umbar.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id o22sm6510lfr.32.2021.08.18.08.39.32
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 08:39:33 -0700 (PDT)
From: "Dmitry Baryshkov" <dbaryshkov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] image_types_sparse: stop using ext2simg
Date: Wed, 18 Aug 2021 18:39:32 +0300
Message-Id: <20210818153932.3365328-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Under some conditions ext2simg can corrupt the file system (see
https://lore.kernel.org/linux-ext4/CAP71WjwVdqmLEq1NGWK36JkEd-i05YcAu4jeY6GFjsk6TS=Mtg@mail.gmail.com/).
This has been reproduced with the ext2simg currently found meta-oe's
android-tools-native). Stop using ext2simg and always use img2simg. This
results in bigger images, but without the risk of image corruption.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 meta-oe/classes/image_types_sparse.bbclass | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/meta-oe/classes/image_types_sparse.bbclass b/meta-oe/classes/image_types_sparse.bbclass
index 65d980fd913f..4263593a8dd1 100644
--- a/meta-oe/classes/image_types_sparse.bbclass
+++ b/meta-oe/classes/image_types_sparse.bbclass
@@ -2,15 +2,7 @@ inherit image_types
 
 CONVERSIONTYPES += "sparse"
 CONVERSION_CMD:sparse = " \
-    case "${type}" in \
-        ext*) \
-            ext2simg "${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}" \
-                     "${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sparse" \
-            ;; \
-        *) \
-            img2simg "${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}" \
-                     "${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sparse" \
-            ;; \
-    esac \
+    img2simg "${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}" \
+             "${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sparse" \
 "
 CONVERSION_DEPENDS_sparse = "android-tools-native"
-- 
2.30.2

