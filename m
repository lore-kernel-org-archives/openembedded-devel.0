Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9CCEE83054
	for <webhook@archiver.kernel.org>; Tue,  3 Feb 2026 05:17:12 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10350.1770095828331494034
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Feb 2026 21:17:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=PbcFhyqn;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6494efc79b=mingli.yu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6134B9GZ2625371
	for <openembedded-devel@lists.openembedded.org>; Tue, 3 Feb 2026 05:17:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=JlvdaM6DdzBeCDneF44rLC+0x7UqN2Zxa/GGm+bj89c=; b=PbcFhyqnG1Wc
	1L8k2u0U9qCDE01wfYIP9p8MivbVp3el2RSJxy7CeI5Tql3bCrPlagVVZuD1yyG+
	E5CZeBwwWrqWchv2XeGJGvx4yBoz9+Lu5pmkwk6jiK82S6JKGx9p5kcekWrHNUnA
	ptGPQJxue4xZcb1uv1WWh5CNwIKPigFFHrCcQ+J5GFlzQs5HWfGnc/phrSnf+y+r
	cJ5+zyWN/T+iqVU4nV2d1tEaL8MCU9XyAYgf5JSEnYD+9SYf2HZKIJZU2WbQlIBe
	1rIt4gPq49hMcjH+s7i2eHaCRphfUrqnfrxx0W4ApkWETDPoocRdx7oEUXpUdswF
	JlLfhEFtvw==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4c18q3tvqb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 03 Feb 2026 05:17:07 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Mon, 2 Feb 2026 21:17:06 -0800
Received: from pek-lpg-core4.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Mon, 2 Feb 2026 21:17:05 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH 2/4] memstat: Restore DEBUG_PREFIX_MAP in TARGET_LDFLAGS
Date: Tue, 3 Feb 2026 13:17:03 +0800
Message-ID: <20260203051703.2668668-2-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260203051703.2668668-1-mingli.yu@windriver.com>
References: <20260203051703.2668668-1-mingli.yu@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: UM80JFkeiGD3P4aS240-plyLkadtxRvD
X-Authority-Analysis: v=2.4 cv=Au7jHe9P c=1 sm=1 tr=0 ts=698184d3 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Q4-j1AaZAAAA:8 a=FP58Ms26AAAA:8
 a=t7CeM3EgAAAA:8 a=QhW3Soo6v_4DS-JczGsA:9 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDAzOSBTYWx0ZWRfXye0xDH+Nndod
 2j5QELSOYqwvz/j3OonaJWrpDV4KMof/z8DsxRwwa2G6LbfSR25YbK6VIXnVryxFY7GK0sDAqOR
 HaYLGRV/2G3N4MB/tI5/HLHWuJS9uhf36pf4fty8hCcI5CBFh2yAYM/NPByLUNo3+fjwCXE0Qyb
 cU5OQ9VsSxlC2f9lARuHLVqX1gId1CN26MfLIzbpTW8rNgXAON9Y5ZSYbrMQNvosAEmi6AA1Reg
 ThbU7SuWZLdzVwk5yHpj+2dRc/Uq18badMaGvb9O8ukC2tOju8q1AB1y6+D7WsOP4sCZA58FHMp
 ABynSVuxCCubmskyxPn5yMFkhhy2Ja4NQpY4c5SmayVZxOcJjUP0y+gQ86h7ROpSryT0dVm8raB
 S/ghNHuQCe2j+BBW8eP+4ZdIZbgs16YHIevaQrqYBxnCWK7CrwJyfZ2Sl84pX6RCgustV4lSyoA
 UFU4B8XtVZH5ZKYJ6rA==
X-Proofpoint-ORIG-GUID: UM80JFkeiGD3P4aS240-plyLkadtxRvD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_01,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602030039
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Feb 2026 05:17:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124094

From: Mingli Yu <mingli.yu@windriver.com>

oe-core has removed DEBUG_PREFIX_MAP from TARGET_LDFLAGS [1], restore
it to fix the below error.

ERROR: memstat-1.0-r0.wr2401 do_package_qa: QA Issue: File /usr/bin/.debug/memstat in package memstat-dbg contains reference to TMPDIR [buildpaths]
ERROR: memstat-1.0-r0.wr2401 do_package_qa: Fatal QA errors were found, failing task.

[1] https://git.openembedded.org/openembedded-core/commit/?id=1797741aad02b8bf429fac4b81e30cdda64b5448

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta-oe/recipes-devtools/memstat/memstat_1.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/memstat/memstat_1.0.bb b/meta-oe/recipes-devtools/memstat/memstat_1.0.bb
index 606ad39006..a0b4d0b9cc 100644
--- a/meta-oe/recipes-devtools/memstat/memstat_1.0.bb
+++ b/meta-oe/recipes-devtools/memstat/memstat_1.0.bb
@@ -19,6 +19,8 @@ SRC_URI = "http://sourceforge.net/projects/memstattool/files/memstat_${PV}.tar.g
 
 SRC_URI[sha256sum] = "245d5fc7fb87bcfd14486cd34917cae2856e799559ac568434af12c4852bce94"
 
+TARGET_LDFLAGS:append = " ${DEBUG_PREFIX_MAP}"
+
 do_install:append(){
     install -d ${D}${bindir}
     install -m 0755 memstat ${D}${bindir}
-- 
2.34.1


