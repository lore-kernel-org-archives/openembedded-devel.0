Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 268A8CCFA04
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 02:43:03 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39.1762310579666473067
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Nov 2025 18:42:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=CtdE+G8u;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3404a64814=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A51sF121812918
	for <openembedded-devel@lists.openembedded.org>; Wed, 5 Nov 2025 02:42:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=7NBWl2QTZyv5U225oVs6
	ej2s7zhEAx+X4MPvo+i04NM=; b=CtdE+G8uTTYCO3TwhczvAqLnxY2PL9ZrKSCi
	Nw69fqWpr31yKtAt+1uz7xI6GxRKX3t7Fngwr7Z0ufI0sYYL0iq+lqtjMimkOhhC
	chkA2kY+9bqezEuttUeU9cmmqZJMC9MKo64l3EocICgUPq+MY2W4RopEd4jpODMF
	pM9RBGjZLN1o2DjB7xCxjQUwRD40njD6krlGsxMhrRF13WnBy628UwWd6XjlWAby
	z9r7rfbzxo7y91pnRSlwK62IzIS6Hir0zte27ZPAoGlZ7Q/In2h9Q7BRRbCGuppo
	37m5QIXmVtF3LWSVCa7YslBC4KpB7f4hIHP7FRRWY1a3fJYdtw==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a7war8194-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 05 Nov 2025 02:42:58 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Tue, 4 Nov 2025 18:42:57 -0800
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Tue, 4 Nov 2025 18:42:57 -0800
From: <jiaying.song.cn@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] minifi-cpp: fix python shebang in minifi-python-examples
Date: Wed, 5 Nov 2025 10:42:56 +0800
Message-ID: <20251105024256.2037233-1-jiaying.song.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=UYJciaSN c=1 sm=1 tr=0 ts=690ab9b2 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8
 a=HsSA6g-maf90pnkv3jEA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDAxNSBTYWx0ZWRfXzy7C+onWSRL6
 tcDtRTSTGQ64sOHoHKQUfhltXQZHc/78I6Sy1p3Gx/5QDbu12VAESM69Rtj0cJzbZAfX+yQ0Hb3
 L9eReQGx2j+s3ac5NwOY4z9NdlJalAZXgUj7FJberzi+wXJ1+MP0Hyfh1p7NsA3VG7MoTNjoQSA
 tp2AMyGmIXkC6KgkWilUqaOynonzUwkZ6xL+PEPUAj5CLCF7XnhM7xp0QOOaTnljrsSQ6ZmIW3o
 wEQ6fpYZMUHFAw7ydER+0RUjhZnQIT6Cyohv6U/xXUBUr7l26pQOUW6j6XRJLg3aoKB5qUwlDCT
 JB7+cTD2QgAoiKOVtuDCod9inaecrW1Oo+6MDa9tIXQMc2RbPhh0v0RPa1wZ3NaMG7DT41qt4fT
 M8XFmsnWn+vXl1LwzNurnf8jyQNtjQ==
X-Proofpoint-GUID: JRZrngIVtJpVHBMWFYYkxcuEL99lqom4
X-Proofpoint-ORIG-GUID: JRZrngIVtJpVHBMWFYYkxcuEL99lqom4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_01,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511050015
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Nov 2025 02:43:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121315

From: Jiaying Song <jiaying.song.cn@windriver.com>

Replace '/usr/bin/env python' with '/usr/bin/env python3' in the scripts
under ${libexecdir}/minifi-python-examples.

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
---
 meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.99.1.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.99.1.bb b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.99.1.bb
index f4d206c154..28c1063ceb 100644
--- a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.99.1.bb
+++ b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.99.1.bb
@@ -207,6 +207,11 @@ do_install() {
 
         sed -i "s|@MINIFI_LOG@|${MINIFI_LOG}|g" ${D}${sysconfdir}/default/volatiles/99_minifi
     fi
+    
+    for ss in $(find ${D}${libexecdir}/minifi-python-examples -type f); do
+        sed -i 's,/usr/bin/env python$,/usr/bin/env python3,' "$ss"
+    done
+
 }
 
 pkg_postinst:${PN}() {
-- 
2.34.1


