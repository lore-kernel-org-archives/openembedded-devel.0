Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web08.33731.1622393442247419723
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 May 2021 09:50:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qAR/uUoS;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id 69so4019204plc.5
        for <openembedded-devel@lists.openembedded.org>; Sun, 30 May 2021 09:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4bDq16yxySV+CRIrTjUgvBzTBjQMTd7HOZ8IkzcWK6w=;
        b=qAR/uUoSbfP5bS27FfrGjhaT2S5thh8z76c6+L3Ef2TbS+hJ+6HJ5vpUbiA/4RL3Y1
         6jPvTu4avzw2mQRoTkwhsQnIBeUi0m94edf4w3IKiBFUT8Pn5pea6M9OpSzup7WRZhJn
         YP2mo/PucmLXBZKPfkzy9vMn3cQUSSiD4KX7oHubfvkoXTmKibTxLUnzs6K2pUugf+A6
         ENXZLaUmpQYcP6xoZp62uZN+BU7MypGq3L9C8J0QDtr9lONeSJfni1SYBRBSWSr+/WU5
         hdG2nS9Tz+dEpzghrcwL09zvN47U1ujbnn9SDMZJlVe2mmqY7i2blVDbr6ZlTNOMFX5Y
         qHeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4bDq16yxySV+CRIrTjUgvBzTBjQMTd7HOZ8IkzcWK6w=;
        b=HMz4nbpkPo0+qqBSG+ObpRiDrGuGrW6NMOyUoD8tu2QmizUnLBMGz3X6fMG+7jRppI
         7eCHMayz18Dadl5bJIkDIuiHhsHt6oZA4C7kR+kgNoyygiElHiEBfmQlhoY/b8l3Ww4R
         RYXkdcKXIBS5wfqCunN45ZiTnMIa1UgBE58Ws1DCYMcVpFsAlM12PEV08u2TK6GkAF4Q
         JpkZE2RJcASe8G7IOz+1i+RwClxZdRkFLRHuQQgWgsOvFk+X5QcOlSabIOEqkGOcSjtT
         psjdnWC1PzybWBJoRvwW7p6UQFLw+LM9b65jwAJOxDfPw23KfbgeAn4iyqeA/vOvPpy+
         /WVQ==
X-Gm-Message-State: AOAM533bX8zoIoPyoNI5gbLjb8xGla/Kucu5GUycW5OZPkBrdCwmMTyN
	9KHrab0jdIyVr6vEeRU3b8bKsR5dc2V81Q==
X-Google-Smtp-Source: ABdhPJySCChsrQWKMQIWnjKH+vAxTH8lNif9PR22ZiJ2hBK9HAi7zZd+lZR75xvjjma8CwaFAtAfIw==
X-Received: by 2002:a17:90b:4b8f:: with SMTP id lr15mr15265599pjb.30.1622393441641;
        Sun, 30 May 2021 09:50:41 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from hilo.hsdl.ca.comcast.net (c-67-181-203-136.hsd1.ca.comcast.net. [67.181.203.136])
        by smtp.gmail.com with ESMTPSA id v18sm9358149pff.90.2021.05.30.09.50.41
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 May 2021 09:50:41 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][v2][PATCH] python3-scapy: drop this recipe
Date: Sun, 30 May 2021 16:50:40 +0000
Message-Id: <20210530165040.547348-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.24.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This recipe points to an unmaintained uri
Switch to the official project.
Moved package to meta-networking

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-devtools/python/python3-scapy_0.26.bb   | 13 -------------
 1 file changed, 13 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-scapy_0.26.bb

diff --git a/meta-python/recipes-devtools/python/python3-scapy_0.26.bb b/meta-python/recipes-devtools/python/python3-scapy_0.26.bb
deleted file mode 100644
index 31c88942d..000000000
--- a/meta-python/recipes-devtools/python/python3-scapy_0.26.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-DESCRIPTION = "Packet crafting/sending/sniffing, PCAP processing tool,\
-based on scapy with python3 compatibility"
-SECTION = "devel/python"
-HOMEPAGE = "https://github.com/phaethon/scapy"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=a88f5c4e1c935f295ebeaf51fc8644ef"
-
-inherit pypi setuptools3
-
-PYPI_PACKAGE = "scapy-python3"
-
-SRC_URI[md5sum] = "513469447735a4a416d495f63e28aa4b"
-SRC_URI[sha256sum] = "81e4f5522d38c136fd3f1be4e35ffe4fd1f4c2091db3c021d95f8b9d5978b9eb"
-- 
2.24.3

