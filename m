Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web10.10225.1592494096733091862
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Jun 2020 08:28:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Vku6zG1a;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id e9so3044071pgo.9
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Jun 2020 08:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=ZK1bLWKkcw9lUXIlH8fG3pgDZBtrw/jLCYNP3+mMomI=;
        b=Vku6zG1anf77FDHsK3/jEv96UPylDMj9wjPS6p1dlO+ZB4FGlwy/qDjmaXJ5f/yxXT
         j5e6QoCkeWH4V769T1uhWx1YIq5ofH235Yk17VM+5XBUKWebj+dvhAGtszDRIHpK/WIK
         +pHM4ghEnvO5ZBYS6QyeBBYBm/Y/QTjQMINO/KExJBxY63T6E9qN5+52CpV1kBULJ2Bg
         8jzkSymiiLZluurhy5hsJ1rpP2uvQdKVjjgV623As36AdEJBzYcPtGurrpgmebE6Iynb
         whDMbWcuxleoFwi3pLt74Q6OJPLGL2MGQ5xDHutKFF0+9pZSDBK3vGblQFZIbOQ4nXn2
         VIAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=ZK1bLWKkcw9lUXIlH8fG3pgDZBtrw/jLCYNP3+mMomI=;
        b=D9JFL9Co0oYphMAst4iYWXsyKjn5NYiZDEpFTxzeuFNMqPtX9gioT1PqVS1mW9g0TH
         wxB/ch75BI5iPSPlgQkXd9hkwbsvd8NHJTa84OfhvovwszjZsBCA558dqNPz1IGPcz4c
         WEWjafFT36gYltmZUe8FUecyVRcvbvBpKVPZCLgpEUoyFf4P/3Sj3CdYjnTuUYwOrE5F
         pHOlBzCI+lx0B2aUvudpEWSOJ+sPRhCZSrkwoSJ959eK5CvXCxQDaNoxI42MYnC8tWyY
         QrE5sd666cp+zoeklQ2ZnAgWQKhdTMEjKVdxsX82kheXLs85/M4OsVHp12zQbn0kaugL
         JRiw==
X-Gm-Message-State: AOAM531FDsLFSfkMT/w517tlUiJJc5vMSm3sR62t3cVSVBopY0L+OFaZ
	tv9dSzB7Q6KZR5DrZmWgu528T0E7
X-Google-Smtp-Source: ABdhPJz9qjTHBb7uyXMc0QNMa8iG47Y+j0/VL+KgomfVEpWArbhcrcIMIcyhT50uqJVPeRSzuOlOZQ==
X-Received: by 2002:a62:dd51:: with SMTP id w78mr4184965pff.28.1592494096103;
        Thu, 18 Jun 2020 08:28:16 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:88de:dadb:4f45:bd2e])
        by smtp.gmail.com with ESMTPSA id u24sm2800356pga.47.2020.06.18.08.28.15
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2020 08:28:15 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 7/7] python3-pyrad: add package
Date: Thu, 18 Jun 2020 08:28:05 -0700
Message-Id: <20200618152805.13075-8-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200618152805.13075-1-akuster808@gmail.com>
References: <20200618152805.13075-1-akuster808@gmail.com>

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-python/recipes-devtools/python/python3-pyrad_2.3.bb | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pyrad_2.3.bb

diff --git a/meta-python/recipes-devtools/python/python3-pyrad_2.3.bb b/meta-python/recipes-devtools/python/python3-pyrad_2.3.bb
new file mode 100644
index 0000000000..3b38fb3a4b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pyrad_2.3.bb
@@ -0,0 +1,9 @@
+SUMMARY = "RADIUS tools"
+SECTION = "devel/python"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=debd8dc49cd9a7d58c7fffc771efed4f"
+
+PYPI_PACKAGE = "pyrad"
+SRC_URI[sha256sum] = "89c4d9b2cab1746c48dc0d93898d278e34a40acedf6f511aeaa748bcd4490295"
+
+inherit pypi setuptools3
-- 
2.17.1

