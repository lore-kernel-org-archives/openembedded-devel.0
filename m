Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A55AECAC5A5
	for <webhook@archiver.kernel.org>; Fri, 19 Sep 2025 05:01:24 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.8722.1758258075575616629
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Sep 2025 22:01:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=QCw5ddm8;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=13574f9d0b=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58J4kw3L1628054
	for <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 22:01:15 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=AdwT0gCXI+d/rSaRoBm8
	WRkBzntXJWjJNQcx0gDBvNw=; b=QCw5ddm8AuQM1t2k6AqeoXFQNWUKCmjjxKYc
	QpZNwNEAMMMzf0Jf5dzWb9aLLtyHSItWCf+KHGoWHeK4nFqT9p2a5itS+6GxcpY+
	pCFMhTSv7wPQBui1/BpMLbHF+FhfC6Kx6s/3ZML5KlRRX6v1vEKF/Dk4nfgetG0I
	SACyruPOqUDF4JzZ8RnsSKLFN3EZQrY5aiSmZSY1f0d9wiXW192fb+hK8funhdQR
	x7N1cKuuoy3JmtjSw1j4NMtf1nL7rLqzcJJxNYrwNOYUqPkir2yFYJlU39yL7FNI
	wxdcuWXCY2C0TPG9c1nVJaGcK7LiXqBwzS8fKTi3uBQq22ASTw==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 498vne85b8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 22:01:15 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Thu, 18 Sep 2025 22:01:14 -0700
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.59 via Frontend Transport; Thu, 18 Sep 2025 22:01:13 -0700
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][kirkstone][PATCH 1/1] php:  upgrade 8.1.31 -> 8.1.33
Date: Fri, 19 Sep 2025 10:30:55 +0530
Message-ID: <20250919050055.155824-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=FbM3xI+6 c=1 sm=1 tr=0 ts=68cce39b cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=yJojWOMRYYMA:10 a=67BIL_jfAAAA:8 a=t7CeM3EgAAAA:8 a=V5nMA91hrsDdjGmaTXcA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: tkUyfChAxe7ASh3Swq3q018sYOakDKfT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE5MDA0MiBTYWx0ZWRfX8L5Was3YmBST
 Gi2DnCTyyVzNIcYFNYMldszFtHMYzhtlEhm38J3n3HCS9LPiJrpxEUIbaUEM6IYk5uXIe/FY/yu
 sKl7RIQ9BTb9EC/CO95llUNxzoP+vBc0JYjVusZ+vgdltNK5OawLXihOU5ysiC4TlhRLN5ejzMo
 2XOxuE26vzlc3bLgcMRsU3d30ghoCQw7s+fQzmJ/TDjOXm6Na7sT2GdrciDb6F8fA8ajIn6C6dH
 m8S0GcC6f0kldPky0HbJxHA6SJ9UFNROtiTOZ7OuzhaYikGukMoOqEK6ouli4xrwktftepcpflC
 D/0TidB7tSAbJNGT0ML1MZLVsXmyxahZIgtOce+QFSUF8CHTG4A8Mx/ornp93I=
X-Proofpoint-ORIG-GUID: tkUyfChAxe7ASh3Swq3q018sYOakDKfT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-18_03,2025-09-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0
 spamscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 19 Sep 2025 05:01:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119588

From: Soumya Sambu <soumya.sambu@windriver.com>

Includes fix for CVE-2025-1735, CVE-2025-6491, CVE-2025-1220, CVE-2025-1861,
CVE-2025-1219, CVE-2025-1217, CVE-2025-1734 and CVE-2025-1736.

Changelog:
https://www.php.net/ChangeLog-8.php#8.1.33
https://www.php.net/ChangeLog-8.php#8.1.32

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 meta-oe/recipes-devtools/php/{php_8.1.31.bb => php_8.1.33.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/php/{php_8.1.31.bb => php_8.1.33.bb} (99%)

diff --git a/meta-oe/recipes-devtools/php/php_8.1.31.bb b/meta-oe/recipes-devtools/php/php_8.1.33.bb
similarity index 99%
rename from meta-oe/recipes-devtools/php/php_8.1.31.bb
rename to meta-oe/recipes-devtools/php/php_8.1.33.bb
index 235fec5163..f4928bc3a1 100644
--- a/meta-oe/recipes-devtools/php/php_8.1.31.bb
+++ b/meta-oe/recipes-devtools/php/php_8.1.33.bb
@@ -33,7 +33,7 @@ SRC_URI:append:class-target = " \
           "
 
 S = "${WORKDIR}/php-${PV}"
-SRC_URI[sha256sum] = "0b39828b345151caf1b795d9f4b923c9887231776c33076dfc9d90a44390d0dc"
+SRC_URI[sha256sum] = "b6553451841c1a569865d7fdc83024621ee4434cd8fbfeb0a31588ac9c70685f"
 
 CVE_CHECK_IGNORE += "\
     CVE-2007-2728 \
-- 
2.40.0


