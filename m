Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5EC0665D00
	for <Openembedded-devel@lists.openembedded.org>;
	Thu, 10 Apr 2014 08:05:59 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s3A860xU001076
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <Openembedded-devel@lists.openembedded.org>;
	Thu, 10 Apr 2014 01:06:00 -0700 (PDT)
Received: from pek-hostel-vm06.wrs.com (128.224.153.176) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Thu, 10 Apr 2014 01:05:59 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <Openembedded-devel@lists.openembedded.org>
Date: Thu, 10 Apr 2014 16:05:55 +0800
Message-ID: <96245cf5c31529f0f228d81b733db17a2553e36a.1397117000.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1397117000.git.Chong.Lu@windriver.com>
References: <cover.1397117000.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] lvm2: fix mlock() on vectors vma for ARM.
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
X-List-Received-Date: Thu, 10 Apr 2014 08:06:01 -0000
Content-Type: text/plain

Signed-off-by: Xin Ouyang <Xin.Ouyang@windriver.com>
Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 meta-oe/recipes-support/lvm2/lvm2.inc              |  1 +
 .../lvm2/lvm2/mlock-ignore-vectors-gate_vma.patch  | 31 ++++++++++++++++++++++
 2 files changed, 32 insertions(+)
 create mode 100644 meta-oe/recipes-support/lvm2/lvm2/mlock-ignore-vectors-gate_vma.patch

diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
index 4b43328..63d2cdb 100644
--- a/meta-oe/recipes-support/lvm2/lvm2.inc
+++ b/meta-oe/recipes-support/lvm2/lvm2.inc
@@ -10,6 +10,7 @@ INC_PR = "r4"
 S = "${WORKDIR}/LVM2.${PV}"
 SRC_URI = "ftp://sources.redhat.com/pub/lvm2/old/LVM2.${PV}.tgz \
            file://0001-Replace-CPPFunction-with-rl_completion_func_t.patch \
+           file://mlock-ignore-vectors-gate_vma.patch \
            file://lvm.conf"
 
 PACKAGECONFIG ??= "readline"
diff --git a/meta-oe/recipes-support/lvm2/lvm2/mlock-ignore-vectors-gate_vma.patch b/meta-oe/recipes-support/lvm2/lvm2/mlock-ignore-vectors-gate_vma.patch
new file mode 100644
index 0000000..3105136
--- /dev/null
+++ b/meta-oe/recipes-support/lvm2/lvm2/mlock-ignore-vectors-gate_vma.patch
@@ -0,0 +1,31 @@
+Subject: [PATCH] fix: mlock ignore [vectors] gate_vma
+
+Upstream-Status: Pending
+
+linux kernel has a new commit f9d4861f for [vectors] vma on ARM
+"ARM: 7294/1: vectors: use gate_vma for vectors user mapping".
+
+mlock()/munlock() on a gate_vma would cause NOMEM error, so add
+[vectors] to _ignore_maps[], as other gate_vmas [vdso]/[vsyscall]
+did.
+
+Signed-off-by: Xin Ouyang <Xin.Ouyang@windriver.com>
+---
+ lib/mm/memlock.c |    1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/lib/mm/memlock.c b/lib/mm/memlock.c
+index 8c631bf..a6b1955 100644
+--- a/lib/mm/memlock.c
++++ b/lib/mm/memlock.c
+@@ -84,6 +84,7 @@ static int _default_priority;
+ static const char * const _ignore_maps[] = {
+     "[vdso]",
+     "[vsyscall]",
++    "[vectors]",
+ };
+ 
+ /* default blacklist for maps */
+-- 
+1.7.9.5
+
-- 
1.8.1.2


