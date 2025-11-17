Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98A4BCD4F3E
	for <webhook@archiver.kernel.org>; Mon, 17 Nov 2025 02:44:39 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.70.1763347470319613859
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 16 Nov 2025 18:44:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=n1m1vB6Y;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3416890ff6=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AH1QBYE248046
	for <openembedded-devel@lists.openembedded.org>; Sun, 16 Nov 2025 18:44:30 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=s7CIYyykFEjokw10eXsl
	XHb46wtoCHVwZLawurdfmaQ=; b=n1m1vB6YQMklRmbebGk1mq916skpoSgwBzWH
	gf4EkBHrLdpuOwMWEv40OjZGunRSW4oFI9Qdeb3hF8FId83gTdmrUFjOrkOXrNvR
	BgQFPcchM2eTXe98vN+okQGy7T5zzTohcZ8JtxgXjR733vHBWsEd2koa2n9nNZkM
	EyiG/ETV1Epg5VFksTwsY29KcCAZPcBvIiEofZ1d2Q5bK0U00lDYas6pYhtlAbvb
	oIMOs04s9JdTZ/Yyw7wNQyR3PrZ0s5z7QNXlCIatUm2bV6ZHv7VOoP0lv79gUbJH
	pPSYpiQpsFNjp1gBacilrXYS9aCmX5tMKxvn78g+XDdAvswrxg==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aeswj96kr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 16 Nov 2025 18:44:29 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Sun, 16 Nov 2025 18:44:28 -0800
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Sun, 16 Nov 2025 18:44:28 -0800
From: <jiaying.song.cn@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][scarthgap][PATCH] minifi-cpp: fix python shebang in minifi-python
Date: Mon, 17 Nov 2025 10:44:27 +0800
Message-ID: <20251117024427.964131-1-jiaying.song.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=BqiQAIX5 c=1 sm=1 tr=0 ts=691a8c0d cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8
 a=HsSA6g-maf90pnkv3jEA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: HUUF2BVS73XeXpPfgt0OWAjz3Nj-y_rL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDAyMSBTYWx0ZWRfX4K2dkqS7dol8
 adGH8A7+I3f65B2Vn03/CpR2DYv63cIh6p2v6zRk+iH9EU2Fl9CbZMFWfxqUAHcnpsDzE9I2+i4
 pKMzTM6NfR4d7H4l3aiMJ73ytfR1uuT+j7WJHl4PfRESH+xNpGsww3C6outkICDuQ2YKUKPLRID
 frfYZh3knzvXZcDLSwsyEOjB1ZRpVjQdXcibWZU1mmZRIETBtPQTi3ICFn1IYB3PLWVjzXMGiBO
 mFZf3dljDzUHpjamNfStYyaAQzQrZKoN7p8dXQwTDaqFlhrFzMorlsgRDs5tThFSN2TOY5dQctg
 /BaYCv+uVtprrKv4IeAcCMPu1BAPFEi/TzmnAI/2U5iFjZIyvn77AJo/Mphc3BxNbjzbfDre3Cg
 U2oiTP9FyJYA9YagHQ0bjkKidglk2Q==
X-Proofpoint-ORIG-GUID: HUUF2BVS73XeXpPfgt0OWAjz3Nj-y_rL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_01,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170021
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Nov 2025 02:44:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121751

From: Jiaying Song <jiaying.song.cn@windriver.com>

Replace '/usr/bin/env python' with '/usr/bin/env python3' in the scripts
under ${libexecdir}/minifi-python.

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
---
 meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.15.0.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.15.0.bb b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.15.0.bb
index f84f018ea9..fee161b66f 100644
--- a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.15.0.bb
+++ b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.15.0.bb
@@ -179,6 +179,10 @@ do_install() {
 
         sed -i "s|@MINIFI_LOG@|${MINIFI_LOG}|g" ${D}${sysconfdir}/default/volatiles/99_minifi
     fi
+    
+    for ss in $(find ${D}${libexecdir}/minifi-python -type f); do
+        sed -i 's,/usr/bin/env python$,/usr/bin/env python3,' "$ss"
+    done
 }
 
 pkg_postinst:${PN}() {
-- 
2.34.1


