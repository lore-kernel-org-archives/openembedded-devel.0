Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 86D357325A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Aug 2016 12:09:28 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id i138so11128993wmf.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Aug 2016 05:09:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=jmR2JRkE++35i5HN5W9OSXkcqNrDSWNJSVzWAEmpfug=;
	b=U8L5iMkA/q5QQX9FqxiKSg1wHVcPF1fx7uHoZIOA8LnnbAQRCCkkuQ3iYmhnYRUBHD
	PQmVDEBChEwP/oYuMn8eLpmpDi60+9Cl4510u6Ef1gxQnBOkobI4UWjJXniRCgVQR3lC
	lyVO8ImfbuXSGnThZ4wWW19cBuAbwnoRw/ufHK2c5scqrJMasvzgotPuhtTam1yoaqmW
	7D7/KpAbTDZh1D4RjBj1LibZZ9mnwEFgBwhHvhHCOkjb8KW08DzbV4oB0bdqcmIdThrR
	wLANaivvUHXSvzuKQlAFDP3LGvFEr1iJXuotbPJxWfCcOOKNXPd5o/ZzKldWX42NO7A1
	GqjQ==
X-Gm-Message-State: AE9vXwOip4truvwmf4mbdU5QWbPbX791d+j6ZwGwc2anvH7f0cSd/8kUjm9RVGePPFS2JA==
X-Received: by 10.194.178.102 with SMTP id cx6mr3562991wjc.58.1472213368373;
	Fri, 26 Aug 2016 05:09:28 -0700 (PDT)
Received: from tfsielt31850.tycofs.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	x6sm19735626wjk.26.2016.08.26.05.09.27
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 26 Aug 2016 05:09:27 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 26 Aug 2016 13:09:26 +0100
Message-Id: <20160826120926.18924-1-git@andred.net>
X-Mailer: git-send-email 2.9.3
MIME-Version: 1.0
Subject: [meta-oe][PATCH] asio: fix musl compilation (strerror_r)
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
X-List-Received-Date: Fri, 26 Aug 2016 12:09:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Cherry picked github pull request #95
  https://github.com/chriskohlhoff/asio/pull/95
  https://github.com/chriskohlhoff/asio/pull/95.patch

Signed-off-by: André Draszik <git@andred.net>
---
 meta-oe/recipes-support/asio/asio/95.patch  | 43 +++++++++++++++++++++++++++++
 meta-oe/recipes-support/asio/asio_1.10.6.bb |  2 ++
 2 files changed, 45 insertions(+)
 create mode 100644 meta-oe/recipes-support/asio/asio/95.patch

diff --git a/meta-oe/recipes-support/asio/asio/95.patch b/meta-oe/recipes-support/asio/asio/95.patch
new file mode 100644
index 0000000..a337ad3
--- /dev/null
+++ b/meta-oe/recipes-support/asio/asio/95.patch
@@ -0,0 +1,43 @@
+From 52d862c4e8af60a31f0067e1070b8625e805cdc3 Mon Sep 17 00:00:00 2001
+From: Natanael Copa <ncopa@alpinelinux.org>
+Date: Thu, 21 Jan 2016 23:37:32 +0100
+Subject: [PATCH] Fix use of strerror_r()
+
+Don't try keep track of all platforms which follows posix standard.
+Instead, make the platform which don't follow standard to an exception
+and fall back to standard implementation for everything else.
+
+This fixes building with musl libc.
+
+Fixes #94
+---
+Upstream-Status: Backport https://github.com/chriskohlhoff/asio/pull/95
+ asio/include/asio/impl/error_code.ipp | 11 ++++-------
+ 1 file changed, 4 insertions(+), 7 deletions(-)
+
+diff --git a/asio/include/asio/impl/error_code.ipp b/asio/include/asio/impl/error_code.ipp
+index b996773..3a1cff1 100644
+--- a/asio/include/asio/impl/error_code.ipp
++++ b/asio/include/asio/impl/error_code.ipp
+@@ -98,17 +98,14 @@ public:
+ #if defined(__sun) || defined(__QNX__) || defined(__SYMBIAN32__)
+     using namespace std;
+     return strerror(value);
+-#elif defined(__MACH__) && defined(__APPLE__) \
+-  || defined(__NetBSD__) || defined(__FreeBSD__) || defined(__OpenBSD__) \
+-  || defined(_AIX) || defined(__hpux) || defined(__osf__) \
+-  || defined(__ANDROID__)
++#elif defined(__GLIBC__) && defined(_GNU_SOURCE)
++    char buf[256] = "";
++    return strerror_r(value, buf, sizeof(buf));
++#else
+     char buf[256] = "";
+     using namespace std;
+     strerror_r(value, buf, sizeof(buf));
+     return buf;
+-#else
+-    char buf[256] = "";
+-    return strerror_r(value, buf, sizeof(buf));
+ #endif
+ #endif // defined(ASIO_WINDOWS_DESKTOP) || defined(__CYGWIN__)
+   }
diff --git a/meta-oe/recipes-support/asio/asio_1.10.6.bb b/meta-oe/recipes-support/asio/asio_1.10.6.bb
index db4ae80..2a64f1e 100644
--- a/meta-oe/recipes-support/asio/asio_1.10.6.bb
+++ b/meta-oe/recipes-support/asio/asio_1.10.6.bb
@@ -4,3 +4,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fede5286a78559dd646e355ab0cc8f04"
 
 SRC_URI[md5sum] = "85d014a356a6e004cd30ccd4c9b6a5c2"
 SRC_URI[sha256sum] = "e0d71c40a7b1f6c1334008fb279e7361b32a063e020efd21e40d9d8ff037195e"
+
+SRC_URI += "file://95.patch;pnum=2"
-- 
2.9.3


