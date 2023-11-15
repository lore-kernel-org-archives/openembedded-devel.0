Return-Path: <narpat.mali@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 750F4C07548
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 11:56:49 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.11267.1700049404876538105
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Nov 2023 03:56:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Pf3UB18S;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=96838b2aed=narpat.mali@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3AFBlQW7008066;
	Wed, 15 Nov 2023 11:56:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=Y0rvI
	OBcMUoXJ5fRb4SCZLS8+Lr1wwyk2nSmNdlIHiM=; b=Pf3UB18SjOxltnvuMfDFS
	lnBbP1xYqfkuiWZDD4CbgE17ofJ4CK8fLuZie/HCmgekJY2UPDWvI7JJ6dlzRyoQ
	qQskUXNdsdAEDoVXaVNhfvJcj2Y+uko5HYOOS7miQnW5OavSjxZ4p6ueKfX/+NOe
	nlu7uEcMH3gsFlCorW/WdJXkhW4Ib3MiO3AQvMhBcYUVBPP+q+lYO7OYNl+E78s/
	HG1/SfD0QWvgoYWHCY6wshATuug3LGYgQUps+NretUxtiG6rWvTH0P8o07l84Su7
	8xWm2IPuGs3/olnQA/zgrlUUBOYPhlvuM1zzI9gTXZqoyKSOjhd11PhZ/oclBN/n
	w==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3u9xtxbqab-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 15 Nov 2023 11:56:42 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 15 Nov 2023 03:56:44 -0800
From: nmali <narpat.mali@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <akuster808@gmail.com>
Subject: [meta-networking][mickledore][PATCH 1/1] traceroute: upgrade 2.1.2 -> 2.1.3
Date: Wed, 15 Nov 2023 11:56:20 +0000
Message-ID: <20231115115620.3515196-1-narpat.mali@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: PZkreCteqYrhXH2OlrOTQ7gjm5AAD9n7
X-Proofpoint-GUID: PZkreCteqYrhXH2OlrOTQ7gjm5AAD9n7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-15_10,2023-11-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 mlxlogscore=987 bulkscore=0 mlxscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311060001
 definitions=main-2311150092
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Nov 2023 11:56:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106755

From: Narpat Mali <narpat.mali@windriver.com>

This upgrade incorporates the CVE-2023-46316 fix.

Changelog:
----------
- Fix command line parsing in wrappers.

References:
https://security-tracker.debian.org/tracker/CVE-2023-46316
https://sourceforge.net/projects/traceroute/files/traceroute/traceroute-2.1.3/

Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
---
 .../traceroute/{traceroute_2.1.2.bb => traceroute_2.1.3.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/traceroute/{traceroute_2.1.2.bb => traceroute_2.1.3.bb} (94%)

diff --git a/meta-networking/recipes-support/traceroute/traceroute_2.1.2.bb b/meta-networking/recipes-support/traceroute/traceroute_2.1.3.bb
similarity index 94%
rename from meta-networking/recipes-support/traceroute/traceroute_2.1.2.bb
rename to meta-networking/recipes-support/traceroute/traceroute_2.1.3.bb
index 51b581a4c6..ed75ba34de 100644
--- a/meta-networking/recipes-support/traceroute/traceroute_2.1.2.bb
+++ b/meta-networking/recipes-support/traceroute/traceroute_2.1.3.bb
@@ -17,7 +17,7 @@ UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/traceroute/files/tracerou
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/traceroute/traceroute/${BP}/${BP}.tar.gz \
 "
-SRC_URI[sha256sum] = "507c268f2977b4e218ce73e7ebed45ba0d970a8ca4995dd9cbb1ffe8e99b5b1f"
+SRC_URI[sha256sum] = "05ebc7aba28a9100f9bbae54ceecbf75c82ccf46bdfce8b5d64806459a7e0412"
 
 EXTRA_OEMAKE = "VPATH=${STAGING_LIBDIR}"
 LTOEXTRA += "-flto-partition=none"
-- 
2.40.0


