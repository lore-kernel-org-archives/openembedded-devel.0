Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id C90906011C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Aug 2016 12:13:17 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id q128so9280945wma.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Aug 2016 05:13:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=o31Fph3sR+DUDtOHW1fw0FSL7F+iCBdGPVet505iJ3U=;
	b=DV1FJncU/L4tmJDVG5ju+qGsQb6Xcm2381eUiq4BeVVsM2+MGp00Oo8/9HeOXYzG35
	6xHyNr7GfWYo1syLuxt5L7rd11OTRwxxfPBIGDYsRGJh4Xmv+2XM0eM0z+FlyShUGov7
	7q4b1HrZUgC5CJH7ULfpOrXrFaPfoBkTAYkkUnqoD94Z4HRB3n/fAq7QocuXaZYRBwuN
	Cdxj9rTzF90+oInH0fId5izDSdTw+Wr4R8KhiCQ/mFbnpFzzci2VoUxDULtL8OVJWztT
	u9Kfr5zH2GmQykLeqOLgR4frLMRSNEwjTO+HQnugg1mIBVFoKt/Jd7+qVdwCwr+b3vZb
	OIYA==
X-Gm-Message-State: AE9vXwPA0HCXudVw9r5SlWuOYlSOyBisyO/Z9kLW8Wy6RZWhL38DnsVTDBSL9ZCiiNgYDg==
X-Received: by 10.194.187.7 with SMTP id fo7mr15474668wjc.162.1472472797377;
	Mon, 29 Aug 2016 05:13:17 -0700 (PDT)
Received: from tfsielt31850.tycofs.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	qe2sm34136907wjc.28.2016.08.29.05.13.16
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 Aug 2016 05:13:16 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 29 Aug 2016 13:13:15 +0100
Message-Id: <20160829121315.29491-1-git@andred.net>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20160826120926.18924-1-git@andred.net>
References: <20160826120926.18924-1-git@andred.net>
MIME-Version: 1.0
Subject: [meta-oe][PATCH v2] asio: fix musl compilation (strerror_r)
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
X-List-Received-Date: Mon, 29 Aug 2016 12:13:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Cherry picked upstream commit

Signed-off-by: André Draszik <git@andred.net>
---
 ...ly-handle-glibc-variant-of-strerror_r-wit.patch | 46 ++++++++++++++++++++++
 meta-oe/recipes-support/asio/asio_1.10.6.bb        |  2 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta-oe/recipes-support/asio/asio/0001-Automatically-handle-glibc-variant-of-strerror_r-wit.patch

diff --git a/meta-oe/recipes-support/asio/asio/0001-Automatically-handle-glibc-variant-of-strerror_r-wit.patch b/meta-oe/recipes-support/asio/asio/0001-Automatically-handle-glibc-variant-of-strerror_r-wit.patch
new file mode 100644
index 0000000..4244b97
--- /dev/null
+++ b/meta-oe/recipes-support/asio/asio/0001-Automatically-handle-glibc-variant-of-strerror_r-wit.patch
@@ -0,0 +1,46 @@
+From 45c855400842fd40f200ae9b7abf9debf4ab5436 Mon Sep 17 00:00:00 2001
+From: Christopher Kohlhoff <chris@kohlhoff.com>
+Date: Sun, 28 Aug 2016 09:21:53 +1000
+Subject: [PATCH] Automatically handle glibc variant of strerror_r without
+ #ifdefs.
+
+---
+Upstream-Status: Backport https://github.com/chriskohlhoff/asio/commit/443bc17d13eb5e37de780ea6e23157493cf7b3b9
+ include/asio/impl/error_code.ipp | 16 +++++++---------
+ 1 file changed, 7 insertions(+), 9 deletions(-)
+
+diff --git a/include/asio/impl/error_code.ipp b/include/asio/impl/error_code.ipp
+index ccb70dd..a117658 100644
+--- a/include/asio/impl/error_code.ipp
++++ b/include/asio/impl/error_code.ipp
+@@ -97,20 +97,18 @@ public:
+ #if defined(__sun) || defined(__QNX__) || defined(__SYMBIAN32__)
+     using namespace std;
+     return strerror(value);
+-#elif defined(__MACH__) && defined(__APPLE__) \
+-  || defined(__NetBSD__) || defined(__FreeBSD__) || defined(__OpenBSD__) \
+-  || defined(_AIX) || defined(__hpux) || defined(__osf__) \
+-  || defined(__ANDROID__)
+-    char buf[256] = "";
+-    using namespace std;
+-    strerror_r(value, buf, sizeof(buf));
+-    return buf;
+ #else
+     char buf[256] = "";
+-    return strerror_r(value, buf, sizeof(buf));
++    using namespace std;
++    return strerror_result(strerror_r(value, buf, sizeof(buf)), buf);
+ #endif
+ #endif // defined(ASIO_WINDOWS)
+   }
++
++private:
++  // Helper function to adapt the result from glibc's variant of strerror_r.
++  static const char* strerror_result(int, const char* s) { return s; }
++  static const char* strerror_result(const char* s, const char*) { return s; }
+ };
+ 
+ } // namespace detail
+-- 
+2.9.3
+
diff --git a/meta-oe/recipes-support/asio/asio_1.10.6.bb b/meta-oe/recipes-support/asio/asio_1.10.6.bb
index db4ae80..d6f4ddd 100644
--- a/meta-oe/recipes-support/asio/asio_1.10.6.bb
+++ b/meta-oe/recipes-support/asio/asio_1.10.6.bb
@@ -4,3 +4,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fede5286a78559dd646e355ab0cc8f04"
 
 SRC_URI[md5sum] = "85d014a356a6e004cd30ccd4c9b6a5c2"
 SRC_URI[sha256sum] = "e0d71c40a7b1f6c1334008fb279e7361b32a063e020efd21e40d9d8ff037195e"
+
+SRC_URI += "file://0001-Automatically-handle-glibc-variant-of-strerror_r-wit.patch"
-- 
2.9.3


