Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 6755271A38
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Nov 2016 15:55:15 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id p190so30148608wmp.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Nov 2016 07:55:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=tCOu1/84thsHLgESdDyf2XolLZQfF48GiCJXRqIxHhg=;
	b=MObRo8jyQ29fcj51JC933J7mNcE3UF4nDjLoDJJ+sNGjIn6bBKurGyX8J3TGUXQj09
	oVHtVALmiBv2ofsl0XjLqtYpBppX/dlXOJfG3vlm8/ypApA/uhHKDEPOKhDE9kCH2T2Q
	qn4ZSLcnneKzIXuI3wr8UB5SBoU74IcacHWqEfP1OjjRrviU/LLly0K6pWdPUShwiv0W
	FZ1rS3nrK8f7WPoMDD0FDnG2CR4vyb9e7t9XurvPjBofDmzvrP2IT4jkLLp+KR7kpKnE
	f2OVuK0dGqPEWS9/Mirtw9DkxqbZrRGDyKJKt5HD9puG5yWEEsVR4Tkm2PoZuQBjF13S
	Y9Mw==
X-Gm-Message-State: ABUngvenAoVI8PnpobagUNGSb+Nd0kAsf8fEAUjEtEJ7kkEtiG7h6e/UpqW/vhBGmTGizg==
X-Received: by 10.28.71.14 with SMTP id u14mr1034376wma.52.1478706916156;
	Wed, 09 Nov 2016 07:55:16 -0800 (PST)
Received: from tfsielt31850.tycofs.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id 71sm7686944wmo.7.2016.11.09.07.55.15
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 09 Nov 2016 07:55:15 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 Nov 2016 15:55:12 +0000
Message-Id: <20161109155512.10972-2-git@andred.net>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161109155512.10972-1-git@andred.net>
References: <20161109155512.10972-1-git@andred.net>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/2] asio: fix a musl compilation warning
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
X-List-Received-Date: Wed, 09 Nov 2016 15:55:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <adraszik@tycoint.com>

This is the same patch as applied to boost's copy
of asio in openembedded-core, with slightly
massaged paths

Signed-off-by: André Draszik <adraszik@tycoint.com>
Reviewed-by: Sylvain Lemieux <slemieux@tycoint.com>
---
 ...01-use-POSIX-poll.h-instead-of-sys-poll.h.patch | 64 ++++++++++++++++++++++
 meta-oe/recipes-support/asio/asio_1.10.6.bb        |  5 +-
 2 files changed, 68 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/asio/asio/0001-use-POSIX-poll.h-instead-of-sys-poll.h.patch

