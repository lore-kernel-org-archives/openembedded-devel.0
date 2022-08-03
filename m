Return-Path: <mingli.yu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00256C19F28
	for <webhook@archiver.kernel.org>; Wed,  3 Aug 2022 07:42:41 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web09.5925.1659512557169164118
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Aug 2022 00:42:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=FQB2SCz9;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=52140db50b=mingli.yu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 2737UaLO032248
	for <openembedded-devel@lists.openembedded.org>; Wed, 3 Aug 2022 07:42:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=AWpgbJeuJL3S6i0XbRpbetIcR5n+GVzb77oIlHuVcrY=;
 b=FQB2SCz9TkUukyt8dNO3GqcEerMMgUMXEnjAyM4siKrXzw30I50QraLnPkdseSjxb7Nq
 rRb6MAac/Uhg9U6Vfqf12t/1M9Fafg38ZmS0eFm4wj1MdmQlwe+e7PxFKDdAuo1FAmgW
 WCVTjqbUYJ8tHuUAAj2TrSVUEq/VcbB0aUuY9GdFQhIUUjEI2qZT4IEwzW50u6wWBos/
 SPjQXLtQDRsHNWZU3Sv2qK9qYsdWIdxN8mHxfChRwTxyQvHO2zXzWCm/aJbA3UCf+Qly
 V/EXM2XWYrlfspWlYlHplirVF5uAC6UcBE8GwjgIlmGrzN1+Ph/CSbaPXR0i+HwiMkO5 kw==
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com
 [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hqdbvr8es-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Aug 2022 07:42:36 +0000
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 3 Aug 2022 00:42:35 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 3 Aug 2022 00:42:34 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Wed, 3 Aug 2022 00:42:34 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-networking][PATCH] openipmi: Fix buildpaths issue
Date: Wed, 3 Aug 2022 15:42:33 +0800
Message-ID: <20220803074233.3795841-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: ubrQFSPlWOX7wlNkuFjg08QS7vjjUDhL
X-Proofpoint-GUID: ubrQFSPlWOX7wlNkuFjg08QS7vjjUDhL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-03_03,2022-08-02_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 bulkscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 impostorscore=0 mlxscore=0 malwarescore=0 spamscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2208030035
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Aug 2022 07:42:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98107

From: Mingli Yu <mingli.yu@windriver.com>

Fixes:
   WARNING: openipmi-2.0.32-r0 do_package_qa: QA Issue: File /usr/src/debug/openipmi/2.0.32-r0/OpenIPMI-2.0.32/swig/perl/OpenIPMI_wrap.c in package openipmi-src contains reference to TMPDIR [buildpaths]

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta-networking/recipes-support/openipmi/openipmi_2.0.32.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-networking/recipes-support/openipmi/openipmi_2.0.32.bb b/meta-networking/recipes-support/openipmi/openipmi_2.0.32.bb
index c61303b81..8625afaa7 100644
--- a/meta-networking/recipes-support/openipmi/openipmi_2.0.32.bb
+++ b/meta-networking/recipes-support/openipmi/openipmi_2.0.32.bb
@@ -85,6 +85,10 @@ do_configure () {
     done
 }
 
+do_compile:append () {
+    sed -i -e 's#${RECIPE_SYSROOT_NATIVE}##g' ${S}/swig/perl/OpenIPMI_wrap.c
+}
+
 do_install:append () {
     echo "SAL: D = $D"
     echo "SAL: libdir = $libdir"
-- 
2.25.1


