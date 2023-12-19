Return-Path: <meenali.gupta@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAD34C41535
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 03:58:04 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.5050.1702958280418045323
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Dec 2023 19:58:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=VTq/j2Rc;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0717f0ab44=meenali.gupta@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BJ3m3Pw007635
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Dec 2023 03:57:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=grOo+
	hd4TdMjXX3gyS7jhOv6cV/hp9U+XxIp3aAuBuk=; b=VTq/j2RcdDg6YoIZ+8SSG
	DcK/fp2hKgZGZRIdeG1s0NEZQRBXVetM835On9KQbWjzbZEKToRNCMAQX2x7dAHg
	oo3Gc792Po77hRIP65HxiOatE1Kl5klVlWgcnnHj52dBeKyJQsUhUop7RswXQ+WH
	ZX2ygdE2K0O8kLI/Fq/07DE4KEawGp16/TeNma+cIhkkkr4eZZkII5PQbJxXQRi2
	a+v4aWrEwZziZba/ZpiyXInIcBQUZZQvdKxkh9+IQiqXF6jvGXw4yD4BzCnbWpEa
	vvbZ8xKlpdBmFQMbEE/gPCAn5ziVD8Nv+Gt1YMAA4/BwENNDmgDt2iwX2xwW9tG3
	g==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3v12v5tr7w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Dec 2023 03:57:59 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 18 Dec 2023 19:58:02 -0800
From: mgupta1 <meenali.gupta@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-webserver][master][PATCH 1/1] nginx: upgrade 1.25.2 -> 1.25.3
Date: Tue, 19 Dec 2023 03:57:38 +0000
Message-ID: <20231219035738.766942-1-meenali.gupta@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: lAOTlZZcktGDHlgdkOMW1rQaCEb8Mjop
X-Proofpoint-GUID: lAOTlZZcktGDHlgdkOMW1rQaCEb8Mjop
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 suspectscore=0 bulkscore=0 phishscore=0 mlxlogscore=999
 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2311290000 definitions=main-2312190027
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Dec 2023 03:58:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107553

From: Meenali Gupta <meenali.gupta@windriver.com>

Changelog:
===========
https://nginx.org/en/CHANGES

*) Change: improved detection of misbehaving clients when using HTTP/2.

*) Feature: startup speedup when using a large number of locations.
       Thanks to Yusuke Nojima.

*) Bugfix: a segmentation fault might occur in a worker process when
       using HTTP/2 without SSL; the bug had appeared in 1.25.1.

*) Bugfix: the "Status" backend response header line with an empty
       reason phrase was handled incorrectly.

*) Bugfix: memory leak during reconfiguration when using the PCRE2
       library.
       Thanks to ZhenZhong Wu.

*) Bugfixes and improvements in HTTP/3.

Signed-off-by: Meenali Gupta <meenali.gupta@windriver.com>
---
 .../recipes-httpd/nginx/{nginx_1.25.2.bb => nginx_1.25.3.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-httpd/nginx/{nginx_1.25.2.bb => nginx_1.25.3.bb} (51%)

diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.25.2.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.25.3.bb
similarity index 51%
rename from meta-webserver/recipes-httpd/nginx/nginx_1.25.2.bb
rename to meta-webserver/recipes-httpd/nginx/nginx_1.25.3.bb
index 66eef23895..8aa9fa0267 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.25.2.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.25.3.bb
@@ -2,5 +2,5 @@ require nginx.inc
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=79ad2eb837299421c4435dedc8897b3d"
 
-SRC_URI[sha256sum] = "05dd6d9356d66a74e61035f2a42162f8c754c97cf1ba64e7a801ba158d6c0711"
+SRC_URI[sha256sum] = "64c5b975ca287939e828303fa857d22f142b251f17808dfe41733512d9cded86"
 
-- 
2.40.0


