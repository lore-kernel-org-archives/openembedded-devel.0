Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBC94C27C55
	for <webhook@archiver.kernel.org>; Sat,  8 Jun 2024 12:32:57 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.5462.1717849975505978938
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 08 Jun 2024 05:32:55 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=688978f826=kai.kang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 458C94r1009775;
	Sat, 8 Jun 2024 12:32:53 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3yme9608nc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 08 Jun 2024 12:32:53 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sat, 8 Jun 2024 05:32:52 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Sat, 8 Jun 2024 05:32:51 -0700
From: <kai.kang@windriver.com>
To: <raj.khem@gmail.com>
CC: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH v2 0/4] fix incompatible pointer type compile errors
Date: Sat, 8 Jun 2024 20:32:44 +0800
Message-ID: <20240608123244.1767171-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: d1i8jGcwCVKxB0qdyDZ5J-gcEd9bWye0
X-Proofpoint-ORIG-GUID: d1i8jGcwCVKxB0qdyDZ5J-gcEd9bWye0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-08_06,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 adultscore=0 spamscore=0 suspectscore=0
 phishscore=0 impostorscore=0 mlxscore=0 mlxlogscore=713 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2405170001 definitions=main-2406080093
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 08 Jun 2024 12:32:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110775

From: Kai Kang <kai.kang@windriver.com>

v2:
* update Upstream-Status with Inactive-Upstream for daq and uw-imap

Kai Kang (4):
  xscreensaver: drop removal for CONFIGUREOPTS
  uw-imap: fix incompatible pointer type errors
  recipes: disable gcc option -Wincompatible-pointer-types
  daq: fix incompatible pointer type error

 .../recipes-connectivity/daq/daq_2.0.7.bb     |   1 +
 ...-fix-incompatible-pointer-type-error.patch |  31 ++
 .../perl/libdbd-mysql-perl_4.050.bb           |   2 +
 ...-imap-fix-incompatible-pointer-types.patch | 355 ++++++++++++++++++
 .../recipes-devtools/uw-imap/uw-imap_2007f.bb |   1 +
 .../recipes-extended/rrdtool/rrdtool_1.8.0.bb |   2 +-
 .../xscreensaver/xscreensaver_6.04.bb         |   1 -
 7 files changed, 391 insertions(+), 2 deletions(-)
 create mode 100644 meta-networking/recipes-connectivity/daq/files/daq-fix-incompatible-pointer-type-error.patch
 create mode 100644 meta-oe/recipes-devtools/uw-imap/uw-imap/uw-imap-fix-incompatible-pointer-types.patch

-- 
2.34.1


