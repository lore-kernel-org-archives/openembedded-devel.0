Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
	[209.85.214.178])
	by mail.openembedded.org (Postfix) with ESMTP id D6DFD79034
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Sep 2018 21:02:31 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id s17-v6so3866361plp.7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Sep 2018 14:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=0qRc9bRKR+UN4ao1n8C3gCb5ThqOkyH9GRJ6WFCslyE=;
	b=nrkONzuaHHGsbvcuh0ia+sAO70z9AWowtZ4HoE6gizW0IjV3bIznRzdg7C5i/nKhtE
	OE29pbRh303TpxgMXZ07fCFBXW0LsTmhXCQloDG1Zz7batOj/xWO0IZnh/zwkRSKRDYd
	i6kaddldHg9i+hR+eXKgtDKDfddxATQu5U4yGbFuMokeWleBWEkDXoKy/thCSc157SML
	CbE3T5iLdKbDs5srLS0pPxf/rRXa/oIAU72WJ+l66Ox1mbjkZhsPI1K+IsWmKi3gms87
	8+zoriuqU+P/yXBvpJIeFrMNrFzsDet9fMQJ5SI+WrtM8OSrmPh2EI76O0ekdP0tfUSG
	SWLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=0qRc9bRKR+UN4ao1n8C3gCb5ThqOkyH9GRJ6WFCslyE=;
	b=BLBXVTDR3bKR50TTYJKK/NLDs9SZCsKAo5xrs4JKZ0PbBCZJCPeA5lb1vxs6MhAacQ
	OmuBmCFpKhE3TpqqEv6m+fEx/sDHjtgfD+H/NBjBhvG6Bur07EM7ZUeCeL8TPraLr+F0
	32GjXz8M3rCHMVUy1ErPsW7Jr0C2C4K3CD1IRhBGs+ui1sTflZQxASS4B4P2HYm9EBHP
	erC648C2Kf4m/YKNKO6KvoDvT7SFiPLSh96uQqezhrZH36k6btAnLzrn3lSPnilVjS8N
	l9dj/Q7nWG+B1JN4HATgYJ6EXg+fvFXizQbIXaTaYudF87V31gHUidTm4cR4G1OUBnqI
	vq2A==
X-Gm-Message-State: APzg51CZM4UKpLkK6aji1F/ZPBXB1fWYhK5fga0Er42O3ZZC/is/xnAl
	YMT1wvJJEwtIcY06JJ5XXslK00Fk
X-Google-Smtp-Source: ANB0Vda4Au4fq3Kj7ZCipgGtWPilEYXk70rPhtiufq3jKxZywxcp/FMK7wCWaN461gPHXLrdS6EhxQ==
X-Received: by 2002:a17:902:7845:: with SMTP id
	e5-v6mr40836412pln.197.1536181352215; 
	Wed, 05 Sep 2018 14:02:32 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::71e7])
	by smtp.gmail.com with ESMTPSA id
	e26-v6sm3689411pfi.70.2018.09.05.14.02.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 05 Sep 2018 14:02:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  5 Sep 2018 14:02:13 -0700
Message-Id: <20180905210224.21225-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH 01/12] asio: Upgrade to 1.12.1
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
X-List-Received-Date: Wed, 05 Sep 2018 21:02:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* Fixes build with openSSL 1.1.x
* Merge .inc into .bb its a single recipe using it

License-Update: Change Copyright years

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ndle-glibc-variant-of-strerror_r-wit.patch | 46 -------------
 ...e-POSIX-poll.h-instead-of-sys-poll.h.patch | 64 -------------------
 meta-oe/recipes-support/asio/asio_1.10.6.bb   | 11 ----
 .../asio/{asio.inc => asio_1.12.1.bb}         |  7 ++
 4 files changed, 7 insertions(+), 121 deletions(-)
 delete mode 100644 meta-oe/recipes-support/asio/asio/0001-Automatically-handle-glibc-variant-of-strerror_r-wit.patch
 delete mode 100644 meta-oe/recipes-support/asio/asio/0001-use-POSIX-poll.h-instead-of-sys-poll.h.patch
 delete mode 100644 meta-oe/recipes-support/asio/asio_1.10.6.bb
 rename meta-oe/recipes-support/asio/{asio.inc => asio_1.12.1.bb} (63%)

