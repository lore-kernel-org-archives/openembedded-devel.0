Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 02B5177038
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Sep 2015 17:29:09 +0000 (UTC)
Received: by wiclk2 with SMTP id lk2so24946468wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Sep 2015 10:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=+xPHfAyV2ZAP97OAVPwXq7IjOHzMnC+bCZNqYtA1X3Q=;
	b=C9RHPXny1nT4w8idw9v4q0IyTp0wHzkr+9f49Itnllho7PlfjkMt1DBWT5yUgpfUYl
	t4UtOHo5ZhBTqHoP4X3MtyNrUF45X5btkSSegU9EoqRadtjQBl/MsTiER+c+MmHoFUUY
	rdLK0LnQEqd4kTzJDNAxI2VIb83+E+oDBpdAd6bUkI0Ea5T+MBxImKQAxtLTWhkRllbI
	udpsXRdFOSKKl8BQdEcZWae4MnuYyk3bpTzg8hjNwubAOvfipa4aAbMXhN88JdXTNyA9
	Qhn0RPrTZm7ofE+n5ql48gAqXABJxDX26YwZr2Z1AEvRbfsBLHv+kBEJJHYy8iDnmBmz
	jgvQ==
X-Received: by 10.180.87.71 with SMTP id v7mr9359992wiz.74.1441387749453;
	Fri, 04 Sep 2015 10:29:09 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id v6sm5252111wjf.13.2015.09.04.10.29.08
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 04 Sep 2015 10:29:08 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  4 Sep 2015 19:29:39 +0200
Message-Id: <1441387779-17558-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.5.0
Subject: [meta-qt5][PATCH] qtwebengine: fix build with newer glibc-2.22
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 04 Sep 2015 17:29:13 -0000

* netdb.h staged by glibc-2.22 recipe defines struct addrinfo inside
  __USE_XOPEN2K unlike other versions which are using __USE_POSIX
* fixes:
  | ../../../src/3rdparty/chromium/third_party/boringssl/src/crypto/bio/socket_helper.c: In function 'bio_ip_and_port_to_socket_and_addr':
  | ../../../src/3rdparty/chromium/third_party/boringssl/src/crypto/bio/socket_helper.c:40:19: error: storage size of 'hint' isn't known
  |    struct addrinfo hint, *result, *cur;
  |                    ^
  | ../../../src/3rdparty/chromium/third_party/boringssl/src/crypto/bio/socket_helper.c:58:36: error: dereferencing pointer to incomplete type
  |    for (cur = result; cur; cur = cur->ai_next) {
  |                                     ^

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...ird_party-boringssl-Demand-for-newer-POSI.patch | 37 ++++++++++++++++++++++
 recipes-qt/qt5/qtwebengine_git.bb                  |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 recipes-qt/qt5/qtwebengine/0002-chromium-third_party-boringssl-Demand-for-newer-POSI.patch

diff --git a/recipes-qt/qt5/qtwebengine/0002-chromium-third_party-boringssl-Demand-for-newer-POSI.patch b/recipes-qt/qt5/qtwebengine/0002-chromium-third_party-boringssl-Demand-for-newer-POSI.patch
new file mode 100644
index 0000000..4e09f6e
--- /dev/null
+++ b/recipes-qt/qt5/qtwebengine/0002-chromium-third_party-boringssl-Demand-for-newer-POSI.patch
@@ -0,0 +1,37 @@
+From 75e9a963561a73ef2a449d7915cd8b41285ac862 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 27 Jun 2015 13:29:52 -0700
+Subject: [PATCH] chromium/third_party/boringssl: Demand for newer POSIX macro
+
+Reason for change: Define _POSIX_C_SOURCE such that it demands correct
+posix interfaces, netdb.h declares interfaces such as
+getaddrinfo if __USE_POSIX, i.e. POSIX.1:1990 or later.
+However, these interfaces were new in the 2001 edition of POSIX
+therefore ask for Extension from POSIX.1:2001 since we use addrinfo
+structure here.
+
+Change-Id: Icb1c92745d1a0ca958108ae80c270c630628729e
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Reviewed-on: https://boringssl-review.googlesource.com/5253
+Reviewed-by: Adam Langley <agl@google.com>
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ src/3rdparty/chromium/third_party/boringssl/src/crypto/bio/socket_helper.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/3rdparty/chromium/third_party/boringssl/src/crypto/bio/socket_helper.c b/src/3rdparty/chromium/third_party/boringssl/src/crypto/bio/socket_helper.c
+index ba65a1a..66c3976 100644
+--- a/src/3rdparty/chromium/third_party/boringssl/src/crypto/bio/socket_helper.c
++++ b/src/3rdparty/chromium/third_party/boringssl/src/crypto/bio/socket_helper.c
+@@ -12,7 +12,7 @@
+  * OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN
+  * CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE. */
+ 
+-#define _POSIX_SOURCE
++#define _POSIX_C_SOURCE 200112L
+ 
+ #include <openssl/bio.h>
+ #include <openssl/err.h>
+-- 
+2.5.0
+
diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/qtwebengine_git.bb
index 6685e53..09a49db 100644
--- a/recipes-qt/qt5/qtwebengine_git.bb
+++ b/recipes-qt/qt5/qtwebengine_git.bb
@@ -81,6 +81,7 @@ SRC_URI += " \
     file://0003-functions.prf-allow-build-for-linux-oe-g-platform.patch \
     file://0004-Generate-usable-qmake_extras.gypi.patch \
     file://0001-chromium-base.gypi-include-atomicops_internals_x86_g.patch \
+    file://0002-chromium-third_party-boringssl-Demand-for-newer-POSI.patch \
 "
 SRCREV_qtwebengine = "c6573119006014ff7bc0efb2da16ea35d302a1ec"
 SRCREV_chromium = "41a1a031cd69e187a9608359ffe56652dcaaa6c5"
-- 
2.5.0


