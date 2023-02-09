Return-Path: <joe.slater@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C973C05027
	for <webhook@archiver.kernel.org>; Thu,  9 Feb 2023 00:54:18 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.2827.1675904049396035469
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Feb 2023 16:54:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=VBcm9Gar;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1404e4c6b8=joe.slater@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3190kuiU021472
	for <openembedded-devel@lists.openembedded.org>; Wed, 8 Feb 2023 16:54:09 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=8k18HTbotd2SJfqLj5VCVo/Z16Ua+wFyCcvxavkC3cY=;
 b=VBcm9GarVs/Pf6rdhQBXx+dlHORO8TX4LwUG0HT6hwIyZ5f/6i2bjFzMSzDq58Ibb1MJ
 5mvPyu1RaLvYlLA3Lps6rZBMRkFfdaJCRHBOcLft9tcP6PIgG3AiTFupLZIT0GcbWG6A
 6gbTnq2TFzy6/V9AZK9biunoTxjZ/5TI6meyvfBrwKBNWJpZhpqDYOl7UwNuHR63veT1
 /BW2jp54VAN4X+IWw3WtRrFM23tmaD2vCGsTxQVQeY7/yBfCHsJ5WpZIeg/sal9d2Ie8
 DvX+x2gleAj/3nOXT+j54Ov58I3Ag9vWSdp4UtgW51H6hOv3S7wqW5XGnIM25dWThMXz LA== 
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nhkh9cn9d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 08 Feb 2023 16:54:08 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Wed, 8 Feb 2023 16:54:07 -0800
Received: from ala-jslater-lx2.corp.ad.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.17 via Frontend Transport; Wed, 8 Feb 2023 16:54:07 -0800
From: Joe Slater <joe.slater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <joe.slater@windriver.com>, <randy.macleod@windriver.com>
Subject: [meta-oe][PATCH 1/1] phoronix-test-suite: fix CVE-2022-40704
Date: Wed, 8 Feb 2023 16:54:08 -0800
Message-ID: <20230209005408.3881538-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: Umd5dp4NLXP9HX-GTq5pOl91zDSKG-m2
X-Proofpoint-ORIG-GUID: Umd5dp4NLXP9HX-GTq5pOl91zDSKG-m2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-08_11,2023-02-08_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1011 suspectscore=0
 phishscore=0 bulkscore=0 impostorscore=0 adultscore=0 mlxscore=0
 spamscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2302090007
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Feb 2023 00:54:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101003

CVE fix added after latest release (10.8.4).

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 .../files/CVE-2022-40704.patch                | 46 +++++++++++++++++++
 .../phoronix-test-suite_10.8.4.bb             |  5 +-
 2 files changed, 50 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-benchmark/phoronix-test-suite/files/CVE-2022-40704.patch

diff --git a/meta-oe/recipes-benchmark/phoronix-test-suite/files/CVE-2022-40704.patch b/meta-oe/recipes-benchmark/phoronix-test-suite/files/CVE-2022-40704.patch
new file mode 100644
index 000000000..8b6405b4a
--- /dev/null
+++ b/meta-oe/recipes-benchmark/phoronix-test-suite/files/CVE-2022-40704.patch
@@ -0,0 +1,46 @@
+From d3880d9d3ba795138444da83f1153c3c3ac27640 Mon Sep 17 00:00:00 2001
+From: Michael Larabel <michael@phoronix.com>
+Date: Sat, 23 Jul 2022 07:32:43 -0500
+Subject: [PATCH] phoromatic: Explicitly check both $_GET abd $_POST in
+ phoromatic_quit_if_invalid_input_found()
+
+Fixes: https://github.com/phoronix-test-suite/phoronix-test-suite/issues/650#issuecomment-1193116678
+
+Upstream-Status: Backport
+CVE: CVE-2022-40704
+
+Reference to upstream patch:
+https://github.com/phoronix-test-suite/phoronix-test-suite/commit/d3880d9d3ba795138444da83f1153c3c3ac27640
+
+Signed-off-by: Li Wang <li.wang@windriver.com>
+---
+ pts-core/phoromatic/phoromatic_functions.php | 15 +++++++++++++--
+ 1 file changed, 13 insertions(+), 2 deletions(-)
+
+diff --git a/pts-core/phoromatic/phoromatic_functions.php b/pts-core/phoromatic/phoromatic_functions.php
+index 74ccc5444c..c2313dcdea 100644
+--- a/pts-core/phoromatic/phoromatic_functions.php
++++ b/pts-core/phoromatic/phoromatic_functions.php
+@@ -37,9 +37,20 @@ function phoromatic_quit_if_invalid_input_found($input_keys = null)
+ 	{
+ 		foreach($input_keys as $key)
+ 		{
+-			if(isset($_REQUEST[$key]) && !empty($_REQUEST[$key]))
++			if(isset($_GET[$key]) && !empty($_GET[$key]))
+ 			{
+-				foreach(pts_arrays::to_array($_REQUEST[$key]) as $val_to_check)
++				foreach(pts_arrays::to_array($_GET[$key]) as $val_to_check)
++				{
++					if(stripos($val_to_check, $invalid_string) !== false)
++					{
++						echo '<strong>Exited due to invalid input ( ' . $invalid_string . ') attempted:</strong> ' . htmlspecialchars($val_to_check);
++						exit;
++					}
++				}
++			}
++			if(isset($_POST[$key]) && !empty($_POST[$key]))
++			{
++				foreach(pts_arrays::to_array($_POST[$key]) as $val_to_check)
+ 				{
+ 					if(stripos($val_to_check, $invalid_string) !== false)
+ 					{
diff --git a/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_10.8.4.bb b/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_10.8.4.bb
index be9756d9a..8de3314b3 100644
--- a/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_10.8.4.bb
+++ b/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_10.8.4.bb
@@ -5,7 +5,10 @@ LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 SECTION = "console/tests"
 
-SRC_URI = "http://www.phoronix-test-suite.com/releases/${BP}.tar.gz"
+SRC_URI = "http://www.phoronix-test-suite.com/releases/${BP}.tar.gz \
+           file://CVE-2022-40704.patch \
+          "
+
 SRC_URI[sha256sum] = "1f2092d536c0a3193efc53e4a50f3cee65c0ef1a78d31e5404f1c663fff7b7f4"
 
 S = "${WORKDIR}/phoronix-test-suite"
-- 
2.25.1


