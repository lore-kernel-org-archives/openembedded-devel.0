Return-Path: <meenali.gupta@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B340C4332F
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 10:38:47 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.19156.1702550317827577355
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Dec 2023 02:38:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=MuIS4Avw;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0712052319=meenali.gupta@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BE8TJMh014046
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 10:38:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=grOo+
	hd4TdMjXX3gyS7jhOv6cV/hp9U+XxIp3aAuBuk=; b=MuIS4Avw6dSTUG6+jioNX
	Is7cRN8YsixaoFhiP2m6JG4co2vPhFqDnoP1Mh9PP5RvtYPLTyTydVuPTVqMh9wR
	HTkF7uiv99lI1Xlg7u52alsW6/Lo7VEvvyFMtTnppAQhZVzHw/mwuC4gPP+ydL/9
	p+ziM/Eb7+6A/HkaHjPtY+irYfpDQVEqZaNt4NzlB4jhSlmryMrNgWItwiTJSc/U
	91vjzQRO6KI44qgvDkI8aO4ubOrklKNpv3azkOLDeHgOmU7ZdPOdnO10L0ChvReG
	23ysWa3lPz3GGNc0HyCDcxnfwJf2OF4L6Rsm4RsYz9Nf/Zc07HtnZXHTXT1t63Gd
	Q==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3uyr7fgb74-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 10:38:36 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Dec 2023 02:38:39 -0800
From: mgupta1 <meenali.gupta@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-webserver][kirkstone][PATCH 1/1] nginx: upgrade 1.25.2 -> 1.25.3
Date: Thu, 14 Dec 2023 10:38:12 +0000
Message-ID: <20231214103812.512113-1-meenali.gupta@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: mvypbbXFG6lhnYXVgvF3e2P99pvZ5EHT
X-Proofpoint-GUID: mvypbbXFG6lhnYXVgvF3e2P99pvZ5EHT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 adultscore=0 clxscore=1011 priorityscore=1501 mlxlogscore=999
 suspectscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312140071
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 10:38:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107451

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


