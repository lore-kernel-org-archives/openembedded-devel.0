Return-Path: <ubely@ilbers.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB0D6C433FE
	for <webhook@archiver.kernel.org>; Sat,  4 Dec 2021 06:33:22 +0000 (UTC)
Received: from shymkent.ilbers.de (shymkent.ilbers.de [85.214.156.166])
 by mx.groups.io with SMTP id smtpd.web09.22123.1638599600805016444
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Dec 2021 22:33:21 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: ilbers.de, ip: 85.214.156.166, mailfrom: ubely@ilbers.de)
Received: from baighyz.m.ilbers.de
 (host-80-81-17-52.static.customer.m-online.net [80.81.17.52])
	(authenticated bits=0)
	by shymkent.ilbers.de (8.15.2/8.15.2/Debian-8) with ESMTPSA id 1B46XGbt023668
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Sat, 4 Dec 2021 07:33:17 +0100
From: Uladzimir Bely <ubely@ilbers.de>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 1/1] buildstats: disk usage outside bbclass
Date: Sat,  4 Dec 2021 07:33:16 +0100
Message-Id: <20211204063316.12502-2-ubely@ilbers.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211204063316.12502-1-ubely@ilbers.de>
References: <20211204063316.12502-1-ubely@ilbers.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Dec 2021 06:33:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94208

This allows to use a custom disk stats command
without modifying buildstats.bbclass.
---
 meta/classes/buildstats-utils.bbclass | 4 ++++
 meta/classes/buildstats.bbclass       | 5 +++--
 2 files changed, 7 insertions(+), 2 deletions(-)
 create mode 100644 meta/classes/buildstats-utils.bbclass

diff --git a/meta/classes/buildstats-utils.bbclass b/meta/classes/buildstats-utils.bbclass
new file mode 100644
index 00000000..712674d0
--- /dev/null
+++ b/meta/classes/buildstats-utils.bbclass
@@ -0,0 +1,4 @@
+def buildstats_disk_usage(path):
+    import subprocess
+    return subprocess.check_output(["du", "-shx", path],
+                   stderr=subprocess.STDOUT).decode('utf-8')
diff --git a/meta/classes/buildstats.bbclass b/meta/classes/buildstats.bbclass
index 0de60520..1cade568 100644
--- a/meta/classes/buildstats.bbclass
+++ b/meta/classes/buildstats.bbclass
@@ -8,6 +8,8 @@ BUILDSTATS_BASE = "${TMPDIR}/buildstats/"
 #
 ################################################################################
 
+inherit buildstats-utils
+
 def get_buildprocess_cputime(pid):
     with open("/proc/%d/stat" % pid, "r") as f:
         fields = f.readline().rstrip().split()
@@ -244,8 +246,7 @@ python run_buildstats () {
                 rootfs = d.getVar('IMAGE_ROOTFS')
                 if os.path.isdir(rootfs):
                     try:
-                        rootfs_size = subprocess.check_output(["du", "-sh", rootfs],
-                                stderr=subprocess.STDOUT).decode('utf-8')
+                        rootfs_size = buildstats_disk_usage(rootfs)
                         f.write("Uncompressed Rootfs size: %s" % rootfs_size)
                     except subprocess.CalledProcessError as err:
                         bb.warn("Failed to get rootfs size: %s" % err.output.decode('utf-8'))
-- 
2.20.1


