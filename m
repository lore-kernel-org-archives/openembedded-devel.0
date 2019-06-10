Return-Path: <Mingli.Yu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id EFC117E198
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Jun 2019 07:13:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x5A7DBF9019735
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 10 Jun 2019 00:13:11 -0700 (PDT)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.439.0;
	Mon, 10 Jun 2019 00:13:10 -0700
From: <mingli.yu@windriver.com>
To: <raj.khem@gmail.com>, <openembedded-devel@lists.openembedded.org>
Date: Mon, 10 Jun 2019 00:13:10 -0700
Message-ID: <20190610071310.15157-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [meta-networking][PATCH] kea: replace -Og with -O
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
X-List-Received-Date: Mon, 10 Jun 2019 07:13:12 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

With below logic in local.conf:
MACHINE ??= "qemumips64"
MULTILIB_GLOBAL_VARIANTS_append = " libn32"
MULTILIBS ?= "multilib:lib32 multilib:libn32"
DEFAULTTUNE_virtclass-multilib-lib32 ?= "mips"
DEFAULTTUNE_virtclass-multilib-libn32 ?= "mips64-n32"
require conf/multilib.conf
DEBUG_BUILD = "1"
 $ bitbake lib32-kea
[snip]
{standard input}: Assembler messages:
{standard input}:305030: Error: branch out of range
{standard input}:305041: Error: branch out of range
{standard input}:305432: Error: branch out of range
{standard input}:305443: Error: branch out of range
Makefile:707: recipe for target 'dhcp4_parser.lo' failed
make[6]: *** [dhcp4_parser.lo] Error 1
[snip]

When DEBUG_BUILD enabled, -Og pass to compiler,
replace -Og with -O to fix the above compile error.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta-networking/recipes-connectivity/kea/kea_1.5.0.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta-networking/recipes-connectivity/kea/kea_1.5.0.bb b/meta-networking/recipes-connectivity/kea/kea_1.5.0.bb
index 9210ac1bc..fb166df60 100644
--- a/meta-networking/recipes-connectivity/kea/kea_1.5.0.bb
+++ b/meta-networking/recipes-connectivity/kea/kea_1.5.0.bb
@@ -23,6 +23,16 @@ inherit autotools systemd
 SYSTEMD_SERVICE_${PN} = "kea-dhcp4.service kea-dhcp6.service kea-dhcp-ddns.service"
 SYSTEMD_AUTO_ENABLE = "disable"
 
+DEBUG_OPTIMIZATION_remove_mips = " -Og"
+DEBUG_OPTIMIZATION_append_mips = " -O"
+BUILD_OPTIMIZATION_remove_mips = " -Og"
+BUILD_OPTIMIZATION_append_mips = " -O"
+
+DEBUG_OPTIMIZATION_remove_mipsel = " -Og"
+DEBUG_OPTIMIZATION_append_mipsel = " -O"
+BUILD_OPTIMIZATION_remove_mipsel = " -Og"
+BUILD_OPTIMIZATION_append_mipsel = " -O"
+
 do_configure_prepend_class-target() {
     mkdir -p ${B}/src/lib/log/compiler/
     ln -sf ${STAGING_BINDIR_NATIVE}/kea-msg-compiler ${B}/src/lib/log/compiler/kea-msg-compiler
-- 
2.21.0


