Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDF7CCCFA05
	for <webhook@archiver.kernel.org>; Thu,  6 Nov 2025 03:28:02 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6817.1762399679665205736
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Nov 2025 19:28:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=gKm8vKGs;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3405fe8ad1=mingli.yu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A54AO1u1459459
	for <openembedded-devel@lists.openembedded.org>; Wed, 5 Nov 2025 19:27:59 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=KNQmvEhHceut2vnNpHOP
	FZb2b57M5alH0D3YaBCju3c=; b=gKm8vKGsoR4/wDFXJRiawZNwT+tjnLJBqf/y
	O3reYxU0U6JGenMIxNEIL4q5DQBcS/MS0GbADqPCduhdms5rq3975KMmin62dfwL
	PzPJvPiTmjQvZ1DwTyrms0gNeh9RFv5u1/iReNA3rzjG7pVLQOcjTKp61vjAq6H4
	Utq6dCfT5RVkp95k8+3bRVpcxQ6qCG/nw7nAGfYF5/3N7dv78sugCcbSiwfn7K/P
	izG4JKo7FAoXb6debhYYasxt4XCuXWY0SgeI3arYM4hN0KDvkxVZ2IKJMVGr3DKe
	U/FIlzS+CLlS7I+zZ21B/suWHVpJO9Fg7jgeO/ZfNO1VSWpcUQ==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a7wd7ht3r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 05 Nov 2025 19:27:58 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 5 Nov 2025 19:27:26 -0800
Received: from pek-lpg-core4.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 5 Nov 2025 19:27:25 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] inotify-tools: Unify the ptest output
Date: Thu, 6 Nov 2025 11:27:24 +0800
Message-ID: <20251106032724.3673834-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: retx2WuZuW_HtXh72-hoBDJhK3_xmwTE
X-Authority-Analysis: v=2.4 cv=Dacaa/tW c=1 sm=1 tr=0 ts=690c15be cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=iGHA9ds3AAAA:8 a=t7CeM3EgAAAA:8
 a=E3T7-d-XP9kSkw_fCwQA:9 a=fS_x-ByTmYwA:10 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: retx2WuZuW_HtXh72-hoBDJhK3_xmwTE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA2MDAyNSBTYWx0ZWRfX7X0oFNGnD1K+
 Cn095vNKQ85wJHfM+IVyye++FpRcRYb888oafBoJ2BxVGo2o6atUxJAwHiYBHBO5x3Vhkc5W66k
 7jmeWQgvYXhJFE3jMHBGWdz07sDHuO9CEo96XJ3mAD6YaNwBWVpDGmaVGiuEftXo2ilURwZirWx
 nbydiJ+CCN+/s2ZqaTrheLFdaAql2YS1qiODiLGf+Lqm2LHH7fRwNkto96HlmO299SXR+NMTRFN
 6+FkHpSFX3Zuzm5NrSp1NV8gQDu91wgqPNUmsWaFuS+uEWWEBqzsZt607yqUSADImDnsemvgTYk
 tA5l3Kbgut65cVNo8oMFjSCOk5dZNZBZZcfcqkScYNeUIHINnK+NyIs38qmRDifpAnFXEoI0cQz
 bK5IajKIaqxA+xgaTRNP1OrSCcpTEw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_09,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 clxscore=1011 phishscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511060025
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Nov 2025 03:28:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121356

From: Mingli Yu <mingli.yu@windriver.com>

Make the ptest output in the format [1] used by Automake like
result: testname

[1] https://docs.yoctoproject.org/dev/test-manual/ptest.html#testing-packages-with-ptest

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta-oe/recipes-support/inotify-tools/files/run-ptest | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/inotify-tools/files/run-ptest b/meta-oe/recipes-support/inotify-tools/files/run-ptest
index 1bd51248d8..ac3d7e717e 100644
--- a/meta-oe/recipes-support/inotify-tools/files/run-ptest
+++ b/meta-oe/recipes-support/inotify-tools/files/run-ptest
@@ -13,9 +13,11 @@ echo "$output"
 # Evaluate result based on exit code
 if [ $status -eq 0 ]; then
     echo "All tests passed successfully."
+    echo "PASS: inotify-tools"
     exit 0
 else
     echo "Test program exited with status $status."
     echo "Some tests may have failed. See output above for details."
+    echo "FAIL: inotify-tools"
     exit 1
 fi
-- 
2.34.1


