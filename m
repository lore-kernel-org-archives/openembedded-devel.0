Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A440DF8DFCB
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 21:30:04 +0000 (UTC)
Received: from mx0b-000eb902.pphosted.com (mx0b-000eb902.pphosted.com [205.220.177.212])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27003.1776374762988428786
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Apr 2026 14:26:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@garmin.com header.s=pps1 header.b=TUUOyp9/;
 dkim=pass header.i=@garmin.com header.s=selector2 header.b=OmBA3jnk;
 spf=pass (domain: garmin.com, ip: 205.220.177.212, mailfrom: prvs=9566ee895a=colin.mcallister@garmin.com)
Received: from pps.filterd (m0220299.ppops.net [127.0.0.1])
	by mx0a-000eb902.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63GL43sO3917857;
	Thu, 16 Apr 2026 16:26:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps1; bh=R/CjASIJnVImqpiZvbtetvrpbdV
	hFVSCi8mf7+ewyyc=; b=TUUOyp9/AEEjtnfKadso2tnI7UTxqMc4rn9W4yme+tg
	PZc8URi11INnQlTjpDwePQtSdcb+6Syz/eYHS85M1W9tDE8TpPhdgsL4pINKuxBX
	l1Rz+keHnH487q4jkRqa3qcQOVN9De6XwYhyJ03ICgNlnj97StFq8qEvkNJItl1K
	oL9vvJ4eIm2QKPR5ZSztJLGE0Lq6atxNKYN9C8ysI8SZAPMQ8HQu5Nx0Dablao2C
	bnHZdbfx4rr37tWpVntho6t8zJBrTgArN8ieaEddR1Q/42S9bNCH3AQqLEeM+U2j
	MulncChUdRhfhlWy8YIb6DAkDdmYS4lTTXa3FIOSLKw==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11021093.outbound.protection.outlook.com [40.107.208.93])
	by mx0a-000eb902.pphosted.com (PPS) with ESMTPS id 4djw8hscke-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 16 Apr 2026 16:26:01 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hWNlCFhcqBIHlAOJWRfcasy+DjnqQZCFZuzH+K46laSK/4zUXW694+Q78Ngyn8QuLYarE/01Xlhen7OUSDuAemvaBV5Miyjbp2LYbeDPq1E8rmO8J4IExbizA6isyfKmPlvavC0XJfROAk3NmdXl9y8WWC6DSMJ2VUj2K4/jICSgI0gE5uBOvKWHM5S+Yl9diSVkK2ALJ5ypbcJEpY/mqWsaLkb/eMg0bA7Qk+ZmZLQ2AEPf8InUb/+ju5ZYF8sxA7oUZlcxElGV7rbjKA+qkBT5paYOiDO1pKwQcAUJJ69UwEEkmaTAxcLGOiS+YY6iB0whyxFfTqbbNwbT3rxlxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R/CjASIJnVImqpiZvbtetvrpbdVhFVSCi8mf7+ewyyc=;
 b=y1q4Ek9VtC64fPo93bX8aUwKgplTLSTmCOuLheOSU9zMwlaA1r70gt6LOa5eCJI0JOlUw5zpN47nYTrUWiX0yGQGdQn1YZJYYSesL284SkEeirkSC5fbhoklBD0L63WMXhg0gdfXD52V6JFVorwuAJvAgHrLevro48men2wDGwrXK2lzdshUY62ewoG9qogMFbdqttZ/zkRvCWTUza+IHpEWXj168PAKc87A3NdLXOimUplagv4kn4CrSVv5TrNqMTCvVhDwvPhwYN2BFyyRKCjotKtxERDHlShTR8K3N78iFzwQr9mMFyoix6Iufv9cMc5sJm6ZzOrUiml+zGcwcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 204.77.163.244) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=garmin.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=garmin.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R/CjASIJnVImqpiZvbtetvrpbdVhFVSCi8mf7+ewyyc=;
 b=OmBA3jnk6F2Fs0/1YUm9y/DuXoO42ofup0zl8ZchgZpR3V0MmA3shMEEQFANTOvAK1oJWxEHe209W+rlMB1GtX6eebL+tmfxdZRhnEcdEwK2whgobldSOiEZI727Ad20aoUbM0Da7MI0yYD94oVZWu27X3FQTq18Yjf4KRr+eAqqt7Rq0QP7EM/m0fvnYK7zxF8Y11LjyqRGMfO0isI2kogFPNqypkb6FMgk0cxT4twwlyNpHAKqvOTwm14+nBHnuUm8nDDEq/HUqyhULSv/hoGJlx60HJOwZN+oP5SA9WTVaJevM4cXhXQ5klnKyIBaCSJABhr4pWP65RdTtO6YNA==
