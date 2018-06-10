Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f169.google.com (mail-wr0-f169.google.com
	[209.85.128.169])
	by mail.openembedded.org (Postfix) with ESMTP id D28F37604D
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jun 2018 14:11:37 +0000 (UTC)
Received: by mail-wr0-f169.google.com with SMTP id k16-v6so17718949wro.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jun 2018 07:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=8TU15SqkU8j8wNF89X4NDkSDoS7AezKUuyD236DezTU=;
	b=jiy9HAaAZ6XGlZWCBkVmSy0KYrcqP/UnZa9VGZ3mSTFhjJD4M3AL3OxeR/C6rRrCW6
	ZVDRPH50x8Mag6l4Eylm/+iunrzBRgSmnDbkfDfOLsUWkK+uoYxrH6uBq+mCsm5QuLsI
	joiM39IC/lLUG/FBMGqee6VExsV1iAssAsGZu5KE3MGMt+Wkv2YCR9SKqUgu6e79aOwv
	JuI21Vp1+I9XTO1I1t6H4/EsNOQ/TMcueNlISdVIZxy7Zn9lJN3Wh1btXu1G+q7kyN2q
	iE1ldmC5Ls9qNMJPfTHqHwHg1c+SZ7uZ9xwCvWslv9GqIlcMj7y94lairUQWpzFYhgLw
	I/yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=8TU15SqkU8j8wNF89X4NDkSDoS7AezKUuyD236DezTU=;
	b=rZ9Mr8uwVe3ROqvehkzdFYZqZBq63gq/xdvYPmv68veoPSBMNl6TkGGqWrJhxNIDCr
	sMMf5InCIqKJipUEQYCWFqh88obB9B0kGIHCkcaL9+qfFZUFutK6PAmnWYlvIyuAkBj8
	hBBbFbwpqP9hgUYJSHuHlR3Nm/2J6/Pv34q3jJwc70CKqnMdSW21/L9bnujmirDetwpa
	rAwt8blnKr8yUuWK0iH+jvkRlT/DmNPtQfADhYlrhdDLKaQejL0r3WCUQfRfEcK6gn3A
	IuYi38rFV8zhUuEtjRkfcp3daeTDZXx7xFmv6MZMuszTy55VN1IpNqvAcCgkuIixD0ib
	fcng==
X-Gm-Message-State: APt69E1G/0PxLsxOUAUs7d/1iuMiQdlPh1JfQK0xM86/VMqkVQpPoqGq
	AK1+b7DcYvskEdUSvqUSZdDfhg==
