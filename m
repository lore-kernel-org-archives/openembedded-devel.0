Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE1A8D116F3
	for <webhook@archiver.kernel.org>; Wed,  3 Dec 2025 09:07:25 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10796.1764752836380107959
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Dec 2025 01:07:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=qCFsIDyY;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=443295ddc8=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B35f1Nj1803034
	for <openembedded-devel@lists.openembedded.org>; Wed, 3 Dec 2025 01:07:16 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=LkURbrfja2bCOwONlNIx
	PhvvRsUZ+CqfL8EPBa5tBPY=; b=qCFsIDyYbXWOTcy/Wb2Sduhhx+8c5BGdvj+L
	tc6fmCoiQFZA5VP6XD2kZ/ozEhiYMLdZsIzFQuPoH9ZC1CHUpkWUq8cks0L3jV9o
	k9ehZb7PHWNCl1kxRaiMCGdqKLOoAqDSxMpB3aRb+cVc/tl3Ky9pWNhjK/qaginS
	Tk+LYX1qg1VpZ5PBkzRsZ7/o7utcfG2sy6bYqIY9ZOafRna2U1q2HckP2pavCKje
	VxL+xhZ7aGriiIjMIh6KCQBytOfEFEDloP74MDWuDH2LSipfgDLrMF/L+8p8WOA0
	S7yLuRQsMlh34p5+Hc9b7NaB/uCsZ7If/8dhh9ChnB54O4EX+g==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aqw05mgev-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 03 Dec 2025 01:07:16 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 3 Dec 2025 01:07:15 -0800
Received: from pek-lpg-core6.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 3 Dec 2025 01:07:15 -0800
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] version-check.conf: mute version mismatch warning for bpftrace
Date: Wed, 3 Dec 2025 17:07:14 +0800
Message-ID: <20251203090714.2033769-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 3HW5BoZ-aYIrGKcZW37GVCYOlFDXeZOE
X-Authority-Analysis: v=2.4 cv=ddyNHHXe c=1 sm=1 tr=0 ts=692ffdc4 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8
 a=otCC0BV5TIVa8gh-jW4A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 3HW5BoZ-aYIrGKcZW37GVCYOlFDXeZOE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAzMDA3MSBTYWx0ZWRfX9YfkQ5Fik24G
 mBhR2y95wnIiSXnB6eh0qcjJmsXzjEgoa3EkbVgIK4n1s/xzhPGAQAndVSQWNEbkuvggcGVwmVm
 bNRsUTXBpPpxmvCZfNx3+NSBom8bGcQaOoVBcAHRUsKqfmRPlXeEDndhiFGmGH/CgVHH72qHL/6
 SMlMHGDT1Qfp03f1nd4gEyAs6nvdTeIxnMFfNzpfhbgVM7+sJukgwHYbE4maIk+mya1aNanCujT
 1trHuy69/QHEzBxSBqRw1CRg6JOcl76eUqqMgcUq5q/IOKBRb8ftHfNqwx3Kx5YB5F/RkeOpFj6
 FHQSyLY9xPAu0wQU0FNp16fktqzn3NC1e0u/QBwJ85g4PVmMjxit+mOT4hgz6cF8dWAKDdK0bJJ
 YBl9YLKQ2GVhNXYE6GclyX6JMS+/vg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-02_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512030071
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Dec 2025 09:07:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122275

From: Changqing Li <changqing.li@windriver.com>

bpftrace set the version by "git describe --dirty", since we have local
patch for bpftrace, '-dirty' will be added into the version, set
CHECK_VERSION_PV to mute the version mismatch warning

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-oe/conf/version-check.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/conf/version-check.conf b/meta-oe/conf/version-check.conf
index d1a6cdf7a5..3ff0bccfd6 100644
--- a/meta-oe/conf/version-check.conf
+++ b/meta-oe/conf/version-check.conf
@@ -36,3 +36,4 @@ CHECK_VERSION_PV:pn-libusb-compat = "0.1.12"
 CHECK_VERSION_PV:pn-jemalloc = "${@d.getVar('PV').split('+')[0]}%"
 CHECK_VERSION_PV:pn-dialog = "${@d.getVar('PV').split('-')[0]}%"
 CHECK_VERSION_PV:pn-flite = '%'
+CHECK_VERSION_PV:pn-bpftrace = '${PV}%'
-- 
2.34.1


