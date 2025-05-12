Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55268C3ABC3
	for <webhook@archiver.kernel.org>; Mon, 12 May 2025 07:35:51 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.44758.1747035350609005011
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 May 2025 00:35:50 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=72271e9988=mingli.yu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54C5bbVA020658
	for <openembedded-devel@lists.openembedded.org>; Mon, 12 May 2025 07:35:49 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46hws89dxa-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 12 May 2025 07:35:49 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Mon, 12 May 2025 00:35:48 -0700
Received: from pek-lpg-core4.wrs.com (128.224.153.44) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Mon, 12 May 2025 00:35:48 -0700
From: <mingli.yu@eng.windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH 1/2] python3-setproctitle: Add missing rdep on libatomic-dev for ptest
Date: Mon, 12 May 2025 15:35:46 +0800
Message-ID: <20250512073547.183396-1-mingli.yu@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: x6isEISZL0jK-yjiAvwSThhVIcKl4fFB
X-Proofpoint-GUID: x6isEISZL0jK-yjiAvwSThhVIcKl4fFB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEyMDA3OSBTYWx0ZWRfX1zbHvj+xzayQ 85eRmSjwwOgTDLGM2GtZ7DLpcuGDtKDoY7R8rSSlCYsNhzXiEOy+UgXVSo9oH2XfKPVu/U8MXbT VsEiWeqQtnq0xifxGHMhTIxUq5y4z7XnVXga2Ung8jFNPG0U+oJZ/D3uXT0UuXOPcgQ34W+kqoQ
 DIt+30FeHJkHI3sx9EuJSKUNAMJP8mwjXVceO+YpHPJvEL7pTSR8MdlgVvfVXtX03VaCcsJQw10 i5qUPBWG4V7sdh+neTXNDhmw84qt8h7GwNNcnCyW9tprFjomwGN9o22RNj5NMrd/gUmemGjI8ht DO+c/fOZacRarIiOwHLmfWrCArbJyxNP72IfXCZpkIMOeWkT2tQjltBZnB9JiTkxEyAZchHjUeg
 alYJ65lQVPXo7vAR7nc5zcllve3HnsPDKME7lKmbaW03/hjiWFmeD5p5jnoqKXRaNTpxEKUv
X-Authority-Analysis: v=2.4 cv=Q+HS452a c=1 sm=1 tr=0 ts=6821a4d5 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=dt9VzEwgFbYA:10 a=t7CeM3EgAAAA:8 a=wKJJfNyR18DDKQifx3YA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_02,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 mlxlogscore=999 bulkscore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2505120079
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 May 2025 07:35:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117387

From: Mingli Yu <mingli.yu@windriver.com>

Fixes:
  E           subprocess.CalledProcessError: Command '['cc', '-I/usr/include/python3.13', '-I/usr/include/python3.13', '-o', '/usr/lib64/python3-setproctitle/ptest/tests/pyrun3.13', '/usr/lib64/python3-setproctitle/ptest/tests/pyrun.c', '-L/usr/lib64', '-lpython3.13', '-ldl', '-lpthread', '-latomic', '-lm', '-L/usr/lib']' returned non-zero exit status 1.

  ../../python3.13/subprocess.py:421: CalledProcessError
  ERROR: tests/setproctitle_test.py:test_embedded

  E           subprocess.CalledProcessError: Command '['cc', '-I/usr/include/python3.13', '-I/usr/include/python3.13', '-o', '/usr/lib64/python3-setproctitle/ptest/tests/pyrun3.13', '/usr/lib64/python3-setproctitle/ptest/tests/pyrun.c', '-L/usr/lib64', '-lpython3.13', '-ldl', '-lpthread', '-latomic', '-lm', '-L/usr/lib']' returned non-zero exit status 1.

  ../../python3.13/subprocess.py:421: CalledProcessError
  ERROR: tests/setproctitle_test.py:test_embedded_many_args

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../recipes-devtools/python/python3-setproctitle_1.3.5.bb        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-setproctitle_1.3.5.bb b/meta-python/recipes-devtools/python/python3-setproctitle_1.3.5.bb
index cf03bc3b51..6be65469af 100644
--- a/meta-python/recipes-devtools/python/python3-setproctitle_1.3.5.bb
+++ b/meta-python/recipes-devtools/python/python3-setproctitle_1.3.5.bb
@@ -16,6 +16,7 @@ SRC_URI += " \
 "
 
 RDEPENDS:${PN}-ptest += "\
+    libatomic-dev \
     packagegroup-core-buildessential \
     procps-ps \
     python3-dev \
-- 
2.34.1