diff --git a/meta-oe/recipes-support/asio/asio/0001-Automatically-handle-glibc-variant-of-strerror_r-wit.patch b/meta-oe/recipes-support/asio/asio/0001-Automatically-handle-glibc-variant-of-strerror_r-wit.patch
deleted file mode 100644
index 4244b97a8c..0000000000
--- a/meta-oe/recipes-support/asio/asio/0001-Automatically-handle-glibc-variant-of-strerror_r-wit.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 45c855400842fd40f200ae9b7abf9debf4ab5436 Mon Sep 17 00:00:00 2001
-From: Christopher Kohlhoff <chris@kohlhoff.com>
-Date: Sun, 28 Aug 2016 09:21:53 +1000
-Subject: [PATCH] Automatically handle glibc variant of strerror_r without
- #ifdefs.
-
----
-Upstream-Status: Backport https://github.com/chriskohlhoff/asio/commit/443bc17d13eb5e37de780ea6e23157493cf7b3b9
- include/asio/impl/error_code.ipp | 16 +++++++---------
- 1 file changed, 7 insertions(+), 9 deletions(-)
-
-diff --git a/include/asio/impl/error_code.ipp b/include/asio/impl/error_code.ipp
-index ccb70dd..a117658 100644
---- a/include/asio/impl/error_code.ipp
-+++ b/include/asio/impl/error_code.ipp
-@@ -97,20 +97,18 @@ public:
- #if defined(__sun) || defined(__QNX__) || defined(__SYMBIAN32__)
-     using namespace std;
-     return strerror(value);
--#elif defined(__MACH__) && defined(__APPLE__) \
--  || defined(__NetBSD__) || defined(__FreeBSD__) || defined(__OpenBSD__) \
--  || defined(_AIX) || defined(__hpux) || defined(__osf__) \
--  || defined(__ANDROID__)
--    char buf[256] = "";
--    using namespace std;
--    strerror_r(value, buf, sizeof(buf));
--    return buf;
- #else
-     char buf[256] = "";
--    return strerror_r(value, buf, sizeof(buf));
-+    using namespace std;
-+    return strerror_result(strerror_r(value, buf, sizeof(buf)), buf);
- #endif
- #endif // defined(ASIO_WINDOWS)
-   }
-+
-+private:
-+  // Helper function to adapt the result from glibc's variant of strerror_r.
-+  static const char* strerror_result(int, const char* s) { return s; }
-+  static const char* strerror_result(const char* s, const char*) { return s; }
- };
- 
- } // namespace detail
--- 
-2.9.3
-
diff --git a/meta-oe/recipes-support/asio/asio/0001-use-POSIX-poll.h-instead-of-sys-poll.h.patch b/meta-oe/recipes-support/asio/asio/0001-use-POSIX-poll.h-instead-of-sys-poll.h.patch
deleted file mode 100644
index 7f95f5a25e..0000000000
--- a/meta-oe/recipes-support/asio/asio/0001-use-POSIX-poll.h-instead-of-sys-poll.h.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From dac36a170188917e2f61b0394ba8a2f6509ddf3a Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <adraszik@tycoint.com>
-Date: Tue, 8 Nov 2016 20:39:55 +0000
-Subject: [PATCH] use POSIX poll.h instead of sys/poll.h
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-POSIX specifies that <poll.h> is the correct header to
-include for poll()
-  http://pubs.opengroup.org/onlinepubs/009695399/functions/poll.html
-whereas <sys/poll.h> is only needed for ancient glibc (<2.3),
-so let's follow POSIX instead.
-
-As a side-effect, this silences numerous compilation warnings
-when compiling against the musl C-library:
-
-In file included from ../../../../asio-1.10.6/src/examples/cpp03/../../../include/asio/detail/socket_types.hpp:57:0,
-                 from ../../../../asio-1.10.6/src/examples/cpp03/../../../include/asio/impl/error_code.ipp:29,
-                 from ../../../../asio-1.10.6/src/examples/cpp03/../../../include/asio/error_code.hpp:185,
-                 from ../../../../asio-1.10.6/src/examples/cpp03/../../../include/asio/detail/throw_error.hpp:19,
-                 from ../../../../asio-1.10.6/src/examples/cpp03/../../../include/asio/detail/impl/posix_tss_ptr.ipp:23,
-                 from ../../../../asio-1.10.6/src/examples/cpp03/../../../include/asio/detail/posix_tss_ptr.hpp:74,
-                 from ../../../../asio-1.10.6/src/examples/cpp03/../../../include/asio/detail/tss_ptr.hpp:27,
-                 from ../../../../asio-1.10.6/src/examples/cpp03/../../../include/asio/detail/call_stack.hpp:20,
-                 from ../../../../asio-1.10.6/src/examples/cpp03/../../../include/asio/impl/handler_alloc_hook.ipp:19,
-                 from ../../../../asio-1.10.6/src/examples/cpp03/../../../include/asio/handler_alloc_hook.hpp:78,
-                 from ../../../../asio-1.10.6/src/examples/cpp03/../../../include/asio/detail/handler_alloc_helpers.hpp:21,
-                 from ../../../../asio-1.10.6/src/examples/cpp03/../../../include/asio/detail/bind_handler.hpp:19,
-                 from ../../../../asio-1.10.6/src/examples/cpp03/../../../include/asio/detail/wrapped_handler.hpp:18,
-                 from ../../../../asio-1.10.6/src/examples/cpp03/../../../include/asio/io_service.hpp:24,
-                 from ../../../../asio-1.10.6/src/examples/cpp03/../../../include/asio/basic_io_object.hpp:19,
-                 from ../../../../asio-1.10.6/src/examples/cpp03/../../../include/asio/basic_socket.hpp:20,
-                 from ../../../../asio-1.10.6/src/examples/cpp03/../../../include/asio/basic_datagram_socket.hpp:20,
-                 from ../../../../asio-1.10.6/src/examples/cpp03/../../../include/asio.hpp:19,
-                 from ../../../../asio-1.10.6/src/examples/cpp03/buffers/reference_counted.cpp:11:
-<sysroot>/usr/include/sys/poll.h:1:2: warning: #warning redirecting incorrect #include <sys/poll.h> to <poll.h> [-Wcpp]
- #warning redirecting incorrect #include <sys/poll.h> to <poll.h>
-  ^~~~~~~
-
-etc.
-
-Signed-off-by: André Draszik <adraszik@tycoint.com>
----
-Upstream-Status: Submitted https://svn.boost.org/trac/boost/ticket/12419
- include/asio/detail/socket_types.hpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/include/asio/detail/socket_types.hpp b/include/asio/detail/socket_types.hpp
-index f2600c2..cb61b8e 100644
---- a/include/asio/detail/socket_types.hpp
-+++ b/include/asio/detail/socket_types.hpp
-@@ -54,7 +54,7 @@
- #else
- # include <sys/ioctl.h>
- # if !defined(__SYMBIAN32__)
--#  include <sys/poll.h>
-+#  include <poll.h>
- # endif
- # include <sys/types.h>
- # include <sys/stat.h>
--- 
-2.10.2
-
diff --git a/meta-oe/recipes-support/asio/asio_1.10.6.bb b/meta-oe/recipes-support/asio/asio_1.10.6.bb
deleted file mode 100644
index 5656039846..0000000000
--- a/meta-oe/recipes-support/asio/asio_1.10.6.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require asio.inc
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=fede5286a78559dd646e355ab0cc8f04"
-
-SRC_URI[md5sum] = "85d014a356a6e004cd30ccd4c9b6a5c2"
-SRC_URI[sha256sum] = "e0d71c40a7b1f6c1334008fb279e7361b32a063e020efd21e40d9d8ff037195e"
-
-SRC_URI += "\
-    file://0001-Automatically-handle-glibc-variant-of-strerror_r-wit.patch \
-    file://0001-use-POSIX-poll.h-instead-of-sys-poll.h.patch \
-"
diff --git a/meta-oe/recipes-support/asio/asio.inc b/meta-oe/recipes-support/asio/asio_1.12.1.bb
similarity index 63%
rename from meta-oe/recipes-support/asio/asio.inc
rename to meta-oe/recipes-support/asio/asio_1.12.1.bb
index 54f78e41d1..28cd9c0e19 100644
--- a/meta-oe/recipes-support/asio/asio.inc
+++ b/meta-oe/recipes-support/asio/asio_1.12.1.bb
@@ -13,3 +13,10 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/asio/${BP}.tar.bz2"
 inherit autotools
 
 ALLOW_EMPTY_${PN} = "1"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=3e73f311a3af69e6df275e8c3b1c09b5"
+
+SRC_URI[md5sum] = "037854d113024f57c9753d6326b339bc"
+SRC_URI[sha256sum] = "a9091b4de847539fa5b2259bf76a5355339c7eaaa5e33d7d4ae74d614c21965a"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/asio/${BP}.tar.bz2"
-- 
2.18.0


