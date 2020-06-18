Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com [209.85.215.196])
 by mx.groups.io with SMTP id smtpd.web11.10176.1592494094034310233
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Jun 2020 08:28:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jGos/bF2;
 spf=pass (domain: gmail.com, ip: 209.85.215.196, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f196.google.com with SMTP id s10so3077112pgm.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Jun 2020 08:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=nj2VoPIHWJLK3L1pNjf6otDIQlKGuREKd8i3doz1kTc=;
        b=jGos/bF2/vjy3CAPgnNhGDSi0AEkaT/i3duCJbR/8ml6L9N/AZHkutfY35dwUnhHII
         /NpCEy2tbj6rsuU+feVSpNg38xnBZzy6IaFKXKZkhyRCHgo0UaiNHwEFLPPFA96niQtZ
         yCSYHRBJQK3QiSlkG2pzdETKaGnAlNJ9vkn2PXZkTgvHuFFhwt0j1I1ZJarYiVr3xMIc
         uqcI9H+20qvMRbq/nkJPw3XjJGxEwh+XRYAJB++QtsTnXeYeFIRWhuckFgUrEVpc6P72
         ZKI9+Y8Ko02bEMwFKC0CCUIt8YUoz1M+xfFNOIwAFKkqdMl8Qntilyrzk7FfZOrPbx+6
         VZ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=nj2VoPIHWJLK3L1pNjf6otDIQlKGuREKd8i3doz1kTc=;
        b=TfIttiDmkQ8y6XyB9Hu/1OH3vSdCWzR2Tx0co3wjifqZIh8aZ4/Zrz+IEIOAoDymKm
         z8xVzUPWaTtbkMyOdPQ79BzsACu7Fhma5e63ek3v+uPKvwR6aIntHzqht8FIj40JUk1D
         x8iavOY4Pf++qoGHc3RWfllKAKjGktyE6seXwLA4QXUt3PNxpWL4x/MhqZVl1ILBbcKP
         ed2W9GErfzG9S4ETm68Xi97D2D7Y8ApwwL1WugVtDgGlrGY57Rm+5TDqQwfiwa000KWC
         ejdcRHJCoZqNnknH6VdJLnvmmRXvrkpEePyfaBvq4Wq15R4GsN951wtNBO3ZRngRbfOt
         kF0Q==
X-Gm-Message-State: AOAM5313joUCeYu8iy/sa+QCMt4RLQayyIDsbvO4xBEUVz5n6owOSOHu
	nYnBGDOadAYy/w7dKHiGb3FDiEst
X-Google-Smtp-Source: ABdhPJzSgXOXt15zal2Z8L0iR5eTBNp0S1S5/ofFu80eeWOEXC1wZPst8gB5KAw4skoZRxjRG5qF6w==
X-Received: by 2002:a62:1c46:: with SMTP id c67mr3977686pfc.170.1592494093333;
        Thu, 18 Jun 2020 08:28:13 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:88de:dadb:4f45:bd2e])
        by smtp.gmail.com with ESMTPSA id u24sm2800356pga.47.2020.06.18.08.28.12
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2020 08:28:12 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 5/7] python3-sqlsoup: add package
Date: Thu, 18 Jun 2020 08:28:03 -0700
Message-Id: <20200618152805.13075-6-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200618152805.13075-1-akuster808@gmail.com>
References: <20200618152805.13075-1-akuster808@gmail.com>

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-devtools/python/python3-sqlsoup_0.9.1.bb     | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-sqlsoup_0.9.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-sqlsoup_0.9.1.bb b/meta-python/recipes-devtools/python/python3-sqlsoup_0.9.1.bb
new file mode 100644
index 0000000000..592ba72043
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-sqlsoup_0.9.1.bb
@@ -0,0 +1,9 @@
+SUMMARY = "A one step database access tool, built on the SQLAlchemy ORM."
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=4382f3a1adb96f258dbd80f5b400f0d5"
+
+PYPI_PACKAGE = "sqlsoup"
+SRC_URI[sha256sum] = "2fafb7732a663dcd59b37e64d1c94d5fb20d4fad32cd8ee260aa1cd9a10340d6"
+
+inherit pypi setuptools3
-- 
2.17.1

