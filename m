Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7001BC6FA8F
	for <webhook@archiver.kernel.org>; Wed, 30 Aug 2023 04:55:10 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.7256.1693371307490375267
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Aug 2023 21:55:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=U5GGmDuG;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=76067cbaae=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 37U4gK34007247
	for <openembedded-devel@lists.openembedded.org>; Tue, 29 Aug 2023 21:55:07 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=EAG7m
	/1tPukEMuyHKkbIJ49uVhDx/lqyAhUjNoACNr8=; b=U5GGmDuG3CSZ46gTnNtY9
	pcnUNkjGNPHcvzps6yjYQhDce0j1WoDUf1IJlciNOpjJxHMG7e4+5gLqCwu31YWn
	lDVuIRbQrPGGMMFyw8Rm3xrE1k1D3uXey4do/cvYJurEGPYFtHH7lhsq9aGCfeU7
	df8VbhX+pJzLEn3Yhu1lAsvaWAiWcqQ0rx2X44M6biLfhdzBj7yW1f0I3urjXVEJ
	dzyF7OHlYWHcAPlT86pgxfcRtJ99f8vc8G5hpScr+IGjCkPhsN6l9EljcTzIhYlv
	+qlfHjT/brWyAbJlY9QAnPYpI/AiK58mctSYsQIm/LjOJsRqi+LT5k1xzqgHkINp
	w==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sqgwfk2rj-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 29 Aug 2023 21:55:06 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 29 Aug 2023 21:54:47 -0700
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][mickledore][PATCH 1/1] iperf3: upgrade 3.13 -> 3.14
Date: Wed, 30 Aug 2023 04:54:12 +0000
Message-ID: <20230830045412.696045-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: xiJ1YtY4LhPjNBIo-sFwjkQwg_RamQ_B
X-Proofpoint-ORIG-GUID: xiJ1YtY4LhPjNBIo-sFwjkQwg_RamQ_B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-29_16,2023-08-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=769
 lowpriorityscore=0 phishscore=0 malwarescore=0 bulkscore=0 adultscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 impostorscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2308100000
 definitions=main-2308300045
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Aug 2023 04:55:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104643

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 .../recipes-benchmark/iperf3/{iperf3_3.13.bb => iperf3_3.14.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-benchmark/iperf3/{iperf3_3.13.bb => iperf3_3.14.bb} (95%)

diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3_3.13.bb b/meta-oe/recipes-benchmark/iperf3/iperf3_3.14.bb
similarity index 95%
rename from meta-oe/recipes-benchmark/iperf3/iperf3_3.13.bb
rename to meta-oe/recipes-benchmark/iperf3/iperf3_3.14.bb
index 62a95b303..d181eb3b0 100644
--- a/meta-oe/recipes-benchmark/iperf3/iperf3_3.13.bb
+++ b/meta-oe/recipes-benchmark/iperf3/iperf3_3.14.bb
@@ -18,7 +18,7 @@ SRC_URI = "git://github.com/esnet/iperf.git;branch=master;protocol=https \
            file://0001-configure.ac-check-for-CPP-prog.patch \
            "
 
-SRCREV = "f48e7fa92b8932814f3d92f36986d51be9efe6e0"
+SRCREV = "a0be85934144bc04712a6695b14ea6e45c379e1d"
 
 S = "${WORKDIR}/git"
 
-- 
2.40.0


