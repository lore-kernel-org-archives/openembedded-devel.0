Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web11.36781.1606592844163055817
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 28 Nov 2020 11:47:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DBGDID2/;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id w16so7012474pga.9
        for <openembedded-devel@lists.openembedded.org>; Sat, 28 Nov 2020 11:47:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=TLFkKMQLly1CRd5Ghggm1vZbeNgT9/tc9lMOeOBLIpM=;
        b=DBGDID2/ubZx1ygHtyB/Ga9BrfVNB0C4UxyyaWXtv4Dzj8SXzizYuKr9Xl3r59Wt9Z
         iRvIixnMU34xOdcs5cI+H+PgSOtDxI8U5d9AJp+6KXR1CqLc34wSW1OU9Vgjz1tpMVOC
         9bL9yzupbnWlc9rcjRN8P0WSXJFFpwOBPvHk+WUlWb4oK0Syppt5ufILFQztQ7JywkMI
         GA/FgULxk43pjdQV+eTASdKPnbwg5rTHzLmjaW1K01pxxiGGX716WO25raT/rlvHvBzD
         gOD1cGjfxCo7xadyqAF6uhnJ4Q10++ZEr2Czuns5/eU/ClFHYzhjKaVNh/2HFFKYbVE6
         qByQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TLFkKMQLly1CRd5Ghggm1vZbeNgT9/tc9lMOeOBLIpM=;
        b=Y1x2gaUdJmKlYy8thYqI1aFDDB2Tuy3Wd0dZCxA44P3Ud/8krUV9nqefZb/s5EWkHb
         fszvOyfoA3z8adbs8K/xV4VoRhFGLgAAtdQjxALfkymwmXOGbb/Uv0sJ4AQOuDpZz3to
         y/FttoY0nY8YYqtIkndpZPmcknPiTNCLlkH4nLe3jngIFhqVuT5vFSogHcMTq0bBp5jC
         MUwgQx5v6LyZwLfK/skk8XA7su7hYc1zzzLODB/HZalTIwNGmLEC+2VdSw+3MtcTbjMS
         C9Iw5yYyDngbhdryl/dvyIHlohWxVRKphVF5PHVgPwCn0gFIYWdRIJIhutk3N/VeF0kE
         f/AQ==
X-Gm-Message-State: AOAM532JYsuXdcIrdPbmZRK6TSUEshIMFdwv9LUedchxXIdAJGpfaRpv
	wZ3fdfe7prkBcXbLoGjKrBuNakTmCwpmvw==
X-Google-Smtp-Source: ABdhPJxwuk+Av+6w9vd6qZ9dYyMXxYe4G7kfwDpipSKV+KVL5asHgAt42cFoIQyB7U1FUw3IKP2ZuA==
X-Received: by 2002:a17:90a:2a83:: with SMTP id j3mr18153497pjd.84.1606592843538;
        Sat, 28 Nov 2020 11:47:23 -0800 (PST)
Return-Path: <ticotimo@gmail.com>
Received: from thetis.local ([2601:1c0:6000:9640:58b6:35be:25dc:8a78])
        by smtp.gmail.com with ESMTPSA id d2sm16084702pji.7.2020.11.28.11.47.22
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2020 11:47:22 -0800 (PST)
From: "Tim Orling" <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 06/16] python3-toml: drop (moved to oe-core)
Date: Sat, 28 Nov 2020 11:46:46 -0800
Message-Id: <46e510e2627ef2cc6a2ede1d9ebfea99e6569f70.1606592636.git.ticotimo@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <cover.1606592636.git.ticotimo@gmail.com>
References: <cover.1606592636.git.ticotimo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tim Orling <ticotimo@gmail.com>

Signed-off-by: Tim Orling <ticotimo@gmail.com>
---
 .../python/python3-toml_0.10.2.bb                 | 15 ---------------
 1 file changed, 15 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-toml_0.10.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-toml_0.10.2.bb b/meta-python/recipes-devtools/python/python3-toml_0.10.2.bb
deleted file mode 100644
index b46eba6fd1..0000000000
--- a/meta-python/recipes-devtools/python/python3-toml_0.10.2.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-SUMMARY = "Python Library for Tom's Obvious, Minimal Language"
-HOMEPAGE = "https://github.com/uiri/toml"
-LICENSE = "MIT"
-SECTION = "devel/python"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=16c77b2b1050d2f03cb9c2ed0edaf4f0"
-
-SRC_URI[sha256sum] = "b3bda1d108d5dd99f4a20d24d9c348e91c4db7ab1b749200bded2f839ccbe68f"
-
-inherit pypi setuptools3
-
-BBCLASSEXTEND = "native nativesdk"
-
-RDEPENDS_${PN} += " \
-    ${PYTHON_PN}-misc \
-"
-- 
2.25.0

