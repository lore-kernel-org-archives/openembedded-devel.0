Return-Path: <Divya.Chellam@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1457BCAC5B9
	for <webhook@archiver.kernel.org>; Tue, 30 Sep 2025 06:14:48 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.18717.1759212886843356809
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Sep 2025 23:14:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Gc1MmDnB;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2368e0b4a1=divya.chellam@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58U2GEPk2490631
	for <openembedded-devel@lists.openembedded.org>; Mon, 29 Sep 2025 23:14:46 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=JiTxxqTH+9hsiXUkgLF0
	vXaKqKSVr4yEDcRKmancT/4=; b=Gc1MmDnBO9LJNU+pEOS6OCFCK7IsMrSCKvHr
	+K6IIbe1cL2fxoIDWyJqAl6yMHnZxtchDyX9hbaTfx9vIzs8kvBZME1su5w41VJS
	R8hnnpJ/jX/WoaVPLk/qJ2sm22v6f++RHAtplPfeLF3xfFHFqybvjsjHmG+cgI5t
	aC6MqqrsbrWJveDho70skJE8MFiKulNGfkFE+FdyLQapfRKzuqFr87AjU/Pkp4Qf
	Mrhnl10e3T3gjD2E0pSX1NcmgOy1mC07FIGhDKrUHnnHIqYeV3/mXWB9iKras9F0
	zZyEoEz/jxBQas3cpYXIuHbL2u/DySssLgRDmFqyyz4kcJ/FPw==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49eb6yju3m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 29 Sep 2025 23:14:46 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Mon, 29 Sep 2025 23:14:44 -0700
From: dchellam <divya.chellam@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][walnascar][PATCH 1/1] cjson: upgrade 1.7.18 -> 1.7.19
Date: Tue, 30 Sep 2025 11:44:20 +0530
Message-ID: <20250930061420.1018845-1-divya.chellam@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.11.232.110]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (10.11.224.121) To
 ala-exchng01.corp.ad.wrs.com (10.11.224.121)
X-Proofpoint-ORIG-GUID: OZ00dzCeoKaBFkmlFEWf_k6NJLaczCi4
X-Authority-Analysis: v=2.4 cv=cYHfb3DM c=1 sm=1 tr=0 ts=68db7556 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=gmxlzscTznEA:10 a=yJojWOMRYYMA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=_kZ2CzdpJkAPpfMizy8A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTMwMDA1NSBTYWx0ZWRfX5vT/ggd9p1QD
 yiY3Ao+PsQjtZzfiimQgvJsOmP+jCipr4fd0DsMsmiaL/qmTAbSfqvtAQe6zQwC+hqzn6Gvg3ry
 SmkJGNGAm+KiWpfcrbgnd0vH76iDLqeb2y5oY8WK8mSYDpMSogim6Ci22vsML65soV9/t40NkY9
 rn1KAgSn1A6+JfndpRHywoJ9jS+OQ+Xy3PtPv6mKw8JxKV3boy9MZAHsLWIcq0BELO5c8+69U3k
 Ad5d3MjALxnE5ZOMPRZHnyVv9R8XCG20yC2vYCIKBP/XNr9jyyO0Bfs8KioGsTrrE6o3iiAZOAk
 bVrb/X/jwa0nxzQ7Lzo45TVsUFi8y05LwaUXQm/XNztCfw824yUOgpq0gBbt9oq/eW+iV5QquRg
 0Omg+Vgw5gYqRBmYwXcJDftC+hCtdQ==
X-Proofpoint-GUID: OZ00dzCeoKaBFkmlFEWf_k6NJLaczCi4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_01,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 phishscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2509150000 definitions=main-2509300055
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Sep 2025 06:14:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120050

From: Divya Chellam <divya.chellam@windriver.com>

This includes CVE-fix for CVE-2025-57052

Changelog:
https://github.com/DaveGamble/cJSON/blob/master/CHANGELOG.md

Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
---
 .../recipes-devtools/cjson/{cjson_1.7.18.bb => cjson_1.7.19.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/cjson/{cjson_1.7.18.bb => cjson_1.7.19.bb} (97%)

diff --git a/meta-oe/recipes-devtools/cjson/cjson_1.7.18.bb b/meta-oe/recipes-devtools/cjson/cjson_1.7.19.bb
similarity index 97%
rename from meta-oe/recipes-devtools/cjson/cjson_1.7.18.bb
rename to meta-oe/recipes-devtools/cjson/cjson_1.7.19.bb
index bdeab3055c..799eb119d6 100644
--- a/meta-oe/recipes-devtools/cjson/cjson_1.7.18.bb
+++ b/meta-oe/recipes-devtools/cjson/cjson_1.7.19.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=218947f77e8cb8e2fa02918dc41c50d0"
 SRC_URI = "git://github.com/DaveGamble/cJSON.git;branch=master;protocol=https \
            file://run-ptest \
          "
-SRCREV = "acc76239bee01d8e9c858ae2cab296704e52d916"
+SRCREV = "c859b25da02955fef659d658b8f324b5cde87be3"
 
 S = "${WORKDIR}/git"
 
-- 
2.40.0


