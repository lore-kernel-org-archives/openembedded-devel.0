Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
	[209.85.215.169])
	by mail.openembedded.org (Postfix) with ESMTP id 0A1847F948
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Jan 2020 02:49:32 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id k197so22781133pga.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Jan 2020 18:49:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=Rmg5FvXbWnuqdpy1wqW4mekKBzwzb9v39esIloYcMG0=;
	b=PqVs+vq9UB9vRXKDmGrkpTlTEgI0jPnGs41Jd0M0KKSXem7IHNLEJxU5AeDyqhuhjq
	tDBb5Tx9LYT0kvPaGPlLSEP42eZ+s3YEZI/XgBkVJvZ9ZZe7nXD0AdH0GX+oXSe5V+eT
	KPN659xb8J+hPAIp7vyhzYQ58D/MSZ81qhromO45WdhXpSU91OFtxDe+ONUoYiniAay3
	topmHCvRt5nShqwG1Vu51SicHep1XIg1usTj86V9z4WJD9cpjfa+2lmFjmbqQtcEBgoP
	6zZyUnnSjmBxz0n6ey9dfpJ6IcwMHlRc7wxkD3g3txKpNajDk8EzrZ15+nCk7n2SzFg+
	o+rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Rmg5FvXbWnuqdpy1wqW4mekKBzwzb9v39esIloYcMG0=;
	b=UfFUykrgJnTBgChxexAkfZdB1VoDkxFxnJy5pvvW1adgZvEzqArZ1lcp/tHpcC+jpH
	hLf6/E4YLGP45tzCKULXaH7Ded4ofGJtmrfDSOgtKN25979qsTZhDGqWInHZLwfQ9jmi
	/358wqKGfSLyGiEApvWJPhEaqchyuiqKZj6+iXachZGOwY8AuXpSYhyKTn0AKbrWoGTD
	F6TuBbixuZg2FUWJRLj9fx5VDphjsjDxJLxF3jEpmApYODRV0NHdb4zOEWZhE3dlGt8D
	oAn67gEjKUYUIuyjXzc12Tg1J8medtOHTAmVUr0Kl/OOhq+oM4rPa7munAK0VsGISwpS
	bhYA==
X-Gm-Message-State: APjAAAXGzPIKiOf6dc0d3WKsYmGVx7k3yWbzyQRl5RfTT2lB42hFp1nI
	r8BSTQFhQXBHBUAchZgVQ2FniwODvuc=
X-Google-Smtp-Source: APXvYqzOk9vuRdi6b2dzSEyybzz6OD1eixkZB7nAyK6JXxtZE4b9vNw4wY8jfAbRqbs0ETDKxThMaQ==
X-Received: by 2002:aa7:85d3:: with SMTP id z19mr92399888pfn.62.1578019773981; 
	Thu, 02 Jan 2020 18:49:33 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:555:ddff:6770:148b])
	by smtp.gmail.com with ESMTPSA id
	p5sm61306640pga.69.2020.01.02.18.49.33
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 02 Jan 2020 18:49:33 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  2 Jan 2020 18:48:59 -0800
Message-Id: <fa3a7d40a7c34bc4911366125facae617a46353e.1578019547.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578019547.git.akuster808@gmail.com>
References: <cover.1578019547.git.akuster808@gmail.com>
MIME-Version: 1.0
Subject: [zeus 02/17] tinyalsa: fix installation libdir path to match multilibs
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
X-List-Received-Date: Fri, 03 Jan 2020 02:49:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Khem Raj <raj.khem@gmail.com>

Fixes
ERROR: tinyalsa-1.1.1+gitAUTOINC+8449529c7e-r0 do_package: QA Issue: tinyalsa: Files/directories were installed but not shipped in any package:
  /usr/lib
  /usr/lib/libtinyalsa.a
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Andreas Müller <schnitzeltony@googlemail.com>
Acked-by: Andreas Müller <schnitzeltony@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit d9f3e6dbed8e5d96f2069280f0a566af89afb2fa)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-multimedia/tinyalsa/tinyalsa.bb   |  4 +-
 ...L_-path-instead-of-hardcoding-bin-li.patch | 46 +++++++++++++++++++
 2 files changed, 49 insertions(+), 1 deletion(-)
 create mode 100644 meta-multimedia/recipes-multimedia/tinyalsa/tinyalsa/0001-Use-CMAKE_INSTALL_-path-instead-of-hardcoding-bin-li.patch

diff --git a/meta-multimedia/recipes-multimedia/tinyalsa/tinyalsa.bb b/meta-multimedia/recipes-multimedia/tinyalsa/tinyalsa.bb
index 8b86f824303..062096892ee 100644
--- a/meta-multimedia/recipes-multimedia/tinyalsa/tinyalsa.bb
+++ b/meta-multimedia/recipes-multimedia/tinyalsa/tinyalsa.bb
@@ -7,7 +7,9 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://NOTICE;md5=dbdefe400d894b510a9de14813181d0b"
 
 SRCREV = "8449529c7e50f432091539ba7b438e79b04059b5"
-SRC_URI = "git://github.com/tinyalsa/tinyalsa"
+SRC_URI = "git://github.com/tinyalsa/tinyalsa \
+           file://0001-Use-CMAKE_INSTALL_-path-instead-of-hardcoding-bin-li.patch \
+          "
 PV = "1.1.1+git${SRCPV}"
 
 S = "${WORKDIR}/git"
diff --git a/meta-multimedia/recipes-multimedia/tinyalsa/tinyalsa/0001-Use-CMAKE_INSTALL_-path-instead-of-hardcoding-bin-li.patch b/meta-multimedia/recipes-multimedia/tinyalsa/tinyalsa/0001-Use-CMAKE_INSTALL_-path-instead-of-hardcoding-bin-li.patch
new file mode 100644
index 00000000000..6f9c39996bf
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/tinyalsa/tinyalsa/0001-Use-CMAKE_INSTALL_-path-instead-of-hardcoding-bin-li.patch
@@ -0,0 +1,46 @@
+From fe4f3c2a37a81201f463ff962364f014f50c9896 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 16 Dec 2019 22:58:41 -0800
+Subject: [PATCH] Use CMAKE_INSTALL_<path> instead of hardcoding bin/lib/
+ install paths
+
+Helps fix build/packaging issues on machines where default libdir is not
+lib but say lib64
+
+Upstream-Status: Submitted [https://github.com/tinyalsa/tinyalsa/pull/143]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ CMakeLists.txt | 14 +++++++++++---
+ 1 file changed, 11 insertions(+), 3 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index cb31c58..1cc4a85 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -41,12 +41,20 @@ add_util("tinymix" "utils/tinymix.c")
+ install(FILES ${HDRS}
+     DESTINATION "include/tinyalsa")
+ 
++if(NOT DEFINED CMAKE_INSTALL_LIBDIR)
++    set(CMAKE_INSTALL_LIBDIR lib)
++endif()
++
++if(NOT DEFINED CMAKE_INSTALL_BINDIR)
++	set(CMAKE_INSTALL_BINDIR bin)
++endif()
++
+ install(TARGETS "tinyalsa"
+                 "tinyplay"
+                 "tinycap"
+                 "tinymix"
+                 "tinypcminfo"
+-    RUNTIME DESTINATION "bin"
+-    ARCHIVE DESTINATION "lib"
+-    LIBRARY DESTINATION "lib")
++    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
++    ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
++    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR})
+ 
+-- 
+2.24.1
+
-- 
2.17.1


