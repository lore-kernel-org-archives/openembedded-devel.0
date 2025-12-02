Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD1B5D116F1
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 02:10:30 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8681.1764641421072548746
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Dec 2025 18:10:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=fIojWK1V;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4431f0713e=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B201YGa3079295
	for <openembedded-devel@lists.openembedded.org>; Mon, 1 Dec 2025 18:10:20 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=ufjvyO5qbwpfRaBg+Fw9
	jwy2n8EB3GrXKSM3Wwryyww=; b=fIojWK1VSvXFSxkC1/jmva/7YFT8G3H/tbE9
	dfP2VDPGfB+zqF77WoOpxZkk12INfUfOC0HKnNOb+TGH5lYeIGo5dC2FSd8sH1r5
	VeVWex30dq8HCJB3wQxy6jUnqRS95Q47baB6wHb1uvIFvhhs6gjYNZgtyUfQCN9H
	IjZ++bFuso2I8DMHQMNkj9NYeV2Gy/Tb1xAPEpeiPMi7PH7vd13r761XrWhSTinx
	dzPlbCTNmr9os+uwuS4eMq1c1J6AynlHxUFss6rO2iuNEEwv6773qWuOxaUa4O2f
	5MyZqg/hsSnSgeRItNCrWDa9UUqdu4douWbBr+DBCyTJYVZ60Q==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aqw05jebg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 01 Dec 2025 18:10:20 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Mon, 1 Dec 2025 18:10:19 -0800
Received: from pek-lpg-core6.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Mon, 1 Dec 2025 18:10:19 -0800
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] hdf5: inherit pkgconfig
Date: Tue, 2 Dec 2025 10:10:18 +0800
Message-ID: <20251202021018.439316-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: EJnS7G9Cs_5YkWyqEneUvA23UZLNMpq4
X-Authority-Analysis: v=2.4 cv=ddyNHHXe c=1 sm=1 tr=0 ts=692e4a8c cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8
 a=M80lrjhENljtb-qDkJ4A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: EJnS7G9Cs_5YkWyqEneUvA23UZLNMpq4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAyMDAxNSBTYWx0ZWRfX7gYmzUkHqOju
 +B78UI/nl92O4DJ9C/sRGu6tD915xpZ6eI3MPvZ0HpCkw0ySvLMJS4zY4EKhqM/ay2+PfJLyvZ4
 kJpSCLHB75O2xq6dUDX5XWDyoVYKm6OnQzDbNSSLetGSIAZKuHvK/Y1i90wyvpQeIm6f+ShIKnH
 2Bqnh1KHXg3GlnKV4VjyzKLNqornRBQob09EChRigMKNmheqfFUXmRnBPMnviL6ltG0dBieLajV
 gkDArReLfdVBeSrbHnWlQiOqhgNZ4S7mnbS3qVCUkVfHL8gonTkslDS1uazPPFdUyZcwa2HzD9u
 Db/H/Da6XQvKlXjMfVUz1wj6WJUBGcAhSNjwqY+CKhUrWEpmpOWEKPt+kleu38MRShymnVjPs6f
 4RMhbIBv0H7HEwrCbIuFmYCauBkPyQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 phishscore=0
 clxscore=1011 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512020015
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Dec 2025 02:10:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122225

From: Changqing Li <changqing.li@windriver.com>

inherit pkgconfig, and fix install conflict when enable multilib, this
can also improve reproducibility

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb b/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb
index 798ca1b83f..93fe352b99 100644
--- a/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb
+++ b/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb
@@ -7,7 +7,7 @@ SECTION = "libs"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=71a191398102f76050a4e56e78cb4891"
 
-inherit cmake siteinfo qemu multilib_header
+inherit cmake pkgconfig siteinfo qemu multilib_header multilib_script
 
 DEPENDS += "qemu-native zlib"
 
@@ -48,8 +48,11 @@ do_configure:append() {
 do_install:append() {
     # Used for generating config files on target
     oe_multilib_header H5pubconf.h
+    sed -i -e 's|${RECIPE_SYSROOT_NATIVE}||g' ${D}${bindir}/h5cc
 }
 
+MULTILIB_SCRIPTS += "${PN}:${bindir}/h5cc"
+
 BBCLASSEXTEND = "native"
 
 # h5fuse.sh script needs bash
-- 
2.34.1


