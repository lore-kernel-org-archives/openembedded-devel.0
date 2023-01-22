Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5A99C38142
	for <webhook@archiver.kernel.org>; Sun, 22 Jan 2023 01:03:59 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.10288.1674349434313697675
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Jan 2023 17:03:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Ud7gm+cp;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=038692d17f=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30M12i4d022236
	for <openembedded-devel@lists.openembedded.org>; Sun, 22 Jan 2023 01:03:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=IHSgSfOgHSSJFLqXpCOYd4eRmIYsXaJ884N+QLIWPj4=;
 b=Ud7gm+cpGtawz23jRgeEx+19s50k6+ZYqbrMAjE6txebR03TMQ3dtOX+tUuhCY5QEgr+
 mLWqCQf8XX0XoJuuGzl4Ybu1DMnZaEgSAKZqobDwowH2ugIhQCfhXxd5tqTWHrydnh+Q
 S8QA5sXD3tWcwpKal/2w3uozmdqb81ScMf1r9phAEqDrByjN237qf/NmTA9RBRay2xc5
 xVfWFtcttGERVbKsfMYHT580fVnxda/+soBFkW70t9rmBevLWa+ErHLfpN1GmMZeqsuf
 bAfDp7ACkccVX9Vvj3mx2gWaMxlLb6CqCAUxFkGWrkHMVwpx9wvn6J776gCYQCHKmzIx MQ== 
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3n871a0uu1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 22 Jan 2023 01:03:53 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Sat, 21 Jan 2023 17:03:51 -0800
Received: from yow-fedora-builder1.wrs.com (128.224.56.212) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.17 via Frontend Transport; Sat, 21 Jan 2023 17:03:50 -0800
From: Randy MacLeod <randy.macleod@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH 1/2] librelp: update to 1.11.0
Date: Sat, 21 Jan 2023 20:03:50 -0500
Message-ID: <20230122010351.2741378-1-randy.macleod@windriver.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: j770hAJoS4RsnfZA5WIWCIGyjEyKa58I
X-Proofpoint-GUID: j770hAJoS4RsnfZA5WIWCIGyjEyKa58I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-21_17,2023-01-20_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 phishscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1011 mlxscore=0 mlxlogscore=956
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301220007
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 22 Jan 2023 01:03:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100699

Drop "-Wno-error", it builds fine now.
Release notes:
   https://github.com/rsyslog/librelp/blob/master/ChangeLog

Signed-off-by: Randy MacLeod <randy.macleod@windriver.com>
---
 meta-oe/recipes-extended/rsyslog/librelp_1.11.0.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-oe/recipes-extended/rsyslog/librelp_1.11.0.bb b/meta-oe/recipes-extended/rsyslog/librelp_1.11.0.bb
index 7d3b82b61..da3e9a137 100644
--- a/meta-oe/recipes-extended/rsyslog/librelp_1.11.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/librelp_1.11.0.bb
@@ -14,5 +14,3 @@ SRCREV = "b421f56d9ee31a966058d23bd23c966221c91396"
 S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig
-
-CPPFLAGS += "-Wno-error"
-- 
2.39.0


