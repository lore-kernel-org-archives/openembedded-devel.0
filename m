Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8896CAC5A5
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 04:45:43 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.5217.1758689141025454625
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Sep 2025 21:45:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=EGXwS/Pj;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1362597ed5=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58O4V7OV3952125
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 04:45:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=ZRQq6cWhpde6uskSyi5x
	7iNXpEBs4mRXhlFLop+tu9I=; b=EGXwS/PjvkTX+LJcm7Ht6H33dggO5qJllTcv
	L6Z8UNKKB9KIJhn3y/LhrWsnP8YhuihPXroFMFKay4z+WQLaPtpPLKT1exY5AUMc
	KglWAfCkweTvCAk3srgQNTFhPtBOOqkFMK9DqW1FSG4qSIbv2cHuEF/4AKeTI3P8
	T/0BEl10r8GvjQuY0VfPqBDJm3B6EEaNktVGBrmsbjAtpryn3JVup6YNY7ZJ18gn
	PKoDdcb561xx9hBS+pZ39OQYXRLmrcgHwcBnzuFnYcKxS6gBDFh68lLgGH9vX227
	QXi7wPusOpbUGp1JCPjjf4w/r9KFH4udWp7YxoxZwTCdV9d8+A==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 499k89c7w0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 04:45:39 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Tue, 23 Sep 2025 21:45:38 -0700
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.59 via Frontend Transport; Tue, 23 Sep 2025 21:45:37 -0700
From: <archana.polampalli@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-networking][walnascar][PATCH  1/1] tcpreplay: upgrade 4.5.1 -> 4.5.2
Date: Wed, 24 Sep 2025 10:15:34 +0530
Message-ID: <20250924044534.4159522-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI0MDAzNyBTYWx0ZWRfX9nc20b/OaCU1
 OyGIR4AMl/DuLRbKRhPynD81pYffaMmeDXwLYoidoxHlBTi1E4Ja3ATo7SfZKEwmJtlZhFEn0r6
 Q9dJo1qgp3mfyTCa9erPpmLbFy+m0pJxNKGEJKbxIzs729wnjhkk254Md0tEUYqK9mgG/1BKIaX
 RaHMjEYEzrzYz1OPDtoHU2pLwlVnmzQorrd3E4U4WHFrvF0WuReCTJJJ/v/CVjH76nu5ms7B4c6
 GfVUobi/e6Y4G66fs+VZrXO5cDNhTvz5OPHFpnztb+l9GSFpI3PxPDBRR095nJvl7JjnZU/UbxJ
 5Irk5UFw5zOzXW6ZJtUlSm6B/0ZntTzZyd6VQdkQWw0aG7flrK8CusEZOH1J4Y=
X-Authority-Analysis: v=2.4 cv=YZS95xRf c=1 sm=1 tr=0 ts=68d37773 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=4appmw-hzXQA:10 a=yJojWOMRYYMA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=i9Y1GAz_YsDBN8rhK6IA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: kgY5y4yEJEioG6HMZ1fhz1tvVfQTkOI5
X-Proofpoint-ORIG-GUID: kgY5y4yEJEioG6HMZ1fhz1tvVfQTkOI5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-23_08,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 impostorscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 04:45:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119750

From: Archana Polampalli <archana.polampalli@windriver.com>

Changelog:
https://github.com/appneta/tcpreplay/releases/tag/v4.5.2

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../tcpreplay/{tcpreplay_4.5.1.bb => tcpreplay_4.5.2.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/tcpreplay/{tcpreplay_4.5.1.bb => tcpreplay_4.5.2.bb} (88%)

diff --git a/meta-networking/recipes-support/tcpreplay/tcpreplay_4.5.1.bb b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.5.2.bb
similarity index 88%
rename from meta-networking/recipes-support/tcpreplay/tcpreplay_4.5.1.bb
rename to meta-networking/recipes-support/tcpreplay/tcpreplay_4.5.2.bb
index f01bbb95a5..96a7087b0b 100644
--- a/meta-networking/recipes-support/tcpreplay/tcpreplay_4.5.1.bb
+++ b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.5.2.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://github.com/appneta/${BPN}/releases/download/v${PV}/${BP}.tar.
     file://0001-libopts.m4-set-POSIX_SHELL-to-bin-sh.patch \
 "
 
-SRC_URI[sha256sum] = "2de79bfd67ec92ca9ae2ffb50456dd1d53ff40f3fa71b422c65e8062013c9e85"
+SRC_URI[sha256sum] = "ccff3bb29469a04ccc20ed0b518e3e43c4a7b5a876339d9435bfd9db7fe5d0f1"
 
 UPSTREAM_CHECK_URI = "https://github.com/appneta/tcpreplay/releases"
 
-- 
2.40.0


