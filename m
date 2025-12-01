Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E21EFD116E2
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 07:05:37 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15821.1764572729671195150
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Nov 2025 23:05:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=UubuFoR6;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4430a8f5e9=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B14vU5s549409
	for <openembedded-devel@lists.openembedded.org>; Sun, 30 Nov 2025 23:05:29 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=ab3gwCcqAqlElezhhWJHCJlqwKO+yEXKy1FimqVxocs=; b=UubuFoR6So+e
	QL/NiYEdnZbwvGn2e2Mpu4ZugF9LtEyQMRNoAhoard9vxUuTv4O2DucI4DJe4QfB
	tTX6++ctyljh82XtYQdAjKe4aJPhAttao8/MxqkvVFhpWyplYxU9tRboFutMA41q
	jOr+rf3/SSwJ+tnqCMuQSM3gpSnQSipTWi1DGUrcfypI77akJVlTEhQWHcHsV88f
	ys/gCDqgTtEbTfo8zoALweGRweUXMVTXQ+dsVRfaHoKplqLcc0uQskdVNN+5sFvO
	tc8ygJyPFpHrWK8YUVegp938dyi1Cmh89OhWXQGwqNMFtsbxao3LEx3k4cXKD26p
	SCQu58hwvw==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ar17ms86e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 30 Nov 2025 23:05:29 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Sun, 30 Nov 2025 23:05:28 -0800
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Sun, 30 Nov 2025 23:05:28 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH 3/3] syslog-ng: switch to libpcre2
Date: Mon, 1 Dec 2025 15:05:25 +0800
Message-ID: <20251201070525.362494-3-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251201070525.362494-1-hongxu.jia@windriver.com>
References: <20251201070525.362494-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: Cwv8dDSen0o9vKYwygNHZVgkgAugDBlB
X-Authority-Analysis: v=2.4 cv=Ws4m8Nfv c=1 sm=1 tr=0 ts=692d3e39 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=uHBe-9tmsZ-q2zacKn0A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: Cwv8dDSen0o9vKYwygNHZVgkgAugDBlB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDA1NiBTYWx0ZWRfX6E8gDtJO3Gip
 xVv4O6s87Diz78tjR8h8++s5Dn83ZdL+MohJjPbJa0Kch3qm2wEdkpc8GDoxGVK6DROl5m5+BKm
 ep1HfVJtUagfMBUuV41OIwz51MDuHztSfmKJ9Oon1crSsSS3RsfHNdOcWum9LnzMuBFo7ERKXOq
 ogeb2TWc2BunYccc+pmHNLi8vD61MGzo83mr1uOugYcJXpP4jOeF63nSHanEtIOevaTbWv/J8LC
 PKRpohe2raDcX04P6jR03LbSaEcLOz9BlU5KY7nnDco5zunqhcbtZW/KQAAe0X7gvCq8/0Ibqiz
 HZtj0rBML7e1JfAsGpJTPWhkT8sHl9OIaM8XViGcFw/N1TUjze5v7vqNup3/il9eYcLVtwCrFQB
 nfjcNBsVrKpiJUAaBYPoIN74AStVuw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512010056
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Dec 2025 07:05:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122193

The syslog-ng used pcre2 instead of pcre since 2023 [1]

[1] https://github.com/syslog-ng/syslog-ng/commit/cb6de08dc9078644d48ca536b5660e406b1a50d6

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-oe/recipes-support/syslog-ng/syslog-ng_4.8.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng_4.8.2.bb b/meta-oe/recipes-support/syslog-ng/syslog-ng_4.8.2.bb
index cfc376ded1..3d8570122b 100644
--- a/meta-oe/recipes-support/syslog-ng/syslog-ng_4.8.2.bb
+++ b/meta-oe/recipes-support/syslog-ng/syslog-ng_4.8.2.bb
@@ -13,7 +13,7 @@ LICENSE = "GPL-2.0-only & LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=924958cefc9f7de3e0b818832b8a1cec"
 
 # util-linux added to get libuuid
-DEPENDS = "libpcre flex glib-2.0 openssl util-linux bison-native curl json-c"
+DEPENDS = "libpcre2 flex glib-2.0 openssl util-linux bison-native curl json-c"
 
 SRC_URI = "https://github.com/balabit/syslog-ng/releases/download/${BP}/${BP}.tar.gz \
            file://syslog-ng.conf.systemd \
-- 
2.34.1


