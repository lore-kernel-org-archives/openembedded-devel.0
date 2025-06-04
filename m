Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B3FBC5B543
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 03:36:57 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.7899.1749008216479945334
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Jun 2025 20:36:56 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8250c6c08c=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55405V5f030801
	for <openembedded-devel@lists.openembedded.org>; Tue, 3 Jun 2025 20:36:56 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 471g9rsx8v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 03 Jun 2025 20:36:55 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Tue, 3 Jun 2025 20:36:55 -0700
Received: from ala-lpggp7.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Tue, 3 Jun 2025 20:36:55 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] python3-blivet: support fat resize
Date: Tue, 3 Jun 2025 20:37:01 -0700
Message-ID: <20250604033701.621725-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDAyOCBTYWx0ZWRfXz6jpm3UhX/1t Imiqd4QzQ4qxZJd8ddqfYQMusfPRykTZWBSlaxfA76kfGbGY5RbnD/iI1/Tre5sm85CpxEdkE1i 3a1w0egoZla2es5hgyOVMnPemn0sCL6lsma/NEC076hNLwLRIHWgu9gB1Fh+4TROUnmc/TKScyS
 Y7//cY/kGXv8G2fU8whywyiobJUak2hRmmJfzH40Fww4c3wO/m+yWc0qmVgzp0bRfrlhJzoLCuo eBCSn9Yfq3+lJwnbALg0u6rKpdEboZ3W8nNni0XQ+5DLFHvzUyhzvo1BMtBElktWuDa1bm6rQqQ eVH5JfurssqXjrQPYfHFq5HW0Pde4a/QbME8bSE1MBXnbi8nJNCT8vhqtljLGAgTbdvPod/nEvf
 P4lsuW6ilnn8ehMeljfAk0q00JRWTrx9TldmKFvX0vqYkXr4xa5G9kEc8apSmbp5/P2GY59R
X-Authority-Analysis: v=2.4 cv=PvyTbxM3 c=1 sm=1 tr=0 ts=683fbf57 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=6IFa9wvqVegA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=ONQZI3Q3bgczTe8LlGMA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: Hs0Vwzj7b4TiWRniVVROB0po1L0-l5dY
X-Proofpoint-ORIG-GUID: Hs0Vwzj7b4TiWRniVVROB0po1L0-l5dY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_01,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 bulkscore=0 adultscore=0 mlxscore=0 mlxlogscore=999 impostorscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506040028
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Jun 2025 03:36:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117726

According to release_notes.rst of 3.12.0 [1], it requires the `vfat-resize`
tool for FAT filesystem resize support. In Yocto, package libblockdev-bin
provides vfat-resize

[1] https://github.com/storaged-project/blivet/commit/ce03a4869d9ad55349819ff0d6a7557862ec4258#diff-b99febf52a7481dd33d7896edaaad85373851e76d8f01303491713e723b905ddR21-R25

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../recipes-extended/python-blivet/python3-blivet_3.12.1.bb     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-extended/python-blivet/python3-blivet_3.12.1.bb b/meta-python/recipes-extended/python-blivet/python3-blivet_3.12.1.bb
index 6a00e48ebb..bf492b3d57 100644
--- a/meta-python/recipes-extended/python-blivet/python3-blivet_3.12.1.bb
+++ b/meta-python/recipes-extended/python-blivet/python3-blivet_3.12.1.bb
@@ -24,7 +24,7 @@ REQUIRED_DISTRO_FEATURES = "systemd"
 
 RDEPENDS:${PN} += "python3-pykickstart python3-pyudev \
                    parted python3-pyparted multipath-tools \
-                   lsof cryptsetup libblockdev \
+                   lsof cryptsetup libblockdev libblockdev-bin \
                    libbytesize \
 "
 
-- 
2.49.0


