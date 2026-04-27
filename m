Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2133BFF8861
	for <webhook@archiver.kernel.org>; Mon, 27 Apr 2026 09:00:56 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39562.1777280452499980271
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Apr 2026 02:00:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=SFqjYeMm;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8577a39c7a=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R5e1eq897982
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 Apr 2026 09:00:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=d6GCVwxoNYfZl/Gle3XB
	izw5ZCmTWMg83BXqA52wgz8=; b=SFqjYeMmslue5jccyArZXX5wWstQyiIt0cfQ
	OXcfi2SyXt2zMnv1oYG9A2LVhvFMgynjFIXnXNCzwZLNOSZqylHR3/WfNLLiKpDo
	tV9DAX7cHVRBUUdU44837rHWdxPo2Hbp+w6YRrQT2RUeQroK4bGmxCMleij4sddF
	2HEU/QgnK8BeMy8PftQnUexDHCS8n4caIJYFsoBYee9JcXy47XS9W877u0S4k4bC
	YNU0k875m0l17G4TCNzVc2AQZ4bm4yQ+ZOsWN+hoFBGvO7JsHa7wg9TbAkiLFRUo
	/lbEz7BKg9HL5sOcfDZ/3uO9lDZGUiK95DkeqfGSYOAc1INASg==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4drmk6ssyt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 Apr 2026 09:00:51 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Mon, 27 Apr 2026 02:00:50 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Mon, 27 Apr 2026 02:00:49 -0700
From: <jiaying.song.cn@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH] python3-blivet: switch from setuptools3_legacy to python_setuptools_build_meta
Date: Mon, 27 Apr 2026 17:00:48 +0800
Message-ID: <20260427090048.969888-1-jiaying.song.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: PZmtbBe4j1wv0I69loMrU6DztY-_PfO-
X-Proofpoint-GUID: PZmtbBe4j1wv0I69loMrU6DztY-_PfO-
X-Authority-Analysis: v=2.4 cv=RN6D2Yi+ c=1 sm=1 tr=0 ts=69ef25c3 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=fTW__CHxibyLmBMfj2wP:22 a=t7CeM3EgAAAA:8 a=aRf59lXNCwPQp_mc0bgA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDA5NCBTYWx0ZWRfXyaLFtJOvfDRX
 8W1y6BK/iMfuse4jwH31dpWbwo0LxEp2b3pw9d/rjVY0K2sgjNYgGLpXwOOuaGPl2QniSwrpJGR
 cLsji0jIeMIFiSfVMd29N3oXpj75q9zghOW+POrFf3wD+ccz4uWCMbDnG5JMkER5BLAK5mKyJyz
 yNnNc7WAWwEns1fRaMiT5btH+aHfcPlBpxtdnSH7dCLArzJLg6rHp0+T7CDxZA/hVI7KBgO7Zvy
 55sFdic0CogTKxxVi/h7ColivqlcvOF/CIyf3R/Bc44V2pTk90Vojg/U0BWi6wfuE+cDKYyD3Hi
 VQsj9v5Lc5+QunIrAlB1s+xzpgSjLC/dZGWzpn1Rvk5t4wkg5ffwPWMumjRL1jiGO0izSGrovoG
 4mod9IkUd7iQ7gCqkKQFtvMsr1URgEKjthhNvFi+OX5tlBDX2Grq6b+FcrNhf+1crWCfMF1vnIj
 +R/qrLdH78PSYCmxbvA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270094
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Apr 2026 09:00:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126636

From: Jiaying Song <jiaying.song.cn@windriver.com>

Upstream blivet 3.13.2 ships a pyproject.toml declaring
setuptools.build_meta as its PEP 517 build backend. Update the recipe to
use the correct build class to resolve the pep517-backend QA warning.

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
---
 .../recipes-extended/python-blivet/python3-blivet_3.13.2.bb     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-extended/python-blivet/python3-blivet_3.13.2.bb b/meta-python/recipes-extended/python-blivet/python3-blivet_3.13.2.bb
index a159979b73..69ec8c0487 100644
--- a/meta-python/recipes-extended/python-blivet/python3-blivet_3.13.2.bb
+++ b/meta-python/recipes-extended/python-blivet/python3-blivet_3.13.2.bb
@@ -17,7 +17,7 @@ SRC_URI += "\
 "
 SRC_URI[sha256sum] = "6d8374d05eeab513b2a26cf01267e853df7b31e13ad1a1ba7d73a856190d0518"
 
-inherit pypi features_check systemd setuptools3_legacy
+inherit pypi features_check systemd python_setuptools_build_meta
 
 REQUIRED_DISTRO_FEATURES = "systemd"
 
-- 
2.34.1


