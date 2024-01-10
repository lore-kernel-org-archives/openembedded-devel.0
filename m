Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C1FBC3DA6E
	for <webhook@archiver.kernel.org>; Wed, 10 Jan 2024 06:42:46 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.6691.1704868960910038083
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jan 2024 22:42:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Iw+ebAoZ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1739cb50e7=mingli.yu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40A6fVPV030222
	for <openembedded-devel@lists.openembedded.org>; Wed, 10 Jan 2024 06:42:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=gPOPV
	2uau6MJ5XhGlgxavBXYS8ZazDkMohTU5Ts6fJo=; b=Iw+ebAoZXper9mqoqgY/5
	OlgLBQdnriD6FVlPhZR95SK5JLn7OgWFhKfozxNnl83iStof5t00dhkh2ZVgp2iE
	MTpq5pIUsO1LzhOEchxmgS2zFYDzTgKxbNzdbrlIlX+VZMlEQfa1Mn3r6jrMTKpc
	wU7zbOowSNUJ40Zy/7MmE6cdOL3bvfRcNhPmvn8xsNnOExbh1H6+9F3YMnKdxsp8
	gwvMlOA49HmFJAzrHfYHilIuBVBnBe+RWoTf1gmBHZfmYawHMZnhnazDDcVug5wp
	A1B5hj88AKQBo6rkRJXRCB20Jo+b3ZzMmukC2LONqWyMMpLBvF+rRMkn/6LlnSY4
	g==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vewekc7x2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 10 Jan 2024 06:42:39 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 9 Jan 2024 22:43:10 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Tue, 9 Jan 2024 22:43:09 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] ipmitool: Make the version consistent
Date: Wed, 10 Jan 2024 14:42:37 +0800
Message-ID: <20240110064237.2966625-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: kfdXHFxch-0z_0EZkBiunLznde7W_5xr
X-Proofpoint-ORIG-GUID: kfdXHFxch-0z_0EZkBiunLznde7W_5xr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=10 adultscore=0 bulkscore=0
 phishscore=0 spamscore=10 clxscore=1011 mlxscore=10 suspectscore=0
 mlxlogscore=98 lowpriorityscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401100053
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Jan 2024 06:42:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108207

From: Mingli Yu <mingli.yu@windriver.com>

The git revison info is added [1] to make the version more descriptive
to produce an incremental revision number like 1.8.18.13 or 1.8.18.14
and etc and more clear in terms of "what codebase was used" like
`1.8.18.13.gee01aa5`. But it also introduces the version inconsistence.

Note as stated in [1]
For cases when .git directory is missing (Release compilation?) the suffix
part will be omitted completely yielding a version like `1.8.18`.

Considering the version we acutally used in oe is a release version,
the git revision info as [1] is meaningness. So drop the git revsion
info to make the version consistent.

Before the patch:
root@qemux86-64:~# ipmitool -V
ipmitool version 1.8.19.19.gab5ce5b
root@qemux86-64:~# rpm -qa | grep ipmitool
ipmitool-1.8.19-r0.core2_64

After the patch:
root@qemux86-64:~# ipmitool -V
ipmitool version 1.8.19
root@qemux86-64:~# rpm -qa | grep ipmitool
ipmitool-1.8.19-r0.core2_64

[1] https://github.com/ipmitool/ipmitool/commit/ba01dc84b4e225c86eac3f562e629662d752040f

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...-revision-Drop-the-git-revision-info.patch | 42 +++++++++++++++++++
 .../ipmitool/ipmitool_1.8.19.bb               |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta-oe/recipes-kernel/ipmitool/files/0001-csv-revision-Drop-the-git-revision-info.patch

diff --git a/meta-oe/recipes-kernel/ipmitool/files/0001-csv-revision-Drop-the-git-revision-info.patch b/meta-oe/recipes-kernel/ipmitool/files/0001-csv-revision-Drop-the-git-revision-info.patch
new file mode 100644
index 000000000..98a820bd9
--- /dev/null
+++ b/meta-oe/recipes-kernel/ipmitool/files/0001-csv-revision-Drop-the-git-revision-info.patch
@@ -0,0 +1,42 @@
+From 0a1af74ed3fae9a9a08b8b1ab89e88c02427ae06 Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Wed, 10 Jan 2024 05:57:00 +0000
+Subject: [PATCH] csv-revision: Drop the git revision info
+
+The git revison info is added [1] to make the version more descriptive
+to produce an incremental revision number like 1.8.18.13 or 1.8.18.14
+and etc and more clear in terms of "what codebase was used" like
+`1.8.18.13.gee01aa5`. But it also introduces the below version
+inconsistence.
+ root@qemux86-64:~# ipmitool -V
+ ipmitool version 1.8.19.19.gab5ce5b
+ root@qemux86-64:~# rpm -qa | grep ipmitool
+ ipmitool-1.8.19-r0.core2_64
+
+Considering the version we acutally used in oe is a release version,
+the git revision info as [1] is meaningness. So drop the git revsion
+info to remove the above version inconsitence.
+
+[1] https://github.com/ipmitool/ipmitool/commit/ba01dc84b4e225c86eac3f562e629662d752040f
+
+Upstream-Status: Inappropriate [OE-Specific as we use a release version in oe]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ csv-revision | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/csv-revision b/csv-revision
+index 289c133..3fa9f1c 100755
+--- a/csv-revision
++++ b/csv-revision
+@@ -1,5 +1,6 @@
+ #!/bin/sh
+ 
++exit 0
+ git describe --first-parent --tags 2>/dev/null | (
+ 	IFS=- read tag rev hash
+ 	if [ $? ] && [ -n "$rev" ]; then
+-- 
+2.35.5
+
diff --git a/meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.19.bb b/meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.19.bb
index a8279f575..0f1c8846b 100644
--- a/meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.19.bb
+++ b/meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.19.bb
@@ -24,6 +24,7 @@ DEPENDS = "openssl readline ncurses"
 SRCREV = "ab5ce5baff097ebb6e2a17a171858be213ee68d3"
 SRC_URI = "git://codeberg.org/ipmitool/ipmitool;protocol=https;branch=master \
            ${IANA_ENTERPRISE_NUMBERS} \
+           file://0001-csv-revision-Drop-the-git-revision-info.patch \
            "
 IANA_ENTERPRISE_NUMBERS ?= ""
 
-- 
2.25.1


