Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ADADC87FD1
	for <webhook@archiver.kernel.org>; Tue,  5 Aug 2025 07:50:24 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.16516.1754380222300392439
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Aug 2025 00:50:22 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=03128fa20b=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 5755UkAb4149976
	for <openembedded-devel@lists.openembedded.org>; Tue, 5 Aug 2025 07:50:21 GMT
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4897vx2g8j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 05 Aug 2025 07:50:21 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Tue, 5 Aug 2025 00:50:20 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Tue, 5 Aug 2025 00:50:19 -0700
From: <jiaying.song.cn@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [walnascar][PATCH] passwdqc: correct the SRC_URI
Date: Tue, 5 Aug 2025 15:50:18 +0800
Message-ID: <20250805075018.2987975-1-jiaying.song.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=UfJRSLSN c=1 sm=1 tr=0 ts=6891b7bd cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=2OwXVqhp2XgA:10 a=XkRKQH6RAAAA:8 a=OPAOpny1AAAA:8 a=t7CeM3EgAAAA:8
 a=KYjiVFhI82W20ilUqDIA:9 a=ZXulRonScM0A:10 a=1gUyE30hU_ULiMxJiLUW:22
 a=Vt4qOV5uLRUYeah0QK8L:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA1MDA1NiBTYWx0ZWRfXwOLTpnEmdFpC
 JXOrdYg2oZubWlqiWgTgl70Cld02CBHUwpkIl6XX6YyQk8zFApfkA2U0hXyWjJcdgxZkbf+ACJw
 a1IKGdy7gATD4gMoImVSJ2mg7Le43Sqp2OrXLjpEX6/VTT2kMt8IB/7wSWqaLXdsLloxIK11qDt
 41J/tnxJPUNqBN2CfRVN3tgP4lPuPbAzAbEiRqwojIUfnPxscvdlO4A/wWXVZwLihOdbISdEYRr
 w3AE/5qgmiSRuqqlK5kNuYUhEYNa/mxOhHsmwbpZ+z+FzoFfJyP2zh14eI5lz2xcDpXQ62Y9MSp
 GbICosc8lQuFDH+SDXHpKOrvNuuplNpiZUE72pQhWH4aqPZxvrEGAUGlNS78KB2EhOB+FLdjRFN
 L7ipAHqq
X-Proofpoint-ORIG-GUID: oalnJQLm_moKqogu5nZvaw5FO2t6Y-Y-
X-Proofpoint-GUID: oalnJQLm_moKqogu5nZvaw5FO2t6Y-Y-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_02,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507210000 definitions=main-2508010196
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Aug 2025 07:50:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118878

From: Jiaying Song <jiaying.song.cn@windriver.com>

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
---
 meta-oe/recipes-security/passwdqc/passwdqc_2.0.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-security/passwdqc/passwdqc_2.0.3.bb b/meta-oe/recipes-security/passwdqc/passwdqc_2.0.3.bb
index 8694052e61..2b9356f60e 100644
--- a/meta-oe/recipes-security/passwdqc/passwdqc_2.0.3.bb
+++ b/meta-oe/recipes-security/passwdqc/passwdqc_2.0.3.bb
@@ -27,7 +27,7 @@ REQUIRED_DISTRO_FEATURES = "pam"
 LICENSE = "BSD-1-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=ac99c8678577a1c2f9f04cccee411d5d"
 
-SRC_URI = "http://www.openwall.com/${BPN}/${BP}.tar.gz \
+SRC_URI = "https://download.openwall.net/pub/projects/${BPN}/${BP}.tar.gz \
            file://makefile-add-ldflags.patch \
           "
 SRC_URI[sha256sum] = "53b0f4bc49369f06195e9e13abb6cff352d5acb79e861004ec95973896488cf4"
-- 
2.34.1