Received: from CH5PR05CA0008.namprd05.prod.outlook.com (2603:10b6:610:1f0::17)
 by BN8PR04MB6401.namprd04.prod.outlook.com (2603:10b6:408:78::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Thu, 16 Apr
 2026 21:25:57 +0000
Received: from CH3PEPF00000017.namprd21.prod.outlook.com
 (2603:10b6:610:1f0:cafe::d2) by CH5PR05CA0008.outlook.office365.com
 (2603:10b6:610:1f0::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.52 via Frontend Transport; Thu,
 16 Apr 2026 21:25:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 204.77.163.244)
 smtp.mailfrom=garmin.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=garmin.com;
Received-SPF: Pass (protection.outlook.com: domain of garmin.com designates
 204.77.163.244 as permitted sender) receiver=protection.outlook.com;
 client-ip=204.77.163.244; helo=edgetransport.garmin.com; pr=C
Received: from edgetransport.garmin.com (204.77.163.244) by
 CH3PEPF00000017.mail.protection.outlook.com (10.167.244.122) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.0 via Frontend Transport; Thu, 16 Apr 2026 21:25:57 +0000
Received: from KC3WPA-EXSE04.ad.garmin.com (10.65.32.87) by cv1wpa-edge1
 (10.60.4.252) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 16 Apr
 2026 16:26:10 -0500
Received: from KC3WPA-EXSE02.ad.garmin.com (10.65.32.85) by
 KC3WPA-EXSE04.ad.garmin.com (10.65.32.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.17; Thu, 16 Apr 2026 14:25:55 -0700
Received: from ola-jnrkg73.ad.garmin.com (10.5.209.17) by smtp.garmin.com
 (10.65.32.85) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 16 Apr 2026 16:25:55 -0500
From: "Colin McAllister" <colin.mcallister@garmin.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Gyorgy Sarvari <skandigraun@gmail.com>, Khem Raj <raj.khem@gmail.com>,
        Colin Pinnell McAllister <colin.mcallister@garmin.com>
Subject: [meta-webserver][scarthgap][PATCH] nginx: set CVE_PRODUCT
Date: Thu, 16 Apr 2026 16:25:48 -0500
Message-ID: <20260416212548.3560824-1-colin.mcallister@garmin.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000017:EE_|BN8PR04MB6401:EE_
X-MS-Office365-Filtering-Correlation-Id: c25aec6d-ed63-4f8b-52c6-08de9bfebfbf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|376014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	DLF9qp+AVoCp70SrUWGVuK90W8tpSEcGQIBc6gGuujVZXxgsy3RRim0W0cKULwwodT5g2tAh3JPo2X4xhaAqlHa17ZlamEAh+84lr3d2KbKZGwUhgipEtNSw9ATT1vrDgnl3NFO6IRWPGW0RPg3jKdC3PM9a3M86FKN4kXhmbtmjyRBXxjjj7Mk/G3tKJfMydg28jbn/RdXaNMdXyV8YMmBQcLSdB5WAG6un/ZRTDp8GDQfDrhlDMawn37jZC574o/1JnEeW4pF1TCvOsdgkxaSJ4BR9tv/hgRujgm2e5gdCNBm/2okRG6Ltq2uKs3H2zZlfhQkZgorCwdRm/kZBKFb1xafqNjcRKJLPzcOuNWNS6S2PQTp8L7SN4tPeX8926BQ0Mj8UKGhZxsKK7n7/OaPo4hw+uoVr7fptB3V9wxFrHdmzyTdkA6G1tg+zamrmY+HO2aPqwRjehe1nDZxeJmvwdAhfFcTh6Y9F9QZY1D2DY0bcmE+l7nai57+ZhA0duh+rCl+hfiy+x7xnjBY3AuJD57vJAR55A6DJXEmMm5JkGeSiu4L4aSKJ5CXmyPmvuSgWPHGgUS7KvOU2AiR84PVgmuONeRd5Cqo82Ht8tvf75rPccTjmlsZ/QGSc+yHo1nTautDJyGwlscV3c63VpMtbhdSi+9NwAUW3Jk0AVWLQYirzzMPUWvBU4F9KlG5IfwfwvF3H5Its4PvD0v08gLyHmsKw4vxQXA6YO5X7Uka8Q0s7UhVc5tr/9LWfwdkqzf3A5RuGbU1euqZ5XWNqMA==
X-Forefront-Antispam-Report: 
	CIP:204.77.163.244;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:edgetransport.garmin.com;PTR:extedge.garmin.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(376014)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	ra29bPb/oySo716Pj3Fbj+di0kgX5u/A+yKt98Q5fW74Hsm4KmRz7fjvTiX+UtyJ9JECglPlsidXOZ+311x07DrjPPJv2AveoOyp703rjOVUElsnmpqKi+nDy5FdKfIB4xoLs7Q7ZhfluwfcovY088to6YmW5MZi1hEUjzLhClQMXkM+nipN3nW5EnkLf35ruMSLZ42/orMVaEtIK13h9g3oBd5N01JQwuxkzLkFznqzxRpGi0pxPbztHUakKYELfXQN5uIp5/5o1hw+20v2ntSAh+c7aW0uR0QjwHey1kjfgbPHH58Cw84F2j2MDbD1skwZnyZXVppmQPd/ZZSvR1B7xjuWKRSiWOMEbBfk7HBn6i9oWw1Dfapu1SQUpCkjurB38arAEDAHcRZHUbRPvPlGiT49bYIfwwOioTt1kHnD2DhetIp1V5dZy1HEjT0P
X-Exchange-RoutingPolicyChecked: 
	wglP0EXz09SNwkDw1U6eaDWmXRAmy67hLjG+9OxUIg3TxnCsaBZ67oUR1vScM0im7vv8txGVP838tkeoH7ngSAx0TtEcSVAa0SWIlU2brXB0HgZIrWaYBDdPQNYU8E9vIeu97dvx+T/XgWuveReEdxmFwbGDmp5hd2uR6uAJAsIZMgaGtcbJ/+MC9QspEb8y5l88CCGAgAuKCAdzArEf+QmuOwm2YD6k4QFve5WGHvd+DeQGF7zBkmGBDS+C1FHiiU2AEgSbiK48VfYvBLlsOCPPnb+HGIXy43nVc0jZWBNTiupDPrBzLIavFuUr0/wel4nu4xVCOPXFGYiIO7apVg==
X-OriginatorOrg: garmin.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2026 21:25:57.3224
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c25aec6d-ed63-4f8b-52c6-08de9bfebfbf
X-MS-Exchange-CrossTenant-Id: 38d0d425-ba52-4c0a-a03e-2a65c8e82e2d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38d0d425-ba52-4c0a-a03e-2a65c8e82e2d;Ip=[204.77.163.244];Helo=[edgetransport.garmin.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH3PEPF00000017.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR04MB6401
X-Proofpoint-ORIG-GUID: QwIqmeiIBj4AHZYxhcNiOAecakP7SR0X
X-Proofpoint-GUID: QwIqmeiIBj4AHZYxhcNiOAecakP7SR0X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDIwMiBTYWx0ZWRfX/vBA5Es8DWTF
 7wdC26gRlzt2Kr42tCS2aBF9FsUbHU//sMet3a5Ezu3v2reIXWD/dN1GD0pOtFVXf3Uh1arBoCf
 EH9iPjk5mnzXavP25FC5h2a0j0Eg2ovjHpenfF6/HBSug29nyTZztDf92Fu+qjp4qWmL4O54PQV
 L8XSaM2OvicPRSYxMoZxqhzznmTKeoWOs6JpolKF4i8Ol5+NOYPPDOavuTiOGjETt0DmQhyi2uj
 Wf1rUxMtnHTgaPtkiWarvxdoxUsZwFt4455Eq2TylfN27cHVEYMpG3QXael8zehA1SdqFDRKZO+
 Goq6JpPQN3u+Ih1rm2mY44hR5fI0JTIBbcdXCfCvgFDKJr6RFr0gvwmAGvvJuIbjExQ9gpc7067
 Zsg42WA3oR0vg7edTOcwFO5gbYVRit9RoPce2P91S/OziN4hSvCgVXPE5DrmrLI8jAPidvudYJ3
 c5ZYRyib20WMF4zgCL1suKV6aXp68ja4hW/Pc1Fg=
X-Authority-Analysis: v=2.4 cv=GZAnWwXL c=1 sm=1 tr=0 ts=69e153e9 cx=c_pps
 a=fLTejda39blwXVQ+ySBHCg==:117 a=YA0UzX50FYCGjWi3QxTvkg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=A5OVakUREuEA:10 a=qm69fr9Wx_0A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=mT958ORwFhrKhj1UMJhN:22 a=YfTmIFYy1-V6Nr2o1wUd:22
 a=pGLkceISAAAA:8 a=NbHB2C0EAAAA:8 a=zckbM_QPzA4zu9iQjgAA:9 cc=ntf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_03,2026-04-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 malwarescore=0 clxscore=1011 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc=notification route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604160202
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Apr 2026 21:30:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126416

From: Gyorgy Sarvari <skandigraun@gmail.com>

nginx has a long history, and has used multiple CPEs
over time. Set CVE_PRODUCT to reflect current and historic
vendor:product pairs.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit d25aadbbb53d54382b4b82b1f78a69d4d117fd28)
Signed-off-by: Colin Pinnell McAllister <colin.mcallister@garmin.com>
---
 meta-webserver/recipes-httpd/nginx/nginx.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-webserver/recipes-httpd/nginx/nginx.inc b/meta-webserver/recipes-httpd/nginx/nginx.inc
index 865d7f86ee..36f0bbcd10 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx.inc
+++ b/meta-webserver/recipes-httpd/nginx/nginx.inc
@@ -192,3 +192,5 @@ USERADD_PARAM:${PN} = " \
     --groups www-data \
     --shell ${base_sbindir}/nologin \
     --user-group ${NGINX_USER}"
+
+CVE_PRODUCT = "nginx:nginx f5:nginx_open_source f5:nginx"
-- 
2.53.0


