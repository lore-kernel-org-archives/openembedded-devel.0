Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E398BD116F7
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 07:05:37 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15822.1764572729778088574
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Nov 2025 23:05:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=phxougPQ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4430a8f5e9=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B148rJU1875474
	for <openembedded-devel@lists.openembedded.org>; Mon, 1 Dec 2025 07:05:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=wCu6HSoYmCBpvpWywUQ1wnITUtwytYVbhDGKM5QGWY8=; b=phxougPQIf0Z
	226bQFmofJfflky9pGkj7gEosm/YJpM2N+eZQeoVDhKaLJNLafCd9OXquxrnmGi1
	AEM9/2nGfRS2mKQXvVUotIPS0mnMGTnwMhnIfWN6vdq7NBGVKHoxMTFNe9BN1iOV
	jWHreb6TZ64iAcjJxubOxpa+gfxQezkqNQLG0iXdSwgrSNY+M9sYg7g8uxIMGOGX
	+jKwwtNi7AX3LtKPxb2fDfHfOmhFpA7LmhGHTsFfJ2eqXucDtKcphhCsAJXV7erl
	Ptt+hPn+3oCaf+ufLEXu7hzZqa+N5LiHPj/dequG+vaeKK5AW9EeFoPLKNLozMjk
	p6pmmt0ylw==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aqqt69gv2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 01 Dec 2025 07:05:28 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Sun, 30 Nov 2025 23:05:27 -0800
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Sun, 30 Nov 2025 23:05:27 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-webserver][PATCH 2/3] nginx: switch to libpcre2
Date: Mon, 1 Dec 2025 15:05:24 +0800
Message-ID: <20251201070525.362494-2-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251201070525.362494-1-hongxu.jia@windriver.com>
References: <20251201070525.362494-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDA1NiBTYWx0ZWRfXzQug+m0cB2+a
 ArUF9nDm79yszqicnHRygDkSpWBOM+1pcYRFz5m4NBf4KKUyN+pQcMYTlZ5srXB68gG9eg5vdcZ
 0DcEBkgRaGaqqqshLen3TMksgisPB5+inlriAuFkRYttsSUqguNGeEbD6J3CA8S18qog64a5e26
 IAeBurmDZYYKvbgfeKTn+ymp885tb1g5f8L2UK67Sz/3LGy/eDfMp0YBg0OqEQqJsySMQgIcWQY
 dRMtONcN8enmoVkw6BxZ7g06JfLJjnxL33R44sH80gxzeOsxZ8DP41BrADHqQsDmWXYT64Z9qTL
 kTvinVRVo33L/EtmGgytpNOofUbycSB50UX2YtqPaoLppZzO9yZ4H8iRQGa5IUIM0MSU+TWBDan
 oZ0jXGWIIkkSmC8eDuI+nrajvdC83g==
X-Authority-Analysis: v=2.4 cv=Adq83nXG c=1 sm=1 tr=0 ts=692d3e38 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=9bLDTSi9AAAA:8
 a=t7CeM3EgAAAA:8 a=VteioWwYJ0tla0BSxdAA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: ZXXYO69i_642vuznTdAaSNuPgwrVxmQv
X-Proofpoint-GUID: ZXXYO69i_642vuznTdAaSNuPgwrVxmQv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512010056
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Dec 2025 07:05:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122194

NGINX 1.22 and later supports PCRE2 [1]

[1] https://github.com/nginx/nginx/commit/c6fec0b027569a4e0b1d8aaee7dea0f2e4d6052b

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-webserver/recipes-httpd/nginx/nginx.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-webserver/recipes-httpd/nginx/nginx.inc b/meta-webserver/recipes-httpd/nginx/nginx.inc
index bcc384bd8a..fe23eb397b 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx.inc
+++ b/meta-webserver/recipes-httpd/nginx/nginx.inc
@@ -9,7 +9,7 @@ LICENSE = "BSD-2-Clause"
 
 SECTION = "net"
 
-DEPENDS = "libpcre zlib"
+DEPENDS = "libpcre2 zlib"
 
 SRC_URI = " \
     http://nginx.org/download/nginx-${PV}.tar.gz \
-- 
2.34.1


