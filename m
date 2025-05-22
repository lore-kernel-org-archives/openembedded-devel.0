Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAA40C54E90
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 10:20:48 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.20816.1747909240520957002
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 May 2025 03:20:40 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=723784239f=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54M4A2qr028618
	for <openembedded-devel@lists.openembedded.org>; Thu, 22 May 2025 10:20:39 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46rwfx2dcn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 22 May 2025 10:20:39 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Thu, 22 May 2025 03:20:21 -0700
Received: from pek-lpg-core5.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Thu, 22 May 2025 03:20:20 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-initramfs][PATCH] fix broken symlink in dracut config examples
Date: Thu, 22 May 2025 18:20:36 +0800
Message-ID: <20250522102036.2075922-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=ObSYDgTY c=1 sm=1 tr=0 ts=682efa77 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=dt9VzEwgFbYA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=P5Pi0_c-0Di90tlZlCkA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDEwNCBTYWx0ZWRfXy8DleJYJU8vR pkx251qKx59YvStyt4rR0Oph0OaKLaO/4TcefCQwUowEOwthao+xy2ATr3XC+rz0t5l0qsJ2QWB RvLyKFmK7IgTE4kkTjd4txLrMR83GrccZ34O/4Mmi7pqhjBPoHfMBBA+8xb6heD0tovLk4fW2yU
 5vlHvjRsKpahTxRS65CwMg1bKmb5VLWjPIKgjeP3ICtz6K/qZ0HnCNYIT3dh6iPTjk8whsJHE5s aLaAdILL0tCqkSBQPfdhGi7A2isfZIbD3ewyY7V6hnfNSQwdqTtZac5+LfDBFQwxzU8MyxHgDLu yv21HfZ5ROKY6p0bIwDyN4TcHU6zAwT+smBRWpRjw08gZMoSeyIPulrgGEhE5xKSSiU3Z/A9acZ
 qxMcG5NMQT8IdL+01sq2ajHSQSrZaTsYXPTDCksLw9044vnW3IfNlnqO/69wWF0bYezVwwQ0
X-Proofpoint-GUID: 63BEnhOLKuyjJqyJtMVOJLXQJ_pj95Tk
X-Proofpoint-ORIG-GUID: 63BEnhOLKuyjJqyJtMVOJLXQJ_pj95Tk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_05,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505160000
 definitions=main-2505220104
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 22 May 2025 10:20:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117582

Due to commit [1], it installs dracut config examples under /usr.
But while enable_test=no, the symlink of test in dracut config is broken
...
root@qemux86-64:~# ls /usr/lib/dracut/dracut.conf.d/test*  -ahl
lrwxrwxrwx 1 root root 27 Apr  5  2011 /usr/lib/dracut/dracut.conf.d/test -> ../test/dracut.conf.d/test/
lrwxrwxrwx 1 root root 36 Apr  5  2011 /usr/lib/dracut/dracut.conf.d/test-makeroot -> ../test/dracut.conf.d/test-makeroot/
lrwxrwxrwx 1 root root 31 Apr  5  2011 /usr/lib/dracut/dracut.conf.d/test-root -> ../test/dracut.conf.d/test-root
root@qemux86-64:~# realpath /usr/lib/dracut/dracut.conf.d/test*
realpath: /usr/lib/dracut/dracut.conf.d/test: No such file or directory
realpath: /usr/lib/dracut/dracut.conf.d/test-makeroot: No such file or directory
realpath: /usr/lib/dracut/dracut.conf.d/test-root: No such file or directory
...

This commit cleans up test symlink if enable_test=no

[1] https://github.com/dracut-ng/dracut-ng/commit/0d369e3e30935dffe48dfff1e90463868e7f804a

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...en-symlink-in-dracut-config-examples.patch | 44 +++++++++++++++++++
 .../recipes-devtools/dracut/dracut_106.bb     |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta-initramfs/recipes-devtools/dracut/dracut/0001-fix-broken-symlink-in-dracut-config-examples.patch

