Return-Path: <saravanan.kadambathursubramaniyam@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05FA0CFD376
	for <webhook@archiver.kernel.org>; Sun, 30 Nov 2025 11:08:44 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2307.1764500918623904060
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Nov 2025 03:08:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=GFyfxnfU;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4429d7dc3a=saravanan.kadambathursubramaniyam@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AUB0GVD3633437
	for <openembedded-devel@lists.openembedded.org>; Sun, 30 Nov 2025 03:08:38 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=ve9IudjMahe1mXu+Qc41
	xHTLzndYV+Tk1I/MnadtDVQ=; b=GFyfxnfUhBHi0HylnBjKfqlMdpfO/HLWTgqa
	1idbmInIV0vnmaOXuoyc0EpkYdUdDAaHX5oWW50rUn9oYcTWQP2cIkj0pqMHMIL7
	l/KW0fBX3cqnwxjPfD4r2oXq6CkKbmvxgfnHLtv7fue1q+NWPKxVfQidPvsVjodo
	mi6mnRTPJ/HCBmC9ZBS9pk/2iZA4g5OU/ahuGZmvsIqxJZmmUONjqtAGf2KMztLs
	Yh0QOm23LNoFZWs8cWP3xKg1lHDuhZlhqDbd+R9G/VWW2RgrFWMO2tQuzrztrLgJ
	/VxDopF05xswQfeZhuNCstTyQAz80PmRi8jPecWpBs+n73EAow==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aqw05gp4v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 30 Nov 2025 03:08:38 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Sun, 30 Nov 2025 03:08:37 -0800
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Sun, 30 Nov 2025 03:08:35 -0800
From: Saravanan <saravanan.kadambathursubramaniyam@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][kirkstone][PATCH 1/1] python3-django: upgrade 3.2.23 -> 3.2.25
Date: Sun, 30 Nov 2025 16:38:34 +0530
Message-ID: <20251130110834.2996649-1-saravanan.kadambathursubramaniyam@windriver.com>
X-Mailer: git-send-email 2.35.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: nr5gc-SWM6xID2G-_x-1fz3djoIUw4gH
X-Authority-Analysis: v=2.4 cv=ddyNHHXe c=1 sm=1 tr=0 ts=692c25b6 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=ArP49Si0AAAA:8 a=t7CeM3EgAAAA:8
 a=tVqPZ_fz8QdllDP6OikA:9 a=glZLBWN_5F3qvmUqPDV8:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: nr5gc-SWM6xID2G-_x-1fz3djoIUw4gH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTMwMDA5NCBTYWx0ZWRfX/K7v117ST2zL
 nh+Sj4OW5kEpMlRN5AbydDFhmByQecwH9LZsWd8JmGnVsJ00dGRD1QMvQfZkBOqA/oVc0HU3aDS
 +voT/vRhWFa4/DILO+7aSNWlPoEa7SPXQlseQZn2LC+qLEeMjczfYfkp6EOBMZ6DQyjkiuX9I4f
 6h+KsY/3LfhasRxlj52bY5XtPUr54i20nrAS88tC1IoDADri6kZ9sJ9M/FQe7VYJMrDCjuWHdpb
 PdeazgIHPcwcrXS7KJrOUUPWB+MQyJqLHc5QCqo0G9wroRZyRCe/eilPnj1KWHw792+IYD8K02/
 F9VpaOEeicHN6r0TIga+Rx8f/2h9qXL9X0AT0sMhENd8geX8wzxEj2+08t+bq4M6RDgIN10ETrS
 3Tv5GcN26OlH6DrJGoxio3g+nMRFOw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511300094
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 30 Nov 2025 11:08:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122162

Fixes CVE-2024-27351, CVE-2024-24680 and other bugfixes.

Release notes:
https://docs.djangoproject.com/en/dev/releases/3.2.24/
https://docs.djangoproject.com/en/dev/releases/3.2.25/

Signed-off-by: Saravanan <saravanan.kadambathursubramaniyam@windriver.com>
---
 .../{python3-django_3.2.23.bb => python3-django_3.2.25.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-django_3.2.23.bb => python3-django_3.2.25.bb} (61%)

diff --git a/meta-python/recipes-devtools/python/python3-django_3.2.23.bb b/meta-python/recipes-devtools/python/python3-django_3.2.25.bb
similarity index 61%
rename from meta-python/recipes-devtools/python/python3-django_3.2.23.bb
rename to meta-python/recipes-devtools/python/python3-django_3.2.25.bb
index beecaa607c..29977fa013 100644
--- a/meta-python/recipes-devtools/python/python3-django_3.2.23.bb
+++ b/meta-python/recipes-devtools/python/python3-django_3.2.25.bb
@@ -1,7 +1,7 @@
 require python-django.inc
 inherit setuptools3
 
-SRC_URI[sha256sum] = "82968f3640e29ef4a773af2c28448f5f7a08d001c6ac05b32d02aeee6509508b"
+SRC_URI[sha256sum] = "7ca38a78654aee72378594d63e51636c04b8e28574f5505dff630895b5472777"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-sqlparse \
@@ -9,5 +9,5 @@ RDEPENDS:${PN} += "\
 
 # Set DEFAULT_PREFERENCE so that the LTS version of django is built by
 # default. To build the 3.x branch, 
-# PREFERRED_VERSION_python3-django = "3.2.23" can be added to local.conf
+# PREFERRED_VERSION_python3-django = "3.2.25" can be added to local.conf
 DEFAULT_PREFERENCE = "-1"
-- 
2.35.5


