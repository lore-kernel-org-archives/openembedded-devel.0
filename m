Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7592DC001DB
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 13:42:56 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.17373.1691674974476092702
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Aug 2023 06:42:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=agLImmiy;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7586d6bc71=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37AAcxWZ028857
	for <openembedded-devel@lists.openembedded.org>; Thu, 10 Aug 2023 06:42:54 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=hOP7+
	6n9Rauv+JoBYQjT8GCdHlLQ2BYr8sVGyqUyTZU=; b=agLImmiy9xXnuQF+G4/C3
	mPvAuF4BAC9vHI5ZjPv8tUI1Gq7hmevqLV0SOqcGENlwn1l78o8sqhEiIUhFWXsO
	XA8PNzOqRScBMZ71sJQnb+GRG508Lu4ottBbl0/NrWA6XTcpkjo85w6dHdf3dIsj
	e4/WHrgPuaxgMX9QpytNJtVl2GFhRkWV1i6SyU07sx188tsH5ypYABzsjzIJZJ70
	TwXcF/t0PApJSxQWc2ngk13vdvWAWR02nna2QICLLUlI88zm3UsAl7KkiYIDyybt
	S7T/wnf0TXkQ+evQsqATt35USVMRNkgefqcCuclQF71OE1jgZJFrgULM3K92SFRM
	Q==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3s9hq0cr3y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 10 Aug 2023 06:42:54 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 10 Aug 2023 06:42:52 -0700
From: Archana Polampalli <archana.polampalli@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <Hari.GPillai@windriver.com>
Subject: [oe][meta-oe][kirkstone][PATCH 1/1] nodejs: upgrade 16.20.1 -> 16.20.2
Date: Thu, 10 Aug 2023 13:42:24 +0000
Message-ID: <20230810134224.3858772-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: hzpC6RBfpZlUFKfSI6cyjn8PhzVXTuej
X-Proofpoint-GUID: hzpC6RBfpZlUFKfSI6cyjn8PhzVXTuej
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-10_10,2023-08-10_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 impostorscore=0 spamscore=0 clxscore=1015 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 bulkscore=0 mlxlogscore=865 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2306200000
 definitions=main-2308100116
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Aug 2023 13:42:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104318

This release contains bug fixes only.
The following CVEs have been addressed:

CVE-2023-32002
CVE-2023-32006
CVE-2023-32559

$ git log --oneline v16.20.1..v16.20.2
dadbde963f (tag: v16.20.2) 2023-08-09, Version 16.20.2 'Gallium' (LTS)
d8ccfe9ad4 policy: handle Module.constructor and main.extensions bypass
242aaa0caa policy: disable process.binding() when enabled
40c3958a5a  deps: update archs files for OpenSSL-1.1.1v
a9ac9da89a deps: fix openssl crypto clean
362d4c7494 deps: upgrade openssl sources to OpenSSL_1_1_1v
7447de2794 Working on v16.20.2

https://github.com/nodejs/node/releases/tag/v16.20.2

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../nodejs/{nodejs_16.20.1.bb => nodejs_16.20.2.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_16.20.1.bb => nodejs_16.20.2.bb} (98%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_16.20.1.bb b/meta-oe/recipes-devtools/nodejs/nodejs_16.20.2.bb
similarity index 98%
rename from meta-oe/recipes-devtools/nodejs/nodejs_16.20.1.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_16.20.2.bb
index fe59854d5..4761bfb14 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_16.20.1.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_16.20.2.bb
@@ -36,7 +36,7 @@ SRC_URI:append:toolchain-clang:x86 = " \
 SRC_URI:append:toolchain-clang:powerpc64le = " \
            file://0001-ppc64-Do-not-use-mminimal-toc-with-clang.patch \
            "
-SRC_URI[sha256sum] = "83e03381e271f1a5619188e7aea9d85d9b7e12f5be2a28ceb78d7249ed22b7f1"
+SRC_URI[sha256sum] = "576f1a03c455e491a8d132b587eb6b3b84651fc8974bb3638433dd44d22c8f49"
 
 S = "${WORKDIR}/node-v${PV}"
 
-- 
2.40.0


