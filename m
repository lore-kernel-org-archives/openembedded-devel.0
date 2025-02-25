Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DB2FC021B2
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 17:20:23 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.14291.1740504018321269399
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Feb 2025 09:20:18 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4151b5491e=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51P7TB7v026743
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 17:20:17 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44y3t2m01t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 17:20:17 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Tue, 25 Feb 2025 09:20:16 -0800
Received: from pop-os.wrs.com (172.25.44.6) by ala-exchng01.corp.ad.wrs.com
 (147.11.82.252) with Microsoft SMTP Server id 15.1.2507.43 via Frontend
 Transport; Tue, 25 Feb 2025 09:20:15 -0800
From: <Randy.MacLeod@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH] rsyslog: update from 8.2408.0 to 8.2502.0
Date: Tue, 25 Feb 2025 12:20:15 -0500
Message-ID: <20250225172015.2748078-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=eoIlzppX c=1 sm=1 tr=0 ts=67bdfbd1 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=T2h4t0Lz3GQA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=b9rvoX3_dHwnKXMcKpIA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: Xr7tkqBAyzzQW7p3pi-B6yaJYPbi7IBq
X-Proofpoint-ORIG-GUID: Xr7tkqBAyzzQW7p3pi-B6yaJYPbi7IBq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_05,2025-02-25_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 malwarescore=0
 mlxlogscore=912 phishscore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 mlxscore=0 bulkscore=0 spamscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2502250107
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 17:20:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115587

From: Randy MacLeod <Randy.MacLeod@windriver.com>

Update rsyslog from 8.2408.0 to 8.2502.0.

Full Changelog:
   https://github.com/rsyslog/rsyslog/blob/v8-stable/ChangeLog

ptest results did not change from 2408:
  TOTAL: 469
  PASS:  464
  SKIP:    5

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 .../rsyslog/{rsyslog_8.2408.0.bb => rsyslog_8.2502.0.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/rsyslog/{rsyslog_8.2408.0.bb => rsyslog_8.2502.0.bb} (98%)

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2408.0.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2502.0.bb
similarity index 98%
rename from meta-oe/recipes-extended/rsyslog/rsyslog_8.2408.0.bb
rename to meta-oe/recipes-extended/rsyslog/rsyslog_8.2502.0.bb
index d4bc5f725e..10128a9eb2 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2408.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2502.0.bb
@@ -32,7 +32,7 @@ SRC_URI:append:libc-musl = " \
     file://0001-Include-sys-time-h.patch \
     file://disable-omfile-outchannel.patch \
 "
-SRC_URI[sha256sum] = "8bb2f15f9bf9bb7e635182e3d3e370bfc39d08bf35a367dce9714e186f787206"
+SRC_URI[sha256sum] = "02fa197d21d519f5a25a928deb9397cd387ba7382b9b449782ba31d8f3118206"
 
 UPSTREAM_CHECK_URI = "https://github.com/rsyslog/rsyslog/tags"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
-- 
2.34.1


