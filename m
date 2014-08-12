Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CFAC562252
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Aug 2014 07:59:19 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s7C7xJ3E029879
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 12 Aug 2014 00:59:19 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Tue, 12 Aug 2014 00:59:18 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 12 Aug 2014 15:59:15 +0800
Message-ID: <9995440381917888dc831f3f960def2718b9a5a1.1407830138.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1407830138.git.hongxu.jia@windriver.com>
References: <cover.1407830138.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] curlpp: fix do_compile failed since gcc upgrade to 4.9
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
X-List-Received-Date: Tue, 12 Aug 2014 07:59:24 -0000
Content-Type: text/plain

The deprecated test code was no longer used, so remove it
to avoid compiling failure with -Werror=unused-function
...
| example21.cpp:51:8: error: 'size_t {anonymous}::readData(char*,
size_t, size_t)' defined but not used [-Werror=unused-function]
|  size_t readData(char *buffer, size_t size, size_t nitems)
...

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../example21.cpp-remove-deprecated-code.patch     | 47 ++++++++++++++++++++++
 .../recipes-support/curlpp/curlpp_0.7.3.bb         |  3 +-
 2 files changed, 48 insertions(+), 2 deletions(-)
 create mode 100644 meta-networking/recipes-support/curlpp/curlpp/example21.cpp-remove-deprecated-code.patch

diff --git a/meta-networking/recipes-support/curlpp/curlpp/example21.cpp-remove-deprecated-code.patch b/meta-networking/recipes-support/curlpp/curlpp/example21.cpp-remove-deprecated-code.patch
new file mode 100644
index 0000000..dae583d
--- /dev/null
+++ b/meta-networking/recipes-support/curlpp/curlpp/example21.cpp-remove-deprecated-code.patch
@@ -0,0 +1,47 @@
+example21.cpp: remove deprecated code
+
+The deprecated code was no longer used, so remove it to avoid
+compiling failure with -Werror=unused-function
+...
+| example21.cpp:51:8: error: 'size_t {anonymous}::readData(char*,
+size_t, size_t)' defined but not used [-Werror=unused-function]
+|  size_t readData(char *buffer, size_t size, size_t nitems)
+...
+
+Upstream-Status: Pending
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ examples/example21.cpp | 17 -----------------
+ 1 file changed, 17 deletions(-)
+
+diff --git a/examples/example21.cpp b/examples/example21.cpp
+--- a/examples/example21.cpp
++++ b/examples/example21.cpp
+@@ -39,23 +39,6 @@
+ #include <curlpp/Options.hpp>
+ #include <curlpp/Exception.hpp>
+  
+-/*
+-   anonymous namespace to prevent name clash in case other examples using the same global entities
+-   would be compiled in the same project
+-*/
+-namespace
+-{
+-
+-char *data = NULL;
+-
+-size_t readData(char *buffer, size_t size, size_t nitems)
+-{
+-  strncpy(buffer, data, size * nitems);
+-  return size * nitems;
+-}
+-
+-} // namespace
+-
+ int main(int argc, char *argv[])
+ {
+   if(argc != 3) {
+-- 
+1.9.1
+
diff --git a/meta-networking/recipes-support/curlpp/curlpp_0.7.3.bb b/meta-networking/recipes-support/curlpp/curlpp_0.7.3.bb
index d24c958..48f5178 100644
--- a/meta-networking/recipes-support/curlpp/curlpp_0.7.3.bb
+++ b/meta-networking/recipes-support/curlpp/curlpp_0.7.3.bb
@@ -4,12 +4,11 @@ SECTION = "console/network"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
-PNBLACKLIST[curlpp] = "BROKEN: since gcc upgrade to 4.9, error: 'size_t {anonymous}::readData(char*, size_t, size_t)' defined but not used [-Werror=unused-function]"
-
 DEPENDS = "curl boost"
 DEPENDS_class-native = "curl-native"
 
 SRC_URI = "http://curlpp.googlecode.com/files/curlpp-${PV}.tar.gz \
+           file://example21.cpp-remove-deprecated-code.patch \
 	"
 
 SRC_URI[md5sum] = "ccc3d30d4b3b5d2cdbed635898c29485"
-- 
1.9.1


