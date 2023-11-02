Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEF0BC4332F
	for <webhook@archiver.kernel.org>; Thu,  2 Nov 2023 06:29:35 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.25039.1698906568969527644
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Nov 2023 23:29:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=MpnS6Onp;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9670a5cd56=kai.kang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3A25wdS9031057
	for <openembedded-devel@lists.openembedded.org>; Wed, 1 Nov 2023 23:29:28 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=wQ5Pl
	Jvae6iA1btKp9CsGLzLxFQFmZ/a1begAcOf5PA=; b=MpnS6OnpRSWsRewuNyV/K
	3xv2PiUbqml8KhVgyt/82rrHLz1nOFLZpJi9eIc3RER16tJsEqjcka2rdijxDP8c
	VDezRk63JfArhQ1yXsTOT2ahJ+XphCatdin6n361uyW0DsAAaI67dZSDNuiWiYBX
	e9OctrbL078e658Ej6g3lEAxUzAHwVc0g+80bifRg/+0MX7QcjkCyisGCGnlyzbC
	rUApZY2vZ2+qB3kjGOtDsPemkvpl5hNR/tHd93nIa7bLIOod6tI/x6qtBdeZ4CdQ
	L5iGLnMSq0gdC+WOEyT5LBTkpqkWc0OK1Pg9YCtXzyDPM2a1daLE0FEOQFwnp/Hw
	w==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3u434ag4ct-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 01 Nov 2023 23:29:28 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 1 Nov 2023 23:29:29 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.34 via Frontend Transport; Wed, 1 Nov 2023 23:29:28 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH 1/2] python3-blivet: 3.4.3 -> 3.8.2
Date: Thu, 2 Nov 2023 14:29:23 +0800
Message-ID: <20231102062924.786081-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: msPXgee9HJREMc6Hck-S-3NByNkRK-Yz
X-Proofpoint-ORIG-GUID: msPXgee9HJREMc6Hck-S-3NByNkRK-Yz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-01_23,2023-11-01_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 spamscore=0 adultscore=0 malwarescore=0 mlxlogscore=809 lowpriorityscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2310240000 definitions=main-2311020049
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Nov 2023 06:29:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105835

From: Kai Kang <kai.kang@windriver.com>

Update python3-blivet 3.4.3 to 3.8.2

* drop 0004-fix-new.roots-object-is-not-iterable.patch which is not
  needed any more
* adjust indent as well

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...fix-new.roots-object-is-not-iterable.patch | 28 -------------------
 ...livet_3.4.3.bb => python3-blivet_3.8.2.bb} |  9 +++---
 2 files changed, 4 insertions(+), 33 deletions(-)
 delete mode 100644 meta-python/recipes-extended/python-blivet/python3-blivet/0004-fix-new.roots-object-is-not-iterable.patch
 rename meta-python/recipes-extended/python-blivet/{python3-blivet_3.4.3.bb => python3-blivet_3.8.2.bb} (79%)

diff --git a/meta-python/recipes-extended/python-blivet/python3-blivet/0004-fix-new.roots-object-is-not-iterable.patch b/meta-python/recipes-extended/python-blivet/python3-blivet/0004-fix-new.roots-object-is-not-iterable.patch
deleted file mode 100644
index 526a3b1fb..000000000
--- a/meta-python/recipes-extended/python-blivet/python3-blivet/0004-fix-new.roots-object-is-not-iterable.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 3bb8d08bdec2f79bb13c0a44b81718d26e5bdabc Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Mon, 8 May 2017 16:30:20 +0800
-Subject: [PATCH 04/11] fix new.roots object is not iterable
-
-Upstream-Status: Pending
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- blivet/blivet.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/blivet/blivet.py b/blivet/blivet.py
-index ea08837..91c92b2 100644
---- a/blivet/blivet.py
-+++ b/blivet/blivet.py
-@@ -1206,7 +1206,7 @@ class Blivet(object):
-             p = partition.disk.format.parted_disk.getPartitionByPath(partition.path)
-             partition.parted_partition = p
- 
--        for root in new.roots:
-+        for root in new.roots or []:
-             root.swaps = [new.devicetree.get_device_by_id(d.id, hidden=True) for d in root.swaps]
-             root.swaps = [s for s in root.swaps if s]
- 
--- 
-2.7.4
-
diff --git a/meta-python/recipes-extended/python-blivet/python3-blivet_3.4.3.bb b/meta-python/recipes-extended/python-blivet/python3-blivet_3.8.2.bb
similarity index 79%
rename from meta-python/recipes-extended/python-blivet/python3-blivet_3.4.3.bb
rename to meta-python/recipes-extended/python-blivet/python3-blivet_3.8.2.bb
index bd57604f2..52b3aa7dc 100644
--- a/meta-python/recipes-extended/python-blivet/python3-blivet_3.4.3.bb
+++ b/meta-python/recipes-extended/python-blivet/python3-blivet_3.8.2.bb
@@ -8,7 +8,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 SRC_URI += "\
            file://0002-run_program-support-timeout.patch \
            file://0003-support-infinit-timeout.patch \
-           file://0004-fix-new.roots-object-is-not-iterable.patch \
            file://0005-fix-incorrect-timeout-while-system-time-changed.patch \
            file://0006-tweak-btrfs-packages.patch \
            file://0007-invoking-mount-with-infinite-timeout.patch \
@@ -17,16 +16,16 @@ SRC_URI += "\
            file://0010-invoking-mkfs-with-infinite-timeout.patch \
            file://0011-invoking-dd-with-infinite-timeout.patch \
 "
-SRC_URI[sha256sum] = "1b05b77f3ee35d82c7a577a168c9ba0204d3e9a87eb1975e5f9af47700eeff48"
+SRC_URI[sha256sum] = "88d1500c76c4660aec7da9e9aa54f7f574546571b52c07a67e1417883c2cb25b"
 
 inherit pypi features_check systemd setuptools3_legacy
 
 REQUIRED_DISTRO_FEATURES = "systemd"
 
 RDEPENDS:${PN} += "python3-pykickstart python3-pyudev \
-                  parted python3-pyparted multipath-tools \
-                  lsof cryptsetup libblockdev \
-                  libbytesize \
+                   parted python3-pyparted multipath-tools \
+                   lsof cryptsetup libblockdev \
+                   libbytesize \
 "
 
 FILES:${PN} += " \
-- 
2.34.1


