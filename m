Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C1D0C4332F
	for <webhook@archiver.kernel.org>; Tue, 27 Dec 2022 15:42:28 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.160463.1672155740867744839
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Dec 2022 07:42:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=fl5OIlQe;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=936063681c=kai.kang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BRFaEfG000422;
	Tue, 27 Dec 2022 07:42:20 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=PPS06212021;
 bh=9MzQal6pda3Mem8taGJKtssZQFABKsyUluAn6ibOXVI=;
 b=fl5OIlQe5h9eGC3GSSp73cZd2PNQDPEWY258o7cOBChzV8pMd2x7YceykwarqqSHP5hB
 ZIsvGWUG8SZv5hjqugfk9my0YxOmEorkUnf+wQnYLLzFB88rfprrn2SK4IHXw/q549PN
 fQjTCvqXKkaYTlmkw777zeMQCzbEM3kQ3c9WRHOCyvwyu1++Nzv2HIe7FZoNiCDJ7zcb
 9ckavFsrMZvcMff6w2ivIJ47fD/b2wnLK1VRytO8DfPfePjYjJzjAs8lIvp+K9mFMO7w
 9FVgXbxRFGzRwFtoA04ZHEVTCxTio8HsC97UHPD9v34GvkoiEMUDOT2LSs+MWJIgGDWU Tg== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mp1trhjr9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 27 Dec 2022 07:42:19 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 27 Dec 2022 07:42:19 -0800
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Tue, 27 Dec 2022 07:42:19 -0800
From: <kai.kang@windriver.com>
To: <raj.khem@gmail.com>
CC: <openembedded-devel@lists.openembedded.org>
Subject: [meta-xfce][PATCH 1/5] xfce4-cpufreq-plugin: 1.2.7 -> 1.2.8
Date: Tue, 27 Dec 2022 23:42:13 +0800
Message-ID: <20221227154217.30842-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-GUID: 9bv35CWmFHmWJFm_O72Z5-Q7_KXzmF1o
X-Proofpoint-ORIG-GUID: 9bv35CWmFHmWJFm_O72Z5-Q7_KXzmF1o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-27_11,2022-12-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=861
 spamscore=0 mlxscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2212270129
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Dec 2022 15:42:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100287

From: Kai Kang <kai.kang@windriver.com>

Update xfce4-cpufreq-plugin from 1.2.7 to 1.2.8

* correct license with LGPL-2.0-or-later
* inherit perlnative

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...pufreq-plugin_1.2.7.bb => xfce4-cpufreq-plugin_1.2.8.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-xfce/recipes-panel-plugins/cpufreq/{xfce4-cpufreq-plugin_1.2.7.bb => xfce4-cpufreq-plugin_1.2.8.bb} (58%)

diff --git a/meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin_1.2.7.bb b/meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin_1.2.8.bb
similarity index 58%
rename from meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin_1.2.7.bb
rename to meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin_1.2.8.bb
index c98fe4a5c..8ddf48d6e 100644
--- a/meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin_1.2.7.bb
+++ b/meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin_1.2.8.bb
@@ -1,8 +1,8 @@
 SUMMARY = "Panel plugin to display frequency of all cpus"
 HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-cpufreq-plugin"
-LICENSE = "GPL-2.0-only"
+LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1f6f1c0be32491a0c8d2915607a28f36"
 
-inherit xfce-panel-plugin
+inherit xfce-panel-plugin perlnative
 
-SRC_URI[sha256sum] = "5ad4fb6150f51917b2a8af65926c6e4e83340827835782a14844c6b88dbcc58c"
+SRC_URI[sha256sum] = "07e458d9f4725e572001fb7eb66b9e931792311146e0f75ad5d87b9ae19573e9"
-- 
2.34.1