X-Google-Smtp-Source: ADUXVKLEH9Cz7iPhLBm3eQ3khv8AyIM9iZmMpMG18DHQr7LOevhKiUPY9fZGfKOx4OLjVZpEhYqFgw==
X-Received: by 2002:adf:9561:: with SMTP id
	88-v6mr9789090wrs.223.1528639898265; 
	Sun, 10 Jun 2018 07:11:38 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	n21-v6sm4365453wmc.42.2018.06.10.07.11.37
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 10 Jun 2018 07:11:37 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Jun 2018 14:11:34 +0000
Message-Id: <20180610141136.4311-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180610141136.4311-1-Martin.Jansa@gmail.com>
References: <20180610141136.4311-1-Martin.Jansa@gmail.com>
Subject: [PATCH][meta-qt5 2/4] qtwebengine: fix build with gcc8, part II
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
X-List-Received-Date: Sun, 10 Jun 2018 14:11:38 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...m-Force-host-toolchain-configuration.patch |  0
 ...rkaround-for-too-long-.rps-file-name.patch |  0
 .../0003-chromium-Fix-build-with-gcc8.patch}  |  4 +-
 ...04-chromium-Fix-build-with-GCC-8.1.0.patch | 83 +++++++++++++++++++
 ...dbox-Define-TEMP_FAILURE_RETRY-if-n.patch} |  2 +-
 ...id-mallinfo-APIs-on-non-glibc-linux.patch} |  2 +-
 ...ium-musl-include-fcntl.h-for-loff_t.patch} |  2 +-
 ...-off64_t-instead-of-the-internal-__.patch} |  2 +-
 ...sl-linux-glibc-make-the-distinction.patch} |  2 +-
 ...ocator-Do-not-include-glibc_weak_sy.patch} |  2 +-
 ...-correct-member-name-__si_fields-fr.patch} |  2 +-
 ...ine-res_ninit-and-res_nclose-for-no.patch} |  2 +-
 ...m-musl-Do-not-define-__sbrk-on-musl.patch} |  2 +-
 ...l-Adjust-default-pthread-stack-size.patch} |  2 +-
 ...lude-asm-generic-ioctl.h-for-TCGETS.patch} |  2 +-
 ...alloc-Use-off64_t-insread-of-__off6.patch} |  2 +-
 recipes-qt/qt5/qtwebengine_git.bb             | 33 ++++----
 17 files changed, 114 insertions(+), 30 deletions(-)
 rename recipes-qt/qt5/qtwebengine/{ => chromium}/0001-chromium-Force-host-toolchain-configuration.patch (100%)
 rename recipes-qt/qt5/qtwebengine/{ => chromium}/0002-chromium-workaround-for-too-long-.rps-file-name.patch (100%)
 rename recipes-qt/qt5/qtwebengine/{0003-Fix-build-with-gcc8.patch => chromium/0003-chromium-Fix-build-with-gcc8.patch} (95%)
 create mode 100644 recipes-qt/qt5/qtwebengine/chromium/0004-chromium-Fix-build-with-GCC-8.1.0.patch
 rename recipes-qt/qt5/qtwebengine/{0004-chromium-musl-sandbox-Define-TEMP_FAILURE_RETRY-if-n.patch => chromium/0005-chromium-musl-sandbox-Define-TEMP_FAILURE_RETRY-if-n.patch} (93%)
 rename recipes-qt/qt5/qtwebengine/{0005-chromium-musl-Avoid-mallinfo-APIs-on-non-glibc-linux.patch => chromium/0006-chromium-musl-Avoid-mallinfo-APIs-on-non-glibc-linux.patch} (97%)
 rename recipes-qt/qt5/qtwebengine/{0006-chromium-musl-include-fcntl.h-for-loff_t.patch => chromium/0007-chromium-musl-include-fcntl.h-for-loff_t.patch} (92%)
 rename recipes-qt/qt5/qtwebengine/{0007-chromium-musl-use-off64_t-instead-of-the-internal-__.patch => chromium/0008-chromium-musl-use-off64_t-instead-of-the-internal-__.patch} (97%)
 rename recipes-qt/qt5/qtwebengine/{0008-chromium-musl-linux-glibc-make-the-distinction.patch => chromium/0009-chromium-musl-linux-glibc-make-the-distinction.patch} (94%)
 rename recipes-qt/qt5/qtwebengine/{0009-chromium-musl-allocator-Do-not-include-glibc_weak_sy.patch => chromium/0010-chromium-musl-allocator-Do-not-include-glibc_weak_sy.patch} (94%)
 rename recipes-qt/qt5/qtwebengine/{0010-chromium-musl-Use-correct-member-name-__si_fields-fr.patch => chromium/0011-chromium-musl-Use-correct-member-name-__si_fields-fr.patch} (94%)
 rename recipes-qt/qt5/qtwebengine/{0011-chromium-musl-Define-res_ninit-and-res_nclose-for-no.patch => chromium/0012-chromium-musl-Define-res_ninit-and-res_nclose-for-no.patch} (97%)
 rename recipes-qt/qt5/qtwebengine/{0012-chromium-musl-Do-not-define-__sbrk-on-musl.patch => chromium/0013-chromium-musl-Do-not-define-__sbrk-on-musl.patch} (94%)
 rename recipes-qt/qt5/qtwebengine/{0013-chromium-musl-Adjust-default-pthread-stack-size.patch => chromium/0014-chromium-musl-Adjust-default-pthread-stack-size.patch} (97%)
 rename recipes-qt/qt5/qtwebengine/{0014-chromium-musl-include-asm-generic-ioctl.h-for-TCGETS.patch => chromium/0015-chromium-musl-include-asm-generic-ioctl.h-for-TCGETS.patch} (91%)
 rename recipes-qt/qt5/qtwebengine/{0015-chromium-musl-tcmalloc-Use-off64_t-insread-of-__off6.patch => chromium/0016-chromium-musl-tcmalloc-Use-off64_t-insread-of-__off6.patch} (95%)

