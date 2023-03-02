Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34258C678D4
	for <webhook@archiver.kernel.org>; Thu,  2 Mar 2023 00:24:36 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.2622.1677716669470906338
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Mar 2023 16:24:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=WBM4nPs9;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=24254468ab=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3220JhBd018036
	for <openembedded-devel@lists.openembedded.org>; Thu, 2 Mar 2023 00:24:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=bLpXrSSLf039xjktmsh8GbeodBapKppdac221lFsZd4=;
 b=WBM4nPs9YGkEh8fkh4ue6EWujzK5m+SwTdLkoijWp3pOpm0J57Re2CL6bT7XUvppTZEk
 F5V5mDm1etSc2geuvzJUy+EWcOi7aN5MyeFTFgaYsP6OIUye0yTR3BZ2oINWHfyXM9AV
 BvDU/S24nTlPdXDpejDIjgpj4NW7iaZdP1cEHWsL+7KbfVIg9E/dcVUOf+V8j0hr6MnA
 u3yq5hBWf33qVAvegvYLc/Mc39wJ47qsfzd+yPsAAGLXj2tXPITcyPpj8gdI3LUMOSb6
 tq7eQVfBuPCn8ti+lkIZx9iHDY/WJrGB7i8Sveumpwrvk/rroP4fgfERdEmpAlPTzAtn jQ== 
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nybmkcvhb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 02 Mar 2023 00:24:28 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.18; Wed, 1 Mar 2023 16:24:27 -0800
Received: from ala-lpggp3.wrs.com (147.11.105.124) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.17 via Frontend Transport; Wed, 1 Mar 2023 16:24:27 -0800
From: Randy MacLeod <Randy.MacLeod@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH 1/3] rsyslog: update from 8.2212.0 to 8.2302.0
Date: Wed, 1 Mar 2023 16:24:25 -0800
Message-ID: <20230302002427.1935420-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: aGvw0yZXHI_fVZjBm72nCO2PyezfA_9U
X-Proofpoint-ORIG-GUID: aGvw0yZXHI_fVZjBm72nCO2PyezfA_9U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-01_16,2023-03-01_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 suspectscore=0 phishscore=0 mlxscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=861 clxscore=1011 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303010194
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Mar 2023 00:24:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101318

ptest results for qemux86-64/kvm with extra FS space and 2 GB RAM:

   Version | Passed | Failed | Skipped
    8.2212 | 470    |      0 |       5
    8.2302 | 471    |      0 |       5

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 .../rsyslog/{rsyslog_8.2212.0.bb => rsyslog_8.2302.0.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/rsyslog/{rsyslog_8.2212.0.bb => rsyslog_8.2302.0.bb} (98%)

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2212.0.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2302.0.bb
similarity index 98%
rename from meta-oe/recipes-extended/rsyslog/rsyslog_8.2212.0.bb
rename to meta-oe/recipes-extended/rsyslog/rsyslog_8.2302.0.bb
index ed65bed0d..727e23111 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2212.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2302.0.bb
@@ -31,7 +31,7 @@ SRC_URI:append:libc-musl = " \
     file://0001-Include-sys-time-h.patch \
 "
 
-SRC_URI[sha256sum] = "53b59a872e3dc7384cdc149abe9744916776f7057d905f3df6722d2eb1b04f35"
+SRC_URI[sha256sum] = "25415f85b662615ce3c83077d53758029e8743cb5929044bfd3564e3d626a3b9"
 
 UPSTREAM_CHECK_URI = "https://github.com/rsyslog/rsyslog/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
-- 
2.39.0


