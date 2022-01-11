Return-Path: <ubely@ilbers.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D71EC433EF
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 13:42:08 +0000 (UTC)
Received: from shymkent.ilbers.de (shymkent.ilbers.de [85.214.156.166])
 by mx.groups.io with SMTP id smtpd.web10.7069.1641908526706804007
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jan 2022 05:42:07 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: ilbers.de, ip: 85.214.156.166, mailfrom: ubely@ilbers.de)
Received: from baighyz.m.ilbers.de
 (host-80-81-17-52.static.customer.m-online.net [80.81.17.52])
	(authenticated bits=0)
	by shymkent.ilbers.de (8.15.2/8.15.2/Debian-8) with ESMTPSA id 20BDg22u023663
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jan 2022 14:42:03 +0100
From: Uladzimir Bely <ubely@ilbers.de>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH v2] buildstats: support of custom disk usage command
Date: Tue, 11 Jan 2022 14:42:02 +0100
Message-Id: <20220111134202.9622-1-ubely@ilbers.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Jan 2022 13:42:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94745

This helps to make buildstats code usage easier in third-party
projects like Isar (https://github.com/ilbers/isar/). In Isar
rootfs is created using 'sudo' and some subpaths like '/proc'
may be mounted. So, "du -sh" on rootfs produces incorrect result
with  multiple 'Permission denied' warnings.

Customizable disk usage command allows to deal with these issues
(e.g., "-x" option or "sudo" can be added) in such cases.

Signed-off-by: Uladzimir Bely <ubely@ilbers.de>
---
Changes in v2:
- Removed wrong [meta-oe] prefix from previously sent patch

 meta/classes/buildstats.bbclass | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes/buildstats.bbclass b/meta/classes/buildstats.bbclass
index 0de605200a..9f80cbd75c 100644
--- a/meta/classes/buildstats.bbclass
+++ b/meta/classes/buildstats.bbclass
@@ -8,6 +8,8 @@ BUILDSTATS_BASE = "${TMPDIR}/buildstats/"
 #
 ################################################################################
 
+BUILDSTATS_DISK_USAGE_CMD ??= "du -sh"
+
 def get_buildprocess_cputime(pid):
     with open("/proc/%d/stat" % pid, "r") as f:
         fields = f.readline().rstrip().split()
@@ -244,7 +246,8 @@ python run_buildstats () {
                 rootfs = d.getVar('IMAGE_ROOTFS')
                 if os.path.isdir(rootfs):
                     try:
-                        rootfs_size = subprocess.check_output(["du", "-sh", rootfs],
+                        rootfs_size = subprocess.check_output(
+                                d.getVar('BUILDSTATS_DISK_USAGE_CMD').split() + [rootfs],
                                 stderr=subprocess.STDOUT).decode('utf-8')
                         f.write("Uncompressed Rootfs size: %s" % rootfs_size)
                     except subprocess.CalledProcessError as err:
-- 
2.20.1


