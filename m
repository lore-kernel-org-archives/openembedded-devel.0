Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1108CD6E79
	for <webhook@archiver.kernel.org>; Mon,  8 Jun 2026 23:39:04 +0000 (UTC)
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.68190.1780961944191255271
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Jun 2026 16:39:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=IqVsGrk4;
 spf=pass (domain: gmail.com, ip: 74.125.82.178, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-304c520fe9aso7959993eec.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 08 Jun 2026 16:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780961943; x=1781566743; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q0A9NM6pbf+z8sdjAugpUxZuSeZGHVQJwh+ZE+K3FHI=;
        b=IqVsGrk4UKjRt+eL/HTfyqtyPJXA85c7CUg7428XyHRp8CwnfGoyHOBIoOnkGz7uyP
         fUZFjy++VNFmDENRaoZDe2IFPCuh10YSimGb3p+e1NKiIBYynD5H+sAV0VcSJbq5AAs7
         EVmmHCEm6Ect8/9B33NiemGV35+aTs2d/b19L1S8ItFtGHUbplRCk8r/XU+trbxgMpAs
         wNXvrDmpJBpf6nQFeT0yOtNXxSYCpZBH5nXKecMPilyPJr1BhzXbVPD0V2dYGXSTrTtv
         DO5KhH2xXPFMIZtOyy+HX/QZA/2Fe95LeaOSbj8QdkFk2VAaxcVB9ylYA9ZI7k+bmdew
         pWIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780961943; x=1781566743;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q0A9NM6pbf+z8sdjAugpUxZuSeZGHVQJwh+ZE+K3FHI=;
        b=i4cHqDwg5EjsbQjBL6Q3aVKMGdzfh4acyXtwXiZcCDe23sS4SkjCQYBj7yIovTOdgc
         8dz9vq6TNQNLFjvacswFf3WwiPill4dZPRJ/ro0oGTcd4bFgoXKWs4YBnaXwbHhwq++J
         Gs/ANV3q/E9HUnQVHZ4jkX9ai0hLt98KKPqum1RbHcIfhq6LKmpJGPqO5nXGMqJyLGd3
         jhAxSGQTlLVsFUYbHiu8q+GV6hGvjZTyKuKYZVhMzLjmobipMeiFpIwVghwm6Ru7A+JL
         qRR02pWqqEt7WHUMarNfe+3XF6vO1csxSrdXMBGAJtB/aY+ovRbfZFdTJUpg+Ci6cWgj
         cSDA==
X-Gm-Message-State: AOJu0YykXnawqqV5b182KRkc14z9t/EnHLE2Cn1VkzuUY2guwudLjrfX
	bGufHZ/GXyjlkPrYsXk09PNcCuilXU4zt4ZmuIkaGWdSEwYZEFe4pEgTBSEQ04iziIn/9Q==
X-Gm-Gg: Acq92OEMNdKxty1LI66UWdpH7KJzz/mF+IbbZaDsetdAWHyVNeY08MvIFK4DHrmC5qT
	m7CtsWxwBWixKqIv8PxqM/dWLUewBRfjt335RHOB/iZTp4SQKeAnKccg6bnfNENso8ZruNa6J9b
	cpwKIBgE5q0wdQF7AjzQgqhVTISeG5fTmqU8jTnpQwK1GKIpuBqrsb5OzTxjtEbbakqmmFaqMlt
	p5ffxnrZ0jensYSy0qEr5z5CusWE6kI0chQRK0ZAhPr03bVeLJWKqz6x0ou5YCyt/od8/Ww6c3a
	j/XddKnvGzx+5v6V7hj1WNSMfVjiXNIokXo0tijRVHOPK1UKNk7ErEpG9UHYvSzs2s5flYs+gQs
	OrL5oJhrdo9K1MNQyTP8IfQuT8hK3Oy5YgGSmfjU6AouMs8b/dWuWWKtnv0keqCBTsTdhtjL1AV
	GZxyEDQVSyOFWtdDfE70lLUFHJ4WVSIHbyEPkY3dE/huQ2XG8p3qz1BRm9LUELq7Mpk+tUhfLpm
	wrjeqEwXZ35Yb8/zurFNyug66DzkEH413WF5/uNKbc6evl8NdVvviCLshhJTNmLik7TGfj2cZtC
	5tiCBitZ553TL7Q0xTUxLscLkoxh6aTCyEse53rmTCbt4ys56rs=
X-Received: by 2002:a05:7301:1010:b0:304:2af3:5ffa with SMTP id 5a478bee46e88-3077b759566mr10411732eec.19.1780961943244;
        Mon, 08 Jun 2026 16:39:03 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074df64eb9sm16941395eec.25.2026.06.08.16.39.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 16:39:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 1/3] python3-pathtools3: remove dead recipe
Date: Mon,  8 Jun 2026 16:38:58 -0700
Message-ID: <20260608233900.2568363-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Jun 2026 23:39:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127426

pathtools3 is an abandoned Python 3 fork. Its last release (0.2.1) was
in 2018 and the upstream original pathtools has been dead since 2011.
Its only historical consumer, python3-watchdog, dropped the dependency
long ago and is now at 6.0.0 in OE. Nothing else references it.

Drop the recipe and its packagegroup-meta-python entry.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../packagegroups/packagegroup-meta-python.bb          |  1 -
 .../python/python3-pathtools3_0.2.1.bb                 | 10 ----------
 2 files changed, 11 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-pathtools3_0.2.1.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index 65f23cfe9e..1741d3c7fb 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -270,7 +270,6 @@ RDEPENDS:packagegroup-meta-python3 = "\
     python3-passlib \
     python3-pastedeploy \
     python3-pathspec \
-    python3-pathtools3 \
     python3-pep8 \
     python3-periphery \
     python3-petact \
diff --git a/meta-python/recipes-devtools/python/python3-pathtools3_0.2.1.bb b/meta-python/recipes-devtools/python/python3-pathtools3_0.2.1.bb
deleted file mode 100644
index 644f7b119d..0000000000
--- a/meta-python/recipes-devtools/python/python3-pathtools3_0.2.1.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-SUMMARY = "Filesystem events monitoring"
-
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=56bd93578433bb99b4fdf7ff481722df"
-
-SRC_URI[sha256sum] = "630c1edc09ef93abea40fc06b10067e5734d8f38cc85867bc61d1a5c9eb7796f"
-
-inherit pypi setuptools3
-
-BBCLASSEXTEND = "native nativesdk"

