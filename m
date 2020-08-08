Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web12.9008.1596906258232158678
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 08 Aug 2020 10:04:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=APAXtbvW;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id d4so2572786pjx.5
        for <openembedded-devel@lists.openembedded.org>; Sat, 08 Aug 2020 10:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GtYU09HukjLIUZaT3CmZOFEhVz5VociScn81D27Dj34=;
        b=APAXtbvWJH6tsl6P9D6SwxrFUGx11rUxhhpu09h/Kfee82npmwE5f+u8i4BcqHv0HE
         5p0kVb//Hd0q74wSBBMC9v2Q2+EFL2sC5I2EF32p1JeurrU6bZLgARrK9AHhS1tQ13iR
         dEnYxsZex0RByGSk1yts2onP0JFSp0K/UZ4RHGCMjuyBPtOpyftjRTKOnpdtev92z3Wi
         bsFl0L3ZM0C5N4qSvKUjFOmdGFX/4wm6CoPw6xLsV32B6/VKUjdc9hcK/TNDbrRkRsS/
         c6A/iMk6QyKJRC7yONuAO9d4cvj1uVJA8yIin2p7MP9I4dhe64azK0bKRxOvdo3tS7Km
         hqYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GtYU09HukjLIUZaT3CmZOFEhVz5VociScn81D27Dj34=;
        b=H382y8ttdCnbvNW9avKzPhlmBXlRPd6iPXBzOtDpPYVM6u/43uN9bmG/xOIVrWuReb
         ystsNRjiN4U03z0CtlUE/hezPi9UBPetqeXkO4/vGWl7w1LLZi6iaypGIoRaWWt/+mpr
         1dVogBAcCVCTre6AxxBqq5tCMVlz/8ga6pfpXJ3RHE4Yk3kuG2tXDbDrh0CE8FqU8B1P
         BzVfEgLGBQIqt2KyaUZT8U4ChTWR8sA/MRBm2rPzz9f5R5Yu3eTh5ilP1sQIQeeV5SJF
         FTMGH3Ji2YdKJFM0SzoZAuZ7H3pA1EwZzw3f0EKOdvc8vmCop/MEE325mZj4c/qmFtXY
         L2QA==
X-Gm-Message-State: AOAM533z1Rslg6nfUYpXBPk+LQaAkOHW68AfTMx9/QGbNTJ63QS2xcER
	8TmCw7aGykGAZEvInHjPBE0if0F45iY=
X-Google-Smtp-Source: ABdhPJzhts+kV8GKxG1HE6kRfaZ3otHdAOK8JiPfK0Oi+OjafMJ0MQYztXaxWoueisO5IAzrJG8YBA==
X-Received: by 2002:a17:90b:1493:: with SMTP id js19mr16544971pjb.223.1596906257527;
        Sat, 08 Aug 2020 10:04:17 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e60c])
        by smtp.gmail.com with ESMTPSA id j130sm14280225pgc.76.2020.08.08.10.04.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2020 10:04:17 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Shlomi Vaknin <shlomi.39sd@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][ 8/9] python3-parso: add recipe
Date: Sat,  8 Aug 2020 10:04:06 -0700
Message-Id: <20200808170407.2326879-8-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200808170407.2326879-1-raj.khem@gmail.com>
References: <20200808170407.2326879-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Shlomi Vaknin <shlomi.39sd@gmail.com>

Signed-off-by: Shlomi Vaknin <shlomi.39sd@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/python/python3-parso_0.7.1.bb   | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-parso_0.7.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-parso_0.7.1.bb b/meta-python/recipes-devtools/python/python3-parso_0.7.1.bb
new file mode 100644
index 0000000000..6d775227c5
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-parso_0.7.1.bb
@@ -0,0 +1,12 @@
+SUMMARY = "A Python Parser"
+HOMEPAGE = "https://github.com/davidhalter/parso"
+AUTHOR = "David Halter <davidhalter88@gmail.com>"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=cbaa2675b2424d771451332a7a69503f"
+
+PYPI_PACKAGE = "parso"
+
+SRC_URI[md5sum] = "eac40cda515ee71e3bb008c404ca3ac1"
+SRC_URI[sha256sum] = "caba44724b994a8a5e086460bb212abc5a8bc46951bf4a9a1210745953622eb9"
+
+inherit setuptools3 pypi
-- 
2.28.0

