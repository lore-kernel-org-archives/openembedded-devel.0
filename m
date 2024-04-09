Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4F0BC67861
	for <webhook@archiver.kernel.org>; Tue,  9 Apr 2024 20:25:43 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.149409.1712694334102457861
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Apr 2024 13:25:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=QSuW8j8G;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=482968419c=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4394dGxX000614
	for <openembedded-devel@lists.openembedded.org>; Tue, 9 Apr 2024 13:25:33 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PPS06212021; bh=MfkMapr/n/MjlrdBPXCmQyKqzOj5sfxWcqLHk2Vf1ek=; b=
	QSuW8j8GgDVznuqSpXyxkEZ8MAUZ0Jb/o9XUj410s4dt1glnedXy6nWxoaDb/QwE
	9257YlBB3af+G0eH4fSGbdfnCt1xqASlfWKm04S4vYyI92S0Oog5hEJ9p7S4pq8q
	BUmkZAcemKPtepqBnWwKK559mwt8aS5cZDmaKrBTyJJIH8yynroIcUoQAhbTo8IY
	FOB29BsG4Yvh6cyySJdfIcY009yvfAVHSgl6fqlrDNES/ntPAussjwbxGUNp3NRv
	XnDO77C9TG1/SXPhu0hgp2Ksjt8zx7unoixZPxSltueeuho8E1v+cXnX5TVXWNnS
	1GJwC/jegk9n55dJwctImQ==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3xb5wgjtp7-5
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 09 Apr 2024 13:25:33 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Tue, 9 Apr 2024 13:25:32 -0700
Received: from ala-lpggp3.wrs.com (147.11.105.124) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.37 via Frontend Transport; Tue, 9 Apr 2024 13:25:32 -0700
From: <Randy.MacLeod@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH 4/5] postfix: switch SRC_URI to http
Date: Tue, 9 Apr 2024 13:25:30 -0700
Message-ID: <20240409202531.1050101-5-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240409202531.1050101-1-Randy.MacLeod@windriver.com>
References: <20240409202531.1050101-1-Randy.MacLeod@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 2FASsh51AWbrbB7WXxCjv5QqGDIX8m4Z
X-Proofpoint-ORIG-GUID: 2FASsh51AWbrbB7WXxCjv5QqGDIX8m4Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-09_12,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=911
 clxscore=1015 mlxscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2404010003
 definitions=main-2404090137
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Apr 2024 20:25:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109884

From: Randy MacLeod <Randy.MacLeod@windriver.com>

Switch the SRC_URI to http since the postfix site does not yet use https.

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 meta-networking/recipes-daemons/postfix/postfix_3.8.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-daemons/postfix/postfix_3.8.6.bb b/meta-networking/recipes-daemons/postfix/postfix_3.8.6.bb
index 0e433bb51..3ec7f22ad 100644
--- a/meta-networking/recipes-daemons/postfix/postfix_3.8.6.bb
+++ b/meta-networking/recipes-daemons/postfix/postfix_3.8.6.bb
@@ -14,7 +14,7 @@ DEPENDS = "db icu libpcre libnsl2 m4-native openssl postfix-native \
 LICENSE = "IPL-1.0 | EPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b181651ad99a7dc4cc8c4ce2f491ed1a"
 
-SRC_URI = "ftp://ftp.porcupine.org/mirrors/postfix-release/official/postfix-${PV}.tar.gz \
+SRC_URI = "http://ftp.porcupine.org/mirrors/postfix-release/official/postfix-${PV}.tar.gz \
            file://main.cf \
            file://postfix \
            file://internal_recipient \
-- 
2.43.0


