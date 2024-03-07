Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F1A3C54E49
	for <webhook@archiver.kernel.org>; Thu,  7 Mar 2024 09:21:39 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.19344.1709803292482895425
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Mar 2024 01:21:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=lA1WmtC5;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=379634391c=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4276Su70018526
	for <openembedded-devel@lists.openembedded.org>; Thu, 7 Mar 2024 01:21:32 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=vZfl0
	eCCE9Atr0zOj8yIrlCeagtJI27WHFsxstQOKhc=; b=lA1WmtC5m2aGrauF95DGw
	CIGjCdNguhaCIiFH0YjkzCwY/O7lHQzjThGjokxOwR/Cl2sdg0VXQzGVoWbpEGkM
	bxSqja1BrP3ZgqWBkxk23qSFjFhBWbMS9D2+Rv1Xkyr8ADGfYqvFj7QFb6hYJDoM
	30nq+ePT1awu1/UgPqUf7SmHwjXAGEZImWSF7ws6TrjKrG9BoeLcicQPtMwZ7ODU
	Ht65Arjh6JFVuc2o04vJpucRvzMJVXZ+hU2nqXylm8DE/GhK6zFkDRmSvB4VK8JF
	WpmizTRubyfrWQnMgwL0s7kC6N4IJQx3lF7KRWaahkR2q/r1mBAMXT72k1mpWuTk
	A==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wm093vs88-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 07 Mar 2024 01:21:31 -0800 (PST)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Mar 2024 01:21:29 -0800
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][kirkstone][PATCH 1/1] openvpn: ignore CVE-2023-7235
Date: Thu, 7 Mar 2024 09:21:13 +0000
Message-ID: <20240307092113.3674886-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: jQ8llsUq8S6rMU1BCfXXSBkLvhsk5FBk
X-Proofpoint-ORIG-GUID: jQ8llsUq8S6rMU1BCfXXSBkLvhsk5FBk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-07_05,2024-03-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1011 adultscore=0
 mlxlogscore=509 mlxscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403070067
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Mar 2024 09:21:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109193

From: Soumya Sambu <soumya.sambu@windriver.com>

This CVE is related to OpenVPN 2.x GUI on Windows.

References:
https://community.openvpn.net/openvpn/wiki/CVE-2023-7235
https://security-tracker.debian.org/tracker/CVE-2023-7235

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 meta-networking/recipes-support/openvpn/openvpn_2.5.6.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.5.6.bb b/meta-networking/recipes-support/openvpn/openvpn_2.5.6.bb
index 218e72b7a..828cd5033 100644
--- a/meta-networking/recipes-support/openvpn/openvpn_2.5.6.bb
+++ b/meta-networking/recipes-support/openvpn/openvpn_2.5.6.bb
@@ -19,6 +19,9 @@ SRC_URI[sha256sum] = "333a7ef3d5b317968aca2c77bdc29aa7c6d6bb3316eb3f79743b59c532
 # CVE-2020-7224 and CVE-2020-27569 are for Aviatrix OpenVPN client, not for openvpn.
 CVE_CHECK_IGNORE += "CVE-2020-7224 CVE-2020-27569"
 
+# CVE-2023-7235 is specific to Windows platform
+CVE_CHECK_IGNORE += "CVE-2023-7235"
+
 SYSTEMD_SERVICE:${PN} += "openvpn@loopback-server.service openvpn@loopback-client.service"
 SYSTEMD_AUTO_ENABLE = "disable"
 
-- 
2.40.0


