Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C632FFD065B
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 08:40:49 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16310.1773218448501896314
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Mar 2026 01:40:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=pkX1qo86;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=75302cc230=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B5W55K591950
	for <openembedded-devel@lists.openembedded.org>; Wed, 11 Mar 2026 08:40:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=mWspYzMkCGCzHG3mIGqb
	nOZYqcQfzU7ezJN4rNCKE+c=; b=pkX1qo867FGYkwb06aZVJXQrFBd7Cbt6V9lr
	hBX0Wo1HpmLb50nA1Im6zOrptqvxs7I2ukMxyeH6CDhcarF10uQclBDRF6/rZJ9V
	kr0buQhZcK2hFfQK0d6ZHWVXN7y4owFIT0VO/5T4UgKqseZOyxX4jxxQ0GgW7Jmx
	qqbtFfsVvmvsnYKz99IeJoZAAvlpleeu9fGDJQNTK/bCON5YYVXIygbL3KX9GlLJ
	Ced6xgmkYx/vURFBljFGypu1KPnbYEHlQoJsLU83JG6wsHEImnflW0NSa1mgywKq
	lR8JNZTP4+c8klFeFDIbv8/3VVu7fJqL4/cdH1XHitUAZq5Dtg==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cty578ayj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 11 Mar 2026 08:40:47 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 11 Mar 2026 01:40:44 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 11 Mar 2026 01:40:43 -0700
From: <jiaying.song.cn@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH] python3-scikit-build: Upgrade 0.18.1->0.19.0
Date: Wed, 11 Mar 2026 16:40:42 +0800
Message-ID: <20260311084042.946059-1-jiaying.song.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 4iAotgpLHA1CFHcIzmJdrsemt1rm449h
X-Authority-Analysis: v=2.4 cv=fpnRpV4f c=1 sm=1 tr=0 ts=69b12a8f cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=fTW__CHxibyLmBMfj2wP:22 a=UXIAUNObAAAA:8 a=t7CeM3EgAAAA:8
 a=DEezSrSbVaBYsu0lQnAA:9 a=a1s67YnXd6TbAZZNj1wK:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 4iAotgpLHA1CFHcIzmJdrsemt1rm449h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDA3MSBTYWx0ZWRfX0idCdeMbDxb6
 YKfxqvOni5VGgpjJcEMTYT78gQDiHdeDuWcJGaw416I+dAICnWuL4stm/p2NRD/7LMhb67QGL5P
 R5Z5pGPzd1lNspwNpad/gOcYaWq29dMRYiymz/1lmDbjOIhGDkiqC+Rf+JTrgQ0xwm7GoXXaPHX
 RpNZT2opk+8QdKs28N14XZZ1lSFYrqsGHOWQLqxyNPsVefX906BmZIAt6D/FOxP5tAoY+swAgpi
 f9PwTqVGI386wiUOcjVirJIu3vk4QBlBylcaN5WyNlcg8y6rWru40h0mH59AIC6HKhKMi9ZVtvs
 39mhTN6ylPMAKGkcqgaO5eYFcdYSwuOa5YdCBrlIL9tL7qU7Pdvu+XDGGWbCG7V7ljTsc9DwTzD
 bTZEbyNIYciIXGqzWgN+XJIznn/zamY/pet0trkF+VACy1RJnbvGWz3XnvorlagIU4BwQKGeTFR
 UK/KL8scjVVB5pmo1fA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 bulkscore=0 clxscore=1011 suspectscore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603110071
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Mar 2026 08:40:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125069

From: Jiaying Song <jiaying.song.cn@windriver.com>

Changelog:
https://scikit-build.readthedocs.io/en/latest/history.html

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
---
 ...n3-scikit-build_0.18.1.bb => python3-scikit-build_0.19.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-scikit-build_0.18.1.bb => python3-scikit-build_0.19.0.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-scikit-build_0.18.1.bb b/meta-python/recipes-devtools/python/python3-scikit-build_0.19.0.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-scikit-build_0.18.1.bb
rename to meta-python/recipes-devtools/python/python3-scikit-build_0.19.0.bb
index 3b2e8b714e..78a9ee29a3 100644
--- a/meta-python/recipes-devtools/python/python3-scikit-build_0.18.1.bb
+++ b/meta-python/recipes-devtools/python/python3-scikit-build_0.19.0.bb
@@ -9,7 +9,7 @@ UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi python_hatchling
 
-SRC_URI[sha256sum] = "a4152ac5a084d499c28a7797be0628d8366c336e2fb0e1a063eb32e55efcb8e7"
+SRC_URI[sha256sum] = "46e1b2d71343d14e4c07d7e60902e673c78defb9a2c282b70ad80fb8502ade2e"
 
 RDEPENDS:${PN} = " \
 	python3-distro \
-- 
2.34.1


