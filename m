Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85F73C61DB2
	for <webhook@archiver.kernel.org>; Fri, 13 Jun 2025 06:54:48 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.4050.1749797684489837906
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Jun 2025 23:54:44 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8259073970=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55D4o6rP014658
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Jun 2025 23:54:44 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 474mxm6b81-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Jun 2025 23:54:43 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Thu, 12 Jun 2025 23:54:43 -0700
Received: from pek-lpg-core6.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Thu, 12 Jun 2025 23:54:42 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [master][meta-oe][PATCH 00/18] libsoup-2.4: fix CVEs
Date: Fri, 13 Jun 2025 14:54:23 +0800
Message-ID: <20250613065441.3121844-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: ImoOFMuhCKfFj0r6bxyCt3s1AykOHhyH
X-Authority-Analysis: v=2.4 cv=L74dQ/T8 c=1 sm=1 tr=0 ts=684bcb33 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=6IFa9wvqVegA:10 a=t7CeM3EgAAAA:8 a=JFsgzmTvZRJIr2y9fIAA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDA1MCBTYWx0ZWRfXy4XfOVbDchhO iMjAI4GRcsJT1MwkrGX7nt7b05SrjHkc1xXfUj8q1rkGGCMTBboIDewEGz76STNFAt0qQiAFzzp akU7r7129a2mI6OTtzQl1vBuMH9jWj0/jCXgqJhZAz7YAU+NsnyMi3nCRGmqsOR/TP/BJ1CpE5j
 DnSSi+34FXJcO9FrolomMcxYSAbnk4HsitAEM59NEfzGLpgW1nYfq+RvGpiNozS164YeCs6zGJG 1PLMWw469rH6TbxcmY4Z3SLkN5dAd+UkyMnKl5cSYCtUPi9elrLA0wWRmjddlKvkNE14R/JtyuA Ayn2nEIR/bFjC67Bcbmqe2yTzfKzh0k6lysKhJ3ALKfjQbJfiW093QyYiOnmfk2VpgQDTIdbI5P
 V0kGIPeZC46d7inRDBZGYVlm9MSmnnuj4NCrv+0cvSPqip7cDavJhnJrUHeLhSiAB7TUKUmE
X-Proofpoint-ORIG-GUID: ImoOFMuhCKfFj0r6bxyCt3s1AykOHhyH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_10,2025-06-12_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 mlxlogscore=559 adultscore=0 spamscore=0 suspectscore=0
 mlxscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 phishscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506130050
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 Jun 2025 06:54:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117890

From: Changqing Li <changqing.li@windriver.com>

Cherry pick CVE fixes from poky-contrib:stable/walnascar-nut

Changqing Li (18):
  libsoup-2.4: fix CVE-2025-32053
  libsoup-2.4: fix CVE-2025-2784
  libsoup-2.4: fix CVE-2024-52530
  libsoup-2.4: fix CVE-2025-32906
  libsoup-2.4: fix CVE-2025-32914
  libsoup-2.4: fix CVE-2025-46420
  libsoup-2.4: fix CVE-2025-46421
  libsoup-2.4: fix CVE-2025-32050
  libsoup-2.4: fix CVE-2025-32052
  libsoup-2.4: fix CVE-2025-32909
  libsoup-2.4: fix CVE-2025-32910
  libsoup-2.4: fix CVE-2025-32912
  libsoup-2.4: fix CVE-2024-52531
  libsoup-2.4: fix CVE-2025-4476
  libsoup-2.4: fix CVE-2025-32907
  libsoup-2.4: fix CVE-2025-4948
  libsoup-2.4: fix CVE-2025-4969
  libsoup-2.4: update patch 0001-CVE-2025-32911.patch

 .../libsoup-2.4/0001-CVE-2025-32911.patch     |   2 +-
 .../libsoup/libsoup-2.4/CVE-2024-52530.patch  | 150 ++++++++++++++++++
 .../libsoup-2.4/CVE-2024-52531-1.patch        |  39 +++++
 .../libsoup-2.4/CVE-2024-52531-2.patch        | 133 ++++++++++++++++
 .../libsoup/libsoup-2.4/CVE-2025-2784.patch   |  56 +++++++
 .../libsoup/libsoup-2.4/CVE-2025-32050.patch  |  29 ++++
 .../libsoup/libsoup-2.4/CVE-2025-32052.patch  |  32 ++++
 .../libsoup/libsoup-2.4/CVE-2025-32053.patch  |  39 +++++
 .../libsoup/libsoup-2.4/CVE-2025-32906.patch  |  71 +++++++++
 .../libsoup/libsoup-2.4/CVE-2025-32907.patch  |  39 +++++
 .../libsoup/libsoup-2.4/CVE-2025-32909.patch  |  38 +++++
 .../libsoup-2.4/CVE-2025-32910-1.patch        |  32 ++++
 .../libsoup-2.4/CVE-2025-32910-2.patch        |  94 +++++++++++
 .../libsoup-2.4/CVE-2025-32910-3.patch        |  28 ++++
 .../libsoup/libsoup-2.4/CVE-2025-32912.patch  |  32 ++++
 .../libsoup/libsoup-2.4/CVE-2025-32914.patch  |  35 ++++
 .../libsoup/libsoup-2.4/CVE-2025-4476.patch   |  38 +++++
 .../libsoup/libsoup-2.4/CVE-2025-46420.patch  |  61 +++++++
 .../libsoup/libsoup-2.4/CVE-2025-46421.patch  |  47 ++++++
 .../libsoup/libsoup-2.4/CVE-2025-4948.patch   |  38 +++++
 .../libsoup/libsoup-2.4/CVE-2025-4969.patch   |  37 +++++
 .../libsoup/libsoup-2.4_2.74.3.bb             |  24 ++-
 22 files changed, 1091 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-52530.patch
 create mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-52531-1.patch
 create mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2024-52531-2.patch
 create mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-2784.patch
 create mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32050.patch
 create mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32052.patch
 create mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32053.patch
 create mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32906.patch
 create mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32907.patch
 create mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32909.patch
 create mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-1.patch
 create mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-2.patch
 create mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-3.patch
 create mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32912.patch
 create mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32914.patch
 create mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-4476.patch
 create mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-46420.patch
 create mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-46421.patch
 create mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-4948.patch
 create mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-4969.patch

-- 
2.34.1


