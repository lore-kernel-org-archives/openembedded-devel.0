Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web12.10188.1592494096012346875
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Jun 2020 08:28:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BUjoVafb;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id x207so2945785pfc.5
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Jun 2020 08:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=WBfddf/XTkCLsXkL7fTOnfDwUGZVym7V5tuBjZayCwU=;
        b=BUjoVafbx9o364nyWfMxBWCYoyPIqcM/1FxdedkzdLIxfT9yDnqC15UkbFSRMPBMt1
         iNGluQFXivCCFlhqX2YoBG2mB9N7wKq67RGG4OQgvhdkKUsASbjj5imWX/HNO4fo6JvR
         y83Z+XI3x7i+TLiY/RIkyWJfZi1/teGYov3wklJRgO4S3mSN0p78tWEfDJIN5/irXpQA
         TfWrGA1wwmUiFol/BamS9Vd+Z+xTqZ0R6ladQc8m6w6QVcYMyjuf3x6pCSPntgMj28wG
         hZAyMgkMfKrjlD/XRFWsdl1H4xMDrLCwkVG1AQBR0d4mGN7aWzMtbuuUCzOaga8bv/Rf
         2PJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=WBfddf/XTkCLsXkL7fTOnfDwUGZVym7V5tuBjZayCwU=;
        b=PUjTWdk+ScYiqGZ7SDb+Z69pRnX4PGuJI3ABsF8xL+fPf3hWx4MsSfCfTfIIjfEkLY
         zNprOlM1JYiRN9H4odnXuBAfKjb0H6LFGgaGfzzDQnr1LI2zHHkVzY2tZ3CyrmYltYDR
         qot1ELUb0M8/FSxrRdoR+2ndZdP/ZOxMCPkdduVcSvTh5l6wF3NkAbBBakmPvoaofJn9
         hwRe8EmgipUQdR4QuHTFqxVpxDfGltFPwWTyBQvbUGqefNXFNSuwz5CZ669Fc2ABB/gw
         v/gxC+6Jx7TlTPhig0f2vbMl8w72OgKe+jOQbXtLQXIKIlNvyow6eVLYQj8Jog1/OJh4
         mohg==
X-Gm-Message-State: AOAM531rnMlaLN11DOLeBPYH7YkEVmw4c55W2O44hE0vquAD/q0AZbK3
	v08KLCxOxOVEYlr/jrdSBGgA5gN4
X-Google-Smtp-Source: ABdhPJyuTx9lKdQqjy0rb1rFX5ixAG84rlZUQIxrAodpNlwXsHxGmKvlhXZ+nyf/Wp2TVpPOz/Co6A==
X-Received: by 2002:aa7:99d0:: with SMTP id v16mr3891333pfi.98.1592494095326;
        Thu, 18 Jun 2020 08:28:15 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:88de:dadb:4f45:bd2e])
        by smtp.gmail.com with ESMTPSA id u24sm2800356pga.47.2020.06.18.08.28.13
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2020 08:28:13 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 6/7] python3-smpplib: add package
Date: Thu, 18 Jun 2020 08:28:04 -0700
Message-Id: <20200618152805.13075-7-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200618152805.13075-1-akuster808@gmail.com>
References: <20200618152805.13075-1-akuster808@gmail.com>

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-devtools/python/python3-smpplib_2.1.0.bb     | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-smpplib_2.1.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-smpplib_2.1.0.bb b/meta-python/recipes-devtools/python/python3-smpplib_2.1.0.bb
new file mode 100644
index 0000000000..948af58aab
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-smpplib_2.1.0.bb
@@ -0,0 +1,9 @@
+SUMMARY = "SMPP library for python"
+SECTION = "devel/python"
+LICENSE = "GPLv3.0"
+LIC_FILES_CHKSUM = "file://README.md;md5=56a03d0ce7e492d4b9487b8aae957efe"
+
+PYPI_PACKAGE = "smpplib"
+SRC_URI[sha256sum] = "df4139a279b35fbb42a58f2a254a9c6daf362b04a7f94e208dc120e0b8a3fd4b"
+
+inherit pypi setuptools3
-- 
2.17.1

