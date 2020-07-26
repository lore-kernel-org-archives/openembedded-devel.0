Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web11.27366.1595763775183594596
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Jul 2020 04:42:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=tD1Xlt2I;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.208.175, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f175.google.com with SMTP id q7so14282390ljm.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 26 Jul 2020 04:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/Bp/kZxxYJaRDG3fwqDiSpC2w/awgGI2rtx/Xz5xQiE=;
        b=tD1Xlt2Izi0Q4c03eMO9bYefNZhpDf6e0pW9oR9QdIicl7t7YQwL+zF9b/awPtTGpK
         i0jNWwqB8pErQxWcsayP3a/Igv9YdbGV6b3dn6/A9YOwYOyZ+MyZV/RxzqSoprgQODW3
         oM//nwPd/Kl/M4Q4L0RiBTbOIKb4LQaXtv0QAtKw0oLx2YHNkbpr89CvFlnawqLVPQ0n
         UQv9mnN1MqPhiXpkH0Cg6MOdGj/Qv125SoKK4XKf9h1SBc9mF+GKDtJ2YpXbeAIRwc0i
         6Z4bITcywn5VrbE6h7Md2cExJtkii/pMYFynF6D/WYlkGDLUAv/FkmqQpiw6aofNrYqU
         SakQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/Bp/kZxxYJaRDG3fwqDiSpC2w/awgGI2rtx/Xz5xQiE=;
        b=pVk3yDIeGm+6Q0m5DbjEflBbqy/fJfwmt47HT1krat40DLEvgy0eRGbOaqGknBJC9z
         8LnI4rYnGTtQGULveblxeyMbFT3QsLzA4mUuAw61km/EKKKs2VcsHd4R5otmJH5PTCGo
         29UHP6998C9CLbxy1xLwqQKmpRbSKPlcF+mvE+9hb/x8RRZ7XhXtQPbVcUe5b22TQEhp
         NWG2+H9s7IJ1J/GefSxKtroATFeviqpuFwECZdYeWRjT+06wrOQ97FN8zOYesifvwUt6
         /Oh/qDWBCKncBPow9qgXCFUX3hXdOsUCM84OKqT/vFOLRi5VVbo94CUN/iipD3yPsJIQ
         co4w==
X-Gm-Message-State: AOAM531Yip0kOBEur5IgyTWU9xTIsS6drVqg4zXwS2y1kgTuXNsLyIVO
	QI5YIb/C0e8OHTFr8IpS08HTJIHS3VU=
X-Google-Smtp-Source: ABdhPJxbkY80+R/l4qVCkrGTLsqxrkshNpeF2uHWqEVq6MJ2ToTwCzU3m2FB7oXrgjkez0zNPELFsw==
X-Received: by 2002:a2e:9591:: with SMTP id w17mr8223091ljh.390.1595763773057;
        Sun, 26 Jul 2020 04:42:53 -0700 (PDT)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id s1sm1762409ljj.96.2020.07.26.04.42.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2020 04:42:52 -0700 (PDT)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-multimedia] libmediaart: update to 2.0_1.9.4
Date: Sun, 26 Jul 2020 13:42:40 +0200
Message-Id: <20200726114240.4030036-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../recipes-support/libmediaart/libmediaart-2.0_1.9.0.bb   | 7 -------
 .../recipes-support/libmediaart/libmediaart-2.0_1.9.4.bb   | 7 +++++++
 2 files changed, 7 insertions(+), 7 deletions(-)
 delete mode 100644 meta-multimedia/recipes-support/libmediaart/libmediaart-2.0_1.9.0.bb
 create mode 100644 meta-multimedia/recipes-support/libmediaart/libmediaart-2.0_1.9.4.bb

diff --git a/meta-multimedia/recipes-support/libmediaart/libmediaart-2.0_1.9.0.bb b/meta-multimedia/recipes-support/libmediaart/libmediaart-2.0_1.9.0.bb
deleted file mode 100644
index 44f135a216..0000000000
--- a/meta-multimedia/recipes-support/libmediaart/libmediaart-2.0_1.9.0.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require libmediaart.inc
-
-SRC_URI = "${GNOME_MIRROR}/libmediaart/1.9/libmediaart-${PV}.tar.xz"
-SRC_URI[md5sum] = "0b65d64398d2f3dff89534c9dfffab4f"
-SRC_URI[sha256sum] = "94668adb29d4dc3115b0fd105942ebd5ca6f5f9dbb2afa8a191a73a747dd506f"
-
-S = "${WORKDIR}/libmediaart-${PV}"
diff --git a/meta-multimedia/recipes-support/libmediaart/libmediaart-2.0_1.9.4.bb b/meta-multimedia/recipes-support/libmediaart/libmediaart-2.0_1.9.4.bb
new file mode 100644
index 0000000000..56a7873fc5
--- /dev/null
+++ b/meta-multimedia/recipes-support/libmediaart/libmediaart-2.0_1.9.4.bb
@@ -0,0 +1,7 @@
+require libmediaart.inc
+
+SRC_URI = "${GNOME_MIRROR}/libmediaart/1.9/libmediaart-${PV}.tar.xz"
+SRC_URI[md5sum] = "9b960a6a764fba38135fb57219f2e6b4"
+SRC_URI[sha256sum] = "a57be017257e4815389afe4f58fdacb6a50e74fd185452b23a652ee56b04813d"
+
+S = "${WORKDIR}/libmediaart-${PV}"
-- 
2.25.1

