Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A99CEB64D7
	for <webhook@archiver.kernel.org>; Mon, 26 Jun 2023 08:25:52 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.3260.1687767942766106631
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Jun 2023 01:25:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=ldY9s8vk;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5541c94293=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 35Q8Ob27021061
	for <openembedded-devel@lists.openembedded.org>; Mon, 26 Jun 2023 08:25:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=dZxGA
	OmrIFmxF5uEf8Om8L4OtCDnn4oO5QtGCApgg70=; b=ldY9s8vkQZ8VFBD6918P9
	FE23tmAxoMJ5QD6dCVSBHheytyAxEaDMQ6+95y2W8EVJv7JzdnuP1oaRF2B5GShf
	Gg+AAUeH1Oza92LRUDIq8PeJ2O8yyEi90sivGdLByM3+mUizpWDUhn1m0RZSYBaA
	orviAyUULnmZnXKc2hhsdF7TkHQj+W1hG8eECcVtt/3kKjWwashQ6/sDtzih7URb
	8NSJvQP022OvnacWjV96+j1wfZ1V9AGrQXTDWU6cxIDic8FnPi3fe5InLPmKPYS5
	ZvO980GPjcb1Qjqbl6FebWRAw30OELC5V350jG1c4jRC7nDE3tv1L1qsnoJRytML
	g==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3rdpqb1jft-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 26 Jun 2023 08:25:41 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 26 Jun 2023 01:25:38 -0700
From: Archana Polampalli <archana.polampalli@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <Hari.GPillai@windriver.com>
Subject: [oe][meta-networking][PATCH 1/1] tcpreplay: upgrade 4.4.3 -> 4.4.4
Date: Mon, 26 Jun 2023 08:25:10 +0000
Message-ID: <20230626082510.1985223-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: sFVNjsXy9ThVj8Pg2cc0iVKSEHSYLupB
X-Proofpoint-GUID: sFVNjsXy9ThVj8Pg2cc0iVKSEHSYLupB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-26_05,2023-06-22_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 mlxlogscore=880 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2305260000 definitions=main-2306260075
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 Jun 2023 08:25:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103574

This release contains bug fixes only.
The following CVEs have been addressed:

CVE-2023-27783
CVE-2023-27784
CVE-2023-27785
CVE-2023-27786
CVE-2023-27787
CVE-2023-27788
CVE-2023-27789

Changelog:
=========
dlt_jnpr_ether_cleanup: check subctx before cleanup by @Marsman1996 in #781
Bug #780 assert tcpedit dlt cleanup by @fklassen in #800
Fix bugs caused by strtok_r by @Marsman1996 in #783
Bug #782 #784 #785 #786 #787 #788 strtok r isuses by @fklassen in #801
Update en10mb.c by @david-guti in #793
PR #793 ip6 unicast flood by @fklassen in #802
Bug #719 fix overflow check for parse_mpls() by @fklassen in #804
PR #793 - update tests for corrected IPv6 MAC by @fklassen in #805
PR #793 - update tests for vlandel by @fklassen in #806
Feature #773 gh actions ci by @fklassen in #807

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../tcpreplay/{tcpreplay_4.4.3.bb => tcpreplay_4.4.4.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/tcpreplay/{tcpreplay_4.4.3.bb => tcpreplay_4.4.4.bb} (88%)

diff --git a/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.3.bb b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.4.bb
similarity index 88%
rename from meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.3.bb
rename to meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.4.bb
index d461c8d3d..c7d14e2ab 100644
--- a/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.3.bb
+++ b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.4.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://github.com/appneta/tcpreplay/releases/download/v${PV}/tcprepl
            file://0001-libopts.m4-set-POSIX_SHELL-to-bin-sh.patch \
           "
 
-SRC_URI[sha256sum] = "216331692e10c12d7f257945e777928d79bd091117f3e4ffb5b312eb2ca0bf7c"
+SRC_URI[sha256sum] = "44f18fb6d3470ecaf77a51b901a119dae16da5be4d4140ffbb2785e37ad6d4bf"
 
 UPSTREAM_CHECK_URI = "https://github.com/appneta/tcpreplay/releases"
 
-- 
2.40.0


