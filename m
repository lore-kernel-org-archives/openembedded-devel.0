Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 191B1C36005
	for <webhook@archiver.kernel.org>; Mon, 28 Apr 2025 07:10:36 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.42339.1745824165585871860
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Apr 2025 00:09:25 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=62139e711a=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53RMuJ16016452
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Apr 2025 07:09:24 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 468pf92h9r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Apr 2025 07:09:24 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Mon, 28 Apr 2025 00:09:23 -0700
Received: from pek-lpg-core6.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Mon, 28 Apr 2025 00:09:22 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [walnascar][PATCH 0/6] Backport version mismatch patches from master
Date: Mon, 28 Apr 2025 15:09:16 +0800
Message-ID: <20250428070922.3944580-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: FPXA2GtvtWDQLTQxDNkeYPDhAVkV0Oe-
X-Authority-Analysis: v=2.4 cv=EavIQOmC c=1 sm=1 tr=0 ts=680f29a4 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=XR8D0OoHHMoA:10 a=t7CeM3EgAAAA:8 a=CPaMtkbN9bP8hcCdyqYA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDA1OCBTYWx0ZWRfX3APM199RWqkU rSRtYJAaU6SQ8+SiofsOtH8gHa8EIytc8XMHEgC0KYzbJnfnW9pHorRAeBxl3WukmwavEsm6tm9 8cStB7zyd4xu4pJNovfnJh88yRg5wke123Qi6zBY3IJxhsPuJUVk5VwJxDUBGjSaA/B77XPDe4l
 SmZ/0VqYG7moTCy853Kpmt4NjGyhc9ripSpG060qGJebYTGP7QjgEty34wULbXO+hj3yURvERkt jRREJaq2QNmy3qw2G1mJ/N6wU6R+Bwy5WyN6BO+G6cxwj4Ba+J72RpoVZ5FCs39SmjZ+eIpfbuH VuaPAjnvEKWKNdFSh63qSWguKDOVUfcZGRjszbZVCZ3MK9Iaj46RSYFwMSaIRcgdncYp/uHfzhE
 CrHgyvapDImjM7rwuRCdLhJOY3C4bb59ADH16CTgnkvehY6NYBAkop3TeYYWt4IvqjR4eOGS
X-Proofpoint-ORIG-GUID: FPXA2GtvtWDQLTQxDNkeYPDhAVkV0Oe-
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 adultscore=0 suspectscore=0 phishscore=0 mlxscore=0 clxscore=1015
 mlxlogscore=780 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2504280058
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Apr 2025 07:10:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117182

From: Changqing Li <changqing.li@windriver.com>

Backport 6 version mismatch patches from master

Changqing Li (6):
  version-check.conf: add CHECK_VERSION_PV for pn-netperf
  python3-pyyaml-include: update SRCREV
  version-check.conf: mute bridge-utils version mismatch warning
  libuser: correct the package version
  turbostat: make turbostat's version align with kernel version
  lvm2: correct PKGV for package libdevmapper

 ...-configure.ac-update-version-to-0.64.patch | 25 +++++++++++++++++++
 .../recipes-support/libuser/libuser_0.64.bb   |  1 +
 meta-oe/conf/version-check.conf               |  3 +++
 .../{turbostat_3.4.bb => turbostat.bb}        |  7 ++++++
 meta-oe/recipes-support/lvm2/lvm2.inc         | 23 +++++++++++++++++
 .../python/python3-pyyaml-include_2.2.bb      |  6 ++++-
 6 files changed, 64 insertions(+), 1 deletion(-)
 create mode 100644 meta-gnome/recipes-support/libuser/libuser/0001-configure.ac-update-version-to-0.64.patch
 rename meta-oe/recipes-kernel/turbostat/{turbostat_3.4.bb => turbostat.bb} (94%)

-- 
2.34.1