diff --git a/meta-oe/recipes-support/asio/asio/0001-use-POSIX-poll.h-instead-of-sys-poll.h.patch b/meta-oe/recipes-support/asio/asio/0001-use-POSIX-poll.h-instead-of-sys-poll.h.patch
new file mode 100644
index 0000000..7f95f5a
--- /dev/null
+++ b/meta-oe/recipes-support/asio/asio/0001-use-POSIX-poll.h-instead-of-sys-poll.h.patch
@@ -0,0 +1,64 @@
+From dac36a170188917e2f61b0394ba8a2f6509ddf3a Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <adraszik@tycoint.com>
+Date: Tue, 8 Nov 2016 20:39:55 +0000
+Subject: [PATCH] use POSIX poll.h instead of sys/poll.h
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+POSIX specifies that <poll.h> is the correct header to
+include for poll()
+  http://pubs.opengroup.org/onlinepubs/009695399/functions/poll.html
+whereas <sys/poll.h> is only needed for ancient glibc (<2.3),
+so let's follow POSIX instead.
+
+As a side-effect, this silences numerous compilation warnings
+when compiling against the musl C-library:
+
+In file included from ../../../../asio-1.10.6/src/examples/cpp03/../../../include/asio/detail/socket_types.hpp:57:0,
+                 from ../../../../asio-1.10.6/src/examples/cpp03/../../../include/asio/impl/error_code.ipp:29,
+                 from ../../../../asio-1.10.6/src/examples/cpp03/../../../include/asio/error_code.hpp:185,
+                 from ../../../../asio-1.10.6/src/examples/cpp03/../../../include/asio/detail/throw_error.hpp:19,
+                 from ../../../../asio-1.10.6/src/examples/cpp03/../../../include/asio/detail/impl/posix_tss_ptr.ipp:23,
+                 from ../../../../asio-1.10.6/src/examples/cpp03/../../../include/asio/detail/posix_tss_ptr.hpp:74,
+                 from ../../../../asio-1.10.6/src/examples/cpp03/../../../include/asio/detail/tss_ptr.hpp:27,
+                 from ../../../../asio-1.10.6/src/examples/cpp03/../../../include/asio/detail/call_stack.hpp:20,
+                 from ../../../../asio-1.10.6/src/examples/cpp03/../../../include/asio/impl/handler_alloc_hook.ipp:19,
+                 from ../../../../asio-1.10.6/src/examples/cpp03/../../../include/asio/handler_alloc_hook.hpp:78,
+                 from ../../../../asio-1.10.6/src/examples/cpp03/../../../include/asio/detail/handler_alloc_helpers.hpp:21,
+                 from ../../../../asio-1.10.6/src/examples/cpp03/../../../include/asio/detail/bind_handler.hpp:19,
+                 from ../../../../asio-1.10.6/src/examples/cpp03/../../../include/asio/detail/wrapped_handler.hpp:18,
+                 from ../../../../asio-1.10.6/src/examples/cpp03/../../../include/asio/io_service.hpp:24,
+                 from ../../../../asio-1.10.6/src/examples/cpp03/../../../include/asio/basic_io_object.hpp:19,
+                 from ../../../../asio-1.10.6/src/examples/cpp03/../../../include/asio/basic_socket.hpp:20,
+                 from ../../../../asio-1.10.6/src/examples/cpp03/../../../include/asio/basic_datagram_socket.hpp:20,
+                 from ../../../../asio-1.10.6/src/examples/cpp03/../../../include/asio.hpp:19,
+                 from ../../../../asio-1.10.6/src/examples/cpp03/buffers/reference_counted.cpp:11:
+<sysroot>/usr/include/sys/poll.h:1:2: warning: #warning redirecting incorrect #include <sys/poll.h> to <poll.h> [-Wcpp]
+ #warning redirecting incorrect #include <sys/poll.h> to <poll.h>
+  ^~~~~~~
+
+etc.
+
+Signed-off-by: André Draszik <adraszik@tycoint.com>
+---
+Upstream-Status: Submitted https://svn.boost.org/trac/boost/ticket/12419
+ include/asio/detail/socket_types.hpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/include/asio/detail/socket_types.hpp b/include/asio/detail/socket_types.hpp
+index f2600c2..cb61b8e 100644
+--- a/include/asio/detail/socket_types.hpp
++++ b/include/asio/detail/socket_types.hpp
+@@ -54,7 +54,7 @@
+ #else
+ # include <sys/ioctl.h>
+ # if !defined(__SYMBIAN32__)
+-#  include <sys/poll.h>
++#  include <poll.h>
+ # endif
+ # include <sys/types.h>
+ # include <sys/stat.h>
+-- 
+2.10.2
+
diff --git a/meta-oe/recipes-support/asio/asio_1.10.6.bb b/meta-oe/recipes-support/asio/asio_1.10.6.bb
index d6f4ddd..5656039 100644
--- a/meta-oe/recipes-support/asio/asio_1.10.6.bb
+++ b/meta-oe/recipes-support/asio/asio_1.10.6.bb
@@ -5,4 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fede5286a78559dd646e355ab0cc8f04"
 SRC_URI[md5sum] = "85d014a356a6e004cd30ccd4c9b6a5c2"
 SRC_URI[sha256sum] = "e0d71c40a7b1f6c1334008fb279e7361b32a063e020efd21e40d9d8ff037195e"
 
-SRC_URI += "file://0001-Automatically-handle-glibc-variant-of-strerror_r-wit.patch"
+SRC_URI += "\
+    file://0001-Automatically-handle-glibc-variant-of-strerror_r-wit.patch \
+    file://0001-use-POSIX-poll.h-instead-of-sys-poll.h.patch \
+"
-- 
2.10.2


