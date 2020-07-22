Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.848.1595458579959038905
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Jul 2020 15:56:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KAI9FgZE;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id o1so1704714plk.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2020 15:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FRtH3bBpNJPqqx15rmOp5xYwwQrVa5bPnMMDPYNBpjk=;
        b=KAI9FgZE91yTOChsIi1DP7p1OWvPO9f+REt1HZBuZxp5grVIFYnSuGIpt+fZQA+dQF
         kjFG6OVtSovm75F4DjqQVy3WVcldlM5SJvSZD91XQ0JvTCehZxTibD9tAIr29/wv1H/x
         sHQFHr7gcErs+j98/Tu13jvqxsTYSovIE1L6R0PfGlHhbBVanKlquw+4O0gXGRdYV/kZ
         GaX1bLZxt+lV9coHKze0CANU+mR/jQ2s5gA5fjBSM3wwbkNpqOqykUoPUaegp301mO0s
         eWX7+mlmKJ511dugnaB1Ble3YYiGB2ciOWjjo6IejrH13BEBsg6y1EuSugEeVcdK/By1
         LEdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FRtH3bBpNJPqqx15rmOp5xYwwQrVa5bPnMMDPYNBpjk=;
        b=uAuHohlnRqAy5BD3nl95Xvc8/KpeJus9zsL7VQ9kguqiCVVMOiMBqU5tkMsTo4oQx1
         28LX1ect5yxeH6dLcCuIeVPy98+BvAc+S7hRQtgAPn6cy3rWrTHrYiNY9+HB92HMIIfW
         4X3UteuVWPXC2ZeNqzRBsYRL6UbJIRvsZAF1Xc4J0EAm1mDX1eJ9Y7aKmbrjXXYqaafF
         YKZy5MydGQ64NKeFmggF3kMkLWt3m7xFuX6ERqlMQy6SWJGNdTuI74dmhS9sFZjv3vZO
         hgEYkl8OD8rpfWrC1o6HHGa12KHw9CCheqer3VGVUppiN78VHo4ntoWlMrUPo3wtd4PS
         9duw==
X-Gm-Message-State: AOAM530GzSLUTKa6dwfNfGDKvWvfR7SY9C1t+OILzTPF3uRnba+J6es4
	u67OtH5fJccjR1CvWBflGpqS4ysc1hI=
X-Google-Smtp-Source: ABdhPJyq7NyzUe4Z5TitNPztD/g6gnPYqFvkEWN+nv+h9Yt2xYM4tYQ1CunXyFgOp3huldPISQkspg==
X-Received: by 2002:a17:902:8a93:: with SMTP id p19mr1307117plo.275.1595458579110;
        Wed, 22 Jul 2020 15:56:19 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::6651])
        by smtp.gmail.com with ESMTPSA id k64sm637357pfd.132.2020.07.22.15.56.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2020 15:56:18 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Colin McAllister <colinmca242@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 3/4] python3-diskcache: Added recipe
Date: Wed, 22 Jul 2020 15:56:07 -0700
Message-Id: <20200722225608.3968953-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200722225608.3968953-1-raj.khem@gmail.com>
References: <20200722225608.3968953-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Colin McAllister <colinmca242@gmail.com>

Created python3 recipe for diskcache.

Signed-off-by: Colin McAllister <colinmca242@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/python3-diskcache_4.1.0.bb              | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-diskcache_4.1.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-diskcache_4.1.0.bb b/meta-python/recipes-devtools/python/python3-diskcache_4.1.0.bb
new file mode 100644
index 0000000000..91cff0cd15
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-diskcache_4.1.0.bb
@@ -0,0 +1,14 @@
+DESCRIPTION = "Disk Cache -- Disk and file backed persistent cache."
+HOMEPAGE = "http://www.grantjenks.com/docs/diskcache/"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=9e046ce8fae71087134866418f646ec3"
+
+SRC_URI[md5sum] = "21c9945e7707799e1c64956f8a54d4c3"
+SRC_URI[sha256sum] = "bcee5a59f9c264e2809e58d01be6569a3bbb1e36a1e0fb83f7ef9b2075f95ce0"
+
+PYPI_PACKAGE = "diskcache"
+
+inherit pypi setuptools3
+
+CLEANBROKEN = "1"
+
-- 
2.27.0

