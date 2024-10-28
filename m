Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4B38D13595
	for <webhook@archiver.kernel.org>; Mon, 28 Oct 2024 08:47:49 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.47128.1730105265497282709
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Oct 2024 01:47:45 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0031b41c77=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49S4PMOj009575
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 08:47:44 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42gqd8j0tj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 08:47:44 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 28 Oct 2024 01:47:43 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.43) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Mon, 28 Oct 2024 01:47:42 -0700
From: <jiaying.song.cn@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <changqing.li@windriver.com>
Subject: [Kirkstone] [PATCH] open-vm-tools: Security fixes CVE-2023-34059
Date: Mon, 28 Oct 2024 16:47:41 +0800
Message-ID: <20241028084741.3665775-1-jiaying.song.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: XfKzxOwvnGPd2hTf3Px_3IaiSrZk65va
X-Authority-Analysis: v=2.4 cv=dKj0m/Zb c=1 sm=1 tr=0 ts=671f4fb0 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=DAUX931o1VcA:10 a=t7CeM3EgAAAA:8 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=eh1Yez-EAAAA:8 a=5VHrMV1L8deqUxjJpVwA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: XfKzxOwvnGPd2hTf3Px_3IaiSrZk65va
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-27_08,2024-10-28_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 mlxlogscore=999
 adultscore=0 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 spamscore=0 mlxscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2409260000 definitions=main-2410280071
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 08:47:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113256

From: Yi Zhao <yi.zhao@windriver.com>

CVE-2023-34059:
open-vm-tools contains a file descriptor hijack vulnerability in the
vmware-user-suid-wrapper. A malicious actor with non-root privileges may
be able to hijack the /dev/uinput file descriptor allowing them to
simulate user inputs.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2023-34059

Patch from:
https://github.com/vmware/open-vm-tools/blob/CVE-2023-34059.patch/CVE-2023-34059.patch

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
---
 .../open-vm-tools/CVE-2023-34059.patch        | 188 ++++++++++++++++++
 .../open-vm-tools/open-vm-tools_11.3.5.bb     |   1 +
 2 files changed, 189 insertions(+)
 create mode 100644 meta-networking/recipes-support/open-vm-tools/open-vm-tools/CVE-2023-34059.patch

