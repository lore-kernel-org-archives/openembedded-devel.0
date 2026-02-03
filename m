Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB0BBE83055
	for <webhook@archiver.kernel.org>; Tue,  3 Feb 2026 05:17:12 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10348.1770095826489069037
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Feb 2026 21:17:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=mdfPeyyE;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6494efc79b=mingli.yu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6134DGwv983946
	for <openembedded-devel@lists.openembedded.org>; Mon, 2 Feb 2026 21:17:06 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=TcT8C6LlBDV6OwJn9rtV
	aHEO3I/QGsNt4rbpggPiQwc=; b=mdfPeyyESjSfY60Idn/UWoTyFdECaGemC7T9
	xh+vK2G2uX/pMgeorn8k7X0wA2H4Hkw38+xmep70veAGTq4DvfHMy0liuMBtUgHq
	VvFuGDMYSe9AKAUmRUt9RDiTQtcXI+fN5FL1qQLXQdDz/ZMkQ0wfx+uDTtaJUmKp
	339MxSShSVISfjJZYwdZdPjScz8vUrIfVduW+GRlvBgL/rXnl+askQaduxFvNUN2
	/Y1+7SDS8F9yOjCz4na1anCAhjSTrf9MmRiSz24Do2xCjFUqfwxMgy5HWEUCQBJ0
	tVM7rcWHCcmO7E3mYQCshZlsFi60Oie8Kyg6JtDTlGdrHdVDyg==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4c1dw0tr4k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 02 Feb 2026 21:17:05 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Mon, 2 Feb 2026 21:17:05 -0800
Received: from pek-lpg-core4.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Mon, 2 Feb 2026 21:17:04 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH 1/4] valkey: Restore DEBUG_PREFIX_MAP in TARGET_LDFLAGS
Date: Tue, 3 Feb 2026 13:17:02 +0800
Message-ID: <20260203051703.2668668-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: _jqxzuSUfgthhe-DM5mml_sLo4vFQmUJ
X-Proofpoint-ORIG-GUID: _jqxzuSUfgthhe-DM5mml_sLo4vFQmUJ
X-Authority-Analysis: v=2.4 cv=Htd72kTS c=1 sm=1 tr=0 ts=698184d1 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=_hF8pi8tmasTCb-RpiQA:9 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDAzOSBTYWx0ZWRfXyp0AgOvwWucF
 gE0FD1sLrv7kVtCD4sNtpv3qszNHJ2qZUPITqEJzidTgnyk5gIYZPRenoW9l+iD5MlGT5htFqdH
 LPvqJlPlJBw2ZBU/j6wni74Ar6esVHgXFY58c81NIWzwWfkZRNxs6aadRdGmeCMctTI7hOuxqI8
 WG12OmSc96Ut2TfUgfEvOvPJulzag8WRFhjL54h1Vw5j0CcOPuirkae0TyW6mIV3Hz6hTGa263U
 DsozDnXFawdZYeOUufETVkO4mfr6bpDrh1uLFxDKFm0lt5U8uuEKMEJyIvgjyE6ehB4grZEHzax
 2rnOD/2y8JeOAqZzu4pSdZKvOn4p5yd1Zdk5aS3cRr9mb3YCwr5A1l6pAn/F0tk9QnTcIXqOX4P
 sZ4fnxHnrQfw3cw4gQYLB7TuBAsagrAJ16Ws01cs2Xa8oXARV+FdGtZu9zZGksTsF00trIss+8/
 ndJW08j8Mo6Z2yUln+w==
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
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Feb 2026 05:17:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124093

From: Mingli Yu <mingli.yu@windriver.com>

oe-core has removed DEBUG_PREFIX_MAP from TARGET_LDFLAGS [1], restore
it to fix the below error.

  ERROR: valkey-9.0.1-r0.wr2600 do_package_qa: QA Issue: File /usr/bin/.debug/valkey-cli in package valkey-dbg contains reference to TMPDIR [buildpaths]
  ERROR: valkey-9.0.1-r0.wr2600 do_package_qa: QA Issue: File /usr/bin/.debug/valkey-server in package valkey-dbg contains reference to TMPDIR [buildpaths]
  ERROR: valkey-9.0.1-r0.wr2600 do_package_qa: QA Issue: File /usr/bin/.debug/valkey-benchmark in package valkey-dbg contains reference to TMPDIR [buildpaths]
  ERROR: valkey-9.0.1-r0.wr2600 do_package_qa: Fatal QA errors were found, failing task.

[1] https://git.openembedded.org/openembedded-core/commit/?id=1797741aad02b8bf429fac4b81e30cdda64b5448

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta-oe/recipes-extended/valkey/valkey_9.0.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-extended/valkey/valkey_9.0.1.bb b/meta-oe/recipes-extended/valkey/valkey_9.0.1.bb
index 1f27224772..5b05bc2fe1 100644
--- a/meta-oe/recipes-extended/valkey/valkey_9.0.1.bb
+++ b/meta-oe/recipes-extended/valkey/valkey_9.0.1.bb
@@ -21,6 +21,8 @@ RPROVIDES:${PN} = "virtual-redis"
 
 inherit pkgconfig update-rc.d systemd useradd
 
+TARGET_LDFLAGS:append = " ${DEBUG_PREFIX_MAP}"
+
 FINAL_LIBS:x86:toolchain-clang = "-latomic"
 FINAL_LIBS:riscv32 = "-latomic"
 FINAL_LIBS:mips = "-latomic"
-- 
2.34.1


