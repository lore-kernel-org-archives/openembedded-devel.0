Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f179.google.com (mail-pf0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id A62F378071
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Jun 2017 14:50:41 +0000 (UTC)
Received: by mail-pf0-f179.google.com with SMTP id 9so98611240pfj.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Jun 2017 07:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=XhyrMNR/2GFkk+blP1fLn1QFChYlzVtof9rXv6i6gFc=;
	b=lHNdVgDsxOUg5T7L/gPnJGwmoZpd/yNwO0E7O2JmBNAIkM2PolCpFkQa9fTrdL9zJD
	Q3pSo7NB3gL+jGRk4HPqPpF+Wa4nXwqjUrbA4RZShJD3GhFj+eUWt5xmm23O42mz526D
	l94RE1SwWNg15jF26mixQmQf6OAGYIScQNhSRn3D7/COCGfPq8m9CQNt0OeycBRQN6lD
	Fy7JsHAdIrFoDxdTZn173pbsVEzaiIu5v6y22cde+4G8748Qp8PbG4SJC0MeeTTJZnZy
	sDpHhkQ1US32NQD51ZsaK+Xkdhyt4xqGkDs1M8mw05baUnkrSdEafYg1IuuQxzSg6lyy
	AdJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=XhyrMNR/2GFkk+blP1fLn1QFChYlzVtof9rXv6i6gFc=;
	b=DYC3UtuG0Ev3jHcT4AJ/zcDfKir7ulluk7nfItozhbB0yxeR9MUX7scWAnvn7qqU3v
	1leyB+DeS1cGKQafMN43XFS5fnMdL/J/5y7StedsVhB8CHO/GI2E+LswiIzYSecldbpG
	I2/P/aqybk52yzmDlJbXLw8zmxrEh5WZXVpHX6o7kR8vbN2O6qQAiXvKIcQlsNXB7IX+
	4kzVC3MsRS81mzNYGMxrOkQCC6XCr7ifQWhaMyhZTcLLOUZbHP7QwoAXF6K1gsUNKGw8
	5B+/IRfK9KoWSlQFKWl6t4Qi80aRH64Bf9VWfbz1QXH2TDdh0Wg7+7ynBIhQSpEJmuy4
	9LWQ==
X-Gm-Message-State: AODbwcCkQtTiVmL20FrJpkrCQoqESMrxnUILUneQLqoUnLW2T/OcMSyV
	SiTW4008/qOuHWix
X-Received: by 10.99.94.70 with SMTP id s67mr26655397pgb.82.1496760642197;
	Tue, 06 Jun 2017 07:50:42 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::748])
	by smtp.gmail.com with ESMTPSA id
	p89sm64412683pfk.67.2017.06.06.07.50.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 06 Jun 2017 07:50:41 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  6 Jun 2017 07:50:26 -0700
Message-Id: <20170606145026.4204-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170606145026.4204-1-raj.khem@gmail.com>
References: <20170606145026.4204-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/3] tbb: Update to 2017 Update 6
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
X-List-Received-Date: Tue, 06 Jun 2017 14:50:41 -0000

Fix build with musl and security flags turned on

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/tbb/tbb.bb                 | 19 +++++++----
 ...mallinfo-is-glibc-specific-API-mark-it-so.patch | 37 ++++++++++++++++++++++
 2 files changed, 49 insertions(+), 7 deletions(-)
 create mode 100644 meta-oe/recipes-support/tbb/tbb/0001-mallinfo-is-glibc-specific-API-mark-it-so.patch

diff --git a/meta-oe/recipes-support/tbb/tbb.bb b/meta-oe/recipes-support/tbb/tbb.bb
index d8eb1c2f3..bad9481f7 100644
--- a/meta-oe/recipes-support/tbb/tbb.bb
+++ b/meta-oe/recipes-support/tbb/tbb.bb
@@ -6,18 +6,21 @@ DESCRIPTION = "Parallelism library for C++ - runtime files \
 HOMEPAGE = "http://threadingbuildingblocks.org/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
-PRDATE = "20170118"
-PV = "${PRDATE}"
-SRC_URI = "https://www.threadingbuildingblocks.org/sites/default/files/software_releases/source/tbb2017_${PRDATE}oss_src.tgz \
+PRDATE = "20170412"
+BRANCH = "tbb_2017"
+SRCREV = "a2cfdfe946933cbe38bffe1d8086ae36f06691a3"
+PV = "${PRDATE}+${SRCPV}"
+SRC_URI = "git://github.com/01org/tbb;branch=${BRANCH} \
            file://cross-compile.patch \
-           file://tbb.pc"
-SRC_URI[md5sum] = "26baa6fbcc8f03ee45c0641b91d9588a"
-SRC_URI[sha256sum] = "48bb526287fa8b4e7d1e1b2ba9e5fb9c3e372b497772c06ef9ccd7f93f344e74"
+           file://0001-mallinfo-is-glibc-specific-API-mark-it-so.patch \
+           file://tbb.pc \
+"
 
-S = "${WORKDIR}/tbb2017_${PRDATE}oss/"
+S = "${WORKDIR}/git"
 
 COMPILER ?= "gcc"
 COMPILER_toolchain-clang = "clang"
+
 do_compile() {
     oe_runmake compiler=${COMPILER} arch=${HOST_ARCH} runtime=cc4
 }
@@ -37,3 +40,5 @@ do_install() {
 # ...
 # | make[1]: *** [concurrent_queue.o] Error 1
 ARM_INSTRUCTION_SET = "arm"
+SECURITY_CFLAGS_append = " -fPIC"
+
diff --git a/meta-oe/recipes-support/tbb/tbb/0001-mallinfo-is-glibc-specific-API-mark-it-so.patch b/meta-oe/recipes-support/tbb/tbb/0001-mallinfo-is-glibc-specific-API-mark-it-so.patch
new file mode 100644
index 000000000..7e66945fa
--- /dev/null
+++ b/meta-oe/recipes-support/tbb/tbb/0001-mallinfo-is-glibc-specific-API-mark-it-so.patch
@@ -0,0 +1,37 @@
+From 6b2b136caa68912d77ffe26143cd3da768b9ef80 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 3 Jun 2017 08:39:37 -0700
+Subject: [PATCH] mallinfo() is glibc specific API mark it so
+
+Helps compiling with musl
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ src/tbbmalloc/proxy.cpp | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/tbbmalloc/proxy.cpp b/src/tbbmalloc/proxy.cpp
+index 5ef279d..06c4872 100644
+--- a/src/tbbmalloc/proxy.cpp
++++ b/src/tbbmalloc/proxy.cpp
+@@ -185,6 +185,7 @@ int mallopt(int /*param*/, int /*value*/) __THROW
+     return 1;
+ }
+ 
++#ifdef __GLIBC__
+ struct mallinfo mallinfo() __THROW
+ {
+     struct mallinfo m;
+@@ -192,6 +193,7 @@ struct mallinfo mallinfo() __THROW
+ 
+     return m;
+ }
++#endif
+ 
+ #if __ANDROID__
+ // Android doesn't have malloc_usable_size, provide it to be compatible
+-- 
+2.13.0
+
-- 
2.13.0