diff --git a/recipes-qt/qt5/qtwebengine/0001-chromium-Force-host-toolchain-configuration.patch b/recipes-qt/qt5/qtwebengine/chromium/0001-chromium-Force-host-toolchain-configuration.patch
similarity index 100%
rename from recipes-qt/qt5/qtwebengine/0001-chromium-Force-host-toolchain-configuration.patch
rename to recipes-qt/qt5/qtwebengine/chromium/0001-chromium-Force-host-toolchain-configuration.patch
diff --git a/recipes-qt/qt5/qtwebengine/0002-chromium-workaround-for-too-long-.rps-file-name.patch b/recipes-qt/qt5/qtwebengine/chromium/0002-chromium-workaround-for-too-long-.rps-file-name.patch
similarity index 100%
rename from recipes-qt/qt5/qtwebengine/0002-chromium-workaround-for-too-long-.rps-file-name.patch
rename to recipes-qt/qt5/qtwebengine/chromium/0002-chromium-workaround-for-too-long-.rps-file-name.patch
diff --git a/recipes-qt/qt5/qtwebengine/0003-Fix-build-with-gcc8.patch b/recipes-qt/qt5/qtwebengine/chromium/0003-chromium-Fix-build-with-gcc8.patch
similarity index 95%
rename from recipes-qt/qt5/qtwebengine/0003-Fix-build-with-gcc8.patch
rename to recipes-qt/qt5/qtwebengine/chromium/0003-chromium-Fix-build-with-gcc8.patch
index 10c81e9..f79b0e8 100644
--- a/recipes-qt/qt5/qtwebengine/0003-Fix-build-with-gcc8.patch
+++ b/recipes-qt/qt5/qtwebengine/chromium/0003-chromium-Fix-build-with-gcc8.patch
@@ -1,7 +1,7 @@
-From 334c96ea89c49d559f955182c9a30c62919622ca Mon Sep 17 00:00:00 2001
+From c0047b885faafaab35d6dde4578c3c1a00b80cee Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Tue, 5 Jun 2018 13:58:16 +0000
-Subject: [PATCH] Fix build with gcc8
+Subject: [PATCH] chromium: Fix build with gcc8
 
 ---
  chromium/mojo/public/c/system/buffer.h       | 2 +-
