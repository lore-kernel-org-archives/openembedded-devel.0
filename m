Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE665EB8FAD
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 09:12:40 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.4336.1693991558267064236
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Sep 2023 02:12:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ZAxd+2ia;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=76132f5a4a=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 386601r9018596
	for <openembedded-devel@lists.openembedded.org>; Wed, 6 Sep 2023 09:12:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=VEGd1
	sHSM42fw7ZT/zz8J1cr2U7dxTtsj4d2qj8k4ko=; b=ZAxd+2ia1KU34zCY3CsXc
	bLBzZNsrHL9zT5xFQsEj4z0b7Kt9jif7dtWGZxm0VmRoShMoj3AGJscHQUIJcteh
	+CPIju3d9HyV6Y5k8FvukkP+DdEMp45o1lqD+v4W8Dx0DYOh6TI5Dbc+e0bAUliP
	WzxjwvBZjeU/ljN4sTNTz0ZrrpZ+vD+S6iAh6jOwrywt5WxG6SdbjynBZxuY8A8i
	iAvaQ9nZQ4/h3AEnAx6+MzHCj8nI79zoJ6Ay3pngPNDNu0FiJkpH+O+2SggxF7PK
	wM5ZfUmKmLUEzy5JVUNomdqbe21jJqjDpFRSvgdCTAJ5VBII4Z+EcuqS7PPn4wlQ
	w==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3suv15ucke-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 06 Sep 2023 09:12:37 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 6 Sep 2023 02:12:33 -0700
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][kirkstone][PATCH 1/1] iperf3: upgrade 3.11 -> 3.14
Date: Wed, 6 Sep 2023 09:12:16 +0000
Message-ID: <20230906091216.816242-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: DE9SqGA_ZPmzD9qLlhyOLiBp8OOOd1qU
X-Proofpoint-GUID: DE9SqGA_ZPmzD9qLlhyOLiBp8OOOd1qU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-06_03,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 mlxlogscore=953 bulkscore=0
 suspectscore=0 malwarescore=0 adultscore=0 mlxscore=0 impostorscore=0
 phishscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2309060077
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Sep 2023 09:12:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104772

From: Soumya Sambu <soumya.sambu@windriver.com>

Upgrade iperf3 to 3.14

Fix CVE-2023-38403 and other bugs.

The iperf3 release notes are available at:
https://github.com/esnet/iperf/blob/99d738f496c96fd4fb50f45142e0bbc96bf71698/RELNOTES.md

The only change in the LICENSE file was the year update:
https://github.com/esnet/iperf/commit/6bfe27d82a3f74ad1239aba987a4fb75c1005078

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 .../iperf3/{iperf3_3.11.bb => iperf3_3.14.bb}                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-benchmark/iperf3/{iperf3_3.11.bb => iperf3_3.14.bb} (89%)

diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3_3.11.bb b/meta-oe/recipes-benchmark/iperf3/iperf3_3.14.bb
similarity index 89%
rename from meta-oe/recipes-benchmark/iperf3/iperf3_3.11.bb
rename to meta-oe/recipes-benchmark/iperf3/iperf3_3.14.bb
index 2142a8ef1..d181eb3b0 100644
--- a/meta-oe/recipes-benchmark/iperf3/iperf3_3.11.bb
+++ b/meta-oe/recipes-benchmark/iperf3/iperf3_3.14.bb
@@ -11,14 +11,14 @@ BUGTRACKER = "https://github.com/esnet/iperf/issues"
 AUTHOR = "ESNET <info@es.net>, Lawrence Berkeley National Laboratory <websupport@lbl.gov>"
 
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=68ae8cfc577a2c8c51bb51e9628e80b7"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=dc6301c8256ceb8f71c9e3c2ae9096b9"
 
 SRC_URI = "git://github.com/esnet/iperf.git;branch=master;protocol=https \
            file://0002-Remove-pg-from-profile_CFLAGS.patch \
            file://0001-configure.ac-check-for-CPP-prog.patch \
            "
 
-SRCREV = "76bd67f6e90e239a7686202d2b1b595159826d24"
+SRCREV = "a0be85934144bc04712a6695b14ea6e45c379e1d"
 
 S = "${WORKDIR}/git"
 
-- 
2.40.0


