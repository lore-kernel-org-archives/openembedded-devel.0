Return-Path: <akash.hadke27@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E84D8CA1009
	for <webhook@archiver.kernel.org>; Fri, 30 Aug 2024 18:27:43 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.1433.1725042462541750768
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Aug 2024 11:27:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=T8VD/R9G;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: akash.hadke27@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-714263cb074so1658265b3a.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 30 Aug 2024 11:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725042461; x=1725647261; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IshP+OkGEeWZPWpC6sTjw7nl3vcGBkZKRsT/dgW1RCo=;
        b=T8VD/R9GrSxU3ryYkL6GZwNYvGT3xAA0E6a1xdHSBbynNqcsF/8TJysu0BvQsbXVJW
         gHZwuJU8bnOcLKLXT183Tuvxi3Cy7c7A7run//CnUg+uFvmt6g5rrQsx2HG7Wav5RA3d
         7IjkaJJjozqrAos0JiToqa9YkjeWaL/BxFm9nn1RCqM9ETvvFsRvZcJTKfDmMy3VsNth
         RG6ZLpI7G47CNwvH/Ck67wFK+ip1sW7qTDc+s2XDFJBebVhRpEfSeM4kNgp3sYOHkFt6
         eZqIt57eASkaHtOt/tvQf/CY1K8r33zlu4xYFFkNQUToezIXkuRFuNN1d8LOD+8kFOTI
         9v0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725042461; x=1725647261;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IshP+OkGEeWZPWpC6sTjw7nl3vcGBkZKRsT/dgW1RCo=;
        b=f63kOuJPAHgpnDFlwJlWgd8oSLw73DPdccDwpGAUptTERN01OzvPNrQJ7PIzsE1Ein
         hohzxkgr2Mdl7tukaCr5rvPRAWYYJE1G9SYFrbPg4P8wmeyEfQ8kTAoirDK5eS43f9kC
         0c0GDCqOBv4PrJq2dQ2ZXkAMjE3yj4btND4Az71dKev7p7ssFUDmBv5ApajyRh4xwtIC
         2CSG4m8SXCGdJHp9z1vmE/2aO0nwgRIz8FKC0nCsYh71+zpT+sDaz5leTZScs9lx9+6c
         +SckW4gK8uCg1VwAjTkus5a8BPAHTCazkR/piuAitaHHh7q0zsINbajM5uT+Qg/6UfB/
         pDug==
X-Gm-Message-State: AOJu0Yw9ZF3x7scpSFRU5EbZVgt44bs35QqYqnHduMiLYLKJWETEDiQv
	twJVEEDMn7JEoFLNY1e5PzMPTMDRqpN4sI+bxHqH64Gsneaai2L6jHdJmg==
X-Google-Smtp-Source: AGHT+IFMsrwr8hAA0oK6bQ7wR8yG3xR3P3SjBamUWbC62fqwuH5uGjJg+M9GbWLY1jnPfKnqO0R8ww==
X-Received: by 2002:a05:6a21:6f83:b0:1c8:b849:c605 with SMTP id adf61e73a8af0-1cce10e8d8bmr7154939637.44.1725042461121;
        Fri, 30 Aug 2024 11:27:41 -0700 (PDT)
Received: from L-18010.kpit.com ([49.36.33.244])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-715e5576cc7sm3073140b3a.32.2024.08.30.11.27.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 11:27:40 -0700 (PDT)
From: Akash Hadke <akash.hadke27@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Nisha Parrakat <nisha.m.parrakat@bmw.de>
Subject: [oe][meta-oe][master][PATCH] python3-flatbuffers: provide nativesdk support
Date: Fri, 30 Aug 2024 23:57:31 +0530
Message-Id: <20240830182731.2826771-1-akash.hadke27@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 30 Aug 2024 18:27:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112057

nativesdk support is needed in some of the projects for codegeneration

Signed-off-by: Nisha Parrakat <nisha.m.parrakat@bmw.de>
Signed-off-by: Akash Hadke <akash.hadke27@gmail.com>
---
 meta-oe/recipes-devtools/flatbuffers/python3-flatbuffers.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/flatbuffers/python3-flatbuffers.bb b/meta-oe/recipes-devtools/flatbuffers/python3-flatbuffers.bb
index 5d3c73fd9..1fab01358 100644
--- a/meta-oe/recipes-devtools/flatbuffers/python3-flatbuffers.bb
+++ b/meta-oe/recipes-devtools/flatbuffers/python3-flatbuffers.bb
@@ -12,4 +12,4 @@ RDEPENDS:${PN} = "flatbuffers"
 
 inherit setuptools3
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1


