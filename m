Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BA621061B30
	for <webhook@archiver.kernel.org>; Tue, 31 Mar 2026 03:41:29 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12577.1774928486793106926
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Mar 2026 20:41:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ipDnYKR8;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8550ec322d=mingli.yu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V3eVGp2435056
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Mar 2026 20:41:26 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=IGuyZYrA/i1hGqt6me1Z
	/NLzBeW2k2jyW0bPxDgYQcg=; b=ipDnYKR83qzcdtjKV5BcwFNK9YWq/7BQQii3
	h0x/vHarLJkGt3AB+h64AUZRVMQumhgcprJU5AZW2PrDF5cCIjIIHBz2uV/cVRpx
	3/kaybEXslbKpRS72XfqHBOeDdpmYgkxhxI9cVClHDGqw1GEgmwSLnCSmFhDuyfR
	jIZ23NCYvsLF0Ji1PoATuoMllScoJK4Vi6fh8roWkcCgGQgO61eaZdzF8odpFAik
	WuG7aMd/E2o2xXCvFenNHtsJiIrx0kG0ir5FB9XOMXn8a0iF/q+gyH+IpMxcgWEW
	KXierZmhgxTth/JyJPC5M2gZi2+CVuK3KhGkUfiS7fnANhTFvg==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4d6a8vau2r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Mar 2026 20:41:26 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Mon, 30 Mar 2026 20:41:25 -0700
Received: from pek-lpg-core4.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Mon, 30 Mar 2026 20:41:25 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH] python3-ecdsa: Upgrade 0.19.1 -> 0.19.2
Date: Tue, 31 Mar 2026 11:41:24 +0800
Message-ID: <20260331034124.2569183-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: Pk3V6Rx2rpY_LM8F6e15XXLHSv6S-iP5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDAzMiBTYWx0ZWRfXw+4VXSEhM13P
 5maE6E7zQMEGI2VmFkJQQ58hVQnGCzco6y2PtBEsRUEUb8Zzv8FwhYzL4EcpMrmZpuqJpox7NI9
 yBtwvHS5/PX3LcjGCjlTyT8nCBAQ+biwb0nstyRDAlz2sIGG7+J1oFq9bpum6d7SjqZYuj7lVJZ
 EiPK+DPASnbgASDn4SlYuoZj4Q5shPcRFPNQZbF7Q/TuPcBBs01bD6IyqgSE98D6TJJu2DgSYnU
 DxrqEfKJPglgQNCRaVtfT8otCmmtSW41oIPHDkPBlRmGPZC1XH5PIqnn6yHYrVH57z0c38kPEpI
 Xf9BDBcDBqR9YyPhJC47iVpwk694oMeYhL6Moq+UUg38au03O0PjfJbrKSO6Qs8wsd22j0yQX8h
 V7uOrzI7y6LePg7IJHLNmutZAj0T4C+nZy3MR/dbeuCbOLWG9HpSJnzf8XvmsbnaYc0HB5k9udw
 Dn9o4RmWpN+AIsDtuIQ==
X-Proofpoint-ORIG-GUID: Pk3V6Rx2rpY_LM8F6e15XXLHSv6S-iP5
X-Authority-Analysis: v=2.4 cv=ZKHaWH7b c=1 sm=1 tr=0 ts=69cb4266 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=HK-ge7EqtdluswH-FwHe:22 a=a-XoYt5LAAAA:20 a=t7CeM3EgAAAA:8
 a=fqnb974yDmWWiGwYbMcA:9 a=FdTzh2GWekK77mhwV6Dw:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_01,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310032
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 31 Mar 2026 03:41:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125869

From: Mingli Yu <mingli.yu@windriver.com>

Changlog:
  https://github.com/tlsfuzzer/python-ecdsa/releases/tag/python-ecdsa-0.19.2

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../python/{python3-ecdsa_0.19.1.bb => python3-ecdsa_0.19.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-ecdsa_0.19.1.bb => python3-ecdsa_0.19.2.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-ecdsa_0.19.1.bb b/meta-python/recipes-devtools/python/python3-ecdsa_0.19.2.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-ecdsa_0.19.1.bb
rename to meta-python/recipes-devtools/python/python3-ecdsa_0.19.2.bb
index 2025d5e139..5bb1da85b6 100644
--- a/meta-python/recipes-devtools/python/python3-ecdsa_0.19.1.bb
+++ b/meta-python/recipes-devtools/python/python3-ecdsa_0.19.2.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=66ffc5e30f76cbb5358fe54b645e5a1d"
 
 PYPI_PACKAGE = "ecdsa"
-SRC_URI[sha256sum] = "478cba7b62555866fcb3bb3fe985e06decbdb68ef55713c4e5ab98c57d508e61"
+SRC_URI[sha256sum] = "62635b0ac1ca2e027f82122b5b81cb706edc38cd91c63dda28e4f3455a2bf930"
 
 CVE_PRODUCT = "python-ecdsa_project:python-ecdsa tlsfuzzer:ecdsa"
 
-- 
2.34.1


