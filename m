Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
	[209.85.210.177])
	by mail.openembedded.org (Postfix) with ESMTP id 896367BD9A
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Jul 2019 16:04:09 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id m30so26754562pff.8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Jul 2019 09:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=N2Ubs4eR3t3op/yhCGH6bEPXgsHjbQfmSirvpmieqEU=;
	b=oAgMRoanmY/GS2BE/WuZKsHJfGLe6uZdouqDi6nRYKp/mEj0GwYvcB8bTiyYahpMgw
	EYCc+6BsPmttP+aIOyBQ8e7JRyWAMUevAPRlYD5EX+0KACMkSVp5tQMlqTWG21eS7lUX
	gQVDKVKkIBA+QB0C1J3uNEHYtOwlkqu1/F5F9wmWY6hoORZgZtnTG5e/4ZiYg3pvtGg3
	Tbf6LfBRoH3GjMk8WPxE3RGrAY5X+rKfBLtpfS4n8Yu4uHULRxeXcj9DaTWZCQPnasGW
	R0PLw1UhNqgcaSjhRGXHR9xQXplGrnQSbzTHTzJYMWI3xRJVt+Nvl9abCiuq99v1mMA8
	Gtng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=N2Ubs4eR3t3op/yhCGH6bEPXgsHjbQfmSirvpmieqEU=;
	b=IdGSIkhC5R8cMe14Tv0DUleEKHOx8snPkwHOPyLjeHrm922cLTESVll1WmBU+blkGC
	elIKsWW8JXpO1EuVr3TOKXcz/DcuOqfg+vVkClq5enU7H369CwaOIY4XJSeUBGLySZ1Z
	Gh+Tovwe8Br6+Djwf++NCQy4M32r4FhF+Hlk3aiUov7+WMOLgPKXb/sxcvCb8Xk+E7XJ
	4+SA6oWlecCmW6Q7pkGeYyhQi2aYE5BREg74uZ/9RQ7MYHh84TUC1+FkTp9m2lbaKG0q
	b2fXuuLYqAf2VJV0sOzQA2GQC3f6MIHPd5dBBF2OM1ETo2vAqXR18ESW/WF/utj6lOVI
	61vw==
X-Gm-Message-State: APjAAAXPkDrWbN4+QmsHViGjn4KarDcXrQWqFOy3uT/2nvhnQQgBTSct
	OgQryCisfVZrVS/5BX2uYAQb/TeRTfA=
X-Google-Smtp-Source: APXvYqxHTIZ1+zM0UhlOPforjutYXRreJ0oLGJJW6JVlNE8VmtvzvvHtGZ9hEssK6+YrcM0gJe7SBA==
X-Received: by 2002:aa7:8102:: with SMTP id b2mr32613859pfi.105.1564329850083; 
	Sun, 28 Jul 2019 09:04:10 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	j1sm82508439pgl.12.2019.07.28.09.04.09
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sun, 28 Jul 2019 09:04:09 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 28 Jul 2019 09:04:00 -0700
Message-Id: <20190728160401.23849-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH V2 1/2] pegtl: Fix build with clang/libc++
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 28 Jul 2019 16:04:09 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Ayoub Zaki <ayoub.zaki@embexus.com>
---
v2: Backport a patch instead of cooking one

 ...clang-warning-about-non-virtual-dtor.patch | 25 +++++++++++++++++++
 meta-oe/recipes-extended/pegtl/pegtl_2.1.4.bb |  4 ++-
 2 files changed, 28 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-extended/pegtl/pegtl/0001-Fix-clang-warning-about-non-virtual-dtor.patch

diff --git a/meta-oe/recipes-extended/pegtl/pegtl/0001-Fix-clang-warning-about-non-virtual-dtor.patch b/meta-oe/recipes-extended/pegtl/pegtl/0001-Fix-clang-warning-about-non-virtual-dtor.patch
new file mode 100644
index 0000000000..0c79c4c094
--- /dev/null
+++ b/meta-oe/recipes-extended/pegtl/pegtl/0001-Fix-clang-warning-about-non-virtual-dtor.patch
@@ -0,0 +1,25 @@
+From 340110292b35d367205953a59e7eab28e1f4a0bb Mon Sep 17 00:00:00 2001
+From: Daniel Frey <d.frey@gmx.de>
+Date: Sat, 7 Apr 2018 09:13:51 +0200
+Subject: [PATCH] Fix clang-warning about non-virtual dtor
+
+Upstream-Status: Backport [https://github.com/taocpp/PEGTL/commit/340110292b35d367205953a59e7eab28e1f4a0bb]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/example/pegtl/json_classes.hpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+--- a/src/example/pegtl/json_classes.hpp
++++ b/src/example/pegtl/json_classes.hpp
+@@ -34,10 +34,7 @@ namespace examples
+          : type( in_type )
+       {
+       }
+-
+-      ~json_base()
+-      {
+-      }
++      virtual ~json_base() = default;
+    };
+ 
+    inline std::ostream& operator<<( std::ostream& o, const json_base& j )
diff --git a/meta-oe/recipes-extended/pegtl/pegtl_2.1.4.bb b/meta-oe/recipes-extended/pegtl/pegtl_2.1.4.bb
index f41eef2a01..344a805245 100644
--- a/meta-oe/recipes-extended/pegtl/pegtl_2.1.4.bb
+++ b/meta-oe/recipes-extended/pegtl/pegtl_2.1.4.bb
@@ -4,7 +4,9 @@ LICENSE="MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=80cb066ab204c7fe022f1cfe0c2c6818"
 
 SRCREV = "776fa4a1e8bda860008524f6dd9473967c8375b1"
-SRC_URI = "git://git@github.com/taocpp/PEGTL.git;protocol=https;branch=master"
+SRC_URI = "git://git@github.com/taocpp/PEGTL.git;protocol=https;branch=master \
+           file://0001-Fix-clang-warning-about-non-virtual-dtor.patch \
+          "
 
 inherit cmake
 
-- 
2.22.0


