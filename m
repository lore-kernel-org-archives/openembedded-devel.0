Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A034E83057
	for <webhook@archiver.kernel.org>; Tue,  3 Feb 2026 05:18:02 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10175.1770095873101402016
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Feb 2026 21:17:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=VbGzP820;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6494efc79b=mingli.yu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6134DGx1983946
	for <openembedded-devel@lists.openembedded.org>; Mon, 2 Feb 2026 21:17:52 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=NM70WsUgBN1n739EmMl5
	iRPHcFztUd4r2WSrX+dqIoY=; b=VbGzP820Dy0pi2oEj8/PZmklPlLpxSBhxsCs
	+IM1AwbDtSzfCp4ssUoA5qd4txcax7cyRMUbw7NhmyVo2PM2C3ed1kKrFgqKRaiB
	v5y5wpHHl34IJ6GfaM62fKaAesylcQw/dCC1zR6ca/QAmuCbhkB4sRjzAEHxnpmm
	gLPZcFCVkcXNtHRL6y6PUKGkbwvWcwy44EMm83arIDqzaAPQZ4eYmFEnnlXyx75M
	SykyG5kT2ODxf2Y32MUBmogNgT1hfkk/aieFIyEQM9svHWOGS8PgrraScboFKKC0
	n+vV5+6tytrPNu7Y8iTjCh2jSZVuX8c+InaBrsXgNjJiCOHpqQ==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4c1dw0tr5m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 02 Feb 2026 21:17:52 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Mon, 2 Feb 2026 21:17:52 -0800
Received: from pek-lpg-core4.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Mon, 2 Feb 2026 21:17:51 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-networking][PATCH 3/4] tunctl: Restore DEBUG_PREFIX_MAP in TARGET_LDFLAGS
Date: Tue, 3 Feb 2026 13:17:49 +0800
Message-ID: <20260203051750.2669415-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: e5Q1YGq2GkWjrILuFCgNUtB3HcZlvAPl
X-Proofpoint-ORIG-GUID: e5Q1YGq2GkWjrILuFCgNUtB3HcZlvAPl
X-Authority-Analysis: v=2.4 cv=Htd72kTS c=1 sm=1 tr=0 ts=69818500 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=70VU7I3zxtr6mGxl9BoA:9 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDAzOSBTYWx0ZWRfX4k7WqBq4lToi
 cZlneOTJDCibIcjflVyq9QV4YFQ/Pg/73OPp09Mq9dY/9Kl3bFLD1yW6UtfnhEspEMI9pam0Q/r
 p7QLPmo1MjRYG4dEeuD3flpyJKvgAhUQx3lzXBoWn9/xt+wzEp17QsS9ubDmXRw3W5Ewqn7HNgn
 mMmy9pTezwRqjAJsZK5ILeA9vqt57oq1RQmgkpX+LObUSRNdH0fGFNHwcJ97+IJqpGDU5nIXXGk
 7360fGSy+Lh+h5wM2tQ/TwEUIUJxvlYiRoKxj5T36XX0iemS/SPAwF9IWagS19w8KZJhnpRNsFZ
 nffunlFXPl08DnGgQ+MkepGszYO7N3UOvoVkDPItSzgj7mJBgzCCjDeTnaBPar6x69DiCY8Qg1/
 RzTZhpgUaUI/Jh3tFzkWLJ1BTO2HexLlOWKnff7qjBWyqdt4UuyU6RKsGhQQPhp4250rHtVf9vh
 7J8eNQPicG8hmwMh5VQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_01,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 malwarescore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602030039
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Feb 2026 05:18:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124095

From: Mingli Yu <mingli.yu@windriver.com>

oe-core has removed DEBUG_PREFIX_MAP from TARGET_LDFLAGS [1], restore
it to fix the below error.

ERROR: tunctl-1.5-r0.wr2401 do_package_qa: QA Issue: File /usr/sbin/.debug/tunctl in package tunctl-dbg contains reference to TMPDIR [buildpaths]
ERROR: tunctl-1.5-r0.wr2401 do_package_qa: Fatal QA errors were found, failing task.

[1] https://git.openembedded.org/openembedded-core/commit/?id=1797741aad02b8bf429fac4b81e30cdda64b5448

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta-networking/recipes-support/tunctl/tunctl.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-support/tunctl/tunctl.inc b/meta-networking/recipes-support/tunctl/tunctl.inc
index 5b759d32b6..1e7bc5a9fc 100644
--- a/meta-networking/recipes-support/tunctl/tunctl.inc
+++ b/meta-networking/recipes-support/tunctl/tunctl.inc
@@ -9,6 +9,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/tunctl/tunctl-${PV}.tar.gz \
 
 inherit sourceforge-releases
 
+TARGET_LDFLAGS:append = " ${DEBUG_PREFIX_MAP}"
+
 do_compile() {
     oe_runmake tunctl
 }
-- 
2.34.1


