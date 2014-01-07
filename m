Return-Path: <anders@chargestorm.se>
Received: from STOEXHUB02.domain01.net (STOEXHUB02.domain01.net
	[83.145.59.143])
	by mail.openembedded.org (Postfix) with ESMTP id A55316BF4E
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Jan 2014 12:39:52 +0000 (UTC)
Received: from localhost (213.114.79.21) by stoexhub02.domain01.net
	(10.12.10.2) with Microsoft SMTP Server id 8.3.279.1; Tue, 7 Jan 2014
	13:39:51 +0100
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 7 Jan 2014 13:39:49 +0100
Message-ID: <9df199bd032977929fa715af7710e4607a19f91e.1389098317.git.anders@chargestorm.se>
X-Mailer: git-send-email 1.8.5.2
In-Reply-To: <cover.1389098317.git.anders@chargestorm.se>
References: <cover.1389098317.git.anders@chargestorm.se>
MIME-Version: 1.0
X-GFI-SMTP-Submission: 1
Cc: Anders Darander <anders@chargestorm.se>
Subject: [meta-oe][PATCH 1/1] ktap: add configs for elfutils and ffi
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
X-List-Received-Date: Tue, 07 Jan 2014 12:39:53 -0000
Content-Type: text/plain

libelf (elfutils) is required for resolving symbols in DSO and for sdt (taken
from ktap docs). The earlier v0.4 recipe built ktap against libelf if it was
found, thus enable it per default.

FFI needs to be enabled for both userspace and kernel module. Currently, it is
only supported for x86_64 (enforced when building ktap-module).

Signed-off-by: Anders Darander <anders@chargestorm.se>
---
 meta-oe/recipes-kernel/ktap/ktap-module_0.4.bb |  5 ++++-
 meta-oe/recipes-kernel/ktap/ktap.inc           |  2 ++
 meta-oe/recipes-kernel/ktap/ktap_0.4.bb        | 12 +++++++++++-
 3 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-kernel/ktap/ktap-module_0.4.bb b/meta-oe/recipes-kernel/ktap/ktap-module_0.4.bb
index 12167ea..ce6885c 100644
--- a/meta-oe/recipes-kernel/ktap/ktap-module_0.4.bb
+++ b/meta-oe/recipes-kernel/ktap/ktap-module_0.4.bb
@@ -6,8 +6,11 @@ DESCRIPTION = "KTAP is a scripting dynamic tracing tool for Linux"
 
 inherit module
 
+# Available package configs: ffi (only supported on x86_64)
+PACKAGECONFIG ?= ""
+
 # Only build the module
-MAKE_TARGETS = "mod"
+MAKE_TARGETS = "${@base_contains('PACKAGECONFIG', 'ffi', 'FFI=1', '', d)} mod"
 
 # Kernel module packages MUST begin with 'kernel-module-', otherwise
 # multilib image generation can fail.
diff --git a/meta-oe/recipes-kernel/ktap/ktap.inc b/meta-oe/recipes-kernel/ktap/ktap.inc
index 7e60453..93a4e2c 100644
--- a/meta-oe/recipes-kernel/ktap/ktap.inc
+++ b/meta-oe/recipes-kernel/ktap/ktap.inc
@@ -9,3 +9,5 @@ SRC_URI = "git://github.com/ktap/ktap.git"
 
 S = "${WORKDIR}/git"
 
+# Package config is abused as a general compile time configuration tool.
+PACKAGECONFIG[ffi] = ""
diff --git a/meta-oe/recipes-kernel/ktap/ktap_0.4.bb b/meta-oe/recipes-kernel/ktap/ktap_0.4.bb
index f5dd62f..a703aec 100644
--- a/meta-oe/recipes-kernel/ktap/ktap_0.4.bb
+++ b/meta-oe/recipes-kernel/ktap/ktap_0.4.bb
@@ -5,8 +5,18 @@ require ktap.inc
 SUMMARY = "KTAP is a scripting dynamic tracing tool for Linux"
 DEPENDS = "ktap-module"
 
+#Available package configs:
+# libelf - needed to resolve symbols in DSO and for sdt
+# ffi    - only supports x86_64 for now!. Needs to be enabled for ktap-module too.
+PACKAGECONFIG ?= "libelf"
+
+PACKAGECONFIG[libelf] = ",,elfutils"
+PACKAGECONFIG[ffi] = ""
+
 # Only build the userspace app
-EXTRA_OEMAKE = "ktap"
+EXTRA_OEMAKE = "${@base_contains('PACKAGECONFIG', 'libelf', '', 'NO_LIBELF=1', d)} \
+             ${@base_contains('PACKAGECONFIG', 'ffi', 'FFI=1', '', d)} \
+             ktap"
 
 do_install() {
     install -d ${D}${bindir}
-- 
1.8.5.2