diff --git a/meta-initramfs/recipes-devtools/dracut/dracut/0001-fix-broken-symlink-in-dracut-config-examples.patch b/meta-initramfs/recipes-devtools/dracut/dracut/0001-fix-broken-symlink-in-dracut-config-examples.patch
new file mode 100644
index 0000000000..7d0b65a161
--- /dev/null
+++ b/meta-initramfs/recipes-devtools/dracut/dracut/0001-fix-broken-symlink-in-dracut-config-examples.patch
@@ -0,0 +1,44 @@
+From 8871c593973d9abfef45408575e5da887830f42e Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Thu, 22 May 2025 18:07:27 +0800
+Subject: [PATCH] fix broken symlink in dracut config examples
+
+Due to commit [1], it installs dracut config examples under /usr.
+But while enable_test=no, the symlink of test in dracut config is broken
+...
+root@qemux86-64:~# ls /usr/lib/dracut/dracut.conf.d/test*  -ahl
+lrwxrwxrwx 1 root root 27 Apr  5  2011 /usr/lib/dracut/dracut.conf.d/test -> ../test/dracut.conf.d/test/
+lrwxrwxrwx 1 root root 36 Apr  5  2011 /usr/lib/dracut/dracut.conf.d/test-makeroot -> ../test/dracut.conf.d/test-makeroot/
+lrwxrwxrwx 1 root root 31 Apr  5  2011 /usr/lib/dracut/dracut.conf.d/test-root -> ../test/dracut.conf.d/test-root
+root@qemux86-64:~# realpath /usr/lib/dracut/dracut.conf.d/test*
+realpath: /usr/lib/dracut/dracut.conf.d/test: No such file or directory
+realpath: /usr/lib/dracut/dracut.conf.d/test-makeroot: No such file or directory
+realpath: /usr/lib/dracut/dracut.conf.d/test-root: No such file or directory
+...
+
+This commit cleans up test symlink if enable_test=no
+
+[1] https://github.com/dracut-ng/dracut-ng/commit/0d369e3e30935dffe48dfff1e90463868e7f804a
+
+Upstream-Status: Submitted [https://github.com/dracut-ng/dracut-ng/pull/1344]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ Makefile | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/Makefile b/Makefile
+index d33aebbc..151d9f79 100644
+--- a/Makefile
++++ b/Makefile
+@@ -180,6 +180,7 @@ ifneq ($(enable_test),no)
+ 	cp -arx test $(DESTDIR)$(pkglibdir)
+ else
+ 	rm -rf $(DESTDIR)$(pkglibdir)/modules.d/80test*
++	rm -rf $(DESTDIR)$(pkglibdir)/dracut.conf.d/test*
+ endif
+ ifneq ($(enable_documentation),no)
+ 	for i in $(man1pages); do install -m 0644 $$i $(DESTDIR)$(mandir)/man1/$${i##*/}; done
+-- 
+2.34.1
+
diff --git a/meta-initramfs/recipes-devtools/dracut/dracut_106.bb b/meta-initramfs/recipes-devtools/dracut/dracut_106.bb
index b474514713..b70ee4baeb 100644
--- a/meta-initramfs/recipes-devtools/dracut/dracut_106.bb
+++ b/meta-initramfs/recipes-devtools/dracut/dracut_106.bb
@@ -10,6 +10,7 @@ PE = "1"
 SRCREV = "956c08774074ddc45b2f975e13d5c13d1fc36eff"
 SRC_URI = "git://github.com/dracut-ng/dracut-ng.git;protocol=http;branch=main \
            file://0001-feat-dracut-install-split-ldd-command-arguments-for-.patch \
+           file://0001-fix-broken-symlink-in-dracut-config-examples.patch \
            "
 
 DEPENDS += "kmod"
-- 
2.34.1


