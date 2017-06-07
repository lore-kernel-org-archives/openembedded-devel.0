Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D6D3D77F38
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Jun 2017 01:48:53 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v571msDP012544
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 6 Jun 2017 18:48:54 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Tue, 6 Jun 2017 18:48:53 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 7 Jun 2017 09:48:52 +0800
Message-ID: <20170607014852.17281-1-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] inotify-tools: fix __NR_inotify_add_watch system call number on _MIPS_SIM_ABI64
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
X-List-Received-Date: Wed, 07 Jun 2017 01:48:54 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

The correct value should be the same as defined in
linux/arch/mips/include/uapi/asm/unistd.h

Signed-off-by: Roy Li <rongqing.li@windriver.com>
Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../inotify-nosys-fix-system-call-number.patch     | 31 ++++++++++++++++++++++
 .../inotify-tools/inotify-tools_git.bb             |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta-oe/recipes-support/inotify-tools/inotify-tools/inotify-nosys-fix-system-call-number.patch

diff --git a/meta-oe/recipes-support/inotify-tools/inotify-tools/inotify-nosys-fix-system-call-number.patch b/meta-oe/recipes-support/inotify-tools/inotify-tools/inotify-nosys-fix-system-call-number.patch
new file mode 100644
index 000000000..89b890dda
--- /dev/null
+++ b/meta-oe/recipes-support/inotify-tools/inotify-tools/inotify-nosys-fix-system-call-number.patch
@@ -0,0 +1,31 @@
+inotify-tools: fix __NR_inotify_add_watch system call number on _MIPS_SIM_ABI64
+
+The correct value should be the same as defined in
+linux/arch/mips/include/uapi/asm/unistd.h
+
+Upstream-Status: Summitted [https://github.com/rvoicilas/inotify-tools/pull/71]
+
+Signed-off-by: Roy Li <rongqing.li@windriver.com>
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+---
+ libinotifytools/src/inotifytools/inotify-nosys.h |    4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/libinotifytools/src/inotifytools/inotify-nosys.h b/libinotifytools/src/inotifytools/inotify-nosys.h
+index db76b2c..5f7b11b 100644
+--- a/libinotifytools/src/inotifytools/inotify-nosys.h
++++ b/libinotifytools/src/inotifytools/inotify-nosys.h
+@@ -100,8 +100,8 @@ struct inotify_event {
+ # endif
+ # if _MIPS_SIM == _MIPS_SIM_ABI64
+ #  define __NR_inotify_init (__NR_Linux + 243)
+-#  define __NR_inotify_add_watch (__NR_Linux + 243)
+-#  define __NR_inotify_rm_watch (__NR_Linux + 243)
++#  define __NR_inotify_add_watch (__NR_Linux + 244)
++#  define __NR_inotify_rm_watch (__NR_Linux + 245)
+ # endif
+ # if _MIPS_SIM == _MIPS_SIM_NABI32
+ #  define __NR_inotify_init (__NR_Linux + 247)
+-- 
+1.7.10.4
+
diff --git a/meta-oe/recipes-support/inotify-tools/inotify-tools_git.bb b/meta-oe/recipes-support/inotify-tools/inotify-tools_git.bb
index a8ef55764..efc753d5b 100644
--- a/meta-oe/recipes-support/inotify-tools/inotify-tools_git.bb
+++ b/meta-oe/recipes-support/inotify-tools/inotify-tools_git.bb
@@ -10,6 +10,7 @@ PV = "3.14+git${SRCPV}"
 
 SRC_URI = "git://github.com/rvoicilas/${BPN} \
            file://inotifywait-fix-compile-error-with-GCC-6.patch \
+           file://inotify-nosys-fix-system-call-number.patch \
           "
 
 S = "${WORKDIR}/git"
-- 
2.11.0