diff --git a/recipes-qt/qt5/qtwebengine/chromium/0004-chromium-Fix-build-with-GCC-8.1.0.patch b/recipes-qt/qt5/qtwebengine/chromium/0004-chromium-Fix-build-with-GCC-8.1.0.patch
new file mode 100644
index 0000000..297700b
--- /dev/null
+++ b/recipes-qt/qt5/qtwebengine/chromium/0004-chromium-Fix-build-with-GCC-8.1.0.patch
@@ -0,0 +1,83 @@
+From e8df2acf2ce52972b2ed2596f2ca6dac8656eded Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?J=C3=BCri=20Valdmann?= <juri.valdmann@qt.io>
+Date: Mon, 14 May 2018 10:15:50 +0200
+Subject: [PATCH] chromium: Fix build with GCC 8.1.0
+
+Task-number: QTBUG-68203
+Change-Id: I780d884d5e20ef04e902d7b449da4aa3f97d8d0b
+Reviewed-by: Allan Sandfeld Jensen <allan.jensen@qt.io>
+
+Upstream-Status: Backport (from newer 65-based revision)
+---
+ .../mojo/public/cpp/bindings/associated_interface_ptr_info.h    | 2 +-
+ .../mojo/public/cpp/bindings/associated_interface_request.h     | 2 +-
+ chromium/mojo/public/cpp/bindings/interface_request.h           | 2 +-
+ .../mojo/public/cpp/bindings/scoped_interface_endpoint_handle.h | 2 ++
+ chromium/mojo/public/cpp/system/handle.h                        | 2 +-
+ 5 files changed, 6 insertions(+), 4 deletions(-)
+
+diff --git a/chromium/mojo/public/cpp/bindings/associated_interface_ptr_info.h b/chromium/mojo/public/cpp/bindings/associated_interface_ptr_info.h
+index 1f79662bd7..184ba6a9e8 100644
+--- a/chromium/mojo/public/cpp/bindings/associated_interface_ptr_info.h
++++ b/chromium/mojo/public/cpp/bindings/associated_interface_ptr_info.h
+@@ -45,7 +45,7 @@ class AssociatedInterfacePtrInfo {
+ 
+   bool is_valid() const { return handle_.is_valid(); }
+ 
+-  explicit operator bool() const { return handle_; }
++  explicit operator bool() const { return !!handle_; }
+ 
+   ScopedInterfaceEndpointHandle PassHandle() {
+     return std::move(handle_);
+diff --git a/chromium/mojo/public/cpp/bindings/associated_interface_request.h b/chromium/mojo/public/cpp/bindings/associated_interface_request.h
+index 12d2f3ce1d..fcdc2b9321 100644
+--- a/chromium/mojo/public/cpp/bindings/associated_interface_request.h
++++ b/chromium/mojo/public/cpp/bindings/associated_interface_request.h
+@@ -50,7 +50,7 @@ class AssociatedInterfaceRequest {
+   // handle.
+   bool is_pending() const { return handle_.is_valid(); }
+ 
+-  explicit operator bool() const { return handle_; }
++  explicit operator bool() const { return !!handle_; }
+ 
+   ScopedInterfaceEndpointHandle PassHandle() { return std::move(handle_); }
+ 
+diff --git a/chromium/mojo/public/cpp/bindings/interface_request.h b/chromium/mojo/public/cpp/bindings/interface_request.h
+index 1007cb0b8c..da1f3244a3 100644
+--- a/chromium/mojo/public/cpp/bindings/interface_request.h
++++ b/chromium/mojo/public/cpp/bindings/interface_request.h
+@@ -54,7 +54,7 @@ class InterfaceRequest {
+   // Indicates whether the request currently contains a valid message pipe.
+   bool is_pending() const { return handle_.is_valid(); }
+ 
+-  explicit operator bool() const { return handle_; }
++  explicit operator bool() const { return !!handle_; }
+ 
+   // Removes the message pipe from the request and returns it.
+   ScopedMessagePipeHandle PassMessagePipe() { return std::move(handle_); }
+diff --git a/chromium/mojo/public/cpp/bindings/scoped_interface_endpoint_handle.h b/chromium/mojo/public/cpp/bindings/scoped_interface_endpoint_handle.h
+index 5d00e5019e..ef8a927ba6 100644
+--- a/chromium/mojo/public/cpp/bindings/scoped_interface_endpoint_handle.h
++++ b/chromium/mojo/public/cpp/bindings/scoped_interface_endpoint_handle.h
+@@ -45,6 +45,8 @@ class MOJO_CPP_BINDINGS_EXPORT ScopedInterfaceEndpointHandle {
+ 
+   bool is_valid() const;
+ 
++  explicit operator bool() const { return is_valid(); }
++
+   // Returns true if the interface hasn't associated with a message pipe.
+   bool pending_association() const;
+ 
+diff --git a/chromium/mojo/public/cpp/system/handle.h b/chromium/mojo/public/cpp/system/handle.h
+index 7c886e8825..c9f9e961db 100644
+--- a/chromium/mojo/public/cpp/system/handle.h
++++ b/chromium/mojo/public/cpp/system/handle.h
+@@ -121,7 +121,7 @@ class ScopedHandleBase {
+ 
+   bool is_valid() const { return handle_.is_valid(); }
+ 
+-  explicit operator bool() const { return handle_; }
++  explicit operator bool() const { return !!handle_; }
+ 
+   bool operator==(const ScopedHandleBase& other) const {
+     return handle_.value() == other.get().value();
diff --git a/recipes-qt/qt5/qtwebengine/0004-chromium-musl-sandbox-Define-TEMP_FAILURE_RETRY-if-n.patch b/recipes-qt/qt5/qtwebengine/chromium/0005-chromium-musl-sandbox-Define-TEMP_FAILURE_RETRY-if-n.patch
similarity index 93%
rename from recipes-qt/qt5/qtwebengine/0004-chromium-musl-sandbox-Define-TEMP_FAILURE_RETRY-if-n.patch
rename to recipes-qt/qt5/qtwebengine/chromium/0005-chromium-musl-sandbox-Define-TEMP_FAILURE_RETRY-if-n.patch
index 678e577..15911d3 100644
--- a/recipes-qt/qt5/qtwebengine/0004-chromium-musl-sandbox-Define-TEMP_FAILURE_RETRY-if-n.patch
+++ b/recipes-qt/qt5/qtwebengine/chromium/0005-chromium-musl-sandbox-Define-TEMP_FAILURE_RETRY-if-n.patch
@@ -1,4 +1,4 @@
-From e6e9d77a7a1c174c09214b89b2e1ac034099ea67 Mon Sep 17 00:00:00 2001
+From c2c6c36c4a04816dd1c6815ed4df14b7f3a00d61 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 14:01:12 -0700
 Subject: [PATCH] chromium: musl: sandbox: Define TEMP_FAILURE_RETRY if not
diff --git a/recipes-qt/qt5/qtwebengine/0005-chromium-musl-Avoid-mallinfo-APIs-on-non-glibc-linux.patch b/recipes-qt/qt5/qtwebengine/chromium/0006-chromium-musl-Avoid-mallinfo-APIs-on-non-glibc-linux.patch
similarity index 97%
rename from recipes-qt/qt5/qtwebengine/0005-chromium-musl-Avoid-mallinfo-APIs-on-non-glibc-linux.patch
rename to recipes-qt/qt5/qtwebengine/chromium/0006-chromium-musl-Avoid-mallinfo-APIs-on-non-glibc-linux.patch
index f9163b4..bd74bba 100644
--- a/recipes-qt/qt5/qtwebengine/0005-chromium-musl-Avoid-mallinfo-APIs-on-non-glibc-linux.patch
+++ b/recipes-qt/qt5/qtwebengine/chromium/0006-chromium-musl-Avoid-mallinfo-APIs-on-non-glibc-linux.patch
@@ -1,4 +1,4 @@
-From 68356e04310ab5a2fb7869bacc899a718d448033 Mon Sep 17 00:00:00 2001
+From 79365295aa98d6e40aff1493febd1725caff0893 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 14:09:06 -0700
 Subject: [PATCH] chromium: musl: Avoid mallinfo() APIs on non-glibc/linux
diff --git a/recipes-qt/qt5/qtwebengine/0006-chromium-musl-include-fcntl.h-for-loff_t.patch b/recipes-qt/qt5/qtwebengine/chromium/0007-chromium-musl-include-fcntl.h-for-loff_t.patch
similarity index 92%
rename from recipes-qt/qt5/qtwebengine/0006-chromium-musl-include-fcntl.h-for-loff_t.patch
rename to recipes-qt/qt5/qtwebengine/chromium/0007-chromium-musl-include-fcntl.h-for-loff_t.patch
index 0e3c761..67dc1b9 100644
--- a/recipes-qt/qt5/qtwebengine/0006-chromium-musl-include-fcntl.h-for-loff_t.patch
+++ b/recipes-qt/qt5/qtwebengine/chromium/0007-chromium-musl-include-fcntl.h-for-loff_t.patch
@@ -1,4 +1,4 @@
-From aca69707d74a9286fecf1017c59c8dea91bd7f14 Mon Sep 17 00:00:00 2001
+From 7eaf0542be69e41d5dbb013a09ebc0f8c413d688 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 14:37:49 -0700
 Subject: [PATCH] chromium: musl: include fcntl.h for loff_t
diff --git a/recipes-qt/qt5/qtwebengine/0007-chromium-musl-use-off64_t-instead-of-the-internal-__.patch b/recipes-qt/qt5/qtwebengine/chromium/0008-chromium-musl-use-off64_t-instead-of-the-internal-__.patch
similarity index 97%
rename from recipes-qt/qt5/qtwebengine/0007-chromium-musl-use-off64_t-instead-of-the-internal-__.patch
rename to recipes-qt/qt5/qtwebengine/chromium/0008-chromium-musl-use-off64_t-instead-of-the-internal-__.patch
index 8404ad6..704469d 100644
--- a/recipes-qt/qt5/qtwebengine/0007-chromium-musl-use-off64_t-instead-of-the-internal-__.patch
+++ b/recipes-qt/qt5/qtwebengine/chromium/0008-chromium-musl-use-off64_t-instead-of-the-internal-__.patch
@@ -1,4 +1,4 @@
-From bcbb7edd4e5acdc775a4cfbceafd9bd5a4bbbae5 Mon Sep 17 00:00:00 2001
+From 3896238d9c177c216ffcac111feb36a622da8cf0 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 14:38:37 -0700
 Subject: [PATCH] chromium: musl: use off64_t instead of the internal __off64_t
diff --git a/recipes-qt/qt5/qtwebengine/0008-chromium-musl-linux-glibc-make-the-distinction.patch b/recipes-qt/qt5/qtwebengine/chromium/0009-chromium-musl-linux-glibc-make-the-distinction.patch
similarity index 94%
rename from recipes-qt/qt5/qtwebengine/0008-chromium-musl-linux-glibc-make-the-distinction.patch
rename to recipes-qt/qt5/qtwebengine/chromium/0009-chromium-musl-linux-glibc-make-the-distinction.patch
index 70e23cc..0ebd556 100644
--- a/recipes-qt/qt5/qtwebengine/0008-chromium-musl-linux-glibc-make-the-distinction.patch
+++ b/recipes-qt/qt5/qtwebengine/chromium/0009-chromium-musl-linux-glibc-make-the-distinction.patch
@@ -1,4 +1,4 @@
-From ce13970c1b2d397377461e2b92be541f6778dd79 Mon Sep 17 00:00:00 2001
+From 7c63f8cbe68a241d5e4c82f96286c125be3035e6 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 14:54:38 -0700
 Subject: [PATCH] chromium: musl: linux != glibc, make the distinction
diff --git a/recipes-qt/qt5/qtwebengine/0009-chromium-musl-allocator-Do-not-include-glibc_weak_sy.patch b/recipes-qt/qt5/qtwebengine/chromium/0010-chromium-musl-allocator-Do-not-include-glibc_weak_sy.patch
similarity index 94%
rename from recipes-qt/qt5/qtwebengine/0009-chromium-musl-allocator-Do-not-include-glibc_weak_sy.patch
rename to recipes-qt/qt5/qtwebengine/chromium/0010-chromium-musl-allocator-Do-not-include-glibc_weak_sy.patch
index b4a6736..85a911b 100644
--- a/recipes-qt/qt5/qtwebengine/0009-chromium-musl-allocator-Do-not-include-glibc_weak_sy.patch
+++ b/recipes-qt/qt5/qtwebengine/chromium/0010-chromium-musl-allocator-Do-not-include-glibc_weak_sy.patch
@@ -1,4 +1,4 @@
-From cc0cf540da630b6646601b20c3b55a828ba337f7 Mon Sep 17 00:00:00 2001
+From 2feb363e9a5e256c68b2f3c0207d9d057a51440f Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 15:09:02 -0700
 Subject: [PATCH] chromium: musl: allocator: Do not include glibc_weak_symbols
diff --git a/recipes-qt/qt5/qtwebengine/0010-chromium-musl-Use-correct-member-name-__si_fields-fr.patch b/recipes-qt/qt5/qtwebengine/chromium/0011-chromium-musl-Use-correct-member-name-__si_fields-fr.patch
similarity index 94%
rename from recipes-qt/qt5/qtwebengine/0010-chromium-musl-Use-correct-member-name-__si_fields-fr.patch
rename to recipes-qt/qt5/qtwebengine/chromium/0011-chromium-musl-Use-correct-member-name-__si_fields-fr.patch
index 52caf6c..d0bcd09 100644
--- a/recipes-qt/qt5/qtwebengine/0010-chromium-musl-Use-correct-member-name-__si_fields-fr.patch
+++ b/recipes-qt/qt5/qtwebengine/chromium/0011-chromium-musl-Use-correct-member-name-__si_fields-fr.patch
@@ -1,4 +1,4 @@
-From 3c5e5f6dc8f5853838dec1ef198caa06a651d5e0 Mon Sep 17 00:00:00 2001
+From d1ca892f6547403bcb11449565796aaa5a29b2ee Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 15:12:39 -0700
 Subject: [PATCH] chromium: musl: Use correct member name __si_fields from
diff --git a/recipes-qt/qt5/qtwebengine/0011-chromium-musl-Define-res_ninit-and-res_nclose-for-no.patch b/recipes-qt/qt5/qtwebengine/chromium/0012-chromium-musl-Define-res_ninit-and-res_nclose-for-no.patch
similarity index 97%
rename from recipes-qt/qt5/qtwebengine/0011-chromium-musl-Define-res_ninit-and-res_nclose-for-no.patch
rename to recipes-qt/qt5/qtwebengine/chromium/0012-chromium-musl-Define-res_ninit-and-res_nclose-for-no.patch
index de69087..9ff95ae 100644
--- a/recipes-qt/qt5/qtwebengine/0011-chromium-musl-Define-res_ninit-and-res_nclose-for-no.patch
+++ b/recipes-qt/qt5/qtwebengine/chromium/0012-chromium-musl-Define-res_ninit-and-res_nclose-for-no.patch
@@ -1,4 +1,4 @@
-From c2a5b9616eff83826852b5b9d0a32ddd93764c6a Mon Sep 17 00:00:00 2001
+From b27f5caada6437f0dcec1c616c290fdf9e95d1f8 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 15:27:50 -0700
 Subject: [PATCH] chromium: musl: Define res_ninit and res_nclose for non-glibc
diff --git a/recipes-qt/qt5/qtwebengine/0012-chromium-musl-Do-not-define-__sbrk-on-musl.patch b/recipes-qt/qt5/qtwebengine/chromium/0013-chromium-musl-Do-not-define-__sbrk-on-musl.patch
similarity index 94%
rename from recipes-qt/qt5/qtwebengine/0012-chromium-musl-Do-not-define-__sbrk-on-musl.patch
rename to recipes-qt/qt5/qtwebengine/chromium/0013-chromium-musl-Do-not-define-__sbrk-on-musl.patch
index ab45271..4b5d064 100644
--- a/recipes-qt/qt5/qtwebengine/0012-chromium-musl-Do-not-define-__sbrk-on-musl.patch
+++ b/recipes-qt/qt5/qtwebengine/chromium/0013-chromium-musl-Do-not-define-__sbrk-on-musl.patch
@@ -1,4 +1,4 @@
-From 0f06eb79e93f756719049223b790e3feb3844642 Mon Sep 17 00:00:00 2001
+From 81439c06b19c58a34a5fd3fc2a391561b4120b5e Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 15:39:57 -0700
 Subject: [PATCH] chromium: musl: Do not define __sbrk on musl
diff --git a/recipes-qt/qt5/qtwebengine/0013-chromium-musl-Adjust-default-pthread-stack-size.patch b/recipes-qt/qt5/qtwebengine/chromium/0014-chromium-musl-Adjust-default-pthread-stack-size.patch
similarity index 97%
rename from recipes-qt/qt5/qtwebengine/0013-chromium-musl-Adjust-default-pthread-stack-size.patch
rename to recipes-qt/qt5/qtwebengine/chromium/0014-chromium-musl-Adjust-default-pthread-stack-size.patch
index 5144fbb..0576117 100644
--- a/recipes-qt/qt5/qtwebengine/0013-chromium-musl-Adjust-default-pthread-stack-size.patch
+++ b/recipes-qt/qt5/qtwebengine/chromium/0014-chromium-musl-Adjust-default-pthread-stack-size.patch
@@ -1,4 +1,4 @@
-From 544a41a83d4a17a998e72296429b442fd103f4f3 Mon Sep 17 00:00:00 2001
+From f3a917e4f78f49742e53c2a9d5a4b289159546d0 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 16:41:23 -0700
 Subject: [PATCH] chromium: musl: Adjust default pthread stack size
diff --git a/recipes-qt/qt5/qtwebengine/0014-chromium-musl-include-asm-generic-ioctl.h-for-TCGETS.patch b/recipes-qt/qt5/qtwebengine/chromium/0015-chromium-musl-include-asm-generic-ioctl.h-for-TCGETS.patch
similarity index 91%
rename from recipes-qt/qt5/qtwebengine/0014-chromium-musl-include-asm-generic-ioctl.h-for-TCGETS.patch
rename to recipes-qt/qt5/qtwebengine/chromium/0015-chromium-musl-include-asm-generic-ioctl.h-for-TCGETS.patch
index 7c63e19..67dbab6 100644
--- a/recipes-qt/qt5/qtwebengine/0014-chromium-musl-include-asm-generic-ioctl.h-for-TCGETS.patch
+++ b/recipes-qt/qt5/qtwebengine/chromium/0015-chromium-musl-include-asm-generic-ioctl.h-for-TCGETS.patch
@@ -1,4 +1,4 @@
-From 85d7a5e3cd7db85b5a9305f35ba4c1a76c96a696 Mon Sep 17 00:00:00 2001
+From 5924e39e96f891c1fa7239d91507b2a48d5c47b2 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 17:15:34 -0700
 Subject: [PATCH] chromium: musl: include asm-generic/ioctl.h for TCGETS2
diff --git a/recipes-qt/qt5/qtwebengine/0015-chromium-musl-tcmalloc-Use-off64_t-insread-of-__off6.patch b/recipes-qt/qt5/qtwebengine/chromium/0016-chromium-musl-tcmalloc-Use-off64_t-insread-of-__off6.patch
similarity index 95%
rename from recipes-qt/qt5/qtwebengine/0015-chromium-musl-tcmalloc-Use-off64_t-insread-of-__off6.patch
rename to recipes-qt/qt5/qtwebengine/chromium/0016-chromium-musl-tcmalloc-Use-off64_t-insread-of-__off6.patch
index b967f1d..c006e6f 100644
--- a/recipes-qt/qt5/qtwebengine/0015-chromium-musl-tcmalloc-Use-off64_t-insread-of-__off6.patch
+++ b/recipes-qt/qt5/qtwebengine/chromium/0016-chromium-musl-tcmalloc-Use-off64_t-insread-of-__off6.patch
@@ -1,4 +1,4 @@
-From 0a0d0244d8282c93dbe32f35ba390f239ff6e137 Mon Sep 17 00:00:00 2001
+From af1843ce7883c1ff6f686089540eac5ee9541c3b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 8 Jul 2017 09:08:23 -0700
 Subject: [PATCH] chromium: musl: tcmalloc: Use off64_t insread of __off64_t
diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/qtwebengine_git.bb
index 3cd549a..24c8a77 100644
--- a/recipes-qt/qt5/qtwebengine_git.bb
+++ b/recipes-qt/qt5/qtwebengine_git.bb
@@ -137,26 +137,27 @@ SRC_URI_append_libc-musl = "\
 "
 
 # Patches from https://github.com/meta-qt5/qtwebengine-chromium/commits/65-based
-# 65-based.meta-qt5.4
+# 65-based.meta-qt5.5
 SRC_URI += " \
-    file://0001-chromium-Force-host-toolchain-configuration.patch;patchdir=src/3rdparty \
-    file://0002-chromium-workaround-for-too-long-.rps-file-name.patch;patchdir=src/3rdparty \
-    file://0003-Fix-build-with-gcc8.patch;patchdir=src/3rdparty \
+    file://chromium/0001-chromium-Force-host-toolchain-configuration.patch;patchdir=src/3rdparty \
+    file://chromium/0002-chromium-workaround-for-too-long-.rps-file-name.patch;patchdir=src/3rdparty \
+    file://chromium/0003-chromium-Fix-build-with-gcc8.patch;patchdir=src/3rdparty \
+    file://chromium/0004-chromium-Fix-build-with-GCC-8.1.0.patch;patchdir=src/3rdparty \
 "
 
 SRC_URI_append_libc-musl = "\
-    file://0004-chromium-musl-sandbox-Define-TEMP_FAILURE_RETRY-if-n.patch;patchdir=src/3rdparty \
-    file://0005-chromium-musl-Avoid-mallinfo-APIs-on-non-glibc-linux.patch;patchdir=src/3rdparty \
-    file://0006-chromium-musl-include-fcntl.h-for-loff_t.patch;patchdir=src/3rdparty \
-    file://0007-chromium-musl-use-off64_t-instead-of-the-internal-__.patch;patchdir=src/3rdparty \
-    file://0008-chromium-musl-linux-glibc-make-the-distinction.patch;patchdir=src/3rdparty \
-    file://0009-chromium-musl-allocator-Do-not-include-glibc_weak_sy.patch;patchdir=src/3rdparty \
-    file://0010-chromium-musl-Use-correct-member-name-__si_fields-fr.patch;patchdir=src/3rdparty \
-    file://0011-chromium-musl-Define-res_ninit-and-res_nclose-for-no.patch;patchdir=src/3rdparty \
-    file://0012-chromium-musl-Do-not-define-__sbrk-on-musl.patch;patchdir=src/3rdparty \
-    file://0013-chromium-musl-Adjust-default-pthread-stack-size.patch;patchdir=src/3rdparty \
-    file://0014-chromium-musl-include-asm-generic-ioctl.h-for-TCGETS.patch;patchdir=src/3rdparty \
-    file://0015-chromium-musl-tcmalloc-Use-off64_t-insread-of-__off6.patch;patchdir=src/3rdparty \
+    file://chromium/0005-chromium-musl-sandbox-Define-TEMP_FAILURE_RETRY-if-n.patch;patchdir=src/3rdparty \
+    file://chromium/0006-chromium-musl-Avoid-mallinfo-APIs-on-non-glibc-linux.patch;patchdir=src/3rdparty \
+    file://chromium/0007-chromium-musl-include-fcntl.h-for-loff_t.patch;patchdir=src/3rdparty \
+    file://chromium/0008-chromium-musl-use-off64_t-instead-of-the-internal-__.patch;patchdir=src/3rdparty \
+    file://chromium/0009-chromium-musl-linux-glibc-make-the-distinction.patch;patchdir=src/3rdparty \
+    file://chromium/0010-chromium-musl-allocator-Do-not-include-glibc_weak_sy.patch;patchdir=src/3rdparty \
+    file://chromium/0011-chromium-musl-Use-correct-member-name-__si_fields-fr.patch;patchdir=src/3rdparty \
+    file://chromium/0012-chromium-musl-Define-res_ninit-and-res_nclose-for-no.patch;patchdir=src/3rdparty \
+    file://chromium/0013-chromium-musl-Do-not-define-__sbrk-on-musl.patch;patchdir=src/3rdparty \
+    file://chromium/0014-chromium-musl-Adjust-default-pthread-stack-size.patch;patchdir=src/3rdparty \
+    file://chromium/0015-chromium-musl-include-asm-generic-ioctl.h-for-TCGETS.patch;patchdir=src/3rdparty \
+    file://chromium/0016-chromium-musl-tcmalloc-Use-off64_t-insread-of-__off6.patch;patchdir=src/3rdparty \
 "
 
 SRCREV_qtwebengine = "28e0320235d33f00c6c141a549dc0553ee0043a5"
-- 
2.17.1