diff --git a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/CVE-2023-34059.patch b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/CVE-2023-34059.patch
new file mode 100644
index 0000000000..9a806c79a2
--- /dev/null
+++ b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/CVE-2023-34059.patch
@@ -0,0 +1,188 @@
+From 2011181cbe60b256ced8d28daf7b704e8613467c Mon Sep 17 00:00:00 2001
+From: John Wolfe <jwolfe@vmware.com>
+Date: Wed, 18 Oct 2023 09:11:54 -0700
+Subject: [PATCH] Address CVE-2023-34059
+
+Fix file descriptor vulnerability in the open-vm-tools
+   vmware-user-suid-wrapper on Linux.
+ - Moving the privilege drop logic (dropping privilege to the real uid
+   and gid of the process for the vmusr service) from suidWrapper to
+   vmtoolsd code.
+
+CVE: CVE-2023-34059
+
+Upstream-Status: Backport
+[https://github.com/vmware/open-vm-tools/blob/CVE-2023-34059.patch/CVE-2023-34059.patch]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ open-vm-tools/services/vmtoolsd/mainPosix.c   | 76 +++++++++++++++++++++++++++
+ open-vm-tools/vmware-user-suid-wrapper/main.c | 26 ++-------
+ 2 files changed, 79 insertions(+), 23 deletions(-)
+
+diff --git a/open-vm-tools/services/vmtoolsd/mainPosix.c b/open-vm-tools/services/vmtoolsd/mainPosix.c
+index fd2667c..8b46979 100644
+--- a/open-vm-tools/services/vmtoolsd/mainPosix.c
++++ b/open-vm-tools/services/vmtoolsd/mainPosix.c
+@@ -28,10 +28,12 @@
+ #include <signal.h>
+ #include <string.h>
+ #include <unistd.h>
++#include <fcntl.h>
+ #include <glib/gstdio.h>
+ #include "file.h"
+ #include "guestApp.h"
+ #include "hostinfo.h"
++#include "su.h"
+ #include "system.h"
+ #include "unicode.h"
+ #include "util.h"
+@@ -155,6 +157,59 @@ ToolsCoreWorkAroundLoop(ToolsServiceState *state,
+ 
+ 
+ /**
++ * Tools function to set close-on-exec flg for the fd.
++ *
++ * @param[in] fd   open file descriptor.
++ *
++ * @return TRUE on success, FALSE otherwise.
++ */
++
++static gboolean
++ToolsSetCloexecFlag(int fd)
++{
++   int flags;
++
++   if (fd == -1) {
++      /* fd is not present, no need to manipulate */
++      return TRUE;
++   }
++
++   flags = fcntl(fd, F_GETFD, 0);
++   if (flags < 0) {
++      g_printerr("Couldn't get the flags set for fd %d, error %u.", fd, errno);
++      return FALSE;
++   }
++   flags |= FD_CLOEXEC;
++   if (fcntl(fd, F_SETFD, flags) < 0) {
++      g_printerr("Couldn't set close-on-exec for fd %d, error %u.", fd, errno);
++      return FALSE;
++   }
++
++   return TRUE;
++}
++
++
++/**
++ * Tools function to close the fds.
++ */
++
++static void
++ToolsCloseFds(void)
++{
++   if (gState.ctx.blockFD != -1) {
++      close(gState.ctx.blockFD);
++   }
++
++   /*
++    * uinputFD will be available only for wayland.
++    */
++   if (gState.ctx.uinputFD != -1) {
++      close(gState.ctx.uinputFD);
++   }
++}
++
++
++/**
+  * Tools daemon entry function.
+  *
+  * @param[in] argc   Argument count.
+@@ -210,6 +265,27 @@ main(int argc,
+    g_free(argvCopy);
+    argvCopy = NULL;
+ 
++   /*
++    * Drops privilege to the real uid and gid of the process
++    * for the "vmusr" service.
++    */
++   if (TOOLS_IS_USER_SERVICE(&gState)) {
++      uid_t uid = getuid();
++      gid_t gid = getgid();
++
++      if ((Id_SetREUid(uid, uid) != 0) ||
++          (Id_SetREGid(gid, gid) != 0)) {
++         g_printerr("could not drop privileges: %s", strerror(errno));
++         ToolsCloseFds();
++         goto exit;
++      }
++      if (!ToolsSetCloexecFlag(gState.ctx.blockFD) ||
++          !ToolsSetCloexecFlag(gState.ctx.uinputFD)) {
++         ToolsCloseFds();
++         goto exit;
++      }
++   }
++
+    if (gState.pidFile != NULL) {
+       /*
+        * If argv[0] is not an absolute path, make it so; all other path
+diff --git a/open-vm-tools/vmware-user-suid-wrapper/main.c b/open-vm-tools/vmware-user-suid-wrapper/main.c
+index e9d7e50..a19af53 100644
+--- a/open-vm-tools/vmware-user-suid-wrapper/main.c
++++ b/open-vm-tools/vmware-user-suid-wrapper/main.c
+@@ -156,8 +156,7 @@ MaskSignals(void)
+  *
+  *    Obtains the library directory from the Tools locations database, then
+  *    opens a file descriptor (while still root) to add and remove blocks,
+- *    drops privilege to the real uid of this process, and finally starts
+- *    vmware-user.
++ *    and finally starts vmware-user.
+  *
+  * Results:
+  *    Parent: TRUE on success, FALSE on failure.
+@@ -173,8 +172,6 @@ static Bool
+ StartVMwareUser(char *const envp[])
+ {
+    pid_t pid;
+-   uid_t uid;
+-   gid_t gid;
+    int blockFd = -1;
+    char blockFdStr[8];
+    int uinputFd = -1;
+@@ -191,8 +188,8 @@ StartVMwareUser(char *const envp[])
+    }
+ 
+    /*
+-    * Now create a child process, obtain a file descriptor as root, downgrade
+-    * privilege, and run vmware-user.
++    * Now create a child process, obtain a file descriptor as root and
++    * run vmware-user.
+     */
+    pid = fork();
+    if (pid == -1) {
+@@ -229,23 +226,6 @@ StartVMwareUser(char *const envp[])
+       }
+    }
+ 
+-   uid = getuid();
+-   gid = getgid();
+-
+-   if ((setreuid(uid, uid) != 0) ||
+-       (setregid(gid, gid) != 0)) {
+-      Error("could not drop privileges: %s\n", strerror(errno));
+-      if (blockFd != -1) {
+-         close(blockFd);
+-      }
+-      if (useWayland) {
+-         if (uinputFd != -1) {
+-            close(uinputFd);
+-         }
+-      }
+-      return FALSE;
+-   }
+-
+    /*
+     * Since vmware-user provides features that don't depend on vmblock, we
+     * invoke vmware-user even if we couldn't obtain a file descriptor or we
+-- 
+2.6.2
+
diff --git a/meta-networking/recipes-support/open-vm-tools/open-vm-tools_11.3.5.bb b/meta-networking/recipes-support/open-vm-tools/open-vm-tools_11.3.5.bb
index c54fd4de48..762ac4c0e9 100644
--- a/meta-networking/recipes-support/open-vm-tools/open-vm-tools_11.3.5.bb
+++ b/meta-networking/recipes-support/open-vm-tools/open-vm-tools_11.3.5.bb
@@ -48,6 +48,7 @@ SRC_URI = "git://github.com/vmware/open-vm-tools.git;protocol=https;branch=maste
            file://CVE-2023-20867.patch;patchdir=.. \
            file://CVE-2023-20900.patch;patchdir=.. \
            file://CVE-2023-34058.patch;patchdir=.. \
+           file://CVE-2023-34059.patch;patchdir=.. \
            "
 
 UPSTREAM_CHECK_GITTAGREGEX = "stable-(?P<pver>\d+(\.\d+)+)"
-- 
2.34.1


