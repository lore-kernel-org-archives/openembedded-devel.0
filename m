Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web08.4513.1621315382449341542
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 May 2021 22:23:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GnCLGlAE;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id q2so6536340pfh.13
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 May 2021 22:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QeiTkc3PFvqBXrn0GNGtRxtv+M8xvsH9d1llCqOlfIc=;
        b=GnCLGlAEWA7OvvPcZh8hPhP+9RgoNF/knpucjmrsvDV5jQZqSkmoDzk5jD0oLYUoC/
         SIYFGz10CjV/JhK5WpuLDaVlGYhhRy5tlG+uDYHdnz9NNW7w0Ebdn4pUhPkLw91OukfG
         WE1ROanccb6ZUQBTvPTQM/Nj3MOMmTfX/tQHVQKL0PUf4PDaGH3Qsu2EWTgoUAcFERvD
         0Lo29MCJ2kXW+dt+V0kuwpczyhddvg8ZPYs3PHbyMwPLJ+sA3CxNwnIw2kjmSy19UITz
         inwChiXbS6XC7KHd5XSzo5bGJgswjnmZnU8UDHCROeE0NPfiKuy8p8jvQs9XeZYwHH6O
         31ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QeiTkc3PFvqBXrn0GNGtRxtv+M8xvsH9d1llCqOlfIc=;
        b=qTq/ce7yXQz0Bu8+96b9WFBxbOKiMJvLDCKt3/mbSqrnGW65FAog2OfqNXYkapDH1w
         89aV0beZaNecPM3KWztk0ULGcgYfCSLk+nMPYl8VV8eQE+w0cAZ5rOroB/A4E12QEJ80
         M4xIBLJT9Y/mqXmQB2M3X7shIF4XQR2ygdKSmJreF3FK75m8oSMfWV6g4hBekOMGhIMz
         tW/azitFoaNr10k2z/hxl4YsxiVYMfGAsuX1N7Hkw1NW/MWss+Cco4IF61eqTabDqRol
         5bs9j+IC9xmTLf7Xilr+oVZIjn9B9zIYWUbZ3+ufRlZXA8E+zxhUDL5Q2fdumoU/4tqr
         Jzew==
X-Gm-Message-State: AOAM533r+T6OoqqselwxQ/Lr3v2j8I4YPy9+X63nPGpNghGx0tfm0TRH
	mMInPwJfs4mena4XPFl66IH015wl+MMzgQ==
X-Google-Smtp-Source: ABdhPJw66E2mIas5N1zIQYa1k0DiT2Is2PjCN4A1QoSLuEQuckiP0dWy//zgtLJYNqC5rkV39N9gsg==
X-Received: by 2002:a63:e30d:: with SMTP id f13mr3298411pgh.201.1621315381577;
        Mon, 17 May 2021 22:23:01 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0:db81:2f56:60e4:2c64])
        by smtp.gmail.com with ESMTPSA id d129sm11080225pfa.6.2021.05.17.22.23.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 22:23:01 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] python3-haversine: Fix build with latest python/setuptools
Date: Mon, 17 May 2021 22:22:59 -0700
Message-Id: <20210518052259.2801919-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...up.py-Correct-the-license-assignment.patch | 32 +++++++++++++++++++
 .../python/python3-haversine_2.3.0.bb         |  2 ++
 2 files changed, 34 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-haversine/0001-setup.py-Correct-the-license-assignment.patch

diff --git a/meta-python/recipes-devtools/python/python3-haversine/0001-setup.py-Correct-the-license-assignment.patch b/meta-python/recipes-devtools/python/python3-haversine/0001-setup.py-Correct-the-license-assignment.patch
new file mode 100644
index 0000000000..bb5955a44e
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-haversine/0001-setup.py-Correct-the-license-assignment.patch
@@ -0,0 +1,32 @@
+From 56b421a18ef8acb41ab9e4bde7e1f5452ec67da9 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 17 May 2021 22:17:07 -0700
+Subject: [PATCH] setup.py: Correct the license assignment
+
+latest python/2.9 + setuptools bail out otherwise
+
+lines = header.split('\n')
+| AttributeError: 'list' object has no attribute 'split'
+
+Upstream-Status: Submitted [https://github.com/mapado/haversine/pull/38]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ setup.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/setup.py b/setup.py
+index 549436d..9e7fb00 100755
+--- a/setup.py
++++ b/setup.py
+@@ -15,7 +15,7 @@ setup(
+     maintainer_email='julien.deniau@mapado.com',
+     url='https://github.com/mapado/haversine',
+     packages=['haversine'],
+-    license=['MIT'],
++    license='MIT',
+     classifiers=[
+         'Development Status :: 4 - Beta',
+         'Intended Audience :: Developers',
+-- 
+2.31.1
+
diff --git a/meta-python/recipes-devtools/python/python3-haversine_2.3.0.bb b/meta-python/recipes-devtools/python/python3-haversine_2.3.0.bb
index 6e02fcf71e..624d30ca01 100644
--- a/meta-python/recipes-devtools/python/python3-haversine_2.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-haversine_2.3.0.bb
@@ -2,6 +2,8 @@ SUMMARY = "Calculate the distance between 2 points on Earth"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
+SRC_URI += "file://0001-setup.py-Correct-the-license-assignment.patch"
+
 SRC_URI[md5sum] = "ff2d43a74195ec00c42ccd5da2a3f3de"
 SRC_URI[sha256sum] = "72c76855ac25e6ad054c7ed380e95c1a96803185f005dd11f40ccaa9620b551f"
 
-- 
2.31.1

